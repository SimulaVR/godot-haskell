module Godot.Core.GodotAnimationPlayer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ANIMATION_PROCESS_PHYSICS :: Int

pattern ANIMATION_PROCESS_PHYSICS = 0

pattern ANIMATION_PROCESS_IDLE :: Int

pattern ANIMATION_PROCESS_IDLE = 1

animation_started :: Signal GodotAnimationPlayer
animation_started = Signal "animation_started"

animation_changed :: Signal GodotAnimationPlayer
animation_changed = Signal "animation_changed"

animation_finished :: Signal GodotAnimationPlayer
animation_finished = Signal "animation_finished"