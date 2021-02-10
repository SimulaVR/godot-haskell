{-# LANGUAGE NoMonoLocalBinds, NoMonomorphismRestriction #-}
module Classgen.Module where

import Control.Lens
import Control.Applicative
import Control.Monad.State
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HM
import qualified Data.Vector as V
import Data.Text (Text)
import qualified Data.Text as T
import Data.Set (Set)
import qualified Data.Set as S
import qualified Language.Haskell.Exts as HS
import Language.Haskell.Exts.QQ
import Language.Haskell.Exts.SimpleComments
import Text.Casing
import Classgen.Spec
import qualified Classgen.Docs as D
import Data.Maybe
import Data.List

--TODO add singleton functions

data ClassgenState = ClassgenState
  { _csModules :: !(HashMap Text (HS.Module (Maybe CodeComment)))
  , _csMethods :: !(HashMap Text (Set Text))
  , _csTyDecls :: !([HS.Decl (Maybe CodeComment)])
  } deriving (Show, Eq) 

makeLensesWith abbreviatedFields ''ClassgenState

noComments l = fmap (\_ -> Nothing) l

addClass :: MonadState ClassgenState m => GodotClass -> Maybe D.GodotDocClass -> m ()
addClass cls mdoc = do
  methods <- mkMethods cls mdoc
  properties <- mkProperties cls mdoc
  signals <- mkSignals cls mdoc
  let dataType = if isCoreType (cls ^. name) then [] else mkDataType cls mdoc
  tyDecls <>= dataType
  let classDecls = nub $ (noComments <$> (mkConstants cls ++ mkEnums cls))
                 ++ signals ++ properties ++ methods
  modules %= HM.insert (mangleClass $ cls ^. name) (HS.Module Nothing
                                      (Just $ classModuleHead classDecls)
                                      [HS.LanguagePragma Nothing [HS.Ident Nothing "DerivingStrategies"
                                                                 ,HS.Ident Nothing "GeneralizedNewtypeDeriving"
                                                                 ,HS.Ident Nothing "TypeFamilies"
                                                                 ,HS.Ident Nothing "TypeOperators"
                                                                 ,HS.Ident Nothing "FlexibleContexts"
                                                                 ,HS.Ident Nothing "DataKinds"
                                                                 ,HS.Ident Nothing "MultiParamTypeClasses"]]
                                      (noComments <$> classImports)
                                      classDecls)
  where
    classImports = map (\n -> HS.ImportDecl () (HS.ModuleName () n) False False False Nothing Nothing Nothing)
      [ "Data.Coerce", "Foreign.C", "Godot.Internal.Dispatch"
      , "System.IO.Unsafe", "Godot.Gdnative.Internal", "Godot.Api.Types"]
    classModuleHead decls = HS.ModuleHead Nothing classModuleName Nothing $ Just (classExports decls)
    classModuleName = noComments $ HS.ModuleName () $ "Godot." ++ (pascal $ T.unpack (cls ^. apiType))
      ++ "." ++ (T.unpack $ mangleClass $ cls ^. name)
    classExports decls = HS.ExportSpecList Nothing $
      mapMaybe (\decl -> case decl of
                   HS.TypeSig _ [name] (HS.TyCon _ (HS.Qual _ _ (HS.Ident _ "MethodBind"))) ->
                     Nothing
                   HS.TypeSig _ [name] (HS.TyCon _ (HS.UnQual _ (HS.Ident _ "MethodBind"))) ->
                     Nothing
                   HS.TypeSig _ [name] _ ->
                     Just $ HS.EVar Nothing (HS.Qual Nothing classModuleName name)
                   _ -> Nothing)
      decls

mkProperties :: MonadState ClassgenState m => GodotClass -> Maybe D.GodotDocClass -> m [HS.Decl (Maybe CodeComment)]
mkProperties cls mdoc = concat <$> mapM mkProperty (V.toList $ cls ^. properties)
  where
    mkProperty prop = do
      get <- mkGetter prop
      set <- mkSetter prop
      return (get ++ set)
    mkGetter prop | T.null (prop ^. getter) = return []
                  | otherwise = mkMethod cls (GodotMethod (prop ^. getter)
                                              (prop ^.  type') False False True False False False False mempty)
                                             (methodDoc (prop ^. getter) mdoc)
    mkSetter prop | T.null (prop ^. setter) = return []
                  | otherwise = mkMethod cls (GodotMethod (prop ^. setter)
                                              (PrimitiveType VoidType) False False False False False False False
                                              (V.singleton $ GodotArgument (prop ^. name) (prop ^. type') Nothing))
                                             (methodDoc (prop ^. setter) mdoc)

godotObjectTy :: HS.Type ()
godotObjectTy = HS.TyCon () $ HS.UnQual () $ HS.Ident () "Object"

sigCon :: HS.Exp ()
sigCon = HS.Con () $ HS.Qual () (HS.ModuleName () $ "Godot.Internal.Dispatch") $ HS.Ident () "Signal"

sigTy :: HS.Type ()
sigTy = HS.TyCon () $ HS.Qual () (HS.ModuleName () $ "Godot.Internal.Dispatch") $ HS.Ident () "Signal"

clsAsName :: GodotClass -> HS.Name ()
clsAsName cls = HS.Ident () (T.unpack $ mangleClass $ cls ^. name)

clsTy :: GodotClass -> HS.Type ()
clsTy = HS.TyCon () . HS.UnQual ()  . clsAsName

baseClsTy :: GodotClass -> HS.Type ()
baseClsTy cls = HS.TyCon () . HS.UnQual () $ HS.Ident () (T.unpack (cls ^. baseClass))

intTy = HS.TyCon () . HS.UnQual () $ HS.name "Int"

mkDataType cls mdoc =
  [ HS.DataDecl (case mdoc of
                   Nothing -> Nothing
                   Just d -> case d ^. D.brief_description of
                              D.FirstJSON x -> preComment (T.unpack $
                                                          x <> "\n" <> let desc = D.alternative1 (d ^. D.description) ""
                                                                       in case T.stripPrefix x desc of
                                                                            Nothing -> T.strip desc
                                                                            Just r -> r)
                              _ -> Nothing) (HS.NewType Nothing) Nothing 
    (noComments $ HS.DHead () $ clsAsName cls)
    [noComments $ HS.QualConDecl () Nothing Nothing $ HS.ConDecl () (clsAsName cls) [godotObjectTy]]
    [noComments $ HS.Deriving () (Just $ HS.DerivNewtype ()) [asVariantRule]]
  ] ++ if T.null (cls ^. baseClass) then [] else
  [ noComments
    $ HS.InstDecl () Nothing
    (HS.IRule () Nothing Nothing
     (HS.IHApp () (HS.IHCon () (HS.UnQual () (HS.Ident () "HasBaseClass")))
       (clsTy cls)))
    (Just
     [ HS.InsType () (HS.TyApp () (HS.TyCon () (HS.UnQual () (HS.Ident () "BaseClass"))) (clsTy cls))
       (baseClsTy cls)
     , HS.InsDecl () (HS.PatBind () (HS.PVar () (HS.Ident () "super"))
                      (HS.UnGuardedRhs () (HS.Var () (HS.UnQual () (HS.Ident () "coerce")))) Nothing)
     ] ) ]
  where
    asVariantRule = HS.IRule () Nothing Nothing $ HS.IHCon () (HS.UnQual () $ HS.Ident () "AsVariant")

mkSignals :: MonadState ClassgenState m => GodotClass -> Maybe D.GodotDocClass -> m [HS.Decl (Maybe CodeComment)]
mkSignals cls mdoc = return $ concatMap mkSignal (V.toList $ cls ^. signals)
  where
    signalDoc :: Text -> Maybe D.GodotDocClass -> Maybe CodeComment
    signalDoc name mdoc = do
      doc <- mdoc
      sigs <- D._gdSignals doc
      ss <- D.unOption <$> HM.lookup (T.pack "signal") sigs
      sdoc <- V.find (\e -> e ^. D.name == name) ss
      d <- D.alt1 $ sdoc ^. D.description
      preComment (T.unpack d)
    argToHsType (GodotArgument _ ty _) = toHsType ty
    mkSignal sig 
      = let sigStr = T.unpack (sig ^. name)
            sigName = HS.Ident () ("sig_" ++ sigStr)
        in [ HS.TypeSig (signalDoc (sig ^. name) mdoc) [noComments $ sigName] (noComments $ HS.TyApp () sigTy (clsTy cls))
           , noComments $ HS.PatBind () (HS.PVar () sigName) (
               HS.UnGuardedRhs () $ HS.App () sigCon $ HS.Lit () $ HS.String () sigStr sigStr
           ) Nothing
           , noComments $ HS.InstDecl () Nothing
             (HS.IRule () Nothing Nothing (HS.IHApp () (HS.IHApp () (HS.IHApp () (HS.IHCon () (HS.UnQual () (HS.Ident () "NodeSignal")))
                                                                  (clsTy cls))
                                                       (HS.TyPromoted () (HS.PromotedString () sigStr sigStr)))
                                           (HS.TyPromoted ()
                                            (HS.PromotedList () True
                                             (map argToHsType $ V.toList $ sig ^. arguments)))))
             Nothing
           ]

mkConstants :: GodotClass -> [HS.Decl ()]
mkConstants cls = concatMap mkConstant (HM.toList $ cls ^. constants)
  where
    mkConstant (cname, cval)
      = let constName = HS.Ident () $ T.unpack ("_" <> cname)
        in [ HS.TypeSig ()  [constName] intTy
           , HS.FunBind () [HS.Match ()
                            constName
                            []
                            (HS.UnGuardedRhs () (HS.Lit () (HS.Int () (fromIntegral cval) (show cval))))
                            Nothing]
           ]

mkEnums cls = [] -- TODO Not sure what to do about these

methodDoc :: Text -> Maybe D.GodotDocClass -> Maybe CodeComment
methodDoc name mdoc = do
  doc <- mdoc
  (do
      ms <- D.unOption <$> HM.lookup (T.pack "method") (D._gdMethods doc)
      docm <- V.find (\e -> e ^. D.name == name) ms
      d <- D.alt1 $ docm ^. D.description 
      preComment (T.unpack d))
    <|> (do
            mems <- D.unOption <$> (HM.lookup (T.pack "member") =<< D._gdMembers doc)
            doc <- V.find (\e -> e ^. D.getter == name || e ^. D.setter == name) mems
            d <- doc ^. D.value
            preComment (T.unpack d))

mkMethods :: MonadState ClassgenState m => GodotClass -> Maybe D.GodotDocClass -> m [HS.Decl (Maybe CodeComment)]
mkMethods cls mdoc =
  concat <$> mapM (\m -> mkMethod cls m (methodDoc (m ^. name) mdoc))
             (V.toList $ cls ^. methods)

mkMethod :: MonadState ClassgenState m => GodotClass -> GodotMethod -> Maybe CodeComment -> m [HS.Decl (Maybe CodeComment)]
mkMethod cls method doc = do
  mtds <- use methods
  if (method ^. name) `S.member` (HM.lookupDefault mempty (cls ^. name) mtds)
    then return []
    else do
    methods %= HM.insertWith S.union (mangleClass $ cls ^. name) (S.singleton $ method ^. name)
    when (T.null $ method ^. name) $ error (show cls ++ "\n" ++ show method)
    return $ 
        [ noComments $ HS.InlineSig () False Nothing (HS.UnQual () clsMethodBindName)
        , HS.TypeSig doc [noComments $ clsMethodBindName]
                         (noComments $ HS.TyCon () (HS.UnQual () (HS.Ident () "MethodBind")))
        , noComments $ HS.PatBind () (HS.PVar () clsMethodBindName) clsMethodBindRhs Nothing
        , HS.TypeSig doc [HS.Ident Nothing $ methodName]
          (noComments [ty|(((clsName)) :< cls, Object :< cls) => cls -> ((methodSig))|])
        , noComments $ HS.FunBind () [HS.Match () (HS.Ident () $ methodName)
                        ((HS.PVar () (HS.Ident () "cls") : map (HS.PVar ()) argNames)
                         ++ if method ^. hasVarargs then
                            [HS.PVar () (HS.Ident () "varargs")] else
                            [])
                        runMethodRhs Nothing]
        ]
  where
    clsName = HS.TyCon () (HS.UnQual () (clsAsName cls))
    clsMethodBindName = HS.Ident () $ "bind" ++ (T.unpack $ mangleClass (cls ^. name)) ++ "_" ++ methodName
    clsMethodBindVar = HS.Var () $ HS.UnQual () clsMethodBindName
    clsMethodBindRhs = HS.UnGuardedRhs ()
      [hs| unsafePerformIO $ withCString $(HS.strE (T.unpack $ cls ^. name)) $
         \clsNamePtr -> withCString $(HS.strE rawMethodName) $
         \methodNamePtr -> godot_method_bind_get_method clsNamePtr methodNamePtr |]

    runMethodRhs = HS.UnGuardedRhs () $ HS.App () (
      HS.App ()
        (HS.Var () (HS.UnQual () (HS.Ident () "withVariantArray")))
        (let a = (HS.List ()
                  $ map (HS.App () (HS.Var () (HS.UnQual () (HS.Ident () "toVariant")))
                         . HS.Var () . HS.UnQual ()) argNames)
        in if method ^. hasVarargs then
            [hs|$a ++ varargs|] else
            a))
      [hs|
        \(arrPtr, len) -> godot_method_bind_call $(clsMethodBindVar) (upcast cls) arrPtr len >>=
        \(err, res) -> throwIfErr err >> fromGodotVariant res |]

    argNames = map (HS.Ident () . ("arg" ++) . show) [1..length (method ^. arguments)]

    methodSig = foldr (HS.TyFun ()) (HS.TyApp () [ty|IO|] (toHsType $ method ^. returnType)) $
      (let args = fmap (argToHsType) (method ^. arguments)
        in if method ^. hasVarargs then
          args `V.snoc` [ty|[Variant 'GodotTy]|] else
          args)

    argToHsType (GodotArgument _ ty _) = toHsType ty
    -- TODO: default values
--    argToHsType (GodotArgument _ ty (Just _))
--      = HS.TyApp () (HS.TyCon () $ HS.UnQual () $ HS.Ident () "Maybe") $ toHsType ty

    rawMethodName = T.unpack $ method ^. name
    methodName = T.unpack (case method ^. name of
                             "case" -> "case'"
                             "class" -> "class'"
                             "data" -> "data'"
                             "default" -> "default'"
                             "deriving" -> "deriving'"
                             "do" -> "do'"
                             "else" -> "else'"
                             "forall" -> "forall'"
                             "if" -> "if'"
                             "import" -> "import'"
                             "in" -> "in'"
                             "infix" -> "infix'"
                             "infixl" -> "infixl'"
                             "infixr" -> "infixr'"
                             "instance" -> "instance'"
                             "let" -> "let'"
                             "module" -> "module'"
                             "newtype" -> "newtype'"
                             "of" -> "of'"
                             "qualified" -> "qualified'"
                             "then" -> "then'"
                             "type" -> "type'"
                             "where" -> "where'"
                             "foreign" -> "foreign'"
                             "ccall" -> "ccall'"
                             "as" -> "as'"
                             "safe" -> "safe'"
                             "unsafe" -> "unsafe'"
                             x -> x)

mangleClass "String" = "GodotString"
mangleClass "Variant" = "GodotVariant"
mangleClass c = case T.stripPrefix "_" c of
                  Nothing -> c
                  Just x -> x

toHsType :: GType -> HS.Type ()
toHsType (PrimitiveType VoidType) = [ty| () |]
toHsType (PrimitiveType BoolType) = [ty| Bool |]
toHsType (PrimitiveType IntType) = [ty| Int |]
toHsType (PrimitiveType FloatType) = [ty| Float |]
toHsType (CoreType ty) = HS.TyCon () $ HS.UnQual () $ HS.Ident () $ T.unpack $ renameType ty
  where
    renameType "RID" = "Rid"
    renameType "Transform2D" = "Transform2d"
    renameType "AABB" = "Aabb"
    renameType "String" = "GodotString"
    renameType "Variant" = "GodotVariant"
    renameType x = mangleClass x
toHsType (CustomType ty) = HS.TyCon () $ HS.UnQual () $ HS.Ident () $ T.unpack ty
toHsType (EnumType _) = [ty| Int |]
