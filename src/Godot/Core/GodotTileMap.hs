module Godot.Core.GodotTileMap where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern HALF_OFFSET_Y :: Int

pattern HALF_OFFSET_Y = 1

pattern TILE_ORIGIN_BOTTOM_LEFT :: Int

pattern TILE_ORIGIN_BOTTOM_LEFT = 2

pattern MODE_ISOMETRIC :: Int

pattern MODE_ISOMETRIC = 1

pattern HALF_OFFSET_NEGATIVE_X :: Int

pattern HALF_OFFSET_NEGATIVE_X = 3

pattern INVALID_CELL :: Int

pattern INVALID_CELL = -1

pattern HALF_OFFSET_X :: Int

pattern HALF_OFFSET_X = 0

pattern MODE_CUSTOM :: Int

pattern MODE_CUSTOM = 2

pattern TILE_ORIGIN_TOP_LEFT :: Int

pattern TILE_ORIGIN_TOP_LEFT = 0

pattern MODE_SQUARE :: Int

pattern MODE_SQUARE = 0

pattern HALF_OFFSET_DISABLED :: Int

pattern HALF_OFFSET_DISABLED = 2

pattern HALF_OFFSET_NEGATIVE_Y :: Int

pattern HALF_OFFSET_NEGATIVE_Y = 4

pattern TILE_ORIGIN_CENTER :: Int

pattern TILE_ORIGIN_CENTER = 1

settings_changed :: Signal GodotTileMap
settings_changed = Signal "settings_changed"