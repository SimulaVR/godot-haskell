import Classgen.Module
import Classgen.Spec
import Control.Lens
import Control.Monad.State
import Data.Maybe (mapMaybe)
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as HM
import Language.Haskell.Exts
import Language.Haskell.Exts.SimpleComments
import System.Directory
import System.Environment
import System.Exit
import System.FilePath
import Control.Applicative
import qualified Classgen.Docs as D
import qualified Data.HashMap.Strict as H
import qualified Data.Text as T

main :: IO ()
main = do
  args <- getArgs
  when (length args /= 2) $ do
    putStrLn "godot-haskell-classgen <api.json> <godot_doc_classes.json>"
    exitFailure
  api <- BL.readFile (args !! 0)
  let (Just classes) = decode api :: Maybe GodotClasses
  doc <- BL.readFile (args !! 1)
  let (Just docs) = decode doc :: Maybe D.GodotDocs
  let docTable = D.toTable docs
  let state = execState (mapM_ (\cls -> addClass cls (H.lookup (cls ^. Classgen.Spec.name) docTable
                                                     <|> (T.stripPrefix "Godot_" (cls ^. Classgen.Spec.name)
                                                          >>= \r -> H.lookup r docTable)
                                                     <|> (T.stripPrefix "Godot" (cls ^. Classgen.Spec.name)
                                                          >>= \r -> H.lookup r docTable)
                                                     <|> (T.stripPrefix "_"  (cls ^. Classgen.Spec.name)
                                                          >>= \r -> H.lookup r docTable)
                                                     <|> (H.lookup  ("_" <> (cls ^. Classgen.Spec.name)) docTable)
                                                    )) classes)
                        (ClassgenState mempty mempty mempty)
  writeModule $ godotApiTypes (state ^. tyDecls)
  mapM_ writeModule (HM.elems (state ^. modules))
  where
    godotApiTypes decls   = Module Nothing (Just
                                            $ ModuleHead Nothing (ModuleName Nothing "Godot.Api.Types") Nothing
                                            $ Just (classExports decls))
                            [LanguagePragma Nothing [Ident Nothing "DerivingStrategies"
                                                    ,Ident Nothing "GeneralizedNewtypeDeriving"
                                                    ,Ident Nothing "TypeFamilies"
                                                    ,Ident Nothing "TemplateHaskell"]]
                            classImports
                            (decls ++ mapMaybe fromNewtypeDerivingBase decls)
    classExports decls   = ExportSpecList Nothing $ tcHasBaseClass : mapMaybe fromNewtypeOnly decls
    tcHasBaseClass       = fmap (\_ -> Nothing) $ EThingWith () (EWildcard () 0) (UnQual () (Ident () "HasBaseClass")) []
    fromNewtypeOnly decl = case decl of
       DataDecl _ (NewType _) _ (DHead _ (Ident Nothing ntName)) _ _ ->
         Just $ EThingWith Nothing (EWildcard Nothing 0) (UnQual Nothing (Ident Nothing ntName)) []
       _ ->
         Nothing
    fromNewtypeDerivingBase decl = case decl of
       DataDecl _ (NewType _) _ (DHead _ (Ident Nothing ntName)) _ _ ->
         Just $ SpliceDecl Nothing (App Nothing (Var Nothing (UnQual Nothing (Ident Nothing "deriveBase")))
                                                 (TypQuote Nothing (UnQual Nothing (Ident Nothing ntName))))
       _ ->
         Nothing
    classImports = map (\n -> ImportDecl Nothing (ModuleName Nothing n) False False False Nothing Nothing Nothing)
      [ "Data.Coerce", "Foreign.C", "Godot.Internal.Dispatch", "Godot.Gdnative.Internal"]

writeModule :: Module (Maybe CodeComment) -> IO ()
writeModule mdl@(Module _ (Just (ModuleHead _ (ModuleName Nothing name) _ _)) _ _ _) = do
  let filepath = "src/" ++ map replaceDot name ++ ".hs"
  -- let out = prettyPrint mdl
  let out = uncurry exactPrint (ppWithComments mdl)
  createDirectoryIfMissing True (takeDirectory filepath)
  writeFile filepath out
  where
    replaceDot '.' = '/'
    replaceDot c = c
