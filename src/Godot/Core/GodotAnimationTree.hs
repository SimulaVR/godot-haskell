module Godot.Core.GodotAnimationTree where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ANIMATION_PROCESS_MANUAL :: Int

pattern ANIMATION_PROCESS_MANUAL = 2

pattern ANIMATION_PROCESS_PHYSICS :: Int

pattern ANIMATION_PROCESS_PHYSICS = 0

pattern ANIMATION_PROCESS_IDLE :: Int

pattern ANIMATION_PROCESS_IDLE = 1