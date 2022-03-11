{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Physics2DDirectBodyState
       (Godot.Core.Physics2DDirectBodyState.add_central_force,
        Godot.Core.Physics2DDirectBodyState.add_force,
        Godot.Core.Physics2DDirectBodyState.add_torque,
        Godot.Core.Physics2DDirectBodyState.apply_central_impulse,
        Godot.Core.Physics2DDirectBodyState.apply_impulse,
        Godot.Core.Physics2DDirectBodyState.apply_torque_impulse,
        Godot.Core.Physics2DDirectBodyState.get_angular_velocity,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_id,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_object,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_position,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_shape,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_shape_metadata,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_velocity_at_position,
        Godot.Core.Physics2DDirectBodyState.get_contact_count,
        Godot.Core.Physics2DDirectBodyState.get_contact_local_normal,
        Godot.Core.Physics2DDirectBodyState.get_contact_local_position,
        Godot.Core.Physics2DDirectBodyState.get_contact_local_shape,
        Godot.Core.Physics2DDirectBodyState.get_inverse_inertia,
        Godot.Core.Physics2DDirectBodyState.get_inverse_mass,
        Godot.Core.Physics2DDirectBodyState.get_linear_velocity,
        Godot.Core.Physics2DDirectBodyState.get_space_state,
        Godot.Core.Physics2DDirectBodyState.get_step,
        Godot.Core.Physics2DDirectBodyState.get_total_angular_damp,
        Godot.Core.Physics2DDirectBodyState.get_total_gravity,
        Godot.Core.Physics2DDirectBodyState.get_total_linear_damp,
        Godot.Core.Physics2DDirectBodyState.get_transform,
        Godot.Core.Physics2DDirectBodyState.integrate_forces,
        Godot.Core.Physics2DDirectBodyState.is_sleeping,
        Godot.Core.Physics2DDirectBodyState.set_angular_velocity,
        Godot.Core.Physics2DDirectBodyState.set_linear_velocity,
        Godot.Core.Physics2DDirectBodyState.set_sleep_state,
        Godot.Core.Physics2DDirectBodyState.set_transform)
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

instance NodeProperty Physics2DDirectBodyState "angular_velocity"
           Float
           'False
         where
        nodeProperty
          = (get_angular_velocity, wrapDroppingSetter set_angular_velocity,
             Nothing)

instance NodeProperty Physics2DDirectBodyState "inverse_inertia"
           Float
           'True
         where
        nodeProperty = (get_inverse_inertia, (), Nothing)

instance NodeProperty Physics2DDirectBodyState "inverse_mass" Float
           'True
         where
        nodeProperty = (get_inverse_mass, (), Nothing)

instance NodeProperty Physics2DDirectBodyState "linear_velocity"
           Vector2
           'False
         where
        nodeProperty
          = (get_linear_velocity, wrapDroppingSetter set_linear_velocity,
             Nothing)

instance NodeProperty Physics2DDirectBodyState "sleeping" Bool
           'False
         where
        nodeProperty
          = (is_sleeping, wrapDroppingSetter set_sleep_state, Nothing)

instance NodeProperty Physics2DDirectBodyState "step" Float 'True
         where
        nodeProperty = (get_step, (), Nothing)

instance NodeProperty Physics2DDirectBodyState "total_angular_damp"
           Float
           'True
         where
        nodeProperty = (get_total_angular_damp, (), Nothing)

instance NodeProperty Physics2DDirectBodyState "total_gravity"
           Vector2
           'True
         where
        nodeProperty = (get_total_gravity, (), Nothing)

instance NodeProperty Physics2DDirectBodyState "total_linear_damp"
           Float
           'True
         where
        nodeProperty = (get_total_linear_damp, (), Nothing)

instance NodeProperty Physics2DDirectBodyState "transform"
           Transform2d
           'False
         where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

{-# NOINLINE bindPhysics2DDirectBodyState_add_central_force #-}

-- | Adds a constant directional force without affecting rotation.
bindPhysics2DDirectBodyState_add_central_force :: MethodBind
bindPhysics2DDirectBodyState_add_central_force
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant directional force without affecting rotation.
add_central_force ::
                    (Physics2DDirectBodyState :< cls, Object :< cls) =>
                    cls -> Vector2 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_add_central_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "add_central_force"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.add_central_force

{-# NOINLINE bindPhysics2DDirectBodyState_add_force #-}

-- | Adds a positioned force to the body. Both the force and the offset from the body origin are in global coordinates.
bindPhysics2DDirectBodyState_add_force :: MethodBind
bindPhysics2DDirectBodyState_add_force
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a positioned force to the body. Both the force and the offset from the body origin are in global coordinates.
add_force ::
            (Physics2DDirectBodyState :< cls, Object :< cls) =>
            cls -> Vector2 -> Vector2 -> IO ()
add_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_add_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "add_force"
           '[Vector2, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.add_force

{-# NOINLINE bindPhysics2DDirectBodyState_add_torque #-}

-- | Adds a constant rotational force.
bindPhysics2DDirectBodyState_add_torque :: MethodBind
bindPhysics2DDirectBodyState_add_torque
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant rotational force.
add_torque ::
             (Physics2DDirectBodyState :< cls, Object :< cls) =>
             cls -> Float -> IO ()
add_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_add_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "add_torque" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.add_torque

{-# NOINLINE bindPhysics2DDirectBodyState_apply_central_impulse #-}

-- | Applies a directional impulse without affecting rotation.
bindPhysics2DDirectBodyState_apply_central_impulse :: MethodBind
bindPhysics2DDirectBodyState_apply_central_impulse
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a directional impulse without affecting rotation.
apply_central_impulse ::
                        (Physics2DDirectBodyState :< cls, Object :< cls) =>
                        cls -> Vector2 -> IO ()
apply_central_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "apply_central_impulse"
           '[Vector2]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.apply_central_impulse

{-# NOINLINE bindPhysics2DDirectBodyState_apply_impulse #-}

-- | Applies a positioned impulse to the body. An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise). The offset uses the rotation of the global coordinate system, but is centered at the object's origin.
bindPhysics2DDirectBodyState_apply_impulse :: MethodBind
bindPhysics2DDirectBodyState_apply_impulse
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a positioned impulse to the body. An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason, it should only be used when simulating one-time impacts (use the "_force" functions otherwise). The offset uses the rotation of the global coordinate system, but is centered at the object's origin.
apply_impulse ::
                (Physics2DDirectBodyState :< cls, Object :< cls) =>
                cls -> Vector2 -> Vector2 -> IO ()
apply_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_apply_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "apply_impulse"
           '[Vector2, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.apply_impulse

{-# NOINLINE bindPhysics2DDirectBodyState_apply_torque_impulse #-}

-- | Applies a rotational impulse to the body.
bindPhysics2DDirectBodyState_apply_torque_impulse :: MethodBind
bindPhysics2DDirectBodyState_apply_torque_impulse
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a rotational impulse to the body.
apply_torque_impulse ::
                       (Physics2DDirectBodyState :< cls, Object :< cls) =>
                       cls -> Float -> IO ()
apply_torque_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "apply_torque_impulse"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.apply_torque_impulse

{-# NOINLINE bindPhysics2DDirectBodyState_get_angular_velocity #-}

-- | The body's rotational velocity in @i@radians@/i@ per second.
bindPhysics2DDirectBodyState_get_angular_velocity :: MethodBind
bindPhysics2DDirectBodyState_get_angular_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity in @i@radians@/i@ per second.
get_angular_velocity ::
                       (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_angular_velocity"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_angular_velocity

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider #-}

-- | Returns the collider's @RID@.
bindPhysics2DDirectBodyState_get_contact_collider :: MethodBind
bindPhysics2DDirectBodyState_get_contact_collider
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's @RID@.
get_contact_collider ::
                       (Physics2DDirectBodyState :< cls, Object :< cls) =>
                       cls -> Int -> IO Rid
get_contact_collider cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_contact_collider"
           '[Int]
           (IO Rid)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_id
             #-}

-- | Returns the collider's object id.
bindPhysics2DDirectBodyState_get_contact_collider_id :: MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_id
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's object id.
get_contact_collider_id ::
                          (Physics2DDirectBodyState :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_contact_collider_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_collider_id"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider_id

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_object
             #-}

-- | Returns the collider object. This depends on how it was created (will return a scene node if such was used to create it).
bindPhysics2DDirectBodyState_get_contact_collider_object ::
                                                         MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_object
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider object. This depends on how it was created (will return a scene node if such was used to create it).
get_contact_collider_object ::
                              (Physics2DDirectBodyState :< cls, Object :< cls) =>
                              cls -> Int -> IO Object
get_contact_collider_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_collider_object"
           '[Int]
           (IO Object)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider_object

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_position
             #-}

-- | Returns the contact position in the collider.
bindPhysics2DDirectBodyState_get_contact_collider_position ::
                                                           MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_position
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the contact position in the collider.
get_contact_collider_position ::
                                (Physics2DDirectBodyState :< cls, Object :< cls) =>
                                cls -> Int -> IO Vector2
get_contact_collider_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_collider_position"
           '[Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider_position

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_shape
             #-}

-- | Returns the collider's shape index.
bindPhysics2DDirectBodyState_get_contact_collider_shape ::
                                                        MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_shape
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's shape index.
get_contact_collider_shape ::
                             (Physics2DDirectBodyState :< cls, Object :< cls) =>
                             cls -> Int -> IO Int
get_contact_collider_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_collider_shape"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider_shape

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata
             #-}

-- | Returns the collided shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata ::
                                                                 MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_shape_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collided shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
get_contact_collider_shape_metadata ::
                                      (Physics2DDirectBodyState :< cls, Object :< cls) =>
                                      cls -> Int -> IO GodotVariant
get_contact_collider_shape_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_collider_shape_metadata"
           '[Int]
           (IO GodotVariant)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider_shape_metadata

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_velocity_at_position
             #-}

-- | Returns the linear velocity vector at the collider's contact point.
bindPhysics2DDirectBodyState_get_contact_collider_velocity_at_position ::
                                                                       MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_velocity_at_position
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_velocity_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the linear velocity vector at the collider's contact point.
get_contact_collider_velocity_at_position ::
                                            (Physics2DDirectBodyState :< cls, Object :< cls) =>
                                            cls -> Int -> IO Vector2
get_contact_collider_velocity_at_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_collider_velocity_at_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_collider_velocity_at_position"
           '[Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_collider_velocity_at_position

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_count #-}

-- | Returns the number of contacts this body has with other bodies.
--   				__Note:__ By default, this returns 0 unless bodies are configured to monitor contacts. See @RigidBody2D.contact_monitor@.
bindPhysics2DDirectBodyState_get_contact_count :: MethodBind
bindPhysics2DDirectBodyState_get_contact_count
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of contacts this body has with other bodies.
--   				__Note:__ By default, this returns 0 unless bodies are configured to monitor contacts. See @RigidBody2D.contact_monitor@.
get_contact_count ::
                    (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Int
get_contact_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_contact_count"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.get_contact_count

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_local_normal
             #-}

-- | Returns the local normal at the contact point.
bindPhysics2DDirectBodyState_get_contact_local_normal :: MethodBind
bindPhysics2DDirectBodyState_get_contact_local_normal
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local normal at the contact point.
get_contact_local_normal ::
                           (Physics2DDirectBodyState :< cls, Object :< cls) =>
                           cls -> Int -> IO Vector2
get_contact_local_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_local_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_local_normal"
           '[Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_local_normal

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_local_position
             #-}

-- | Returns the local position of the contact point.
bindPhysics2DDirectBodyState_get_contact_local_position ::
                                                        MethodBind
bindPhysics2DDirectBodyState_get_contact_local_position
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local position of the contact point.
get_contact_local_position ::
                             (Physics2DDirectBodyState :< cls, Object :< cls) =>
                             cls -> Int -> IO Vector2
get_contact_local_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_local_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_local_position"
           '[Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_local_position

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_local_shape
             #-}

-- | Returns the local shape index of the collision.
bindPhysics2DDirectBodyState_get_contact_local_shape :: MethodBind
bindPhysics2DDirectBodyState_get_contact_local_shape
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local shape index of the collision.
get_contact_local_shape ::
                          (Physics2DDirectBodyState :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_contact_local_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_contact_local_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_contact_local_shape"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_contact_local_shape

{-# NOINLINE bindPhysics2DDirectBodyState_get_inverse_inertia #-}

-- | The inverse of the inertia of the body.
bindPhysics2DDirectBodyState_get_inverse_inertia :: MethodBind
bindPhysics2DDirectBodyState_get_inverse_inertia
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_inverse_inertia" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The inverse of the inertia of the body.
get_inverse_inertia ::
                      (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_inverse_inertia cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_inverse_inertia
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_inverse_inertia"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_inverse_inertia

{-# NOINLINE bindPhysics2DDirectBodyState_get_inverse_mass #-}

-- | The inverse of the mass of the body.
bindPhysics2DDirectBodyState_get_inverse_mass :: MethodBind
bindPhysics2DDirectBodyState_get_inverse_mass
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_inverse_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The inverse of the mass of the body.
get_inverse_mass ::
                   (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_inverse_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_inverse_mass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_inverse_mass" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.get_inverse_mass

{-# NOINLINE bindPhysics2DDirectBodyState_get_linear_velocity #-}

-- | The body's linear velocity in pixels per second.
bindPhysics2DDirectBodyState_get_linear_velocity :: MethodBind
bindPhysics2DDirectBodyState_get_linear_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity in pixels per second.
get_linear_velocity ::
                      (Physics2DDirectBodyState :< cls, Object :< cls) =>
                      cls -> IO Vector2
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_linear_velocity"
           '[]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_linear_velocity

{-# NOINLINE bindPhysics2DDirectBodyState_get_space_state #-}

-- | Returns the current state of the space, useful for queries.
bindPhysics2DDirectBodyState_get_space_state :: MethodBind
bindPhysics2DDirectBodyState_get_space_state
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_space_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current state of the space, useful for queries.
get_space_state ::
                  (Physics2DDirectBodyState :< cls, Object :< cls) =>
                  cls -> IO Physics2DDirectSpaceState
get_space_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_get_space_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_space_state" '[]
           (IO Physics2DDirectSpaceState)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.get_space_state

{-# NOINLINE bindPhysics2DDirectBodyState_get_step #-}

-- | The timestep (delta) used for the simulation.
bindPhysics2DDirectBodyState_get_step :: MethodBind
bindPhysics2DDirectBodyState_get_step
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The timestep (delta) used for the simulation.
get_step ::
           (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_get_step
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_step" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.get_step

{-# NOINLINE bindPhysics2DDirectBodyState_get_total_angular_damp
             #-}

-- | The rate at which the body stops rotating, if there are not any other forces moving it.
bindPhysics2DDirectBodyState_get_total_angular_damp :: MethodBind
bindPhysics2DDirectBodyState_get_total_angular_damp
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which the body stops rotating, if there are not any other forces moving it.
get_total_angular_damp ::
                         (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_total_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_total_angular_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_total_angular_damp"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_total_angular_damp

{-# NOINLINE bindPhysics2DDirectBodyState_get_total_gravity #-}

-- | The total gravity vector being currently applied to this body.
bindPhysics2DDirectBodyState_get_total_gravity :: MethodBind
bindPhysics2DDirectBodyState_get_total_gravity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The total gravity vector being currently applied to this body.
get_total_gravity ::
                    (Physics2DDirectBodyState :< cls, Object :< cls) =>
                    cls -> IO Vector2
get_total_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_total_gravity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_total_gravity"
           '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.get_total_gravity

{-# NOINLINE bindPhysics2DDirectBodyState_get_total_linear_damp #-}

-- | The rate at which the body stops moving, if there are not any other forces moving it.
bindPhysics2DDirectBodyState_get_total_linear_damp :: MethodBind
bindPhysics2DDirectBodyState_get_total_linear_damp
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which the body stops moving, if there are not any other forces moving it.
get_total_linear_damp ::
                        (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_total_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_get_total_linear_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState
           "get_total_linear_damp"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.get_total_linear_damp

{-# NOINLINE bindPhysics2DDirectBodyState_get_transform #-}

-- | The body's transformation matrix.
bindPhysics2DDirectBodyState_get_transform :: MethodBind
bindPhysics2DDirectBodyState_get_transform
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's transformation matrix.
get_transform ::
                (Physics2DDirectBodyState :< cls, Object :< cls) =>
                cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "get_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.get_transform

{-# NOINLINE bindPhysics2DDirectBodyState_integrate_forces #-}

-- | Calls the built-in force integration code.
bindPhysics2DDirectBodyState_integrate_forces :: MethodBind
bindPhysics2DDirectBodyState_integrate_forces
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the built-in force integration code.
integrate_forces ::
                   (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO ()
integrate_forces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_integrate_forces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "integrate_forces" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.integrate_forces

{-# NOINLINE bindPhysics2DDirectBodyState_is_sleeping #-}

-- | If @true@, this body is currently sleeping (not active).
bindPhysics2DDirectBodyState_is_sleeping :: MethodBind
bindPhysics2DDirectBodyState_is_sleeping
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this body is currently sleeping (not active).
is_sleeping ::
              (Physics2DDirectBodyState :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_is_sleeping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "is_sleeping" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.is_sleeping

{-# NOINLINE bindPhysics2DDirectBodyState_set_angular_velocity #-}

-- | The body's rotational velocity in @i@radians@/i@ per second.
bindPhysics2DDirectBodyState_set_angular_velocity :: MethodBind
bindPhysics2DDirectBodyState_set_angular_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity in @i@radians@/i@ per second.
set_angular_velocity ::
                       (Physics2DDirectBodyState :< cls, Object :< cls) =>
                       cls -> Float -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "set_angular_velocity"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.set_angular_velocity

{-# NOINLINE bindPhysics2DDirectBodyState_set_linear_velocity #-}

-- | The body's linear velocity in pixels per second.
bindPhysics2DDirectBodyState_set_linear_velocity :: MethodBind
bindPhysics2DDirectBodyState_set_linear_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity in pixels per second.
set_linear_velocity ::
                      (Physics2DDirectBodyState :< cls, Object :< cls) =>
                      cls -> Vector2 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectBodyState_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "set_linear_velocity"
           '[Vector2]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DDirectBodyState.set_linear_velocity

{-# NOINLINE bindPhysics2DDirectBodyState_set_sleep_state #-}

-- | If @true@, this body is currently sleeping (not active).
bindPhysics2DDirectBodyState_set_sleep_state :: MethodBind
bindPhysics2DDirectBodyState_set_sleep_state
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_sleep_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this body is currently sleeping (not active).
set_sleep_state ::
                  (Physics2DDirectBodyState :< cls, Object :< cls) =>
                  cls -> Bool -> IO ()
set_sleep_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_set_sleep_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "set_sleep_state"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.set_sleep_state

{-# NOINLINE bindPhysics2DDirectBodyState_set_transform #-}

-- | The body's transformation matrix.
bindPhysics2DDirectBodyState_set_transform :: MethodBind
bindPhysics2DDirectBodyState_set_transform
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's transformation matrix.
set_transform ::
                (Physics2DDirectBodyState :< cls, Object :< cls) =>
                cls -> Transform2d -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectBodyState_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectBodyState "set_transform"
           '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DDirectBodyState.set_transform