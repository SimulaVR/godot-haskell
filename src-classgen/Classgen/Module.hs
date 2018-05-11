module Classgen.Module where

import Control.Lens
import Control.Monad.State
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HM
import qualified Data.Vector as V
import Data.Text (Text)
import qualified Data.Text as T
import Data.Set
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
  pure $ HS.Module () (Just classModuleHead) [] classImports (properties ++ methods ++ classDecls)
  pure ()
  where
    classDecls = mkSignals cls ++ mkConstants cls ++ mkEnums cls 
    classImports = [HS.ImportDecl () (HS.ModuleName () "Godot.Internal.Dispatch") False False False Nothing Nothing Nothing]
    classModuleHead = HS.ModuleHead () classModuleName Nothing Nothing
    classModuleName = HS.ModuleName () $ "Godot." ++ pascal (T.unpack (cls ^. apiType)) 
                                      ++ "." ++ pascal (T.unpack (cls ^. name))

mkProperties :: MonadState ClassgenState m => GodotClass -> m [a]
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

asName = undefined

mkDataType cls = HS.DataDecl () (HS.NewType ()) Nothing 
  (HS.DHead () $ asName cls)
  [HS.QualConDecl () Nothing Nothing $ HS.ConDecl () (asName cls) [godotObjectTy]]
  undefined

mkSignals cls = undefined
mkConstants cls = undefined
mkEnums cls = undefined
mkMethods cls = undefined
mkMethod clsname method = undefined