module Godot.Core.GodotConeTwistJoint where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern PARAM_SWING_SPAN :: Int

pattern PARAM_SWING_SPAN = 0

pattern PARAM_SOFTNESS :: Int

pattern PARAM_SOFTNESS = 3

pattern PARAM_TWIST_SPAN :: Int

pattern PARAM_TWIST_SPAN = 1

pattern PARAM_MAX :: Int

pattern PARAM_MAX = 5

pattern PARAM_RELAXATION :: Int

pattern PARAM_RELAXATION = 4

pattern PARAM_BIAS :: Int

pattern PARAM_BIAS = 2