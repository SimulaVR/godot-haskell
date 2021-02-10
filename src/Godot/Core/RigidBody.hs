{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RigidBody
       (Godot.Core.RigidBody._MODE_STATIC,
        Godot.Core.RigidBody._MODE_KINEMATIC,
        Godot.Core.RigidBody._MODE_RIGID,
        Godot.Core.RigidBody._MODE_CHARACTER,
        Godot.Core.RigidBody.sig_body_entered,
        Godot.Core.RigidBody.sig_body_exited,
        Godot.Core.RigidBody.sig_body_shape_entered,
        Godot.Core.RigidBody.sig_body_shape_exited,
        Godot.Core.RigidBody.sig_sleeping_state_changed,
        Godot.Core.RigidBody._body_enter_tree,
        Godot.Core.RigidBody._body_exit_tree,
        Godot.Core.RigidBody._direct_state_changed,
        Godot.Core.RigidBody._integrate_forces,
        Godot.Core.RigidBody._reload_physics_characteristics,
        Godot.Core.RigidBody.add_central_force,
        Godot.Core.RigidBody.add_force, Godot.Core.RigidBody.add_torque,
        Godot.Core.RigidBody.apply_central_impulse,
        Godot.Core.RigidBody.apply_impulse,
        Godot.Core.RigidBody.apply_torque_impulse,
        Godot.Core.RigidBody.get_angular_damp,
        Godot.Core.RigidBody.get_angular_velocity,
        Godot.Core.RigidBody.get_axis_lock,
        Godot.Core.RigidBody.get_bounce,
        Godot.Core.RigidBody.get_colliding_bodies,
        Godot.Core.RigidBody.get_friction,
        Godot.Core.RigidBody.get_gravity_scale,
        Godot.Core.RigidBody.get_linear_damp,
        Godot.Core.RigidBody.get_linear_velocity,
        Godot.Core.RigidBody.get_mass,
        Godot.Core.RigidBody.get_max_contacts_reported,
        Godot.Core.RigidBody.get_mode,
        Godot.Core.RigidBody.get_physics_material_override,
        Godot.Core.RigidBody.get_weight,
        Godot.Core.RigidBody.is_able_to_sleep,
        Godot.Core.RigidBody.is_contact_monitor_enabled,
        Godot.Core.RigidBody.is_sleeping,
        Godot.Core.RigidBody.is_using_continuous_collision_detection,
        Godot.Core.RigidBody.is_using_custom_integrator,
        Godot.Core.RigidBody.set_angular_damp,
        Godot.Core.RigidBody.set_angular_velocity,
        Godot.Core.RigidBody.set_axis_lock,
        Godot.Core.RigidBody.set_axis_velocity,
        Godot.Core.RigidBody.set_bounce,
        Godot.Core.RigidBody.set_can_sleep,
        Godot.Core.RigidBody.set_contact_monitor,
        Godot.Core.RigidBody.set_friction,
        Godot.Core.RigidBody.set_gravity_scale,
        Godot.Core.RigidBody.set_linear_damp,
        Godot.Core.RigidBody.set_linear_velocity,
        Godot.Core.RigidBody.set_mass,
        Godot.Core.RigidBody.set_max_contacts_reported,
        Godot.Core.RigidBody.set_mode,
        Godot.Core.RigidBody.set_physics_material_override,
        Godot.Core.RigidBody.set_sleeping,
        Godot.Core.RigidBody.set_use_continuous_collision_detection,
        Godot.Core.RigidBody.set_use_custom_integrator,
        Godot.Core.RigidBody.set_weight)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_STATIC :: Int
_MODE_STATIC = 1

_MODE_KINEMATIC :: Int
_MODE_KINEMATIC = 3

_MODE_RIGID :: Int
_MODE_RIGID = 0

_MODE_CHARACTER :: Int
_MODE_CHARACTER = 2

-- | Emitted when a body enters into contact with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
sig_body_entered :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal RigidBody "body_entered" '[Node]

-- | Emitted when a body shape exits contact with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
sig_body_exited :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal RigidBody "body_exited" '[Node]

-- | Emitted when a body enters into contact with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
--   				This signal not only receives the body that collided with this one, but also its [RID] ([code]body_id[/code]), the shape index from the colliding body ([code]body_shape[/code]), and the shape index from this body ([code]local_shape[/code]) the other body collided with.
sig_body_shape_entered :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal RigidBody "body_shape_entered"
           '[Int, Node, Int, Int]

-- | Emitted when a body shape exits contact with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
--   				This signal not only receives the body that stopped colliding with this one, but also its [RID] ([code]body_id[/code]), the shape index from the colliding body ([code]body_shape[/code]), and the shape index from this body ([code]local_shape[/code]) the other body stopped colliding with.
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal RigidBody "body_shape_exited"
           '[Int, Node, Int, Int]

-- | Emitted when the physics engine changes the body's sleeping state.
--   				[b]Note:[/b] Changing the value [member sleeping] will not trigger this signal. It is only emitted if the sleeping state is changed by the physics engine or [code]emit_signal("sleeping_state_changed")[/code] is used.
sig_sleeping_state_changed ::
                           Godot.Internal.Dispatch.Signal RigidBody
sig_sleeping_state_changed
  = Godot.Internal.Dispatch.Signal "sleeping_state_changed"

instance NodeSignal RigidBody "sleeping_state_changed" '[]

{-# NOINLINE bindRigidBody__body_enter_tree #-}

bindRigidBody__body_enter_tree :: MethodBind
bindRigidBody__body_enter_tree
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_body_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_enter_tree ::
                   (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
_body_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__body_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody__body_exit_tree #-}

bindRigidBody__body_exit_tree :: MethodBind
bindRigidBody__body_exit_tree
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_body_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_exit_tree ::
                  (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
_body_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__body_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody__direct_state_changed #-}

bindRigidBody__direct_state_changed :: MethodBind
bindRigidBody__direct_state_changed
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_direct_state_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_direct_state_changed ::
                        (RigidBody :< cls, Object :< cls) => cls -> Object -> IO ()
_direct_state_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__direct_state_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody__integrate_forces #-}

-- | Called during physics processing, allowing you to read and safely modify the simulation state for the object. By default, it works in addition to the usual physics behavior, but the [member custom_integrator] property allows you to disable the default behavior and do fully custom force integration for a body.
bindRigidBody__integrate_forces :: MethodBind
bindRigidBody__integrate_forces
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called during physics processing, allowing you to read and safely modify the simulation state for the object. By default, it works in addition to the usual physics behavior, but the [member custom_integrator] property allows you to disable the default behavior and do fully custom force integration for a body.
_integrate_forces ::
                    (RigidBody :< cls, Object :< cls) =>
                    cls -> PhysicsDirectBodyState -> IO ()
_integrate_forces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody__integrate_forces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody__reload_physics_characteristics #-}

bindRigidBody__reload_physics_characteristics :: MethodBind
bindRigidBody__reload_physics_characteristics
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_reload_physics_characteristics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_physics_characteristics ::
                                  (RigidBody :< cls, Object :< cls) => cls -> IO ()
_reload_physics_characteristics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody__reload_physics_characteristics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_add_central_force #-}

-- | Adds a constant directional force (i.e. acceleration) without affecting rotation.
--   				This is equivalent to [code]add_force(force, Vector3(0,0,0))[/code].
bindRigidBody_add_central_force :: MethodBind
bindRigidBody_add_central_force
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant directional force (i.e. acceleration) without affecting rotation.
--   				This is equivalent to [code]add_force(force, Vector3(0,0,0))[/code].
add_central_force ::
                    (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_central_force (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_add_force #-}

-- | Adds a constant directional force (i.e. acceleration).
--   				The position uses the rotation of the global coordinate system, but is centered at the object's origin.
bindRigidBody_add_force :: MethodBind
bindRigidBody_add_force
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant directional force (i.e. acceleration).
--   				The position uses the rotation of the global coordinate system, but is centered at the object's origin.
add_force ::
            (RigidBody :< cls, Object :< cls) =>
            cls -> Vector3 -> Vector3 -> IO ()
add_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_force (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_add_torque #-}

-- | Adds a constant rotational force (i.e. a motor) without affecting position.
bindRigidBody_add_torque :: MethodBind
bindRigidBody_add_torque
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant rotational force (i.e. a motor) without affecting position.
add_torque ::
             (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_torque (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_apply_central_impulse #-}

-- | Applies a directional impulse without affecting rotation.
--   				This is equivalent to [code]apply_impulse(Vector3(0,0,0), impulse)[/code].
bindRigidBody_apply_central_impulse :: MethodBind
bindRigidBody_apply_central_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a directional impulse without affecting rotation.
--   				This is equivalent to [code]apply_impulse(Vector3(0,0,0), impulse)[/code].
apply_central_impulse ::
                        (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
apply_central_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_apply_impulse #-}

-- | Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason it should only be used when simulating one-time impacts. The position uses the rotation of the global coordinate system, but is centered at the object's origin.
bindRigidBody_apply_impulse :: MethodBind
bindRigidBody_apply_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a positioned impulse to the body. An impulse is time independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason it should only be used when simulating one-time impacts. The position uses the rotation of the global coordinate system, but is centered at the object's origin.
apply_impulse ::
                (RigidBody :< cls, Object :< cls) =>
                cls -> Vector3 -> Vector3 -> IO ()
apply_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_apply_impulse (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_apply_torque_impulse #-}

-- | Applies a torque impulse which will be affected by the body mass and shape. This will rotate the body around the [code]impulse[/code] vector passed.
bindRigidBody_apply_torque_impulse :: MethodBind
bindRigidBody_apply_torque_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a torque impulse which will be affected by the body mass and shape. This will rotate the body around the [code]impulse[/code] vector passed.
apply_torque_impulse ::
                       (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
apply_torque_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_angular_damp #-}

-- | Damps RigidBody's rotational forces.
bindRigidBody_get_angular_damp :: MethodBind
bindRigidBody_get_angular_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps RigidBody's rotational forces.
get_angular_damp ::
                   (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_angular_velocity #-}

-- | RigidBody's rotational velocity.
bindRigidBody_get_angular_velocity :: MethodBind
bindRigidBody_get_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | RigidBody's rotational velocity.
get_angular_velocity ::
                       (RigidBody :< cls, Object :< cls) => cls -> IO Vector3
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_axis_lock #-}

-- | Returns [code]true[/code] if the specified linear or rotational axis is locked.
bindRigidBody_get_axis_lock :: MethodBind
bindRigidBody_get_axis_lock
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the specified linear or rotational axis is locked.
get_axis_lock ::
                (RigidBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_axis_lock cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
bindRigidBody_get_bounce :: MethodBind
bindRigidBody_get_bounce
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
get_bounce :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_bounce (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_colliding_bodies #-}

-- | Returns a list of the bodies colliding with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
--   				[b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
bindRigidBody_get_colliding_bodies :: MethodBind
bindRigidBody_get_colliding_bodies
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_colliding_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the bodies colliding with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
--   				[b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
get_colliding_bodies ::
                       (RigidBody :< cls, Object :< cls) => cls -> IO Array
get_colliding_bodies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_colliding_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_friction #-}

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
bindRigidBody_get_friction :: MethodBind
bindRigidBody_get_friction
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
get_friction ::
               (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_gravity_scale #-}

-- | This is multiplied by the global 3D gravity setting found in [b]Project > Project Settings > Physics > 3d[/b] to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
bindRigidBody_get_gravity_scale :: MethodBind
bindRigidBody_get_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is multiplied by the global 3D gravity setting found in [b]Project > Project Settings > Physics > 3d[/b] to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
get_gravity_scale ::
                    (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_gravity_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_gravity_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_linear_damp #-}

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
bindRigidBody_get_linear_damp :: MethodBind
bindRigidBody_get_linear_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
get_linear_damp ::
                  (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_linear_velocity #-}

-- | The body's linear velocity. Can be used sporadically, but [b]don't set this every frame[/b], because physics may run in another thread and runs at a different granularity. Use [method _integrate_forces] as your process loop for precise control of the body state.
bindRigidBody_get_linear_velocity :: MethodBind
bindRigidBody_get_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity. Can be used sporadically, but [b]don't set this every frame[/b], because physics may run in another thread and runs at a different granularity. Use [method _integrate_forces] as your process loop for precise control of the body state.
get_linear_velocity ::
                      (RigidBody :< cls, Object :< cls) => cls -> IO Vector3
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_mass #-}

-- | The body's mass.
bindRigidBody_get_mass :: MethodBind
bindRigidBody_get_mass
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mass.
get_mass :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_mass (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
bindRigidBody_get_max_contacts_reported :: MethodBind
bindRigidBody_get_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
get_max_contacts_reported ::
                            (RigidBody :< cls, Object :< cls) => cls -> IO Int
get_max_contacts_reported cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_mode #-}

-- | The body mode. See [enum Mode] for possible values.
bindRigidBody_get_mode :: MethodBind
bindRigidBody_get_mode
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body mode. See [enum Mode] for possible values.
get_mode :: (RigidBody :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_physics_material_override #-}

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
bindRigidBody_get_physics_material_override :: MethodBind
bindRigidBody_get_physics_material_override
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
get_physics_material_override ::
                                (RigidBody :< cls, Object :< cls) => cls -> IO PhysicsMaterial
get_physics_material_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_get_weight #-}

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in [b]Project > Project Settings > Physics > 3d[/b].
bindRigidBody_get_weight :: MethodBind
bindRigidBody_get_weight
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in [b]Project > Project Settings > Physics > 3d[/b].
get_weight :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_weight cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_weight (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_is_able_to_sleep #-}

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody3D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
bindRigidBody_is_able_to_sleep :: MethodBind
bindRigidBody_is_able_to_sleep
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_able_to_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody3D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
is_able_to_sleep ::
                   (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_able_to_sleep cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_able_to_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_is_contact_monitor_enabled #-}

-- | If [code]true[/code], the RigidBody will emit signals when it collides with another RigidBody. See also [member contacts_reported].
bindRigidBody_is_contact_monitor_enabled :: MethodBind
bindRigidBody_is_contact_monitor_enabled
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_contact_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the RigidBody will emit signals when it collides with another RigidBody. See also [member contacts_reported].
is_contact_monitor_enabled ::
                             (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_contact_monitor_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_contact_monitor_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_is_sleeping #-}

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
bindRigidBody_is_sleeping :: MethodBind
bindRigidBody_is_sleeping
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
is_sleeping :: (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_is_using_continuous_collision_detection
             #-}

-- | If [code]true[/code], continuous collision detection is used.
--   			Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small, fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving objects.
bindRigidBody_is_using_continuous_collision_detection :: MethodBind
bindRigidBody_is_using_continuous_collision_detection
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_using_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], continuous collision detection is used.
--   			Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small, fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving objects.
is_using_continuous_collision_detection ::
                                          (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_using_continuous_collision_detection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody_is_using_continuous_collision_detection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_is_using_custom_integrator #-}

-- | If [code]true[/code], internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the [method _integrate_forces] function, if defined.
bindRigidBody_is_using_custom_integrator :: MethodBind
bindRigidBody_is_using_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_using_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the [method _integrate_forces] function, if defined.
is_using_custom_integrator ::
                             (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_using_custom_integrator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_using_custom_integrator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_angular_damp #-}

-- | Damps RigidBody's rotational forces.
bindRigidBody_set_angular_damp :: MethodBind
bindRigidBody_set_angular_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps RigidBody's rotational forces.
set_angular_damp ::
                   (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_angular_velocity #-}

-- | RigidBody's rotational velocity.
bindRigidBody_set_angular_velocity :: MethodBind
bindRigidBody_set_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | RigidBody's rotational velocity.
set_angular_velocity ::
                       (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_axis_lock #-}

-- | Locks the specified linear or rotational axis.
bindRigidBody_set_axis_lock :: MethodBind
bindRigidBody_set_axis_lock
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Locks the specified linear or rotational axis.
set_axis_lock ::
                (RigidBody :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_axis_lock cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_axis_velocity #-}

-- | Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
bindRigidBody_set_axis_velocity :: MethodBind
bindRigidBody_set_axis_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_axis_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an axis velocity. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
set_axis_velocity ::
                    (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_axis_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_axis_velocity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
bindRigidBody_set_bounce :: MethodBind
bindRigidBody_set_bounce
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
set_bounce ::
             (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_bounce (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_can_sleep #-}

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody3D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
bindRigidBody_set_can_sleep :: MethodBind
bindRigidBody_set_can_sleep
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_can_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody3D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
set_can_sleep ::
                (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_can_sleep cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_can_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_contact_monitor #-}

-- | If [code]true[/code], the RigidBody will emit signals when it collides with another RigidBody. See also [member contacts_reported].
bindRigidBody_set_contact_monitor :: MethodBind
bindRigidBody_set_contact_monitor
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_contact_monitor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the RigidBody will emit signals when it collides with another RigidBody. See also [member contacts_reported].
set_contact_monitor ::
                      (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_contact_monitor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_contact_monitor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_friction #-}

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
bindRigidBody_set_friction :: MethodBind
bindRigidBody_set_friction
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
set_friction ::
               (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_gravity_scale #-}

-- | This is multiplied by the global 3D gravity setting found in [b]Project > Project Settings > Physics > 3d[/b] to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
bindRigidBody_set_gravity_scale :: MethodBind
bindRigidBody_set_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is multiplied by the global 3D gravity setting found in [b]Project > Project Settings > Physics > 3d[/b] to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
set_gravity_scale ::
                    (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_gravity_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_linear_damp #-}

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
bindRigidBody_set_linear_damp :: MethodBind
bindRigidBody_set_linear_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
set_linear_damp ::
                  (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_linear_velocity #-}

-- | The body's linear velocity. Can be used sporadically, but [b]don't set this every frame[/b], because physics may run in another thread and runs at a different granularity. Use [method _integrate_forces] as your process loop for precise control of the body state.
bindRigidBody_set_linear_velocity :: MethodBind
bindRigidBody_set_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity. Can be used sporadically, but [b]don't set this every frame[/b], because physics may run in another thread and runs at a different granularity. Use [method _integrate_forces] as your process loop for precise control of the body state.
set_linear_velocity ::
                      (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_mass #-}

-- | The body's mass.
bindRigidBody_set_mass :: MethodBind
bindRigidBody_set_mass
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mass.
set_mass ::
           (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_mass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_mass (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
bindRigidBody_set_max_contacts_reported :: MethodBind
bindRigidBody_set_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
set_max_contacts_reported ::
                            (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_contacts_reported cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_mode #-}

-- | The body mode. See [enum Mode] for possible values.
bindRigidBody_set_mode :: MethodBind
bindRigidBody_set_mode
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body mode. See [enum Mode] for possible values.
set_mode ::
           (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_physics_material_override #-}

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
bindRigidBody_set_physics_material_override :: MethodBind
bindRigidBody_set_physics_material_override
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
set_physics_material_override ::
                                (RigidBody :< cls, Object :< cls) =>
                                cls -> PhysicsMaterial -> IO ()
set_physics_material_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_sleeping #-}

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
bindRigidBody_set_sleeping :: MethodBind
bindRigidBody_set_sleeping
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
set_sleeping ::
               (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sleeping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_use_continuous_collision_detection
             #-}

-- | If [code]true[/code], continuous collision detection is used.
--   			Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small, fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving objects.
bindRigidBody_set_use_continuous_collision_detection :: MethodBind
bindRigidBody_set_use_continuous_collision_detection
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_use_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], continuous collision detection is used.
--   			Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small, fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving objects.
set_use_continuous_collision_detection ::
                                         (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_continuous_collision_detection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody_set_use_continuous_collision_detection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_use_custom_integrator #-}

-- | If [code]true[/code], internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the [method _integrate_forces] function, if defined.
bindRigidBody_set_use_custom_integrator :: MethodBind
bindRigidBody_set_use_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_use_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the [method _integrate_forces] function, if defined.
set_use_custom_integrator ::
                            (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_custom_integrator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_use_custom_integrator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody_set_weight #-}

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in [b]Project > Project Settings > Physics > 3d[/b].
bindRigidBody_set_weight :: MethodBind
bindRigidBody_set_weight
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in [b]Project > Project Settings > Physics > 3d[/b].
set_weight ::
             (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_weight cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_weight (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)