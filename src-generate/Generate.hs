{-# LANGUAGE TemplateHaskell, OverloadedStrings, ViewPatterns, DeriveFunctor #-}
module Generate where

import Control.Arrow
import Control.Lens
import Control.Lens.TH
import Control.Monad

import Data.HashMap.Lazy (HashMap)
import qualified Data.HashMap.Lazy as HM
import Data.Map (Map)
import qualified Data.Map as M
import Data.Monoid
import Data.Set (Set)
import qualified Data.Set as S
import qualified Data.Vector as V
import qualified Data.Text as T

import Text.Casing

import Foreign
import Foreign.C

import Language.Haskell.TH

import qualified Spec as S 

import qualified Types as C

-- a simple type corresponds to a 1:1 haskell type
-- a c shim type can't be represented by the haskell FFI, so it needs to be shimmed
data TypeResult a
  = SimpleType a
  | EnumType a
  | CShimType a
  deriving (Show, Eq, Ord, Functor)

makePrisms ''TypeResult

unTypeResult :: TypeResult a -> a
unTypeResult (SimpleType a) = a
unTypeResult (EnumType a) = a
unTypeResult (CShimType a) = a

fromThName :: Name -> Type
fromThName = ConT

-- from inline-c
baseTypesTable :: Map C.TypeSpecifier Type
baseTypesTable = M.fromList
  [ (C.Void, TupleT 0)
  -- Types from Foreign.C.Types in the order in which they are presented there,
  -- along with its documentation's section headers.
  -- Integral types
  , (C.Char Nothing, fromThName ''CChar)
  , (C.Char (Just C.Signed), fromThName ''CSChar)
  , (C.Char (Just C.Unsigned), fromThName ''CUChar)
  , (C.Short C.Signed, fromThName ''CShort)
  , (C.Short C.Unsigned, fromThName ''CUShort)
  , (C.Int C.Signed, fromThName ''CInt)
  , (C.Int C.Unsigned, fromThName ''CUInt)
  , (C.Long C.Signed, fromThName ''CLong)
  , (C.Long C.Unsigned, fromThName ''CULong)
  , (C.TypeName "ptrdiff_t", fromThName ''CPtrdiff)
  , (C.TypeName "size_t", fromThName ''CSize)
  , (C.TypeName "wchar_t", fromThName ''CWchar)
  , (C.TypeName "sig_atomic_t", fromThName ''CSigAtomic)
  , (C.LLong C.Signed, fromThName ''CLLong)
  , (C.LLong C.Unsigned, fromThName ''CULLong)
  , (C.TypeName "intptr_t", fromThName ''CIntPtr)
  , (C.TypeName "uintptr_t", fromThName ''CUIntPtr)
  , (C.TypeName "intmax_t", fromThName ''CIntMax)
  , (C.TypeName "uintmax_t", fromThName ''CUIntMax)
  -- Numeric types
  , (C.TypeName "clock_t", fromThName ''CClock)
  , (C.TypeName "time_t", fromThName ''CTime)
  , (C.TypeName "useconds_t", fromThName ''CUSeconds)
  , (C.TypeName "suseconds_t", fromThName ''CSUSeconds)
  -- Floating types
  , (C.Float, fromThName ''CFloat)
  , (C.Double, fromThName ''CDouble)
  -- Other types
  , (C.TypeName "FILE", fromThName ''CFile)
  , (C.TypeName "fpos_t", fromThName ''CFpos)
  , (C.TypeName "jmp_buf", fromThName ''CJmpBuf)
  -- Types from stdint.h that can be statically mapped to their Haskell
  -- equivalents. Excludes int_fast*_t and int_least*_t and the corresponding
  -- unsigned types, since their sizes are platform-specific.
  , (C.TypeName "int8_t", fromThName ''Int8)
  , (C.TypeName "int16_t", fromThName ''Int16)
  , (C.TypeName "int32_t", fromThName ''Int32)
  , (C.TypeName "int64_t", fromThName ''Int64)
  , (C.TypeName "uint8_t", fromThName ''Word8)
  , (C.TypeName "uint16_t", fromThName ''Word16)
  , (C.TypeName "uint32_t", fromThName ''Word32)
  , (C.TypeName "uint64_t", fromThName ''Word64)
  ]

godotOpaqueStructs :: [C.Identifier]
godotOpaqueStructs =
  [ "godot_aabb"
  , "godot_array"
  , "godot_basis"
  , "godot_char_string"
  , "godot_color"
  , "godot_dictionary"
  , "godot_method_bind"
  , "godot_node_path"
  , "godot_plane"
  , "godot_pool_array_read_access"
  , "godot_pool_array_write_access"
  , "godot_pool_byte_array"
  , "godot_pool_color_array"
  , "godot_pool_int_array"
  , "godot_pool_real_array"
  , "godot_pool_string_array"
  , "godot_pool_vector2_array"
  , "godot_pool_vector3_array"
  , "godot_quat"
  , "godot_rect2"
  , "godot_rid"
  , "godot_string"
  , "godot_string_name"
  , "godot_transform"
  , "godot_transform2d"
  , "godot_variant"
  , "godot_vector2"
  , "godot_vector3" ]

godotEnums :: [C.Identifier]
godotEnums =
  [ "godot_error"
  , "godot_variant_type"
  , "godot_variant_call_error_error"
  , "godot_vector3_axis" ]

enumTypesTable :: Map C.TypeSpecifier Type
enumTypesTable = M.fromList $ map (\n -> (C.TypeName n, fromThName ''CInt)) godotEnums


-- this is the core C type -> HS mapping
resolveType :: C.Type -> TypeResult Type
resolveType (C.TypeSpecifier _ (lookupBase -> Just ty)) = SimpleType $ ty
resolveType (C.TypeSpecifier _ (lookupEnum -> Just ty)) = EnumType $ ty
resolveType (C.TypeSpecifier _ (C.TypeName ident)) = con $ ConT $ fromCIdent ident
  where
    con | isOpaqueStruct ident = CShimType
        | otherwise = SimpleType
resolveType (C.Ptr _ (C.TypeSpecifier _ (C.TypeName ident))) | isOpaqueStruct ident = SimpleType $ ConT $ fromCIdent ident
resolveType (C.Ptr _ ty) = AppT (ConT ''Ptr) <$> resolveType ty
resolveType x = error $ "Failed to resolve type " ++ show x

isOpaqueStruct ident = ident `elem` godotOpaqueStructs
fromCIdent = mkName . pascal . C.unIdentifier
lookupBase = flip M.lookup baseTypesTable
lookupEnum = flip M.lookup enumTypesTable

-- constructs the haskell and C functions out of the API name, index and entry
-- I was considering doing C via AST, but just going to use Strings.
constructFunction :: Name -> Int -> S.GdnativeApiEntry -> Q ([Dec], Maybe String)
constructFunction tyname idx entry | needsCShim = constructShimmedFunction
                                 | otherwise = constructSimpleFunction
  where
    fname = mkName . T.unpack $ S.name entry
    foreignName = mkName . T.unpack $ S.name entry `T.snoc` '_'

    needsCShim = has _CShimType retTy || any (has _CShimType . fst) args
    
    retTy = resolveType (S.return_type entry)
    -- if we have a "r_" name, we need to mallocForeignPtrBytes it
    -- and return the ForeignPtr, so set the flag
    args = fmap (resolveType *** T.isPrefixOf "r_") $ S.arguments entry
    -- (mallocArgs, trueArgs) = fmap fst *** fmap fst $ V.partition snd args

    -- if we have e.g malloc args [GodotString, GodotBool] and return type (),
    -- we want to return IO (GodotString, GodotBool).
    -- Otherwise e.g. retTy = Int => IO (Int, GodotString, GodotBool)

    -- TODO: we're not doing this right now
    
    -- finalRetTy = case unTypeResult retTy of
    --  TupleT 0 -> foldl AppT (TupleT $ length mallocArgs) mallocArgs
    --  ty -> foldl AppT (TupleT $ length mallocArgs + 1) $ ty `V.cons` mallocArgs
    
    -- simpleType = pure $ foldr AppT (AppT (ConT ''IO) finalRetTy) $
    --  fmap (AppT ArrowT . unTypeResult) trueArgs
    simpleType = pure $ foldr AppT (AppT (ConT ''IO) (unTypeResult retTy)) $
      fmap (AppT ArrowT) $ ConT tyname  `V.cons` fmap (unTypeResult . fst) args
    -- type for the foreign declaration
    simpleForeignType = pure $ foldr AppT (AppT (ConT ''IO) (unTypeResult retTy)) $
      fmap (AppT ArrowT . unTypeResult . fst) args

    constructSimpleFunction = do
      -- FunPtr ty -> ty
      fdecl <- forImpD cCall safe "dynamic" foreignName $
        appT (appT arrowT (appT (conT ''FunPtr) simpleForeignType)) simpleForeignType

      sig <- sigD fname simpleType
      nApi <- newName "api"
      nPtr <- newName "ptr"
      -- Left -> malloc, Right -> passed
      -- namedArgs <- mapM (second $ \b -> (if b then Left else Right) <$> newName "x") args
      -- let passedArgs = namedArgs ^.. traversed . aside _Right . _2
      passedArgs <- replicateM (V.length args) $ newName "x"

      -- foreign ptr x_0 ...x_n
      let invokeE = pure $ foldl AppE (VarE foreignName) $ VarE nPtr : map VarE passedArgs
      -- peekElemOff api idx
      let peekE = pure $ foldl AppE (VarE 'peekByteOff) [VarE nApi, LitE (IntegerL $ fromIntegral $ sizeOf (undefined :: FunPtr a) * idx)]
      -- peekElemOff api idx >>= \ptr -> foreign ptr x_0 ... x_n
      let body = normalB $ infixE (Just peekE) (varE '(>>=)) (Just $ lamE [varP nPtr] invokeE)
      -- (Api api) x_0 ... x_n
      fun <- funD fname [clause (conP tyname [varP nApi] : map varP passedArgs) body []]
      return ([fdecl, sig, fun], Nothing)

    constructShimmedFunction = do
      runIO $ putStrLn $ "function " ++ show fname ++ " needs a shim, skipping for now"
      return ([], Nothing)


apisToHs :: S.GdnativeApis -> Q [Dec]
apisToHs apis = do
  coreDecs <- apiToHs True (S.core apis) 
  extDecs <- concat <$> mapM (apiToHs False) (HM.elems $ S.extensions apis)
  return $ coreDecs ++ extDecs

-- bool: is core -> True
apiToHs :: Bool -> S.GdnativeApi -> Q [Dec]
apiToHs isCore api = generateApiType api
  where
    -- generate the
    -- newtype: newtype Api = Api (Ptr Api)
    -- functions:
    -- - simple function: func :: Api -> Blah -> IO Boop, func (Api ptr) blah boop = peekByteOff ptr 0 >>= \fptr -> createFunc fptr blah boop
    -- - c shim function: * return value: create C function with extra argument that writes result to it
    --                    * argument: create C function that dereferences it
    generateApiType api = let apiName = mkApiName api
                              apiEntries = S.apiApi api
                          in generateFunctions apiName apiEntries
    maybeExt = if isCore then "" else "Ext"
    showVer = let ver = S.apiVersion api in show (S.major ver) ++ show (S.minor ver)
    maybeVer = if S.apiVersion api == S.Ver 1 0 then "" else showVer
    mkApiName api = mkName $ "GodotGdnative" ++ maybeExt ++ pascal (T.unpack $ S.apiType api) ++ maybeVer ++ "ApiStruct"

    --HACKHACK: ignoring shimmed
    generateFunctions name entries = fmap (concat . V.toList . fmap fst) $ imapM (constructFunction name) entries
      
      
                                    

-- core idea:
-- disambiguate based on names ("r_x" -> alloca-..., "p_x" -> "Ptr ...")
-- structs are pointers by default (i.e. godot_string* == GodotString)
-- everything else is bare
-- anything else?


-- we don't have a C2HS AST...

