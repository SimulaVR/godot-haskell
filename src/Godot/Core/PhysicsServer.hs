{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsServer
       (Godot.Core.PhysicsServer._SPACE_PARAM_CONSTRAINT_DEFAULT_BIAS,
        Godot.Core.PhysicsServer._JOINT_SLIDER,
        Godot.Core.PhysicsServer._G6DOF_JOINT_FLAG_ENABLE_MOTOR,
        Godot.Core.PhysicsServer._HINGE_JOINT_LIMIT_SOFTNESS,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_RESTITUTION,
        Godot.Core.PhysicsServer._CONE_TWIST_JOINT_SWING_SPAN,
        Godot.Core.PhysicsServer._AREA_SPACE_OVERRIDE_REPLACE,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_MOTION_RESTITUTION,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_MOTOR_FORCE_LIMIT,
        Godot.Core.PhysicsServer._SPACE_PARAM_TEST_MOTION_MIN_CONTACT_DEPTH,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_ORTHOGONAL_RESTITUTION,
        Godot.Core.PhysicsServer._SPACE_PARAM_BODY_ANGULAR_VELOCITY_DAMP_RATIO,
        Godot.Core.PhysicsServer._HINGE_JOINT_MOTOR_MAX_IMPULSE,
        Godot.Core.PhysicsServer._G6DOF_JOINT_FLAG_ENABLE_ANGULAR_LIMIT,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_UPPER_LIMIT,
        Godot.Core.PhysicsServer._BODY_PARAM_BOUNCE,
        Godot.Core.PhysicsServer._BODY_AXIS_ANGULAR_Y,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_LIMIT_LOWER,
        Godot.Core.PhysicsServer._SHAPE_CYLINDER,
        Godot.Core.PhysicsServer._BODY_MODE_CHARACTER,
        Godot.Core.PhysicsServer._SHAPE_RAY,
        Godot.Core.PhysicsServer._BODY_STATE_LINEAR_VELOCITY,
        Godot.Core.PhysicsServer._HINGE_JOINT_BIAS,
        Godot.Core.PhysicsServer._AREA_PARAM_LINEAR_DAMP,
        Godot.Core.PhysicsServer._BODY_PARAM_ANGULAR_DAMP,
        Godot.Core.PhysicsServer._SPACE_PARAM_BODY_TIME_TO_SLEEP,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_MOTION_SOFTNESS,
        Godot.Core.PhysicsServer._BODY_PARAM_LINEAR_DAMP,
        Godot.Core.PhysicsServer._AREA_PARAM_GRAVITY_DISTANCE_SCALE,
        Godot.Core.PhysicsServer._BODY_STATE_ANGULAR_VELOCITY,
        Godot.Core.PhysicsServer._AREA_BODY_REMOVED,
        Godot.Core.PhysicsServer._BODY_STATE_SLEEPING,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_LIMIT_SOFTNESS,
        Godot.Core.PhysicsServer._INFO_ISLAND_COUNT,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_LIMIT_RESTITUTION,
        Godot.Core.PhysicsServer._AREA_SPACE_OVERRIDE_DISABLED,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_ORTHOGONAL_RESTITUTION,
        Godot.Core.PhysicsServer._AREA_PARAM_GRAVITY_IS_POINT,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_UPPER_LIMIT,
        Godot.Core.PhysicsServer._AREA_PARAM_GRAVITY_POINT_ATTENUATION,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_FORCE_LIMIT,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_LIMIT_DAMPING,
        Godot.Core.PhysicsServer._BODY_STATE_TRANSFORM,
        Godot.Core.PhysicsServer._BODY_AXIS_LINEAR_Z,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_MOTION_RESTITUTION,
        Godot.Core.PhysicsServer._BODY_PARAM_MASS,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_MOTOR_FORCE_LIMIT,
        Godot.Core.PhysicsServer._BODY_MODE_STATIC,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_RESTITUTION,
        Godot.Core.PhysicsServer._HINGE_JOINT_LIMIT_UPPER,
        Godot.Core.PhysicsServer._BODY_PARAM_GRAVITY_SCALE,
        Godot.Core.PhysicsServer._HINGE_JOINT_MOTOR_TARGET_VELOCITY,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_ORTHOGONAL_SOFTNESS,
        Godot.Core.PhysicsServer._PIN_JOINT_IMPULSE_CLAMP,
        Godot.Core.PhysicsServer._SHAPE_PLANE,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_LIMIT_UPPER,
        Godot.Core.PhysicsServer._AREA_PARAM_GRAVITY,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_LOWER_LIMIT,
        Godot.Core.PhysicsServer._HINGE_JOINT_LIMIT_RELAXATION,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_LIMIT_SOFTNESS,
        Godot.Core.PhysicsServer._INFO_COLLISION_PAIRS,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_LIMIT_UPPER,
        Godot.Core.PhysicsServer._PIN_JOINT_DAMPING,
        Godot.Core.PhysicsServer._HINGE_JOINT_FLAG_USE_LIMIT,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_ORTHOGONAL_SOFTNESS,
        Godot.Core.PhysicsServer._BODY_AXIS_ANGULAR_Z,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_LIMIT_DAMPING,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_ORTHOGONAL_DAMPING,
        Godot.Core.PhysicsServer._INFO_ACTIVE_OBJECTS,
        Godot.Core.PhysicsServer._CONE_TWIST_JOINT_RELAXATION,
        Godot.Core.PhysicsServer._SPACE_PARAM_CONTACT_RECYCLE_RADIUS,
        Godot.Core.PhysicsServer._JOINT_HINGE,
        Godot.Core.PhysicsServer._JOINT_CONE_TWIST,
        Godot.Core.PhysicsServer._SPACE_PARAM_CONTACT_MAX_SEPARATION,
        Godot.Core.PhysicsServer._SLIDER_JOINT_MAX,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_LIMIT_SOFTNESS,
        Godot.Core.PhysicsServer._AREA_BODY_ADDED,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_DAMPING,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_MOTION_DAMPING,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_LIMIT_RESTITUTION,
        Godot.Core.PhysicsServer._AREA_SPACE_OVERRIDE_COMBINE_REPLACE,
        Godot.Core.PhysicsServer._SLIDER_JOINT_ANGULAR_MOTION_SOFTNESS,
        Godot.Core.PhysicsServer._JOINT_6DOF,
        Godot.Core.PhysicsServer._CONE_TWIST_JOINT_BIAS,
        Godot.Core.PhysicsServer._SHAPE_CONVEX_POLYGON,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_MOTOR_TARGET_VELOCITY,
        Godot.Core.PhysicsServer._AREA_PARAM_PRIORITY,
        Godot.Core.PhysicsServer._AREA_SPACE_OVERRIDE_REPLACE_COMBINE,
        Godot.Core.PhysicsServer._BODY_MODE_RIGID,
        Godot.Core.PhysicsServer._HINGE_JOINT_LIMIT_LOWER,
        Godot.Core.PhysicsServer._SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION,
        Godot.Core.PhysicsServer._BODY_PARAM_FRICTION,
        Godot.Core.PhysicsServer._SHAPE_CAPSULE,
        Godot.Core.PhysicsServer._AREA_PARAM_ANGULAR_DAMP,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_MOTOR_TARGET_VELOCITY,
        Godot.Core.PhysicsServer._HINGE_JOINT_FLAG_ENABLE_MOTOR,
        Godot.Core.PhysicsServer._SHAPE_BOX,
        Godot.Core.PhysicsServer._CONE_TWIST_JOINT_TWIST_SPAN,
        Godot.Core.PhysicsServer._BODY_MODE_KINEMATIC,
        Godot.Core.PhysicsServer._SHAPE_CONCAVE_POLYGON,
        Godot.Core.PhysicsServer._G6DOF_JOINT_FLAG_ENABLE_LINEAR_LIMIT,
        Godot.Core.PhysicsServer._HINGE_JOINT_LIMIT_BIAS,
        Godot.Core.PhysicsServer._G6DOF_JOINT_ANGULAR_ERP,
        Godot.Core.PhysicsServer._BODY_AXIS_LINEAR_Y,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_LIMIT_LOWER,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_MOTION_DAMPING,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_DAMPING,
        Godot.Core.PhysicsServer._PIN_JOINT_BIAS,
        Godot.Core.PhysicsServer._AREA_PARAM_GRAVITY_VECTOR,
        Godot.Core.PhysicsServer._SHAPE_CUSTOM,
        Godot.Core.PhysicsServer._BODY_STATE_CAN_SLEEP,
        Godot.Core.PhysicsServer._SHAPE_HEIGHTMAP,
        Godot.Core.PhysicsServer._BODY_PARAM_MAX,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_ORTHOGONAL_DAMPING,
        Godot.Core.PhysicsServer._SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD,
        Godot.Core.PhysicsServer._CONE_TWIST_JOINT_SOFTNESS,
        Godot.Core.PhysicsServer._BODY_AXIS_ANGULAR_X,
        Godot.Core.PhysicsServer._JOINT_PIN,
        Godot.Core.PhysicsServer._SLIDER_JOINT_LINEAR_LIMIT_SOFTNESS,
        Godot.Core.PhysicsServer._G6DOF_JOINT_FLAG_ENABLE_LINEAR_MOTOR,
        Godot.Core.PhysicsServer._G6DOF_JOINT_LINEAR_LOWER_LIMIT,
        Godot.Core.PhysicsServer._BODY_AXIS_LINEAR_X,
        Godot.Core.PhysicsServer._SHAPE_SPHERE,
        Godot.Core.PhysicsServer._AREA_SPACE_OVERRIDE_COMBINE,
        Godot.Core.PhysicsServer._SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD,
        Godot.Core.PhysicsServer.area_add_shape,
        Godot.Core.PhysicsServer.area_attach_object_instance_id,
        Godot.Core.PhysicsServer.area_clear_shapes,
        Godot.Core.PhysicsServer.area_create,
        Godot.Core.PhysicsServer.area_get_object_instance_id,
        Godot.Core.PhysicsServer.area_get_param,
        Godot.Core.PhysicsServer.area_get_shape,
        Godot.Core.PhysicsServer.area_get_shape_count,
        Godot.Core.PhysicsServer.area_get_shape_transform,
        Godot.Core.PhysicsServer.area_get_space,
        Godot.Core.PhysicsServer.area_get_space_override_mode,
        Godot.Core.PhysicsServer.area_get_transform,
        Godot.Core.PhysicsServer.area_is_ray_pickable,
        Godot.Core.PhysicsServer.area_remove_shape,
        Godot.Core.PhysicsServer.area_set_area_monitor_callback,
        Godot.Core.PhysicsServer.area_set_collision_layer,
        Godot.Core.PhysicsServer.area_set_collision_mask,
        Godot.Core.PhysicsServer.area_set_monitor_callback,
        Godot.Core.PhysicsServer.area_set_monitorable,
        Godot.Core.PhysicsServer.area_set_param,
        Godot.Core.PhysicsServer.area_set_ray_pickable,
        Godot.Core.PhysicsServer.area_set_shape,
        Godot.Core.PhysicsServer.area_set_shape_disabled,
        Godot.Core.PhysicsServer.area_set_shape_transform,
        Godot.Core.PhysicsServer.area_set_space,
        Godot.Core.PhysicsServer.area_set_space_override_mode,
        Godot.Core.PhysicsServer.area_set_transform,
        Godot.Core.PhysicsServer.body_add_central_force,
        Godot.Core.PhysicsServer.body_add_collision_exception,
        Godot.Core.PhysicsServer.body_add_force,
        Godot.Core.PhysicsServer.body_add_shape,
        Godot.Core.PhysicsServer.body_add_torque,
        Godot.Core.PhysicsServer.body_apply_central_impulse,
        Godot.Core.PhysicsServer.body_apply_impulse,
        Godot.Core.PhysicsServer.body_apply_torque_impulse,
        Godot.Core.PhysicsServer.body_attach_object_instance_id,
        Godot.Core.PhysicsServer.body_clear_shapes,
        Godot.Core.PhysicsServer.body_create,
        Godot.Core.PhysicsServer.body_get_collision_layer,
        Godot.Core.PhysicsServer.body_get_collision_mask,
        Godot.Core.PhysicsServer.body_get_direct_state,
        Godot.Core.PhysicsServer.body_get_kinematic_safe_margin,
        Godot.Core.PhysicsServer.body_get_max_contacts_reported,
        Godot.Core.PhysicsServer.body_get_mode,
        Godot.Core.PhysicsServer.body_get_object_instance_id,
        Godot.Core.PhysicsServer.body_get_param,
        Godot.Core.PhysicsServer.body_get_shape,
        Godot.Core.PhysicsServer.body_get_shape_count,
        Godot.Core.PhysicsServer.body_get_shape_transform,
        Godot.Core.PhysicsServer.body_get_space,
        Godot.Core.PhysicsServer.body_get_state,
        Godot.Core.PhysicsServer.body_is_axis_locked,
        Godot.Core.PhysicsServer.body_is_continuous_collision_detection_enabled,
        Godot.Core.PhysicsServer.body_is_omitting_force_integration,
        Godot.Core.PhysicsServer.body_is_ray_pickable,
        Godot.Core.PhysicsServer.body_remove_collision_exception,
        Godot.Core.PhysicsServer.body_remove_shape,
        Godot.Core.PhysicsServer.body_set_axis_lock,
        Godot.Core.PhysicsServer.body_set_axis_velocity,
        Godot.Core.PhysicsServer.body_set_collision_layer,
        Godot.Core.PhysicsServer.body_set_collision_mask,
        Godot.Core.PhysicsServer.body_set_enable_continuous_collision_detection,
        Godot.Core.PhysicsServer.body_set_force_integration_callback,
        Godot.Core.PhysicsServer.body_set_kinematic_safe_margin,
        Godot.Core.PhysicsServer.body_set_max_contacts_reported,
        Godot.Core.PhysicsServer.body_set_mode,
        Godot.Core.PhysicsServer.body_set_omit_force_integration,
        Godot.Core.PhysicsServer.body_set_param,
        Godot.Core.PhysicsServer.body_set_ray_pickable,
        Godot.Core.PhysicsServer.body_set_shape,
        Godot.Core.PhysicsServer.body_set_shape_disabled,
        Godot.Core.PhysicsServer.body_set_shape_transform,
        Godot.Core.PhysicsServer.body_set_space,
        Godot.Core.PhysicsServer.body_set_state,
        Godot.Core.PhysicsServer.cone_twist_joint_get_param,
        Godot.Core.PhysicsServer.cone_twist_joint_set_param,
        Godot.Core.PhysicsServer.free_rid,
        Godot.Core.PhysicsServer.generic_6dof_joint_get_flag,
        Godot.Core.PhysicsServer.generic_6dof_joint_get_param,
        Godot.Core.PhysicsServer.generic_6dof_joint_set_flag,
        Godot.Core.PhysicsServer.generic_6dof_joint_set_param,
        Godot.Core.PhysicsServer.get_process_info,
        Godot.Core.PhysicsServer.hinge_joint_get_flag,
        Godot.Core.PhysicsServer.hinge_joint_get_param,
        Godot.Core.PhysicsServer.hinge_joint_set_flag,
        Godot.Core.PhysicsServer.hinge_joint_set_param,
        Godot.Core.PhysicsServer.joint_create_cone_twist,
        Godot.Core.PhysicsServer.joint_create_generic_6dof,
        Godot.Core.PhysicsServer.joint_create_hinge,
        Godot.Core.PhysicsServer.joint_create_pin,
        Godot.Core.PhysicsServer.joint_create_slider,
        Godot.Core.PhysicsServer.joint_get_solver_priority,
        Godot.Core.PhysicsServer.joint_get_type,
        Godot.Core.PhysicsServer.joint_set_solver_priority,
        Godot.Core.PhysicsServer.pin_joint_get_local_a,
        Godot.Core.PhysicsServer.pin_joint_get_local_b,
        Godot.Core.PhysicsServer.pin_joint_get_param,
        Godot.Core.PhysicsServer.pin_joint_set_local_a,
        Godot.Core.PhysicsServer.pin_joint_set_local_b,
        Godot.Core.PhysicsServer.pin_joint_set_param,
        Godot.Core.PhysicsServer.set_active,
        Godot.Core.PhysicsServer.shape_create,
        Godot.Core.PhysicsServer.shape_get_data,
        Godot.Core.PhysicsServer.shape_get_type,
        Godot.Core.PhysicsServer.shape_set_data,
        Godot.Core.PhysicsServer.slider_joint_get_param,
        Godot.Core.PhysicsServer.slider_joint_set_param,
        Godot.Core.PhysicsServer.space_create,
        Godot.Core.PhysicsServer.space_get_direct_state,
        Godot.Core.PhysicsServer.space_get_param,
        Godot.Core.PhysicsServer.space_is_active,
        Godot.Core.PhysicsServer.space_set_active,
        Godot.Core.PhysicsServer.space_set_param)
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
import Godot.Core.Object()

_SPACE_PARAM_CONSTRAINT_DEFAULT_BIAS :: Int
_SPACE_PARAM_CONSTRAINT_DEFAULT_BIAS = 7

_JOINT_SLIDER :: Int
_JOINT_SLIDER = 2

_G6DOF_JOINT_FLAG_ENABLE_MOTOR :: Int
_G6DOF_JOINT_FLAG_ENABLE_MOTOR = 4

_HINGE_JOINT_LIMIT_SOFTNESS :: Int
_HINGE_JOINT_LIMIT_SOFTNESS = 4

_G6DOF_JOINT_LINEAR_RESTITUTION :: Int
_G6DOF_JOINT_LINEAR_RESTITUTION = 3

_CONE_TWIST_JOINT_SWING_SPAN :: Int
_CONE_TWIST_JOINT_SWING_SPAN = 0

_AREA_SPACE_OVERRIDE_REPLACE :: Int
_AREA_SPACE_OVERRIDE_REPLACE = 3

_SLIDER_JOINT_LINEAR_MOTION_RESTITUTION :: Int
_SLIDER_JOINT_LINEAR_MOTION_RESTITUTION = 6

_G6DOF_JOINT_ANGULAR_MOTOR_FORCE_LIMIT :: Int
_G6DOF_JOINT_ANGULAR_MOTOR_FORCE_LIMIT = 18

_SPACE_PARAM_TEST_MOTION_MIN_CONTACT_DEPTH :: Int
_SPACE_PARAM_TEST_MOTION_MIN_CONTACT_DEPTH = 8

_SLIDER_JOINT_LINEAR_ORTHOGONAL_RESTITUTION :: Int
_SLIDER_JOINT_LINEAR_ORTHOGONAL_RESTITUTION = 9

_SPACE_PARAM_BODY_ANGULAR_VELOCITY_DAMP_RATIO :: Int
_SPACE_PARAM_BODY_ANGULAR_VELOCITY_DAMP_RATIO = 6

_HINGE_JOINT_MOTOR_MAX_IMPULSE :: Int
_HINGE_JOINT_MOTOR_MAX_IMPULSE = 7

_G6DOF_JOINT_FLAG_ENABLE_ANGULAR_LIMIT :: Int
_G6DOF_JOINT_FLAG_ENABLE_ANGULAR_LIMIT = 1

_G6DOF_JOINT_ANGULAR_UPPER_LIMIT :: Int
_G6DOF_JOINT_ANGULAR_UPPER_LIMIT = 11

_BODY_PARAM_BOUNCE :: Int
_BODY_PARAM_BOUNCE = 0

_BODY_AXIS_ANGULAR_Y :: Int
_BODY_AXIS_ANGULAR_Y = 16

_SLIDER_JOINT_ANGULAR_LIMIT_LOWER :: Int
_SLIDER_JOINT_ANGULAR_LIMIT_LOWER = 12

_SHAPE_CYLINDER :: Int
_SHAPE_CYLINDER = 5

_BODY_MODE_CHARACTER :: Int
_BODY_MODE_CHARACTER = 3

_SHAPE_RAY :: Int
_SHAPE_RAY = 1

_BODY_STATE_LINEAR_VELOCITY :: Int
_BODY_STATE_LINEAR_VELOCITY = 1

_HINGE_JOINT_BIAS :: Int
_HINGE_JOINT_BIAS = 0

_AREA_PARAM_LINEAR_DAMP :: Int
_AREA_PARAM_LINEAR_DAMP = 5

_BODY_PARAM_ANGULAR_DAMP :: Int
_BODY_PARAM_ANGULAR_DAMP = 5

_SPACE_PARAM_BODY_TIME_TO_SLEEP :: Int
_SPACE_PARAM_BODY_TIME_TO_SLEEP = 5

_SLIDER_JOINT_LINEAR_MOTION_SOFTNESS :: Int
_SLIDER_JOINT_LINEAR_MOTION_SOFTNESS = 5

_BODY_PARAM_LINEAR_DAMP :: Int
_BODY_PARAM_LINEAR_DAMP = 4

_AREA_PARAM_GRAVITY_DISTANCE_SCALE :: Int
_AREA_PARAM_GRAVITY_DISTANCE_SCALE = 3

_BODY_STATE_ANGULAR_VELOCITY :: Int
_BODY_STATE_ANGULAR_VELOCITY = 2

_AREA_BODY_REMOVED :: Int
_AREA_BODY_REMOVED = 1

_BODY_STATE_SLEEPING :: Int
_BODY_STATE_SLEEPING = 3

_G6DOF_JOINT_ANGULAR_LIMIT_SOFTNESS :: Int
_G6DOF_JOINT_ANGULAR_LIMIT_SOFTNESS = 12

_INFO_ISLAND_COUNT :: Int
_INFO_ISLAND_COUNT = 2

_SLIDER_JOINT_ANGULAR_LIMIT_RESTITUTION :: Int
_SLIDER_JOINT_ANGULAR_LIMIT_RESTITUTION = 14

_AREA_SPACE_OVERRIDE_DISABLED :: Int
_AREA_SPACE_OVERRIDE_DISABLED = 0

_SLIDER_JOINT_ANGULAR_ORTHOGONAL_RESTITUTION :: Int
_SLIDER_JOINT_ANGULAR_ORTHOGONAL_RESTITUTION = 20

_AREA_PARAM_GRAVITY_IS_POINT :: Int
_AREA_PARAM_GRAVITY_IS_POINT = 2

_G6DOF_JOINT_LINEAR_UPPER_LIMIT :: Int
_G6DOF_JOINT_LINEAR_UPPER_LIMIT = 1

_AREA_PARAM_GRAVITY_POINT_ATTENUATION :: Int
_AREA_PARAM_GRAVITY_POINT_ATTENUATION = 4

_G6DOF_JOINT_ANGULAR_FORCE_LIMIT :: Int
_G6DOF_JOINT_ANGULAR_FORCE_LIMIT = 15

_SLIDER_JOINT_LINEAR_LIMIT_DAMPING :: Int
_SLIDER_JOINT_LINEAR_LIMIT_DAMPING = 4

_BODY_STATE_TRANSFORM :: Int
_BODY_STATE_TRANSFORM = 0

_BODY_AXIS_LINEAR_Z :: Int
_BODY_AXIS_LINEAR_Z = 4

_SLIDER_JOINT_ANGULAR_MOTION_RESTITUTION :: Int
_SLIDER_JOINT_ANGULAR_MOTION_RESTITUTION = 17

_BODY_PARAM_MASS :: Int
_BODY_PARAM_MASS = 2

_G6DOF_JOINT_LINEAR_MOTOR_FORCE_LIMIT :: Int
_G6DOF_JOINT_LINEAR_MOTOR_FORCE_LIMIT = 6

_BODY_MODE_STATIC :: Int
_BODY_MODE_STATIC = 0

_G6DOF_JOINT_ANGULAR_RESTITUTION :: Int
_G6DOF_JOINT_ANGULAR_RESTITUTION = 14

_HINGE_JOINT_LIMIT_UPPER :: Int
_HINGE_JOINT_LIMIT_UPPER = 1

_BODY_PARAM_GRAVITY_SCALE :: Int
_BODY_PARAM_GRAVITY_SCALE = 3

_HINGE_JOINT_MOTOR_TARGET_VELOCITY :: Int
_HINGE_JOINT_MOTOR_TARGET_VELOCITY = 6

_SLIDER_JOINT_LINEAR_ORTHOGONAL_SOFTNESS :: Int
_SLIDER_JOINT_LINEAR_ORTHOGONAL_SOFTNESS = 8

_PIN_JOINT_IMPULSE_CLAMP :: Int
_PIN_JOINT_IMPULSE_CLAMP = 2

_SHAPE_PLANE :: Int
_SHAPE_PLANE = 0

_SLIDER_JOINT_ANGULAR_LIMIT_UPPER :: Int
_SLIDER_JOINT_ANGULAR_LIMIT_UPPER = 11

_AREA_PARAM_GRAVITY :: Int
_AREA_PARAM_GRAVITY = 0

_G6DOF_JOINT_ANGULAR_LOWER_LIMIT :: Int
_G6DOF_JOINT_ANGULAR_LOWER_LIMIT = 10

_HINGE_JOINT_LIMIT_RELAXATION :: Int
_HINGE_JOINT_LIMIT_RELAXATION = 5

_SLIDER_JOINT_ANGULAR_LIMIT_SOFTNESS :: Int
_SLIDER_JOINT_ANGULAR_LIMIT_SOFTNESS = 13

_INFO_COLLISION_PAIRS :: Int
_INFO_COLLISION_PAIRS = 1

_SLIDER_JOINT_LINEAR_LIMIT_UPPER :: Int
_SLIDER_JOINT_LINEAR_LIMIT_UPPER = 0

_PIN_JOINT_DAMPING :: Int
_PIN_JOINT_DAMPING = 1

_HINGE_JOINT_FLAG_USE_LIMIT :: Int
_HINGE_JOINT_FLAG_USE_LIMIT = 0

_SLIDER_JOINT_ANGULAR_ORTHOGONAL_SOFTNESS :: Int
_SLIDER_JOINT_ANGULAR_ORTHOGONAL_SOFTNESS = 19

_BODY_AXIS_ANGULAR_Z :: Int
_BODY_AXIS_ANGULAR_Z = 32

_SLIDER_JOINT_ANGULAR_LIMIT_DAMPING :: Int
_SLIDER_JOINT_ANGULAR_LIMIT_DAMPING = 15

_SLIDER_JOINT_ANGULAR_ORTHOGONAL_DAMPING :: Int
_SLIDER_JOINT_ANGULAR_ORTHOGONAL_DAMPING = 21

_INFO_ACTIVE_OBJECTS :: Int
_INFO_ACTIVE_OBJECTS = 0

_CONE_TWIST_JOINT_RELAXATION :: Int
_CONE_TWIST_JOINT_RELAXATION = 4

_SPACE_PARAM_CONTACT_RECYCLE_RADIUS :: Int
_SPACE_PARAM_CONTACT_RECYCLE_RADIUS = 0

_JOINT_HINGE :: Int
_JOINT_HINGE = 1

_JOINT_CONE_TWIST :: Int
_JOINT_CONE_TWIST = 3

_SPACE_PARAM_CONTACT_MAX_SEPARATION :: Int
_SPACE_PARAM_CONTACT_MAX_SEPARATION = 1

_SLIDER_JOINT_MAX :: Int
_SLIDER_JOINT_MAX = 22

_G6DOF_JOINT_LINEAR_LIMIT_SOFTNESS :: Int
_G6DOF_JOINT_LINEAR_LIMIT_SOFTNESS = 2

_AREA_BODY_ADDED :: Int
_AREA_BODY_ADDED = 0

_G6DOF_JOINT_ANGULAR_DAMPING :: Int
_G6DOF_JOINT_ANGULAR_DAMPING = 13

_SLIDER_JOINT_ANGULAR_MOTION_DAMPING :: Int
_SLIDER_JOINT_ANGULAR_MOTION_DAMPING = 18

_SLIDER_JOINT_LINEAR_LIMIT_RESTITUTION :: Int
_SLIDER_JOINT_LINEAR_LIMIT_RESTITUTION = 3

_AREA_SPACE_OVERRIDE_COMBINE_REPLACE :: Int
_AREA_SPACE_OVERRIDE_COMBINE_REPLACE = 2

_SLIDER_JOINT_ANGULAR_MOTION_SOFTNESS :: Int
_SLIDER_JOINT_ANGULAR_MOTION_SOFTNESS = 16

_JOINT_6DOF :: Int
_JOINT_6DOF = 4

_CONE_TWIST_JOINT_BIAS :: Int
_CONE_TWIST_JOINT_BIAS = 2

_SHAPE_CONVEX_POLYGON :: Int
_SHAPE_CONVEX_POLYGON = 6

_G6DOF_JOINT_ANGULAR_MOTOR_TARGET_VELOCITY :: Int
_G6DOF_JOINT_ANGULAR_MOTOR_TARGET_VELOCITY = 17

_AREA_PARAM_PRIORITY :: Int
_AREA_PARAM_PRIORITY = 7

_AREA_SPACE_OVERRIDE_REPLACE_COMBINE :: Int
_AREA_SPACE_OVERRIDE_REPLACE_COMBINE = 4

_BODY_MODE_RIGID :: Int
_BODY_MODE_RIGID = 2

_HINGE_JOINT_LIMIT_LOWER :: Int
_HINGE_JOINT_LIMIT_LOWER = 2

_SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION :: Int
_SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION = 2

_BODY_PARAM_FRICTION :: Int
_BODY_PARAM_FRICTION = 1

_SHAPE_CAPSULE :: Int
_SHAPE_CAPSULE = 4

_AREA_PARAM_ANGULAR_DAMP :: Int
_AREA_PARAM_ANGULAR_DAMP = 6

_G6DOF_JOINT_LINEAR_MOTOR_TARGET_VELOCITY :: Int
_G6DOF_JOINT_LINEAR_MOTOR_TARGET_VELOCITY = 5

_HINGE_JOINT_FLAG_ENABLE_MOTOR :: Int
_HINGE_JOINT_FLAG_ENABLE_MOTOR = 1

_SHAPE_BOX :: Int
_SHAPE_BOX = 3

_CONE_TWIST_JOINT_TWIST_SPAN :: Int
_CONE_TWIST_JOINT_TWIST_SPAN = 1

_BODY_MODE_KINEMATIC :: Int
_BODY_MODE_KINEMATIC = 1

_SHAPE_CONCAVE_POLYGON :: Int
_SHAPE_CONCAVE_POLYGON = 7

_G6DOF_JOINT_FLAG_ENABLE_LINEAR_LIMIT :: Int
_G6DOF_JOINT_FLAG_ENABLE_LINEAR_LIMIT = 0

_HINGE_JOINT_LIMIT_BIAS :: Int
_HINGE_JOINT_LIMIT_BIAS = 3

_G6DOF_JOINT_ANGULAR_ERP :: Int
_G6DOF_JOINT_ANGULAR_ERP = 16

_BODY_AXIS_LINEAR_Y :: Int
_BODY_AXIS_LINEAR_Y = 2

_SLIDER_JOINT_LINEAR_LIMIT_LOWER :: Int
_SLIDER_JOINT_LINEAR_LIMIT_LOWER = 1

_SLIDER_JOINT_LINEAR_MOTION_DAMPING :: Int
_SLIDER_JOINT_LINEAR_MOTION_DAMPING = 7

_G6DOF_JOINT_LINEAR_DAMPING :: Int
_G6DOF_JOINT_LINEAR_DAMPING = 4

_PIN_JOINT_BIAS :: Int
_PIN_JOINT_BIAS = 0

_AREA_PARAM_GRAVITY_VECTOR :: Int
_AREA_PARAM_GRAVITY_VECTOR = 1

_SHAPE_CUSTOM :: Int
_SHAPE_CUSTOM = 9

_BODY_STATE_CAN_SLEEP :: Int
_BODY_STATE_CAN_SLEEP = 4

_SHAPE_HEIGHTMAP :: Int
_SHAPE_HEIGHTMAP = 8

_BODY_PARAM_MAX :: Int
_BODY_PARAM_MAX = 6

_SLIDER_JOINT_LINEAR_ORTHOGONAL_DAMPING :: Int
_SLIDER_JOINT_LINEAR_ORTHOGONAL_DAMPING = 10

_SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD :: Int
_SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD = 4

_CONE_TWIST_JOINT_SOFTNESS :: Int
_CONE_TWIST_JOINT_SOFTNESS = 3

_BODY_AXIS_ANGULAR_X :: Int
_BODY_AXIS_ANGULAR_X = 8

_JOINT_PIN :: Int
_JOINT_PIN = 0

_SLIDER_JOINT_LINEAR_LIMIT_SOFTNESS :: Int
_SLIDER_JOINT_LINEAR_LIMIT_SOFTNESS = 2

_G6DOF_JOINT_FLAG_ENABLE_LINEAR_MOTOR :: Int
_G6DOF_JOINT_FLAG_ENABLE_LINEAR_MOTOR = 5

_G6DOF_JOINT_LINEAR_LOWER_LIMIT :: Int
_G6DOF_JOINT_LINEAR_LOWER_LIMIT = 0

_BODY_AXIS_LINEAR_X :: Int
_BODY_AXIS_LINEAR_X = 1

_SHAPE_SPHERE :: Int
_SHAPE_SPHERE = 2

_AREA_SPACE_OVERRIDE_COMBINE :: Int
_AREA_SPACE_OVERRIDE_COMBINE = 1

_SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD :: Int
_SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD = 3

{-# NOINLINE bindPhysicsServer_area_add_shape #-}

-- | Adds a shape to the area, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
bindPhysicsServer_area_add_shape :: MethodBind
bindPhysicsServer_area_add_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a shape to the area, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
area_add_shape ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> Maybe Transform -> Maybe Bool -> IO ()
area_add_shape cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantTransform
         (TF (V3 (V3 1 0 0) (V3 0 1 0) (V3 0 0 1)) (V3 0 0 0))
         arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_add_shape"
           '[Rid, Rid, Maybe Transform, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_add_shape

{-# NOINLINE bindPhysicsServer_area_attach_object_instance_id #-}

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
bindPhysicsServer_area_attach_object_instance_id :: MethodBind
bindPhysicsServer_area_attach_object_instance_id
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_attach_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
area_attach_object_instance_id ::
                                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
area_attach_object_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_area_attach_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_attach_object_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.area_attach_object_instance_id

{-# NOINLINE bindPhysicsServer_area_clear_shapes #-}

-- | Removes all shapes from an area. It does not delete the shapes, so they can be reassigned later.
bindPhysicsServer_area_clear_shapes :: MethodBind
bindPhysicsServer_area_clear_shapes
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from an area. It does not delete the shapes, so they can be reassigned later.
area_clear_shapes ::
                    (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO ()
area_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_clear_shapes" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_clear_shapes

{-# NOINLINE bindPhysicsServer_area_create #-}

-- | Creates an @Area@.
bindPhysicsServer_area_create :: MethodBind
bindPhysicsServer_area_create
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an @Area@.
area_create ::
              (PhysicsServer :< cls, Object :< cls) => cls -> IO Rid
area_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.PhysicsServer.area_create

{-# NOINLINE bindPhysicsServer_area_get_object_instance_id #-}

-- | Gets the instance ID of the object the area is assigned to.
bindPhysicsServer_area_get_object_instance_id :: MethodBind
bindPhysicsServer_area_get_object_instance_id
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the instance ID of the object the area is assigned to.
area_get_object_instance_id ::
                              (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_object_instance_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_area_get_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_object_instance_id"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_object_instance_id

{-# NOINLINE bindPhysicsServer_area_get_param #-}

-- | Returns an area parameter value. A list of available parameters is on the @enum AreaParameter@ constants.
bindPhysicsServer_area_get_param :: MethodBind
bindPhysicsServer_area_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an area parameter value. A list of available parameters is on the @enum AreaParameter@ constants.
area_get_param ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO GodotVariant
area_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_param" '[Rid, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_param

{-# NOINLINE bindPhysicsServer_area_get_shape #-}

-- | Returns the @RID@ of the nth shape of an area.
bindPhysicsServer_area_get_shape :: MethodBind
bindPhysicsServer_area_get_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the nth shape of an area.
area_get_shape ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO Rid
area_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_shape" '[Rid, Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_shape

{-# NOINLINE bindPhysicsServer_area_get_shape_count #-}

-- | Returns the number of shapes assigned to an area.
bindPhysicsServer_area_get_shape_count :: MethodBind
bindPhysicsServer_area_get_shape_count
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes assigned to an area.
area_get_shape_count ::
                       (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_shape_count" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_shape_count

{-# NOINLINE bindPhysicsServer_area_get_shape_transform #-}

-- | Returns the transform matrix of a shape within an area.
bindPhysicsServer_area_get_shape_transform :: MethodBind
bindPhysicsServer_area_get_shape_transform
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix of a shape within an area.
area_get_shape_transform ::
                           (PhysicsServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> IO Transform
area_get_shape_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_get_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_shape_transform"
           '[Rid, Int]
           (IO Transform)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_shape_transform

{-# NOINLINE bindPhysicsServer_area_get_space #-}

-- | Returns the space assigned to the area.
bindPhysicsServer_area_get_space :: MethodBind
bindPhysicsServer_area_get_space
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the space assigned to the area.
area_get_space ::
                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
area_get_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_get_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_space" '[Rid] (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_space

{-# NOINLINE bindPhysicsServer_area_get_space_override_mode #-}

-- | Returns the space override mode for the area.
bindPhysicsServer_area_get_space_override_mode :: MethodBind
bindPhysicsServer_area_get_space_override_mode
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the space override mode for the area.
area_get_space_override_mode ::
                               (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_space_override_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_area_get_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_space_override_mode"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_space_override_mode

{-# NOINLINE bindPhysicsServer_area_get_transform #-}

-- | Returns the transform matrix for an area.
bindPhysicsServer_area_get_transform :: MethodBind
bindPhysicsServer_area_get_transform
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix for an area.
area_get_transform ::
                     (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Transform
area_get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_get_transform" '[Rid]
           (IO Transform)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_get_transform

{-# NOINLINE bindPhysicsServer_area_is_ray_pickable #-}

-- | If @true@, area collides with rays.
bindPhysicsServer_area_is_ray_pickable :: MethodBind
bindPhysicsServer_area_is_ray_pickable
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_is_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, area collides with rays.
area_is_ray_pickable ::
                       (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
area_is_ray_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_is_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_is_ray_pickable" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsServer.area_is_ray_pickable

{-# NOINLINE bindPhysicsServer_area_remove_shape #-}

-- | Removes a shape from an area. It does not delete the shape, so it can be reassigned later.
bindPhysicsServer_area_remove_shape :: MethodBind
bindPhysicsServer_area_remove_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from an area. It does not delete the shape, so it can be reassigned later.
area_remove_shape ::
                    (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
area_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_remove_shape" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_remove_shape

{-# NOINLINE bindPhysicsServer_area_set_area_monitor_callback #-}

bindPhysicsServer_area_set_area_monitor_callback :: MethodBind
bindPhysicsServer_area_set_area_monitor_callback
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_area_monitor_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_set_area_monitor_callback ::
                                 (PhysicsServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Object -> GodotString -> IO ()
area_set_area_monitor_callback cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_area_set_area_monitor_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_area_monitor_callback"
           '[Rid, Object, GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.area_set_area_monitor_callback

{-# NOINLINE bindPhysicsServer_area_set_collision_layer #-}

-- | Assigns the area to one or many physics layers.
bindPhysicsServer_area_set_collision_layer :: MethodBind
bindPhysicsServer_area_set_collision_layer
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the area to one or many physics layers.
area_set_collision_layer ::
                           (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
area_set_collision_layer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_collision_layer"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_collision_layer

{-# NOINLINE bindPhysicsServer_area_set_collision_mask #-}

-- | Sets which physics layers the area will monitor.
bindPhysicsServer_area_set_collision_mask :: MethodBind
bindPhysicsServer_area_set_collision_mask
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets which physics layers the area will monitor.
area_set_collision_mask ::
                          (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
area_set_collision_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_collision_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_collision_mask

{-# NOINLINE bindPhysicsServer_area_set_monitor_callback #-}

-- | Sets the function to call when any body/area enters or exits the area. This callback will be called for any object interacting with the area, and takes five parameters:
--   				1: @AREA_BODY_ADDED@ or @AREA_BODY_REMOVED@, depending on whether the object entered or exited the area.
--   				2: @RID@ of the object that entered/exited the area.
--   				3: Instance ID of the object that entered/exited the area.
--   				4: The shape index of the object that entered/exited the area.
--   				5: The shape index of the area where the object entered/exited.
bindPhysicsServer_area_set_monitor_callback :: MethodBind
bindPhysicsServer_area_set_monitor_callback
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_monitor_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the function to call when any body/area enters or exits the area. This callback will be called for any object interacting with the area, and takes five parameters:
--   				1: @AREA_BODY_ADDED@ or @AREA_BODY_REMOVED@, depending on whether the object entered or exited the area.
--   				2: @RID@ of the object that entered/exited the area.
--   				3: Instance ID of the object that entered/exited the area.
--   				4: The shape index of the object that entered/exited the area.
--   				5: The shape index of the area where the object entered/exited.
area_set_monitor_callback ::
                            (PhysicsServer :< cls, Object :< cls) =>
                            cls -> Rid -> Object -> GodotString -> IO ()
area_set_monitor_callback cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_monitor_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_monitor_callback"
           '[Rid, Object, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_monitor_callback

{-# NOINLINE bindPhysicsServer_area_set_monitorable #-}

bindPhysicsServer_area_set_monitorable :: MethodBind
bindPhysicsServer_area_set_monitorable
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_set_monitorable ::
                       (PhysicsServer :< cls, Object :< cls) =>
                       cls -> Rid -> Bool -> IO ()
area_set_monitorable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_monitorable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_monitorable"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_monitorable

{-# NOINLINE bindPhysicsServer_area_set_param #-}

-- | Sets the value for an area parameter. A list of available parameters is on the @enum AreaParameter@ constants.
bindPhysicsServer_area_set_param :: MethodBind
bindPhysicsServer_area_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value for an area parameter. A list of available parameters is on the @enum AreaParameter@ constants.
area_set_param ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> GodotVariant -> IO ()
area_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_param"
           '[Rid, Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_param

{-# NOINLINE bindPhysicsServer_area_set_ray_pickable #-}

-- | Sets object pickable with rays.
bindPhysicsServer_area_set_ray_pickable :: MethodBind
bindPhysicsServer_area_set_ray_pickable
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets object pickable with rays.
area_set_ray_pickable ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> Bool -> IO ()
area_set_ray_pickable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_ray_pickable"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_ray_pickable

{-# NOINLINE bindPhysicsServer_area_set_shape #-}

-- | Substitutes a given area shape by another. The old shape is selected by its index, the new one by its @RID@.
bindPhysicsServer_area_set_shape :: MethodBind
bindPhysicsServer_area_set_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Substitutes a given area shape by another. The old shape is selected by its index, the new one by its @RID@.
area_set_shape ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> Rid -> IO ()
area_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_shape" '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_shape

{-# NOINLINE bindPhysicsServer_area_set_shape_disabled #-}

bindPhysicsServer_area_set_shape_disabled :: MethodBind
bindPhysicsServer_area_set_shape_disabled
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_shape_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_set_shape_disabled ::
                          (PhysicsServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> Bool -> IO ()
area_set_shape_disabled cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_shape_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_shape_disabled"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_shape_disabled

{-# NOINLINE bindPhysicsServer_area_set_shape_transform #-}

-- | Sets the transform matrix for an area shape.
bindPhysicsServer_area_set_shape_transform :: MethodBind
bindPhysicsServer_area_set_shape_transform
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform matrix for an area shape.
area_set_shape_transform ::
                           (PhysicsServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> Transform -> IO ()
area_set_shape_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_shape_transform"
           '[Rid, Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_shape_transform

{-# NOINLINE bindPhysicsServer_area_set_space #-}

-- | Assigns a space to the area.
bindPhysicsServer_area_set_space :: MethodBind
bindPhysicsServer_area_set_space
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a space to the area.
area_set_space ::
                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
area_set_space cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_space" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_space

{-# NOINLINE bindPhysicsServer_area_set_space_override_mode #-}

-- | Sets the space override mode for the area. The modes are described in the @enum AreaSpaceOverrideMode@ constants.
bindPhysicsServer_area_set_space_override_mode :: MethodBind
bindPhysicsServer_area_set_space_override_mode
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the space override mode for the area. The modes are described in the @enum AreaSpaceOverrideMode@ constants.
area_set_space_override_mode ::
                               (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
area_set_space_override_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_area_set_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_space_override_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_space_override_mode

{-# NOINLINE bindPhysicsServer_area_set_transform #-}

-- | Sets the transform matrix for an area.
bindPhysicsServer_area_set_transform :: MethodBind
bindPhysicsServer_area_set_transform
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "area_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform matrix for an area.
area_set_transform ::
                     (PhysicsServer :< cls, Object :< cls) =>
                     cls -> Rid -> Transform -> IO ()
area_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_area_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "area_set_transform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.area_set_transform

{-# NOINLINE bindPhysicsServer_body_add_central_force #-}

bindPhysicsServer_body_add_central_force :: MethodBind
bindPhysicsServer_body_add_central_force
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_add_central_force ::
                         (PhysicsServer :< cls, Object :< cls) =>
                         cls -> Rid -> Vector3 -> IO ()
body_add_central_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_add_central_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_add_central_force"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_add_central_force

{-# NOINLINE bindPhysicsServer_body_add_collision_exception #-}

-- | Adds a body to the list of bodies exempt from collisions.
bindPhysicsServer_body_add_collision_exception :: MethodBind
bindPhysicsServer_body_add_collision_exception
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_add_collision_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies exempt from collisions.
body_add_collision_exception ::
                               (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
body_add_collision_exception cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_add_collision_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_add_collision_exception"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_add_collision_exception

{-# NOINLINE bindPhysicsServer_body_add_force #-}

bindPhysicsServer_body_add_force :: MethodBind
bindPhysicsServer_body_add_force
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_add_force ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Vector3 -> Vector3 -> IO ()
body_add_force cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_add_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_add_force"
           '[Rid, Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_add_force

{-# NOINLINE bindPhysicsServer_body_add_shape #-}

-- | Adds a shape to the body, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
bindPhysicsServer_body_add_shape :: MethodBind
bindPhysicsServer_body_add_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a shape to the body, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
body_add_shape ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> Maybe Transform -> Maybe Bool -> IO ()
body_add_shape cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantTransform
         (TF (V3 (V3 1 0 0) (V3 0 1 0) (V3 0 0 1)) (V3 0 0 0))
         arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_add_shape"
           '[Rid, Rid, Maybe Transform, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_add_shape

{-# NOINLINE bindPhysicsServer_body_add_torque #-}

bindPhysicsServer_body_add_torque :: MethodBind
bindPhysicsServer_body_add_torque
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_add_torque ::
                  (PhysicsServer :< cls, Object :< cls) =>
                  cls -> Rid -> Vector3 -> IO ()
body_add_torque cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_add_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_add_torque" '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_add_torque

{-# NOINLINE bindPhysicsServer_body_apply_central_impulse #-}

bindPhysicsServer_body_apply_central_impulse :: MethodBind
bindPhysicsServer_body_apply_central_impulse
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_apply_central_impulse ::
                             (PhysicsServer :< cls, Object :< cls) =>
                             cls -> Rid -> Vector3 -> IO ()
body_apply_central_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_apply_central_impulse"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_apply_central_impulse

{-# NOINLINE bindPhysicsServer_body_apply_impulse #-}

-- | Gives the body a push at a @position@ in the direction of the @impulse@.
bindPhysicsServer_body_apply_impulse :: MethodBind
bindPhysicsServer_body_apply_impulse
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gives the body a push at a @position@ in the direction of the @impulse@.
body_apply_impulse ::
                     (PhysicsServer :< cls, Object :< cls) =>
                     cls -> Rid -> Vector3 -> Vector3 -> IO ()
body_apply_impulse cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_apply_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_apply_impulse"
           '[Rid, Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_apply_impulse

{-# NOINLINE bindPhysicsServer_body_apply_torque_impulse #-}

-- | Gives the body a push to rotate it.
bindPhysicsServer_body_apply_torque_impulse :: MethodBind
bindPhysicsServer_body_apply_torque_impulse
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gives the body a push to rotate it.
body_apply_torque_impulse ::
                            (PhysicsServer :< cls, Object :< cls) =>
                            cls -> Rid -> Vector3 -> IO ()
body_apply_torque_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_apply_torque_impulse"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_apply_torque_impulse

{-# NOINLINE bindPhysicsServer_body_attach_object_instance_id #-}

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
bindPhysicsServer_body_attach_object_instance_id :: MethodBind
bindPhysicsServer_body_attach_object_instance_id
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_attach_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
body_attach_object_instance_id ::
                                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
body_attach_object_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_attach_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_attach_object_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_attach_object_instance_id

{-# NOINLINE bindPhysicsServer_body_clear_shapes #-}

-- | Removes all shapes from a body.
bindPhysicsServer_body_clear_shapes :: MethodBind
bindPhysicsServer_body_clear_shapes
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from a body.
body_clear_shapes ::
                    (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO ()
body_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_clear_shapes" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_clear_shapes

{-# NOINLINE bindPhysicsServer_body_create #-}

-- | Creates a physics body. The first parameter can be any value from @enum BodyMode@ constants, for the type of body created. Additionally, the body can be created in sleeping state to save processing time.
bindPhysicsServer_body_create :: MethodBind
bindPhysicsServer_body_create
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a physics body. The first parameter can be any value from @enum BodyMode@ constants, for the type of body created. Additionally, the body can be created in sleeping state to save processing time.
body_create ::
              (PhysicsServer :< cls, Object :< cls) =>
              cls -> Maybe Int -> Maybe Bool -> IO Rid
body_create cls arg1 arg2
  = withVariantArray
      [maybe (VariantInt (2)) toVariant arg1,
       maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_create"
           '[Maybe Int, Maybe Bool]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_create

{-# NOINLINE bindPhysicsServer_body_get_collision_layer #-}

-- | Returns the physics layer or layers a body belongs to.
bindPhysicsServer_body_get_collision_layer :: MethodBind
bindPhysicsServer_body_get_collision_layer
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the physics layer or layers a body belongs to.
body_get_collision_layer ::
                           (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_collision_layer" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_collision_layer

{-# NOINLINE bindPhysicsServer_body_get_collision_mask #-}

-- | Returns the physics layer or layers a body can collide with.
--   -
bindPhysicsServer_body_get_collision_mask :: MethodBind
bindPhysicsServer_body_get_collision_mask
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the physics layer or layers a body can collide with.
--   -
body_get_collision_mask ::
                          (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_collision_mask" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_collision_mask

{-# NOINLINE bindPhysicsServer_body_get_direct_state #-}

-- | Returns the @PhysicsDirectBodyState@ of the body.
bindPhysicsServer_body_get_direct_state :: MethodBind
bindPhysicsServer_body_get_direct_state
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_direct_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @PhysicsDirectBodyState@ of the body.
body_get_direct_state ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> IO PhysicsDirectBodyState
body_get_direct_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_direct_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_direct_state" '[Rid]
           (IO PhysicsDirectBodyState)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_direct_state

{-# NOINLINE bindPhysicsServer_body_get_kinematic_safe_margin #-}

bindPhysicsServer_body_get_kinematic_safe_margin :: MethodBind
bindPhysicsServer_body_get_kinematic_safe_margin
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_kinematic_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_get_kinematic_safe_margin ::
                                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Float
body_get_kinematic_safe_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_get_kinematic_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_kinematic_safe_margin"
           '[Rid]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_get_kinematic_safe_margin

{-# NOINLINE bindPhysicsServer_body_get_max_contacts_reported #-}

-- | Returns the maximum contacts that can be reported. See @method body_set_max_contacts_reported@.
bindPhysicsServer_body_get_max_contacts_reported :: MethodBind
bindPhysicsServer_body_get_max_contacts_reported
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the maximum contacts that can be reported. See @method body_set_max_contacts_reported@.
body_get_max_contacts_reported ::
                                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_max_contacts_reported cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_get_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_max_contacts_reported"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_get_max_contacts_reported

{-# NOINLINE bindPhysicsServer_body_get_mode #-}

-- | Returns the body mode.
bindPhysicsServer_body_get_mode :: MethodBind
bindPhysicsServer_body_get_mode
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the body mode.
body_get_mode ::
                (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_mode" '[Rid] (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_mode

{-# NOINLINE bindPhysicsServer_body_get_object_instance_id #-}

-- | Gets the instance ID of the object the area is assigned to.
bindPhysicsServer_body_get_object_instance_id :: MethodBind
bindPhysicsServer_body_get_object_instance_id
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the instance ID of the object the area is assigned to.
body_get_object_instance_id ::
                              (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_object_instance_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_get_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_object_instance_id"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_object_instance_id

{-# NOINLINE bindPhysicsServer_body_get_param #-}

-- | Returns the value of a body parameter. A list of available parameters is on the @enum BodyParameter@ constants.
bindPhysicsServer_body_get_param :: MethodBind
bindPhysicsServer_body_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a body parameter. A list of available parameters is on the @enum BodyParameter@ constants.
body_get_param ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO Float
body_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_param" '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_param

{-# NOINLINE bindPhysicsServer_body_get_shape #-}

-- | Returns the @RID@ of the nth shape of a body.
bindPhysicsServer_body_get_shape :: MethodBind
bindPhysicsServer_body_get_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the nth shape of a body.
body_get_shape ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO Rid
body_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_shape" '[Rid, Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_shape

{-# NOINLINE bindPhysicsServer_body_get_shape_count #-}

-- | Returns the number of shapes assigned to a body.
bindPhysicsServer_body_get_shape_count :: MethodBind
bindPhysicsServer_body_get_shape_count
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes assigned to a body.
body_get_shape_count ::
                       (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_shape_count" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_shape_count

{-# NOINLINE bindPhysicsServer_body_get_shape_transform #-}

-- | Returns the transform matrix of a body shape.
bindPhysicsServer_body_get_shape_transform :: MethodBind
bindPhysicsServer_body_get_shape_transform
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix of a body shape.
body_get_shape_transform ::
                           (PhysicsServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> IO Transform
body_get_shape_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_shape_transform"
           '[Rid, Int]
           (IO Transform)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_shape_transform

{-# NOINLINE bindPhysicsServer_body_get_space #-}

-- | Returns the @RID@ of the space assigned to a body.
bindPhysicsServer_body_get_space :: MethodBind
bindPhysicsServer_body_get_space
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the space assigned to a body.
body_get_space ::
                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
body_get_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_space" '[Rid] (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_space

{-# NOINLINE bindPhysicsServer_body_get_state #-}

-- | Returns a body state.
bindPhysicsServer_body_get_state :: MethodBind
bindPhysicsServer_body_get_state
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_get_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a body state.
body_get_state ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO GodotVariant
body_get_state cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_get_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_get_state" '[Rid, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_get_state

{-# NOINLINE bindPhysicsServer_body_is_axis_locked #-}

bindPhysicsServer_body_is_axis_locked :: MethodBind
bindPhysicsServer_body_is_axis_locked
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_is_axis_locked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_is_axis_locked ::
                      (PhysicsServer :< cls, Object :< cls) =>
                      cls -> Rid -> Int -> IO Bool
body_is_axis_locked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_is_axis_locked
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_is_axis_locked" '[Rid, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_is_axis_locked

{-# NOINLINE bindPhysicsServer_body_is_continuous_collision_detection_enabled
             #-}

-- | If @true@, the continuous collision detection mode is enabled.
bindPhysicsServer_body_is_continuous_collision_detection_enabled ::
                                                                 MethodBind
bindPhysicsServer_body_is_continuous_collision_detection_enabled
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_is_continuous_collision_detection_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the continuous collision detection mode is enabled.
body_is_continuous_collision_detection_enabled ::
                                                 (PhysicsServer :< cls, Object :< cls) =>
                                                 cls -> Rid -> IO Bool
body_is_continuous_collision_detection_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_is_continuous_collision_detection_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer
           "body_is_continuous_collision_detection_enabled"
           '[Rid]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_is_continuous_collision_detection_enabled

{-# NOINLINE bindPhysicsServer_body_is_omitting_force_integration
             #-}

-- | Returns whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
bindPhysicsServer_body_is_omitting_force_integration :: MethodBind
bindPhysicsServer_body_is_omitting_force_integration
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_is_omitting_force_integration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
body_is_omitting_force_integration ::
                                     (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
body_is_omitting_force_integration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_is_omitting_force_integration
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer
           "body_is_omitting_force_integration"
           '[Rid]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_is_omitting_force_integration

{-# NOINLINE bindPhysicsServer_body_is_ray_pickable #-}

-- | If @true@, the body can be detected by rays.
bindPhysicsServer_body_is_ray_pickable :: MethodBind
bindPhysicsServer_body_is_ray_pickable
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_is_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body can be detected by rays.
body_is_ray_pickable ::
                       (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
body_is_ray_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_is_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_is_ray_pickable" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsServer.body_is_ray_pickable

{-# NOINLINE bindPhysicsServer_body_remove_collision_exception #-}

-- | Removes a body from the list of bodies exempt from collisions.
--   				Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided.
bindPhysicsServer_body_remove_collision_exception :: MethodBind
bindPhysicsServer_body_remove_collision_exception
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_remove_collision_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies exempt from collisions.
--   				Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided.
body_remove_collision_exception ::
                                  (PhysicsServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Rid -> IO ()
body_remove_collision_exception cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_remove_collision_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_remove_collision_exception"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_remove_collision_exception

{-# NOINLINE bindPhysicsServer_body_remove_shape #-}

-- | Removes a shape from a body. The shape is not deleted, so it can be reused afterwards.
bindPhysicsServer_body_remove_shape :: MethodBind
bindPhysicsServer_body_remove_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from a body. The shape is not deleted, so it can be reused afterwards.
body_remove_shape ::
                    (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
body_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_remove_shape" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_remove_shape

{-# NOINLINE bindPhysicsServer_body_set_axis_lock #-}

bindPhysicsServer_body_set_axis_lock :: MethodBind
bindPhysicsServer_body_set_axis_lock
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_set_axis_lock ::
                     (PhysicsServer :< cls, Object :< cls) =>
                     cls -> Rid -> Int -> Bool -> IO ()
body_set_axis_lock cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_axis_lock
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_axis_lock"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_axis_lock

{-# NOINLINE bindPhysicsServer_body_set_axis_velocity #-}

-- | Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
bindPhysicsServer_body_set_axis_velocity :: MethodBind
bindPhysicsServer_body_set_axis_velocity
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_axis_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
body_set_axis_velocity ::
                         (PhysicsServer :< cls, Object :< cls) =>
                         cls -> Rid -> Vector3 -> IO ()
body_set_axis_velocity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_axis_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_axis_velocity"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_axis_velocity

{-# NOINLINE bindPhysicsServer_body_set_collision_layer #-}

-- | Sets the physics layer or layers a body belongs to.
bindPhysicsServer_body_set_collision_layer :: MethodBind
bindPhysicsServer_body_set_collision_layer
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the physics layer or layers a body belongs to.
body_set_collision_layer ::
                           (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
body_set_collision_layer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_collision_layer"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_collision_layer

{-# NOINLINE bindPhysicsServer_body_set_collision_mask #-}

-- | Sets the physics layer or layers a body can collide with.
bindPhysicsServer_body_set_collision_mask :: MethodBind
bindPhysicsServer_body_set_collision_mask
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the physics layer or layers a body can collide with.
body_set_collision_mask ::
                          (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
body_set_collision_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_collision_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_collision_mask

{-# NOINLINE bindPhysicsServer_body_set_enable_continuous_collision_detection
             #-}

-- | If @true@, the continuous collision detection mode is enabled.
--   				Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided.
bindPhysicsServer_body_set_enable_continuous_collision_detection ::
                                                                 MethodBind
bindPhysicsServer_body_set_enable_continuous_collision_detection
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_enable_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the continuous collision detection mode is enabled.
--   				Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided.
body_set_enable_continuous_collision_detection ::
                                                 (PhysicsServer :< cls, Object :< cls) =>
                                                 cls -> Rid -> Bool -> IO ()
body_set_enable_continuous_collision_detection cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_set_enable_continuous_collision_detection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer
           "body_set_enable_continuous_collision_detection"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_set_enable_continuous_collision_detection

{-# NOINLINE bindPhysicsServer_body_set_force_integration_callback
             #-}

-- | Sets the function used to calculate physics for an object, if that object allows it (see @method body_set_omit_force_integration@).
bindPhysicsServer_body_set_force_integration_callback :: MethodBind
bindPhysicsServer_body_set_force_integration_callback
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_force_integration_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the function used to calculate physics for an object, if that object allows it (see @method body_set_omit_force_integration@).
body_set_force_integration_callback ::
                                      (PhysicsServer :< cls, Object :< cls) =>
                                      cls ->
                                        Rid -> Object -> GodotString -> Maybe GodotVariant -> IO ()
body_set_force_integration_callback cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_set_force_integration_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer
           "body_set_force_integration_callback"
           '[Rid, Object, GodotString, Maybe GodotVariant]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_set_force_integration_callback

{-# NOINLINE bindPhysicsServer_body_set_kinematic_safe_margin #-}

bindPhysicsServer_body_set_kinematic_safe_margin :: MethodBind
bindPhysicsServer_body_set_kinematic_safe_margin
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_kinematic_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_set_kinematic_safe_margin ::
                                 (PhysicsServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
body_set_kinematic_safe_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_set_kinematic_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_kinematic_safe_margin"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_set_kinematic_safe_margin

{-# NOINLINE bindPhysicsServer_body_set_max_contacts_reported #-}

-- | Sets the maximum contacts to report. Bodies can keep a log of the contacts with other bodies, this is enabled by setting the maximum amount of contacts reported to a number greater than 0.
bindPhysicsServer_body_set_max_contacts_reported :: MethodBind
bindPhysicsServer_body_set_max_contacts_reported
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum contacts to report. Bodies can keep a log of the contacts with other bodies, this is enabled by setting the maximum amount of contacts reported to a number greater than 0.
body_set_max_contacts_reported ::
                                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
body_set_max_contacts_reported cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_set_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_max_contacts_reported"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_set_max_contacts_reported

{-# NOINLINE bindPhysicsServer_body_set_mode #-}

-- | Sets the body mode, from one of the @enum BodyMode@ constants.
bindPhysicsServer_body_set_mode :: MethodBind
bindPhysicsServer_body_set_mode
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the body mode, from one of the @enum BodyMode@ constants.
body_set_mode ::
                (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
body_set_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_mode" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_mode

{-# NOINLINE bindPhysicsServer_body_set_omit_force_integration #-}

-- | Sets whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
bindPhysicsServer_body_set_omit_force_integration :: MethodBind
bindPhysicsServer_body_set_omit_force_integration
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_omit_force_integration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
body_set_omit_force_integration ::
                                  (PhysicsServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Bool -> IO ()
body_set_omit_force_integration cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_body_set_omit_force_integration
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_omit_force_integration"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsServer.body_set_omit_force_integration

{-# NOINLINE bindPhysicsServer_body_set_param #-}

-- | Sets a body parameter. A list of available parameters is on the @enum BodyParameter@ constants.
bindPhysicsServer_body_set_param :: MethodBind
bindPhysicsServer_body_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a body parameter. A list of available parameters is on the @enum BodyParameter@ constants.
body_set_param ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> Float -> IO ()
body_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_param

{-# NOINLINE bindPhysicsServer_body_set_ray_pickable #-}

-- | Sets the body pickable with rays if @enabled@ is set.
bindPhysicsServer_body_set_ray_pickable :: MethodBind
bindPhysicsServer_body_set_ray_pickable
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the body pickable with rays if @enabled@ is set.
body_set_ray_pickable ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> Bool -> IO ()
body_set_ray_pickable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_ray_pickable"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_ray_pickable

{-# NOINLINE bindPhysicsServer_body_set_shape #-}

-- | Substitutes a given body shape by another. The old shape is selected by its index, the new one by its @RID@.
bindPhysicsServer_body_set_shape :: MethodBind
bindPhysicsServer_body_set_shape
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Substitutes a given body shape by another. The old shape is selected by its index, the new one by its @RID@.
body_set_shape ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> Rid -> IO ()
body_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_shape" '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_shape

{-# NOINLINE bindPhysicsServer_body_set_shape_disabled #-}

bindPhysicsServer_body_set_shape_disabled :: MethodBind
bindPhysicsServer_body_set_shape_disabled
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_shape_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_set_shape_disabled ::
                          (PhysicsServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> Bool -> IO ()
body_set_shape_disabled cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_shape_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_shape_disabled"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_shape_disabled

{-# NOINLINE bindPhysicsServer_body_set_shape_transform #-}

-- | Sets the transform matrix for a body shape.
bindPhysicsServer_body_set_shape_transform :: MethodBind
bindPhysicsServer_body_set_shape_transform
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform matrix for a body shape.
body_set_shape_transform ::
                           (PhysicsServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> Transform -> IO ()
body_set_shape_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_shape_transform"
           '[Rid, Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_shape_transform

{-# NOINLINE bindPhysicsServer_body_set_space #-}

-- | Assigns a space to the body (see @method space_create@).
bindPhysicsServer_body_set_space :: MethodBind
bindPhysicsServer_body_set_space
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a space to the body (see @method space_create@).
body_set_space ::
                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
body_set_space cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_space" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_space

{-# NOINLINE bindPhysicsServer_body_set_state #-}

-- | Sets a body state (see @enum BodyState@ constants).
bindPhysicsServer_body_set_state :: MethodBind
bindPhysicsServer_body_set_state
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "body_set_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a body state (see @enum BodyState@ constants).
body_set_state ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> GodotVariant -> IO ()
body_set_state cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_body_set_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "body_set_state"
           '[Rid, Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.body_set_state

{-# NOINLINE bindPhysicsServer_cone_twist_joint_get_param #-}

-- | Gets a cone_twist_joint parameter (see @enum ConeTwistJointParam@ constants).
bindPhysicsServer_cone_twist_joint_get_param :: MethodBind
bindPhysicsServer_cone_twist_joint_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "cone_twist_joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a cone_twist_joint parameter (see @enum ConeTwistJointParam@ constants).
cone_twist_joint_get_param ::
                             (PhysicsServer :< cls, Object :< cls) =>
                             cls -> Rid -> Int -> IO Float
cone_twist_joint_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_cone_twist_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "cone_twist_joint_get_param"
           '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.cone_twist_joint_get_param

{-# NOINLINE bindPhysicsServer_cone_twist_joint_set_param #-}

-- | Sets a cone_twist_joint parameter (see @enum ConeTwistJointParam@ constants).
bindPhysicsServer_cone_twist_joint_set_param :: MethodBind
bindPhysicsServer_cone_twist_joint_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "cone_twist_joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a cone_twist_joint parameter (see @enum ConeTwistJointParam@ constants).
cone_twist_joint_set_param ::
                             (PhysicsServer :< cls, Object :< cls) =>
                             cls -> Rid -> Int -> Float -> IO ()
cone_twist_joint_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_cone_twist_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "cone_twist_joint_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.cone_twist_joint_set_param

{-# NOINLINE bindPhysicsServer_free_rid #-}

-- | Destroys any of the objects created by PhysicsServer. If the @RID@ passed is not one of the objects that can be created by PhysicsServer, an error will be sent to the console.
bindPhysicsServer_free_rid :: MethodBind
bindPhysicsServer_free_rid
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "free_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Destroys any of the objects created by PhysicsServer. If the @RID@ passed is not one of the objects that can be created by PhysicsServer, an error will be sent to the console.
free_rid ::
           (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO ()
free_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_free_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "free_rid" '[Rid] (IO ()) where
        nodeMethod = Godot.Core.PhysicsServer.free_rid

{-# NOINLINE bindPhysicsServer_generic_6dof_joint_get_flag #-}

-- | Gets a generic_6_DOF_joint flag (see @enum G6DOFJointAxisFlag@ constants).
bindPhysicsServer_generic_6dof_joint_get_flag :: MethodBind
bindPhysicsServer_generic_6dof_joint_get_flag
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "generic_6dof_joint_get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a generic_6_DOF_joint flag (see @enum G6DOFJointAxisFlag@ constants).
generic_6dof_joint_get_flag ::
                              (PhysicsServer :< cls, Object :< cls) =>
                              cls -> Rid -> Int -> Int -> IO Bool
generic_6dof_joint_get_flag cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_generic_6dof_joint_get_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "generic_6dof_joint_get_flag"
           '[Rid, Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsServer.generic_6dof_joint_get_flag

{-# NOINLINE bindPhysicsServer_generic_6dof_joint_get_param #-}

-- | Gets a generic_6_DOF_joint parameter (see @enum G6DOFJointAxisParam@ constants).
bindPhysicsServer_generic_6dof_joint_get_param :: MethodBind
bindPhysicsServer_generic_6dof_joint_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "generic_6dof_joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a generic_6_DOF_joint parameter (see @enum G6DOFJointAxisParam@ constants).
generic_6dof_joint_get_param ::
                               (PhysicsServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Int -> IO Float
generic_6dof_joint_get_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_generic_6dof_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "generic_6dof_joint_get_param"
           '[Rid, Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.generic_6dof_joint_get_param

{-# NOINLINE bindPhysicsServer_generic_6dof_joint_set_flag #-}

-- | Sets a generic_6_DOF_joint flag (see @enum G6DOFJointAxisFlag@ constants).
bindPhysicsServer_generic_6dof_joint_set_flag :: MethodBind
bindPhysicsServer_generic_6dof_joint_set_flag
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "generic_6dof_joint_set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a generic_6_DOF_joint flag (see @enum G6DOFJointAxisFlag@ constants).
generic_6dof_joint_set_flag ::
                              (PhysicsServer :< cls, Object :< cls) =>
                              cls -> Rid -> Int -> Int -> Bool -> IO ()
generic_6dof_joint_set_flag cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_generic_6dof_joint_set_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "generic_6dof_joint_set_flag"
           '[Rid, Int, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.generic_6dof_joint_set_flag

{-# NOINLINE bindPhysicsServer_generic_6dof_joint_set_param #-}

-- | Sets a generic_6_DOF_joint parameter (see @enum G6DOFJointAxisParam@ constants).
bindPhysicsServer_generic_6dof_joint_set_param :: MethodBind
bindPhysicsServer_generic_6dof_joint_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "generic_6dof_joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a generic_6_DOF_joint parameter (see @enum G6DOFJointAxisParam@ constants).
generic_6dof_joint_set_param ::
                               (PhysicsServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Int -> Float -> IO ()
generic_6dof_joint_set_param cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsServer_generic_6dof_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "generic_6dof_joint_set_param"
           '[Rid, Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.generic_6dof_joint_set_param

{-# NOINLINE bindPhysicsServer_get_process_info #-}

-- | Returns an Info defined by the @enum ProcessInfo@ input given.
bindPhysicsServer_get_process_info :: MethodBind
bindPhysicsServer_get_process_info
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "get_process_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an Info defined by the @enum ProcessInfo@ input given.
get_process_info ::
                   (PhysicsServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_process_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_get_process_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "get_process_info" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.get_process_info

{-# NOINLINE bindPhysicsServer_hinge_joint_get_flag #-}

-- | Gets a hinge_joint flag (see @enum HingeJointFlag@ constants).
bindPhysicsServer_hinge_joint_get_flag :: MethodBind
bindPhysicsServer_hinge_joint_get_flag
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "hinge_joint_get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a hinge_joint flag (see @enum HingeJointFlag@ constants).
hinge_joint_get_flag ::
                       (PhysicsServer :< cls, Object :< cls) =>
                       cls -> Rid -> Int -> IO Bool
hinge_joint_get_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_hinge_joint_get_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "hinge_joint_get_flag"
           '[Rid, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsServer.hinge_joint_get_flag

{-# NOINLINE bindPhysicsServer_hinge_joint_get_param #-}

-- | Gets a hinge_joint parameter (see @enum HingeJointParam@).
bindPhysicsServer_hinge_joint_get_param :: MethodBind
bindPhysicsServer_hinge_joint_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "hinge_joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a hinge_joint parameter (see @enum HingeJointParam@).
hinge_joint_get_param ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> Int -> IO Float
hinge_joint_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_hinge_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "hinge_joint_get_param"
           '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.hinge_joint_get_param

{-# NOINLINE bindPhysicsServer_hinge_joint_set_flag #-}

-- | Sets a hinge_joint flag (see @enum HingeJointFlag@ constants).
bindPhysicsServer_hinge_joint_set_flag :: MethodBind
bindPhysicsServer_hinge_joint_set_flag
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "hinge_joint_set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a hinge_joint flag (see @enum HingeJointFlag@ constants).
hinge_joint_set_flag ::
                       (PhysicsServer :< cls, Object :< cls) =>
                       cls -> Rid -> Int -> Bool -> IO ()
hinge_joint_set_flag cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_hinge_joint_set_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "hinge_joint_set_flag"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.hinge_joint_set_flag

{-# NOINLINE bindPhysicsServer_hinge_joint_set_param #-}

-- | Sets a hinge_joint parameter (see @enum HingeJointParam@ constants).
bindPhysicsServer_hinge_joint_set_param :: MethodBind
bindPhysicsServer_hinge_joint_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "hinge_joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a hinge_joint parameter (see @enum HingeJointParam@ constants).
hinge_joint_set_param ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> Int -> Float -> IO ()
hinge_joint_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_hinge_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "hinge_joint_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.hinge_joint_set_param

{-# NOINLINE bindPhysicsServer_joint_create_cone_twist #-}

-- | Creates a @ConeTwistJoint@.
bindPhysicsServer_joint_create_cone_twist :: MethodBind
bindPhysicsServer_joint_create_cone_twist
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_create_cone_twist" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a @ConeTwistJoint@.
joint_create_cone_twist ::
                          (PhysicsServer :< cls, Object :< cls) =>
                          cls -> Rid -> Transform -> Rid -> Transform -> IO Rid
joint_create_cone_twist cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_create_cone_twist
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_create_cone_twist"
           '[Rid, Transform, Rid, Transform]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_create_cone_twist

{-# NOINLINE bindPhysicsServer_joint_create_generic_6dof #-}

-- | Creates a @Generic6DOFJoint@.
bindPhysicsServer_joint_create_generic_6dof :: MethodBind
bindPhysicsServer_joint_create_generic_6dof
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_create_generic_6dof" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a @Generic6DOFJoint@.
joint_create_generic_6dof ::
                            (PhysicsServer :< cls, Object :< cls) =>
                            cls -> Rid -> Transform -> Rid -> Transform -> IO Rid
joint_create_generic_6dof cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_create_generic_6dof
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_create_generic_6dof"
           '[Rid, Transform, Rid, Transform]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_create_generic_6dof

{-# NOINLINE bindPhysicsServer_joint_create_hinge #-}

-- | Creates a @HingeJoint@.
bindPhysicsServer_joint_create_hinge :: MethodBind
bindPhysicsServer_joint_create_hinge
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_create_hinge" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a @HingeJoint@.
joint_create_hinge ::
                     (PhysicsServer :< cls, Object :< cls) =>
                     cls -> Rid -> Transform -> Rid -> Transform -> IO Rid
joint_create_hinge cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_create_hinge
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_create_hinge"
           '[Rid, Transform, Rid, Transform]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_create_hinge

{-# NOINLINE bindPhysicsServer_joint_create_pin #-}

-- | Creates a @PinJoint@.
bindPhysicsServer_joint_create_pin :: MethodBind
bindPhysicsServer_joint_create_pin
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_create_pin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a @PinJoint@.
joint_create_pin ::
                   (PhysicsServer :< cls, Object :< cls) =>
                   cls -> Rid -> Vector3 -> Rid -> Vector3 -> IO Rid
joint_create_pin cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_create_pin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_create_pin"
           '[Rid, Vector3, Rid, Vector3]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_create_pin

{-# NOINLINE bindPhysicsServer_joint_create_slider #-}

-- | Creates a @SliderJoint@.
bindPhysicsServer_joint_create_slider :: MethodBind
bindPhysicsServer_joint_create_slider
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_create_slider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a @SliderJoint@.
joint_create_slider ::
                      (PhysicsServer :< cls, Object :< cls) =>
                      cls -> Rid -> Transform -> Rid -> Transform -> IO Rid
joint_create_slider cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_create_slider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_create_slider"
           '[Rid, Transform, Rid, Transform]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_create_slider

{-# NOINLINE bindPhysicsServer_joint_get_solver_priority #-}

-- | Gets the priority value of the Joint.
bindPhysicsServer_joint_get_solver_priority :: MethodBind
bindPhysicsServer_joint_get_solver_priority
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_get_solver_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the priority value of the Joint.
joint_get_solver_priority ::
                            (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
joint_get_solver_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_get_solver_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_get_solver_priority"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_get_solver_priority

{-# NOINLINE bindPhysicsServer_joint_get_type #-}

-- | Returns the type of the Joint.
bindPhysicsServer_joint_get_type :: MethodBind
bindPhysicsServer_joint_get_type
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the Joint.
joint_get_type ::
                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
joint_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_get_type" '[Rid] (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_get_type

{-# NOINLINE bindPhysicsServer_joint_set_solver_priority #-}

-- | Sets the priority value of the Joint.
bindPhysicsServer_joint_set_solver_priority :: MethodBind
bindPhysicsServer_joint_set_solver_priority
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "joint_set_solver_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the priority value of the Joint.
joint_set_solver_priority ::
                            (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
joint_set_solver_priority cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_joint_set_solver_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "joint_set_solver_priority"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.joint_set_solver_priority

{-# NOINLINE bindPhysicsServer_pin_joint_get_local_a #-}

-- | Returns position of the joint in the local space of body a of the joint.
bindPhysicsServer_pin_joint_get_local_a :: MethodBind
bindPhysicsServer_pin_joint_get_local_a
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "pin_joint_get_local_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns position of the joint in the local space of body a of the joint.
pin_joint_get_local_a ::
                        (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Vector3
pin_joint_get_local_a cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_pin_joint_get_local_a
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "pin_joint_get_local_a" '[Rid]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsServer.pin_joint_get_local_a

{-# NOINLINE bindPhysicsServer_pin_joint_get_local_b #-}

-- | Returns position of the joint in the local space of body b of the joint.
bindPhysicsServer_pin_joint_get_local_b :: MethodBind
bindPhysicsServer_pin_joint_get_local_b
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "pin_joint_get_local_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns position of the joint in the local space of body b of the joint.
pin_joint_get_local_b ::
                        (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Vector3
pin_joint_get_local_b cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_pin_joint_get_local_b
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "pin_joint_get_local_b" '[Rid]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.PhysicsServer.pin_joint_get_local_b

{-# NOINLINE bindPhysicsServer_pin_joint_get_param #-}

-- | Gets a pin_joint parameter (see @enum PinJointParam@ constants).
bindPhysicsServer_pin_joint_get_param :: MethodBind
bindPhysicsServer_pin_joint_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "pin_joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a pin_joint parameter (see @enum PinJointParam@ constants).
pin_joint_get_param ::
                      (PhysicsServer :< cls, Object :< cls) =>
                      cls -> Rid -> Int -> IO Float
pin_joint_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_pin_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "pin_joint_get_param" '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.pin_joint_get_param

{-# NOINLINE bindPhysicsServer_pin_joint_set_local_a #-}

-- | Sets position of the joint in the local space of body a of the joint.
bindPhysicsServer_pin_joint_set_local_a :: MethodBind
bindPhysicsServer_pin_joint_set_local_a
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "pin_joint_set_local_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets position of the joint in the local space of body a of the joint.
pin_joint_set_local_a ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> Vector3 -> IO ()
pin_joint_set_local_a cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_pin_joint_set_local_a
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "pin_joint_set_local_a"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.pin_joint_set_local_a

{-# NOINLINE bindPhysicsServer_pin_joint_set_local_b #-}

-- | Sets position of the joint in the local space of body b of the joint.
bindPhysicsServer_pin_joint_set_local_b :: MethodBind
bindPhysicsServer_pin_joint_set_local_b
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "pin_joint_set_local_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets position of the joint in the local space of body b of the joint.
pin_joint_set_local_b ::
                        (PhysicsServer :< cls, Object :< cls) =>
                        cls -> Rid -> Vector3 -> IO ()
pin_joint_set_local_b cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_pin_joint_set_local_b
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "pin_joint_set_local_b"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.pin_joint_set_local_b

{-# NOINLINE bindPhysicsServer_pin_joint_set_param #-}

-- | Sets a pin_joint parameter (see @enum PinJointParam@ constants).
bindPhysicsServer_pin_joint_set_param :: MethodBind
bindPhysicsServer_pin_joint_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "pin_joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a pin_joint parameter (see @enum PinJointParam@ constants).
pin_joint_set_param ::
                      (PhysicsServer :< cls, Object :< cls) =>
                      cls -> Rid -> Int -> Float -> IO ()
pin_joint_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_pin_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "pin_joint_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.pin_joint_set_param

{-# NOINLINE bindPhysicsServer_set_active #-}

-- | Activates or deactivates the 3D physics engine.
bindPhysicsServer_set_active :: MethodBind
bindPhysicsServer_set_active
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Activates or deactivates the 3D physics engine.
set_active ::
             (PhysicsServer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "set_active" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.set_active

{-# NOINLINE bindPhysicsServer_shape_create #-}

-- | Creates a shape of a type from @enum ShapeType@. Does not assign it to a body or an area. To do so, you must use @method area_set_shape@ or @method body_set_shape@.
bindPhysicsServer_shape_create :: MethodBind
bindPhysicsServer_shape_create
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a shape of a type from @enum ShapeType@. Does not assign it to a body or an area. To do so, you must use @method area_set_shape@ or @method body_set_shape@.
shape_create ::
               (PhysicsServer :< cls, Object :< cls) => cls -> Int -> IO Rid
shape_create cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_shape_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "shape_create" '[Int] (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsServer.shape_create

{-# NOINLINE bindPhysicsServer_shape_get_data #-}

-- | Returns the shape data.
bindPhysicsServer_shape_get_data :: MethodBind
bindPhysicsServer_shape_get_data
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "shape_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape data.
shape_get_data ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> IO GodotVariant
shape_get_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_shape_get_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "shape_get_data" '[Rid]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.PhysicsServer.shape_get_data

{-# NOINLINE bindPhysicsServer_shape_get_type #-}

-- | Returns the type of shape (see @enum ShapeType@ constants).
bindPhysicsServer_shape_get_type :: MethodBind
bindPhysicsServer_shape_get_type
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "shape_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of shape (see @enum ShapeType@ constants).
shape_get_type ::
                 (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Int
shape_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_shape_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "shape_get_type" '[Rid] (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsServer.shape_get_type

{-# NOINLINE bindPhysicsServer_shape_set_data #-}

-- | Sets the shape data that defines its shape and size. The data to be passed depends on the kind of shape created @method shape_get_type@.
bindPhysicsServer_shape_set_data :: MethodBind
bindPhysicsServer_shape_set_data
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "shape_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shape data that defines its shape and size. The data to be passed depends on the kind of shape created @method shape_get_type@.
shape_set_data ::
                 (PhysicsServer :< cls, Object :< cls) =>
                 cls -> Rid -> GodotVariant -> IO ()
shape_set_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_shape_set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "shape_set_data"
           '[Rid, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.shape_set_data

{-# NOINLINE bindPhysicsServer_slider_joint_get_param #-}

-- | Gets a slider_joint parameter (see @enum SliderJointParam@ constants).
bindPhysicsServer_slider_joint_get_param :: MethodBind
bindPhysicsServer_slider_joint_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "slider_joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a slider_joint parameter (see @enum SliderJointParam@ constants).
slider_joint_get_param ::
                         (PhysicsServer :< cls, Object :< cls) =>
                         cls -> Rid -> Int -> IO Float
slider_joint_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_slider_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "slider_joint_get_param"
           '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.slider_joint_get_param

{-# NOINLINE bindPhysicsServer_slider_joint_set_param #-}

-- | Gets a slider_joint parameter (see @enum SliderJointParam@ constants).
bindPhysicsServer_slider_joint_set_param :: MethodBind
bindPhysicsServer_slider_joint_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "slider_joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a slider_joint parameter (see @enum SliderJointParam@ constants).
slider_joint_set_param ::
                         (PhysicsServer :< cls, Object :< cls) =>
                         cls -> Rid -> Int -> Float -> IO ()
slider_joint_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_slider_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "slider_joint_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.slider_joint_set_param

{-# NOINLINE bindPhysicsServer_space_create #-}

-- | Creates a space. A space is a collection of parameters for the physics engine that can be assigned to an area or a body. It can be assigned to an area with @method area_set_space@, or to a body with @method body_set_space@.
bindPhysicsServer_space_create :: MethodBind
bindPhysicsServer_space_create
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "space_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a space. A space is a collection of parameters for the physics engine that can be assigned to an area or a body. It can be assigned to an area with @method area_set_space@, or to a body with @method body_set_space@.
space_create ::
               (PhysicsServer :< cls, Object :< cls) => cls -> IO Rid
space_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_space_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "space_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.PhysicsServer.space_create

{-# NOINLINE bindPhysicsServer_space_get_direct_state #-}

-- | Returns the state of a space, a @PhysicsDirectSpaceState@. This object can be used to make collision/intersection queries.
bindPhysicsServer_space_get_direct_state :: MethodBind
bindPhysicsServer_space_get_direct_state
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "space_get_direct_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the state of a space, a @PhysicsDirectSpaceState@. This object can be used to make collision/intersection queries.
space_get_direct_state ::
                         (PhysicsServer :< cls, Object :< cls) =>
                         cls -> Rid -> IO PhysicsDirectSpaceState
space_get_direct_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_space_get_direct_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "space_get_direct_state" '[Rid]
           (IO PhysicsDirectSpaceState)
         where
        nodeMethod = Godot.Core.PhysicsServer.space_get_direct_state

{-# NOINLINE bindPhysicsServer_space_get_param #-}

-- | Returns the value of a space parameter.
bindPhysicsServer_space_get_param :: MethodBind
bindPhysicsServer_space_get_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "space_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a space parameter.
space_get_param ::
                  (PhysicsServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> IO Float
space_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_space_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "space_get_param" '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsServer.space_get_param

{-# NOINLINE bindPhysicsServer_space_is_active #-}

-- | Returns whether the space is active.
bindPhysicsServer_space_is_active :: MethodBind
bindPhysicsServer_space_is_active
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "space_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the space is active.
space_is_active ::
                  (PhysicsServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
space_is_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_space_is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "space_is_active" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsServer.space_is_active

{-# NOINLINE bindPhysicsServer_space_set_active #-}

-- | Marks a space as active. It will not have an effect, unless it is assigned to an area or body.
bindPhysicsServer_space_set_active :: MethodBind
bindPhysicsServer_space_set_active
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "space_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Marks a space as active. It will not have an effect, unless it is assigned to an area or body.
space_set_active ::
                   (PhysicsServer :< cls, Object :< cls) =>
                   cls -> Rid -> Bool -> IO ()
space_set_active cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_space_set_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "space_set_active" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.space_set_active

{-# NOINLINE bindPhysicsServer_space_set_param #-}

-- | Sets the value for a space parameter. A list of available parameters is on the @enum SpaceParameter@ constants.
bindPhysicsServer_space_set_param :: MethodBind
bindPhysicsServer_space_set_param
  = unsafePerformIO $
      withCString "PhysicsServer" $
        \ clsNamePtr ->
          withCString "space_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value for a space parameter. A list of available parameters is on the @enum SpaceParameter@ constants.
space_set_param ::
                  (PhysicsServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> Float -> IO ()
space_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsServer_space_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsServer "space_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsServer.space_set_param