{-# LANGUAGE NoMonoLocalBinds, NoMonomorphismRestriction #-}
module Classgen.Module where

import Control.Lens hiding (index)
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
  , -- | Class to parent class and declarations
    _csTyDecls :: !(HashMap Text (Text, [HS.Decl (Maybe CodeComment)]))
  } deriving (Show, Eq)

makeLensesWith abbreviatedFields ''ClassgenState

noComments l = fmap (\_ -> Nothing) l

addClass :: MonadState ClassgenState m => GodotClass -> Maybe D.GodotDocClass -> GodotClasses -> m ()
addClass cls mdoc allClasses = do
  methods <- mkMethods cls mdoc
  properties <- mkProperties cls mdoc
  signals <- mkSignals cls mdoc
  let dataType = if isCoreType (cls ^. name) then [] else mkDataType cls mdoc
  tyDecls %= HM.insert
    (mangleClass $ cls ^. name)
    (mangleClass $ cls ^. baseClass, dataType)
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
      ([ "Data.Coerce", "Foreign.C", "Godot.Internal.Dispatch"
       , "qualified Data.Vector as V"
       , "Linear(V2(..),V3(..),M22)", "Data.Colour(withOpacity)", "Data.Colour.SRGB(sRGB)"
       , "System.IO.Unsafe", "Godot.Gdnative.Internal", "Godot.Api.Types"
       ] <> maybe [] (:[]) parentModuleImport)
    classModuleHead decls = HS.ModuleHead Nothing classModuleName Nothing $ Just (classExports decls)
    classModuleName = noComments $ HS.ModuleName () $ "Godot." ++ (pascal $ T.unpack (cls ^. apiType))
      ++ "." ++ (T.unpack $ mangleClass $ cls ^. name)
    parentModuleImport = case (cls ^. baseClass, V.find (\x -> cls ^. baseClass == x ^. name) allClasses) of
                         ("", Nothing) -> Nothing
                         (_, Nothing) -> error "Can't find base class"
                         (_, Just baseCls) -> Just $ "Godot." ++ (pascal $ T.unpack (baseCls ^. apiType))
                                                  ++ "." ++ (T.unpack $ mangleClass $ baseCls ^. name)
                                                  ++ "()"
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
      inst <- mkProp prop
      return (get ++ set ++ [inst])
    indexArg prop = if prop ^. index == -1 then
                 V.empty else
                 V.singleton (GodotArgument "param" (PrimitiveType IntType) Nothing)
    mkGetter prop             = mkMethod cls (GodotMethod (prop ^. getter)
                                              (gty prop) False False True False False False False
                                              (indexArg prop))
                                             (methodDoc (prop ^. getter) mdoc)
    mkSetter prop | T.null (prop ^. setter) = return []
                  | otherwise = mkMethod cls (GodotMethod (prop ^. setter)
                                              (PrimitiveType VoidType) False False False False False False False
                                              (indexArg prop <> V.singleton (GodotArgument (prop ^. name) (gty prop) Nothing)))
                                             (methodDoc (prop ^. setter) mdoc)
    gty prop = case (cls ^. name,prop ^. name) of
                              -- NB These are bugs in api.json
                              ("VisualScriptPropertySet","type_cache") -> CoreType "Dictionary" -- has int
                              ("PhysicsDirectBodyState","transform") -> CoreType "Transform" -- has transform2d
                              ("JSONParseResult","error") -> PrimitiveType IntType -- has Object
                              ("InputEventKey", "echo") -> PrimitiveType BoolType -- has int
                              ("GeometryInstance", "lod_max_distance") -> PrimitiveType FloatType -- has int
                              ("GeometryInstance", "lod_max_hysteresis") -> PrimitiveType FloatType -- has int
                              ("GeometryInstance", "lod_min_distance") -> PrimitiveType FloatType -- has int
                              ("GeometryInstance", "lod_min_hysteresis") -> PrimitiveType FloatType -- has int
                              ("Control", "margin_bottom") -> PrimitiveType FloatType -- has int
                              ("Control", "margin_top") -> PrimitiveType FloatType -- has int
                              ("Control", "margin_left") -> PrimitiveType FloatType -- has int
                              ("Control", "margin_right") -> PrimitiveType FloatType -- has int
                              ("Curve3D", "_data") -> CoreType "Dictionary" -- has int
                              ("Curve2D", "_data") -> CoreType "Dictionary" -- has int
                              ("Curve", "_data") -> CoreType "Array" -- has int
                              ("Polygon2D", "bones") -> CoreType "Array" -- has Bool
                              ("RichTextLabel", "custom_effects") -> CoreType "Array" -- has 17/17:RichTextEffect
                              ("AudioEffectPitchShift", "oversampling") -> PrimitiveType IntType -- has float
                              ("Area2D", "priority") -> PrimitiveType FloatType -- has int
                              ("Area", "priority") -> PrimitiveType FloatType -- has int
                              -- NB These seem to be too specific or generic in api.json
                              ("ARVRServer", "primary_interface") -> CustomType "ARVRInterface" -- has Object
                              ("AnimationTree", "tree_root") -> CustomType "AnimationNode" -- has AnimationRootNode
                              ("Camera2D", "custom_viewport") -> CustomType "Node" -- has Viewport
                              ("CanvasLayer", "custom_viewport") -> CustomType "Node" -- has Viewport
                              ("ConvexPolygonShape", "points") -> CustomType "PoolVector3Array" -- has Array
                              ("ParticlesMaterial","angle_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","angular_velocity_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","anim_offset_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","anim_speed_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","damping_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","hue_variation_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","linear_accel_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","orbit_velocity_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","radial_accel_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","scale_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","tangential_accel_curve") -> CoreType "Texture" -- has CurveTexture
                              ("ParticlesMaterial","color_ramp") -> CoreType "Texture" -- has GradientTexture
                              ("SceneTree","root") -> CoreType "Viewport" -- has Node
                              _ -> prop ^. type'
    mkProp prop = do
      pure $ noComments [dec|instance NodeProperty ((cty)) ((n)) ((ty)) ((ro)) where nodeProperty = ( $get , $set , Nothing) |]
      where cty = clsTy cls
            n = promotedString $ T.unpack $ prop ^. name
            ty = toHsType $ gty prop
            ro = if T.null (prop ^. setter) then
                   HS.TyPromoted () $ HS.PromotedCon () True $ HS.UnQual () $ HS.Ident () "True" else
                   HS.TyPromoted () $ HS.PromotedCon () True $ HS.UnQual () $ HS.Ident () "False"
            setname = toMethodName (prop ^. setter)
            getname = toMethodName (prop ^. getter)
            i :: String = show $ ((prop ^. index)::Int)
            get = if prop ^. index == -1 then
                    [hs|__getname__|] else
                    [hs|wrapIndexedGetter __i__ __getname__|]
            set = if prop ^. index == -1 || T.null (prop ^. setter) then
                    if T.null (prop ^. setter) then
                      [hs|()|] else
                      [hs|wrapDroppingSetter __setname__|]
                        else
                    [hs|wrapIndexedSetter __i__ __setname__|]

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

