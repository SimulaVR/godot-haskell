{-# LANGUAGE TemplateHaskell, OverloadedStrings, ViewPatterns, DeriveFunctor, TypeApplications #-}
module Generate where

import Control.Lens
import Control.Monad

import Data.Coerce
import qualified Data.HashMap.Lazy as HM
import Data.Map (Map)
import qualified Data.Map as M
import Data.Monoid

import qualified Data.Vector as V
import qualified Data.Text as T

import Text.Casing

import Foreign
import Foreign.C

import Language.Haskell.TH
import Language.Haskell.TH.Syntax

import Text.PrettyPrint.ANSI.Leijen ((<+>))
import qualified Text.PrettyPrint.ANSI.Leijen as PP

import qualified Spec as S 

import qualified Types as C

-- a simple type corresponds to a 1:1 haskell type
-- a c shim type can't be represented by the haskell FFI, so it needs to be shimmed
-- an opaque type needs to be withForeignPtr'd (modulo newtype)
data TypeResult a
  = SimpleType a
  | EnumType a
  | OpaqueType Bool a -- Bool == needs C shim
  | StorableType Bool a
  deriving (Show, Eq, Ord, Functor)

isCShimType :: TypeResult a -> Bool
isCShimType (OpaqueType b _) = b
isCShimType (StorableType b _) = b
isCShimType _ = False

makePrisms ''TypeResult

unTypeResult :: TypeResult a -> a
unTypeResult (SimpleType a) = a
unTypeResult (EnumType a) = a
unTypeResult (OpaqueType _ a) = a
unTypeResult (StorableType _ a) = a

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
  , (C.TypeName "godot_real", fromThName ''CFloat)
  , (C.TypeName "godot_int", fromThName ''CInt)
  , (C.TypeName "godot_bool", fromThName ''CBool)
  , (C.TypeName "godot_class_constructor", ConT $ mkName "GodotClassConstructor")
  , (C.TypeName "native_call_cb", ConT $ mkName "NativeCallCb")
  , (C.TypeName "bool", fromThName ''CInt)
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
  , "godot_quat"
  , "godot_rect2"
  , "godot_rid"
  , "godot_string"
  , "godot_string_name"
  , "godot_transform"
  , "godot_transform2d"
  , "godot_variant"
  , "godot_vector2"
  , "godot_vector3"
  ] ++ concatMap (\(C.Identifier str) ->
                    map (\suf -> C.Identifier $ str ++ suf) ["", "_read_access", "_write_access"])
  [  "godot_pool_byte_array"
  , "godot_pool_color_array"
  , "godot_pool_int_array"
  , "godot_pool_real_array"
  , "godot_pool_string_array"
  , "godot_pool_vector2_array"
  , "godot_pool_vector3_array"
  ]

-- structs, but not opaque structs
godotStructs :: [C.Identifier]
godotStructs =
  [ "godot_instance_create_func"
  , "godot_instance_destroy_func"
  , "godot_instance_method"
  , "godot_method_attributes"
  , "godot_property_get_func"
  , "godot_property_set_func"
  , "godot_property_attributes"
  , "godot_signal"
  , "godot_net_stream_peer"
  , "godot_net_packet_peer"
  , "godot_net_multiplayer_peer"
  , "godot_videodecoder_interface_gdnative"
  , "godot_arvr_interface_gdnative"
  , "godot_variant_call_error"
  , "godot_pluginscript_language_desc"
  , "godot_method_arg"
  , "godot_instance_binding_functions"
  , "godot_net_webrtc_library"
  , "godot_net_webrtc_peer_connection"
  , "godot_net_webrtc_data_channel"
  ]
  
godotEnums :: [C.Identifier]
godotEnums =
  [ "godot_error"
  , "godot_variant_type"
  , "godot_variant_call_error_error"
  , "godot_vector3_axis"
  , "godot_variant_operator" ]


-- pipeline:
-- - shim function, converting a S.GdnativeApiEntry into a foreign decl name, foreign decl, and maybe a piece of C code + updated types
-- - marshal it
-- - call it


