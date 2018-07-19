module Godot.Core.GodotTimer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TIMER_PROCESS_PHYSICS :: Int

pattern TIMER_PROCESS_PHYSICS = 0

pattern TIMER_PROCESS_IDLE :: Int

pattern TIMER_PROCESS_IDLE = 1

timeout :: Signal GodotTimer
timeout = Signal "timeout"