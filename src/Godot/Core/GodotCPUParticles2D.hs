module Godot.Core.GodotCPUParticles2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FLAG_ALIGN_Y_TO_VELOCITY :: Int

pattern FLAG_ALIGN_Y_TO_VELOCITY = 0

pattern PARAM_RADIAL_ACCEL :: Int

pattern PARAM_RADIAL_ACCEL = 4

pattern EMISSION_SHAPE_CIRCLE :: Int

pattern EMISSION_SHAPE_CIRCLE = 1

pattern PARAM_ANGULAR_VELOCITY :: Int

pattern PARAM_ANGULAR_VELOCITY = 1

pattern PARAM_TANGENTIAL_ACCEL :: Int

pattern PARAM_TANGENTIAL_ACCEL = 5

pattern PARAM_ANIM_SPEED :: Int

pattern PARAM_ANIM_SPEED = 10

pattern EMISSION_SHAPE_POINTS :: Int

pattern EMISSION_SHAPE_POINTS = 3

pattern PARAM_MAX :: Int

pattern PARAM_MAX = 12

pattern PARAM_INITIAL_LINEAR_VELOCITY :: Int

pattern PARAM_INITIAL_LINEAR_VELOCITY = 0

pattern FLAG_MAX :: Int

pattern FLAG_MAX = 1

pattern EMISSION_SHAPE_RECTANGLE :: Int

pattern EMISSION_SHAPE_RECTANGLE = 2

pattern PARAM_LINEAR_ACCEL :: Int

pattern PARAM_LINEAR_ACCEL = 3

pattern EMISSION_SHAPE_DIRECTED_POINTS :: Int

pattern EMISSION_SHAPE_DIRECTED_POINTS = 4

pattern EMISSION_SHAPE_POINT :: Int

pattern EMISSION_SHAPE_POINT = 0

pattern PARAM_ORBIT_VELOCITY :: Int

pattern PARAM_ORBIT_VELOCITY = 2

pattern DRAW_ORDER_LIFETIME :: Int

pattern DRAW_ORDER_LIFETIME = 1

pattern PARAM_SCALE :: Int

pattern PARAM_SCALE = 8

pattern DRAW_ORDER_INDEX :: Int

pattern DRAW_ORDER_INDEX = 0

pattern PARAM_DAMPING :: Int

pattern PARAM_DAMPING = 6

pattern PARAM_HUE_VARIATION :: Int

pattern PARAM_HUE_VARIATION = 9

pattern PARAM_ANIM_OFFSET :: Int

pattern PARAM_ANIM_OFFSET = 11

pattern PARAM_ANGLE :: Int

pattern PARAM_ANGLE = 7