nameToTyCon = HS.TyCon () . HS.UnQual () . HS.Ident () . T.unpack

baseClsTy :: GodotClass -> HS.Type ()
baseClsTy cls = nameToTyCon (cls ^. baseClass)

intTy = HS.TyCon () . HS.UnQual () $ HS.name "Int"

promotedString s = HS.TyPromoted () (HS.PromotedString () s s)

promotedList l = HS.TyPromoted () (HS.PromotedList () True l)

mkDataType cls mdoc =
  [ HS.DataDecl (case mdoc of
                   Nothing -> Nothing
                   Just d -> case d ^. D.brief_description of
                              D.FirstJSON x -> preComment (T.unpack $
                                                          D.convertDoc $
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
    $ [dec| instance HasBaseClass ((cty)) where
        type BaseClass ((cty)) = ((bty))
        super = coerce |] ]
  where
    asVariantRule = HS.IRule () Nothing Nothing $ HS.IHCon () (HS.UnQual () $ HS.Ident () "AsVariant")
    cty = clsTy cls
    bty = baseClsTy cls

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
      preComment (T.unpack $ D.convertDoc d)
    argToHsType (GodotArgument _ ty _) = toHsType ty
    mkSignal sig 
      = let sigStr = T.unpack (sig ^. name)
            sigName = HS.Ident () ("sig_" ++ sigStr)
        in [ HS.TypeSig (signalDoc (sig ^. name) mdoc) [noComments $ sigName] (noComments $ HS.TyApp () sigTy (clsTy cls))
           , noComments $ HS.PatBind () (HS.PVar () sigName) (
               HS.UnGuardedRhs () $ HS.App () sigCon $ HS.Lit () $ HS.String () sigStr sigStr
           ) Nothing
           , let cty = clsTy cls
                 args = promotedList $ map argToHsType $ V.toList $ sig ^. arguments
                 st = promotedString sigStr
             in noComments [dec|instance NodeSignal ((cty)) ((st)) ((args))|]
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
      preComment (T.unpack $ D.convertDoc d))
    <|> (do
            mems <- D.unOption <$> (HM.lookup (T.pack "member") =<< D._gdMembers doc)
            doc <- V.find (\e -> e ^. D.getter == name || e ^. D.setter == name) mems
            d <- doc ^. D.value
            preComment (T.unpack $ D.convertDoc d))

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
        , let cty = clsTy cls
              name = promotedString rawMethodName
              args = promotedList $ V.toList methodArgs
              ret = toHsType $ method ^. returnType
              mname = classModuleName <> "." <> methodName
          in noComments $
            [dec|instance NodeMethod ((cty)) ((name)) ((args)) (IO ((ret)) ) where nodeMethod = __mname__ |]
        ]
  where
    clsName = HS.TyCon () (HS.UnQual () (clsAsName cls))
    clsMethodBindName = HS.Ident () $ "bind" ++ (T.unpack $ mangleClass (cls ^. name)) ++ "_" ++ methodName
    clsMethodBindVar = HS.Var () $ HS.UnQual () clsMethodBindName
    clsMethodBindRhs = HS.UnGuardedRhs ()
      [hs| unsafePerformIO $ withCString $(HS.strE (T.unpack $ cls ^. name)) $
         \clsNamePtr -> withCString $(HS.strE rawMethodName) $
         \methodNamePtr -> godot_method_bind_get_method clsNamePtr methodNamePtr |]
    classModuleName = "Godot." ++ (pascal $ T.unpack (cls ^. apiType)) ++ "." ++ (T.unpack $ mangleClass $ cls ^. name)
    runMethodRhs = HS.UnGuardedRhs () $ HS.App () (
      HS.App ()
        (HS.Var () (HS.UnQual () (HS.Ident () "withVariantArray")))
        (let a = HS.List () $ zipWith (\a an -> wrapDefault a an) (V.toList $ method ^. arguments) argNames
        in if method ^. hasVarargs then
            [hs|$a ++ varargs|] else
            a))
      [hs|
        \(arrPtr, len) -> godot_method_bind_call $(clsMethodBindVar) (upcast cls) arrPtr len >>=
        \(err, res) -> throwIfErr err >> fromGodotVariant res |]

    wrapDefault (GodotArgument _ ty Nothing) v = mkToVariant v
    wrapDefault (GodotArgument _ ty (Just d)) v = mkDefault ty d (HS.Var () $ HS.UnQual () v)

    mkDefault :: GType -> Text -> HS.Exp () -> HS.Exp ()
    mkDefault (PrimitiveType IntType) d v = [hs|maybe (VariantInt (__dt__)) toVariant $v |]
      where dt = T.unpack d
    mkDefault (PrimitiveType FloatType) d v = [hs|maybe (VariantReal (__dt__)) toVariant $v |]
      where dt = T.unpack d
    mkDefault (PrimitiveType BoolType) d v = [hs|maybe (VariantBool __dt__) toVariant $v |]
      where dt = T.unpack d
    mkDefault (CoreType "Color") "1,1,1,1" v = [hs|defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) $v |]
    mkDefault (CoreType "Rect2") "(0, 0, 0, 0)" v = [hs|defaultedVariant VariantRect2 (V2 (V2 0 0) (V2 0 0)) $v |]
    mkDefault (CoreType "PoolStringArray") "[]" v = [hs|defaultedVariant VariantPoolStringArray V.empty $v |]
    mkDefault (CoreType "Dictionary") "{}" v = [hs|defaultedVariant VariantDictionary V.empty $v |]
    mkDefault (CoreType "PoolVector2Array") "[]" v = [hs|defaultedVariant VariantPoolVector2Array V.empty $v |]
    mkDefault (CoreType "PoolVector3Array") "[]" v = [hs|defaultedVariant VariantPoolVector3Array V.empty $v |]
    mkDefault (CoreType "PoolIntArray") "[]" v = [hs|defaultedVariant VariantPoolIntArray V.empty $v |]
    mkDefault (CoreType "PoolRealArray") "[]" v = [hs|defaultedVariant VariantPoolRealArray V.empty $v |]
    mkDefault (CoreType "PoolColorArray") "[PoolColorArray]" v = [hs|defaultedVariant VariantPoolColorArray V.empty $v |]
    mkDefault (CoreType "Array") "[]" v = [hs|defaultedVariant VariantArray V.empty $v |]
    mkDefault (CoreType "Vector2") "(-1, -1)" v = [hs|defaultedVariant VariantVector2 (V2 (-1) (-1)) $v |]
    mkDefault (CoreType "Vector2") "(0, 0)" v = [hs|defaultedVariant VariantVector2 (V2 0 0) $v |]
    mkDefault (CoreType "Vector3") "(0, 0, 0)" v = [hs|defaultedVariant VariantVector3 (V3 0 0 0) $v |]
    mkDefault (CoreType "Transform2D") "((1, 0), (0, 1), (0, 0))" v = [hs|defaultedVariant VariantTransform2d (TF2d (V2 1 0) (V2 0 1) (V2 0 0)) $v |]
    mkDefault (CoreType "Transform") "1, 0, 0, 0, 1, 0, 0, 0, 1 - 0, 0, 0" v = [hs|defaultedVariant VariantTransform (TF (V3 (V3 1 0 0) (V3 0 1 0) (V3 0 0 1)) (V3 0 0 0)) $v |]
    -- TODO Is this right?
    mkDefault (CoreType "RID") "[RID]" v = [hs|maybe VariantNil toVariant $v |]
    mkDefault (CoreType "String") d v = [hs|defaultedVariant VariantString __dt__ $v  |]
      where dt = "\"" <> T.unpack d <> "\""
    mkDefault _ "Null"          v = [hs|maybe VariantNil toVariant $v |]
    mkDefault _ "0"             v = [hs|maybe (VariantInt 0) toVariant $v |]
    mkDefault _ "1"             v = [hs|maybe (VariantInt 1) toVariant $v |]
    mkDefault _ "[Object:null]" v = [hs|maybe VariantNil toVariant $v |]
    mkDefault t d _ = error $ "Don't know how to make defaults for this type (" ++ show t ++ ") for value (" ++ show d ++ ")"

    mkToVariant = HS.App () (HS.Var () (HS.UnQual () (HS.Ident () "toVariant"))) . HS.Var () . HS.UnQual ()

    argNames = map (HS.Ident () . ("arg" ++) . show) [1..length (method ^. arguments)]

    methodSig = foldr (HS.TyFun ()) (HS.TyApp () [ty|IO|] (toHsType $ method ^. returnType)) methodArgs
    methodArgs = let args = fmap argToHsType (method ^. arguments)
                 in if method ^. hasVarargs then
                      args `V.snoc` [ty|[Variant 'GodotTy]|] else
                      args

    argToHsType (GodotArgument _ ty (Just _)) =
      HS.TyApp () (HS.TyCon () $ HS.UnQual () $ HS.Ident () "Maybe") $ toHsType ty
    argToHsType (GodotArgument _ ty _) = toHsType ty

    rawMethodName = T.unpack $ method ^. name
    methodName = toMethodName (method ^. name)

toMethodName name = T.unpack (case name of
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
toHsType (CoreType ty) = nameToTyCon $ renameType ty
  where
    renameType "RID" = "Rid"
    renameType "Transform2D" = "Transform2d"
    renameType "AABB" = "Aabb"
    renameType "String" = "GodotString"
    renameType "Variant" = "GodotVariant"
    renameType x = mangleClass x
-- NB: Are these bugs in api.json? Why is the type different from anywhere else?
toHsType (CustomType "SpatialMaterial,ShaderMaterial")    = nameToTyCon "Material"
toHsType (CustomType "ShaderMaterial,CanvasItemMaterial") = nameToTyCon "Material"
toHsType (CustomType "ShaderMaterial,SpatialMaterial")    = nameToTyCon "Material"
toHsType (CustomType "ShaderMaterial,ParticlesMaterial")  = nameToTyCon "Material"
toHsType (CustomType ty) = nameToTyCon ty
toHsType (EnumType _) = [ty| Int |]
