{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Physics2DServer
       (Godot.Core.Physics2DServer._SPACE_PARAM_CONSTRAINT_DEFAULT_BIAS,
        Godot.Core.Physics2DServer._AREA_SPACE_OVERRIDE_REPLACE,
        Godot.Core.Physics2DServer._SPACE_PARAM_TEST_MOTION_MIN_CONTACT_DEPTH,
        Godot.Core.Physics2DServer._CCD_MODE_DISABLED,
        Godot.Core.Physics2DServer._JOINT_PARAM_MAX_FORCE,
        Godot.Core.Physics2DServer._CCD_MODE_CAST_RAY,
        Godot.Core.Physics2DServer._JOINT_GROOVE,
        Godot.Core.Physics2DServer._BODY_PARAM_BOUNCE,
        Godot.Core.Physics2DServer._BODY_MODE_CHARACTER,
        Godot.Core.Physics2DServer._SHAPE_RAY,
        Godot.Core.Physics2DServer._CCD_MODE_CAST_SHAPE,
        Godot.Core.Physics2DServer._BODY_STATE_LINEAR_VELOCITY,
        Godot.Core.Physics2DServer._AREA_PARAM_LINEAR_DAMP,
        Godot.Core.Physics2DServer._BODY_PARAM_ANGULAR_DAMP,
        Godot.Core.Physics2DServer._SPACE_PARAM_BODY_TIME_TO_SLEEP,
        Godot.Core.Physics2DServer._BODY_PARAM_LINEAR_DAMP,
        Godot.Core.Physics2DServer._AREA_PARAM_GRAVITY_DISTANCE_SCALE,
        Godot.Core.Physics2DServer._BODY_STATE_ANGULAR_VELOCITY,
        Godot.Core.Physics2DServer._AREA_BODY_REMOVED,
        Godot.Core.Physics2DServer._BODY_STATE_SLEEPING,
        Godot.Core.Physics2DServer._INFO_ISLAND_COUNT,
        Godot.Core.Physics2DServer._AREA_SPACE_OVERRIDE_DISABLED,
        Godot.Core.Physics2DServer._AREA_PARAM_GRAVITY_IS_POINT,
        Godot.Core.Physics2DServer._AREA_PARAM_GRAVITY_POINT_ATTENUATION,
        Godot.Core.Physics2DServer._BODY_STATE_TRANSFORM,
        Godot.Core.Physics2DServer._BODY_PARAM_INERTIA,
        Godot.Core.Physics2DServer._BODY_PARAM_MASS,
        Godot.Core.Physics2DServer._BODY_MODE_STATIC,
        Godot.Core.Physics2DServer._JOINT_PARAM_MAX_BIAS,
        Godot.Core.Physics2DServer._SHAPE_SEGMENT,
        Godot.Core.Physics2DServer._BODY_PARAM_GRAVITY_SCALE,
        Godot.Core.Physics2DServer._JOINT_DAMPED_SPRING,
        Godot.Core.Physics2DServer._AREA_PARAM_GRAVITY,
        Godot.Core.Physics2DServer._INFO_COLLISION_PAIRS,
        Godot.Core.Physics2DServer._SHAPE_RECTANGLE,
        Godot.Core.Physics2DServer._INFO_ACTIVE_OBJECTS,
        Godot.Core.Physics2DServer._DAMPED_STRING_DAMPING,
        Godot.Core.Physics2DServer._SPACE_PARAM_CONTACT_RECYCLE_RADIUS,
        Godot.Core.Physics2DServer._SPACE_PARAM_CONTACT_MAX_SEPARATION,
        Godot.Core.Physics2DServer._DAMPED_STRING_REST_LENGTH,
        Godot.Core.Physics2DServer._AREA_BODY_ADDED,
        Godot.Core.Physics2DServer._AREA_SPACE_OVERRIDE_COMBINE_REPLACE,
        Godot.Core.Physics2DServer._SHAPE_CIRCLE,
        Godot.Core.Physics2DServer._SHAPE_CONVEX_POLYGON,
        Godot.Core.Physics2DServer._AREA_PARAM_PRIORITY,
        Godot.Core.Physics2DServer._AREA_SPACE_OVERRIDE_REPLACE_COMBINE,
        Godot.Core.Physics2DServer._BODY_MODE_RIGID,
        Godot.Core.Physics2DServer._SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION,
        Godot.Core.Physics2DServer._BODY_PARAM_FRICTION,
        Godot.Core.Physics2DServer._SHAPE_CAPSULE,
        Godot.Core.Physics2DServer._AREA_PARAM_ANGULAR_DAMP,
        Godot.Core.Physics2DServer._BODY_MODE_KINEMATIC,
        Godot.Core.Physics2DServer._SHAPE_CONCAVE_POLYGON,
        Godot.Core.Physics2DServer._AREA_PARAM_GRAVITY_VECTOR,
        Godot.Core.Physics2DServer._JOINT_PARAM_BIAS,
        Godot.Core.Physics2DServer._SHAPE_CUSTOM,
        Godot.Core.Physics2DServer._BODY_STATE_CAN_SLEEP,
        Godot.Core.Physics2DServer._BODY_PARAM_MAX,
        Godot.Core.Physics2DServer._SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD,
        Godot.Core.Physics2DServer._SHAPE_LINE,
        Godot.Core.Physics2DServer._JOINT_PIN,
        Godot.Core.Physics2DServer._AREA_SPACE_OVERRIDE_COMBINE,
        Godot.Core.Physics2DServer._DAMPED_STRING_STIFFNESS,
        Godot.Core.Physics2DServer._SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD,
        Godot.Core.Physics2DServer.area_add_shape,
        Godot.Core.Physics2DServer.area_attach_canvas_instance_id,
        Godot.Core.Physics2DServer.area_attach_object_instance_id,
        Godot.Core.Physics2DServer.area_clear_shapes,
        Godot.Core.Physics2DServer.area_create,
        Godot.Core.Physics2DServer.area_get_canvas_instance_id,
        Godot.Core.Physics2DServer.area_get_object_instance_id,
        Godot.Core.Physics2DServer.area_get_param,
        Godot.Core.Physics2DServer.area_get_shape,
        Godot.Core.Physics2DServer.area_get_shape_count,
        Godot.Core.Physics2DServer.area_get_shape_transform,
        Godot.Core.Physics2DServer.area_get_space,
        Godot.Core.Physics2DServer.area_get_space_override_mode,
        Godot.Core.Physics2DServer.area_get_transform,
        Godot.Core.Physics2DServer.area_remove_shape,
        Godot.Core.Physics2DServer.area_set_area_monitor_callback,
        Godot.Core.Physics2DServer.area_set_collision_layer,
        Godot.Core.Physics2DServer.area_set_collision_mask,
        Godot.Core.Physics2DServer.area_set_monitor_callback,
        Godot.Core.Physics2DServer.area_set_monitorable,
        Godot.Core.Physics2DServer.area_set_param,
        Godot.Core.Physics2DServer.area_set_shape,
        Godot.Core.Physics2DServer.area_set_shape_disabled,
        Godot.Core.Physics2DServer.area_set_shape_transform,
        Godot.Core.Physics2DServer.area_set_space,
        Godot.Core.Physics2DServer.area_set_space_override_mode,
        Godot.Core.Physics2DServer.area_set_transform,
        Godot.Core.Physics2DServer.body_add_central_force,
        Godot.Core.Physics2DServer.body_add_collision_exception,
        Godot.Core.Physics2DServer.body_add_force,
        Godot.Core.Physics2DServer.body_add_shape,
        Godot.Core.Physics2DServer.body_add_torque,
        Godot.Core.Physics2DServer.body_apply_central_impulse,
        Godot.Core.Physics2DServer.body_apply_impulse,
        Godot.Core.Physics2DServer.body_apply_torque_impulse,
        Godot.Core.Physics2DServer.body_attach_canvas_instance_id,
        Godot.Core.Physics2DServer.body_attach_object_instance_id,
        Godot.Core.Physics2DServer.body_clear_shapes,
        Godot.Core.Physics2DServer.body_create,
        Godot.Core.Physics2DServer.body_get_canvas_instance_id,
        Godot.Core.Physics2DServer.body_get_collision_layer,
        Godot.Core.Physics2DServer.body_get_collision_mask,
        Godot.Core.Physics2DServer.body_get_continuous_collision_detection_mode,
        Godot.Core.Physics2DServer.body_get_direct_state,
        Godot.Core.Physics2DServer.body_get_max_contacts_reported,
        Godot.Core.Physics2DServer.body_get_mode,
        Godot.Core.Physics2DServer.body_get_object_instance_id,
        Godot.Core.Physics2DServer.body_get_param,
        Godot.Core.Physics2DServer.body_get_shape,
        Godot.Core.Physics2DServer.body_get_shape_count,
        Godot.Core.Physics2DServer.body_get_shape_metadata,
        Godot.Core.Physics2DServer.body_get_shape_transform,
        Godot.Core.Physics2DServer.body_get_space,
        Godot.Core.Physics2DServer.body_get_state,
        Godot.Core.Physics2DServer.body_is_omitting_force_integration,
        Godot.Core.Physics2DServer.body_remove_collision_exception,
        Godot.Core.Physics2DServer.body_remove_shape,
        Godot.Core.Physics2DServer.body_set_axis_velocity,
        Godot.Core.Physics2DServer.body_set_collision_layer,
        Godot.Core.Physics2DServer.body_set_collision_mask,
        Godot.Core.Physics2DServer.body_set_continuous_collision_detection_mode,
        Godot.Core.Physics2DServer.body_set_force_integration_callback,
        Godot.Core.Physics2DServer.body_set_max_contacts_reported,
        Godot.Core.Physics2DServer.body_set_mode,
        Godot.Core.Physics2DServer.body_set_omit_force_integration,
        Godot.Core.Physics2DServer.body_set_param,
        Godot.Core.Physics2DServer.body_set_shape,
        Godot.Core.Physics2DServer.body_set_shape_as_one_way_collision,
        Godot.Core.Physics2DServer.body_set_shape_disabled,
        Godot.Core.Physics2DServer.body_set_shape_metadata,
        Godot.Core.Physics2DServer.body_set_shape_transform,
        Godot.Core.Physics2DServer.body_set_space,
        Godot.Core.Physics2DServer.body_set_state,
        Godot.Core.Physics2DServer.body_test_motion,
        Godot.Core.Physics2DServer.capsule_shape_create,
        Godot.Core.Physics2DServer.circle_shape_create,
        Godot.Core.Physics2DServer.concave_polygon_shape_create,
        Godot.Core.Physics2DServer.convex_polygon_shape_create,
        Godot.Core.Physics2DServer.damped_spring_joint_create,
        Godot.Core.Physics2DServer.damped_string_joint_get_param,
        Godot.Core.Physics2DServer.damped_string_joint_set_param,
        Godot.Core.Physics2DServer.free_rid,
        Godot.Core.Physics2DServer.get_process_info,
        Godot.Core.Physics2DServer.groove_joint_create,
        Godot.Core.Physics2DServer.joint_get_param,
        Godot.Core.Physics2DServer.joint_get_type,
        Godot.Core.Physics2DServer.joint_set_param,
        Godot.Core.Physics2DServer.line_shape_create,
        Godot.Core.Physics2DServer.pin_joint_create,
        Godot.Core.Physics2DServer.ray_shape_create,
        Godot.Core.Physics2DServer.rectangle_shape_create,
        Godot.Core.Physics2DServer.segment_shape_create,
        Godot.Core.Physics2DServer.set_active,
        Godot.Core.Physics2DServer.shape_get_data,
        Godot.Core.Physics2DServer.shape_get_type,
        Godot.Core.Physics2DServer.shape_set_data,
        Godot.Core.Physics2DServer.space_create,
        Godot.Core.Physics2DServer.space_get_direct_state,
        Godot.Core.Physics2DServer.space_get_param,
        Godot.Core.Physics2DServer.space_is_active,
        Godot.Core.Physics2DServer.space_set_active,
        Godot.Core.Physics2DServer.space_set_param)
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
_SPACE_PARAM_CONSTRAINT_DEFAULT_BIAS = 6

_AREA_SPACE_OVERRIDE_REPLACE :: Int
_AREA_SPACE_OVERRIDE_REPLACE = 3

_SPACE_PARAM_TEST_MOTION_MIN_CONTACT_DEPTH :: Int
_SPACE_PARAM_TEST_MOTION_MIN_CONTACT_DEPTH = 7

_CCD_MODE_DISABLED :: Int
_CCD_MODE_DISABLED = 0

_JOINT_PARAM_MAX_FORCE :: Int
_JOINT_PARAM_MAX_FORCE = 2

_CCD_MODE_CAST_RAY :: Int
_CCD_MODE_CAST_RAY = 1

_JOINT_GROOVE :: Int
_JOINT_GROOVE = 1

_BODY_PARAM_BOUNCE :: Int
_BODY_PARAM_BOUNCE = 0

_BODY_MODE_CHARACTER :: Int
_BODY_MODE_CHARACTER = 3

_SHAPE_RAY :: Int
_SHAPE_RAY = 1

_CCD_MODE_CAST_SHAPE :: Int
_CCD_MODE_CAST_SHAPE = 2

_BODY_STATE_LINEAR_VELOCITY :: Int
_BODY_STATE_LINEAR_VELOCITY = 1

_AREA_PARAM_LINEAR_DAMP :: Int
_AREA_PARAM_LINEAR_DAMP = 5

_BODY_PARAM_ANGULAR_DAMP :: Int
_BODY_PARAM_ANGULAR_DAMP = 6

_SPACE_PARAM_BODY_TIME_TO_SLEEP :: Int
_SPACE_PARAM_BODY_TIME_TO_SLEEP = 5

_BODY_PARAM_LINEAR_DAMP :: Int
_BODY_PARAM_LINEAR_DAMP = 5

_AREA_PARAM_GRAVITY_DISTANCE_SCALE :: Int
_AREA_PARAM_GRAVITY_DISTANCE_SCALE = 3

_BODY_STATE_ANGULAR_VELOCITY :: Int
_BODY_STATE_ANGULAR_VELOCITY = 2

_AREA_BODY_REMOVED :: Int
_AREA_BODY_REMOVED = 1

_BODY_STATE_SLEEPING :: Int
_BODY_STATE_SLEEPING = 3

_INFO_ISLAND_COUNT :: Int
_INFO_ISLAND_COUNT = 2

_AREA_SPACE_OVERRIDE_DISABLED :: Int
_AREA_SPACE_OVERRIDE_DISABLED = 0

_AREA_PARAM_GRAVITY_IS_POINT :: Int
_AREA_PARAM_GRAVITY_IS_POINT = 2

_AREA_PARAM_GRAVITY_POINT_ATTENUATION :: Int
_AREA_PARAM_GRAVITY_POINT_ATTENUATION = 4

_BODY_STATE_TRANSFORM :: Int
_BODY_STATE_TRANSFORM = 0

_BODY_PARAM_INERTIA :: Int
_BODY_PARAM_INERTIA = 3

_BODY_PARAM_MASS :: Int
_BODY_PARAM_MASS = 2

_BODY_MODE_STATIC :: Int
_BODY_MODE_STATIC = 0

_JOINT_PARAM_MAX_BIAS :: Int
_JOINT_PARAM_MAX_BIAS = 1

_SHAPE_SEGMENT :: Int
_SHAPE_SEGMENT = 2

_BODY_PARAM_GRAVITY_SCALE :: Int
_BODY_PARAM_GRAVITY_SCALE = 4

_JOINT_DAMPED_SPRING :: Int
_JOINT_DAMPED_SPRING = 2

_AREA_PARAM_GRAVITY :: Int
_AREA_PARAM_GRAVITY = 0

_INFO_COLLISION_PAIRS :: Int
_INFO_COLLISION_PAIRS = 1

_SHAPE_RECTANGLE :: Int
_SHAPE_RECTANGLE = 4

_INFO_ACTIVE_OBJECTS :: Int
_INFO_ACTIVE_OBJECTS = 0

_DAMPED_STRING_DAMPING :: Int
_DAMPED_STRING_DAMPING = 2

_SPACE_PARAM_CONTACT_RECYCLE_RADIUS :: Int
_SPACE_PARAM_CONTACT_RECYCLE_RADIUS = 0

_SPACE_PARAM_CONTACT_MAX_SEPARATION :: Int
_SPACE_PARAM_CONTACT_MAX_SEPARATION = 1

_DAMPED_STRING_REST_LENGTH :: Int
_DAMPED_STRING_REST_LENGTH = 0

_AREA_BODY_ADDED :: Int
_AREA_BODY_ADDED = 0

_AREA_SPACE_OVERRIDE_COMBINE_REPLACE :: Int
_AREA_SPACE_OVERRIDE_COMBINE_REPLACE = 2

_SHAPE_CIRCLE :: Int
_SHAPE_CIRCLE = 3

_SHAPE_CONVEX_POLYGON :: Int
_SHAPE_CONVEX_POLYGON = 6

_AREA_PARAM_PRIORITY :: Int
_AREA_PARAM_PRIORITY = 7

_AREA_SPACE_OVERRIDE_REPLACE_COMBINE :: Int
_AREA_SPACE_OVERRIDE_REPLACE_COMBINE = 4

_BODY_MODE_RIGID :: Int
_BODY_MODE_RIGID = 2

_SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION :: Int
_SPACE_PARAM_BODY_MAX_ALLOWED_PENETRATION = 2

_BODY_PARAM_FRICTION :: Int
_BODY_PARAM_FRICTION = 1

_SHAPE_CAPSULE :: Int
_SHAPE_CAPSULE = 5

_AREA_PARAM_ANGULAR_DAMP :: Int
_AREA_PARAM_ANGULAR_DAMP = 6

_BODY_MODE_KINEMATIC :: Int
_BODY_MODE_KINEMATIC = 1

_SHAPE_CONCAVE_POLYGON :: Int
_SHAPE_CONCAVE_POLYGON = 7

_AREA_PARAM_GRAVITY_VECTOR :: Int
_AREA_PARAM_GRAVITY_VECTOR = 1

_JOINT_PARAM_BIAS :: Int
_JOINT_PARAM_BIAS = 0

_SHAPE_CUSTOM :: Int
_SHAPE_CUSTOM = 8

_BODY_STATE_CAN_SLEEP :: Int
_BODY_STATE_CAN_SLEEP = 4

_BODY_PARAM_MAX :: Int
_BODY_PARAM_MAX = 7

_SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD :: Int
_SPACE_PARAM_BODY_ANGULAR_VELOCITY_SLEEP_THRESHOLD = 4

_SHAPE_LINE :: Int
_SHAPE_LINE = 0

_JOINT_PIN :: Int
_JOINT_PIN = 0

_AREA_SPACE_OVERRIDE_COMBINE :: Int
_AREA_SPACE_OVERRIDE_COMBINE = 1

_DAMPED_STRING_STIFFNESS :: Int
_DAMPED_STRING_STIFFNESS = 1

_SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD :: Int
_SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD = 3

{-# NOINLINE bindPhysics2DServer_area_add_shape #-}

-- | Adds a shape to the area, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
bindPhysics2DServer_area_add_shape :: MethodBind
bindPhysics2DServer_area_add_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a shape to the area, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
area_add_shape ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> Maybe Transform2d -> Maybe Bool -> IO ()
area_add_shape cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantTransform2d
         (TF2d (V2 1 0) (V2 0 1) (V2 0 0))
         arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_add_shape"
           '[Rid, Rid, Maybe Transform2d, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_add_shape

{-# NOINLINE bindPhysics2DServer_area_attach_canvas_instance_id #-}

bindPhysics2DServer_area_attach_canvas_instance_id :: MethodBind
bindPhysics2DServer_area_attach_canvas_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_attach_canvas_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_attach_canvas_instance_id ::
                                 (Physics2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO ()
area_attach_canvas_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_attach_canvas_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "area_attach_canvas_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.area_attach_canvas_instance_id

{-# NOINLINE bindPhysics2DServer_area_attach_object_instance_id #-}

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
bindPhysics2DServer_area_attach_object_instance_id :: MethodBind
bindPhysics2DServer_area_attach_object_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_attach_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
area_attach_object_instance_id ::
                                 (Physics2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO ()
area_attach_object_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_attach_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "area_attach_object_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.area_attach_object_instance_id

{-# NOINLINE bindPhysics2DServer_area_clear_shapes #-}

-- | Removes all shapes from an area. It does not delete the shapes, so they can be reassigned later.
bindPhysics2DServer_area_clear_shapes :: MethodBind
bindPhysics2DServer_area_clear_shapes
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from an area. It does not delete the shapes, so they can be reassigned later.
area_clear_shapes ::
                    (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO ()
area_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_clear_shapes" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_clear_shapes

{-# NOINLINE bindPhysics2DServer_area_create #-}

-- | Creates an @Area2D@.
bindPhysics2DServer_area_create :: MethodBind
bindPhysics2DServer_area_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an @Area2D@.
area_create ::
              (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
area_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_create

{-# NOINLINE bindPhysics2DServer_area_get_canvas_instance_id #-}

bindPhysics2DServer_area_get_canvas_instance_id :: MethodBind
bindPhysics2DServer_area_get_canvas_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_canvas_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_get_canvas_instance_id ::
                              (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_canvas_instance_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_get_canvas_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_canvas_instance_id"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_canvas_instance_id

{-# NOINLINE bindPhysics2DServer_area_get_object_instance_id #-}

-- | Gets the instance ID of the object the area is assigned to.
bindPhysics2DServer_area_get_object_instance_id :: MethodBind
bindPhysics2DServer_area_get_object_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the instance ID of the object the area is assigned to.
area_get_object_instance_id ::
                              (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_object_instance_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_get_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_object_instance_id"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_object_instance_id

{-# NOINLINE bindPhysics2DServer_area_get_param #-}

-- | Returns an area parameter value. See @enum AreaParameter@ for a list of available parameters.
bindPhysics2DServer_area_get_param :: MethodBind
bindPhysics2DServer_area_get_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an area parameter value. See @enum AreaParameter@ for a list of available parameters.
area_get_param ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO GodotVariant
area_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_param" '[Rid, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_param

{-# NOINLINE bindPhysics2DServer_area_get_shape #-}

-- | Returns the @RID@ of the nth shape of an area.
bindPhysics2DServer_area_get_shape :: MethodBind
bindPhysics2DServer_area_get_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the nth shape of an area.
area_get_shape ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO Rid
area_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_shape" '[Rid, Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_shape

{-# NOINLINE bindPhysics2DServer_area_get_shape_count #-}

-- | Returns the number of shapes assigned to an area.
bindPhysics2DServer_area_get_shape_count :: MethodBind
bindPhysics2DServer_area_get_shape_count
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes assigned to an area.
area_get_shape_count ::
                       (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_shape_count" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_shape_count

{-# NOINLINE bindPhysics2DServer_area_get_shape_transform #-}

-- | Returns the transform matrix of a shape within an area.
bindPhysics2DServer_area_get_shape_transform :: MethodBind
bindPhysics2DServer_area_get_shape_transform
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix of a shape within an area.
area_get_shape_transform ::
                           (Physics2DServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> IO Transform2d
area_get_shape_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_get_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_shape_transform"
           '[Rid, Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_shape_transform

{-# NOINLINE bindPhysics2DServer_area_get_space #-}

-- | Returns the space assigned to the area.
bindPhysics2DServer_area_get_space :: MethodBind
bindPhysics2DServer_area_get_space
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the space assigned to the area.
area_get_space ::
                 (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
area_get_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_get_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_space" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_space

{-# NOINLINE bindPhysics2DServer_area_get_space_override_mode #-}

-- | Returns the space override mode for the area.
bindPhysics2DServer_area_get_space_override_mode :: MethodBind
bindPhysics2DServer_area_get_space_override_mode
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the space override mode for the area.
area_get_space_override_mode ::
                               (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
area_get_space_override_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_get_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_space_override_mode"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DServer.area_get_space_override_mode

{-# NOINLINE bindPhysics2DServer_area_get_transform #-}

-- | Returns the transform matrix for an area.
bindPhysics2DServer_area_get_transform :: MethodBind
bindPhysics2DServer_area_get_transform
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix for an area.
area_get_transform ::
                     (Physics2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> IO Transform2d
area_get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_get_transform" '[Rid]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Physics2DServer.area_get_transform

{-# NOINLINE bindPhysics2DServer_area_remove_shape #-}

-- | Removes a shape from an area. It does not delete the shape, so it can be reassigned later.
bindPhysics2DServer_area_remove_shape :: MethodBind
bindPhysics2DServer_area_remove_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from an area. It does not delete the shape, so it can be reassigned later.
area_remove_shape ::
                    (Physics2DServer :< cls, Object :< cls) =>
                    cls -> Rid -> Int -> IO ()
area_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_remove_shape" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_remove_shape

{-# NOINLINE bindPhysics2DServer_area_set_area_monitor_callback #-}

bindPhysics2DServer_area_set_area_monitor_callback :: MethodBind
bindPhysics2DServer_area_set_area_monitor_callback
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_area_monitor_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_set_area_monitor_callback ::
                                 (Physics2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Object -> GodotString -> IO ()
area_set_area_monitor_callback cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_set_area_monitor_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "area_set_area_monitor_callback"
           '[Rid, Object, GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.area_set_area_monitor_callback

{-# NOINLINE bindPhysics2DServer_area_set_collision_layer #-}

-- | Assigns the area to one or many physics layers.
bindPhysics2DServer_area_set_collision_layer :: MethodBind
bindPhysics2DServer_area_set_collision_layer
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the area to one or many physics layers.
area_set_collision_layer ::
                           (Physics2DServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> IO ()
area_set_collision_layer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_collision_layer"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_collision_layer

{-# NOINLINE bindPhysics2DServer_area_set_collision_mask #-}

-- | Sets which physics layers the area will monitor.
bindPhysics2DServer_area_set_collision_mask :: MethodBind
bindPhysics2DServer_area_set_collision_mask
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets which physics layers the area will monitor.
area_set_collision_mask ::
                          (Physics2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> IO ()
area_set_collision_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_collision_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_collision_mask

{-# NOINLINE bindPhysics2DServer_area_set_monitor_callback #-}

-- | Sets the function to call when any body/area enters or exits the area. This callback will be called for any object interacting with the area, and takes five parameters:
--   				1: @AREA_BODY_ADDED@ or @AREA_BODY_REMOVED@, depending on whether the object entered or exited the area.
--   				2: @RID@ of the object that entered/exited the area.
--   				3: Instance ID of the object that entered/exited the area.
--   				4: The shape index of the object that entered/exited the area.
--   				5: The shape index of the area where the object entered/exited.
bindPhysics2DServer_area_set_monitor_callback :: MethodBind
bindPhysics2DServer_area_set_monitor_callback
  = unsafePerformIO $
      withCString "Physics2DServer" $
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
                            (Physics2DServer :< cls, Object :< cls) =>
                            cls -> Rid -> Object -> GodotString -> IO ()
area_set_monitor_callback cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_set_monitor_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_monitor_callback"
           '[Rid, Object, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_monitor_callback

{-# NOINLINE bindPhysics2DServer_area_set_monitorable #-}

bindPhysics2DServer_area_set_monitorable :: MethodBind
bindPhysics2DServer_area_set_monitorable
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

area_set_monitorable ::
                       (Physics2DServer :< cls, Object :< cls) =>
                       cls -> Rid -> Bool -> IO ()
area_set_monitorable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_monitorable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_monitorable"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_monitorable

{-# NOINLINE bindPhysics2DServer_area_set_param #-}

-- | Sets the value for an area parameter. See @enum AreaParameter@ for a list of available parameters.
bindPhysics2DServer_area_set_param :: MethodBind
bindPhysics2DServer_area_set_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value for an area parameter. See @enum AreaParameter@ for a list of available parameters.
area_set_param ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> GodotVariant -> IO ()
area_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_param"
           '[Rid, Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_param

{-# NOINLINE bindPhysics2DServer_area_set_shape #-}

-- | Substitutes a given area shape by another. The old shape is selected by its index, the new one by its @RID@.
bindPhysics2DServer_area_set_shape :: MethodBind
bindPhysics2DServer_area_set_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Substitutes a given area shape by another. The old shape is selected by its index, the new one by its @RID@.
area_set_shape ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> Rid -> IO ()
area_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_shape"
           '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_shape

{-# NOINLINE bindPhysics2DServer_area_set_shape_disabled #-}

-- | Disables a given shape in an area.
bindPhysics2DServer_area_set_shape_disabled :: MethodBind
bindPhysics2DServer_area_set_shape_disabled
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_shape_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables a given shape in an area.
area_set_shape_disabled ::
                          (Physics2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> Bool -> IO ()
area_set_shape_disabled cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_shape_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_shape_disabled"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_shape_disabled

{-# NOINLINE bindPhysics2DServer_area_set_shape_transform #-}

-- | Sets the transform matrix for an area shape.
bindPhysics2DServer_area_set_shape_transform :: MethodBind
bindPhysics2DServer_area_set_shape_transform
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform matrix for an area shape.
area_set_shape_transform ::
                           (Physics2DServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> Transform2d -> IO ()
area_set_shape_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_shape_transform"
           '[Rid, Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_shape_transform

{-# NOINLINE bindPhysics2DServer_area_set_space #-}

-- | Assigns a space to the area.
bindPhysics2DServer_area_set_space :: MethodBind
bindPhysics2DServer_area_set_space
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a space to the area.
area_set_space ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> IO ()
area_set_space cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_space" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_space

{-# NOINLINE bindPhysics2DServer_area_set_space_override_mode #-}

-- | Sets the space override mode for the area. See @enum AreaSpaceOverrideMode@ for a list of available modes.
bindPhysics2DServer_area_set_space_override_mode :: MethodBind
bindPhysics2DServer_area_set_space_override_mode
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the space override mode for the area. See @enum AreaSpaceOverrideMode@ for a list of available modes.
area_set_space_override_mode ::
                               (Physics2DServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> IO ()
area_set_space_override_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_area_set_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_space_override_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.area_set_space_override_mode

{-# NOINLINE bindPhysics2DServer_area_set_transform #-}

-- | Sets the transform matrix for an area.
bindPhysics2DServer_area_set_transform :: MethodBind
bindPhysics2DServer_area_set_transform
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "area_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform matrix for an area.
area_set_transform ::
                     (Physics2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> Transform2d -> IO ()
area_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_area_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "area_set_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.area_set_transform

{-# NOINLINE bindPhysics2DServer_body_add_central_force #-}

bindPhysics2DServer_body_add_central_force :: MethodBind
bindPhysics2DServer_body_add_central_force
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_add_central_force ::
                         (Physics2DServer :< cls, Object :< cls) =>
                         cls -> Rid -> Vector2 -> IO ()
body_add_central_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_add_central_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_add_central_force"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_add_central_force

{-# NOINLINE bindPhysics2DServer_body_add_collision_exception #-}

-- | Adds a body to the list of bodies exempt from collisions.
bindPhysics2DServer_body_add_collision_exception :: MethodBind
bindPhysics2DServer_body_add_collision_exception
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_add_collision_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies exempt from collisions.
body_add_collision_exception ::
                               (Physics2DServer :< cls, Object :< cls) =>
                               cls -> Rid -> Rid -> IO ()
body_add_collision_exception cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_add_collision_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_add_collision_exception"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_add_collision_exception

{-# NOINLINE bindPhysics2DServer_body_add_force #-}

-- | Adds a positioned force to the applied force and torque. As with @method body_apply_impulse@, both the force and the offset from the body origin are in global coordinates. A force differs from an impulse in that, while the two are forces, the impulse clears itself after being applied.
bindPhysics2DServer_body_add_force :: MethodBind
bindPhysics2DServer_body_add_force
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a positioned force to the applied force and torque. As with @method body_apply_impulse@, both the force and the offset from the body origin are in global coordinates. A force differs from an impulse in that, while the two are forces, the impulse clears itself after being applied.
body_add_force ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Vector2 -> Vector2 -> IO ()
body_add_force cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_add_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_add_force"
           '[Rid, Vector2, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_add_force

{-# NOINLINE bindPhysics2DServer_body_add_shape #-}

-- | Adds a shape to the body, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
bindPhysics2DServer_body_add_shape :: MethodBind
bindPhysics2DServer_body_add_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a shape to the body, along with a transform matrix. Shapes are usually referenced by their index, so you should track which shape has a given index.
body_add_shape ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> Maybe Transform2d -> Maybe Bool -> IO ()
body_add_shape cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantTransform2d
         (TF2d (V2 1 0) (V2 0 1) (V2 0 0))
         arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_add_shape"
           '[Rid, Rid, Maybe Transform2d, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_add_shape

{-# NOINLINE bindPhysics2DServer_body_add_torque #-}

bindPhysics2DServer_body_add_torque :: MethodBind
bindPhysics2DServer_body_add_torque
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_add_torque ::
                  (Physics2DServer :< cls, Object :< cls) =>
                  cls -> Rid -> Float -> IO ()
body_add_torque cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_add_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_add_torque" '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_add_torque

{-# NOINLINE bindPhysics2DServer_body_apply_central_impulse #-}

bindPhysics2DServer_body_apply_central_impulse :: MethodBind
bindPhysics2DServer_body_apply_central_impulse
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_apply_central_impulse ::
                             (Physics2DServer :< cls, Object :< cls) =>
                             cls -> Rid -> Vector2 -> IO ()
body_apply_central_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_apply_central_impulse"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_apply_central_impulse

{-# NOINLINE bindPhysics2DServer_body_apply_impulse #-}

-- | Adds a positioned impulse to the applied force and torque. Both the force and the offset from the body origin are in global coordinates.
bindPhysics2DServer_body_apply_impulse :: MethodBind
bindPhysics2DServer_body_apply_impulse
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a positioned impulse to the applied force and torque. Both the force and the offset from the body origin are in global coordinates.
body_apply_impulse ::
                     (Physics2DServer :< cls, Object :< cls) =>
                     cls -> Rid -> Vector2 -> Vector2 -> IO ()
body_apply_impulse cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_apply_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_apply_impulse"
           '[Rid, Vector2, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_apply_impulse

{-# NOINLINE bindPhysics2DServer_body_apply_torque_impulse #-}

bindPhysics2DServer_body_apply_torque_impulse :: MethodBind
bindPhysics2DServer_body_apply_torque_impulse
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_apply_torque_impulse ::
                            (Physics2DServer :< cls, Object :< cls) =>
                            cls -> Rid -> Float -> IO ()
body_apply_torque_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_apply_torque_impulse"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_apply_torque_impulse

{-# NOINLINE bindPhysics2DServer_body_attach_canvas_instance_id #-}

bindPhysics2DServer_body_attach_canvas_instance_id :: MethodBind
bindPhysics2DServer_body_attach_canvas_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_attach_canvas_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_attach_canvas_instance_id ::
                                 (Physics2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO ()
body_attach_canvas_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_attach_canvas_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_attach_canvas_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_attach_canvas_instance_id

{-# NOINLINE bindPhysics2DServer_body_attach_object_instance_id #-}

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
bindPhysics2DServer_body_attach_object_instance_id :: MethodBind
bindPhysics2DServer_body_attach_object_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_attach_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the area to a descendant of @Object@, so it can exist in the node tree.
body_attach_object_instance_id ::
                                 (Physics2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO ()
body_attach_object_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_attach_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_attach_object_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_attach_object_instance_id

{-# NOINLINE bindPhysics2DServer_body_clear_shapes #-}

-- | Removes all shapes from a body.
bindPhysics2DServer_body_clear_shapes :: MethodBind
bindPhysics2DServer_body_clear_shapes
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from a body.
body_clear_shapes ::
                    (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO ()
body_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_clear_shapes" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_clear_shapes

{-# NOINLINE bindPhysics2DServer_body_create #-}

-- | Creates a physics body.
bindPhysics2DServer_body_create :: MethodBind
bindPhysics2DServer_body_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a physics body.
body_create ::
              (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
body_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_create

{-# NOINLINE bindPhysics2DServer_body_get_canvas_instance_id #-}

bindPhysics2DServer_body_get_canvas_instance_id :: MethodBind
bindPhysics2DServer_body_get_canvas_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_canvas_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

body_get_canvas_instance_id ::
                              (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_canvas_instance_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_get_canvas_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_canvas_instance_id"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_canvas_instance_id

{-# NOINLINE bindPhysics2DServer_body_get_collision_layer #-}

-- | Returns the physics layer or layers a body belongs to.
bindPhysics2DServer_body_get_collision_layer :: MethodBind
bindPhysics2DServer_body_get_collision_layer
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the physics layer or layers a body belongs to.
body_get_collision_layer ::
                           (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_collision_layer"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_collision_layer

{-# NOINLINE bindPhysics2DServer_body_get_collision_mask #-}

-- | Returns the physics layer or layers a body can collide with.
bindPhysics2DServer_body_get_collision_mask :: MethodBind
bindPhysics2DServer_body_get_collision_mask
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the physics layer or layers a body can collide with.
body_get_collision_mask ::
                          (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_collision_mask"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_collision_mask

{-# NOINLINE bindPhysics2DServer_body_get_continuous_collision_detection_mode
             #-}

-- | Returns the continuous collision detection mode.
bindPhysics2DServer_body_get_continuous_collision_detection_mode ::
                                                                 MethodBind
bindPhysics2DServer_body_get_continuous_collision_detection_mode
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_continuous_collision_detection_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the continuous collision detection mode.
body_get_continuous_collision_detection_mode ::
                                               (Physics2DServer :< cls, Object :< cls) =>
                                               cls -> Rid -> IO Int
body_get_continuous_collision_detection_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_get_continuous_collision_detection_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_get_continuous_collision_detection_mode"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_get_continuous_collision_detection_mode

{-# NOINLINE bindPhysics2DServer_body_get_direct_state #-}

-- | Returns the @Physics2DDirectBodyState@ of the body.
bindPhysics2DServer_body_get_direct_state :: MethodBind
bindPhysics2DServer_body_get_direct_state
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_direct_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Physics2DDirectBodyState@ of the body.
body_get_direct_state ::
                        (Physics2DServer :< cls, Object :< cls) =>
                        cls -> Rid -> IO Physics2DDirectBodyState
body_get_direct_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_direct_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_direct_state" '[Rid]
           (IO Physics2DDirectBodyState)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_direct_state

{-# NOINLINE bindPhysics2DServer_body_get_max_contacts_reported #-}

-- | Returns the maximum contacts that can be reported. See @method body_set_max_contacts_reported@.
bindPhysics2DServer_body_get_max_contacts_reported :: MethodBind
bindPhysics2DServer_body_get_max_contacts_reported
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the maximum contacts that can be reported. See @method body_set_max_contacts_reported@.
body_get_max_contacts_reported ::
                                 (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_max_contacts_reported cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_get_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_get_max_contacts_reported"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_get_max_contacts_reported

{-# NOINLINE bindPhysics2DServer_body_get_mode #-}

-- | Returns the body mode.
bindPhysics2DServer_body_get_mode :: MethodBind
bindPhysics2DServer_body_get_mode
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the body mode.
body_get_mode ::
                (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_mode" '[Rid] (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_mode

{-# NOINLINE bindPhysics2DServer_body_get_object_instance_id #-}

-- | Gets the instance ID of the object the area is assigned to.
bindPhysics2DServer_body_get_object_instance_id :: MethodBind
bindPhysics2DServer_body_get_object_instance_id
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the instance ID of the object the area is assigned to.
body_get_object_instance_id ::
                              (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_object_instance_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_get_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_object_instance_id"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_object_instance_id

{-# NOINLINE bindPhysics2DServer_body_get_param #-}

-- | Returns the value of a body parameter. See @enum BodyParameter@ for a list of available parameters.
bindPhysics2DServer_body_get_param :: MethodBind
bindPhysics2DServer_body_get_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a body parameter. See @enum BodyParameter@ for a list of available parameters.
body_get_param ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO Float
body_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_param" '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_param

{-# NOINLINE bindPhysics2DServer_body_get_shape #-}

-- | Returns the @RID@ of the nth shape of a body.
bindPhysics2DServer_body_get_shape :: MethodBind
bindPhysics2DServer_body_get_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the nth shape of a body.
body_get_shape ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO Rid
body_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_shape" '[Rid, Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_shape

{-# NOINLINE bindPhysics2DServer_body_get_shape_count #-}

-- | Returns the number of shapes assigned to a body.
bindPhysics2DServer_body_get_shape_count :: MethodBind
bindPhysics2DServer_body_get_shape_count
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes assigned to a body.
body_get_shape_count ::
                       (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
body_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_shape_count" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_shape_count

{-# NOINLINE bindPhysics2DServer_body_get_shape_metadata #-}

-- | Returns the metadata of a shape of a body.
bindPhysics2DServer_body_get_shape_metadata :: MethodBind
bindPhysics2DServer_body_get_shape_metadata
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_shape_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the metadata of a shape of a body.
body_get_shape_metadata ::
                          (Physics2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> IO GodotVariant
body_get_shape_metadata cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_shape_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_shape_metadata"
           '[Rid, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_shape_metadata

{-# NOINLINE bindPhysics2DServer_body_get_shape_transform #-}

-- | Returns the transform matrix of a body shape.
bindPhysics2DServer_body_get_shape_transform :: MethodBind
bindPhysics2DServer_body_get_shape_transform
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix of a body shape.
body_get_shape_transform ::
                           (Physics2DServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> IO Transform2d
body_get_shape_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_shape_transform"
           '[Rid, Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_shape_transform

{-# NOINLINE bindPhysics2DServer_body_get_space #-}

-- | Returns the @RID@ of the space assigned to a body.
bindPhysics2DServer_body_get_space :: MethodBind
bindPhysics2DServer_body_get_space
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the space assigned to a body.
body_get_space ::
                 (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
body_get_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_space" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_space

{-# NOINLINE bindPhysics2DServer_body_get_state #-}

-- | Returns a body state.
bindPhysics2DServer_body_get_state :: MethodBind
bindPhysics2DServer_body_get_state
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_get_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a body state.
body_get_state ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> IO GodotVariant
body_get_state cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_get_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_get_state" '[Rid, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_get_state

{-# NOINLINE bindPhysics2DServer_body_is_omitting_force_integration
             #-}

-- | Returns whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
bindPhysics2DServer_body_is_omitting_force_integration ::
                                                       MethodBind
bindPhysics2DServer_body_is_omitting_force_integration
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_is_omitting_force_integration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
body_is_omitting_force_integration ::
                                     (Physics2DServer :< cls, Object :< cls) =>
                                     cls -> Rid -> IO Bool
body_is_omitting_force_integration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_is_omitting_force_integration
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_is_omitting_force_integration"
           '[Rid]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_is_omitting_force_integration

{-# NOINLINE bindPhysics2DServer_body_remove_collision_exception
             #-}

-- | Removes a body from the list of bodies exempt from collisions.
bindPhysics2DServer_body_remove_collision_exception :: MethodBind
bindPhysics2DServer_body_remove_collision_exception
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_remove_collision_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies exempt from collisions.
body_remove_collision_exception ::
                                  (Physics2DServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Rid -> IO ()
body_remove_collision_exception cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_remove_collision_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_remove_collision_exception"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_remove_collision_exception

{-# NOINLINE bindPhysics2DServer_body_remove_shape #-}

-- | Removes a shape from a body. The shape is not deleted, so it can be reused afterwards.
bindPhysics2DServer_body_remove_shape :: MethodBind
bindPhysics2DServer_body_remove_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from a body. The shape is not deleted, so it can be reused afterwards.
body_remove_shape ::
                    (Physics2DServer :< cls, Object :< cls) =>
                    cls -> Rid -> Int -> IO ()
body_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_remove_shape" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_remove_shape

{-# NOINLINE bindPhysics2DServer_body_set_axis_velocity #-}

-- | Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
bindPhysics2DServer_body_set_axis_velocity :: MethodBind
bindPhysics2DServer_body_set_axis_velocity
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_axis_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
body_set_axis_velocity ::
                         (Physics2DServer :< cls, Object :< cls) =>
                         cls -> Rid -> Vector2 -> IO ()
body_set_axis_velocity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_axis_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_axis_velocity"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_axis_velocity

{-# NOINLINE bindPhysics2DServer_body_set_collision_layer #-}

-- | Sets the physics layer or layers a body belongs to.
bindPhysics2DServer_body_set_collision_layer :: MethodBind
bindPhysics2DServer_body_set_collision_layer
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the physics layer or layers a body belongs to.
body_set_collision_layer ::
                           (Physics2DServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> IO ()
body_set_collision_layer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_collision_layer"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_collision_layer

{-# NOINLINE bindPhysics2DServer_body_set_collision_mask #-}

-- | Sets the physics layer or layers a body can collide with.
bindPhysics2DServer_body_set_collision_mask :: MethodBind
bindPhysics2DServer_body_set_collision_mask
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the physics layer or layers a body can collide with.
body_set_collision_mask ::
                          (Physics2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> IO ()
body_set_collision_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_collision_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_collision_mask

{-# NOINLINE bindPhysics2DServer_body_set_continuous_collision_detection_mode
             #-}

-- | Sets the continuous collision detection mode using one of the @enum CCDMode@ constants.
--   				Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided.
bindPhysics2DServer_body_set_continuous_collision_detection_mode ::
                                                                 MethodBind
bindPhysics2DServer_body_set_continuous_collision_detection_mode
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_continuous_collision_detection_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the continuous collision detection mode using one of the @enum CCDMode@ constants.
--   				Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided.
body_set_continuous_collision_detection_mode ::
                                               (Physics2DServer :< cls, Object :< cls) =>
                                               cls -> Rid -> Int -> IO ()
body_set_continuous_collision_detection_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_set_continuous_collision_detection_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_set_continuous_collision_detection_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_set_continuous_collision_detection_mode

{-# NOINLINE bindPhysics2DServer_body_set_force_integration_callback
             #-}

-- | Sets the function used to calculate physics for an object, if that object allows it (see @method body_set_omit_force_integration@).
bindPhysics2DServer_body_set_force_integration_callback ::
                                                        MethodBind
bindPhysics2DServer_body_set_force_integration_callback
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_force_integration_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the function used to calculate physics for an object, if that object allows it (see @method body_set_omit_force_integration@).
body_set_force_integration_callback ::
                                      (Physics2DServer :< cls, Object :< cls) =>
                                      cls ->
                                        Rid -> Object -> GodotString -> Maybe GodotVariant -> IO ()
body_set_force_integration_callback cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_set_force_integration_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_set_force_integration_callback"
           '[Rid, Object, GodotString, Maybe GodotVariant]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_set_force_integration_callback

{-# NOINLINE bindPhysics2DServer_body_set_max_contacts_reported #-}

-- | Sets the maximum contacts to report. Bodies can keep a log of the contacts with other bodies, this is enabled by setting the maximum amount of contacts reported to a number greater than 0.
bindPhysics2DServer_body_set_max_contacts_reported :: MethodBind
bindPhysics2DServer_body_set_max_contacts_reported
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum contacts to report. Bodies can keep a log of the contacts with other bodies, this is enabled by setting the maximum amount of contacts reported to a number greater than 0.
body_set_max_contacts_reported ::
                                 (Physics2DServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO ()
body_set_max_contacts_reported cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_set_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_set_max_contacts_reported"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_set_max_contacts_reported

{-# NOINLINE bindPhysics2DServer_body_set_mode #-}

-- | Sets the body mode using one of the @enum BodyMode@ constants.
bindPhysics2DServer_body_set_mode :: MethodBind
bindPhysics2DServer_body_set_mode
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the body mode using one of the @enum BodyMode@ constants.
body_set_mode ::
                (Physics2DServer :< cls, Object :< cls) =>
                cls -> Rid -> Int -> IO ()
body_set_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_mode" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_mode

{-# NOINLINE bindPhysics2DServer_body_set_omit_force_integration
             #-}

-- | Sets whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
bindPhysics2DServer_body_set_omit_force_integration :: MethodBind
bindPhysics2DServer_body_set_omit_force_integration
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_omit_force_integration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether a body uses a callback function to calculate its own physics (see @method body_set_force_integration_callback@).
body_set_omit_force_integration ::
                                  (Physics2DServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Bool -> IO ()
body_set_omit_force_integration cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_set_omit_force_integration
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_set_omit_force_integration"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_set_omit_force_integration

{-# NOINLINE bindPhysics2DServer_body_set_param #-}

-- | Sets a body parameter. See @enum BodyParameter@ for a list of available parameters.
bindPhysics2DServer_body_set_param :: MethodBind
bindPhysics2DServer_body_set_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a body parameter. See @enum BodyParameter@ for a list of available parameters.
body_set_param ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> Float -> IO ()
body_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_param

{-# NOINLINE bindPhysics2DServer_body_set_shape #-}

-- | Substitutes a given body shape by another. The old shape is selected by its index, the new one by its @RID@.
bindPhysics2DServer_body_set_shape :: MethodBind
bindPhysics2DServer_body_set_shape
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Substitutes a given body shape by another. The old shape is selected by its index, the new one by its @RID@.
body_set_shape ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> Rid -> IO ()
body_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_shape"
           '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_shape

{-# NOINLINE bindPhysics2DServer_body_set_shape_as_one_way_collision
             #-}

-- | Enables one way collision on body if @enable@ is @true@.
bindPhysics2DServer_body_set_shape_as_one_way_collision ::
                                                        MethodBind
bindPhysics2DServer_body_set_shape_as_one_way_collision
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_shape_as_one_way_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables one way collision on body if @enable@ is @true@.
body_set_shape_as_one_way_collision ::
                                      (Physics2DServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> Bool -> Float -> IO ()
body_set_shape_as_one_way_collision cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_body_set_shape_as_one_way_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer
           "body_set_shape_as_one_way_collision"
           '[Rid, Int, Bool, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.body_set_shape_as_one_way_collision

{-# NOINLINE bindPhysics2DServer_body_set_shape_disabled #-}

-- | Disables shape in body if @disable@ is @true@.
bindPhysics2DServer_body_set_shape_disabled :: MethodBind
bindPhysics2DServer_body_set_shape_disabled
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_shape_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables shape in body if @disable@ is @true@.
body_set_shape_disabled ::
                          (Physics2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> Bool -> IO ()
body_set_shape_disabled cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_shape_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_shape_disabled"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_shape_disabled

{-# NOINLINE bindPhysics2DServer_body_set_shape_metadata #-}

-- | Sets metadata of a shape within a body. This metadata is different from @method Object.set_meta@, and can be retrieved on shape queries.
bindPhysics2DServer_body_set_shape_metadata :: MethodBind
bindPhysics2DServer_body_set_shape_metadata
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_shape_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets metadata of a shape within a body. This metadata is different from @method Object.set_meta@, and can be retrieved on shape queries.
body_set_shape_metadata ::
                          (Physics2DServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> GodotVariant -> IO ()
body_set_shape_metadata cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_shape_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_shape_metadata"
           '[Rid, Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_shape_metadata

{-# NOINLINE bindPhysics2DServer_body_set_shape_transform #-}

-- | Sets the transform matrix for a body shape.
bindPhysics2DServer_body_set_shape_transform :: MethodBind
bindPhysics2DServer_body_set_shape_transform
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform matrix for a body shape.
body_set_shape_transform ::
                           (Physics2DServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> Transform2d -> IO ()
body_set_shape_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_shape_transform"
           '[Rid, Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_shape_transform

{-# NOINLINE bindPhysics2DServer_body_set_space #-}

-- | Assigns a space to the body (see @method space_create@).
bindPhysics2DServer_body_set_space :: MethodBind
bindPhysics2DServer_body_set_space
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a space to the body (see @method space_create@).
body_set_space ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Rid -> IO ()
body_set_space cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_space" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_space

{-# NOINLINE bindPhysics2DServer_body_set_state #-}

-- | Sets a body state using one of the @enum BodyState@ constants.
--   				Note that the method doesn't take effect immediately. The state will change on the next physics frame.
bindPhysics2DServer_body_set_state :: MethodBind
bindPhysics2DServer_body_set_state
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_set_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a body state using one of the @enum BodyState@ constants.
--   				Note that the method doesn't take effect immediately. The state will change on the next physics frame.
body_set_state ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> Int -> GodotVariant -> IO ()
body_set_state cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_set_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_set_state"
           '[Rid, Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.body_set_state

{-# NOINLINE bindPhysics2DServer_body_test_motion #-}

-- | Returns @true@ if a collision would result from moving in the given direction from a given point in space. Margin increases the size of the shapes involved in the collision detection. @Physics2DTestMotionResult@ can be passed to return additional information in.
bindPhysics2DServer_body_test_motion :: MethodBind
bindPhysics2DServer_body_test_motion
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "body_test_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a collision would result from moving in the given direction from a given point in space. Margin increases the size of the shapes involved in the collision detection. @Physics2DTestMotionResult@ can be passed to return additional information in.
body_test_motion ::
                   (Physics2DServer :< cls, Object :< cls) =>
                   cls ->
                     Rid ->
                       Transform2d ->
                         Vector2 ->
                           Bool -> Maybe Float -> Maybe Physics2DTestMotionResult -> IO Bool
body_test_motion cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantReal (0.08)) toVariant arg5,
       maybe VariantNil toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_body_test_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "body_test_motion"
           '[Rid, Transform2d, Vector2, Bool, Maybe Float,
             Maybe Physics2DTestMotionResult]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Physics2DServer.body_test_motion

{-# NOINLINE bindPhysics2DServer_capsule_shape_create #-}

bindPhysics2DServer_capsule_shape_create :: MethodBind
bindPhysics2DServer_capsule_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "capsule_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

capsule_shape_create ::
                       (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
capsule_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_capsule_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "capsule_shape_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.capsule_shape_create

{-# NOINLINE bindPhysics2DServer_circle_shape_create #-}

bindPhysics2DServer_circle_shape_create :: MethodBind
bindPhysics2DServer_circle_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "circle_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

circle_shape_create ::
                      (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
circle_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_circle_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "circle_shape_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.circle_shape_create

{-# NOINLINE bindPhysics2DServer_concave_polygon_shape_create #-}

bindPhysics2DServer_concave_polygon_shape_create :: MethodBind
bindPhysics2DServer_concave_polygon_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "concave_polygon_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

concave_polygon_shape_create ::
                               (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
concave_polygon_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_concave_polygon_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "concave_polygon_shape_create"
           '[]
           (IO Rid)
         where
        nodeMethod
          = Godot.Core.Physics2DServer.concave_polygon_shape_create

{-# NOINLINE bindPhysics2DServer_convex_polygon_shape_create #-}

bindPhysics2DServer_convex_polygon_shape_create :: MethodBind
bindPhysics2DServer_convex_polygon_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "convex_polygon_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

convex_polygon_shape_create ::
                              (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
convex_polygon_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_convex_polygon_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "convex_polygon_shape_create"
           '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.convex_polygon_shape_create

{-# NOINLINE bindPhysics2DServer_damped_spring_joint_create #-}

-- | Creates a damped spring joint between two bodies. If not specified, the second body is assumed to be the joint itself.
bindPhysics2DServer_damped_spring_joint_create :: MethodBind
bindPhysics2DServer_damped_spring_joint_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "damped_spring_joint_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a damped spring joint between two bodies. If not specified, the second body is assumed to be the joint itself.
damped_spring_joint_create ::
                             (Physics2DServer :< cls, Object :< cls) =>
                             cls -> Vector2 -> Vector2 -> Rid -> Maybe Rid -> IO Rid
damped_spring_joint_create cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_damped_spring_joint_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "damped_spring_joint_create"
           '[Vector2, Vector2, Rid, Maybe Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.damped_spring_joint_create

{-# NOINLINE bindPhysics2DServer_damped_string_joint_get_param #-}

-- | Returns the value of a damped spring joint parameter.
bindPhysics2DServer_damped_string_joint_get_param :: MethodBind
bindPhysics2DServer_damped_string_joint_get_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "damped_string_joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a damped spring joint parameter.
damped_string_joint_get_param ::
                                (Physics2DServer :< cls, Object :< cls) =>
                                cls -> Rid -> Int -> IO Float
damped_string_joint_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_damped_string_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "damped_string_joint_get_param"
           '[Rid, Int]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Physics2DServer.damped_string_joint_get_param

{-# NOINLINE bindPhysics2DServer_damped_string_joint_set_param #-}

-- | Sets a damped spring joint parameter. See @enum DampedStringParam@ for a list of available parameters.
bindPhysics2DServer_damped_string_joint_set_param :: MethodBind
bindPhysics2DServer_damped_string_joint_set_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "damped_string_joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a damped spring joint parameter. See @enum DampedStringParam@ for a list of available parameters.
damped_string_joint_set_param ::
                                (Physics2DServer :< cls, Object :< cls) =>
                                cls -> Rid -> Int -> Float -> IO ()
damped_string_joint_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DServer_damped_string_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "damped_string_joint_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DServer.damped_string_joint_set_param

{-# NOINLINE bindPhysics2DServer_free_rid #-}

-- | Destroys any of the objects created by Physics2DServer. If the @RID@ passed is not one of the objects that can be created by Physics2DServer, an error will be sent to the console.
bindPhysics2DServer_free_rid :: MethodBind
bindPhysics2DServer_free_rid
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "free_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Destroys any of the objects created by Physics2DServer. If the @RID@ passed is not one of the objects that can be created by Physics2DServer, an error will be sent to the console.
free_rid ::
           (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO ()
free_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_free_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "free_rid" '[Rid] (IO ()) where
        nodeMethod = Godot.Core.Physics2DServer.free_rid

{-# NOINLINE bindPhysics2DServer_get_process_info #-}

-- | Returns information about the current state of the 2D physics engine. See @enum ProcessInfo@ for a list of available states.
bindPhysics2DServer_get_process_info :: MethodBind
bindPhysics2DServer_get_process_info
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "get_process_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns information about the current state of the 2D physics engine. See @enum ProcessInfo@ for a list of available states.
get_process_info ::
                   (Physics2DServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_process_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_get_process_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "get_process_info" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.get_process_info

{-# NOINLINE bindPhysics2DServer_groove_joint_create #-}

-- | Creates a groove joint between two bodies. If not specified, the bodies are assumed to be the joint itself.
bindPhysics2DServer_groove_joint_create :: MethodBind
bindPhysics2DServer_groove_joint_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "groove_joint_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a groove joint between two bodies. If not specified, the bodies are assumed to be the joint itself.
groove_joint_create ::
                      (Physics2DServer :< cls, Object :< cls) =>
                      cls ->
                        Vector2 -> Vector2 -> Vector2 -> Maybe Rid -> Maybe Rid -> IO Rid
groove_joint_create cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4, maybe VariantNil toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_groove_joint_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "groove_joint_create"
           '[Vector2, Vector2, Vector2, Maybe Rid, Maybe Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.groove_joint_create

{-# NOINLINE bindPhysics2DServer_joint_get_param #-}

-- | Returns the value of a joint parameter.
bindPhysics2DServer_joint_get_param :: MethodBind
bindPhysics2DServer_joint_get_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "joint_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a joint parameter.
joint_get_param ::
                  (Physics2DServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> IO Float
joint_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_joint_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "joint_get_param" '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Physics2DServer.joint_get_param

{-# NOINLINE bindPhysics2DServer_joint_get_type #-}

-- | Returns a joint's type (see @enum JointType@).
bindPhysics2DServer_joint_get_type :: MethodBind
bindPhysics2DServer_joint_get_type
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "joint_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a joint's type (see @enum JointType@).
joint_get_type ::
                 (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
joint_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_joint_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "joint_get_type" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.joint_get_type

{-# NOINLINE bindPhysics2DServer_joint_set_param #-}

-- | Sets a joint parameter. See @enum JointParam@ for a list of available parameters.
bindPhysics2DServer_joint_set_param :: MethodBind
bindPhysics2DServer_joint_set_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "joint_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a joint parameter. See @enum JointParam@ for a list of available parameters.
joint_set_param ::
                  (Physics2DServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> Float -> IO ()
joint_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_joint_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "joint_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.joint_set_param

{-# NOINLINE bindPhysics2DServer_line_shape_create #-}

bindPhysics2DServer_line_shape_create :: MethodBind
bindPhysics2DServer_line_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "line_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

line_shape_create ::
                    (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
line_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_line_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "line_shape_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.line_shape_create

{-# NOINLINE bindPhysics2DServer_pin_joint_create #-}

-- | Creates a pin joint between two bodies. If not specified, the second body is assumed to be the joint itself.
bindPhysics2DServer_pin_joint_create :: MethodBind
bindPhysics2DServer_pin_joint_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "pin_joint_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a pin joint between two bodies. If not specified, the second body is assumed to be the joint itself.
pin_joint_create ::
                   (Physics2DServer :< cls, Object :< cls) =>
                   cls -> Vector2 -> Rid -> Maybe Rid -> IO Rid
pin_joint_create cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_pin_joint_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "pin_joint_create"
           '[Vector2, Rid, Maybe Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.pin_joint_create

{-# NOINLINE bindPhysics2DServer_ray_shape_create #-}

bindPhysics2DServer_ray_shape_create :: MethodBind
bindPhysics2DServer_ray_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "ray_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

ray_shape_create ::
                   (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
ray_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_ray_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "ray_shape_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.ray_shape_create

{-# NOINLINE bindPhysics2DServer_rectangle_shape_create #-}

bindPhysics2DServer_rectangle_shape_create :: MethodBind
bindPhysics2DServer_rectangle_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "rectangle_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rectangle_shape_create ::
                         (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
rectangle_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_rectangle_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "rectangle_shape_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.rectangle_shape_create

{-# NOINLINE bindPhysics2DServer_segment_shape_create #-}

bindPhysics2DServer_segment_shape_create :: MethodBind
bindPhysics2DServer_segment_shape_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "segment_shape_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

segment_shape_create ::
                       (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
segment_shape_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_segment_shape_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "segment_shape_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.segment_shape_create

{-# NOINLINE bindPhysics2DServer_set_active #-}

-- | Activates or deactivates the 2D physics engine.
bindPhysics2DServer_set_active :: MethodBind
bindPhysics2DServer_set_active
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Activates or deactivates the 2D physics engine.
set_active ::
             (Physics2DServer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "set_active" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.set_active

{-# NOINLINE bindPhysics2DServer_shape_get_data #-}

-- | Returns the shape data.
bindPhysics2DServer_shape_get_data :: MethodBind
bindPhysics2DServer_shape_get_data
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "shape_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape data.
shape_get_data ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> IO GodotVariant
shape_get_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_shape_get_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "shape_get_data" '[Rid]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Physics2DServer.shape_get_data

{-# NOINLINE bindPhysics2DServer_shape_get_type #-}

-- | Returns a shape's type (see @enum ShapeType@).
bindPhysics2DServer_shape_get_type :: MethodBind
bindPhysics2DServer_shape_get_type
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "shape_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a shape's type (see @enum ShapeType@).
shape_get_type ::
                 (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Int
shape_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_shape_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "shape_get_type" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DServer.shape_get_type

{-# NOINLINE bindPhysics2DServer_shape_set_data #-}

-- | Sets the shape data that defines its shape and size. The data to be passed depends on the kind of shape created @method shape_get_type@.
bindPhysics2DServer_shape_set_data :: MethodBind
bindPhysics2DServer_shape_set_data
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "shape_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shape data that defines its shape and size. The data to be passed depends on the kind of shape created @method shape_get_type@.
shape_set_data ::
                 (Physics2DServer :< cls, Object :< cls) =>
                 cls -> Rid -> GodotVariant -> IO ()
shape_set_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_shape_set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "shape_set_data"
           '[Rid, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.shape_set_data

{-# NOINLINE bindPhysics2DServer_space_create #-}

-- | Creates a space. A space is a collection of parameters for the physics engine that can be assigned to an area or a body. It can be assigned to an area with @method area_set_space@, or to a body with @method body_set_space@.
bindPhysics2DServer_space_create :: MethodBind
bindPhysics2DServer_space_create
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "space_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a space. A space is a collection of parameters for the physics engine that can be assigned to an area or a body. It can be assigned to an area with @method area_set_space@, or to a body with @method body_set_space@.
space_create ::
               (Physics2DServer :< cls, Object :< cls) => cls -> IO Rid
space_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_space_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "space_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DServer.space_create

{-# NOINLINE bindPhysics2DServer_space_get_direct_state #-}

-- | Returns the state of a space, a @Physics2DDirectSpaceState@. This object can be used to make collision/intersection queries.
bindPhysics2DServer_space_get_direct_state :: MethodBind
bindPhysics2DServer_space_get_direct_state
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "space_get_direct_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the state of a space, a @Physics2DDirectSpaceState@. This object can be used to make collision/intersection queries.
space_get_direct_state ::
                         (Physics2DServer :< cls, Object :< cls) =>
                         cls -> Rid -> IO Physics2DDirectSpaceState
space_get_direct_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_space_get_direct_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "space_get_direct_state" '[Rid]
           (IO Physics2DDirectSpaceState)
         where
        nodeMethod = Godot.Core.Physics2DServer.space_get_direct_state

{-# NOINLINE bindPhysics2DServer_space_get_param #-}

-- | Returns the value of a space parameter.
bindPhysics2DServer_space_get_param :: MethodBind
bindPhysics2DServer_space_get_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "space_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a space parameter.
space_get_param ::
                  (Physics2DServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> IO Float
space_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_space_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "space_get_param" '[Rid, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Physics2DServer.space_get_param

{-# NOINLINE bindPhysics2DServer_space_is_active #-}

-- | Returns whether the space is active.
bindPhysics2DServer_space_is_active :: MethodBind
bindPhysics2DServer_space_is_active
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "space_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the space is active.
space_is_active ::
                  (Physics2DServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
space_is_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_space_is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "space_is_active" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Physics2DServer.space_is_active

{-# NOINLINE bindPhysics2DServer_space_set_active #-}

-- | Marks a space as active. It will not have an effect, unless it is assigned to an area or body.
bindPhysics2DServer_space_set_active :: MethodBind
bindPhysics2DServer_space_set_active
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "space_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Marks a space as active. It will not have an effect, unless it is assigned to an area or body.
space_set_active ::
                   (Physics2DServer :< cls, Object :< cls) =>
                   cls -> Rid -> Bool -> IO ()
space_set_active cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_space_set_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "space_set_active" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.space_set_active

{-# NOINLINE bindPhysics2DServer_space_set_param #-}

-- | Sets the value for a space parameter. See @enum SpaceParameter@ for a list of available parameters.
bindPhysics2DServer_space_set_param :: MethodBind
bindPhysics2DServer_space_set_param
  = unsafePerformIO $
      withCString "Physics2DServer" $
        \ clsNamePtr ->
          withCString "space_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value for a space parameter. See @enum SpaceParameter@ for a list of available parameters.
space_set_param ::
                  (Physics2DServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> Float -> IO ()
space_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DServer_space_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DServer "space_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DServer.space_set_param