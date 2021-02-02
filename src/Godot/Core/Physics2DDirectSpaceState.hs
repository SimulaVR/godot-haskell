{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Physics2DDirectSpaceState
       (Godot.Core.Physics2DDirectSpaceState.cast_motion,
        Godot.Core.Physics2DDirectSpaceState.collide_shape,
        Godot.Core.Physics2DDirectSpaceState.get_rest_info,
        Godot.Core.Physics2DDirectSpaceState.intersect_point,
        Godot.Core.Physics2DDirectSpaceState.intersect_point_on_canvas,
        Godot.Core.Physics2DDirectSpaceState.intersect_ray,
        Godot.Core.Physics2DDirectSpaceState.intersect_shape)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysics2DDirectSpaceState_cast_motion #-}

-- | Checks how far the shape can travel toward a point. Note that both the shape and the motion are supplied through a [Physics2DShapeQueryParameters] object. The method will return an array with two floats between 0 and 1, both representing a fraction of [code]motion[/code]. The first is how far the shape can move without triggering a collision, and the second is the point at which a collision will occur. If no collision is detected, the returned array will be [code][1, 1][/code].
--   				If the shape can not move, the array will be empty.
bindPhysics2DDirectSpaceState_cast_motion :: MethodBind
bindPhysics2DDirectSpaceState_cast_motion
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "cast_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks how far the shape can travel toward a point. Note that both the shape and the motion are supplied through a [Physics2DShapeQueryParameters] object. The method will return an array with two floats between 0 and 1, both representing a fraction of [code]motion[/code]. The first is how far the shape can move without triggering a collision, and the second is the point at which a collision will occur. If no collision is detected, the returned array will be [code][1, 1][/code].
--   				If the shape can not move, the array will be empty.
cast_motion ::
              (Physics2DDirectSpaceState :< cls, Object :< cls) =>
              cls -> Physics2DShapeQueryParameters -> IO Array
cast_motion cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_cast_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DDirectSpaceState_collide_shape #-}

-- | Checks the intersections of a shape, given through a [Physics2DShapeQueryParameters] object, against the space. The resulting array contains a list of points where the shape intersects another. Like with [method intersect_shape], the number of returned results can be limited to save processing time.
bindPhysics2DDirectSpaceState_collide_shape :: MethodBind
bindPhysics2DDirectSpaceState_collide_shape
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "collide_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a [Physics2DShapeQueryParameters] object, against the space. The resulting array contains a list of points where the shape intersects another. Like with [method intersect_shape], the number of returned results can be limited to save processing time.
collide_shape ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls -> Physics2DShapeQueryParameters -> Int -> IO Array
collide_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_collide_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DDirectSpaceState_get_rest_info #-}

-- | Checks the intersections of a shape, given through a [Physics2DShapeQueryParameters] object, against the space. If it collides with more than one shape, the nearest one is selected. Note that this method does not take into account the [code]motion[/code] property of the object. The returned object is a dictionary containing the following fields:
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]linear_velocity[/code]: The colliding object's velocity [Vector2]. If the object is an [Area2D], the result is [code](0, 0)[/code].
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]point[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the shape did not intersect anything, then an empty dictionary is returned instead.
bindPhysics2DDirectSpaceState_get_rest_info :: MethodBind
bindPhysics2DDirectSpaceState_get_rest_info
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "get_rest_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a [Physics2DShapeQueryParameters] object, against the space. If it collides with more than one shape, the nearest one is selected. Note that this method does not take into account the [code]motion[/code] property of the object. The returned object is a dictionary containing the following fields:
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]linear_velocity[/code]: The colliding object's velocity [Vector2]. If the object is an [Area2D], the result is [code](0, 0)[/code].
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]point[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the shape did not intersect anything, then an empty dictionary is returned instead.
get_rest_info ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls -> Physics2DShapeQueryParameters -> IO Dictionary
get_rest_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_get_rest_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_point #-}

-- | Checks whether a point is inside any shape. The shapes the point is inside of are returned in an array containing dictionaries with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				Additionally, the method can take an [code]exclude[/code] array of objects or [RID]s that are to be excluded from collisions, a [code]collision_mask[/code] bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with [PhysicsBody]s or [Area]s, respectively.
bindPhysics2DDirectSpaceState_intersect_point :: MethodBind
bindPhysics2DDirectSpaceState_intersect_point
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks whether a point is inside any shape. The shapes the point is inside of are returned in an array containing dictionaries with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				Additionally, the method can take an [code]exclude[/code] array of objects or [RID]s that are to be excluded from collisions, a [code]collision_mask[/code] bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with [PhysicsBody]s or [Area]s, respectively.
intersect_point ::
                  (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                  cls -> Vector2 -> Int -> Array -> Int -> Bool -> Bool -> IO Array
intersect_point cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_point_on_canvas
             #-}

bindPhysics2DDirectSpaceState_intersect_point_on_canvas ::
                                                        MethodBind
bindPhysics2DDirectSpaceState_intersect_point_on_canvas
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_point_on_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

intersect_point_on_canvas ::
                            (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                            cls ->
                              Vector2 -> Int -> Int -> Array -> Int -> Bool -> Bool -> IO Array
intersect_point_on_canvas cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_point_on_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_ray #-}

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]position[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an [code]exclude[/code] array of objects or [RID]s that are to be excluded from collisions, a [code]collision_mask[/code] bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with [PhysicsBody]s or [Area]s, respectively.
bindPhysics2DDirectSpaceState_intersect_ray :: MethodBind
bindPhysics2DDirectSpaceState_intersect_ray
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]normal[/code]: The object's surface normal at the intersection point.
--   				[code]position[/code]: The intersection point.
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an [code]exclude[/code] array of objects or [RID]s that are to be excluded from collisions, a [code]collision_mask[/code] bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with [PhysicsBody]s or [Area]s, respectively.
intersect_ray ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls ->
                  Vector2 -> Vector2 -> Array -> Int -> Bool -> Bool -> IO Dictionary
intersect_ray cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_intersect_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_shape #-}

-- | Checks the intersections of a shape, given through a [Physics2DShapeQueryParameters] object, against the space. Note that this method does not take into account the [code]motion[/code] property of the object. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				The number of intersections can be limited with the [code]max_results[/code] parameter, to reduce the processing time.
bindPhysics2DDirectSpaceState_intersect_shape :: MethodBind
bindPhysics2DDirectSpaceState_intersect_shape
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a [Physics2DShapeQueryParameters] object, against the space. Note that this method does not take into account the [code]motion[/code] property of the object. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				[code]collider[/code]: The colliding object.
--   				[code]collider_id[/code]: The colliding object's ID.
--   				[code]metadata[/code]: The intersecting shape's metadata. This metadata is different from [method Object.get_meta], and is set with [method Physics2DServer.shape_set_data].
--   				[code]rid[/code]: The intersecting object's [RID].
--   				[code]shape[/code]: The shape index of the colliding shape.
--   				The number of intersections can be limited with the [code]max_results[/code] parameter, to reduce the processing time.
intersect_shape ::
                  (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                  cls -> Physics2DShapeQueryParameters -> Int -> IO Array
intersect_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)