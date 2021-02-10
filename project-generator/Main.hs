{-# LANGUAGE OverloadedStrings, MultiWayIf, TemplateHaskell, TupleSections #-}
{-# LANGUAGE QuasiQuotes, GeneralizedNewtypeDeriving #-}

module Main where
import System.Environment
import Control.Monad
import System.Directory
import System.FSNotify
import Control.Concurrent (threadDelay)
import Control.Monad (forever)
import Data.List
import System.FilePath
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Char
import qualified Data.Map as M
import Data.String.Interpolate
import Data.Maybe
import Debug.Trace
import Control.Lens
import Control.Lens.TH
import Prelude hiding (id)

newtype Id = Id { unId :: T.Text}
  deriving (Eq, Ord)
  deriving newtype (Show)

newtype Name = Name { unName :: T.Text }
  deriving (Eq, Ord)
  deriving newtype (Show)

newtype Ty = Ty { unTy :: T.Text }
  deriving (Eq, Ord)
  deriving newtype (Show)

newtype Parent = Parent { unParent :: T.Text }
  deriving (Eq, Ord)
  deriving newtype (Show)

data Resource = Resource { _resourceTy :: Ty
                         , _resourcePath :: T.Text }
  deriving (Show)
makeFields ''Resource

data TscnNode = TscnNode { _tscnNodeTy :: Ty
                         , _tscnNodeParent :: Maybe Parent
                         , _tscnNodeInstanceof :: Maybe Id
                         , _tscnNodeScript :: Maybe Id
                         }
  deriving (Show)
makeFields ''TscnNode

data Tscn = Tscn { _tscnSceneName :: Name
                 , _tscnResources :: M.Map Id Resource
                 , _tscnNodes :: M.Map Name TscnNode
                 }
  deriving (Show)
makeFields ''Tscn

data Gdns = Gdns { _gdnsExtResources :: M.Map Id Resource
                 , _gdnsResources :: M.Map Name Id
                 }
  deriving (Show)
makeFields ''Gdns

allByExtension :: String -> FilePath -> IO [String]
allByExtension ext dir = do
  b <- doesDirectoryExist dir
  if b then do
    l <- map (dir </>) <$> listDirectory dir
    tscns <- filterM (\f -> (&& isSuffixOf ext f) <$> doesFileExist f) l
    dirs <- filterM doesDirectoryExist l
    (tscns ++) . concat <$> mapM (allByExtension ext) dirs
    else
    pure []

mangle (h:t) = toUpper h : t

support = [i|
module Project.Support where
import Godot
import GHC.TypeLits
import Godot.Nativescript
import Godot.Core.Object
import Godot.Internal.Dispatch
import Godot.Gdnative.Internal.Types
import Data.Typeable
import qualified Data.Text as T

-- * Scene information
--
-- This keeps your Haskell types in sync with the Godot project

-- | A node in the scene, we know its type and its name, @s@ is the path relate
-- to the scene
class (Typeable (SceneNodeType scene s), AsVariant (SceneNodeType scene s)) => SceneNode (scene :: Symbol) (s :: Symbol) where
  type SceneNodeType scene s :: *
  type SceneNodeName scene s :: Symbol
  type SceneNodeIsHaskell scene s :: Maybe (Symbol, Symbol)

-- | You declare this for your types. You offer up a haskell type, @n, for the
-- node. This class verifies that your base class is correct.
class (HasBaseClass n, BaseClass n ~ SceneNodeType scene s) =>
      NodeInScene (scene :: Symbol) (s :: Symbol) n | scene s -> n, n -> scene s

-- | Internal, just for convenience
data OneSceneNode (scene :: Symbol) (name :: Symbol)

registerOne :: forall ty. (NativeScript ty, AsVariant (BaseClass ty)) => GdnativeHandle -> IO ()
registerOne desc = registerClass $ RegClass desc $ classInit @ty

-- | Internal. Don't touch this and don't make instances of it. It's the
-- workhorse for making sure that you are implementing all of the classes that
-- Godot needs, nothing more and nothing less.
class ImplementedInHaskell (a :: [*]) (b :: [*]) where
  fill :: GdnativeHandle -> IO ()

instance ImplementedInHaskell '[] '[] where
  fill _ = pure ()

instance (NodeInScene scene name n,
          NativeScript n, AsVariant (BaseClass n),
          ImplementedInHaskell t t')
          => ImplementedInHaskell (OneSceneNode scene name ': t) (n ': t') where
  fill handle = do
    registerOne @n handle
    fill @t @t' handle

-- | You will use this in your exports
-- exports :: GdnativeHandle -> IO ()
-- exports desc = registerAll' @Nodes @'[HUD, Main, Mob, Player] desc
registerAll' :: forall (res :: [*]) (ns :: [*]). ImplementedInHaskell res ns => GdnativeHandle -> IO ()
registerAll' = fill @res @ns

getNode' :: forall label b cls scene name. (Object :< cls, Node :< cls,
                                      Node :< b,
                                      NodeInScene scene name cls,
                                      SceneNode scene label,
                                      SceneNodeType scene label ~ b,
                                      KnownSymbol label)
         => cls -> IO b
getNode' o = getNode @(SceneNodeType scene label) o (T.pack $ symbolVal (Proxy @label))

getNodeNativeScript' :: forall label b cls scene name scene' label'.
                        (NativeScript b, Node :< cls, Object :< cls, NodeInScene scene name cls,
                         SceneNodeIsHaskell scene label ~ 'Just '(scene', label'),
                         NodeInScene scene' label' b,
                         KnownSymbol label)
                     => cls -> IO b
getNodeNativeScript' cls = getNodeNativeScript @b cls (T.pack $ symbolVal (Proxy @label))

-- TODO We don't check arguments! We need singletons for args.
emit_signal' :: forall label args cls.
               (Object :< cls, Object :< cls, NodeSignal cls label args, KnownSymbol label)
             => cls -> [Variant 'GodotTy] -> IO ()
emit_signal' cls args = do
  name <- toLowLevel (T.pack $ symbolVal (Proxy @label))
  emit_signal cls name args

-- TODO args ~ '[] is temproary, we need signeltons to reflect this into a runtime value
signal' :: forall cls label args.
          (NodeSignal cls label args, KnownSymbol label, args ~ '[])
        => (Text, [SignalArgument])
signal' = signal (T.pack $ symbolVal (Proxy @label)) []
|]

language = [i|{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables #-}
|]

mkModule qualifiedName = T.pack [i|module Project.Scenes.#{qualifiedName} where
import Project.Support
import Godot
import GHC.TypeLits
|]

mkSceneNode scene name path ty isHaskell = T.pack [i|
instance SceneNode        "#{scene}" "#{path}" where
  type SceneNodeType      "#{scene}" "#{path}" = #{ty}
  type SceneNodeName      "#{scene}" "#{path}" = "#{name'}"
  type SceneNodeIsHaskell "#{scene}" "#{path}" = #{hsNode}
|]
  where name' = T.pack name
        hsNode = case isHaskell of
                   Nothing -> "'Nothing"
                   Just (Name s, Name n) -> "'Just '(\"" <> s <> "\", \"" <> n <> "\")"

after x = T.drop (T.length x) . snd . T.breakOn x

rowType   = Ty . T.takeWhile (/= '\"') . after "type=\""
rowPath   = T.takeWhile (/= '\"') . after "path=\"res://"
rowName   = Name . T.takeWhile (/= '\"') . after "name=\""
rowParent t = Parent <$> if T.isInfixOf " parent=\"" t then
                         Just $ T.takeWhile (/= '\"') $ after "parent=\"" t else
                         Nothing
rowId     = Id . T.takeWhile isNumber . after "id="
rowInstance t = Id <$> if T.isInfixOf " instance=ExtResource( " t then
                       Just $ T.takeWhile isNumber $ after " instance=ExtResource( " t else
                       Nothing
resClassName = Name  . T.takeWhile (/= '\"') . after "class_name = \""
resScript = Id . T.takeWhile isNumber . after "script = ExtResource( "
resLibrary   = Id . T.takeWhile isNumber . after "library = ExtResource( "

readTscn fn = do
  b <- doesFileExist fn
  let tscnName = Name $ T.pack $ takeBaseName fn
  if b then do
    f <- T.lines <$> T.readFile fn
    case f of
      (h:l) -> do
        if T.isPrefixOf "[gd_scene " h then
          pure $ fst $ foldl' (\(s,current) t ->
                            if | T.isPrefixOf "[ext_resource " t ->
                                   (s & resources . at (rowId t) ?~ Resource (rowType t) (rowPath t)
                                   , current)
                               | T.isPrefixOf "[node " t ->
                                   (s & nodes . at (rowName t) ?~ TscnNode (rowType t) (rowParent t) (rowInstance t) Nothing
                                   , Just $ rowName t )
                               | T.isPrefixOf "script = ExtResource( " t ->
                                   case current of
                                     Just name -> (s & nodes . ix name . script ?~ resScript t, current)
                               | otherwise -> (s, current)) (Tscn tscnName M.empty M.empty, Nothing) l
          else
          pure $ Tscn tscnName M.empty M.empty
    else
    pure $ Tscn tscnName M.empty M.empty

readGdns fn = do
  b <- doesFileExist fn
  if b then do
    f <- T.lines <$> T.readFile fn
    case f of
      (h:l) -> do
        if T.isPrefixOf "[gd_resource type=\"NativeScript\" " h then
          pure $ fst $ foldl' (\(s, current) t ->
                            if | T.isPrefixOf "[ext_resource " t ->
                                   (s & extResources . at (rowId t) ?~ Resource (rowType t) (rowPath t), current)
                               | T.isPrefixOf "[" t -> (s, Nothing) -- Reset on any new heading
                               | T.isPrefixOf "class_name =" t -> (s, Just $ resClassName t)
                               | T.isPrefixOf "library = " t -> (s & resources . at (fromJust current) ?~ resLibrary t
                                                               , current)
                               | otherwise -> (s, current)) (Gdns M.empty M.empty, Nothing) l
          else
          pure $ Gdns M.empty M.empty
    else
    pure $ Gdns M.empty M.empty

main :: IO ()
main = do
  args <- getArgs
  case args of
    [inDir, outDir] -> do
      let regenerate = do
            print "Regenerating ..."
            print =<< allByExtension ".gdns" inDir
            print =<< allByExtension ".tscn" inDir
            b <- doesDirectoryExist (outDir </> "Project")
            when b $ removeDirectoryRecursive (outDir </> "Project")
            createDirectoryIfMissing True (outDir </> "Project" </> "Scenes")
            outputSupport outDir
            --
            tscns <- M.fromList <$> (mapM (\f -> (T.pack $ makeRelative inDir f,) <$> readTscn f) =<< allByExtension ".tscn" inDir)
            gdnss <- M.fromList <$> (mapM (\f -> (T.pack $ makeRelative inDir f,) <$> readGdns f) =<< allByExtension ".gdns" inDir)
            --
            mapM_ (\(fn,t) -> outputTscn (segmentsTscnName inDir fn t) (moduleTscnName inDir fn t) outDir t tscns gdnss) $ M.toList tscns
            outputCombined inDir outDir tscns
            outputGdnss outDir gdnss
            print "Generatd!"
            print "Watching ... ctrl+c to stop"
      regenerate
      withManager $ \mgr -> do
        watchDir
          mgr
          inDir
          (\e -> let ext = takeExtension (eventPath e)
                in ext == ".gdns" || ext == ".tscn")
          (\a -> do
              regenerate
              print a)
        forever $ threadDelay 1000000
    _ -> error "Usage: godot-haskell-parse-game <godot-project-directory> <output-directory>"

segmentsTscnName :: FilePath -> T.Text -> Tscn -> [[Char]]
segmentsTscnName inDir tscnFilepath tscn =
  map mangle $ filter (/= ".") $ splitPath $ takeDirectory $ T.unpack tscnFilepath

moduleTscnName :: FilePath -> T.Text -> Tscn -> [Char]
moduleTscnName inDir tscnFilepath tscn =
  mangle $ takeBaseName $ T.unpack tscnFilepath

outputTscn :: [FilePath] -> FilePath -> FilePath -> Tscn -> M.Map T.Text Tscn -> M.Map T.Text Gdns -> IO ()
outputTscn segmentsTscnName moduleName outDir tscn tscns gdnss = do
  T.writeFile (normalise $ outDir </> "Project" </> "Scenes" </> joinPath segmentsTscnName </> moduleName <> ".hs") $
    T.unlines ([T.pack language, mkModule (intercalate "." (segmentsTscnName <> [moduleName]))]
               ++ map (\(name,node) -> mkSceneNode moduleName (T.unpack $ unName name)
                                            (case node ^. parent of
                                                    Nothing -> unName name
                                                    Just (Parent ".") -> unName name
                                                    Just (Parent p') -> p' <> "/" <> unName name)
                                            (case (node ^. ty, node ^. instanceof) of
                                                (Ty "", Just i) -> case M.lookup i (tscn ^. resources) of
                                                                 Just r -> r ^. ty
                                                                 Nothing -> error $ "Can't look up type of " ++ show (name,node)
                                                (t, _) -> t)
                                            (isHaskellNode name node tscn tscns gdnss))
                     (M.toList $ tscn ^. nodes))

isHaskellNode :: Name -> TscnNode -> Tscn -> M.Map T.Text Tscn -> M.Map T.Text Gdns -> Maybe (Name, Name)
isHaskellNode name node tscn tscns gdnss = 
  case ((\f -> tscn ^? resources . at f . _Just . path) =<< (node ^. script), node ^. instanceof) of
    (Just p, _) -> case gdnss ^. at p of
                    Just g -> if isHaskellGdns name g then
                               Just (tscn ^. sceneName, name) else
                               Nothing
    (_, Just i) -> let t = tscns ^. at (tscn ^. resources . at i . _Just . path)
                  in case (t, rootNodeTscn (fromJust t)) of
                       (Just t', Just (n,r)) -> isHaskellNode n r t' tscns gdnss
                       _ -> Nothing
    _ -> Nothing

isHaskellGdns :: Name -> Gdns -> Bool
isHaskellGdns n gdns =
  maybe False (\f -> maybe False isHaskellResource (gdns ^. extResources . at f)) (gdns ^. resources . at n)

isHaskellResource :: Resource -> Bool
isHaskellResource r = T.isSuffixOf ".gdnlib" $ r ^. path 

rootNodeTscn :: Tscn -> Maybe (Name, TscnNode)
rootNodeTscn tscn = find (\(name,node) -> isNothing (node^.parent)) $ M.toList $ tscn ^. nodes

outputCombined inDir outDir tscns = do
  let imports = unlines $ map (\(fn,t) -> let f = intercalate "." $ segmentsTscnName inDir fn t <> [moduleTscnName inDir fn t]
                                         in [i|import qualified Project.Scenes.#{f} as M|]) $ M.toList tscns 
  writeFile (outDir </> "Project" </> "Scenes.hs")
    [i|module Project.Scenes (module M) where
#{imports}
|]
  
outputSupport dir = writeFile (dir </> "Project" </> "Support.hs") (language ++ support)

mkRequirementsModule gdnss = T.pack [i|module Project.Requirements where
import Project.Support

type Nodes = '[#{reqs}]
|]
  where reqs = intercalate ", " $ map one $ sort $ concatMap mkRequirement gdnss
        one name = [i|OneSceneNode "#{name}" "#{name}"|]

outputGdnss :: FilePath -> M.Map T.Text Gdns -> IO ()
outputGdnss dir gdnss = T.writeFile (dir </> "Project" </> "Requirements.hs") $ mkRequirementsModule $ map snd $ M.toList gdnss

mkRequirement :: Gdns -> [T.Text]
mkRequirement gdns = mapMaybe (\(n,i) ->
                            case M.lookup i (gdns ^. extResources) of
                              Just r -> if T.isInfixOf ".gdnlib" (r ^. path) && unTy (r ^. ty) == "GDNativeLibrary" then
                                         Just $ unName n else
                                         Nothing
                              _ -> Nothing)
                   $ M.toList $ gdns ^. resources
