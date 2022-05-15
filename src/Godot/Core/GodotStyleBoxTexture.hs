module Godot.Core.GodotStyleBoxTexture where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern AXIS_STRETCH_MODE_TILE :: Int

pattern AXIS_STRETCH_MODE_TILE = 1

pattern AXIS_STRETCH_MODE_TILE_FIT :: Int

pattern AXIS_STRETCH_MODE_TILE_FIT = 2

pattern AXIS_STRETCH_MODE_STRETCH :: Int

pattern AXIS_STRETCH_MODE_STRETCH = 0

texture_changed :: Signal GodotStyleBoxTexture
texture_changed = Signal "texture_changed"