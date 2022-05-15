module Godot.Core.GodotCPUParticles where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern EMISSION_SHAPE_POINT :: Int

pattern EMISSION_SHAPE_POINT = 0

pattern PARAM_ORBIT_VELOCITY :: Int

pattern PARAM_ORBIT_VELOCITY = 2

pattern PARAM_MAX :: Int

pattern PARAM_MAX = 12

pattern FLAG_MAX :: Int

pattern FLAG_MAX = 3

pattern PARAM_HUE_VARIATION :: Int

pattern PARAM_HUE_VARIATION = 9

pattern PARAM_LINEAR_ACCEL :: Int

pattern PARAM_LINEAR_ACCEL = 3

pattern PARAM_TANGENTIAL_ACCEL :: Int

pattern PARAM_TANGENTIAL_ACCEL = 5

pattern PARAM_RADIAL_ACCEL :: Int

pattern PARAM_RADIAL_ACCEL = 4

pattern PARAM_ANIM_SPEED :: Int

pattern PARAM_ANIM_SPEED = 10

pattern PARAM_DAMPING :: Int

pattern PARAM_DAMPING = 6

pattern EMISSION_SHAPE_DIRECTED_POINTS :: Int

pattern EMISSION_SHAPE_DIRECTED_POINTS = 4

pattern PARAM_SCALE :: Int

pattern PARAM_SCALE = 8

pattern EMISSION_SHAPE_BOX :: Int

pattern EMISSION_SHAPE_BOX = 2

pattern PARAM_ANGLE :: Int

pattern PARAM_ANGLE = 7

pattern EMISSION_SHAPE_RING :: Int

pattern EMISSION_SHAPE_RING = 5

pattern FLAG_DISABLE_Z :: Int

pattern FLAG_DISABLE_Z = 2

pattern FLAG_ALIGN_Y_TO_VELOCITY :: Int

pattern FLAG_ALIGN_Y_TO_VELOCITY = 0

pattern DRAW_ORDER_LIFETIME :: Int

pattern DRAW_ORDER_LIFETIME = 1

pattern DRAW_ORDER_VIEW_DEPTH :: Int

pattern DRAW_ORDER_VIEW_DEPTH = 2

pattern PARAM_INITIAL_LINEAR_VELOCITY :: Int

pattern PARAM_INITIAL_LINEAR_VELOCITY = 0

pattern DRAW_ORDER_INDEX :: Int

pattern DRAW_ORDER_INDEX = 0

pattern PARAM_ANIM_OFFSET :: Int

pattern PARAM_ANIM_OFFSET = 11

pattern PARAM_ANGULAR_VELOCITY :: Int

pattern PARAM_ANGULAR_VELOCITY = 1

pattern EMISSION_SHAPE_SPHERE :: Int

pattern EMISSION_SHAPE_SPHERE = 1

pattern EMISSION_SHAPE_POINTS :: Int

pattern EMISSION_SHAPE_POINTS = 3

pattern FLAG_ROTATE_Y :: Int

pattern FLAG_ROTATE_Y = 1

pattern EMISSION_SHAPE_MAX :: Int

pattern EMISSION_SHAPE_MAX = 6