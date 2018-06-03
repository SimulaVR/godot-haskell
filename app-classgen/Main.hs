import Classgen.Module
import Classgen.Spec
import Control.Lens
import Control.Monad.State
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
  let state = execState (mapM_ addClass classes >> resolveMethods) (ClassgenState mempty mempty)
  mapM_ writeModule (HM.elems (state ^. modules))

writeModule :: Module () -> IO ()
writeModule mdl@(Module _ (Just (ModuleHead _ (ModuleName () name) _ _)) _ _ _) = do
  let filepath = "src/" ++ map replaceDot name ++ ".hs"
  let out = prettyPrint mdl
  createDirectoryIfMissing True (takeDirectory filepath)
  writeFile filepath out

  where
    replaceDot '.' = '/'
    replaceDot c = c
  
