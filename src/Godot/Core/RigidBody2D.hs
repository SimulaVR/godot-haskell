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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.PhysicsBody2D()

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

-- | Emitted when a collision with another @PhysicsBody2D@ or @TileMap@ occurs. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody2D@ or @TileMap@.
sig_body_entered :: Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal RigidBody2D "body_entered" '[Node]

-- | Emitted when the collision with another @PhysicsBody2D@ or @TileMap@ ends. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody2D@ or @TileMap@.
sig_body_exited :: Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal RigidBody2D "body_exited" '[Node]

-- | Emitted when one of this RigidBody2D's @Shape2D@s collides with another @PhysicsBody2D@ or @TileMap@'s @Shape2D@s. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body_rid@ the @RID@ of the other @PhysicsBody2D@ or @TileSet@'s @CollisionObject2D@ used by the @Physics2DServer@.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody2D@ or @TileMap@.
--   				@body_shape_index@ the index of the @Shape2D@ of the other @PhysicsBody2D@ or @TileMap@ used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @body.shape_owner_get_owner(body_shape_index)@.
--   				@local_shape_index@ the index of the @Shape2D@ of this RigidBody2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @self.shape_owner_get_owner(local_shape_index)@.
sig_body_shape_entered ::
                       Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal RigidBody2D "body_shape_entered"
           '[Int, Node, Int, Int]

-- | Emitted when the collision between one of this RigidBody2D's @Shape2D@s and another @PhysicsBody2D@ or @TileMap@'s @Shape2D@s ends. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body_rid@ the @RID@ of the other @PhysicsBody2D@ or @TileSet@'s @CollisionObject2D@ used by the @Physics2DServer@.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody2D@ or @TileMap@.
--   				@body_shape_index@ the index of the @Shape2D@ of the other @PhysicsBody2D@ or @TileMap@ used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @body.shape_owner_get_owner(body_shape_index)@.
--   				@local_shape_index@ the index of the @Shape2D@ of this RigidBody2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @self.shape_owner_get_owner(local_shape_index)@.
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal RigidBody2D
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal RigidBody2D "body_shape_exited"
           '[Int, Node, Int, Int]

-- | Emitted when the physics engine changes the body's sleeping state.
--   				__Note:__ Changing the value @sleeping@ will not trigger this signal. It is only emitted if the sleeping state is changed by the physics engine or @emit_signal("sleeping_state_changed")@ is used.
sig_sleeping_state_changed ::
                           Godot.Internal.Dispatch.Signal RigidBody2D
sig_sleeping_state_changed
  = Godot.Internal.Dispatch.Signal "sleeping_state_changed"

instance NodeSignal RigidBody2D "sleeping_state_changed" '[]

instance NodeProperty RigidBody2D "angular_damp" Float 'False where
        nodeProperty
          = (get_angular_damp, wrapDroppingSetter set_angular_damp, Nothing)

instance NodeProperty RigidBody2D "angular_velocity" Float 'False
         where
        nodeProperty
          = (get_angular_velocity, wrapDroppingSetter set_angular_velocity,
             Nothing)

instance NodeProperty RigidBody2D "applied_force" Vector2 'False
         where
        nodeProperty
          = (get_applied_force, wrapDroppingSetter set_applied_force,
             Nothing)

instance NodeProperty RigidBody2D "applied_torque" Float 'False
         where
        nodeProperty
          = (get_applied_torque, wrapDroppingSetter set_applied_torque,
             Nothing)

instance NodeProperty RigidBody2D "bounce" Float 'False where
        nodeProperty = (get_bounce, wrapDroppingSetter set_bounce, Nothing)

instance NodeProperty RigidBody2D "can_sleep" Bool 'False where
        nodeProperty
          = (is_able_to_sleep, wrapDroppingSetter set_can_sleep, Nothing)

instance NodeProperty RigidBody2D "contact_monitor" Bool 'False
         where
        nodeProperty
          = (is_contact_monitor_enabled,
             wrapDroppingSetter set_contact_monitor, Nothing)

instance NodeProperty RigidBody2D "contacts_reported" Int 'False
         where
        nodeProperty
          = (get_max_contacts_reported,
             wrapDroppingSetter set_max_contacts_reported, Nothing)

instance NodeProperty RigidBody2D "continuous_cd" Int 'False where
        nodeProperty
          = (get_continuous_collision_detection_mode,
             wrapDroppingSetter set_continuous_collision_detection_mode,
             Nothing)