createFuncTyIO :: (Functor t, Foldable t) => Type -> t Type -> Type
createFuncTyIO ret args = foldr AppT (AppT (ConT ''IO) ret) $ fmap (AppT ArrowT) args

shimFunction :: S.GdnativeApiEntry -> ( Name -- function name
                                      , Name -- foreign decl name
                                      , Dec -- foreign decl
                                      , Maybe PP.Doc -- shim C code
                                      , [(TypeResult Type, Bool)] -- foreign argument types + whether to malloc it
                                      , TypeResult Type ) -- foreign return type 
shimFunction entry =
  ( fname
  , foreignName
  , fdecl
  , cShim
  , newArgs
  , newRetTy )

  where
    fname = mkName . T.unpack $ S.name entry
    foreignName = mkName . T.unpack $ S.name entry `T.snoc` '_'

    retTy = resolveType $ S.return_type entry
    args = (resolveType.fst) <$> S.arguments entry
    isMallocArg arg = T.isPrefixOf "r_" arg 
      || S.name entry == "godot_variant_new_bool" && arg == "p_v"
      || S.name entry == "godot_method_bind_call" && arg == "p_call_error"
    mallocFlags = V.toList $ (isMallocArg.snd) <$> S.arguments entry

    -- now we need to transform the args post-shim:
    -- we only need to shim opaque structs, so those are easy
    -- for the return type we append the old return value with malloc=>True, and set return type ()

    flaggedArgs = zip (V.toList args) mallocFlags
    (newArgs, newRetTy) | shimRet = (flaggedArgs ++ [(retTy, True)], SimpleType (TupleT 0))
                        | otherwise = (flaggedArgs, retTy)

    foreignTypeResult (EnumType _) = ConT ''CInt
    foreignTypeResult ty = unTypeResult ty
    
    foreignRetTy = foreignTypeResult newRetTy
    foreignArgs = (foreignTypeResult.fst) <$> newArgs
    
    
    cName = if needsCShim then "hs_shim_" ++ nameBase fname else "dynamic"
    foreignType = createFuncTyIO foreignRetTy foreignArgs
    --TODO make the FunPtr correctly typed?
    fdecl = ForeignD $ ImportF CCall Safe cName foreignName $
                     AppT (AppT ArrowT (AppT (ConT ''FunPtr) foreignType)) foreignType -- FunPtr ty -> ty

    shimArgs = V.toList $ fmap isCShimType args
    shimRet = isCShimType retTy
    needsCShim = shimRet || or shimArgs
    
    -- construct the C shim. we're lazy here and just indicate whether we want to shim some argument or return type or not
    -- no direct AST (todo?)
    -- shimArgs = original function params length!!
    cShim
      | needsCShim = Just $ PP.vsep
        [ newRetDecl <+> PP.text cName <+> PP.tupled newCArgs <+> "{" -- new declaration
        , PP.indent 2 $ retWay <+> "func" <+> PP.tupled newInvokeParams <> ";"
        , "}"]
      | otherwise = Nothing
      where
        nats = [0..] :: [Int]
        oldRetTy = PP.pretty $ S.return_type entry
        oldArgTys = map (PP.pretty . fst) $ V.toList $ S.arguments entry
        
        newRetDecl = if shimRet then "void" else oldRetTy
        
        funPtrDecl = oldRetTy <+> "(*func)" <> PP.tupled oldArgTys

        shimTy needsShim ty = if needsShim then ty <> "*" else ty
        
        newCArgs = [funPtrDecl] ++ -- fun ptr is always first
                  zipWith3 (\idx needsShim ty -> shimTy needsShim ty <+> "x" <> PP.pretty idx)
                  nats shimArgs oldArgTys ++
                  [shimTy True oldRetTy <+> "ret" | shimRet] -- apppend ret shim if needed
        

        retWay = if shimRet then "*ret =" else "return"

        shimParam needsShim = if needsShim then "*" else ""
        newInvokeParams = zipWith (\idx needsShim -> shimParam needsShim <> "x" <> PP.pretty idx) nats shimArgs

