module Godot.Tools.GodotEditorSceneImporter where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern IMPORT_ANIMATION :: Int

pattern IMPORT_ANIMATION = 2

pattern IMPORT_FAIL_ON_MISSING_DEPENDENCIES :: Int

pattern IMPORT_FAIL_ON_MISSING_DEPENDENCIES = 512

pattern IMPORT_SCENE :: Int

pattern IMPORT_SCENE = 1

pattern IMPORT_ANIMATION_OPTIMIZE :: Int

pattern IMPORT_ANIMATION_OPTIMIZE = 8

pattern IMPORT_ANIMATION_KEEP_VALUE_TRACKS :: Int

pattern IMPORT_ANIMATION_KEEP_VALUE_TRACKS = 32

pattern IMPORT_MATERIALS_IN_INSTANCES :: Int

pattern IMPORT_MATERIALS_IN_INSTANCES = 1024

pattern IMPORT_ANIMATION_FORCE_ALL_TRACKS_IN_ALL_CLIPS :: Int

pattern IMPORT_ANIMATION_FORCE_ALL_TRACKS_IN_ALL_CLIPS = 16

pattern IMPORT_GENERATE_TANGENT_ARRAYS :: Int

pattern IMPORT_GENERATE_TANGENT_ARRAYS = 256

pattern IMPORT_ANIMATION_DETECT_LOOP :: Int

pattern IMPORT_ANIMATION_DETECT_LOOP = 4