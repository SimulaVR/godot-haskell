module Godot.Core.GodotOccluderPolygon2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern CULL_CLOCKWISE :: Int

pattern CULL_CLOCKWISE = 1

pattern CULL_DISABLED :: Int

pattern CULL_DISABLED = 0

pattern CULL_COUNTER_CLOCKWISE :: Int

pattern CULL_COUNTER_CLOCKWISE = 2