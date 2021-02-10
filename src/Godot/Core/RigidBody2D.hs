{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RigidBody2D
       (Godot.Core.RigidBody2D._MODE_STATIC,
        Godot.Core.RigidBody2D._CCD_MODE_DISABLED,
        Godot.Core.RigidBody2D._CCD_MODE_CAST_RAY,
        Godot.Core.RigidBody2D._MODE_KINEMATIC,
        Godot.Core.RigidBody2D._CCD_MODE_CAST_SHAPE,
        Godot.Core.RigidBody2D._MODE_RIGID,
        Godot.Core.RigidBody2D._MODE_CHARACTER,
        Godot.Core.RigidBody2D.sig_body_entered,
        Godot.Core.RigidBody2D.sig_body_exited,
        Godot.Core.RigidBody2D.sig_body_shape_entered,
        Godot.Core.RigidBody2D.sig_body_shape_exited,
        Godot.Core.RigidBody2D.sig_sleeping_state_changed,
        Godot.Core.RigidBody2D._body_enter_tree,
        Godot.Core.RigidBody2D._body_exit_tree,
        Godot.Core.RigidBody2D._direct_state_changed,
        Godot.Core.RigidBody2D._integrate_forces,
        Godot.Core.RigidBody2D._reload_physics_characteristics,
        Godot.Core.RigidBody2D.add_central_force,
        Godot.Core.RigidBody2D.add_force,
        Godot.Core.RigidBody2D.add_torque,
        Godot.Core.RigidBody2D.apply_central_impulse,
        Godot.Core.RigidBody2D.apply_impulse,
        Godot.Core.RigidBody2D.apply_torque_impulse,
        Godot.Core.RigidBody2D.get_angular_damp,
        Godot.Core.RigidBody2D.get_angular_velocity,
        Godot.Core.RigidBody2D.get_applied_force,
        Godot.Core.RigidBody2D.get_applied_torque,
        Godot.Core.RigidBody2D.get_bounce,
        Godot.Core.RigidBody2D.get_colliding_bodies,
        Godot.Core.RigidBody2D.get_continuous_collision_detection_mode,
        Godot.Core.RigidBody2D.get_friction,
        Godot.Core.RigidBody2D.get_gravity_scale,
        Godot.Core.RigidBody2D.get_inertia,
        Godot.Core.RigidBody2D.get_linear_damp,
        Godot.Core.RigidBody2D.get_linear_velocity,
        Godot.Core.RigidBody2D.get_mass,
        Godot.Core.RigidBody2D.get_max_contacts_reported,
        Godot.Core.RigidBody2D.get_mode,
        Godot.Core.RigidBody2D.get_physics_material_override,
        Godot.Core.RigidBody2D.get_weight,
        Godot.Core.RigidBody2D.is_able_to_sleep,
        Godot.Core.RigidBody2D.is_contact_monitor_enabled,
        Godot.Core.RigidBody2D.is_sleeping,
        Godot.Core.RigidBody2D.is_using_custom_integrator,
        Godot.Core.RigidBody2D.set_angular_damp,
        Godot.Core.RigidBody2D.set_angular_velocity,
        Godot.Core.RigidBody2D.set_applied_force,
        Godot.Core.RigidBody2D.set_applied_torque,
        Godot.Core.RigidBody2D.set_axis_velocity,
        Godot.Core.RigidBody2D.set_bounce,
        Godot.Core.RigidBody2D.set_can_sleep,
        Godot.Core.RigidBody2D.set_contact_monitor,
        Godot.Core.RigidBody2D.set_continuous_collision_detection_mode,
        Godot.Core.RigidBody2D.set_friction,
        Godot.Core.RigidBody2D.set_gravity_scale,
        Godot.Core.RigidBody2D.set_inertia,
        Godot.Core.RigidBody2D.set_linear_damp,
        Godot.Core.RigidBody2D.set_linear_velocity,
        Godot.Core.RigidBody2D.set_mass,
        Godot.Core.RigidBody2D.set_max_contacts_reported,
        Godot.Core.RigidBody2D.set_mode,
        Godot.Core.RigidBody2D.set_physics_material_override,
        Godot.Core.RigidBody2D.set_sleeping,
        Godot.Core.RigidBody2D.set_use_custom_integrator,
        Godot.Core.RigidBody2D.set_weight,
        Godot.Core.RigidBody2D.test_motion)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_STATIC :: Int
_MODE_STATIC = 1

_CCD_MODE_DISABLED :: Int
_CCD_MODE_DISABLED = 0

_CCD_MODE_CAST_RAY :: Int
_CCD_MODE_CAST_RAY = 1

_MODE_KINEMATIC :: Int
_MODE_KINEMATIC = 3

_CCD_MODE_CAST_SHAPE :: Int
_CCD_MODE_CAST_SHAPE = 2

_MODE_RIGID :: Int
_MODE_RIGID = 0

_MODE_CHARACTER :: Int
_MODE_CHARACTER = 2

-- | Emitted when a body enters into contact with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
sig_body_entered :: Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal RigidBody2D "body_entered" '[Node]

-- | Emitted when a body exits contact with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
sig_body_exited :: Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal RigidBody2D "body_exited" '[Node]

-- | Emitted when a body enters into contact with this one. Reports colliding shape information. See [CollisionObject2D] for shape index information. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
sig_body_shape_entered ::
                       Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal RigidBody2D "body_shape_entered"
           '[Int, Node, Int, Int]

-- | Emitted when a body shape exits contact with this one. Reports colliding shape information. See [CollisionObject2D] for shape index information. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal RigidBody2D "body_shape_exited"
           '[Int, Node, Int, Int]

-- | Emitted when the physics engine changes the body's sleeping state.
--   				[b]Note:[/b] Changing the value [member sleeping] will not trigger this signal. It is only emitted if the sleeping state is changed by the physics engine or [code]emit_signal("sleeping_state_changed")[/code] is used.
sig_sleeping_state_changed ::
                           Godot.Internal.Dispatch.Signal RigidBody2D
sig_sleeping_state_changed
  = Godot.Internal.Dispatch.Signal "sleeping_state_changed"

instance NodeSignal RigidBody2D "sleeping_state_changed" '[]

{-# NOINLINE bindRigidBody2D__body_enter_tree #-}

bindRigidBody2D__body_enter_tree :: MethodBind
bindRigidBody2D__body_enter_tree
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "_body_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_enter_tree ::
                   (RigidBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
_body_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D__body_enter_tree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D__body_exit_tree #-}

bindRigidBody2D__body_exit_tree :: MethodBind
bindRigidBody2D__body_exit_tree
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "_body_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_exit_tree ::
                  (RigidBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
_body_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D__body_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D__direct_state_changed #-}

bindRigidBody2D__direct_state_changed :: MethodBind
bindRigidBody2D__direct_state_changed
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "_direct_state_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_direct_state_changed ::
                        (RigidBody2D :< cls, Object :< cls) => cls -> Object -> IO ()
_direct_state_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D__direct_state_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D__integrate_forces #-}

-- | Allows you to read and safely modify the simulation state for the object. Use this instead of [method Node._physics_process] if you need to directly change the body's [code]position[/code] or other physics properties. By default, it works in addition to the usual physics behavior, but [member custom_integrator] allows you to disable the default behavior and write custom force integration for a body.
bindRigidBody2D__integrate_forces :: MethodBind
bindRigidBody2D__integrate_forces
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "_integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows you to read and safely modify the simulation state for the object. Use this instead of [method Node._physics_process] if you need to directly change the body's [code]position[/code] or other physics properties. By default, it works in addition to the usual physics behavior, but [member custom_integrator] allows you to disable the default behavior and write custom force integration for a body.
_integrate_forces ::
                    (RigidBody2D :< cls, Object :< cls) =>
                    cls -> Physics2DDirectBodyState -> IO ()
_integrate_forces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D__integrate_forces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D__reload_physics_characteristics #-}

bindRigidBody2D__reload_physics_characteristics :: MethodBind
bindRigidBody2D__reload_physics_characteristics
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "_reload_physics_characteristics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_physics_characteristics ::
                                  (RigidBody2D :< cls, Object :< cls) => cls -> IO ()
_reload_physics_characteristics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody2D__reload_physics_characteristics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_add_central_force #-}

-- | Adds a constant directional force without affecting rotation.
bindRigidBody2D_add_central_force :: MethodBind
bindRigidBody2D_add_central_force
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant directional force without affecting rotation.
add_central_force ::
                    (RigidBody2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_add_central_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_add_force #-}

-- | Adds a positioned force to the body. Both the force and the offset from the body origin are in global coordinates.
bindRigidBody2D_add_force :: MethodBind
bindRigidBody2D_add_force
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "add_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a positioned force to the body. Both the force and the offset from the body origin are in global coordinates.
add_force ::
            (RigidBody2D :< cls, Object :< cls) =>
            cls -> Vector2 -> Vector2 -> IO ()
add_force cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_add_force (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_add_torque #-}

-- | Adds a constant rotational force.
bindRigidBody2D_add_torque :: MethodBind
bindRigidBody2D_add_torque
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "add_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant rotational force.
add_torque ::
             (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
add_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_add_torque (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_apply_central_impulse #-}

-- | Applies a directional impulse without affecting rotation.
bindRigidBody2D_apply_central_impulse :: MethodBind
bindRigidBody2D_apply_central_impulse
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a directional impulse without affecting rotation.
apply_central_impulse ::
                        (RigidBody2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
apply_central_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_apply_central_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_apply_impulse #-}

-- | Applies a positioned impulse to the body. An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason it should only be used when simulating one-time impacts (use the "_force" functions otherwise). The position uses the rotation of the global coordinate system, but is centered at the object's origin.
bindRigidBody2D_apply_impulse :: MethodBind
bindRigidBody2D_apply_impulse
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "apply_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a positioned impulse to the body. An impulse is time-independent! Applying an impulse every frame would result in a framerate-dependent force. For this reason it should only be used when simulating one-time impacts (use the "_force" functions otherwise). The position uses the rotation of the global coordinate system, but is centered at the object's origin.
apply_impulse ::
                (RigidBody2D :< cls, Object :< cls) =>
                cls -> Vector2 -> Vector2 -> IO ()
apply_impulse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_apply_impulse (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_apply_torque_impulse #-}

-- | Applies a rotational impulse to the body.
bindRigidBody2D_apply_torque_impulse :: MethodBind
bindRigidBody2D_apply_torque_impulse
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a rotational impulse to the body.
apply_torque_impulse ::
                       (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
apply_torque_impulse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_apply_torque_impulse
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_angular_damp #-}

-- | Damps the body's [member angular_velocity]. If [code]-1[/code], the body will use the [b]Default Angular Damp[/b] defined in [b]Project > Project Settings > Physics > 2d[/b].
bindRigidBody2D_get_angular_damp :: MethodBind
bindRigidBody2D_get_angular_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's [member angular_velocity]. If [code]-1[/code], the body will use the [b]Default Angular Damp[/b] defined in [b]Project > Project Settings > Physics > 2d[/b].
get_angular_damp ::
                   (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_angular_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_angular_velocity #-}

-- | The body's rotational velocity.
bindRigidBody2D_get_angular_velocity :: MethodBind
bindRigidBody2D_get_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity.
get_angular_velocity ::
                       (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_applied_force #-}

-- | The body's total applied force.
bindRigidBody2D_get_applied_force :: MethodBind
bindRigidBody2D_get_applied_force
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_applied_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's total applied force.
get_applied_force ::
                    (RigidBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_applied_force cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_applied_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_applied_torque #-}

-- | The body's total applied torque.
bindRigidBody2D_get_applied_torque :: MethodBind
bindRigidBody2D_get_applied_torque
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_applied_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's total applied torque.
get_applied_torque ::
                     (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_applied_torque cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_applied_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
bindRigidBody2D_get_bounce :: MethodBind
bindRigidBody2D_get_bounce
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
get_bounce ::
             (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_colliding_bodies #-}

-- | Returns a list of the bodies colliding with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
--   				[b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
bindRigidBody2D_get_colliding_bodies :: MethodBind
bindRigidBody2D_get_colliding_bodies
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_colliding_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the bodies colliding with this one. Requires [member contact_monitor] to be set to [code]true[/code] and [member contacts_reported] to be set high enough to detect all the collisions.
--   				[b]Note:[/b] The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
get_colliding_bodies ::
                       (RigidBody2D :< cls, Object :< cls) => cls -> IO Array
get_colliding_bodies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_colliding_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_continuous_collision_detection_mode
             #-}

-- | Continuous collision detection mode.
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See [enum CCDMode] for details.
bindRigidBody2D_get_continuous_collision_detection_mode ::
                                                        MethodBind
bindRigidBody2D_get_continuous_collision_detection_mode
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_continuous_collision_detection_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Continuous collision detection mode.
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See [enum CCDMode] for details.
get_continuous_collision_detection_mode ::
                                          (RigidBody2D :< cls, Object :< cls) => cls -> IO Int
get_continuous_collision_detection_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody2D_get_continuous_collision_detection_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_friction #-}

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
bindRigidBody2D_get_friction :: MethodBind
bindRigidBody2D_get_friction
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
get_friction ::
               (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_gravity_scale #-}

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b] and/or any additional gravity vector applied by [Area2D]s.
bindRigidBody2D_get_gravity_scale :: MethodBind
bindRigidBody2D_get_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b] and/or any additional gravity vector applied by [Area2D]s.
get_gravity_scale ::
                    (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_gravity_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_gravity_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_inertia #-}

-- | The body's moment of inertia. This is like mass, but for rotation: it determines how much torque it takes to rotate the body. The moment of inertia is usually computed automatically from the mass and the shapes, but this function allows you to set a custom value. Set 0 inertia to return to automatically computing it.
bindRigidBody2D_get_inertia :: MethodBind
bindRigidBody2D_get_inertia
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_inertia" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's moment of inertia. This is like mass, but for rotation: it determines how much torque it takes to rotate the body. The moment of inertia is usually computed automatically from the mass and the shapes, but this function allows you to set a custom value. Set 0 inertia to return to automatically computing it.
get_inertia ::
              (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_inertia cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_inertia (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_linear_damp #-}

-- | Damps the body's [member linear_velocity]. If [code]-1[/code], the body will use the [b]Default Linear Damp[/b] in [b]Project > Project Settings > Physics > 2d[/b].
bindRigidBody2D_get_linear_damp :: MethodBind
bindRigidBody2D_get_linear_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's [member linear_velocity]. If [code]-1[/code], the body will use the [b]Default Linear Damp[/b] in [b]Project > Project Settings > Physics > 2d[/b].
get_linear_damp ::
                  (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_linear_velocity #-}

-- | The body's linear velocity.
bindRigidBody2D_get_linear_velocity :: MethodBind
bindRigidBody2D_get_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity.
get_linear_velocity ::
                      (RigidBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_mass #-}

-- | The body's mass.
bindRigidBody2D_get_mass :: MethodBind
bindRigidBody2D_get_mass
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mass.
get_mass :: (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_mass (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
bindRigidBody2D_get_max_contacts_reported :: MethodBind
bindRigidBody2D_get_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
get_max_contacts_reported ::
                            (RigidBody2D :< cls, Object :< cls) => cls -> IO Int
get_max_contacts_reported cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_mode #-}

-- | The body's mode. See [enum Mode] for possible values.
bindRigidBody2D_get_mode :: MethodBind
bindRigidBody2D_get_mode
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mode. See [enum Mode] for possible values.
get_mode :: (RigidBody2D :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_physics_material_override #-}

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
bindRigidBody2D_get_physics_material_override :: MethodBind
bindRigidBody2D_get_physics_material_override
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
get_physics_material_override ::
                                (RigidBody2D :< cls, Object :< cls) => cls -> IO PhysicsMaterial
get_physics_material_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody2D_get_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_get_weight #-}

-- | The body's weight based on its mass and the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b].
bindRigidBody2D_get_weight :: MethodBind
bindRigidBody2D_get_weight
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b].
get_weight ::
             (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_weight cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_weight (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_is_able_to_sleep #-}

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody2D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
bindRigidBody2D_is_able_to_sleep :: MethodBind
bindRigidBody2D_is_able_to_sleep
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_able_to_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody2D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
is_able_to_sleep ::
                   (RigidBody2D :< cls, Object :< cls) => cls -> IO Bool
is_able_to_sleep cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_is_able_to_sleep
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_is_contact_monitor_enabled #-}

-- | If [code]true[/code], the body will emit signals when it collides with another RigidBody2D. See also [member contacts_reported].
bindRigidBody2D_is_contact_monitor_enabled :: MethodBind
bindRigidBody2D_is_contact_monitor_enabled
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_contact_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body will emit signals when it collides with another RigidBody2D. See also [member contacts_reported].
is_contact_monitor_enabled ::
                             (RigidBody2D :< cls, Object :< cls) => cls -> IO Bool
is_contact_monitor_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_is_contact_monitor_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_is_sleeping #-}

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
bindRigidBody2D_is_sleeping :: MethodBind
bindRigidBody2D_is_sleeping
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
is_sleeping ::
              (RigidBody2D :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_is_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_is_using_custom_integrator #-}

-- | If [code]true[/code], internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the [method _integrate_forces] function.
bindRigidBody2D_is_using_custom_integrator :: MethodBind
bindRigidBody2D_is_using_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_using_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the [method _integrate_forces] function.
is_using_custom_integrator ::
                             (RigidBody2D :< cls, Object :< cls) => cls -> IO Bool
is_using_custom_integrator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_is_using_custom_integrator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_angular_damp #-}

-- | Damps the body's [member angular_velocity]. If [code]-1[/code], the body will use the [b]Default Angular Damp[/b] defined in [b]Project > Project Settings > Physics > 2d[/b].
bindRigidBody2D_set_angular_damp :: MethodBind
bindRigidBody2D_set_angular_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's [member angular_velocity]. If [code]-1[/code], the body will use the [b]Default Angular Damp[/b] defined in [b]Project > Project Settings > Physics > 2d[/b].
set_angular_damp ::
                   (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_angular_damp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_angular_velocity #-}

-- | The body's rotational velocity.
bindRigidBody2D_set_angular_velocity :: MethodBind
bindRigidBody2D_set_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity.
set_angular_velocity ::
                       (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_applied_force #-}

-- | The body's total applied force.
bindRigidBody2D_set_applied_force :: MethodBind
bindRigidBody2D_set_applied_force
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_applied_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's total applied force.
set_applied_force ::
                    (RigidBody2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_applied_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_applied_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_applied_torque #-}

-- | The body's total applied torque.
bindRigidBody2D_set_applied_torque :: MethodBind
bindRigidBody2D_set_applied_torque
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_applied_torque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's total applied torque.
set_applied_torque ::
                     (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_applied_torque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_applied_torque
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_axis_velocity #-}

-- | Sets the body's velocity on the given axis. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
bindRigidBody2D_set_axis_velocity :: MethodBind
bindRigidBody2D_set_axis_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_axis_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the body's velocity on the given axis. The velocity in the given vector axis will be set as the given vector length. This is useful for jumping behavior.
set_axis_velocity ::
                    (RigidBody2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_axis_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_axis_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
bindRigidBody2D_set_bounce :: MethodBind
bindRigidBody2D_set_bounce
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
--   			Deprecated, use [member PhysicsMaterial.bounce] instead via [member physics_material_override].
set_bounce ::
             (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_can_sleep #-}

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody2D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
bindRigidBody2D_set_can_sleep :: MethodBind
bindRigidBody2D_set_can_sleep
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_can_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body can enter sleep mode when there is no movement. See [member sleeping].
--   			[b]Note:[/b] A RigidBody2D will never enter sleep mode automatically if its [member mode] is [constant MODE_CHARACTER]. It can still be put to sleep manually by setting its [member sleeping] property to [code]true[/code].
set_can_sleep ::
                (RigidBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_can_sleep cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_can_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_contact_monitor #-}

-- | If [code]true[/code], the body will emit signals when it collides with another RigidBody2D. See also [member contacts_reported].
bindRigidBody2D_set_contact_monitor :: MethodBind
bindRigidBody2D_set_contact_monitor
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_contact_monitor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body will emit signals when it collides with another RigidBody2D. See also [member contacts_reported].
set_contact_monitor ::
                      (RigidBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_contact_monitor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_contact_monitor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_continuous_collision_detection_mode
             #-}

-- | Continuous collision detection mode.
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See [enum CCDMode] for details.
bindRigidBody2D_set_continuous_collision_detection_mode ::
                                                        MethodBind
bindRigidBody2D_set_continuous_collision_detection_mode
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_continuous_collision_detection_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Continuous collision detection mode.
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See [enum CCDMode] for details.
set_continuous_collision_detection_mode ::
                                          (RigidBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_continuous_collision_detection_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody2D_set_continuous_collision_detection_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_friction #-}

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
bindRigidBody2D_set_friction :: MethodBind
bindRigidBody2D_set_friction
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
--   			Deprecated, use [member PhysicsMaterial.friction] instead via [member physics_material_override].
set_friction ::
               (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_gravity_scale #-}

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b] and/or any additional gravity vector applied by [Area2D]s.
bindRigidBody2D_set_gravity_scale :: MethodBind
bindRigidBody2D_set_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b] and/or any additional gravity vector applied by [Area2D]s.
set_gravity_scale ::
                    (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_gravity_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_inertia #-}

-- | The body's moment of inertia. This is like mass, but for rotation: it determines how much torque it takes to rotate the body. The moment of inertia is usually computed automatically from the mass and the shapes, but this function allows you to set a custom value. Set 0 inertia to return to automatically computing it.
bindRigidBody2D_set_inertia :: MethodBind
bindRigidBody2D_set_inertia
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_inertia" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's moment of inertia. This is like mass, but for rotation: it determines how much torque it takes to rotate the body. The moment of inertia is usually computed automatically from the mass and the shapes, but this function allows you to set a custom value. Set 0 inertia to return to automatically computing it.
set_inertia ::
              (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_inertia cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_inertia (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_linear_damp #-}

-- | Damps the body's [member linear_velocity]. If [code]-1[/code], the body will use the [b]Default Linear Damp[/b] in [b]Project > Project Settings > Physics > 2d[/b].
bindRigidBody2D_set_linear_damp :: MethodBind
bindRigidBody2D_set_linear_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's [member linear_velocity]. If [code]-1[/code], the body will use the [b]Default Linear Damp[/b] in [b]Project > Project Settings > Physics > 2d[/b].
set_linear_damp ::
                  (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_linear_velocity #-}

-- | The body's linear velocity.
bindRigidBody2D_set_linear_velocity :: MethodBind
bindRigidBody2D_set_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity.
set_linear_velocity ::
                      (RigidBody2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_mass #-}

-- | The body's mass.
bindRigidBody2D_set_mass :: MethodBind
bindRigidBody2D_set_mass
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mass.
set_mass ::
           (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_mass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_mass (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
bindRigidBody2D_set_max_contacts_reported :: MethodBind
bindRigidBody2D_set_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires [member contact_monitor] to be set to [code]true[/code].
--   			[b]Note:[/b] The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
set_max_contacts_reported ::
                            (RigidBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_contacts_reported cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_max_contacts_reported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_mode #-}

-- | The body's mode. See [enum Mode] for possible values.
bindRigidBody2D_set_mode :: MethodBind
bindRigidBody2D_set_mode
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mode. See [enum Mode] for possible values.
set_mode ::
           (RigidBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_physics_material_override #-}

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
bindRigidBody2D_set_physics_material_override :: MethodBind
bindRigidBody2D_set_physics_material_override
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
set_physics_material_override ::
                                (RigidBody2D :< cls, Object :< cls) =>
                                cls -> PhysicsMaterial -> IO ()
set_physics_material_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRigidBody2D_set_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_sleeping #-}

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
bindRigidBody2D_set_sleeping :: MethodBind
bindRigidBody2D_set_sleeping
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the [method apply_impulse] or [method add_force] methods.
set_sleeping ::
               (RigidBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sleeping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_use_custom_integrator #-}

-- | If [code]true[/code], internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the [method _integrate_forces] function.
bindRigidBody2D_set_use_custom_integrator :: MethodBind
bindRigidBody2D_set_use_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_use_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the [method _integrate_forces] function.
set_use_custom_integrator ::
                            (RigidBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_custom_integrator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_use_custom_integrator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_set_weight #-}

-- | The body's weight based on its mass and the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b].
bindRigidBody2D_set_weight :: MethodBind
bindRigidBody2D_set_weight
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the [b]Default Gravity[/b] value in [b]Project > Project Settings > Physics > 2d[/b].
set_weight ::
             (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_weight cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_weight (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRigidBody2D_test_motion #-}

-- | Returns [code]true[/code] if a collision would result from moving in the given vector. [code]margin[/code] increases the size of the shapes involved in the collision detection, and [code]result[/code] is an object of type [Physics2DTestMotionResult], which contains additional information about the collision (should there be one).
bindRigidBody2D_test_motion :: MethodBind
bindRigidBody2D_test_motion
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "test_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if a collision would result from moving in the given vector. [code]margin[/code] increases the size of the shapes involved in the collision detection, and [code]result[/code] is an object of type [Physics2DTestMotionResult], which contains additional information about the collision (should there be one).
test_motion ::
              (RigidBody2D :< cls, Object :< cls) =>
              cls ->
                Vector2 -> Bool -> Float -> Physics2DTestMotionResult -> IO Bool
test_motion cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_test_motion (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)