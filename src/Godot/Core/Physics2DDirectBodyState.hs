{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Physics2DDirectBodyState
       (Godot.Core.Physics2DDirectBodyState.get_total_gravity,
        Godot.Core.Physics2DDirectBodyState.get_total_linear_damp,
        Godot.Core.Physics2DDirectBodyState.get_total_angular_damp,
        Godot.Core.Physics2DDirectBodyState.get_inverse_mass,
        Godot.Core.Physics2DDirectBodyState.get_inverse_inertia,
        Godot.Core.Physics2DDirectBodyState.set_linear_velocity,
        Godot.Core.Physics2DDirectBodyState.get_linear_velocity,
        Godot.Core.Physics2DDirectBodyState.set_angular_velocity,
        Godot.Core.Physics2DDirectBodyState.get_angular_velocity,
        Godot.Core.Physics2DDirectBodyState.set_transform,
        Godot.Core.Physics2DDirectBodyState.get_transform,
        Godot.Core.Physics2DDirectBodyState.add_central_force,
        Godot.Core.Physics2DDirectBodyState.add_force,
        Godot.Core.Physics2DDirectBodyState.add_torque,
        Godot.Core.Physics2DDirectBodyState.apply_central_impulse,
        Godot.Core.Physics2DDirectBodyState.apply_torque_impulse,
        Godot.Core.Physics2DDirectBodyState.apply_impulse,
        Godot.Core.Physics2DDirectBodyState.set_sleep_state,
        Godot.Core.Physics2DDirectBodyState.is_sleeping,
        Godot.Core.Physics2DDirectBodyState.get_contact_count,
        Godot.Core.Physics2DDirectBodyState.get_contact_local_position,
        Godot.Core.Physics2DDirectBodyState.get_contact_local_normal,
        Godot.Core.Physics2DDirectBodyState.get_contact_local_shape,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_position,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_id,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_object,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_shape,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_shape_metadata,
        Godot.Core.Physics2DDirectBodyState.get_contact_collider_velocity_at_position,
        Godot.Core.Physics2DDirectBodyState.get_step,
        Godot.Core.Physics2DDirectBodyState.integrate_forces,
        Godot.Core.Physics2DDirectBodyState.get_space_state)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindPhysics2DDirectBodyState_set_linear_velocity #-}

-- | The body's linear velocity.
bindPhysics2DDirectBodyState_set_linear_velocity :: MethodBind
bindPhysics2DDirectBodyState_set_linear_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity.
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

{-# NOINLINE bindPhysics2DDirectBodyState_get_linear_velocity #-}

-- | The body's linear velocity.
bindPhysics2DDirectBodyState_get_linear_velocity :: MethodBind
bindPhysics2DDirectBodyState_get_linear_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity.
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

{-# NOINLINE bindPhysics2DDirectBodyState_set_angular_velocity #-}

-- | The body's rotational velocity.
bindPhysics2DDirectBodyState_set_angular_velocity :: MethodBind
bindPhysics2DDirectBodyState_set_angular_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity.
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

{-# NOINLINE bindPhysics2DDirectBodyState_get_angular_velocity #-}

-- | The body's rotational velocity.
bindPhysics2DDirectBodyState_get_angular_velocity :: MethodBind
bindPhysics2DDirectBodyState_get_angular_velocity
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity.
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

{-# NOINLINE bindPhysics2DDirectBodyState_apply_impulse #-}

-- | Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result in a framerate dependent force. For this reason it should only be used when simulating one-time impacts (use the "_force" functions otherwise). The offset uses the rotation of the global coordinate system, but is centered at the object's origin.
bindPhysics2DDirectBodyState_apply_impulse :: MethodBind
bindPhysics2DDirectBodyState_apply_impulse
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result in a framerate dependent force. For this reason it should only be used when simulating one-time impacts (use the "_force" functions otherwise). The offset uses the rotation of the global coordinate system, but is centered at the object's origin.
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

{-# NOINLINE bindPhysics2DDirectBodyState_set_sleep_state #-}

-- | If [code]true[/code], this body is currently sleeping (not active).
bindPhysics2DDirectBodyState_set_sleep_state :: MethodBind
bindPhysics2DDirectBodyState_set_sleep_state
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_sleep_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this body is currently sleeping (not active).
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

{-# NOINLINE bindPhysics2DDirectBodyState_is_sleeping #-}

-- | If [code]true[/code], this body is currently sleeping (not active).
bindPhysics2DDirectBodyState_is_sleeping :: MethodBind
bindPhysics2DDirectBodyState_is_sleeping
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this body is currently sleeping (not active).
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

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_count #-}

-- | Returns the number of contacts this body has with other bodies. Note that by default this returns 0 unless bodies are configured to log contacts. See [member RigidBody2D.contact_monitor].
bindPhysics2DDirectBodyState_get_contact_count :: MethodBind
bindPhysics2DDirectBodyState_get_contact_count
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of contacts this body has with other bodies. Note that by default this returns 0 unless bodies are configured to log contacts. See [member RigidBody2D.contact_monitor].
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

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider #-}

-- | Returns the collider's [RID].
bindPhysics2DDirectBodyState_get_contact_collider :: MethodBind
bindPhysics2DDirectBodyState_get_contact_collider
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's [RID].
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

{-# NOINLINE bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata
             #-}

-- | Returns the collided shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata ::
                                                                 MethodBind
bindPhysics2DDirectBodyState_get_contact_collider_shape_metadata
  = unsafePerformIO $
      withCString "Physics2DDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_shape_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collided shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
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