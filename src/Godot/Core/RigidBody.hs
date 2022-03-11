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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.PhysicsBody()

_MODE_STATIC :: Int
_MODE_STATIC = 1

_MODE_KINEMATIC :: Int
_MODE_KINEMATIC = 3

_MODE_RIGID :: Int
_MODE_RIGID = 0

_MODE_CHARACTER :: Int
_MODE_CHARACTER = 2

-- | Emitted when a collision with another @PhysicsBody@ or @GridMap@ occurs. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @GridMap@s are detected if the @MeshLibrary@ has Collision @Shape@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody@ or @GridMap@.
sig_body_entered :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal RigidBody "body_entered" '[Node]

-- | Emitted when the collision with another @PhysicsBody@ or @GridMap@ ends. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @GridMap@s are detected if the @MeshLibrary@ has Collision @Shape@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody@ or @GridMap@.
sig_body_exited :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal RigidBody "body_exited" '[Node]

-- | Emitted when one of this RigidBody's @Shape@s collides with another @PhysicsBody@ or @GridMap@'s @Shape@s. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @GridMap@s are detected if the @MeshLibrary@ has Collision @Shape@s.
--   				@body_rid@ the @RID@ of the other @PhysicsBody@ or @MeshLibrary@'s @CollisionObject@ used by the @PhysicsServer@.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody@ or @GridMap@.
--   				@body_shape_index@ the index of the @Shape@ of the other @PhysicsBody@ or @GridMap@ used by the @PhysicsServer@. Get the @CollisionShape@ node with @body.shape_owner_get_owner(body_shape_index)@.
--   				@local_shape_index@ the index of the @Shape@ of this RigidBody used by the @PhysicsServer@. Get the @CollisionShape@ node with @self.shape_owner_get_owner(local_shape_index)@.
--   				__Note:__ Bullet physics cannot identify the shape index when using a @ConcavePolygonShape@. Don't use multiple @CollisionShape@s when using a @ConcavePolygonShape@ with Bullet physics if you need shape indices.
sig_body_shape_entered :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal RigidBody "body_shape_entered"
           '[Int, Node, Int, Int]

-- | Emitted when the collision between one of this RigidBody's @Shape@s and another @PhysicsBody@ or @GridMap@'s @Shape@s ends. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions. @GridMap@s are detected if the @MeshLibrary@ has Collision @Shape@s.
--   				@body_rid@ the @RID@ of the other @PhysicsBody@ or @MeshLibrary@'s @CollisionObject@ used by the @PhysicsServer@. @GridMap@s are detected if the Meshes have @Shape@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody@ or @GridMap@.
--   				@body_shape_index@ the index of the @Shape@ of the other @PhysicsBody@ or @GridMap@ used by the @PhysicsServer@. Get the @CollisionShape@ node with @body.shape_owner_get_owner(body_shape_index)@.
--   				@local_shape_index@ the index of the @Shape@ of this RigidBody used by the @PhysicsServer@. Get the @CollisionShape@ node with @self.shape_owner_get_owner(local_shape_index)@.
--   				__Note:__ Bullet physics cannot identify the shape index when using a @ConcavePolygonShape@. Don't use multiple @CollisionShape@s when using a @ConcavePolygonShape@ with Bullet physics if you need shape indices.
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal RigidBody
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal RigidBody "body_shape_exited"
           '[Int, Node, Int, Int]

-- | Emitted when the physics engine changes the body's sleeping state.
--   				__Note:__ Changing the value @sleeping@ will not trigger this signal. It is only emitted if the sleeping state is changed by the physics engine or @emit_signal("sleeping_state_changed")@ is used.
sig_sleeping_state_changed ::
                           Godot.Internal.Dispatch.Signal RigidBody
sig_sleeping_state_changed
  = Godot.Internal.Dispatch.Signal "sleeping_state_changed"

instance NodeSignal RigidBody "sleeping_state_changed" '[]

instance NodeProperty RigidBody "angular_damp" Float 'False where
        nodeProperty
          = (get_angular_damp, wrapDroppingSetter set_angular_damp, Nothing)

instance NodeProperty RigidBody "angular_velocity" Vector3 'False
         where
        nodeProperty
          = (get_angular_velocity, wrapDroppingSetter set_angular_velocity,
             Nothing)