instance NodeProperty RigidBody2D "custom_integrator" Bool 'False
         where
        nodeProperty
          = (is_using_custom_integrator,
             wrapDroppingSetter set_use_custom_integrator, Nothing)

instance NodeProperty RigidBody2D "friction" Float 'False where
        nodeProperty
          = (get_friction, wrapDroppingSetter set_friction, Nothing)

instance NodeProperty RigidBody2D "gravity_scale" Float 'False
         where
        nodeProperty
          = (get_gravity_scale, wrapDroppingSetter set_gravity_scale,
             Nothing)

instance NodeProperty RigidBody2D "inertia" Float 'False where
        nodeProperty
          = (get_inertia, wrapDroppingSetter set_inertia, Nothing)

instance NodeProperty RigidBody2D "linear_damp" Float 'False where
        nodeProperty
          = (get_linear_damp, wrapDroppingSetter set_linear_damp, Nothing)

instance NodeProperty RigidBody2D "linear_velocity" Vector2 'False
         where
        nodeProperty
          = (get_linear_velocity, wrapDroppingSetter set_linear_velocity,
             Nothing)

instance NodeProperty RigidBody2D "mass" Float 'False where
        nodeProperty = (get_mass, wrapDroppingSetter set_mass, Nothing)

instance NodeProperty RigidBody2D "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty RigidBody2D "physics_material_override"
           PhysicsMaterial
           'False
         where
        nodeProperty
          = (get_physics_material_override,
             wrapDroppingSetter set_physics_material_override, Nothing)

instance NodeProperty RigidBody2D "sleeping" Bool 'False where
        nodeProperty
          = (is_sleeping, wrapDroppingSetter set_sleeping, Nothing)

instance NodeProperty RigidBody2D "weight" Float 'False where
        nodeProperty = (get_weight, wrapDroppingSetter set_weight, Nothing)

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

instance NodeMethod RigidBody2D "_body_enter_tree" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D._body_enter_tree

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

instance NodeMethod RigidBody2D "_body_exit_tree" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D._body_exit_tree

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

instance NodeMethod RigidBody2D "_direct_state_changed" '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D._direct_state_changed

