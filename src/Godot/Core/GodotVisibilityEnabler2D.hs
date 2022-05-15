module Godot.Core.GodotVisibilityEnabler2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ENABLER_PARENT_PHYSICS_PROCESS :: Int

pattern ENABLER_PARENT_PHYSICS_PROCESS = 4

pattern ENABLER_PAUSE_PARTICLES :: Int

pattern ENABLER_PAUSE_PARTICLES = 2

pattern ENABLER_MAX :: Int

pattern ENABLER_MAX = 6

pattern ENABLER_FREEZE_BODIES :: Int

pattern ENABLER_FREEZE_BODIES = 1

pattern ENABLER_PAUSE_ANIMATED_SPRITES :: Int

pattern ENABLER_PAUSE_ANIMATED_SPRITES = 5

pattern ENABLER_PAUSE_ANIMATIONS :: Int

pattern ENABLER_PAUSE_ANIMATIONS = 0

pattern ENABLER_PARENT_PROCESS :: Int

pattern ENABLER_PARENT_PROCESS = 3