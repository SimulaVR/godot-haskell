module Godot.Tools.GodotEditorFeatureProfile where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FEATURE_IMPORT_DOCK :: Int

pattern FEATURE_IMPORT_DOCK = 6

pattern FEATURE_ASSET_LIB :: Int

pattern FEATURE_ASSET_LIB = 2

pattern FEATURE_SCENE_TREE :: Int

pattern FEATURE_SCENE_TREE = 3

pattern FEATURE_MAX :: Int

pattern FEATURE_MAX = 7

pattern FEATURE_3D :: Int

pattern FEATURE_3D = 0

pattern FEATURE_FILESYSTEM_DOCK :: Int

pattern FEATURE_FILESYSTEM_DOCK = 5

pattern FEATURE_SCRIPT :: Int

pattern FEATURE_SCRIPT = 1

pattern FEATURE_NODE_DOCK :: Int

pattern FEATURE_NODE_DOCK = 4