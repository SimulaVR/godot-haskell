{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SoftBody
       (Godot.Core.SoftBody._draw_soft_mesh,
        Godot.Core.SoftBody.add_collision_exception_with,
        Godot.Core.SoftBody.get_areaAngular_stiffness,
        Godot.Core.SoftBody.get_collision_exceptions,
        Godot.Core.SoftBody.get_collision_layer,
        Godot.Core.SoftBody.get_collision_layer_bit,
        Godot.Core.SoftBody.get_collision_mask,
        Godot.Core.SoftBody.get_collision_mask_bit,
        Godot.Core.SoftBody.get_damping_coefficient,
        Godot.Core.SoftBody.get_drag_coefficient,
        Godot.Core.SoftBody.get_linear_stiffness,
        Godot.Core.SoftBody.get_parent_collision_ignore,
        Godot.Core.SoftBody.get_pose_matching_coefficient,
        Godot.Core.SoftBody.get_pressure_coefficient,
        Godot.Core.SoftBody.get_simulation_precision,
        Godot.Core.SoftBody.get_total_mass,
        Godot.Core.SoftBody.get_volume_stiffness,
        Godot.Core.SoftBody.is_ray_pickable,
        Godot.Core.SoftBody.remove_collision_exception_with,
        Godot.Core.SoftBody.set_areaAngular_stiffness,
        Godot.Core.SoftBody.set_collision_layer,
        Godot.Core.SoftBody.set_collision_layer_bit,
        Godot.Core.SoftBody.set_collision_mask,
        Godot.Core.SoftBody.set_collision_mask_bit,
        Godot.Core.SoftBody.set_damping_coefficient,
        Godot.Core.SoftBody.set_drag_coefficient,
        Godot.Core.SoftBody.set_linear_stiffness,
        Godot.Core.SoftBody.set_parent_collision_ignore,
        Godot.Core.SoftBody.set_pose_matching_coefficient,
        Godot.Core.SoftBody.set_pressure_coefficient,
        Godot.Core.SoftBody.set_ray_pickable,
        Godot.Core.SoftBody.set_simulation_precision,
        Godot.Core.SoftBody.set_total_mass,
        Godot.Core.SoftBody.set_volume_stiffness)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSoftBody__draw_soft_mesh #-}

bindSoftBody__draw_soft_mesh :: MethodBind
bindSoftBody__draw_soft_mesh
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "_draw_soft_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_draw_soft_mesh :: (SoftBody :< cls, Object :< cls) => cls -> IO ()
_draw_soft_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody__draw_soft_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_add_collision_exception_with #-}

-- | Adds a body to the list of bodies that this body can't collide with.
bindSoftBody_add_collision_exception_with :: MethodBind
bindSoftBody_add_collision_exception_with
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "add_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies that this body can't collide with.
add_collision_exception_with ::
                               (SoftBody :< cls, Object :< cls) => cls -> Node -> IO ()
add_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_add_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_areaAngular_stiffness #-}

bindSoftBody_get_areaAngular_stiffness :: MethodBind
bindSoftBody_get_areaAngular_stiffness
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_areaAngular_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_areaAngular_stiffness ::
                            (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_areaAngular_stiffness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_areaAngular_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_collision_exceptions #-}

-- | Returns an array of nodes that were added as collision exceptions for this body.
bindSoftBody_get_collision_exceptions :: MethodBind
bindSoftBody_get_collision_exceptions
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_collision_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of nodes that were added as collision exceptions for this body.
get_collision_exceptions ::
                           (SoftBody :< cls, Object :< cls) => cls -> IO Array
get_collision_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_collision_exceptions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_collision_layer #-}

-- | The physics layers this SoftBody is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
bindSoftBody_get_collision_layer :: MethodBind
bindSoftBody_get_collision_layer
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this SoftBody is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
get_collision_layer ::
                      (SoftBody :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_collision_layer_bit #-}

-- | Returns an individual bit on the collision mask.
bindSoftBody_get_collision_layer_bit :: MethodBind
bindSoftBody_get_collision_layer_bit
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the collision mask.
get_collision_layer_bit ::
                          (SoftBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_collision_mask #-}

-- | The physics layers this SoftBody scans for collisions. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
bindSoftBody_get_collision_mask :: MethodBind
bindSoftBody_get_collision_mask
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this SoftBody scans for collisions. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
get_collision_mask ::
                     (SoftBody :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_collision_mask_bit #-}

-- | Returns an individual bit on the collision mask.
bindSoftBody_get_collision_mask_bit :: MethodBind
bindSoftBody_get_collision_mask_bit
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the collision mask.
get_collision_mask_bit ::
                         (SoftBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_damping_coefficient #-}

bindSoftBody_get_damping_coefficient :: MethodBind
bindSoftBody_get_damping_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_damping_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_damping_coefficient ::
                          (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_damping_coefficient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_damping_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_drag_coefficient #-}

bindSoftBody_get_drag_coefficient :: MethodBind
bindSoftBody_get_drag_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_drag_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_drag_coefficient ::
                       (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_drag_coefficient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_drag_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_linear_stiffness #-}

bindSoftBody_get_linear_stiffness :: MethodBind
bindSoftBody_get_linear_stiffness
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_linear_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_linear_stiffness ::
                       (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_linear_stiffness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_linear_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_parent_collision_ignore #-}

-- | [NodePath] to a [CollisionObject] this SoftBody should avoid clipping.
bindSoftBody_get_parent_collision_ignore :: MethodBind
bindSoftBody_get_parent_collision_ignore
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_parent_collision_ignore" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [NodePath] to a [CollisionObject] this SoftBody should avoid clipping.
get_parent_collision_ignore ::
                              (SoftBody :< cls, Object :< cls) => cls -> IO NodePath
get_parent_collision_ignore cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_parent_collision_ignore
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_pose_matching_coefficient #-}

bindSoftBody_get_pose_matching_coefficient :: MethodBind
bindSoftBody_get_pose_matching_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_pose_matching_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pose_matching_coefficient ::
                                (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_pose_matching_coefficient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_pose_matching_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_pressure_coefficient #-}

bindSoftBody_get_pressure_coefficient :: MethodBind
bindSoftBody_get_pressure_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_pressure_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pressure_coefficient ::
                           (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_pressure_coefficient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_pressure_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_simulation_precision #-}

-- | Increasing this value will improve the resulting simulation, but can affect performance. Use with care.
bindSoftBody_get_simulation_precision :: MethodBind
bindSoftBody_get_simulation_precision
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_simulation_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increasing this value will improve the resulting simulation, but can affect performance. Use with care.
get_simulation_precision ::
                           (SoftBody :< cls, Object :< cls) => cls -> IO Int
get_simulation_precision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_simulation_precision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_total_mass #-}

-- | The SoftBody's mass.
bindSoftBody_get_total_mass :: MethodBind
bindSoftBody_get_total_mass
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_total_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The SoftBody's mass.
get_total_mass ::
                 (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_total_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_total_mass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_get_volume_stiffness #-}

bindSoftBody_get_volume_stiffness :: MethodBind
bindSoftBody_get_volume_stiffness
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "get_volume_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_volume_stiffness ::
                       (SoftBody :< cls, Object :< cls) => cls -> IO Float
get_volume_stiffness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_get_volume_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_is_ray_pickable #-}

-- | If [code]true[/code], the [SoftBody] will respond to [RayCast]s.
bindSoftBody_is_ray_pickable :: MethodBind
bindSoftBody_is_ray_pickable
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "is_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [SoftBody] will respond to [RayCast]s.
is_ray_pickable ::
                  (SoftBody :< cls, Object :< cls) => cls -> IO Bool
is_ray_pickable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_is_ray_pickable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_remove_collision_exception_with #-}

-- | Removes a body from the list of bodies that this body can't collide with.
bindSoftBody_remove_collision_exception_with :: MethodBind
bindSoftBody_remove_collision_exception_with
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "remove_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies that this body can't collide with.
remove_collision_exception_with ::
                                  (SoftBody :< cls, Object :< cls) => cls -> Node -> IO ()
remove_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_remove_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_areaAngular_stiffness #-}

bindSoftBody_set_areaAngular_stiffness :: MethodBind
bindSoftBody_set_areaAngular_stiffness
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_areaAngular_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_areaAngular_stiffness ::
                            (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_areaAngular_stiffness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_areaAngular_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_collision_layer #-}

-- | The physics layers this SoftBody is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
bindSoftBody_set_collision_layer :: MethodBind
bindSoftBody_set_collision_layer
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this SoftBody is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
set_collision_layer ::
                      (SoftBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_collision_layer_bit #-}

-- | Sets individual bits on the layer mask. Use this if you only need to change one layer's value.
bindSoftBody_set_collision_layer_bit :: MethodBind
bindSoftBody_set_collision_layer_bit
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual bits on the layer mask. Use this if you only need to change one layer's value.
set_collision_layer_bit ::
                          (SoftBody :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_collision_mask #-}

-- | The physics layers this SoftBody scans for collisions. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
bindSoftBody_set_collision_mask :: MethodBind
bindSoftBody_set_collision_mask
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this SoftBody scans for collisions. See [url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks]Collision layers and masks[/url] in the documentation for more information.
set_collision_mask ::
                     (SoftBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_collision_mask_bit #-}

-- | Sets individual bits on the collision mask. Use this if you only need to change one layer's value.
bindSoftBody_set_collision_mask_bit :: MethodBind
bindSoftBody_set_collision_mask_bit
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual bits on the collision mask. Use this if you only need to change one layer's value.
set_collision_mask_bit ::
                         (SoftBody :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_damping_coefficient #-}

bindSoftBody_set_damping_coefficient :: MethodBind
bindSoftBody_set_damping_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_damping_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_damping_coefficient ::
                          (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_damping_coefficient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_damping_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_drag_coefficient #-}

bindSoftBody_set_drag_coefficient :: MethodBind
bindSoftBody_set_drag_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_drag_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_drag_coefficient ::
                       (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_drag_coefficient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_drag_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_linear_stiffness #-}

bindSoftBody_set_linear_stiffness :: MethodBind
bindSoftBody_set_linear_stiffness
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_linear_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_linear_stiffness ::
                       (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_stiffness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_linear_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_parent_collision_ignore #-}

-- | [NodePath] to a [CollisionObject] this SoftBody should avoid clipping.
bindSoftBody_set_parent_collision_ignore :: MethodBind
bindSoftBody_set_parent_collision_ignore
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_parent_collision_ignore" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [NodePath] to a [CollisionObject] this SoftBody should avoid clipping.
set_parent_collision_ignore ::
                              (SoftBody :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_parent_collision_ignore cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_parent_collision_ignore
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_pose_matching_coefficient #-}

bindSoftBody_set_pose_matching_coefficient :: MethodBind
bindSoftBody_set_pose_matching_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_pose_matching_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_pose_matching_coefficient ::
                                (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_pose_matching_coefficient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_pose_matching_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_pressure_coefficient #-}

bindSoftBody_set_pressure_coefficient :: MethodBind
bindSoftBody_set_pressure_coefficient
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_pressure_coefficient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_pressure_coefficient ::
                           (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_pressure_coefficient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_pressure_coefficient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_ray_pickable #-}

-- | If [code]true[/code], the [SoftBody] will respond to [RayCast]s.
bindSoftBody_set_ray_pickable :: MethodBind
bindSoftBody_set_ray_pickable
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [SoftBody] will respond to [RayCast]s.
set_ray_pickable ::
                   (SoftBody :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ray_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_ray_pickable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_simulation_precision #-}

-- | Increasing this value will improve the resulting simulation, but can affect performance. Use with care.
bindSoftBody_set_simulation_precision :: MethodBind
bindSoftBody_set_simulation_precision
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_simulation_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increasing this value will improve the resulting simulation, but can affect performance. Use with care.
set_simulation_precision ::
                           (SoftBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_simulation_precision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_simulation_precision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_total_mass #-}

-- | The SoftBody's mass.
bindSoftBody_set_total_mass :: MethodBind
bindSoftBody_set_total_mass
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_total_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The SoftBody's mass.
set_total_mass ::
                 (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_total_mass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_total_mass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSoftBody_set_volume_stiffness #-}

bindSoftBody_set_volume_stiffness :: MethodBind
bindSoftBody_set_volume_stiffness
  = unsafePerformIO $
      withCString "SoftBody" $
        \ clsNamePtr ->
          withCString "set_volume_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_volume_stiffness ::
                       (SoftBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_volume_stiffness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSoftBody_set_volume_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)