instance NodeProperty RigidBody "axis_lock_angular_x" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_axis_lock,
             wrapIndexedSetter 8 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_angular_y" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_axis_lock,
             wrapIndexedSetter 16 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_angular_z" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 32 get_axis_lock,
             wrapIndexedSetter 32 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_linear_x" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_axis_lock,
             wrapIndexedSetter 1 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_linear_y" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_axis_lock,
             wrapIndexedSetter 2 set_axis_lock, Nothing)

instance NodeProperty RigidBody "axis_lock_linear_z" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_axis_lock,
             wrapIndexedSetter 4 set_axis_lock, Nothing)

instance NodeProperty RigidBody "bounce" Float 'False where
        nodeProperty = (get_bounce, wrapDroppingSetter set_bounce, Nothing)

instance NodeProperty RigidBody "can_sleep" Bool 'False where
        nodeProperty
          = (is_able_to_sleep, wrapDroppingSetter set_can_sleep, Nothing)

instance NodeProperty RigidBody "contact_monitor" Bool 'False where
        nodeProperty
          = (is_contact_monitor_enabled,
             wrapDroppingSetter set_contact_monitor, Nothing)

instance NodeProperty RigidBody "contacts_reported" Int 'False
         where
        nodeProperty
          = (get_max_contacts_reported,
             wrapDroppingSetter set_max_contacts_reported, Nothing)

instance NodeProperty RigidBody "continuous_cd" Bool 'False where
        nodeProperty
          = (is_using_continuous_collision_detection,
             wrapDroppingSetter set_use_continuous_collision_detection, Nothing)

instance NodeProperty RigidBody "custom_integrator" Bool 'False
         where
        nodeProperty
          = (is_using_custom_integrator,
             wrapDroppingSetter set_use_custom_integrator, Nothing)

instance NodeProperty RigidBody "friction" Float 'False where
        nodeProperty
          = (get_friction, wrapDroppingSetter set_friction, Nothing)

instance NodeProperty RigidBody "gravity_scale" Float 'False where
        nodeProperty
          = (get_gravity_scale, wrapDroppingSetter set_gravity_scale,
             Nothing)

instance NodeProperty RigidBody "linear_damp" Float 'False where
        nodeProperty
          = (get_linear_damp, wrapDroppingSetter set_linear_damp, Nothing)

instance NodeProperty RigidBody "linear_velocity" Vector3 'False
         where
        nodeProperty
          = (get_linear_velocity, wrapDroppingSetter set_linear_velocity,
             Nothing)

instance NodeProperty RigidBody "mass" Float 'False where
        nodeProperty = (get_mass, wrapDroppingSetter set_mass, Nothing)

instance NodeProperty RigidBody "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty RigidBody "physics_material_override"
           PhysicsMaterial
           'False
         where
        nodeProperty
          = (get_physics_material_override,
             wrapDroppingSetter set_physics_material_override, Nothing)

instance NodeProperty RigidBody "sleeping" Bool 'False where
        nodeProperty
          = (is_sleeping, wrapDroppingSetter set_sleeping, Nothing)

instance NodeProperty RigidBody "weight" Float 'False where
        nodeProperty = (get_weight, wrapDroppingSetter set_weight, Nothing)

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

instance NodeMethod RigidBody "_body_enter_tree" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._body_enter_tree

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

instance NodeMethod RigidBody "_body_exit_tree" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._body_exit_tree

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

instance NodeMethod RigidBody "_direct_state_changed" '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._direct_state_changed

