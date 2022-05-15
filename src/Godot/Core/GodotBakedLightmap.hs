module Godot.Core.GodotBakedLightmap where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ENVIRONMENT_MODE_CUSTOM_COLOR :: Int

pattern ENVIRONMENT_MODE_CUSTOM_COLOR = 3

pattern BAKE_QUALITY_HIGH :: Int

pattern BAKE_QUALITY_HIGH = 2

pattern ENVIRONMENT_MODE_SCENE :: Int

pattern ENVIRONMENT_MODE_SCENE = 1

pattern ENVIRONMENT_MODE_CUSTOM_SKY :: Int

pattern ENVIRONMENT_MODE_CUSTOM_SKY = 2

pattern BAKE_ERROR_NO_SAVE_PATH :: Int

pattern BAKE_ERROR_NO_SAVE_PATH = 1

pattern BAKE_ERROR_USER_ABORTED :: Int

pattern BAKE_ERROR_USER_ABORTED = 6

pattern BAKE_ERROR_INVALID_MESH :: Int

pattern BAKE_ERROR_INVALID_MESH = 5

pattern BAKE_QUALITY_ULTRA :: Int

pattern BAKE_QUALITY_ULTRA = 3

pattern BAKE_ERROR_OK :: Int

pattern BAKE_ERROR_OK = 0

pattern BAKE_ERROR_NO_MESHES :: Int

pattern BAKE_ERROR_NO_MESHES = 2

pattern BAKE_ERROR_NO_ROOT :: Int

pattern BAKE_ERROR_NO_ROOT = 8

pattern BAKE_ERROR_LIGHTMAP_SIZE :: Int

pattern BAKE_ERROR_LIGHTMAP_SIZE = 4

pattern BAKE_QUALITY_MEDIUM :: Int

pattern BAKE_QUALITY_MEDIUM = 1

pattern BAKE_QUALITY_LOW :: Int

pattern BAKE_QUALITY_LOW = 0

pattern BAKE_ERROR_NO_LIGHTMAPPER :: Int

pattern BAKE_ERROR_NO_LIGHTMAPPER = 7

pattern ENVIRONMENT_MODE_DISABLED :: Int

pattern ENVIRONMENT_MODE_DISABLED = 0

pattern BAKE_ERROR_CANT_CREATE_IMAGE :: Int

pattern BAKE_ERROR_CANT_CREATE_IMAGE = 3