{-# LANGUAGE NoMonoLocalBinds, NoMonomorphismRestriction #-}
module Classgen.Module where

import Control.Lens
import Control.Monad.State
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HM
import qualified Data.Vector as V
import Data.Text (Text)
import qualified Data.Text as T
import Data.Set (Set)
import qualified Data.Set as S
import qualified Language.Haskell.Exts as HS
import Text.Casing
import Classgen.Spec



data ClassgenState = ClassgenState
  { _csModules :: !(HashMap Text (HS.Module ()))
  , _csMethods :: !(HashMap Text (HS.Decl ()))
  , _csClasses :: !(Set Text)
  } deriving (Show, Eq) 

makeLensesWith abbreviatedFields ''ClassgenState

addClass :: MonadState ClassgenState m => GodotClass -> m ()
addClass cls = do
  classes %= S.insert (cls ^. name)
  properties <- mkProperties cls
  methods <- mkMethods cls
  signals <- mkSignals cls 
  pure $ HS.Module () (Just classModuleHead) [] classImports (properties ++ signals ++ methods ++ classDecls)
  pure ()
  where
    classDecls = mkConstants cls ++ mkEnums cls 
    classImports = [HS.ImportDecl () (HS.ModuleName () "Godot.Internal.Dispatch") False False False Nothing Nothing Nothing]
    classModuleHead = HS.ModuleHead () classModuleName Nothing Nothing
    classModuleName = HS.ModuleName () $ "Godot." ++ pascal (T.unpack (cls ^. apiType)) 
                                      ++ "." ++ pascal (T.unpack (cls ^. name))

mkProperties :: MonadState ClassgenState m => GodotClass -> m [HS.Decl ()]
mkProperties cls = concat <$> mapM mkProperty (V.toList $ cls ^. properties)
  where
    mkProperty prop = sequence
      [ mkMethod (cls ^. name) $ GodotMethod (prop ^. getter)
                   (prop ^.  type') False False True False False False False mempty
      , mkMethod (cls ^. name) $ GodotMethod (prop ^. setter)
                   (PrimitiveType VoidType) False False False False False False False
                   (V.singleton $ GodotArgument (prop ^. name) (prop ^. type') Nothing)]


godotObjectTy :: HS.Type ()
godotObjectTy = undefined

sigCon :: HS.Exp ()
sigCon = HS.Con () $ HS.UnQual () $ HS.Ident () "Signal"

sigTy :: HS.Type ()
sigTy = HS.TyCon () $ HS.UnQual () $ HS.Ident () "Signal"

clsAsName = undefined
clsTy = HS.TyCon () . HS.UnQual () . clsAsName

intTy = HS.TyCon () . HS.UnQual () $ HS.name "Int"

mkDataType cls = HS.DataDecl () (HS.NewType ()) Nothing 
  (HS.DHead () $ clsAsName cls)
  [HS.QualConDecl () Nothing Nothing $ HS.ConDecl () (clsAsName cls) [godotObjectTy]]
  []

mkSignals :: MonadState ClassgenState m => GodotClass -> m [HS.Decl ()]
mkSignals cls = return $ concatMap mkSignal (V.toList $ cls ^. signals)
  where
    mkSignal sig 
      = let sigStr = T.unpack (sig ^. name)
            sigName = HS.Ident () sigStr
        in [ HS.TypeSig () [sigName] (HS.TyApp () sigTy (clsTy cls))
           , HS.PatBind () (HS.PVar () sigName) (
               HS.UnGuardedRhs () $ HS.App () sigCon $ HS.Lit () $ HS.String () sigStr sigStr
           ) Nothing ]

mkConstants :: GodotClass -> [HS.Decl ()]
mkConstants cls = concatMap mkConstant (HM.toList $ cls ^. constants)
  where
    mkConstant (cname, cval) 
      = let constName = HS.Ident () $ T.unpack cname
        in [ HS.PatSynSig ()  [constName] Nothing Nothing Nothing intTy
           , HS.PatSyn () (HS.PVar () constName) (HS.intP $ fromIntegral cval) HS.ImplicitBidirectional
           ]

mkEnums cls = [] -- i don't think enums have a point
mkMethods cls = mapM (mkMethod (cls ^. name)) (V.toList $ cls ^. methods)
mkMethod clsname method = do
  return $ HS.InstDecl () Nothing instRule (Just instDecls)
  where
    instRule = HS.IRule () Nothing Nothing instHead
    instHead = foldl (HS.IHApp ()) methodClsTy (V.toList undefined)
    instDecls = undefined
    methodClsTy = undefined
  {-
  instance Method "methodName" ClsName (generated -> signature) where
    runMethod cls arg1..argn = withVariantArray [asVariant arg1, ..., asVariant argn] $ 
      \(arrPtr, len) -> godot_method_bind_call clsMethodNameBind (coerce cls) arrPtr len >>=
      \(res, err) -> throwIfErr err >> return (coerce res)
  -}