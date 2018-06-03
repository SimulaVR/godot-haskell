module Godot.Core.GodotHingeJoint where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern PARAM_MOTOR_MAX_IMPULSE :: Int

pattern PARAM_MOTOR_MAX_IMPULSE = 7

pattern FLAG_USE_LIMIT :: Int

pattern FLAG_USE_LIMIT = 0

pattern PARAM_LIMIT_RELAXATION :: Int

pattern PARAM_LIMIT_RELAXATION = 5

pattern PARAM_LIMIT_UPPER :: Int

pattern PARAM_LIMIT_UPPER = 1

pattern PARAM_LIMIT_BIAS :: Int

pattern PARAM_LIMIT_BIAS = 3

pattern PARAM_MAX :: Int

pattern PARAM_MAX = 8

pattern FLAG_MAX :: Int

pattern FLAG_MAX = 2

pattern PARAM_LIMIT_SOFTNESS :: Int

pattern PARAM_LIMIT_SOFTNESS = 4

pattern PARAM_MOTOR_TARGET_VELOCITY :: Int

pattern PARAM_MOTOR_TARGET_VELOCITY = 6

pattern FLAG_ENABLE_MOTOR :: Int

pattern FLAG_ENABLE_MOTOR = 1

pattern PARAM_LIMIT_LOWER :: Int

pattern PARAM_LIMIT_LOWER = 2

pattern PARAM_BIAS :: Int

pattern PARAM_BIAS = 0