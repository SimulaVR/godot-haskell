module Godot.Core.GodotTileSet where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern BITMASK_3X3 :: Int

pattern BITMASK_3X3 = 2

pattern BITMASK_2X2 :: Int

pattern BITMASK_2X2 = 0

pattern AUTO_TILE :: Int

pattern AUTO_TILE = 1

pattern BIND_CENTER :: Int

pattern BIND_CENTER = 16

pattern BIND_TOP :: Int

pattern BIND_TOP = 2

pattern SINGLE_TILE :: Int

pattern SINGLE_TILE = 0

pattern ATLAS_TILE :: Int

pattern ATLAS_TILE = 2

pattern BIND_BOTTOM :: Int

pattern BIND_BOTTOM = 128

pattern BIND_TOPRIGHT :: Int

pattern BIND_TOPRIGHT = 4

pattern BIND_RIGHT :: Int

pattern BIND_RIGHT = 32

pattern BIND_BOTTOMRIGHT :: Int

pattern BIND_BOTTOMRIGHT = 256

pattern BITMASK_3X3_MINIMAL :: Int

pattern BITMASK_3X3_MINIMAL = 1

pattern BIND_TOPLEFT :: Int

pattern BIND_TOPLEFT = 1

pattern BIND_LEFT :: Int

pattern BIND_LEFT = 8

pattern BIND_BOTTOMLEFT :: Int

pattern BIND_BOTTOMLEFT = 64