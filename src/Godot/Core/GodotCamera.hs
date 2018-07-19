module Godot.Core.GodotCamera where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern PROJECTION_ORTHOGONAL :: Int

pattern PROJECTION_ORTHOGONAL = 1

pattern KEEP_HEIGHT :: Int

pattern KEEP_HEIGHT = 1

pattern DOPPLER_TRACKING_PHYSICS_STEP :: Int

pattern DOPPLER_TRACKING_PHYSICS_STEP = 2

pattern DOPPLER_TRACKING_DISABLED :: Int

pattern DOPPLER_TRACKING_DISABLED = 0

pattern KEEP_WIDTH :: Int

pattern KEEP_WIDTH = 0

pattern DOPPLER_TRACKING_IDLE_STEP :: Int

pattern DOPPLER_TRACKING_IDLE_STEP = 1

pattern PROJECTION_PERSPECTIVE :: Int

pattern PROJECTION_PERSPECTIVE = 0