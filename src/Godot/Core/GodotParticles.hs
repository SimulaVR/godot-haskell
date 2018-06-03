module Godot.Core.GodotParticles where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern MAX_DRAW_PASSES :: Int

pattern MAX_DRAW_PASSES = 4

pattern DRAW_ORDER_LIFETIME :: Int

pattern DRAW_ORDER_LIFETIME = 1

pattern DRAW_ORDER_INDEX :: Int

pattern DRAW_ORDER_INDEX = 0

pattern DRAW_ORDER_VIEW_DEPTH :: Int

pattern DRAW_ORDER_VIEW_DEPTH = 2