{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Area
       (Godot.Core.Area._SPACE_OVERRIDE_REPLACE,
        Godot.Core.Area._SPACE_OVERRIDE_DISABLED,
        Godot.Core.Area._SPACE_OVERRIDE_COMBINE_REPLACE,
        Godot.Core.Area._SPACE_OVERRIDE_REPLACE_COMBINE,
        Godot.Core.Area._SPACE_OVERRIDE_COMBINE,
        Godot.Core.Area.sig_area_entered, Godot.Core.Area.sig_area_exited,
        Godot.Core.Area.sig_area_shape_entered,
        Godot.Core.Area.sig_area_shape_exited,
        Godot.Core.Area.sig_body_entered, Godot.Core.Area.sig_body_exited,
        Godot.Core.Area.sig_body_shape_entered,
        Godot.Core.Area.sig_body_shape_exited,
        Godot.Core.Area._area_enter_tree, Godot.Core.Area._area_exit_tree,
        Godot.Core.Area._area_inout, Godot.Core.Area._body_enter_tree,
        Godot.Core.Area._body_exit_tree, Godot.Core.Area._body_inout,
        Godot.Core.Area.get_angular_damp, Godot.Core.Area.get_audio_bus,
        Godot.Core.Area.get_collision_layer,
        Godot.Core.Area.get_collision_layer_bit,
        Godot.Core.Area.get_collision_mask,
        Godot.Core.Area.get_collision_mask_bit,
        Godot.Core.Area.get_gravity,
        Godot.Core.Area.get_gravity_distance_scale,
        Godot.Core.Area.get_gravity_vector,
        Godot.Core.Area.get_linear_damp,
        Godot.Core.Area.get_overlapping_areas,
        Godot.Core.Area.get_overlapping_bodies,
        Godot.Core.Area.get_priority, Godot.Core.Area.get_reverb_amount,
        Godot.Core.Area.get_reverb_bus,
        Godot.Core.Area.get_reverb_uniformity,
        Godot.Core.Area.get_space_override_mode,
        Godot.Core.Area.is_gravity_a_point, Godot.Core.Area.is_monitorable,
        Godot.Core.Area.is_monitoring,
        Godot.Core.Area.is_overriding_audio_bus,
        Godot.Core.Area.is_using_reverb_bus, Godot.Core.Area.overlaps_area,
        Godot.Core.Area.overlaps_body, Godot.Core.Area.set_angular_damp,
        Godot.Core.Area.set_audio_bus,
        Godot.Core.Area.set_audio_bus_override,
        Godot.Core.Area.set_collision_layer,
        Godot.Core.Area.set_collision_layer_bit,
        Godot.Core.Area.set_collision_mask,
        Godot.Core.Area.set_collision_mask_bit,
        Godot.Core.Area.set_gravity,
        Godot.Core.Area.set_gravity_distance_scale,
        Godot.Core.Area.set_gravity_is_point,
        Godot.Core.Area.set_gravity_vector,
        Godot.Core.Area.set_linear_damp, Godot.Core.Area.set_monitorable,
        Godot.Core.Area.set_monitoring, Godot.Core.Area.set_priority,
        Godot.Core.Area.set_reverb_amount, Godot.Core.Area.set_reverb_bus,
        Godot.Core.Area.set_reverb_uniformity,
        Godot.Core.Area.set_space_override_mode,
        Godot.Core.Area.set_use_reverb_bus)
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
import Godot.Core.CollisionObject()

_SPACE_OVERRIDE_REPLACE :: Int
_SPACE_OVERRIDE_REPLACE = 3

_SPACE_OVERRIDE_DISABLED :: Int
_SPACE_OVERRIDE_DISABLED = 0

_SPACE_OVERRIDE_COMBINE_REPLACE :: Int
_SPACE_OVERRIDE_COMBINE_REPLACE = 2

_SPACE_OVERRIDE_REPLACE_COMBINE :: Int
_SPACE_OVERRIDE_REPLACE_COMBINE = 4

_SPACE_OVERRIDE_COMBINE :: Int
_SPACE_OVERRIDE_COMBINE = 1

-- | Emitted when another area enters.
sig_area_entered :: Godot.Internal.Dispatch.Signal Area
sig_area_entered = Godot.Internal.Dispatch.Signal "area_entered"

instance NodeSignal Area "area_entered" '[Area]

-- | Emitted when another area exits.
sig_area_exited :: Godot.Internal.Dispatch.Signal Area
sig_area_exited = Godot.Internal.Dispatch.Signal "area_exited"

instance NodeSignal Area "area_exited" '[Area]

-- | Emitted when another area enters, reporting which areas overlapped. @shape_owner_get_owner(shape_find_owner(shape))@ returns the parent object of the owner of the @shape@.
sig_area_shape_entered :: Godot.Internal.Dispatch.Signal Area
sig_area_shape_entered
  = Godot.Internal.Dispatch.Signal "area_shape_entered"

instance NodeSignal Area "area_shape_entered"
           '[Int, Area, Int, Int]

-- | Emitted when another area exits, reporting which areas were overlapping.
sig_area_shape_exited :: Godot.Internal.Dispatch.Signal Area
sig_area_shape_exited
  = Godot.Internal.Dispatch.Signal "area_shape_exited"

instance NodeSignal Area "area_shape_exited" '[Int, Area, Int, Int]

-- | Emitted when a physics body enters.
--   				The @body@ argument can either be a @PhysicsBody@ or a @GridMap@ instance (while GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body).
sig_body_entered :: Godot.Internal.Dispatch.Signal Area
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal Area "body_entered" '[Node]

-- | Emitted when a physics body exits.
--   				The @body@ argument can either be a @PhysicsBody@ or a @GridMap@ instance (while GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body).
sig_body_exited :: Godot.Internal.Dispatch.Signal Area
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal Area "body_exited" '[Node]

-- | Emitted when a physics body enters, reporting which shapes overlapped.
--   				The @body@ argument can either be a @PhysicsBody@ or a @GridMap@ instance (while GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body).
sig_body_shape_entered :: Godot.Internal.Dispatch.Signal Area
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal Area "body_shape_entered"
           '[Int, Node, Int, Int]

-- | Emitted when a physics body exits, reporting which shapes were overlapping.
--   				The @body@ argument can either be a @PhysicsBody@ or a @GridMap@ instance (while GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body).
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal Area
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal Area "body_shape_exited" '[Int, Node, Int, Int]

instance NodeProperty Area "angular_damp" Float 'False where
        nodeProperty
          = (get_angular_damp, wrapDroppingSetter set_angular_damp, Nothing)

instance NodeProperty Area "audio_bus_name" GodotString 'False
         where
        nodeProperty
          = (get_audio_bus, wrapDroppingSetter set_audio_bus, Nothing)

instance NodeProperty Area "audio_bus_override" Bool 'False where
        nodeProperty
          = (is_overriding_audio_bus,
             wrapDroppingSetter set_audio_bus_override, Nothing)

instance NodeProperty Area "collision_layer" Int 'False where
        nodeProperty
          = (get_collision_layer, wrapDroppingSetter set_collision_layer,
             Nothing)

instance NodeProperty Area "collision_mask" Int 'False where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty Area "gravity" Float 'False where
        nodeProperty
          = (get_gravity, wrapDroppingSetter set_gravity, Nothing)

instance NodeProperty Area "gravity_distance_scale" Float 'False
         where
        nodeProperty
          = (get_gravity_distance_scale,
             wrapDroppingSetter set_gravity_distance_scale, Nothing)

instance NodeProperty Area "gravity_point" Bool 'False where
        nodeProperty
          = (is_gravity_a_point, wrapDroppingSetter set_gravity_is_point,
             Nothing)

instance NodeProperty Area "gravity_vec" Vector3 'False where
        nodeProperty
          = (get_gravity_vector, wrapDroppingSetter set_gravity_vector,
             Nothing)

instance NodeProperty Area "linear_damp" Float 'False where
        nodeProperty
          = (get_linear_damp, wrapDroppingSetter set_linear_damp, Nothing)

instance NodeProperty Area "monitorable" Bool 'False where
        nodeProperty
          = (is_monitorable, wrapDroppingSetter set_monitorable, Nothing)

instance NodeProperty Area "monitoring" Bool 'False where
        nodeProperty
          = (is_monitoring, wrapDroppingSetter set_monitoring, Nothing)

instance NodeProperty Area "priority" Float 'False where
        nodeProperty
          = (get_priority, wrapDroppingSetter set_priority, Nothing)

instance NodeProperty Area "reverb_bus_amount" Float 'False where
        nodeProperty
          = (get_reverb_amount, wrapDroppingSetter set_reverb_amount,
             Nothing)

instance NodeProperty Area "reverb_bus_enable" Bool 'False where
        nodeProperty
          = (is_using_reverb_bus, wrapDroppingSetter set_use_reverb_bus,
             Nothing)

instance NodeProperty Area "reverb_bus_name" GodotString 'False
         where
        nodeProperty
          = (get_reverb_bus, wrapDroppingSetter set_reverb_bus, Nothing)

instance NodeProperty Area "reverb_bus_uniformity" Float 'False
         where
        nodeProperty
          = (get_reverb_uniformity, wrapDroppingSetter set_reverb_uniformity,
             Nothing)

instance NodeProperty Area "space_override" Int 'False where
        nodeProperty
          = (get_space_override_mode,
             wrapDroppingSetter set_space_override_mode, Nothing)

{-# NOINLINE bindArea__area_enter_tree #-}

bindArea__area_enter_tree :: MethodBind
bindArea__area_enter_tree
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "_area_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_enter_tree ::
                   (Area :< cls, Object :< cls) => cls -> Int -> IO ()
_area_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea__area_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "_area_enter_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area._area_enter_tree

{-# NOINLINE bindArea__area_exit_tree #-}

bindArea__area_exit_tree :: MethodBind
bindArea__area_exit_tree
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "_area_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_exit_tree ::
                  (Area :< cls, Object :< cls) => cls -> Int -> IO ()
_area_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea__area_exit_tree (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "_area_exit_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area._area_exit_tree

{-# NOINLINE bindArea__area_inout #-}

bindArea__area_inout :: MethodBind
bindArea__area_inout
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "_area_inout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_inout ::
              (Area :< cls, Object :< cls) =>
              cls -> Int -> Rid -> Int -> Int -> Int -> IO ()
_area_inout cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea__area_inout (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "_area_inout" '[Int, Rid, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Area._area_inout

{-# NOINLINE bindArea__body_enter_tree #-}

bindArea__body_enter_tree :: MethodBind
bindArea__body_enter_tree
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "_body_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_enter_tree ::
                   (Area :< cls, Object :< cls) => cls -> Int -> IO ()
_body_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea__body_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "_body_enter_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area._body_enter_tree

{-# NOINLINE bindArea__body_exit_tree #-}

bindArea__body_exit_tree :: MethodBind
bindArea__body_exit_tree
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "_body_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_exit_tree ::
                  (Area :< cls, Object :< cls) => cls -> Int -> IO ()
_body_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea__body_exit_tree (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "_body_exit_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area._body_exit_tree

{-# NOINLINE bindArea__body_inout #-}

bindArea__body_inout :: MethodBind
bindArea__body_inout
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "_body_inout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_inout ::
              (Area :< cls, Object :< cls) =>
              cls -> Int -> Rid -> Int -> Int -> Int -> IO ()
_body_inout cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea__body_inout (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "_body_inout" '[Int, Rid, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Area._body_inout

{-# NOINLINE bindArea_get_angular_damp #-}

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
bindArea_get_angular_damp :: MethodBind
bindArea_get_angular_damp
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
get_angular_damp :: (Area :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_angular_damp" '[] (IO Float) where
        nodeMethod = Godot.Core.Area.get_angular_damp

{-# NOINLINE bindArea_get_audio_bus #-}

-- | The name of the area's audio bus.
bindArea_get_audio_bus :: MethodBind
bindArea_get_audio_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_audio_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the area's audio bus.
get_audio_bus ::
                (Area :< cls, Object :< cls) => cls -> IO GodotString
get_audio_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_audio_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_audio_bus" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Area.get_audio_bus

{-# NOINLINE bindArea_get_collision_layer #-}

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also @collision_mask@. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindArea_get_collision_layer :: MethodBind
bindArea_get_collision_layer
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also @collision_mask@. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_layer ::
                      (Area :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_collision_layer" '[] (IO Int) where
        nodeMethod = Godot.Core.Area.get_collision_layer

{-# NOINLINE bindArea_get_collision_layer_bit #-}

-- | Returns an individual bit on the layer mask.
bindArea_get_collision_layer_bit :: MethodBind
bindArea_get_collision_layer_bit
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the layer mask.
get_collision_layer_bit ::
                          (Area :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_collision_layer_bit" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Area.get_collision_layer_bit

{-# NOINLINE bindArea_get_collision_mask #-}

-- | The physics layers this area scans to determine collision detection. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindArea_get_collision_mask :: MethodBind
bindArea_get_collision_mask
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans to determine collision detection. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_mask :: (Area :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_collision_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.Area.get_collision_mask

{-# NOINLINE bindArea_get_collision_mask_bit #-}

-- | Returns an individual bit on the collision mask.
bindArea_get_collision_mask_bit :: MethodBind
bindArea_get_collision_mask_bit
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the collision mask.
get_collision_mask_bit ::
                         (Area :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_collision_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_collision_mask_bit" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Area.get_collision_mask_bit

{-# NOINLINE bindArea_get_gravity #-}

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
bindArea_get_gravity :: MethodBind
bindArea_get_gravity
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
get_gravity :: (Area :< cls, Object :< cls) => cls -> IO Float
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_gravity (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_gravity" '[] (IO Float) where
        nodeMethod = Godot.Core.Area.get_gravity

{-# NOINLINE bindArea_get_gravity_distance_scale #-}

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
bindArea_get_gravity_distance_scale :: MethodBind
bindArea_get_gravity_distance_scale
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_gravity_distance_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
get_gravity_distance_scale ::
                             (Area :< cls, Object :< cls) => cls -> IO Float
get_gravity_distance_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_gravity_distance_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_gravity_distance_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Area.get_gravity_distance_scale

{-# NOINLINE bindArea_get_gravity_vector #-}

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
bindArea_get_gravity_vector :: MethodBind
bindArea_get_gravity_vector
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_gravity_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
get_gravity_vector ::
                     (Area :< cls, Object :< cls) => cls -> IO Vector3
get_gravity_vector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_gravity_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_gravity_vector" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Area.get_gravity_vector

{-# NOINLINE bindArea_get_linear_damp #-}

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
bindArea_get_linear_damp :: MethodBind
bindArea_get_linear_damp
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
get_linear_damp :: (Area :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_linear_damp (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_linear_damp" '[] (IO Float) where
        nodeMethod = Godot.Core.Area.get_linear_damp

{-# NOINLINE bindArea_get_overlapping_areas #-}

-- | Returns a list of intersecting @Area@s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
bindArea_get_overlapping_areas :: MethodBind
bindArea_get_overlapping_areas
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_overlapping_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of intersecting @Area@s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
get_overlapping_areas ::
                        (Area :< cls, Object :< cls) => cls -> IO Array
get_overlapping_areas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_overlapping_areas (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_overlapping_areas" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Area.get_overlapping_areas

{-# NOINLINE bindArea_get_overlapping_bodies #-}

-- | Returns a list of intersecting @PhysicsBody@s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
bindArea_get_overlapping_bodies :: MethodBind
bindArea_get_overlapping_bodies
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_overlapping_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of intersecting @PhysicsBody@s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
get_overlapping_bodies ::
                         (Area :< cls, Object :< cls) => cls -> IO Array
get_overlapping_bodies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_overlapping_bodies (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_overlapping_bodies" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Area.get_overlapping_bodies

{-# NOINLINE bindArea_get_priority #-}

-- | The area's priority. Higher priority areas are processed first.
bindArea_get_priority :: MethodBind
bindArea_get_priority
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's priority. Higher priority areas are processed first.
get_priority :: (Area :< cls, Object :< cls) => cls -> IO Float
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_priority (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_priority" '[] (IO Float) where
        nodeMethod = Godot.Core.Area.get_priority

{-# NOINLINE bindArea_get_reverb_amount #-}

-- | The degree to which this area applies reverb to its associated audio. Ranges from @0@ to @1@ with @0.1@ precision.
bindArea_get_reverb_amount :: MethodBind
bindArea_get_reverb_amount
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_reverb_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which this area applies reverb to its associated audio. Ranges from @0@ to @1@ with @0.1@ precision.
get_reverb_amount ::
                    (Area :< cls, Object :< cls) => cls -> IO Float
get_reverb_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_reverb_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_reverb_amount" '[] (IO Float) where
        nodeMethod = Godot.Core.Area.get_reverb_amount

{-# NOINLINE bindArea_get_reverb_bus #-}

-- | The reverb bus name to use for this area's associated audio.
bindArea_get_reverb_bus :: MethodBind
bindArea_get_reverb_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_reverb_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The reverb bus name to use for this area's associated audio.
get_reverb_bus ::
                 (Area :< cls, Object :< cls) => cls -> IO GodotString
get_reverb_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_reverb_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_reverb_bus" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.Area.get_reverb_bus

{-# NOINLINE bindArea_get_reverb_uniformity #-}

-- | The degree to which this area's reverb is a uniform effect. Ranges from @0@ to @1@ with @0.1@ precision.
bindArea_get_reverb_uniformity :: MethodBind
bindArea_get_reverb_uniformity
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_reverb_uniformity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which this area's reverb is a uniform effect. Ranges from @0@ to @1@ with @0.1@ precision.
get_reverb_uniformity ::
                        (Area :< cls, Object :< cls) => cls -> IO Float
get_reverb_uniformity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_reverb_uniformity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_reverb_uniformity" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Area.get_reverb_uniformity

{-# NOINLINE bindArea_get_space_override_mode #-}

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
bindArea_get_space_override_mode :: MethodBind
bindArea_get_space_override_mode
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "get_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
get_space_override_mode ::
                          (Area :< cls, Object :< cls) => cls -> IO Int
get_space_override_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_get_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "get_space_override_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Area.get_space_override_mode

{-# NOINLINE bindArea_is_gravity_a_point #-}

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
bindArea_is_gravity_a_point :: MethodBind
bindArea_is_gravity_a_point
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "is_gravity_a_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
is_gravity_a_point ::
                     (Area :< cls, Object :< cls) => cls -> IO Bool
is_gravity_a_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_is_gravity_a_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "is_gravity_a_point" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area.is_gravity_a_point

{-# NOINLINE bindArea_is_monitorable #-}

-- | If @true@, other monitoring areas can detect this area.
bindArea_is_monitorable :: MethodBind
bindArea_is_monitorable
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "is_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, other monitoring areas can detect this area.
is_monitorable :: (Area :< cls, Object :< cls) => cls -> IO Bool
is_monitorable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_is_monitorable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "is_monitorable" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area.is_monitorable

{-# NOINLINE bindArea_is_monitoring #-}

-- | If @true@, the area detects bodies or areas entering and exiting it.
bindArea_is_monitoring :: MethodBind
bindArea_is_monitoring
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "is_monitoring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area detects bodies or areas entering and exiting it.
is_monitoring :: (Area :< cls, Object :< cls) => cls -> IO Bool
is_monitoring cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_is_monitoring (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "is_monitoring" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area.is_monitoring

{-# NOINLINE bindArea_is_overriding_audio_bus #-}

-- | If @true@, the area's audio bus overrides the default audio bus.
bindArea_is_overriding_audio_bus :: MethodBind
bindArea_is_overriding_audio_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "is_overriding_audio_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area's audio bus overrides the default audio bus.
is_overriding_audio_bus ::
                          (Area :< cls, Object :< cls) => cls -> IO Bool
is_overriding_audio_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_is_overriding_audio_bus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "is_overriding_audio_bus" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Area.is_overriding_audio_bus

{-# NOINLINE bindArea_is_using_reverb_bus #-}

-- | If @true@, the area applies reverb to its associated audio.
bindArea_is_using_reverb_bus :: MethodBind
bindArea_is_using_reverb_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "is_using_reverb_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area applies reverb to its associated audio.
is_using_reverb_bus ::
                      (Area :< cls, Object :< cls) => cls -> IO Bool
is_using_reverb_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_is_using_reverb_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "is_using_reverb_bus" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area.is_using_reverb_bus

{-# NOINLINE bindArea_overlaps_area #-}

-- | If @true@, the given area overlaps the Area.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
bindArea_overlaps_area :: MethodBind
bindArea_overlaps_area
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "overlaps_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the given area overlaps the Area.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
overlaps_area ::
                (Area :< cls, Object :< cls) => cls -> Node -> IO Bool
overlaps_area cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_overlaps_area (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "overlaps_area" '[Node] (IO Bool) where
        nodeMethod = Godot.Core.Area.overlaps_area

{-# NOINLINE bindArea_overlaps_body #-}

-- | If @true@, the given physics body overlaps the Area.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
--   				The @body@ argument can either be a @PhysicsBody@ or a @GridMap@ instance (while GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body).
bindArea_overlaps_body :: MethodBind
bindArea_overlaps_body
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "overlaps_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the given physics body overlaps the Area.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
--   				The @body@ argument can either be a @PhysicsBody@ or a @GridMap@ instance (while GridMaps are not physics body themselves, they register their tiles with collision shapes as a virtual physics body).
overlaps_body ::
                (Area :< cls, Object :< cls) => cls -> Node -> IO Bool
overlaps_body cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_overlaps_body (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "overlaps_body" '[Node] (IO Bool) where
        nodeMethod = Godot.Core.Area.overlaps_body

{-# NOINLINE bindArea_set_angular_damp #-}

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
bindArea_set_angular_damp :: MethodBind
bindArea_set_angular_damp
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
set_angular_damp ::
                   (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_angular_damp" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area.set_angular_damp

{-# NOINLINE bindArea_set_audio_bus #-}

-- | The name of the area's audio bus.
bindArea_set_audio_bus :: MethodBind
bindArea_set_audio_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_audio_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the area's audio bus.
set_audio_bus ::
                (Area :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_audio_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_audio_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_audio_bus" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_audio_bus

{-# NOINLINE bindArea_set_audio_bus_override #-}

-- | If @true@, the area's audio bus overrides the default audio bus.
bindArea_set_audio_bus_override :: MethodBind
bindArea_set_audio_bus_override
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_audio_bus_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area's audio bus overrides the default audio bus.
set_audio_bus_override ::
                         (Area :< cls, Object :< cls) => cls -> Bool -> IO ()
set_audio_bus_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_audio_bus_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_audio_bus_override" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_audio_bus_override

{-# NOINLINE bindArea_set_collision_layer #-}

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also @collision_mask@. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindArea_set_collision_layer :: MethodBind
bindArea_set_collision_layer
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also @collision_mask@. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_layer ::
                      (Area :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_collision_layer" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area.set_collision_layer

{-# NOINLINE bindArea_set_collision_layer_bit #-}

-- | Set/clear individual bits on the layer mask. This simplifies editing this @Area@'s layers.
bindArea_set_collision_layer_bit :: MethodBind
bindArea_set_collision_layer_bit
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set/clear individual bits on the layer mask. This simplifies editing this @Area@'s layers.
set_collision_layer_bit ::
                          (Area :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_collision_layer_bit" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Area.set_collision_layer_bit

{-# NOINLINE bindArea_set_collision_mask #-}

-- | The physics layers this area scans to determine collision detection. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindArea_set_collision_mask :: MethodBind
bindArea_set_collision_mask
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans to determine collision detection. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_mask ::
                     (Area :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_collision_mask" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area.set_collision_mask

{-# NOINLINE bindArea_set_collision_mask_bit #-}

-- | Set/clear individual bits on the collision mask. This simplifies editing which @Area@ layers this @Area@ scans.
bindArea_set_collision_mask_bit :: MethodBind
bindArea_set_collision_mask_bit
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set/clear individual bits on the collision mask. This simplifies editing which @Area@ layers this @Area@ scans.
set_collision_mask_bit ::
                         (Area :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_collision_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_collision_mask_bit" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Area.set_collision_mask_bit

{-# NOINLINE bindArea_set_gravity #-}

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
bindArea_set_gravity :: MethodBind
bindArea_set_gravity
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
set_gravity ::
              (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_gravity (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_gravity" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area.set_gravity

{-# NOINLINE bindArea_set_gravity_distance_scale #-}

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
bindArea_set_gravity_distance_scale :: MethodBind
bindArea_set_gravity_distance_scale
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_gravity_distance_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
set_gravity_distance_scale ::
                             (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_distance_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_gravity_distance_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_gravity_distance_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Area.set_gravity_distance_scale

{-# NOINLINE bindArea_set_gravity_is_point #-}

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
bindArea_set_gravity_is_point :: MethodBind
bindArea_set_gravity_is_point
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_gravity_is_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
set_gravity_is_point ::
                       (Area :< cls, Object :< cls) => cls -> Bool -> IO ()
set_gravity_is_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_gravity_is_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_gravity_is_point" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_gravity_is_point

{-# NOINLINE bindArea_set_gravity_vector #-}

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
bindArea_set_gravity_vector :: MethodBind
bindArea_set_gravity_vector
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_gravity_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
set_gravity_vector ::
                     (Area :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_gravity_vector cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_gravity_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_gravity_vector" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_gravity_vector

{-# NOINLINE bindArea_set_linear_damp #-}

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
bindArea_set_linear_damp :: MethodBind
bindArea_set_linear_damp
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from @0@ (no damping) to @1@ (full damping).
set_linear_damp ::
                  (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_linear_damp (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_linear_damp" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area.set_linear_damp

{-# NOINLINE bindArea_set_monitorable #-}

-- | If @true@, other monitoring areas can detect this area.
bindArea_set_monitorable :: MethodBind
bindArea_set_monitorable
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, other monitoring areas can detect this area.
set_monitorable ::
                  (Area :< cls, Object :< cls) => cls -> Bool -> IO ()
set_monitorable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_monitorable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_monitorable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Area.set_monitorable

{-# NOINLINE bindArea_set_monitoring #-}

-- | If @true@, the area detects bodies or areas entering and exiting it.
bindArea_set_monitoring :: MethodBind
bindArea_set_monitoring
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_monitoring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area detects bodies or areas entering and exiting it.
set_monitoring ::
                 (Area :< cls, Object :< cls) => cls -> Bool -> IO ()
set_monitoring cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_monitoring (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_monitoring" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Area.set_monitoring

{-# NOINLINE bindArea_set_priority #-}

-- | The area's priority. Higher priority areas are processed first.
bindArea_set_priority :: MethodBind
bindArea_set_priority
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's priority. Higher priority areas are processed first.
set_priority ::
               (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_priority (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_priority" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area.set_priority

{-# NOINLINE bindArea_set_reverb_amount #-}

-- | The degree to which this area applies reverb to its associated audio. Ranges from @0@ to @1@ with @0.1@ precision.
bindArea_set_reverb_amount :: MethodBind
bindArea_set_reverb_amount
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_reverb_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which this area applies reverb to its associated audio. Ranges from @0@ to @1@ with @0.1@ precision.
set_reverb_amount ::
                    (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_reverb_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_reverb_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_reverb_amount" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area.set_reverb_amount

{-# NOINLINE bindArea_set_reverb_bus #-}

-- | The reverb bus name to use for this area's associated audio.
bindArea_set_reverb_bus :: MethodBind
bindArea_set_reverb_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_reverb_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The reverb bus name to use for this area's associated audio.
set_reverb_bus ::
                 (Area :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_reverb_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_reverb_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_reverb_bus" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_reverb_bus

{-# NOINLINE bindArea_set_reverb_uniformity #-}

-- | The degree to which this area's reverb is a uniform effect. Ranges from @0@ to @1@ with @0.1@ precision.
bindArea_set_reverb_uniformity :: MethodBind
bindArea_set_reverb_uniformity
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_reverb_uniformity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which this area's reverb is a uniform effect. Ranges from @0@ to @1@ with @0.1@ precision.
set_reverb_uniformity ::
                        (Area :< cls, Object :< cls) => cls -> Float -> IO ()
set_reverb_uniformity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_reverb_uniformity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_reverb_uniformity" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_reverb_uniformity

{-# NOINLINE bindArea_set_space_override_mode #-}

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
bindArea_set_space_override_mode :: MethodBind
bindArea_set_space_override_mode
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
set_space_override_mode ::
                          (Area :< cls, Object :< cls) => cls -> Int -> IO ()
set_space_override_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_space_override_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Area.set_space_override_mode

{-# NOINLINE bindArea_set_use_reverb_bus #-}

-- | If @true@, the area applies reverb to its associated audio.
bindArea_set_use_reverb_bus :: MethodBind
bindArea_set_use_reverb_bus
  = unsafePerformIO $
      withCString "Area" $
        \ clsNamePtr ->
          withCString "set_use_reverb_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area applies reverb to its associated audio.
set_use_reverb_bus ::
                     (Area :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_reverb_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea_set_use_reverb_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area "set_use_reverb_bus" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Area.set_use_reverb_bus