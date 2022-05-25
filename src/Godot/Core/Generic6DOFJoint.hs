{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Generic6DOFJoint
       (Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_FORCE_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_ERP,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_RESTITUTION,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_LOWER_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_MAX,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_LIMIT_SOFTNESS,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_MOTOR,
        Godot.Core.Generic6DOFJoint._FLAG_MAX,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_MOTOR_FORCE_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_DAMPING,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_DAMPING,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_MOTOR_FORCE_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_MOTOR_TARGET_VELOCITY,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_LINEAR_LIMIT,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_ANGULAR_SPRING,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_LINEAR_MOTOR,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_UPPER_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_MOTOR_TARGET_VELOCITY,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_RESTITUTION,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_LIMIT_SOFTNESS,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_LOWER_LIMIT,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_LINEAR_SPRING,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_UPPER_LIMIT,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_ANGULAR_LIMIT,
        Godot.Core.Generic6DOFJoint._get_angular_hi_limit_x,
        Godot.Core.Generic6DOFJoint._get_angular_hi_limit_y,
        Godot.Core.Generic6DOFJoint._get_angular_hi_limit_z,
        Godot.Core.Generic6DOFJoint._get_angular_lo_limit_x,
        Godot.Core.Generic6DOFJoint._get_angular_lo_limit_y,
        Godot.Core.Generic6DOFJoint._get_angular_lo_limit_z,
        Godot.Core.Generic6DOFJoint._set_angular_hi_limit_x,
        Godot.Core.Generic6DOFJoint._set_angular_hi_limit_y,
        Godot.Core.Generic6DOFJoint._set_angular_hi_limit_z,
        Godot.Core.Generic6DOFJoint._set_angular_lo_limit_x,
        Godot.Core.Generic6DOFJoint._set_angular_lo_limit_y,
        Godot.Core.Generic6DOFJoint._set_angular_lo_limit_z,
        Godot.Core.Generic6DOFJoint.get_flag_x,
        Godot.Core.Generic6DOFJoint.get_flag_y,
        Godot.Core.Generic6DOFJoint.get_flag_z,
        Godot.Core.Generic6DOFJoint.get_param_x,
        Godot.Core.Generic6DOFJoint.get_param_y,
        Godot.Core.Generic6DOFJoint.get_param_z,
        Godot.Core.Generic6DOFJoint.get_precision,
        Godot.Core.Generic6DOFJoint.set_flag_x,
        Godot.Core.Generic6DOFJoint.set_flag_y,
        Godot.Core.Generic6DOFJoint.set_flag_z,
        Godot.Core.Generic6DOFJoint.set_param_x,
        Godot.Core.Generic6DOFJoint.set_param_y,
        Godot.Core.Generic6DOFJoint.set_param_z,
        Godot.Core.Generic6DOFJoint.set_precision)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Joint()

_PARAM_ANGULAR_FORCE_LIMIT :: Int
_PARAM_ANGULAR_FORCE_LIMIT = 15

_PARAM_ANGULAR_ERP :: Int
_PARAM_ANGULAR_ERP = 16

_PARAM_ANGULAR_RESTITUTION :: Int
_PARAM_ANGULAR_RESTITUTION = 14

_PARAM_LINEAR_LOWER_LIMIT :: Int
_PARAM_LINEAR_LOWER_LIMIT = 0

_PARAM_MAX :: Int
_PARAM_MAX = 22

_PARAM_LINEAR_LIMIT_SOFTNESS :: Int
_PARAM_LINEAR_LIMIT_SOFTNESS = 2

_FLAG_ENABLE_MOTOR :: Int
_FLAG_ENABLE_MOTOR = 4

_FLAG_MAX :: Int
_FLAG_MAX = 6

_PARAM_LINEAR_MOTOR_FORCE_LIMIT :: Int
_PARAM_LINEAR_MOTOR_FORCE_LIMIT = 6

_PARAM_ANGULAR_DAMPING :: Int
_PARAM_ANGULAR_DAMPING = 13

_PARAM_LINEAR_DAMPING :: Int
_PARAM_LINEAR_DAMPING = 4

_PARAM_ANGULAR_MOTOR_FORCE_LIMIT :: Int
_PARAM_ANGULAR_MOTOR_FORCE_LIMIT = 18

_PARAM_ANGULAR_MOTOR_TARGET_VELOCITY :: Int
_PARAM_ANGULAR_MOTOR_TARGET_VELOCITY = 17

_FLAG_ENABLE_LINEAR_LIMIT :: Int
_FLAG_ENABLE_LINEAR_LIMIT = 0

_FLAG_ENABLE_ANGULAR_SPRING :: Int
_FLAG_ENABLE_ANGULAR_SPRING = 2

_FLAG_ENABLE_LINEAR_MOTOR :: Int
_FLAG_ENABLE_LINEAR_MOTOR = 5

_PARAM_ANGULAR_UPPER_LIMIT :: Int
_PARAM_ANGULAR_UPPER_LIMIT = 11

_PARAM_LINEAR_MOTOR_TARGET_VELOCITY :: Int
_PARAM_LINEAR_MOTOR_TARGET_VELOCITY = 5

_PARAM_LINEAR_RESTITUTION :: Int
_PARAM_LINEAR_RESTITUTION = 3

_PARAM_ANGULAR_LIMIT_SOFTNESS :: Int
_PARAM_ANGULAR_LIMIT_SOFTNESS = 12

_PARAM_ANGULAR_LOWER_LIMIT :: Int
_PARAM_ANGULAR_LOWER_LIMIT = 10

_FLAG_ENABLE_LINEAR_SPRING :: Int
_FLAG_ENABLE_LINEAR_SPRING = 3

_PARAM_LINEAR_UPPER_LIMIT :: Int
_PARAM_LINEAR_UPPER_LIMIT = 1

_FLAG_ENABLE_ANGULAR_LIMIT :: Int
_FLAG_ENABLE_ANGULAR_LIMIT = 1

instance NodeProperty Generic6DOFJoint "angular_limit_x/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_param_x,
             wrapIndexedSetter 13 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_x/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_flag_x, wrapIndexedSetter 1 set_flag_x,
             Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_x/erp" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_param_x,
             wrapIndexedSetter 16 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_x/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_param_x,
             wrapIndexedSetter 15 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_x/lower_angle"
           Float
           'False
         where
        nodeProperty
          = (_get_angular_lo_limit_x,
             wrapDroppingSetter _set_angular_lo_limit_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_x/restitution"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_param_x,
             wrapIndexedSetter 14 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_x/softness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_param_x,
             wrapIndexedSetter 12 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_x/upper_angle"
           Float
           'False
         where
        nodeProperty
          = (_get_angular_hi_limit_x,
             wrapDroppingSetter _set_angular_hi_limit_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_y/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_param_y,
             wrapIndexedSetter 13 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_y/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_flag_y, wrapIndexedSetter 1 set_flag_y,
             Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_y/erp" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_param_y,
             wrapIndexedSetter 16 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_y/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_param_y,
             wrapIndexedSetter 15 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_y/lower_angle"
           Float
           'False
         where
        nodeProperty
          = (_get_angular_lo_limit_y,
             wrapDroppingSetter _set_angular_lo_limit_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_y/restitution"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_param_y,
             wrapIndexedSetter 14 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_y/softness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_param_y,
             wrapIndexedSetter 12 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_y/upper_angle"
           Float
           'False
         where
        nodeProperty
          = (_get_angular_hi_limit_y,
             wrapDroppingSetter _set_angular_hi_limit_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_z/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_param_z,
             wrapIndexedSetter 13 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_z/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_flag_z, wrapIndexedSetter 1 set_flag_z,
             Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_z/erp" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_param_z,
             wrapIndexedSetter 16 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_z/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_param_z,
             wrapIndexedSetter 15 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_z/lower_angle"
           Float
           'False
         where
        nodeProperty
          = (_get_angular_lo_limit_z,
             wrapDroppingSetter _set_angular_lo_limit_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_z/restitution"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_param_z,
             wrapIndexedSetter 14 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "angular_limit_z/softness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_param_z,
             wrapIndexedSetter 12 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_limit_z/upper_angle"
           Float
           'False
         where
        nodeProperty
          = (_get_angular_hi_limit_z,
             wrapDroppingSetter _set_angular_hi_limit_z, Nothing)

instance NodeProperty Generic6DOFJoint "angular_motor_x/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_flag_x, wrapIndexedSetter 4 set_flag_x,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_motor_x/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_param_x,
             wrapIndexedSetter 18 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_motor_x/target_velocity"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_param_x,
             wrapIndexedSetter 17 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_motor_y/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_flag_y, wrapIndexedSetter 4 set_flag_y,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_motor_y/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_param_y,
             wrapIndexedSetter 18 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_motor_y/target_velocity"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_param_y,
             wrapIndexedSetter 17 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_motor_z/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_flag_z, wrapIndexedSetter 4 set_flag_z,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_motor_z/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_param_z,
             wrapIndexedSetter 18 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_motor_z/target_velocity"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_param_z,
             wrapIndexedSetter 17 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_x/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_param_x,
             wrapIndexedSetter 20 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_x/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_flag_x, wrapIndexedSetter 2 set_flag_x,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_spring_x/equilibrium_point"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_param_x,
             wrapIndexedSetter 21 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_x/stiffness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_param_x,
             wrapIndexedSetter 19 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_y/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_param_y,
             wrapIndexedSetter 20 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_y/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_flag_y, wrapIndexedSetter 2 set_flag_y,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_spring_y/equilibrium_point"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_param_y,
             wrapIndexedSetter 21 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_y/stiffness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_param_y,
             wrapIndexedSetter 19 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_z/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_param_z,
             wrapIndexedSetter 20 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_z/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_flag_z, wrapIndexedSetter 2 set_flag_z,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "angular_spring_z/equilibrium_point"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_param_z,
             wrapIndexedSetter 21 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "angular_spring_z/stiffness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_param_z,
             wrapIndexedSetter 19 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_x/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param_x,
             wrapIndexedSetter 4 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_x/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag_x, wrapIndexedSetter 0 set_flag_x,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_limit_x/lower_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_param_x,
             wrapIndexedSetter 0 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_x/restitution"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param_x,
             wrapIndexedSetter 3 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_x/softness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param_x,
             wrapIndexedSetter 2 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_limit_x/upper_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param_x,
             wrapIndexedSetter 1 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_y/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param_y,
             wrapIndexedSetter 4 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_y/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag_y, wrapIndexedSetter 0 set_flag_y,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_limit_y/lower_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_param_y,
             wrapIndexedSetter 0 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_y/restitution"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param_y,
             wrapIndexedSetter 3 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_y/softness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param_y,
             wrapIndexedSetter 2 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_limit_y/upper_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param_y,
             wrapIndexedSetter 1 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_z/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param_z,
             wrapIndexedSetter 4 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_z/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag_z, wrapIndexedSetter 0 set_flag_z,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_limit_z/lower_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_param_z,
             wrapIndexedSetter 0 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_z/restitution"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param_z,
             wrapIndexedSetter 3 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_limit_z/softness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param_z,
             wrapIndexedSetter 2 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_limit_z/upper_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param_z,
             wrapIndexedSetter 1 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_motor_x/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_flag_x, wrapIndexedSetter 5 set_flag_x,
             Nothing)

instance NodeProperty Generic6DOFJoint "linear_motor_x/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param_x,
             wrapIndexedSetter 6 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_motor_x/target_velocity"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param_x,
             wrapIndexedSetter 5 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_motor_y/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_flag_y, wrapIndexedSetter 5 set_flag_y,
             Nothing)

instance NodeProperty Generic6DOFJoint "linear_motor_y/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param_y,
             wrapIndexedSetter 6 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_motor_y/target_velocity"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param_y,
             wrapIndexedSetter 5 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_motor_z/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_flag_z, wrapIndexedSetter 5 set_flag_z,
             Nothing)

instance NodeProperty Generic6DOFJoint "linear_motor_z/force_limit"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param_z,
             wrapIndexedSetter 6 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_motor_z/target_velocity"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param_z,
             wrapIndexedSetter 5 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_x/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_param_x,
             wrapIndexedSetter 8 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_x/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_flag_x, wrapIndexedSetter 3 set_flag_x,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_spring_x/equilibrium_point"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param_x,
             wrapIndexedSetter 9 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_x/stiffness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_param_x,
             wrapIndexedSetter 7 set_param_x, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_y/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_param_y,
             wrapIndexedSetter 8 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_y/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_flag_y, wrapIndexedSetter 3 set_flag_y,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_spring_y/equilibrium_point"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param_y,
             wrapIndexedSetter 9 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_y/stiffness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_param_y,
             wrapIndexedSetter 7 set_param_y, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_z/damping"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_param_z,
             wrapIndexedSetter 8 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_z/enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_flag_z, wrapIndexedSetter 3 set_flag_z,
             Nothing)

instance NodeProperty Generic6DOFJoint
           "linear_spring_z/equilibrium_point"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param_z,
             wrapIndexedSetter 9 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "linear_spring_z/stiffness"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_param_z,
             wrapIndexedSetter 7 set_param_z, Nothing)

instance NodeProperty Generic6DOFJoint "precision" Int 'False where
        nodeProperty
          = (get_precision, wrapDroppingSetter set_precision, Nothing)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_hi_limit_x #-}

-- | The minimum rotation in positive direction to break loose and rotate around the X axis.
bindGeneric6DOFJoint__get_angular_hi_limit_x :: MethodBind
bindGeneric6DOFJoint__get_angular_hi_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_hi_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the X axis.
_get_angular_hi_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_hi_limit_x cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_hi_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_get_angular_hi_limit_x" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._get_angular_hi_limit_x

{-# NOINLINE bindGeneric6DOFJoint__get_angular_hi_limit_y #-}

-- | The minimum rotation in positive direction to break loose and rotate around the Y axis.
bindGeneric6DOFJoint__get_angular_hi_limit_y :: MethodBind
bindGeneric6DOFJoint__get_angular_hi_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_hi_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the Y axis.
_get_angular_hi_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_hi_limit_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_hi_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_get_angular_hi_limit_y" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._get_angular_hi_limit_y

{-# NOINLINE bindGeneric6DOFJoint__get_angular_hi_limit_z #-}

-- | The minimum rotation in positive direction to break loose and rotate around the Z axis.
bindGeneric6DOFJoint__get_angular_hi_limit_z :: MethodBind
bindGeneric6DOFJoint__get_angular_hi_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_hi_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the Z axis.
_get_angular_hi_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_hi_limit_z cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_hi_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_get_angular_hi_limit_z" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._get_angular_hi_limit_z

{-# NOINLINE bindGeneric6DOFJoint__get_angular_lo_limit_x #-}

-- | The minimum rotation in negative direction to break loose and rotate around the X axis.
bindGeneric6DOFJoint__get_angular_lo_limit_x :: MethodBind
bindGeneric6DOFJoint__get_angular_lo_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_lo_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the X axis.
_get_angular_lo_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_lo_limit_x cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_lo_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_get_angular_lo_limit_x" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._get_angular_lo_limit_x

{-# NOINLINE bindGeneric6DOFJoint__get_angular_lo_limit_y #-}

-- | The minimum rotation in negative direction to break loose and rotate around the Y axis.
bindGeneric6DOFJoint__get_angular_lo_limit_y :: MethodBind
bindGeneric6DOFJoint__get_angular_lo_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_lo_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the Y axis.
_get_angular_lo_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_lo_limit_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_lo_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_get_angular_lo_limit_y" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._get_angular_lo_limit_y

{-# NOINLINE bindGeneric6DOFJoint__get_angular_lo_limit_z #-}

-- | The minimum rotation in negative direction to break loose and rotate around the Z axis.
bindGeneric6DOFJoint__get_angular_lo_limit_z :: MethodBind
bindGeneric6DOFJoint__get_angular_lo_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_lo_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the Z axis.
_get_angular_lo_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_lo_limit_z cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_lo_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_get_angular_lo_limit_z" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._get_angular_lo_limit_z

{-# NOINLINE bindGeneric6DOFJoint__set_angular_hi_limit_x #-}

-- | The minimum rotation in positive direction to break loose and rotate around the X axis.
bindGeneric6DOFJoint__set_angular_hi_limit_x :: MethodBind
bindGeneric6DOFJoint__set_angular_hi_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_hi_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the X axis.
_set_angular_hi_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_hi_limit_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_hi_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_set_angular_hi_limit_x"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._set_angular_hi_limit_x

{-# NOINLINE bindGeneric6DOFJoint__set_angular_hi_limit_y #-}

-- | The minimum rotation in positive direction to break loose and rotate around the Y axis.
bindGeneric6DOFJoint__set_angular_hi_limit_y :: MethodBind
bindGeneric6DOFJoint__set_angular_hi_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_hi_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the Y axis.
_set_angular_hi_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_hi_limit_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_hi_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_set_angular_hi_limit_y"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._set_angular_hi_limit_y

{-# NOINLINE bindGeneric6DOFJoint__set_angular_hi_limit_z #-}

-- | The minimum rotation in positive direction to break loose and rotate around the Z axis.
bindGeneric6DOFJoint__set_angular_hi_limit_z :: MethodBind
bindGeneric6DOFJoint__set_angular_hi_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_hi_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the Z axis.
_set_angular_hi_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_hi_limit_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_hi_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_set_angular_hi_limit_z"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._set_angular_hi_limit_z

{-# NOINLINE bindGeneric6DOFJoint__set_angular_lo_limit_x #-}

-- | The minimum rotation in negative direction to break loose and rotate around the X axis.
bindGeneric6DOFJoint__set_angular_lo_limit_x :: MethodBind
bindGeneric6DOFJoint__set_angular_lo_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_lo_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the X axis.
_set_angular_lo_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_lo_limit_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_lo_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_set_angular_lo_limit_x"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._set_angular_lo_limit_x

{-# NOINLINE bindGeneric6DOFJoint__set_angular_lo_limit_y #-}

-- | The minimum rotation in negative direction to break loose and rotate around the Y axis.
bindGeneric6DOFJoint__set_angular_lo_limit_y :: MethodBind
bindGeneric6DOFJoint__set_angular_lo_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_lo_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the Y axis.
_set_angular_lo_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_lo_limit_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_lo_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_set_angular_lo_limit_y"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._set_angular_lo_limit_y

{-# NOINLINE bindGeneric6DOFJoint__set_angular_lo_limit_z #-}

-- | The minimum rotation in negative direction to break loose and rotate around the Z axis.
bindGeneric6DOFJoint__set_angular_lo_limit_z :: MethodBind
bindGeneric6DOFJoint__set_angular_lo_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_lo_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the Z axis.
_set_angular_lo_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_lo_limit_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_lo_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "_set_angular_lo_limit_z"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint._set_angular_lo_limit_z

{-# NOINLINE bindGeneric6DOFJoint_get_flag_x #-}

-- | If @true@, rotation across the X axis is limited.
bindGeneric6DOFJoint_get_flag_x :: MethodBind
bindGeneric6DOFJoint_get_flag_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_flag_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rotation across the X axis is limited.
get_flag_x ::
             (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_flag_x (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_flag_x" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_flag_x

{-# NOINLINE bindGeneric6DOFJoint_get_flag_y #-}

-- | If @true@, rotation across the Y axis is limited.
bindGeneric6DOFJoint_get_flag_y :: MethodBind
bindGeneric6DOFJoint_get_flag_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_flag_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rotation across the Y axis is limited.
get_flag_y ::
             (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_flag_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_flag_y" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_flag_y

{-# NOINLINE bindGeneric6DOFJoint_get_flag_z #-}

-- | If @true@, rotation across the Z axis is limited.
bindGeneric6DOFJoint_get_flag_z :: MethodBind
bindGeneric6DOFJoint_get_flag_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_flag_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rotation across the Z axis is limited.
get_flag_z ::
             (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_flag_z (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_flag_z" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_flag_z

{-# NOINLINE bindGeneric6DOFJoint_get_param_x #-}

-- | The amount of rotational damping across the X axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
bindGeneric6DOFJoint_get_param_x :: MethodBind
bindGeneric6DOFJoint_get_param_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_param_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the X axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
get_param_x ::
              (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_param_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_param_x" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_param_x

{-# NOINLINE bindGeneric6DOFJoint_get_param_y #-}

-- | The amount of rotational damping across the Y axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_get_param_y :: MethodBind
bindGeneric6DOFJoint_get_param_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_param_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the Y axis. The lower, the more dampening occurs.
get_param_y ::
              (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_param_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_param_y" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_param_y

{-# NOINLINE bindGeneric6DOFJoint_get_param_z #-}

-- | The amount of rotational damping across the Z axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_get_param_z :: MethodBind
bindGeneric6DOFJoint_get_param_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_param_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the Z axis. The lower, the more dampening occurs.
get_param_z ::
              (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_param_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_param_z" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_param_z

{-# NOINLINE bindGeneric6DOFJoint_get_precision #-}

bindGeneric6DOFJoint_get_precision :: MethodBind
bindGeneric6DOFJoint_get_precision
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_precision ::
                (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Int
get_precision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_precision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "get_precision" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.get_precision

{-# NOINLINE bindGeneric6DOFJoint_set_flag_x #-}

-- | If @true@, rotation across the X axis is limited.
bindGeneric6DOFJoint_set_flag_x :: MethodBind
bindGeneric6DOFJoint_set_flag_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_flag_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rotation across the X axis is limited.
set_flag_x ::
             (Generic6DOFJoint :< cls, Object :< cls) =>
             cls -> Int -> Bool -> IO ()
set_flag_x cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_flag_x (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_flag_x" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_flag_x

{-# NOINLINE bindGeneric6DOFJoint_set_flag_y #-}

-- | If @true@, rotation across the Y axis is limited.
bindGeneric6DOFJoint_set_flag_y :: MethodBind
bindGeneric6DOFJoint_set_flag_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_flag_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rotation across the Y axis is limited.
set_flag_y ::
             (Generic6DOFJoint :< cls, Object :< cls) =>
             cls -> Int -> Bool -> IO ()
set_flag_y cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_flag_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_flag_y" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_flag_y

{-# NOINLINE bindGeneric6DOFJoint_set_flag_z #-}

-- | If @true@, rotation across the Z axis is limited.
bindGeneric6DOFJoint_set_flag_z :: MethodBind
bindGeneric6DOFJoint_set_flag_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_flag_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rotation across the Z axis is limited.
set_flag_z ::
             (Generic6DOFJoint :< cls, Object :< cls) =>
             cls -> Int -> Bool -> IO ()
set_flag_z cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_flag_z (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_flag_z" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_flag_z

{-# NOINLINE bindGeneric6DOFJoint_set_param_x #-}

-- | The amount of rotational damping across the X axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
bindGeneric6DOFJoint_set_param_x :: MethodBind
bindGeneric6DOFJoint_set_param_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_param_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the X axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
set_param_x ::
              (Generic6DOFJoint :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO ()
set_param_x cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_param_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_param_x" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_param_x

{-# NOINLINE bindGeneric6DOFJoint_set_param_y #-}

-- | The amount of rotational damping across the Y axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_set_param_y :: MethodBind
bindGeneric6DOFJoint_set_param_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_param_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the Y axis. The lower, the more dampening occurs.
set_param_y ::
              (Generic6DOFJoint :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO ()
set_param_y cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_param_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_param_y" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_param_y

{-# NOINLINE bindGeneric6DOFJoint_set_param_z #-}

-- | The amount of rotational damping across the Z axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_set_param_z :: MethodBind
bindGeneric6DOFJoint_set_param_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_param_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the Z axis. The lower, the more dampening occurs.
set_param_z ::
              (Generic6DOFJoint :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO ()
set_param_z cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_param_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_param_z" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_param_z

{-# NOINLINE bindGeneric6DOFJoint_set_precision #-}

bindGeneric6DOFJoint_set_precision :: MethodBind
bindGeneric6DOFJoint_set_precision
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_precision ::
                (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO ()
set_precision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_precision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Generic6DOFJoint "set_precision" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Generic6DOFJoint.set_precision