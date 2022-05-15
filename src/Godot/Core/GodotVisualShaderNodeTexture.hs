module Godot.Core.GodotVisualShaderNodeTexture where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SOURCE_DEPTH :: Int

pattern SOURCE_DEPTH = 4

pattern SOURCE_SCREEN :: Int

pattern SOURCE_SCREEN = 1

pattern TYPE_NORMALMAP :: Int

pattern TYPE_NORMALMAP = 2

pattern TYPE_DATA :: Int

pattern TYPE_DATA = 0

pattern SOURCE_2D_NORMAL :: Int

pattern SOURCE_2D_NORMAL = 3

pattern TYPE_COLOR :: Int

pattern TYPE_COLOR = 1

pattern SOURCE_PORT :: Int

pattern SOURCE_PORT = 5

pattern SOURCE_2D_TEXTURE :: Int

pattern SOURCE_2D_TEXTURE = 2

pattern SOURCE_TEXTURE :: Int

pattern SOURCE_TEXTURE = 0