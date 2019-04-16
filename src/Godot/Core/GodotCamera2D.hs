module Godot.Core.GodotCamera2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ANCHOR_MODE_FIXED_TOP_LEFT :: Int

pattern ANCHOR_MODE_FIXED_TOP_LEFT = 0

pattern CAMERA2D_PROCESS_PHYSICS :: Int

pattern CAMERA2D_PROCESS_PHYSICS = 0

pattern CAMERA2D_PROCESS_IDLE :: Int

pattern CAMERA2D_PROCESS_IDLE = 1

pattern ANCHOR_MODE_DRAG_CENTER :: Int

pattern ANCHOR_MODE_DRAG_CENTER = 1