-- this is the core C type -> Foreign mapping. we also encode the type of marshaller to use
resolveType :: C.Type -> TypeResult Type
resolveType (C.TypeSpecifier _ (lookupBase -> Just ty)) = SimpleType $ ty
resolveType (C.TypeSpecifier _ (C.TypeName ident)) = con $ ConT $ fromCIdent ident
  where
    con | isOpaqueStruct ident = OpaqueType True . AppT (ConT ''Ptr) -- we need to shim this so types match
        | isStruct ident = StorableType True . AppT (ConT ''Ptr)
        | isEnumType ident = EnumType
        | otherwise = error $ "Unknown type " ++ show ident
resolveType (C.Ptr _ (C.TypeSpecifier _ (lookupBase -> Just ty)))
  = SimpleType $ AppT (ConT ''Ptr) ty
resolveType (C.Ptr _ (C.TypeSpecifier _ (C.TypeName "godot_object")))
  = SimpleType $ ConT $ mkName "GodotObject"
resolveType (C.Ptr _ (C.TypeSpecifier _ (C.TypeName ident)))
  = con  . AppT (ConT ''Ptr) . ConT $ fromCIdent ident
  where
    con | isOpaqueStruct ident = OpaqueType False 
        | isStruct ident = StorableType False
        | isEnumType ident = EnumType 
        | otherwise = error $ "Unknown type " ++ show ident
resolveType (C.Ptr _ ty) = SimpleType $ AppT (ConT ''Ptr) (unTypeResult $ resolveType ty)
resolveType x = error $ "Failed to resolve type " ++ show x

isStruct, isEnumType, isOpaqueStruct :: C.Identifier -> Bool
isOpaqueStruct ident = ident `elem` godotOpaqueStructs
isStruct ident = ident `elem` godotStructs
isEnumType ident = ident `elem` godotEnums

fromCIdent :: C.Identifier -> Name
fromCIdent = mkName . pascal . C.unIdentifier

lookupBase :: C.TypeSpecifier -> Maybe Type
lookupBase = flip M.lookup baseTypesTable

unPtrT :: Type -> Type
unPtrT (AppT (ConT ptr) ty) | ptr == ''Ptr = ty
unPtrT _ = error "Used unPtrT on a non-Ptr type"

-- tuple:
-- - Either (Name -> Q Exp) (Q Exp) -- left => in marshaller needs argument, right => no argument (e.g. malloc)
-- - Type => hs type
-- - Name -> Q Exp => out marshaller
-- an in argument needs an in marshaller
-- an out argument needs both
-- a return value needs an out marshaller
marshalArg :: (TypeResult Type, Bool)
           -> Q ( Either (Name -> Q Exp) (Q Exp)
                , Type
                , Name -> Q Exp )
marshalArg (SimpleType ty, isOutPtr)
  | isOutPtr = pure ( Right [|alloca|]
                    , unPtrT ty
                    , \n -> [|peek $(varE n)|])
  | otherwise = pure ( Left (\n -> [| ($ $(varE n)) |])
                       -- this syntax sucks a bit, but it's basically a ($ n) section
                     , ty
                     , \n -> [|return $(varE n)|] )
marshalArg (EnumType ty, isOutPtr)
  | isOutPtr = pure ( Right [|alloca|]
                    , unPtrT ty
                    , \n -> [|fmap (toEnum . fromIntegral) (peek $(varE n))|] )
  | otherwise = pure ( Left (\n -> [|($ fromIntegral (fromEnum $(varE n)))|])
                     , ty
                     , \n -> [|return . toEnum $ fromIntegral $(varE n)|] )


--TODO: rewrite this to use mallocForeignPtrBytes.
marshalArg (OpaqueType _ ty, isOutPtr)
  | isOutPtr = pure ( Right [| (mallocBytes (opaqueSizeOf @($(pure $ unPtrT ty))) >>=) |]
              , unPtrT ty
              , \n -> [|coerce <$> newForeignPtr finalizerFree $(varE n)|] )
   | otherwise = pure ( Left (\n -> [| withForeignPtr (coerce $(varE n)) |])
                , unPtrT ty
                , \n -> [|coerce <$> newForeignPtr_ $(varE n)|] )