{-# NOINLINE bindRigidBody2D__integrate_forces #-}

-- | Allows you to read and safely modify the simulation state for the object. Use this instead of @method Node._physics_process@ if you need to directly change the body's @position@ or other physics properties. By default, it works in addition to the usual physics behavior, but @custom_integrator@ allows you to disable the default behavior and write custom force integration for a body.
bindRigidBody2D__integrate_forces :: MethodBind
bindRigidBody2D__integrate_forces
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "_integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows you to read and safely modify the simulation state for the object. Use this instead of @method Node._physics_process@ if you need to directly change the body's @position@ or other physics properties. By default, it works in addition to the usual physics behavior, but @custom_integrator@ allows you to disable the default behavior and write custom force integration for a body.
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

instance NodeMethod RigidBody2D "_integrate_forces"
           '[Physics2DDirectBodyState]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D._integrate_forces

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

instance NodeMethod RigidBody2D "_reload_physics_characteristics"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D._reload_physics_characteristics

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

instance NodeMethod RigidBody2D "add_central_force" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.add_central_force

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

instance NodeMethod RigidBody2D "add_force" '[Vector2, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.add_force

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

instance NodeMethod RigidBody2D "add_torque" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody2D.add_torque

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

instance NodeMethod RigidBody2D "apply_central_impulse" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.apply_central_impulse

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

instance NodeMethod RigidBody2D "apply_impulse" '[Vector2, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.apply_impulse

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

instance NodeMethod RigidBody2D "apply_torque_impulse" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.apply_torque_impulse

{-# NOINLINE bindRigidBody2D_get_angular_damp #-}

-- | Damps the body's @angular_velocity@. If @-1@, the body will use the __Default Angular Damp__ defined in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
bindRigidBody2D_get_angular_damp :: MethodBind
bindRigidBody2D_get_angular_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's @angular_velocity@. If @-1@, the body will use the __Default Angular Damp__ defined in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
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

instance NodeMethod RigidBody2D "get_angular_damp" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_angular_damp

{-# NOINLINE bindRigidBody2D_get_angular_velocity #-}

-- | The body's rotational velocity in @i@radians@/i@ per second.
bindRigidBody2D_get_angular_velocity :: MethodBind
bindRigidBody2D_get_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity in @i@radians@/i@ per second.
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

instance NodeMethod RigidBody2D "get_angular_velocity" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_angular_velocity

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

instance NodeMethod RigidBody2D "get_applied_force" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_applied_force

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

instance NodeMethod RigidBody2D "get_applied_torque" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_applied_torque

{-# NOINLINE bindRigidBody2D_get_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
bindRigidBody2D_get_bounce :: MethodBind
bindRigidBody2D_get_bounce
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
get_bounce ::
             (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "get_bounce" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody2D.get_bounce

{-# NOINLINE bindRigidBody2D_get_colliding_bodies #-}

-- | Returns a list of the bodies colliding with this one. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
bindRigidBody2D_get_colliding_bodies :: MethodBind
bindRigidBody2D_get_colliding_bodies
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_colliding_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the bodies colliding with this one. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
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

instance NodeMethod RigidBody2D "get_colliding_bodies" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_colliding_bodies

{-# NOINLINE bindRigidBody2D_get_continuous_collision_detection_mode
             #-}

-- | Continuous collision detection mode.
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See @enum CCDMode@ for details.
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
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See @enum CCDMode@ for details.
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

instance NodeMethod RigidBody2D
           "get_continuous_collision_detection_mode"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.RigidBody2D.get_continuous_collision_detection_mode

{-# NOINLINE bindRigidBody2D_get_friction #-}

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
bindRigidBody2D_get_friction :: MethodBind
bindRigidBody2D_get_friction
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
get_friction ::
               (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "get_friction" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody2D.get_friction

{-# NOINLINE bindRigidBody2D_get_gravity_scale #-}

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__ and/or any additional gravity vector applied by @Area2D@s.
bindRigidBody2D_get_gravity_scale :: MethodBind
bindRigidBody2D_get_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__ and/or any additional gravity vector applied by @Area2D@s.
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

instance NodeMethod RigidBody2D "get_gravity_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_gravity_scale

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

instance NodeMethod RigidBody2D "get_inertia" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody2D.get_inertia

{-# NOINLINE bindRigidBody2D_get_linear_damp #-}

-- | Damps the body's @linear_velocity@. If @-1@, the body will use the __Default Linear Damp__ in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
bindRigidBody2D_get_linear_damp :: MethodBind
bindRigidBody2D_get_linear_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's @linear_velocity@. If @-1@, the body will use the __Default Linear Damp__ in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
get_linear_damp ::
                  (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "get_linear_damp" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_linear_damp

{-# NOINLINE bindRigidBody2D_get_linear_velocity #-}

-- | The body's linear velocity in pixels per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
bindRigidBody2D_get_linear_velocity :: MethodBind
bindRigidBody2D_get_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity in pixels per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
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

instance NodeMethod RigidBody2D "get_linear_velocity" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_linear_velocity

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

instance NodeMethod RigidBody2D "get_mass" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody2D.get_mass

{-# NOINLINE bindRigidBody2D_get_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end).
bindRigidBody2D_get_max_contacts_reported :: MethodBind
bindRigidBody2D_get_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end).
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

instance NodeMethod RigidBody2D "get_max_contacts_reported" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_max_contacts_reported

{-# NOINLINE bindRigidBody2D_get_mode #-}

-- | The body's mode. See @enum Mode@ for possible values.
bindRigidBody2D_get_mode :: MethodBind
bindRigidBody2D_get_mode
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mode. See @enum Mode@ for possible values.
get_mode :: (RigidBody2D :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.RigidBody2D.get_mode

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

instance NodeMethod RigidBody2D "get_physics_material_override" '[]
           (IO PhysicsMaterial)
         where
        nodeMethod = Godot.Core.RigidBody2D.get_physics_material_override

{-# NOINLINE bindRigidBody2D_get_weight #-}

-- | The body's weight based on its mass and the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__.
bindRigidBody2D_get_weight :: MethodBind
bindRigidBody2D_get_weight
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "get_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__.
get_weight ::
             (RigidBody2D :< cls, Object :< cls) => cls -> IO Float
get_weight cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_get_weight (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "get_weight" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody2D.get_weight

{-# NOINLINE bindRigidBody2D_is_able_to_sleep #-}

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody2D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
bindRigidBody2D_is_able_to_sleep :: MethodBind
bindRigidBody2D_is_able_to_sleep
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_able_to_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody2D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
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

instance NodeMethod RigidBody2D "is_able_to_sleep" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody2D.is_able_to_sleep

{-# NOINLINE bindRigidBody2D_is_contact_monitor_enabled #-}

-- | If @true@, the body will emit signals when it collides with another RigidBody2D. See also @contacts_reported@.
bindRigidBody2D_is_contact_monitor_enabled :: MethodBind
bindRigidBody2D_is_contact_monitor_enabled
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_contact_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body will emit signals when it collides with another RigidBody2D. See also @contacts_reported@.
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

instance NodeMethod RigidBody2D "is_contact_monitor_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody2D.is_contact_monitor_enabled

{-# NOINLINE bindRigidBody2D_is_sleeping #-}

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
bindRigidBody2D_is_sleeping :: MethodBind
bindRigidBody2D_is_sleeping
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
is_sleeping ::
              (RigidBody2D :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_is_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "is_sleeping" '[] (IO Bool) where
        nodeMethod = Godot.Core.RigidBody2D.is_sleeping

{-# NOINLINE bindRigidBody2D_is_using_custom_integrator #-}

-- | If @true@, internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the @method _integrate_forces@ function.
bindRigidBody2D_is_using_custom_integrator :: MethodBind
bindRigidBody2D_is_using_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "is_using_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the @method _integrate_forces@ function.
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

instance NodeMethod RigidBody2D "is_using_custom_integrator" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody2D.is_using_custom_integrator

{-# NOINLINE bindRigidBody2D_set_angular_damp #-}

-- | Damps the body's @angular_velocity@. If @-1@, the body will use the __Default Angular Damp__ defined in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
bindRigidBody2D_set_angular_damp :: MethodBind
bindRigidBody2D_set_angular_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's @angular_velocity@. If @-1@, the body will use the __Default Angular Damp__ defined in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
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

instance NodeMethod RigidBody2D "set_angular_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_angular_damp

{-# NOINLINE bindRigidBody2D_set_angular_velocity #-}

-- | The body's rotational velocity in @i@radians@/i@ per second.
bindRigidBody2D_set_angular_velocity :: MethodBind
bindRigidBody2D_set_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity in @i@radians@/i@ per second.
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

instance NodeMethod RigidBody2D "set_angular_velocity" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_angular_velocity

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

instance NodeMethod RigidBody2D "set_applied_force" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_applied_force

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

instance NodeMethod RigidBody2D "set_applied_torque" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_applied_torque

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

instance NodeMethod RigidBody2D "set_axis_velocity" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_axis_velocity

{-# NOINLINE bindRigidBody2D_set_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
bindRigidBody2D_set_bounce :: MethodBind
bindRigidBody2D_set_bounce
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
set_bounce ::
             (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_bounce" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody2D.set_bounce

{-# NOINLINE bindRigidBody2D_set_can_sleep #-}

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody2D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
bindRigidBody2D_set_can_sleep :: MethodBind
bindRigidBody2D_set_can_sleep
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_can_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody2D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
set_can_sleep ::
                (RigidBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_can_sleep cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_can_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_can_sleep" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_can_sleep

{-# NOINLINE bindRigidBody2D_set_contact_monitor #-}

-- | If @true@, the body will emit signals when it collides with another RigidBody2D. See also @contacts_reported@.
bindRigidBody2D_set_contact_monitor :: MethodBind
bindRigidBody2D_set_contact_monitor
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_contact_monitor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body will emit signals when it collides with another RigidBody2D. See also @contacts_reported@.
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

instance NodeMethod RigidBody2D "set_contact_monitor" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_contact_monitor

{-# NOINLINE bindRigidBody2D_set_continuous_collision_detection_mode
             #-}

-- | Continuous collision detection mode.
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See @enum CCDMode@ for details.
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
--   			Continuous collision detection tries to predict where a moving body will collide instead of moving it and correcting its movement after collision. Continuous collision detection is slower, but more precise and misses fewer collisions with small, fast-moving objects. Raycasting and shapecasting methods are available. See @enum CCDMode@ for details.
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

instance NodeMethod RigidBody2D
           "set_continuous_collision_detection_mode"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.RigidBody2D.set_continuous_collision_detection_mode

{-# NOINLINE bindRigidBody2D_set_friction #-}

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
bindRigidBody2D_set_friction :: MethodBind
bindRigidBody2D_set_friction
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
set_friction ::
               (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_friction" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_friction

{-# NOINLINE bindRigidBody2D_set_gravity_scale #-}

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__ and/or any additional gravity vector applied by @Area2D@s.
bindRigidBody2D_set_gravity_scale :: MethodBind
bindRigidBody2D_set_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the gravity applied to the body. The body's gravity is calculated from the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__ and/or any additional gravity vector applied by @Area2D@s.
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

instance NodeMethod RigidBody2D "set_gravity_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_gravity_scale

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

instance NodeMethod RigidBody2D "set_inertia" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_inertia

{-# NOINLINE bindRigidBody2D_set_linear_damp #-}

-- | Damps the body's @linear_velocity@. If @-1@, the body will use the __Default Linear Damp__ in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
bindRigidBody2D_set_linear_damp :: MethodBind
bindRigidBody2D_set_linear_damp
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps the body's @linear_velocity@. If @-1@, the body will use the __Default Linear Damp__ in __Project > Project Settings > Physics > 2d__.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
set_linear_damp ::
                  (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_linear_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_linear_damp

{-# NOINLINE bindRigidBody2D_set_linear_velocity #-}

-- | The body's linear velocity in pixels per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
bindRigidBody2D_set_linear_velocity :: MethodBind
bindRigidBody2D_set_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity in pixels per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
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

instance NodeMethod RigidBody2D "set_linear_velocity" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_linear_velocity

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

instance NodeMethod RigidBody2D "set_mass" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody2D.set_mass

{-# NOINLINE bindRigidBody2D_set_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end).
bindRigidBody2D_set_max_contacts_reported :: MethodBind
bindRigidBody2D_set_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end).
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

instance NodeMethod RigidBody2D "set_max_contacts_reported" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_max_contacts_reported

{-# NOINLINE bindRigidBody2D_set_mode #-}

-- | The body's mode. See @enum Mode@ for possible values.
bindRigidBody2D_set_mode :: MethodBind
bindRigidBody2D_set_mode
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's mode. See @enum Mode@ for possible values.
set_mode ::
           (RigidBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RigidBody2D.set_mode

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

instance NodeMethod RigidBody2D "set_physics_material_override"
           '[PhysicsMaterial]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_physics_material_override

{-# NOINLINE bindRigidBody2D_set_sleeping #-}

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
bindRigidBody2D_set_sleeping :: MethodBind
bindRigidBody2D_set_sleeping
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
set_sleeping ::
               (RigidBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sleeping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_sleeping" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_sleeping

{-# NOINLINE bindRigidBody2D_set_use_custom_integrator #-}

-- | If @true@, internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the @method _integrate_forces@ function.
bindRigidBody2D_set_use_custom_integrator :: MethodBind
bindRigidBody2D_set_use_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_use_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, internal force integration is disabled for this body. Aside from collision response, the body will only move as determined by the @method _integrate_forces@ function.
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

instance NodeMethod RigidBody2D "set_use_custom_integrator" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody2D.set_use_custom_integrator

{-# NOINLINE bindRigidBody2D_set_weight #-}

-- | The body's weight based on its mass and the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__.
bindRigidBody2D_set_weight :: MethodBind
bindRigidBody2D_set_weight
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "set_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the __Default Gravity__ value in __Project > Project Settings > Physics > 2d__.
set_weight ::
             (RigidBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_weight cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_set_weight (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "set_weight" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody2D.set_weight

{-# NOINLINE bindRigidBody2D_test_motion #-}

-- | Returns @true@ if a collision would result from moving in the given vector. @margin@ increases the size of the shapes involved in the collision detection, and @result@ is an object of type @Physics2DTestMotionResult@, which contains additional information about the collision (should there be one).
bindRigidBody2D_test_motion :: MethodBind
bindRigidBody2D_test_motion
  = unsafePerformIO $
      withCString "RigidBody2D" $
        \ clsNamePtr ->
          withCString "test_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a collision would result from moving in the given vector. @margin@ increases the size of the shapes involved in the collision detection, and @result@ is an object of type @Physics2DTestMotionResult@, which contains additional information about the collision (should there be one).
test_motion ::
              (RigidBody2D :< cls, Object :< cls) =>
              cls ->
                Vector2 ->
                  Maybe Bool ->
                    Maybe Float -> Maybe Physics2DTestMotionResult -> IO Bool
test_motion cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2,
       maybe (VariantReal (0.08)) toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody2D_test_motion (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody2D "test_motion"
           '[Vector2, Maybe Bool, Maybe Float,
             Maybe Physics2DTestMotionResult]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody2D.test_motion