{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PhysicsDirectBodyState
       (Godot.Core.PhysicsDirectBodyState.get_total_gravity,
        Godot.Core.PhysicsDirectBodyState.get_total_linear_damp,
        Godot.Core.PhysicsDirectBodyState.get_total_angular_damp,
        Godot.Core.PhysicsDirectBodyState.get_center_of_mass,
        Godot.Core.PhysicsDirectBodyState.get_principal_inertia_axes,
        Godot.Core.PhysicsDirectBodyState.get_inverse_mass,
        Godot.Core.PhysicsDirectBodyState.get_inverse_inertia,
        Godot.Core.PhysicsDirectBodyState.set_linear_velocity,
        Godot.Core.PhysicsDirectBodyState.get_linear_velocity,
        Godot.Core.PhysicsDirectBodyState.set_angular_velocity,
        Godot.Core.PhysicsDirectBodyState.get_angular_velocity,
        Godot.Core.PhysicsDirectBodyState.set_transform,
        Godot.Core.PhysicsDirectBodyState.get_transform,
        Godot.Core.PhysicsDirectBodyState.add_central_force,
        Godot.Core.PhysicsDirectBodyState.add_force,
        Godot.Core.PhysicsDirectBodyState.add_torque,
        Godot.Core.PhysicsDirectBodyState.apply_central_impulse,
        Godot.Core.PhysicsDirectBodyState.apply_impulse,
        Godot.Core.PhysicsDirectBodyState.apply_torque_impulse,
        Godot.Core.PhysicsDirectBodyState.set_sleep_state,
        Godot.Core.PhysicsDirectBodyState.is_sleeping,
        Godot.Core.PhysicsDirectBodyState.get_contact_count,
        Godot.Core.PhysicsDirectBodyState.get_contact_local_position,
        Godot.Core.PhysicsDirectBodyState.get_contact_local_normal,
        Godot.Core.PhysicsDirectBodyState.get_contact_impulse,
        Godot.Core.PhysicsDirectBodyState.get_contact_local_shape,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_position,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_id,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_object,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_shape,
        Godot.Core.PhysicsDirectBodyState.get_contact_collider_velocity_at_position,
        Godot.Core.PhysicsDirectBodyState.get_step,
        Godot.Core.PhysicsDirectBodyState.integrate_forces,
        Godot.Core.PhysicsDirectBodyState.get_space_state)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysicsDirectBodyState_get_total_gravity #-}

-- | The total gravity vector being currently applied to this body.
bindPhysicsDirectBodyState_get_total_gravity :: MethodBind
bindPhysicsDirectBodyState_get_total_gravity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The total gravity vector being currently applied to this body.
get_total_gravity ::
                    (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_total_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_total_gravity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_total_linear_damp #-}

-- | The rate at which the body stops moving, if there are not any other forces moving it.
bindPhysicsDirectBodyState_get_total_linear_damp :: MethodBind
bindPhysicsDirectBodyState_get_total_linear_damp
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which the body stops moving, if there are not any other forces moving it.
get_total_linear_damp ::
                        (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_total_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_total_linear_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_total_angular_damp #-}

-- | The rate at which the body stops rotating, if there are not any other forces moving it.
bindPhysicsDirectBodyState_get_total_angular_damp :: MethodBind
bindPhysicsDirectBodyState_get_total_angular_damp
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_total_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which the body stops rotating, if there are not any other forces moving it.
get_total_angular_damp ::
                         (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_total_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_total_angular_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_center_of_mass #-}

bindPhysicsDirectBodyState_get_center_of_mass :: MethodBind
bindPhysicsDirectBodyState_get_center_of_mass
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_center_of_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_center_of_mass ::
                     (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_center_of_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_center_of_mass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_principal_inertia_axes
             #-}

bindPhysicsDirectBodyState_get_principal_inertia_axes :: MethodBind
bindPhysicsDirectBodyState_get_principal_inertia_axes
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_principal_inertia_axes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_principal_inertia_axes ::
                             (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Basis
get_principal_inertia_axes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_principal_inertia_axes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_inverse_mass #-}

-- | The inverse of the mass of the body.
bindPhysicsDirectBodyState_get_inverse_mass :: MethodBind
bindPhysicsDirectBodyState_get_inverse_mass
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_inverse_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The inverse of the mass of the body.
get_inverse_mass ::
                   (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_inverse_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_inverse_mass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_inverse_inertia #-}

-- | The inverse of the inertia of the body.
bindPhysicsDirectBodyState_get_inverse_inertia :: MethodBind
bindPhysicsDirectBodyState_get_inverse_inertia
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_inverse_inertia" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The inverse of the inertia of the body.
get_inverse_inertia ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_inverse_inertia cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_inverse_inertia
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_set_linear_velocity #-}

-- | The body's linear velocity.
bindPhysicsDirectBodyState_set_linear_velocity :: MethodBind
bindPhysicsDirectBodyState_set_linear_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity.
set_linear_velocity ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) =>
                      cls -> Vector3 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_linear_velocity #-}

-- | The body's linear velocity.
bindPhysicsDirectBodyState_get_linear_velocity :: MethodBind
bindPhysicsDirectBodyState_get_linear_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity.
get_linear_velocity ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_set_angular_velocity #-}

-- | The body's rotational velocity.
bindPhysicsDirectBodyState_set_angular_velocity :: MethodBind
bindPhysicsDirectBodyState_set_angular_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity.
set_angular_velocity ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) =>
                       cls -> Vector3 -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_angular_velocity #-}

-- | The body's rotational velocity.
bindPhysicsDirectBodyState_get_angular_velocity :: MethodBind
bindPhysicsDirectBodyState_get_angular_velocity
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity.
get_angular_velocity ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Vector3
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_set_transform #-}

-- | The body's transformation matrix.
bindPhysicsDirectBodyState_set_transform :: MethodBind
bindPhysicsDirectBodyState_set_transform
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's transformation matrix.
set_transform ::
                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                cls -> Transform -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_transform #-}

-- | The body's transformation matrix.
bindPhysicsDirectBodyState_get_transform :: MethodBind
bindPhysicsDirectBodyState_get_transform
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's transformation matrix.
get_transform ::
                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                cls -> IO Transform
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_add_central_force #-}

-- | Adds a constant directional force without affecting rotation.
--   				This is equivalent to [code]add_force(force, Vector3(0,0,0))[/code].
bindPhysicsDirectBodyState_add_central_force :: MethodBind
bindPhysicsDirectBodyState_add_central_force
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant directional force without affecting rotation.
--   				This is equivalent to [code]add_force(force, Vector3(0,0,0))[/code].
add_central_force ::
                    (PhysicsDirectBodyState :< cls, Object :< cls) =>
                    cls -> Vector3 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_add_central_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_add_force #-}

-- | Adds a positioned force to the body. Both the force and the offset from the body origin are in global coordinates.
bindPhysicsDirectBodyState_add_force :: MethodBind
bindPhysicsDirectBodyState_add_force
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a positioned force to the body. Both the force and the offset from the body origin are in global coordinates.
add_force ::
            (PhysicsDirectBodyState :< cls, Object :< cls) =>
            cls -> Vector3 -> Vector3 -> IO ()
add_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_add_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_add_torque #-}

-- | Adds a constant rotational force without affecting position.
bindPhysicsDirectBodyState_add_torque :: MethodBind
bindPhysicsDirectBodyState_add_torque
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant rotational force without affecting position.
add_torque ::
             (PhysicsDirectBodyState :< cls, Object :< cls) =>
             cls -> Vector3 -> IO ()
add_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_add_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_apply_central_impulse #-}

-- | Applies a single directional impulse without affecting rotation.
--   				This is equivalent to [code]apply_impulse(Vector3(0, 0, 0), impulse)[/code].
bindPhysicsDirectBodyState_apply_central_impulse :: MethodBind
bindPhysicsDirectBodyState_apply_central_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a single directional impulse without affecting rotation.
--   				This is equivalent to [code]apply_impulse(Vector3(0, 0, 0), impulse)[/code].
apply_central_impulse ::
                        (PhysicsDirectBodyState :< cls, Object :< cls) =>
                        cls -> Vector3 -> IO ()
apply_central_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_apply_impulse #-}

-- | Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result in a framerate dependent force. For this reason it should only be used when simulating one-time impacts. The position uses the rotation of the global coordinate system, but is centered at the object's origin.
bindPhysicsDirectBodyState_apply_impulse :: MethodBind
bindPhysicsDirectBodyState_apply_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result in a framerate dependent force. For this reason it should only be used when simulating one-time impacts. The position uses the rotation of the global coordinate system, but is centered at the object's origin.
apply_impulse ::
                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                cls -> Vector3 -> Vector3 -> IO ()
apply_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_apply_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_apply_torque_impulse #-}

-- | Apply a torque impulse (which will be affected by the body mass and shape). This will rotate the body around the passed in vector.
bindPhysicsDirectBodyState_apply_torque_impulse :: MethodBind
bindPhysicsDirectBodyState_apply_torque_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Apply a torque impulse (which will be affected by the body mass and shape). This will rotate the body around the passed in vector.
apply_torque_impulse ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) =>
                       cls -> Vector3 -> IO ()
apply_torque_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_set_sleep_state #-}

-- | If [code]true[/code], this body is currently sleeping (not active).
bindPhysicsDirectBodyState_set_sleep_state :: MethodBind
bindPhysicsDirectBodyState_set_sleep_state
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "set_sleep_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this body is currently sleeping (not active).
set_sleep_state ::
                  (PhysicsDirectBodyState :< cls, Object :< cls) =>
                  cls -> Bool -> IO ()
set_sleep_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_set_sleep_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_is_sleeping #-}

-- | If [code]true[/code], this body is currently sleeping (not active).
bindPhysicsDirectBodyState_is_sleeping :: MethodBind
bindPhysicsDirectBodyState_is_sleeping
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this body is currently sleeping (not active).
is_sleeping ::
              (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_is_sleeping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_count #-}

-- | Returns the number of contacts this body has with other bodies. Note that by default this returns 0 unless bodies are configured to log contacts. See [member RigidBody.contact_monitor].
bindPhysicsDirectBodyState_get_contact_count :: MethodBind
bindPhysicsDirectBodyState_get_contact_count
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of contacts this body has with other bodies. Note that by default this returns 0 unless bodies are configured to log contacts. See [member RigidBody.contact_monitor].
get_contact_count ::
                    (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Int
get_contact_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_contact_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_local_position
             #-}

-- | Returns the local position of the contact point.
bindPhysicsDirectBodyState_get_contact_local_position :: MethodBind
bindPhysicsDirectBodyState_get_contact_local_position
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local position of the contact point.
get_contact_local_position ::
                             (PhysicsDirectBodyState :< cls, Object :< cls) =>
                             cls -> Int -> IO Vector3
get_contact_local_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_local_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_local_normal
             #-}

-- | Returns the local normal at the contact point.
bindPhysicsDirectBodyState_get_contact_local_normal :: MethodBind
bindPhysicsDirectBodyState_get_contact_local_normal
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local normal at the contact point.
get_contact_local_normal ::
                           (PhysicsDirectBodyState :< cls, Object :< cls) =>
                           cls -> Int -> IO Vector3
get_contact_local_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_local_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_impulse #-}

-- | Impulse created by the contact. Only implemented for Bullet physics.
bindPhysicsDirectBodyState_get_contact_impulse :: MethodBind
bindPhysicsDirectBodyState_get_contact_impulse
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Impulse created by the contact. Only implemented for Bullet physics.
get_contact_impulse ::
                      (PhysicsDirectBodyState :< cls, Object :< cls) =>
                      cls -> Int -> IO Float
get_contact_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_local_shape #-}

-- | Returns the local shape index of the collision.
bindPhysicsDirectBodyState_get_contact_local_shape :: MethodBind
bindPhysicsDirectBodyState_get_contact_local_shape
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_local_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local shape index of the collision.
get_contact_local_shape ::
                          (PhysicsDirectBodyState :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_contact_local_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_local_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider #-}

-- | Returns the collider's [RID].
bindPhysicsDirectBodyState_get_contact_collider :: MethodBind
bindPhysicsDirectBodyState_get_contact_collider
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's [RID].
get_contact_collider ::
                       (PhysicsDirectBodyState :< cls, Object :< cls) =>
                       cls -> Int -> IO Rid
get_contact_collider cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_position
             #-}

-- | Returns the contact position in the collider.
bindPhysicsDirectBodyState_get_contact_collider_position ::
                                                         MethodBind
bindPhysicsDirectBodyState_get_contact_collider_position
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the contact position in the collider.
get_contact_collider_position ::
                                (PhysicsDirectBodyState :< cls, Object :< cls) =>
                                cls -> Int -> IO Vector3
get_contact_collider_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_id #-}

-- | Returns the collider's object id.
bindPhysicsDirectBodyState_get_contact_collider_id :: MethodBind
bindPhysicsDirectBodyState_get_contact_collider_id
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's object id.
get_contact_collider_id ::
                          (PhysicsDirectBodyState :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_contact_collider_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_object
             #-}

-- | Returns the collider object.
bindPhysicsDirectBodyState_get_contact_collider_object ::
                                                       MethodBind
bindPhysicsDirectBodyState_get_contact_collider_object
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider object.
get_contact_collider_object ::
                              (PhysicsDirectBodyState :< cls, Object :< cls) =>
                              cls -> Int -> IO Object
get_contact_collider_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_shape
             #-}

-- | Returns the collider's shape index.
bindPhysicsDirectBodyState_get_contact_collider_shape :: MethodBind
bindPhysicsDirectBodyState_get_contact_collider_shape
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collider's shape index.
get_contact_collider_shape ::
                             (PhysicsDirectBodyState :< cls, Object :< cls) =>
                             cls -> Int -> IO Int
get_contact_collider_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position
             #-}

-- | Returns the linear velocity vector at the collider's contact point.
bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position ::
                                                                     MethodBind
bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_contact_collider_velocity_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the linear velocity vector at the collider's contact point.
get_contact_collider_velocity_at_position ::
                                            (PhysicsDirectBodyState :< cls, Object :< cls) =>
                                            cls -> Int -> IO Vector3
get_contact_collider_velocity_at_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsDirectBodyState_get_contact_collider_velocity_at_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_step #-}

-- | The timestep (delta) used for the simulation.
bindPhysicsDirectBodyState_get_step :: MethodBind
bindPhysicsDirectBodyState_get_step
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The timestep (delta) used for the simulation.
get_step ::
           (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_step
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_integrate_forces #-}

-- | Calls the built-in force integration code.
bindPhysicsDirectBodyState_integrate_forces :: MethodBind
bindPhysicsDirectBodyState_integrate_forces
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the built-in force integration code.
integrate_forces ::
                   (PhysicsDirectBodyState :< cls, Object :< cls) => cls -> IO ()
integrate_forces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_integrate_forces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectBodyState_get_space_state #-}

-- | Returns the current state of the space, useful for queries.
bindPhysicsDirectBodyState_get_space_state :: MethodBind
bindPhysicsDirectBodyState_get_space_state
  = unsafePerformIO $
      withCString "PhysicsDirectBodyState" $
        \ clsNamePtr ->
          withCString "get_space_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current state of the space, useful for queries.
get_space_state ::
                  (PhysicsDirectBodyState :< cls, Object :< cls) =>
                  cls -> IO PhysicsDirectSpaceState
get_space_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectBodyState_get_space_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)