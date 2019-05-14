{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.RayCast
       (Godot.Core.RayCast.set_enabled, Godot.Core.RayCast.is_enabled,
        Godot.Core.RayCast.set_cast_to, Godot.Core.RayCast.get_cast_to,
        Godot.Core.RayCast.is_colliding,
        Godot.Core.RayCast.force_raycast_update,
        Godot.Core.RayCast.get_collider,
        Godot.Core.RayCast.get_collider_shape,
        Godot.Core.RayCast.get_collision_point,
        Godot.Core.RayCast.get_collision_normal,
        Godot.Core.RayCast.add_exception_rid,
        Godot.Core.RayCast.add_exception,
        Godot.Core.RayCast.remove_exception_rid,
        Godot.Core.RayCast.remove_exception,
        Godot.Core.RayCast.clear_exceptions,
        Godot.Core.RayCast.set_collision_mask,
        Godot.Core.RayCast.get_collision_mask,
        Godot.Core.RayCast.set_collision_mask_bit,
        Godot.Core.RayCast.get_collision_mask_bit,
        Godot.Core.RayCast.set_exclude_parent_body,
        Godot.Core.RayCast.get_exclude_parent_body,
        Godot.Core.RayCast.set_collide_with_areas,
        Godot.Core.RayCast.is_collide_with_areas_enabled,
        Godot.Core.RayCast.set_collide_with_bodies,
        Godot.Core.RayCast.is_collide_with_bodies_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRayCast_set_enabled #-}

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
bindRayCast_set_enabled :: MethodBind
bindRayCast_set_enabled
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
set_enabled ::
              (RayCast :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_is_enabled #-}

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
bindRayCast_is_enabled :: MethodBind
bindRayCast_is_enabled
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collisions will be reported. Default value: [code]false[/code].
is_enabled :: (RayCast :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_is_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_set_cast_to #-}

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
bindRayCast_set_cast_to :: MethodBind
bindRayCast_set_cast_to
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_cast_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
set_cast_to ::
              (RayCast :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_cast_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_cast_to (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_cast_to #-}

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
bindRayCast_get_cast_to :: MethodBind
bindRayCast_get_cast_to
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_cast_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's destination point, relative to the RayCast's [code]position[/code].
get_cast_to :: (RayCast :< cls, Object :< cls) => cls -> IO Vector3
get_cast_to cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_cast_to (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_is_colliding #-}

-- | Return whether any object is intersecting with the ray's vector (considering the vector length).
bindRayCast_is_colliding :: MethodBind
bindRayCast_is_colliding
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "is_colliding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether any object is intersecting with the ray's vector (considering the vector length).
is_colliding :: (RayCast :< cls, Object :< cls) => cls -> IO Bool
is_colliding cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_is_colliding (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_force_raycast_update #-}

-- | Updates the collision information for the ray.
--   				Use this method to update the collision information immediately instead of waiting for the next [code]_physics_process[/code] call, for example if the ray or its parent has changed state. Note: [code]enabled == true[/code] is not required for this to work.
bindRayCast_force_raycast_update :: MethodBind
bindRayCast_force_raycast_update
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "force_raycast_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the collision information for the ray.
--   				Use this method to update the collision information immediately instead of waiting for the next [code]_physics_process[/code] call, for example if the ray or its parent has changed state. Note: [code]enabled == true[/code] is not required for this to work.
force_raycast_update ::
                       (RayCast :< cls, Object :< cls) => cls -> IO ()
force_raycast_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_force_raycast_update
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_collider #-}

-- | Return the first object that the ray intersects, or [code]null[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
bindRayCast_get_collider :: MethodBind
bindRayCast_get_collider
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the first object that the ray intersects, or [code]null[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
get_collider :: (RayCast :< cls, Object :< cls) => cls -> IO Object
get_collider cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_collider (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_collider_shape #-}

-- | Returns the shape ID of the first object that the ray intersects, or [code]0[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
bindRayCast_get_collider_shape :: MethodBind
bindRayCast_get_collider_shape
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape ID of the first object that the ray intersects, or [code]0[/code] if no object is intersecting the ray (i.e. [method is_colliding] returns [code]false[/code]).
get_collider_shape ::
                     (RayCast :< cls, Object :< cls) => cls -> IO Int
get_collider_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_collider_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_collision_point #-}

-- | Returns the collision point at which the ray intersects the closest object. Note: this point is in the [b]global[/b] coordinate system.
bindRayCast_get_collision_point :: MethodBind
bindRayCast_get_collision_point
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_collision_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the collision point at which the ray intersects the closest object. Note: this point is in the [b]global[/b] coordinate system.
get_collision_point ::
                      (RayCast :< cls, Object :< cls) => cls -> IO Vector3
get_collision_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_collision_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_collision_normal #-}

-- | Returns the normal of the intersecting object's shape at the collision point.
bindRayCast_get_collision_normal :: MethodBind
bindRayCast_get_collision_normal
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_collision_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the normal of the intersecting object's shape at the collision point.
get_collision_normal ::
                       (RayCast :< cls, Object :< cls) => cls -> IO Vector3
get_collision_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_collision_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_add_exception_rid #-}

-- | Adds a collision exception so the ray does not report collisions with the specified [RID].
bindRayCast_add_exception_rid :: MethodBind
bindRayCast_add_exception_rid
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "add_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a collision exception so the ray does not report collisions with the specified [RID].
add_exception_rid ::
                    (RayCast :< cls, Object :< cls) => cls -> Rid -> IO ()
add_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_add_exception_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_add_exception #-}

-- | Adds a collision exception so the ray does not report collisions with the specified node.
bindRayCast_add_exception :: MethodBind
bindRayCast_add_exception
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "add_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a collision exception so the ray does not report collisions with the specified node.
add_exception ::
                (RayCast :< cls, Object :< cls) => cls -> Object -> IO ()
add_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_add_exception (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_remove_exception_rid #-}

-- | Removes a collision exception so the ray does report collisions with the specified [RID].
bindRayCast_remove_exception_rid :: MethodBind
bindRayCast_remove_exception_rid
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "remove_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a collision exception so the ray does report collisions with the specified [RID].
remove_exception_rid ::
                       (RayCast :< cls, Object :< cls) => cls -> Rid -> IO ()
remove_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_remove_exception_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_remove_exception #-}

-- | Removes a collision exception so the ray does report collisions with the specified node.
bindRayCast_remove_exception :: MethodBind
bindRayCast_remove_exception
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "remove_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a collision exception so the ray does report collisions with the specified node.
remove_exception ::
                   (RayCast :< cls, Object :< cls) => cls -> Object -> IO ()
remove_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_remove_exception (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_clear_exceptions #-}

-- | Removes all collision exceptions for this ray.
bindRayCast_clear_exceptions :: MethodBind
bindRayCast_clear_exceptions
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "clear_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all collision exceptions for this ray.
clear_exceptions :: (RayCast :< cls, Object :< cls) => cls -> IO ()
clear_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_clear_exceptions (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_set_collision_mask #-}

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
bindRayCast_set_collision_mask :: MethodBind
bindRayCast_set_collision_mask
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
set_collision_mask ::
                     (RayCast :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_collision_mask #-}

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
bindRayCast_get_collision_mask :: MethodBind
bindRayCast_get_collision_mask
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's collision mask. Only objects in at least one collision layer enabled in the mask will be detected.
get_collision_mask ::
                     (RayCast :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_set_collision_mask_bit #-}

-- | Sets the bit index passed to the [code]value[/code] passed. Note that bit indexes range from 0-19.
bindRayCast_set_collision_mask_bit :: MethodBind
bindRayCast_set_collision_mask_bit
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bit index passed to the [code]value[/code] passed. Note that bit indexes range from 0-19.
set_collision_mask_bit ::
                         (RayCast :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_collision_mask_bit #-}

-- | Returns [code]true[/code] if the bit index passed is turned on. Note that bit indexes range from 0-19.
bindRayCast_get_collision_mask_bit :: MethodBind
bindRayCast_get_collision_mask_bit
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the bit index passed is turned on. Note that bit indexes range from 0-19.
get_collision_mask_bit ::
                         (RayCast :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_set_exclude_parent_body #-}

-- | If [code]true[/code], collisions will be ignored for this RayCast's immediate parent. Default value: [code]true[/code].
bindRayCast_set_exclude_parent_body :: MethodBind
bindRayCast_set_exclude_parent_body
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_exclude_parent_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collisions will be ignored for this RayCast's immediate parent. Default value: [code]true[/code].
set_exclude_parent_body ::
                          (RayCast :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclude_parent_body cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_exclude_parent_body
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_get_exclude_parent_body #-}

-- | If [code]true[/code], collisions will be ignored for this RayCast's immediate parent. Default value: [code]true[/code].
bindRayCast_get_exclude_parent_body :: MethodBind
bindRayCast_get_exclude_parent_body
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "get_exclude_parent_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collisions will be ignored for this RayCast's immediate parent. Default value: [code]true[/code].
get_exclude_parent_body ::
                          (RayCast :< cls, Object :< cls) => cls -> IO Bool
get_exclude_parent_body cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_get_exclude_parent_body
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_set_collide_with_areas #-}

-- | If [code]true[/code], collision with [Area]s will be reported. Default value: [code]false[/code].
bindRayCast_set_collide_with_areas :: MethodBind
bindRayCast_set_collide_with_areas
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [Area]s will be reported. Default value: [code]false[/code].
set_collide_with_areas ::
                         (RayCast :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collide_with_areas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_collide_with_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_is_collide_with_areas_enabled #-}

-- | If [code]true[/code], collision with [Area]s will be reported. Default value: [code]false[/code].
bindRayCast_is_collide_with_areas_enabled :: MethodBind
bindRayCast_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [Area]s will be reported. Default value: [code]false[/code].
is_collide_with_areas_enabled ::
                                (RayCast :< cls, Object :< cls) => cls -> IO Bool
is_collide_with_areas_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_is_collide_with_areas_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_set_collide_with_bodies #-}

-- | If [code]true[/code], collision with [PhysicsBody]s will be reported. Default value: [code]true[/code].
bindRayCast_set_collide_with_bodies :: MethodBind
bindRayCast_set_collide_with_bodies
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [PhysicsBody]s will be reported. Default value: [code]true[/code].
set_collide_with_bodies ::
                          (RayCast :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collide_with_bodies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_set_collide_with_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayCast_is_collide_with_bodies_enabled #-}

-- | If [code]true[/code], collision with [PhysicsBody]s will be reported. Default value: [code]true[/code].
bindRayCast_is_collide_with_bodies_enabled :: MethodBind
bindRayCast_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "RayCast" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], collision with [PhysicsBody]s will be reported. Default value: [code]true[/code].
is_collide_with_bodies_enabled ::
                                 (RayCast :< cls, Object :< cls) => cls -> IO Bool
is_collide_with_bodies_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayCast_is_collide_with_bodies_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)