marshalArg (StorableType _ ty, isOutPtr)
  | isOutPtr = pure ( Right [|alloca|]
                    , unPtrT ty
                    , \n -> [|peek $(varE n)|] )
  | otherwise = pure ( Left (\n -> [| with $(varE n) |] )
                     , unPtrT ty
                     , \n -> [|peek $(varE n)|] ) -- not sure about this
      

marshalRet :: TypeResult Type -> Q ( Type -- hs ret ty
                                   , Maybe (Name -> Q Exp) ) -- out marshaller
marshalRet (OpaqueType True _) = error "can't marshal unshimmed opaque structs"
marshalRet (StorableType True _) = error "can't marshal unshimmed structs"
marshalRet r = marshalArg (r, False) >>=
  \(_, hty, outm) -> case hty of
    TupleT 0 -> pure (hty, Nothing)
    _ -> pure (hty, Just outm)


-- constructs the haskell and C functions out of the API name, index and entry
-- I was considering doing C via AST, but just going to use PP.Doc.
constructFunction :: Bool -> Name -> Int -> S.GdnativeApiEntry -> Q ([Dec], Maybe PP.Doc)
constructFunction isCore tyname idx entry = do
  marshalledArgs <- mapM marshalArg foreignArgs
  let (hsOuts, hsArgs) = partitionArgs marshalledArgs
  (retMarshalTy, retOutMarshal) <- marshalRet foreignRetTy

  let hsRets = case retMarshalTy of
        TupleT 0 -> hsOuts ^.. folded._2
        _ -> retMarshalTy : (hsOuts ^.. folded._2)

  let foldedRetTy = case hsRets of
        [hsRet] -> hsRet
        _ -> foldl AppT (TupleT (length hsRets)) hsRets

  let hsTy = createFuncTyIO foldedRetTy (hsArgs ^.. folded._2)

  sig <- sigD fname (pure hsTy) -- the top-level sig

  (argInMarshallers, argNames, argOutMarshallers) <- getMarshallers marshalledArgs

  nApi <- newName "api"
  nPtr <- newName "ptr"

  -- peekElemOff api idx
  let tyApiName = mkName . camel $ nameBase tyname
  let apiE = LetE [ValD (ConP tyname [] [VarP nApi]) (NormalB $ VarE tyApiName) []] (VarE nApi)
  let peekE = pure $ foldl AppE (VarE 'peekByteOff) [apiE, LitE (IntegerL $ fromIntegral $ sizeOf (undefined :: FunPtr a) * idx + structOffset)]

  let invokeE = appE (varE foreignName) (varE nPtr)

  let callE = generateCall invokeE argInMarshallers argOutMarshallers retOutMarshal
  fundecl <- funD fname [clause (map varP argNames)
                          (normalB $ infixE (Just peekE) (varE '(>>=)) (Just $ lamE [varP nPtr] callE)) []]
  
  
  return ([fdecl, sig, fundecl], cShim)
  -- marshalling
  where
    (fname, foreignName, fdecl, cShim, foreignArgs, foreignRetTy) = shimFunction entry

    partitionArgs [] = ([],[])
    partitionArgs ((inm, ty, outf) : margs)
      = let (os, as) = partitionArgs margs
        in case inm of
             Left argf -> (os, (argf, ty, outf) : as)
             Right argm -> ((argm, ty, outf) : os, as)

    getMarshallers [] = return ([],[],[])
    getMarshallers ((inm, _, outm):xs) = do
      (argInMs, argNs, argOutMs) <- getMarshallers xs
      case inm of
        Left argf -> newName "x" >>= \n -> return ((argf n, False) : argInMs, n : argNs, argOutMs)
        Right argm -> return ( (argm, True) : argInMs, argNs, outm : argOutMs)

    -- TODO: evaluate these properly
    -- HACK: 64-bit linux only
    structOffset = if isCore
      then 40 -- offsetof(godot_gdnative_core_api_struct,godot_color_new_rgba)
      else 24 -- 
      

    
-- an in marshaller has form (a -> IO b) -> IO b
generateCall :: Q Exp -- ^ the foreign function to call
             -> [(Q Exp, Bool)] -- ^ in marshallers (len = arguments)
             -> [Name -> Q Exp] -- ^ out argument marshallers (len = #outputs)
             -> Maybe (Name -> Q Exp) -- ^ return value marshaller, if non-void
             -> Q Exp -- ^ the full callee
generateCall = go []
  where
    go ns func [] outm maybeRetm = do
      case maybeRetm of
        -- duplication, bleh
        Just retm -> do
          r <- newName "r" -- return value
          let bindCall = [ bindS (varP r) func ] -- bind the result of the call to a name
          
          os <- replicateM (length outm + 1) (newName "o")
          let bindOuts = zipWith (\o f -> bindS (varP o) f) os $ zipWith ($) (retm:outm) (r:ns)
          let retOuts = [noBindS $ appE [|return|] $ maybeTupE (map varE os)]
          doE $ bindCall ++ bindOuts ++ retOuts
        Nothing -> do
          let bindCall = [ noBindS func ]
          os <- replicateM (length outm) (newName "o")
          let bindOuts = zipWith (\o f -> bindS (varP o) f) os $ zipWith ($) outm ns
          let retOuts = [noBindS $ appE [|return|] $ maybeTupE (map varE os)]
          doE $ bindCall ++ bindOuts ++ retOuts

    go ns func ((inm, isOutArg):inms) outm maybeRetm = do
      y <- newName "y"
      appE inm . lamE [varP y] $ go (ns ++ [y | isOutArg]) (appE func (varE y)) inms outm maybeRetm

    maybeTupE [x] = x
    maybeTupE xs = tupE xs

apisToHs :: S.GdnativeApis -> Q [Dec]
apisToHs apis = do
  coreDecs <- apiToHs True (S.core apis) 
  extDecs <- concat <$> mapM (apiToHs False) (V.filter (\api -> S.apiType api `notElem` excluded) $ S.extensions apis)
  return $ coreDecs ++ extDecs

  where
    excluded = ["ANDROID"]

-- bool: is core -> True
apiToHs :: Bool -> S.GdnativeApi -> Q [Dec]
apiToHs isCore api = do
  nxts <- case S.apiNext api of
    Just next -> apiToHs isCore next
    Nothing -> return []
  (++ nxts) <$> generateApiType
  where
    -- generate the
    -- newtype: newtype Api = Api (Ptr Api)
    -- functions:
    -- - simple function: func :: Api -> Blah -> IO Boop, func (Api ptr) blah boop = peekByteOff ptr 0 >>= \fptr -> createFunc fptr blah boop
    -- - c shim function: * return value: create C function with extra argument that writes result to it
    --                    * argument: create C function that dereferences it
    generateApiType = let apiName = mkApiName
                          apiEntries = S.apiApi api
                      in generateFunctions apiName apiEntries
    maybeExt = if isCore then "" else "Ext"
    showVer = let ver = S.apiVersion api in show (S.major ver) ++ show (S.minor ver)
    maybeVer =
      if S.apiVersion api == S.Ver 1 0
         || S.apiType api == "ARVR"
         || S.apiType api == "VIDEODECODER"
         || S.apiType api == "NET"
      then "" else showVer
    mkApiName = mkName $ "GodotGdnative" ++ maybeExt ++ pascal (T.unpack $ S.apiType api) ++ maybeVer ++ "ApiStruct"

    generateFunctions name entries = do
      funcs <- imapM (constructFunction isCore name) entries
      let hscode = concat $ funcs ^.. folded._1
      let ccode = PP.vsep $ funcs ^.. folded._2._Just
      addForeignSource LangC . show $ PP.vsep
        [ "#include <gdnative_api_struct.gen.h>"
        , ccode ]
      return hscode
      
      