{-# NOINLINE bindRigidBody__integrate_forces #-}

-- | Called during physics processing, allowing you to read and safely modify the simulation state for the object. By default, it works in addition to the usual physics behavior, but the @custom_integrator@ property allows you to disable the default behavior and do fully custom force integration for a body.
bindRigidBody__integrate_forces :: MethodBind
bindRigidBody__integrate_forces
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "_integrate_forces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called during physics processing, allowing you to read and safely modify the simulation state for the object. By default, it works in addition to the usual physics behavior, but the @custom_integrator@ property allows you to disable the default behavior and do fully custom force integration for a body.
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

instance NodeMethod RigidBody "_integrate_forces"
           '[PhysicsDirectBodyState]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._integrate_forces

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

instance NodeMethod RigidBody "_reload_physics_characteristics" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody._reload_physics_characteristics

{-# NOINLINE bindRigidBody_add_central_force #-}

-- | Adds a constant directional force (i.e. acceleration) without affecting rotation.
--   				This is equivalent to @add_force(force, Vector3(0,0,0))@.
bindRigidBody_add_central_force :: MethodBind
bindRigidBody_add_central_force
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "add_central_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a constant directional force (i.e. acceleration) without affecting rotation.
--   				This is equivalent to @add_force(force, Vector3(0,0,0))@.
add_central_force ::
                    (RigidBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_central_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_add_central_force (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "add_central_force" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.add_central_force

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

instance NodeMethod RigidBody "add_force" '[Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.add_force

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

instance NodeMethod RigidBody "add_torque" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.add_torque

{-# NOINLINE bindRigidBody_apply_central_impulse #-}

-- | Applies a directional impulse without affecting rotation.
--   				This is equivalent to @apply_impulse(Vector3(0,0,0), impulse)@.
bindRigidBody_apply_central_impulse :: MethodBind
bindRigidBody_apply_central_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_central_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a directional impulse without affecting rotation.
--   				This is equivalent to @apply_impulse(Vector3(0,0,0), impulse)@.
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

instance NodeMethod RigidBody "apply_central_impulse" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.apply_central_impulse

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

instance NodeMethod RigidBody "apply_impulse" '[Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.apply_impulse

{-# NOINLINE bindRigidBody_apply_torque_impulse #-}

-- | Applies a torque impulse which will be affected by the body mass and shape. This will rotate the body around the @impulse@ vector passed.
bindRigidBody_apply_torque_impulse :: MethodBind
bindRigidBody_apply_torque_impulse
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "apply_torque_impulse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a torque impulse which will be affected by the body mass and shape. This will rotate the body around the @impulse@ vector passed.
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

instance NodeMethod RigidBody "apply_torque_impulse" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.apply_torque_impulse

{-# NOINLINE bindRigidBody_get_angular_damp #-}

-- | Damps RigidBody's rotational forces.
--   			See @ProjectSettings.physics/3d/default_angular_damp@ for more details about damping.
bindRigidBody_get_angular_damp :: MethodBind
bindRigidBody_get_angular_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps RigidBody's rotational forces.
--   			See @ProjectSettings.physics/3d/default_angular_damp@ for more details about damping.
get_angular_damp ::
                   (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_angular_damp" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody.get_angular_damp

{-# NOINLINE bindRigidBody_get_angular_velocity #-}

-- | The body's rotational velocity in axis-angle format. The magnitude of the vector is the rotation rate in @i@radians@/i@ per second.
bindRigidBody_get_angular_velocity :: MethodBind
bindRigidBody_get_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity in axis-angle format. The magnitude of the vector is the rotation rate in @i@radians@/i@ per second.
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

instance NodeMethod RigidBody "get_angular_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.RigidBody.get_angular_velocity

{-# NOINLINE bindRigidBody_get_axis_lock #-}

-- | Returns @true@ if the specified linear or rotational axis is locked.
bindRigidBody_get_axis_lock :: MethodBind
bindRigidBody_get_axis_lock
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_axis_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified linear or rotational axis is locked.
get_axis_lock ::
                (RigidBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_axis_lock cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_axis_lock (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_axis_lock" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.get_axis_lock

{-# NOINLINE bindRigidBody_get_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
bindRigidBody_get_bounce :: MethodBind
bindRigidBody_get_bounce
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
get_bounce :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_bounce (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_bounce" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_bounce

{-# NOINLINE bindRigidBody_get_colliding_bodies #-}

-- | Returns a list of the bodies colliding with this one. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
bindRigidBody_get_colliding_bodies :: MethodBind
bindRigidBody_get_colliding_bodies
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_colliding_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the bodies colliding with this one. Requires @contact_monitor@ to be set to @true@ and @contacts_reported@ to be set high enough to detect all the collisions.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of collisions is updated once per frame and before the physics step. Consider using signals instead.
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

instance NodeMethod RigidBody "get_colliding_bodies" '[] (IO Array)
         where
        nodeMethod = Godot.Core.RigidBody.get_colliding_bodies

{-# NOINLINE bindRigidBody_get_friction #-}

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
bindRigidBody_get_friction :: MethodBind
bindRigidBody_get_friction
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
get_friction ::
               (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_friction" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_friction

{-# NOINLINE bindRigidBody_get_gravity_scale #-}

-- | This is multiplied by the global 3D gravity setting found in __Project > Project Settings > Physics > 3d__ to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
bindRigidBody_get_gravity_scale :: MethodBind
bindRigidBody_get_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is multiplied by the global 3D gravity setting found in __Project > Project Settings > Physics > 3d__ to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
get_gravity_scale ::
                    (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_gravity_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_gravity_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_gravity_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody.get_gravity_scale

{-# NOINLINE bindRigidBody_get_linear_damp #-}

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
--   			See @ProjectSettings.physics/3d/default_linear_damp@ for more details about damping.
bindRigidBody_get_linear_damp :: MethodBind
bindRigidBody_get_linear_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
--   			See @ProjectSettings.physics/3d/default_linear_damp@ for more details about damping.
get_linear_damp ::
                  (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_linear_damp" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RigidBody.get_linear_damp

{-# NOINLINE bindRigidBody_get_linear_velocity #-}

-- | The body's linear velocity in units per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
bindRigidBody_get_linear_velocity :: MethodBind
bindRigidBody_get_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity in units per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
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

instance NodeMethod RigidBody "get_linear_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.RigidBody.get_linear_velocity

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

instance NodeMethod RigidBody "get_mass" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_mass

{-# NOINLINE bindRigidBody_get_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
bindRigidBody_get_max_contacts_reported :: MethodBind
bindRigidBody_get_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
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

instance NodeMethod RigidBody "get_max_contacts_reported" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RigidBody.get_max_contacts_reported

{-# NOINLINE bindRigidBody_get_mode #-}

-- | The body mode. See @enum Mode@ for possible values.
bindRigidBody_get_mode :: MethodBind
bindRigidBody_get_mode
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body mode. See @enum Mode@ for possible values.
get_mode :: (RigidBody :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.RigidBody.get_mode

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

instance NodeMethod RigidBody "get_physics_material_override" '[]
           (IO PhysicsMaterial)
         where
        nodeMethod = Godot.Core.RigidBody.get_physics_material_override

{-# NOINLINE bindRigidBody_get_weight #-}

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in __Project > Project Settings > Physics > 3d__.
bindRigidBody_get_weight :: MethodBind
bindRigidBody_get_weight
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "get_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in __Project > Project Settings > Physics > 3d__.
get_weight :: (RigidBody :< cls, Object :< cls) => cls -> IO Float
get_weight cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_get_weight (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "get_weight" '[] (IO Float) where
        nodeMethod = Godot.Core.RigidBody.get_weight

{-# NOINLINE bindRigidBody_is_able_to_sleep #-}

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody3D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
bindRigidBody_is_able_to_sleep :: MethodBind
bindRigidBody_is_able_to_sleep
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_able_to_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody3D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
is_able_to_sleep ::
                   (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_able_to_sleep cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_able_to_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "is_able_to_sleep" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.is_able_to_sleep

{-# NOINLINE bindRigidBody_is_contact_monitor_enabled #-}

-- | If @true@, the RigidBody will emit signals when it collides with another RigidBody. See also @contacts_reported@.
bindRigidBody_is_contact_monitor_enabled :: MethodBind
bindRigidBody_is_contact_monitor_enabled
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_contact_monitor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the RigidBody will emit signals when it collides with another RigidBody. See also @contacts_reported@.
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

instance NodeMethod RigidBody "is_contact_monitor_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.is_contact_monitor_enabled

{-# NOINLINE bindRigidBody_is_sleeping #-}

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
bindRigidBody_is_sleeping :: MethodBind
bindRigidBody_is_sleeping
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
is_sleeping :: (RigidBody :< cls, Object :< cls) => cls -> IO Bool
is_sleeping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_is_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "is_sleeping" '[] (IO Bool) where
        nodeMethod = Godot.Core.RigidBody.is_sleeping

{-# NOINLINE bindRigidBody_is_using_continuous_collision_detection
             #-}

-- | If @true@, continuous collision detection is used.
--   			Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small, fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving objects.
bindRigidBody_is_using_continuous_collision_detection :: MethodBind
bindRigidBody_is_using_continuous_collision_detection
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_using_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, continuous collision detection is used.
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

instance NodeMethod RigidBody
           "is_using_continuous_collision_detection"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.RigidBody.is_using_continuous_collision_detection

{-# NOINLINE bindRigidBody_is_using_custom_integrator #-}

-- | If @true@, internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the @method _integrate_forces@ function, if defined.
bindRigidBody_is_using_custom_integrator :: MethodBind
bindRigidBody_is_using_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "is_using_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the @method _integrate_forces@ function, if defined.
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

instance NodeMethod RigidBody "is_using_custom_integrator" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RigidBody.is_using_custom_integrator

{-# NOINLINE bindRigidBody_set_angular_damp #-}

-- | Damps RigidBody's rotational forces.
--   			See @ProjectSettings.physics/3d/default_angular_damp@ for more details about damping.
bindRigidBody_set_angular_damp :: MethodBind
bindRigidBody_set_angular_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Damps RigidBody's rotational forces.
--   			See @ProjectSettings.physics/3d/default_angular_damp@ for more details about damping.
set_angular_damp ::
                   (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_angular_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_angular_damp

{-# NOINLINE bindRigidBody_set_angular_velocity #-}

-- | The body's rotational velocity in axis-angle format. The magnitude of the vector is the rotation rate in @i@radians@/i@ per second.
bindRigidBody_set_angular_velocity :: MethodBind
bindRigidBody_set_angular_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's rotational velocity in axis-angle format. The magnitude of the vector is the rotation rate in @i@radians@/i@ per second.
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

instance NodeMethod RigidBody "set_angular_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_angular_velocity

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

instance NodeMethod RigidBody "set_axis_lock" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_axis_lock

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

instance NodeMethod RigidBody "set_axis_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_axis_velocity

{-# NOINLINE bindRigidBody_set_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
bindRigidBody_set_bounce :: MethodBind
bindRigidBody_set_bounce
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
set_bounce ::
             (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_bounce (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_bounce" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_bounce

{-# NOINLINE bindRigidBody_set_can_sleep #-}

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody3D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
bindRigidBody_set_can_sleep :: MethodBind
bindRigidBody_set_can_sleep
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_can_sleep" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body can enter sleep mode when there is no movement. See @sleeping@.
--   			__Note:__ A RigidBody3D will never enter sleep mode automatically if its @mode@ is @MODE_CHARACTER@. It can still be put to sleep manually by setting its @sleeping@ property to @true@.
set_can_sleep ::
                (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_can_sleep cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_can_sleep (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_can_sleep" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_can_sleep

{-# NOINLINE bindRigidBody_set_contact_monitor #-}

-- | If @true@, the RigidBody will emit signals when it collides with another RigidBody. See also @contacts_reported@.
bindRigidBody_set_contact_monitor :: MethodBind
bindRigidBody_set_contact_monitor
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_contact_monitor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the RigidBody will emit signals when it collides with another RigidBody. See also @contacts_reported@.
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

instance NodeMethod RigidBody "set_contact_monitor" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_contact_monitor

{-# NOINLINE bindRigidBody_set_friction #-}

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
bindRigidBody_set_friction :: MethodBind
bindRigidBody_set_friction
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction, from 0 (frictionless) to 1 (max friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
set_friction ::
               (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_friction" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_friction

{-# NOINLINE bindRigidBody_set_gravity_scale #-}

-- | This is multiplied by the global 3D gravity setting found in __Project > Project Settings > Physics > 3d__ to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
bindRigidBody_set_gravity_scale :: MethodBind
bindRigidBody_set_gravity_scale
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is multiplied by the global 3D gravity setting found in __Project > Project Settings > Physics > 3d__ to produce RigidBody's gravity. For example, a value of 1 will be normal gravity, 2 will apply double gravity, and 0.5 will apply half gravity to this object.
set_gravity_scale ::
                    (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_gravity_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_gravity_scale" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_gravity_scale

{-# NOINLINE bindRigidBody_set_linear_damp #-}

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
--   			See @ProjectSettings.physics/3d/default_linear_damp@ for more details about damping.
bindRigidBody_set_linear_damp :: MethodBind
bindRigidBody_set_linear_damp
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear damp. Cannot be less than -1.0. If this value is different from -1.0, any linear damp derived from the world or areas will be overridden.
--   			See @ProjectSettings.physics/3d/default_linear_damp@ for more details about damping.
set_linear_damp ::
                  (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_linear_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_linear_damp

{-# NOINLINE bindRigidBody_set_linear_velocity #-}

-- | The body's linear velocity in units per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
bindRigidBody_set_linear_velocity :: MethodBind
bindRigidBody_set_linear_velocity
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's linear velocity in units per second. Can be used sporadically, but __don't set this every frame__, because physics may run in another thread and runs at a different granularity. Use @method _integrate_forces@ as your process loop for precise control of the body state.
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

instance NodeMethod RigidBody "set_linear_velocity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_linear_velocity

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

instance NodeMethod RigidBody "set_mass" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_mass

{-# NOINLINE bindRigidBody_set_max_contacts_reported #-}

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
bindRigidBody_set_max_contacts_reported :: MethodBind
bindRigidBody_set_max_contacts_reported
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_max_contacts_reported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of contacts that will be recorded. Requires @contact_monitor@ to be set to @true@.
--   			__Note:__ The number of contacts is different from the number of collisions. Collisions between parallel edges will result in two contacts (one at each end), and collisions between parallel faces will result in four contacts (one at each corner).
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

instance NodeMethod RigidBody "set_max_contacts_reported" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_max_contacts_reported

{-# NOINLINE bindRigidBody_set_mode #-}

-- | The body mode. See @enum Mode@ for possible values.
bindRigidBody_set_mode :: MethodBind
bindRigidBody_set_mode
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body mode. See @enum Mode@ for possible values.
set_mode ::
           (RigidBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_mode

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

instance NodeMethod RigidBody "set_physics_material_override"
           '[PhysicsMaterial]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_physics_material_override

{-# NOINLINE bindRigidBody_set_sleeping #-}

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
bindRigidBody_set_sleeping :: MethodBind
bindRigidBody_set_sleeping
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_sleeping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body will not move and will not calculate forces until woken up by another body through, for example, a collision, or by using the @method apply_impulse@ or @method add_force@ methods.
set_sleeping ::
               (RigidBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sleeping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_sleeping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_sleeping" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_sleeping

{-# NOINLINE bindRigidBody_set_use_continuous_collision_detection
             #-}

-- | If @true@, continuous collision detection is used.
--   			Continuous collision detection tries to predict where a moving body will collide, instead of moving it and correcting its movement if it collided. Continuous collision detection is more precise, and misses fewer impacts by small, fast-moving objects. Not using continuous collision detection is faster to compute, but can miss small, fast-moving objects.
bindRigidBody_set_use_continuous_collision_detection :: MethodBind
bindRigidBody_set_use_continuous_collision_detection
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_use_continuous_collision_detection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, continuous collision detection is used.
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

instance NodeMethod RigidBody
           "set_use_continuous_collision_detection"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.RigidBody.set_use_continuous_collision_detection

{-# NOINLINE bindRigidBody_set_use_custom_integrator #-}

-- | If @true@, internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the @method _integrate_forces@ function, if defined.
bindRigidBody_set_use_custom_integrator :: MethodBind
bindRigidBody_set_use_custom_integrator
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_use_custom_integrator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, internal force integration will be disabled (like gravity or air friction) for this body. Other than collision response, the body will only move as determined by the @method _integrate_forces@ function, if defined.
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

instance NodeMethod RigidBody "set_use_custom_integrator" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RigidBody.set_use_custom_integrator

{-# NOINLINE bindRigidBody_set_weight #-}

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in __Project > Project Settings > Physics > 3d__.
bindRigidBody_set_weight :: MethodBind
bindRigidBody_set_weight
  = unsafePerformIO $
      withCString "RigidBody" $
        \ clsNamePtr ->
          withCString "set_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's weight based on its mass and the global 3D gravity. Global values are set in __Project > Project Settings > Physics > 3d__.
set_weight ::
             (RigidBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_weight cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRigidBody_set_weight (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RigidBody "set_weight" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RigidBody.set_weight