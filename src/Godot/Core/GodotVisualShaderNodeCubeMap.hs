module Godot.Core.GodotVisualShaderNodeCubeMap where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TYPE_NORMALMAP :: Int

pattern TYPE_NORMALMAP = 2

pattern TYPE_DATA :: Int

pattern TYPE_DATA = 0

pattern TYPE_COLOR :: Int

pattern TYPE_COLOR = 1

pattern SOURCE_PORT :: Int

pattern SOURCE_PORT = 1

pattern SOURCE_TEXTURE :: Int

pattern SOURCE_TEXTURE = 0