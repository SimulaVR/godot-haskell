{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PhysicsDirectSpaceState
       (Godot.Core.PhysicsDirectSpaceState.intersect_ray,
        Godot.Core.PhysicsDirectSpaceState.intersect_shape,
        Godot.Core.PhysicsDirectSpaceState.cast_motion,
        Godot.Core.PhysicsDirectSpaceState.collide_shape,
        Godot.Core.PhysicsDirectSpaceState.get_rest_info)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysicsDirectSpaceState_intersect_ray #-}

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]position[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an [code]exclude[/code] array of objects or [RID]s that are to be excluded from collisions, a [code]collision_mask[/code] bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with [PhysicsBody]s or [Area]s, respectively.
bindPhysicsDirectSpaceState_intersect_ray :: MethodBind
bindPhysicsDirectSpaceState_intersect_ray
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]position[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an [code]exclude[/code] array of objects or [RID]s that are to be excluded from collisions, a [code]collision_mask[/code] bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with [PhysicsBody]s or [Area]s, respectively.
intersect_ray ::
                (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                cls ->
                  Vector3 -> Vector3 -> Array -> Int -> Bool -> Bool -> IO Dictionary
intersect_ray cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_intersect_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectSpaceState_intersect_shape #-}

-- | Checks the intersections of a shape, given through a [PhysicsShapeQueryParameters] object, against the space. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				The number of intersections can be limited with the [code]max_results[/code] parameter, to reduce the processing time.
bindPhysicsDirectSpaceState_intersect_shape :: MethodBind
bindPhysicsDirectSpaceState_intersect_shape
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a [PhysicsShapeQueryParameters] object, against the space. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				The number of intersections can be limited with the [code]max_results[/code] parameter, to reduce the processing time.
intersect_shape ::
                  (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                  cls -> PhysicsShapeQueryParameters -> Int -> IO Array
intersect_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_intersect_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectSpaceState_cast_motion #-}

-- | Checks whether the shape can travel to a point. The method will return an array with two floats between 0 and 1, both representing a fraction of [code]motion[/code]. The first is how far the shape can move without triggering a collision, and the second is the point at which a collision will occur. If no collision is detected, the returned array will be [code][1, 1][/code].
--   				If the shape can not move, the returned array will be [code][0, 0][/code] under Bullet, and empty under GodotPhysics.
bindPhysicsDirectSpaceState_cast_motion :: MethodBind
bindPhysicsDirectSpaceState_cast_motion
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "cast_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks whether the shape can travel to a point. The method will return an array with two floats between 0 and 1, both representing a fraction of [code]motion[/code]. The first is how far the shape can move without triggering a collision, and the second is the point at which a collision will occur. If no collision is detected, the returned array will be [code][1, 1][/code].
--   				If the shape can not move, the returned array will be [code][0, 0][/code] under Bullet, and empty under GodotPhysics.
cast_motion ::
              (PhysicsDirectSpaceState :< cls, Object :< cls) =>
              cls -> PhysicsShapeQueryParameters -> Vector3 -> IO Array
cast_motion cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_cast_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectSpaceState_collide_shape #-}

-- | Checks the intersections of a shape, given through a [PhysicsShapeQueryParameters] object, against the space. The resulting array contains a list of points where the shape intersects another. Like with [method intersect_shape], the number of returned results can be limited to save processing time.
bindPhysicsDirectSpaceState_collide_shape :: MethodBind
bindPhysicsDirectSpaceState_collide_shape
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "collide_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a [PhysicsShapeQueryParameters] object, against the space. The resulting array contains a list of points where the shape intersects another. Like with [method intersect_shape], the number of returned results can be limited to save processing time.
collide_shape ::
                (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                cls -> PhysicsShapeQueryParameters -> Int -> IO Array
collide_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_collide_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsDirectSpaceState_get_rest_info #-}

-- | Checks the intersections of a shape, given through a [PhysicsShapeQueryParameters] object, against the space. If it collides with more than one shape, the nearest one is selected. The returned object is a dictionary containing the following fields:
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]linear_velocity[/code]: The colliding object's velocity [Vector3]. If the object is an [Area], the result is [code](0, 0, 0)[/code].
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]point[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the shape did not intersect anything, then an empty dictionary is returned instead.
bindPhysicsDirectSpaceState_get_rest_info :: MethodBind
bindPhysicsDirectSpaceState_get_rest_info
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "get_rest_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a [PhysicsShapeQueryParameters] object, against the space. If it collides with more than one shape, the nearest one is selected. The returned object is a dictionary containing the following fields:
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]linear_velocity[/code]: The colliding object's velocity [Vector3]. If the object is an [Area], the result is [code](0, 0, 0)[/code].
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]point[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the shape did not intersect anything, then an empty dictionary is returned instead.
get_rest_info ::
                (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                cls -> PhysicsShapeQueryParameters -> IO Dictionary
get_rest_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_get_rest_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)