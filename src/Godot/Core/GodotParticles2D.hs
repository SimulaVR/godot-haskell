module Godot.Core.GodotParticles2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern DRAW_ORDER_LIFETIME :: Int

pattern DRAW_ORDER_LIFETIME = 1

pattern DRAW_ORDER_INDEX :: Int

pattern DRAW_ORDER_INDEX = 0