{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.RayCast2D
       (Godot.Core.RayCast2D.set_enabled, Godot.Core.RayCast2D.is_enabled,
        Godot.Core.RayCast2D.set_cast_to, Godot.Core.RayCast2D.get_cast_to,
        Godot.Core.RayCast2D.is_colliding,
        Godot.Core.RayCast2D.force_raycast_update,
        Godot.Core.RayCast2D.get_collider,
        Godot.Core.RayCast2D.get_collider_shape,
        Godot.Core.RayCast2D.get_collision_point,
        Godot.Core.RayCast2D.get_collision_normal,
        Godot.Core.RayCast2D.add_exception_rid,
        Godot.Core.RayCast2D.add_exception,
        Godot.Core.RayCast2D.remove_exception_rid,
        Godot.Core.RayCast2D.remove_exception,
        Godot.Core.RayCast2D.clear_exceptions,
        Godot.Core.RayCast2D.set_collision_mask,
        Godot.Core.RayCast2D.get_collision_mask,
        Godot.Core.RayCast2D.set_collision_mask_bit,
        Godot.Core.RayCast2D.get_collision_mask_bit,
        Godot.Core.RayCast2D.set_exclude_parent_body,
        Godot.Core.RayCast2D.get_exclude_parent_body,
        Godot.Core.RayCast2D.set_collide_with_areas,
        Godot.Core.RayCast2D.is_collide_with_areas_enabled,
        Godot.Core.RayCast2D.set_collide_with_bodies,
        Godot.Core.RayCast2D.is_collide_with_bodies_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRayCast2D_set_enabled #-}

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
bindRayCast2D_set_enabled :: MethodBind
bindRayCast2D_set_enabled
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
set_enabled ::
              (RayCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_is_enabled #-}

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
bindRayCast2D_is_enabled :: MethodBind
bindRayCast2D_is_enabled
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
is_enabled :: (RayCast2D :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_is_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_set_cast_to #-}

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
bindRayCast2D_set_cast_to :: MethodBind
bindRayCast2D_set_cast_to
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_cast_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
set_cast_to ::
              (RayCast2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_cast_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_cast_to (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_cast_to #-}

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
bindRayCast2D_get_cast_to :: MethodBind
bindRayCast2D_get_cast_to
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_cast_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
get_cast_to ::
              (RayCast2D :< cls, Object :< cls) => cls -> IO Vector2
get_cast_to cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_cast_to (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_is_colliding #-}

-- | Return whether any object is intersecting with the ray's vector (considering the vector length).
bindRayCast2D_is_colliding :: MethodBind
bindRayCast2D_is_colliding
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "is_colliding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether any object is intersecting with the ray's vector (considering the vector length).
is_colliding :: (RayCast2D :< cls, Object :< cls) => cls -> IO Bool
is_colliding cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_is_colliding (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_force_raycast_update #-}

-- | Updates the collision information for the ray. Use this method to update the collision information immediately instead of waiting for the next [code]_physics_process[/code] call, for example if the ray or its parent has changed state. Note: [code]enabled == true[/code] is not required for this to work.
bindRayCast2D_force_raycast_update :: MethodBind
bindRayCast2D_force_raycast_update
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "force_raycast_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the collision information for the ray. Use this method to update the collision information immediately instead of waiting for the next [code]_physics_process[/code] call, for example if the ray or its parent has changed state. Note: [code]enabled == true[/code] is not required for this to work.
force_raycast_update ::
                       (RayCast2D :< cls, Object :< cls) => cls -> IO ()
force_raycast_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_force_raycast_update
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_collider #-}

-- | Return the first object that the ray intersects, or [code]null[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
bindRayCast2D_get_collider :: MethodBind
bindRayCast2D_get_collider
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the first object that the ray intersects, or [code]null[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
get_collider ::
               (RayCast2D :< cls, Object :< cls) => cls -> IO Object
get_collider cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_collider (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_collider_shape #-}

-- | Returns the shape ID of the first object that the ray intersects, or [code]0[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
bindRayCast2D_get_collider_shape :: MethodBind
bindRayCast2D_get_collider_shape
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape ID of the first object that the ray intersects, or [code]0[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
get_collider_shape ::
                     (RayCast2D :< cls, Object :< cls) => cls -> IO Int
get_collider_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_collision_point #-}

-- | Returns the collision point at which the ray intersects the closest object. Note: this point is in the [b]global[/b] coordinate system.
bindRayCast2D_get_collision_point :: MethodBind
bindRayCast2D_get_collision_point
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collision point at which the ray intersects the closest object. Note: this point is in the [b]global[/b] coordinate system.
get_collision_point ::
                      (RayCast2D :< cls, Object :< cls) => cls -> IO Vector2
get_collision_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_collision_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_collision_normal #-}

-- | Returns the normal of the intersecting object's shape at the collision point.
bindRayCast2D_get_collision_normal :: MethodBind
bindRayCast2D_get_collision_normal
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the normal of the intersecting object's shape at the collision point.
get_collision_normal ::
                       (RayCast2D :< cls, Object :< cls) => cls -> IO Vector2
get_collision_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_collision_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_add_exception_rid #-}

-- | Adds a collision exception so the ray does not report collisions with the specified [RID].
bindRayCast2D_add_exception_rid :: MethodBind
bindRayCast2D_add_exception_rid
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "add_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a collision exception so the ray does not report collisions with the specified [RID].
add_exception_rid ::
                    (RayCast2D :< cls, Object :< cls) => cls -> Rid -> IO ()
add_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_add_exception_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_add_exception #-}

-- | Adds a collision exception so the ray does not report collisions with the specified node.
bindRayCast2D_add_exception :: MethodBind
bindRayCast2D_add_exception
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "add_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a collision exception so the ray does not report collisions with the specified node.
add_exception ::
                (RayCast2D :< cls, Object :< cls) => cls -> Object -> IO ()
add_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_add_exception (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_remove_exception_rid #-}

-- | Removes a collision exception so the ray does report collisions with the specified [RID].
bindRayCast2D_remove_exception_rid :: MethodBind
bindRayCast2D_remove_exception_rid
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "remove_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a collision exception so the ray does report collisions with the specified [RID].
remove_exception_rid ::
                       (RayCast2D :< cls, Object :< cls) => cls -> Rid -> IO ()
remove_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_remove_exception_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_remove_exception #-}

-- | Removes a collision exception so the ray does report collisions with the specified node.
bindRayCast2D_remove_exception :: MethodBind
bindRayCast2D_remove_exception
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "remove_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a collision exception so the ray does report collisions with the specified node.
remove_exception ::
                   (RayCast2D :< cls, Object :< cls) => cls -> Object -> IO ()
remove_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_remove_exception (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_clear_exceptions #-}

-- | Removes all collision exceptions for this ray.
bindRayCast2D_clear_exceptions :: MethodBind
bindRayCast2D_clear_exceptions
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "clear_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all collision exceptions for this ray.
clear_exceptions ::
                   (RayCast2D :< cls, Object :< cls) => cls -> IO ()
clear_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_clear_exceptions (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_set_collision_mask #-}

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
bindRayCast2D_set_collision_mask :: MethodBind
bindRayCast2D_set_collision_mask
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
set_collision_mask ::
                     (RayCast2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_collision_mask #-}

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
bindRayCast2D_get_collision_mask :: MethodBind
bindRayCast2D_get_collision_mask
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
get_collision_mask ::
                     (RayCast2D :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_set_collision_mask_bit #-}

-- | Set/clear individual bits on the collision mask. This makes selecting the areas scanned easier.
bindRayCast2D_set_collision_mask_bit :: MethodBind
bindRayCast2D_set_collision_mask_bit
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set/clear individual bits on the collision mask. This makes selecting the areas scanned easier.
set_collision_mask_bit ::
                         (RayCast2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_collision_mask_bit #-}

-- | Return an individual bit on the collision mask.
bindRayCast2D_get_collision_mask_bit :: MethodBind
bindRayCast2D_get_collision_mask_bit
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return an individual bit on the collision mask.
get_collision_mask_bit ::
                         (RayCast2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_set_exclude_parent_body #-}

-- | If [code]true[/code], the parent node will be excluded from collision detection. Default value: [code]true[/code].
bindRayCast2D_set_exclude_parent_body :: MethodBind
bindRayCast2D_set_exclude_parent_body
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_exclude_parent_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the parent node will be excluded from collision detection. Default value: [code]true[/code].
set_exclude_parent_body ::
                          (RayCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclude_parent_body cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_exclude_parent_body
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_get_exclude_parent_body #-}

-- | If [code]true[/code], the parent node will be excluded from collision detection. Default value: [code]true[/code].
bindRayCast2D_get_exclude_parent_body :: MethodBind
bindRayCast2D_get_exclude_parent_body
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "get_exclude_parent_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the parent node will be excluded from collision detection. Default value: [code]true[/code].
get_exclude_parent_body ::
                          (RayCast2D :< cls, Object :< cls) => cls -> IO Bool
get_exclude_parent_body cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_get_exclude_parent_body
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_set_collide_with_areas #-}

-- | If [code]true[/code], collision with [Area2D]s will be reported. Default value: [code]false[/code].
bindRayCast2D_set_collide_with_areas :: MethodBind
bindRayCast2D_set_collide_with_areas
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [Area2D]s will be reported. Default value: [code]false[/code].
set_collide_with_areas ::
                         (RayCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collide_with_areas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_collide_with_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_is_collide_with_areas_enabled #-}

-- | If [code]true[/code], collision with [Area2D]s will be reported. Default value: [code]false[/code].
bindRayCast2D_is_collide_with_areas_enabled :: MethodBind
bindRayCast2D_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [Area2D]s will be reported. Default value: [code]false[/code].
is_collide_with_areas_enabled ::
                                (RayCast2D :< cls, Object :< cls) => cls -> IO Bool
is_collide_with_areas_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_is_collide_with_areas_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_set_collide_with_bodies #-}

-- | If [code]true[/code], collision with [PhysicsBody2D]s will be reported. Default value: [code]true[/code].
bindRayCast2D_set_collide_with_bodies :: MethodBind
bindRayCast2D_set_collide_with_bodies
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [PhysicsBody2D]s will be reported. Default value: [code]true[/code].
set_collide_with_bodies ::
                          (RayCast2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collide_with_bodies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_set_collide_with_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast2D_is_collide_with_bodies_enabled #-}

-- | If [code]true[/code], collision with [PhysicsBody2D]s will be reported. Default value: [code]true[/code].
bindRayCast2D_is_collide_with_bodies_enabled :: MethodBind
bindRayCast2D_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "RayCast2D" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [PhysicsBody2D]s will be reported. Default value: [code]true[/code].
is_collide_with_bodies_enabled ::
                                 (RayCast2D :< cls, Object :< cls) => cls -> IO Bool
is_collide_with_bodies_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast2D_is_collide_with_bodies_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)