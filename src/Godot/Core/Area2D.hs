{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Area2D
       (Godot.Core.Area2D._SPACE_OVERRIDE_REPLACE,
        Godot.Core.Area2D._SPACE_OVERRIDE_DISABLED,
        Godot.Core.Area2D._SPACE_OVERRIDE_COMBINE_REPLACE,
        Godot.Core.Area2D._SPACE_OVERRIDE_REPLACE_COMBINE,
        Godot.Core.Area2D._SPACE_OVERRIDE_COMBINE,
        Godot.Core.Area2D.sig_area_entered,
        Godot.Core.Area2D.sig_area_exited,
        Godot.Core.Area2D.sig_area_shape_entered,
        Godot.Core.Area2D.sig_area_shape_exited,
        Godot.Core.Area2D.sig_body_entered,
        Godot.Core.Area2D.sig_body_exited,
        Godot.Core.Area2D.sig_body_shape_entered,
        Godot.Core.Area2D.sig_body_shape_exited,
        Godot.Core.Area2D._area_enter_tree,
        Godot.Core.Area2D._area_exit_tree, Godot.Core.Area2D._area_inout,
        Godot.Core.Area2D._body_enter_tree,
        Godot.Core.Area2D._body_exit_tree, Godot.Core.Area2D._body_inout,
        Godot.Core.Area2D.get_angular_damp,
        Godot.Core.Area2D.get_audio_bus_name,
        Godot.Core.Area2D.get_collision_layer,
        Godot.Core.Area2D.get_collision_layer_bit,
        Godot.Core.Area2D.get_collision_mask,
        Godot.Core.Area2D.get_collision_mask_bit,
        Godot.Core.Area2D.get_gravity,
        Godot.Core.Area2D.get_gravity_distance_scale,
        Godot.Core.Area2D.get_gravity_vector,
        Godot.Core.Area2D.get_linear_damp,
        Godot.Core.Area2D.get_overlapping_areas,
        Godot.Core.Area2D.get_overlapping_bodies,
        Godot.Core.Area2D.get_priority,
        Godot.Core.Area2D.get_space_override_mode,
        Godot.Core.Area2D.is_gravity_a_point,
        Godot.Core.Area2D.is_monitorable, Godot.Core.Area2D.is_monitoring,
        Godot.Core.Area2D.is_overriding_audio_bus,
        Godot.Core.Area2D.overlaps_area, Godot.Core.Area2D.overlaps_body,
        Godot.Core.Area2D.set_angular_damp,
        Godot.Core.Area2D.set_audio_bus_name,
        Godot.Core.Area2D.set_audio_bus_override,
        Godot.Core.Area2D.set_collision_layer,
        Godot.Core.Area2D.set_collision_layer_bit,
        Godot.Core.Area2D.set_collision_mask,
        Godot.Core.Area2D.set_collision_mask_bit,
        Godot.Core.Area2D.set_gravity,
        Godot.Core.Area2D.set_gravity_distance_scale,
        Godot.Core.Area2D.set_gravity_is_point,
        Godot.Core.Area2D.set_gravity_vector,
        Godot.Core.Area2D.set_linear_damp,
        Godot.Core.Area2D.set_monitorable,
        Godot.Core.Area2D.set_monitoring, Godot.Core.Area2D.set_priority,
        Godot.Core.Area2D.set_space_override_mode)
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
import Godot.Core.CollisionObject2D()

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

-- | Emitted when another Area2D enters this Area2D. Requires @monitoring@ to be set to @true@.
--   				@area@ the other Area2D.
sig_area_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_area_entered = Godot.Internal.Dispatch.Signal "area_entered"

instance NodeSignal Area2D "area_entered" '[Area2D]

-- | Emitted when another Area2D exits this Area2D. Requires @monitoring@ to be set to @true@.
--   				@area@ the other Area2D.
sig_area_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_area_exited = Godot.Internal.Dispatch.Signal "area_exited"

instance NodeSignal Area2D "area_exited" '[Area2D]

-- | Emitted when one of another Area2D's @Shape2D@s enters one of this Area2D's @Shape2D@s. Requires @monitoring@ to be set to @true@.
--   				@area_rid@ the @RID@ of the other Area2D's @CollisionObject2D@ used by the @Physics2DServer@.
--   				@area@ the other Area2D.
--   				@area_shape_index@ the index of the @Shape2D@ of the other Area2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @area.shape_owner_get_owner(area_shape_index)@.
--   				@local_shape_index@ the index of the @Shape2D@ of this Area2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @self.shape_owner_get_owner(local_shape_index)@.
sig_area_shape_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_area_shape_entered
  = Godot.Internal.Dispatch.Signal "area_shape_entered"

instance NodeSignal Area2D "area_shape_entered"
           '[Int, Area2D, Int, Int]

-- | Emitted when one of another Area2D's @Shape2D@s exits one of this Area2D's @Shape2D@s. Requires @monitoring@ to be set to @true@.
--   				@area_rid@ the @RID@ of the other Area2D's @CollisionObject2D@ used by the @Physics2DServer@.
--   				@area@ the other Area2D.
--   				@area_shape_index@ the index of the @Shape2D@ of the other Area2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @area.shape_owner_get_owner(area_shape_index)@.
--   				@local_shape_index@ the index of the @Shape2D@ of this Area2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @self.shape_owner_get_owner(local_shape_index)@.
sig_area_shape_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_area_shape_exited
  = Godot.Internal.Dispatch.Signal "area_shape_exited"

instance NodeSignal Area2D "area_shape_exited"
           '[Int, Area2D, Int, Int]

-- | Emitted when a @PhysicsBody2D@ or @TileMap@ enters this Area2D. Requires @monitoring@ to be set to @true@. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody2D@ or @TileMap@.
sig_body_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

instance NodeSignal Area2D "body_entered" '[Node]

-- | Emitted when a @PhysicsBody2D@ or @TileMap@ exits this Area2D. Requires @monitoring@ to be set to @true@. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body@ the @Node@, if it exists in the tree, of the other @PhysicsBody2D@ or @TileMap@.
sig_body_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

instance NodeSignal Area2D "body_exited" '[Node]

-- | Emitted when one of a @PhysicsBody2D@ or @TileMap@'s @Shape2D@s enters one of this Area2D's @Shape2D@s. Requires @monitoring@ to be set to @true@. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body_rid@ the @RID@ of the @PhysicsBody2D@ or @TileSet@'s @CollisionObject2D@ used by the @Physics2DServer@.
--   				@body@ the @Node@, if it exists in the tree, of the @PhysicsBody2D@ or @TileMap@.
--   				@body_shape_index@ the index of the @Shape2D@ of the @PhysicsBody2D@ or @TileMap@ used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @body.shape_owner_get_owner(body_shape_index)@.
--   				@local_shape_index@ the index of the @Shape2D@ of this Area2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @self.shape_owner_get_owner(local_shape_index)@.
sig_body_shape_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

instance NodeSignal Area2D "body_shape_entered"
           '[Int, Node, Int, Int]

-- | Emitted when one of a @PhysicsBody2D@ or @TileMap@'s @Shape2D@s exits one of this Area2D's @Shape2D@s. Requires @monitoring@ to be set to @true@. @TileMap@s are detected if the @TileSet@ has Collision @Shape2D@s.
--   				@body_rid@ the @RID@ of the @PhysicsBody2D@ or @TileSet@'s @CollisionObject2D@ used by the @Physics2DServer@.
--   				@body@ the @Node@, if it exists in the tree, of the @PhysicsBody2D@ or @TileMap@.
--   				@body_shape_index@ the index of the @Shape2D@ of the @PhysicsBody2D@ or @TileMap@ used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @body.shape_owner_get_owner(body_shape_index)@.
--   				@local_shape_index@ the index of the @Shape2D@ of this Area2D used by the @Physics2DServer@. Get the @CollisionShape2D@ node with @self.shape_owner_get_owner(local_shape_index)@.
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

instance NodeSignal Area2D "body_shape_exited"
           '[Int, Node, Int, Int]

instance NodeProperty Area2D "angular_damp" Float 'False where
        nodeProperty
          = (get_angular_damp, wrapDroppingSetter set_angular_damp, Nothing)

instance NodeProperty Area2D "audio_bus_name" GodotString 'False
         where
        nodeProperty
          = (get_audio_bus_name, wrapDroppingSetter set_audio_bus_name,
             Nothing)

instance NodeProperty Area2D "audio_bus_override" Bool 'False where
        nodeProperty
          = (is_overriding_audio_bus,
             wrapDroppingSetter set_audio_bus_override, Nothing)

instance NodeProperty Area2D "collision_layer" Int 'False where
        nodeProperty
          = (get_collision_layer, wrapDroppingSetter set_collision_layer,
             Nothing)

instance NodeProperty Area2D "collision_mask" Int 'False where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty Area2D "gravity" Float 'False where
        nodeProperty
          = (get_gravity, wrapDroppingSetter set_gravity, Nothing)

instance NodeProperty Area2D "gravity_distance_scale" Float 'False
         where
        nodeProperty
          = (get_gravity_distance_scale,
             wrapDroppingSetter set_gravity_distance_scale, Nothing)

instance NodeProperty Area2D "gravity_point" Bool 'False where
        nodeProperty
          = (is_gravity_a_point, wrapDroppingSetter set_gravity_is_point,
             Nothing)

instance NodeProperty Area2D "gravity_vec" Vector2 'False where
        nodeProperty
          = (get_gravity_vector, wrapDroppingSetter set_gravity_vector,
             Nothing)

instance NodeProperty Area2D "linear_damp" Float 'False where
        nodeProperty
          = (get_linear_damp, wrapDroppingSetter set_linear_damp, Nothing)

instance NodeProperty Area2D "monitorable" Bool 'False where
        nodeProperty
          = (is_monitorable, wrapDroppingSetter set_monitorable, Nothing)

instance NodeProperty Area2D "monitoring" Bool 'False where
        nodeProperty
          = (is_monitoring, wrapDroppingSetter set_monitoring, Nothing)

instance NodeProperty Area2D "priority" Float 'False where
        nodeProperty
          = (get_priority, wrapDroppingSetter set_priority, Nothing)

instance NodeProperty Area2D "space_override" Int 'False where
        nodeProperty
          = (get_space_override_mode,
             wrapDroppingSetter set_space_override_mode, Nothing)

{-# NOINLINE bindArea2D__area_enter_tree #-}

bindArea2D__area_enter_tree :: MethodBind
bindArea2D__area_enter_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_area_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_enter_tree ::
                   (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_area_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__area_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "_area_enter_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area2D._area_enter_tree

{-# NOINLINE bindArea2D__area_exit_tree #-}

bindArea2D__area_exit_tree :: MethodBind
bindArea2D__area_exit_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_area_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_exit_tree ::
                  (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_area_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__area_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "_area_exit_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area2D._area_exit_tree

{-# NOINLINE bindArea2D__area_inout #-}

bindArea2D__area_inout :: MethodBind
bindArea2D__area_inout
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_area_inout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_inout ::
              (Area2D :< cls, Object :< cls) =>
              cls -> Int -> Rid -> Int -> Int -> Int -> IO ()
_area_inout cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__area_inout (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "_area_inout" '[Int, Rid, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Area2D._area_inout

{-# NOINLINE bindArea2D__body_enter_tree #-}

bindArea2D__body_enter_tree :: MethodBind
bindArea2D__body_enter_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_body_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_enter_tree ::
                   (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_body_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__body_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "_body_enter_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area2D._body_enter_tree

{-# NOINLINE bindArea2D__body_exit_tree #-}

bindArea2D__body_exit_tree :: MethodBind
bindArea2D__body_exit_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_body_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_exit_tree ::
                  (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_body_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__body_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "_body_exit_tree" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Area2D._body_exit_tree

{-# NOINLINE bindArea2D__body_inout #-}

bindArea2D__body_inout :: MethodBind
bindArea2D__body_inout
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_body_inout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_inout ::
              (Area2D :< cls, Object :< cls) =>
              cls -> Int -> Rid -> Int -> Int -> Int -> IO ()
_body_inout cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__body_inout (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "_body_inout" '[Int, Rid, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Area2D._body_inout

{-# NOINLINE bindArea2D_get_angular_damp #-}

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
bindArea2D_get_angular_damp :: MethodBind
bindArea2D_get_angular_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
get_angular_damp ::
                   (Area2D :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_angular_damp" '[] (IO Float) where
        nodeMethod = Godot.Core.Area2D.get_angular_damp

{-# NOINLINE bindArea2D_get_audio_bus_name #-}

-- | The name of the area's audio bus.
bindArea2D_get_audio_bus_name :: MethodBind
bindArea2D_get_audio_bus_name
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_audio_bus_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the area's audio bus.
get_audio_bus_name ::
                     (Area2D :< cls, Object :< cls) => cls -> IO GodotString
get_audio_bus_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_audio_bus_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_audio_bus_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Area2D.get_audio_bus_name

{-# NOINLINE bindArea2D_get_collision_layer #-}

bindArea2D_get_collision_layer :: MethodBind
bindArea2D_get_collision_layer
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_layer ::
                      (Area2D :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_collision_layer" '[] (IO Int) where
        nodeMethod = Godot.Core.Area2D.get_collision_layer

{-# NOINLINE bindArea2D_get_collision_layer_bit #-}

bindArea2D_get_collision_layer_bit :: MethodBind
bindArea2D_get_collision_layer_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_layer_bit ::
                          (Area2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_collision_layer_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Area2D.get_collision_layer_bit

{-# NOINLINE bindArea2D_get_collision_mask #-}

bindArea2D_get_collision_mask :: MethodBind
bindArea2D_get_collision_mask
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask ::
                     (Area2D :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_collision_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.Area2D.get_collision_mask

{-# NOINLINE bindArea2D_get_collision_mask_bit #-}

bindArea2D_get_collision_mask_bit :: MethodBind
bindArea2D_get_collision_mask_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask_bit ::
                         (Area2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_collision_mask_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Area2D.get_collision_mask_bit

{-# NOINLINE bindArea2D_get_gravity #-}

-- | The area's gravity intensity (in pixels per second squared). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
bindArea2D_get_gravity :: MethodBind
bindArea2D_get_gravity
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity intensity (in pixels per second squared). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
get_gravity :: (Area2D :< cls, Object :< cls) => cls -> IO Float
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_gravity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_gravity" '[] (IO Float) where
        nodeMethod = Godot.Core.Area2D.get_gravity

{-# NOINLINE bindArea2D_get_gravity_distance_scale #-}

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
bindArea2D_get_gravity_distance_scale :: MethodBind
bindArea2D_get_gravity_distance_scale
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_gravity_distance_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
get_gravity_distance_scale ::
                             (Area2D :< cls, Object :< cls) => cls -> IO Float
get_gravity_distance_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_gravity_distance_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_gravity_distance_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Area2D.get_gravity_distance_scale

{-# NOINLINE bindArea2D_get_gravity_vector #-}

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
bindArea2D_get_gravity_vector :: MethodBind
bindArea2D_get_gravity_vector
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_gravity_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
get_gravity_vector ::
                     (Area2D :< cls, Object :< cls) => cls -> IO Vector2
get_gravity_vector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_gravity_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_gravity_vector" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Area2D.get_gravity_vector

{-# NOINLINE bindArea2D_get_linear_damp #-}

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
bindArea2D_get_linear_damp :: MethodBind
bindArea2D_get_linear_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
get_linear_damp ::
                  (Area2D :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_linear_damp" '[] (IO Float) where
        nodeMethod = Godot.Core.Area2D.get_linear_damp

{-# NOINLINE bindArea2D_get_overlapping_areas #-}

-- | Returns a list of intersecting @Area2D@s. The overlapping area's @CollisionObject2D.collision_layer@ must be part of this area's @CollisionObject2D.collision_mask@ in order to be detected.
--   				For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
bindArea2D_get_overlapping_areas :: MethodBind
bindArea2D_get_overlapping_areas
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_overlapping_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of intersecting @Area2D@s. The overlapping area's @CollisionObject2D.collision_layer@ must be part of this area's @CollisionObject2D.collision_mask@ in order to be detected.
--   				For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
get_overlapping_areas ::
                        (Area2D :< cls, Object :< cls) => cls -> IO Array
get_overlapping_areas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_overlapping_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_overlapping_areas" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Area2D.get_overlapping_areas

{-# NOINLINE bindArea2D_get_overlapping_bodies #-}

-- | Returns a list of intersecting @PhysicsBody2D@s. The overlapping body's @CollisionObject2D.collision_layer@ must be part of this area's @CollisionObject2D.collision_mask@ in order to be detected.
--   				For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
bindArea2D_get_overlapping_bodies :: MethodBind
bindArea2D_get_overlapping_bodies
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_overlapping_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of intersecting @PhysicsBody2D@s. The overlapping body's @CollisionObject2D.collision_layer@ must be part of this area's @CollisionObject2D.collision_mask@ in order to be detected.
--   				For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
get_overlapping_bodies ::
                         (Area2D :< cls, Object :< cls) => cls -> IO Array
get_overlapping_bodies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_overlapping_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_overlapping_bodies" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Area2D.get_overlapping_bodies

{-# NOINLINE bindArea2D_get_priority #-}

-- | The area's priority. Higher priority areas are processed first.
bindArea2D_get_priority :: MethodBind
bindArea2D_get_priority
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's priority. Higher priority areas are processed first.
get_priority :: (Area2D :< cls, Object :< cls) => cls -> IO Float
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_priority (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_priority" '[] (IO Float) where
        nodeMethod = Godot.Core.Area2D.get_priority

{-# NOINLINE bindArea2D_get_space_override_mode #-}

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
bindArea2D_get_space_override_mode :: MethodBind
bindArea2D_get_space_override_mode
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
get_space_override_mode ::
                          (Area2D :< cls, Object :< cls) => cls -> IO Int
get_space_override_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "get_space_override_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Area2D.get_space_override_mode

{-# NOINLINE bindArea2D_is_gravity_a_point #-}

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
bindArea2D_is_gravity_a_point :: MethodBind
bindArea2D_is_gravity_a_point
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_gravity_a_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
is_gravity_a_point ::
                     (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_gravity_a_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_gravity_a_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "is_gravity_a_point" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area2D.is_gravity_a_point

{-# NOINLINE bindArea2D_is_monitorable #-}

-- | If @true@, other monitoring areas can detect this area.
bindArea2D_is_monitorable :: MethodBind
bindArea2D_is_monitorable
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, other monitoring areas can detect this area.
is_monitorable :: (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_monitorable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_monitorable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "is_monitorable" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area2D.is_monitorable

{-# NOINLINE bindArea2D_is_monitoring #-}

-- | If @true@, the area detects bodies or areas entering and exiting it.
bindArea2D_is_monitoring :: MethodBind
bindArea2D_is_monitoring
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_monitoring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area detects bodies or areas entering and exiting it.
is_monitoring :: (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_monitoring cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_monitoring (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "is_monitoring" '[] (IO Bool) where
        nodeMethod = Godot.Core.Area2D.is_monitoring

{-# NOINLINE bindArea2D_is_overriding_audio_bus #-}

-- | If @true@, the area's audio bus overrides the default audio bus.
bindArea2D_is_overriding_audio_bus :: MethodBind
bindArea2D_is_overriding_audio_bus
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_overriding_audio_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area's audio bus overrides the default audio bus.
is_overriding_audio_bus ::
                          (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_overriding_audio_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_overriding_audio_bus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "is_overriding_audio_bus" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Area2D.is_overriding_audio_bus

{-# NOINLINE bindArea2D_overlaps_area #-}

-- | If @true@, the given area overlaps the Area2D.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, the list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
bindArea2D_overlaps_area :: MethodBind
bindArea2D_overlaps_area
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "overlaps_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the given area overlaps the Area2D.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, the list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
overlaps_area ::
                (Area2D :< cls, Object :< cls) => cls -> Node -> IO Bool
overlaps_area cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_overlaps_area (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "overlaps_area" '[Node] (IO Bool) where
        nodeMethod = Godot.Core.Area2D.overlaps_area

{-# NOINLINE bindArea2D_overlaps_body #-}

-- | If @true@, the given physics body overlaps the Area2D.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
--   				The @body@ argument can either be a @PhysicsBody2D@ or a @TileMap@ instance (while TileMaps are not physics bodies themselves, they register their tiles with collision shapes as a virtual physics body).
bindArea2D_overlaps_body :: MethodBind
bindArea2D_overlaps_body
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "overlaps_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the given physics body overlaps the Area2D.
--   				__Note:__ The result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
--   				The @body@ argument can either be a @PhysicsBody2D@ or a @TileMap@ instance (while TileMaps are not physics bodies themselves, they register their tiles with collision shapes as a virtual physics body).
overlaps_body ::
                (Area2D :< cls, Object :< cls) => cls -> Node -> IO Bool
overlaps_body cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_overlaps_body (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "overlaps_body" '[Node] (IO Bool) where
        nodeMethod = Godot.Core.Area2D.overlaps_body

{-# NOINLINE bindArea2D_set_angular_damp #-}

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
bindArea2D_set_angular_damp :: MethodBind
bindArea2D_set_angular_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_angular_damp@ for more details about damping.
set_angular_damp ::
                   (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_angular_damp" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_angular_damp

{-# NOINLINE bindArea2D_set_audio_bus_name #-}

-- | The name of the area's audio bus.
bindArea2D_set_audio_bus_name :: MethodBind
bindArea2D_set_audio_bus_name
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_audio_bus_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the area's audio bus.
set_audio_bus_name ::
                     (Area2D :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_audio_bus_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_audio_bus_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_audio_bus_name" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_audio_bus_name

{-# NOINLINE bindArea2D_set_audio_bus_override #-}

-- | If @true@, the area's audio bus overrides the default audio bus.
bindArea2D_set_audio_bus_override :: MethodBind
bindArea2D_set_audio_bus_override
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_audio_bus_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area's audio bus overrides the default audio bus.
set_audio_bus_override ::
                         (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_audio_bus_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_audio_bus_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_audio_bus_override" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_audio_bus_override

{-# NOINLINE bindArea2D_set_collision_layer #-}

bindArea2D_set_collision_layer :: MethodBind
bindArea2D_set_collision_layer
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_layer ::
                      (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_collision_layer" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_collision_layer

{-# NOINLINE bindArea2D_set_collision_layer_bit #-}

bindArea2D_set_collision_layer_bit :: MethodBind
bindArea2D_set_collision_layer_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_layer_bit ::
                          (Area2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_collision_layer_bit" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_collision_layer_bit

{-# NOINLINE bindArea2D_set_collision_mask #-}

bindArea2D_set_collision_mask :: MethodBind
bindArea2D_set_collision_mask
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask ::
                     (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_collision_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_collision_mask

{-# NOINLINE bindArea2D_set_collision_mask_bit #-}

bindArea2D_set_collision_mask_bit :: MethodBind
bindArea2D_set_collision_mask_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask_bit ::
                         (Area2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_collision_mask_bit" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_collision_mask_bit

{-# NOINLINE bindArea2D_set_gravity #-}

-- | The area's gravity intensity (in pixels per second squared). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
bindArea2D_set_gravity :: MethodBind
bindArea2D_set_gravity
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity intensity (in pixels per second squared). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
set_gravity ::
              (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_gravity" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area2D.set_gravity

{-# NOINLINE bindArea2D_set_gravity_distance_scale #-}

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
bindArea2D_set_gravity_distance_scale :: MethodBind
bindArea2D_set_gravity_distance_scale
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity_distance_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
set_gravity_distance_scale ::
                             (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_distance_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity_distance_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_gravity_distance_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_gravity_distance_scale

{-# NOINLINE bindArea2D_set_gravity_is_point #-}

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
bindArea2D_set_gravity_is_point :: MethodBind
bindArea2D_set_gravity_is_point
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity_is_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, gravity is calculated from a point (set via @gravity_vec@). See also @space_override@.
set_gravity_is_point ::
                       (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_gravity_is_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity_is_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_gravity_is_point" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_gravity_is_point

{-# NOINLINE bindArea2D_set_gravity_vector #-}

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
bindArea2D_set_gravity_vector :: MethodBind
bindArea2D_set_gravity_vector
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity vector (not normalized). If gravity is a point (see @gravity_point@), this will be the point of attraction.
set_gravity_vector ::
                     (Area2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_gravity_vector cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_gravity_vector" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_gravity_vector

{-# NOINLINE bindArea2D_set_linear_damp #-}

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
bindArea2D_set_linear_damp :: MethodBind
bindArea2D_set_linear_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second.
--   			See @ProjectSettings.physics/2d/default_linear_damp@ for more details about damping.
set_linear_damp ::
                  (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_linear_damp" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area2D.set_linear_damp

{-# NOINLINE bindArea2D_set_monitorable #-}

-- | If @true@, other monitoring areas can detect this area.
bindArea2D_set_monitorable :: MethodBind
bindArea2D_set_monitorable
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, other monitoring areas can detect this area.
set_monitorable ::
                  (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_monitorable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_monitorable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_monitorable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Area2D.set_monitorable

{-# NOINLINE bindArea2D_set_monitoring #-}

-- | If @true@, the area detects bodies or areas entering and exiting it.
bindArea2D_set_monitoring :: MethodBind
bindArea2D_set_monitoring
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_monitoring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area detects bodies or areas entering and exiting it.
set_monitoring ::
                 (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_monitoring cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_monitoring (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_monitoring" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Area2D.set_monitoring

{-# NOINLINE bindArea2D_set_priority #-}

-- | The area's priority. Higher priority areas are processed first.
bindArea2D_set_priority :: MethodBind
bindArea2D_set_priority
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's priority. Higher priority areas are processed first.
set_priority ::
               (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_priority (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_priority" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Area2D.set_priority

{-# NOINLINE bindArea2D_set_space_override_mode #-}

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
bindArea2D_set_space_override_mode :: MethodBind
bindArea2D_set_space_override_mode
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override mode for gravity and damping calculations within this area. See @enum SpaceOverride@ for possible values.
set_space_override_mode ::
                          (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_space_override_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Area2D "set_space_override_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Area2D.set_space_override_mode