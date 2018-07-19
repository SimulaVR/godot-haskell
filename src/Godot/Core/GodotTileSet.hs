module Godot.Core.GodotTileSet where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern BITMASK_2X2 :: Int

pattern BITMASK_2X2 = 0

pattern BITMASK_3X3 :: Int

pattern BITMASK_3X3 = 1

pattern BIND_BOTTOMLEFT :: Int

pattern BIND_BOTTOMLEFT = 64

pattern BIND_LEFT :: Int

pattern BIND_LEFT = 8

pattern BIND_RIGHT :: Int

pattern BIND_RIGHT = 32

pattern BIND_TOPLEFT :: Int

pattern BIND_TOPLEFT = 1

pattern BIND_BOTTOM :: Int

pattern BIND_BOTTOM = 128

pattern BIND_BOTTOMRIGHT :: Int

pattern BIND_BOTTOMRIGHT = 256

pattern BIND_TOP :: Int

pattern BIND_TOP = 2

pattern BIND_TOPRIGHT :: Int

pattern BIND_TOPRIGHT = 4