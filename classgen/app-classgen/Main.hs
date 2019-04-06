import Classgen.Module
import Classgen.Spec
import Control.Lens
import Control.Monad.State
import Data.Maybe (mapMaybe)
import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as HM
import Language.Haskell.Exts
import System.Directory
import System.Environment
import System.Exit
import System.FilePath

main :: IO ()
main = do
  args <- getArgs
  when (length args < 1) $ do
    putStrLn "Pass API JSON as first argument"
    exitFailure
  api <- BL.readFile (head args)
  let (Just classes) = decode api :: Maybe GodotClasses
  print classes
  let state = execState (mapM_ addClass classes >> resolveMethods) (ClassgenState mempty mempty mempty)
  mapM_ writeModule (HM.elems (state ^. modules))
  writeModule $ godotApiAuto (state ^. mainDecls)


  where
    godotApiAuto decls   = Module () (Just $ classModuleHead $ classExports decls) [] classImports decls
    classModuleHead exps = ModuleHead () classModuleName Nothing (Just exps)
    classModuleName      = ModuleName () "Godot.Api.Auto"
    classExports decls   = ExportSpecList () $ tcMethod : tcHasBaseClass : mapMaybe fromNewtypeOnly decls
    tcMethod             = EThingWith () (EWildcard () 0) (UnQual () (Ident () "Method")) []
    tcHasBaseClass       = EThingWith () (EWildcard () 0) (UnQual () (Ident () "HasBaseClass")) []
    fromNewtypeOnly decl = case decl of
       DataDecl _ (NewType _) _ (DHead _ (Ident () ntName)) _ _ ->
         Just $ EAbs () (NoNamespace ()) (UnQual () (Ident () ntName))
       _ ->
         Nothing
    classImports = map (\n -> ImportDecl () (ModuleName () n) False False False Nothing Nothing Nothing)
      [ "Data.Coerce", "Foreign.C", "Godot.Internal.Dispatch"
      , "System.IO.Unsafe", "Godot.Gdnative.Internal", "Godot.Gdnative.Types"]

writeModule :: Module () -> IO ()
writeModule mdl@(Module _ (Just (ModuleHead _ (ModuleName () name) _ _)) _ _ _) = do
  let filepath = "src/" ++ map replaceDot name ++ ".hs"
  let out = prettyPrint mdl
  putStrLn name
  createDirectoryIfMissing True (takeDirectory filepath)
  writeFile filepath out

  where
    replaceDot '.' = '/'
    replaceDot c = c
    
  
