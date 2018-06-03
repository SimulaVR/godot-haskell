module Godot.Core.GodotBakedLightmap where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern BAKE_QUALITY_LOW :: Int

pattern BAKE_QUALITY_LOW = 0

pattern BAKE_QUALITY_MEDIUM :: Int

pattern BAKE_QUALITY_MEDIUM = 1

pattern BAKE_ERROR_CANT_CREATE_IMAGE :: Int

pattern BAKE_ERROR_CANT_CREATE_IMAGE = 3

pattern BAKE_ERROR_NO_MESHES :: Int

pattern BAKE_ERROR_NO_MESHES = 2

pattern BAKE_ERROR_OK :: Int

pattern BAKE_ERROR_OK = 0

pattern BAKE_MODE_CONE_TRACE :: Int

pattern BAKE_MODE_CONE_TRACE = 0

pattern BAKE_MODE_RAY_TRACE :: Int

pattern BAKE_MODE_RAY_TRACE = 1

pattern BAKE_ERROR_NO_SAVE_PATH :: Int

pattern BAKE_ERROR_NO_SAVE_PATH = 1

pattern BAKE_ERROR_USER_ABORTED :: Int

pattern BAKE_ERROR_USER_ABORTED = 4

pattern BAKE_QUALITY_HIGH :: Int

pattern BAKE_QUALITY_HIGH = 2