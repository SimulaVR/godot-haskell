{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Object()

{-# NOINLINE bindPhysics2DDirectSpaceState_cast_motion #-}

-- | Checks how far a @Shape2D@ can move without colliding. All the parameters for the query, including the shape and the motion, are supplied through a @Physics2DShapeQueryParameters@ object.
--   				Returns an array with the safe and unsafe proportions (between 0 and 1) of the motion. The safe proportion is the maximum fraction of the motion that can be made without a collision. The unsafe proportion is the minimum fraction of the distance that must be moved for a collision. If no collision is detected a result of @@1.0, 1.0@@ will be returned.
--   				__Note:__ Any @Shape2D@s that the shape is already colliding with e.g. inside of, will be ignored. Use @method collide_shape@ to determine the @Shape2D@s that the shape is already colliding with.
bindPhysics2DDirectSpaceState_cast_motion :: MethodBind
bindPhysics2DDirectSpaceState_cast_motion
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "cast_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks how far a @Shape2D@ can move without colliding. All the parameters for the query, including the shape and the motion, are supplied through a @Physics2DShapeQueryParameters@ object.
--   				Returns an array with the safe and unsafe proportions (between 0 and 1) of the motion. The safe proportion is the maximum fraction of the motion that can be made without a collision. The unsafe proportion is the minimum fraction of the distance that must be moved for a collision. If no collision is detected a result of @@1.0, 1.0@@ will be returned.
--   				__Note:__ Any @Shape2D@s that the shape is already colliding with e.g. inside of, will be ignored. Use @method collide_shape@ to determine the @Shape2D@s that the shape is already colliding with.
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

instance NodeMethod Physics2DDirectSpaceState "cast_motion"
           '[Physics2DShapeQueryParameters]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.cast_motion

{-# NOINLINE bindPhysics2DDirectSpaceState_collide_shape #-}

-- | Checks the intersections of a shape, given through a @Physics2DShapeQueryParameters@ object, against the space. The resulting array contains a list of points where the shape intersects another. Like with @method intersect_shape@, the number of returned results can be limited to save processing time.
bindPhysics2DDirectSpaceState_collide_shape :: MethodBind
bindPhysics2DDirectSpaceState_collide_shape
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "collide_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a @Physics2DShapeQueryParameters@ object, against the space. The resulting array contains a list of points where the shape intersects another. Like with @method intersect_shape@, the number of returned results can be limited to save processing time.
collide_shape ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls -> Physics2DShapeQueryParameters -> Maybe Int -> IO Array
collide_shape cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_collide_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "collide_shape"
           '[Physics2DShapeQueryParameters, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.collide_shape

{-# NOINLINE bindPhysics2DDirectSpaceState_get_rest_info #-}

-- | Checks the intersections of a shape, given through a @Physics2DShapeQueryParameters@ object, against the space. If it collides with more than one shape, the nearest one is selected. If the shape did not intersect anything, then an empty dictionary is returned instead.
--   				__Note:__ This method does not take into account the @motion@ property of the object. The returned object is a dictionary containing the following fields:
--   				@collider_id@: The colliding object's ID.
--   				@linear_velocity@: The colliding object's velocity @Vector2@. If the object is an @Area2D@, the result is @(0, 0)@.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@normal@: The object's surface normal at the intersection point.
--   				@point@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
bindPhysics2DDirectSpaceState_get_rest_info :: MethodBind
bindPhysics2DDirectSpaceState_get_rest_info
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "get_rest_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a @Physics2DShapeQueryParameters@ object, against the space. If it collides with more than one shape, the nearest one is selected. If the shape did not intersect anything, then an empty dictionary is returned instead.
--   				__Note:__ This method does not take into account the @motion@ property of the object. The returned object is a dictionary containing the following fields:
--   				@collider_id@: The colliding object's ID.
--   				@linear_velocity@: The colliding object's velocity @Vector2@. If the object is an @Area2D@, the result is @(0, 0)@.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@normal@: The object's surface normal at the intersection point.
--   				@point@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
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

instance NodeMethod Physics2DDirectSpaceState "get_rest_info"
           '[Physics2DShapeQueryParameters]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.get_rest_info

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_point #-}

-- | Checks whether a point is inside any solid shape. The shapes the point is inside of are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody2D@s or @Area2D@s, respectively.
--   				__Note:__ @ConcavePolygonShape2D@s and @CollisionPolygon2D@s in @Segments@ build mode are not solid shapes. Therefore, they will not be detected.
bindPhysics2DDirectSpaceState_intersect_point :: MethodBind
bindPhysics2DDirectSpaceState_intersect_point
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks whether a point is inside any solid shape. The shapes the point is inside of are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody2D@s or @Area2D@s, respectively.
--   				__Note:__ @ConcavePolygonShape2D@s and @CollisionPolygon2D@s in @Segments@ build mode are not solid shapes. Therefore, they will not be detected.
intersect_point ::
                  (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                  cls ->
                    Vector2 ->
                      Maybe Int ->
                        Maybe Array -> Maybe Int -> Maybe Bool -> Maybe Bool -> IO Array
intersect_point cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2,
       defaultedVariant VariantArray V.empty arg3,
       maybe (VariantInt (2147483647)) toVariant arg4,
       maybe (VariantBool True) toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "intersect_point"
           '[Vector2, Maybe Int, Maybe Array, Maybe Int, Maybe Bool,
             Maybe Bool]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.intersect_point

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_point_on_canvas
             #-}

-- | Checks whether a point is inside any solid shape, in a specific canvas layer given by @canvas_instance_id@. The shapes the point is inside of are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody2D@s or @Area2D@s, respectively.
--   				__Note:__ @ConcavePolygonShape2D@s and @CollisionPolygon2D@s in @Segments@ build mode are not solid shapes. Therefore, they will not be detected.
bindPhysics2DDirectSpaceState_intersect_point_on_canvas ::
                                                        MethodBind
bindPhysics2DDirectSpaceState_intersect_point_on_canvas
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_point_on_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks whether a point is inside any solid shape, in a specific canvas layer given by @canvas_instance_id@. The shapes the point is inside of are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody2D@s or @Area2D@s, respectively.
--   				__Note:__ @ConcavePolygonShape2D@s and @CollisionPolygon2D@s in @Segments@ build mode are not solid shapes. Therefore, they will not be detected.
intersect_point_on_canvas ::
                            (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                            cls ->
                              Vector2 ->
                                Int ->
                                  Maybe Int ->
                                    Maybe Array -> Maybe Int -> Maybe Bool -> Maybe Bool -> IO Array
intersect_point_on_canvas cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (32)) toVariant arg3,
       defaultedVariant VariantArray V.empty arg4,
       maybe (VariantInt (2147483647)) toVariant arg5,
       maybe (VariantBool True) toVariant arg6,
       maybe (VariantBool False) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_point_on_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState
           "intersect_point_on_canvas"
           '[Vector2, Int, Maybe Int, Maybe Array, Maybe Int, Maybe Bool,
             Maybe Bool]
           (IO Array)
         where
        nodeMethod
          = Godot.Core.Physics2DDirectSpaceState.intersect_point_on_canvas

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_ray #-}

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@normal@: The object's surface normal at the intersection point.
--   				@position@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody2D@s or @Area2D@s, respectively.
bindPhysics2DDirectSpaceState_intersect_ray :: MethodBind
bindPhysics2DDirectSpaceState_intersect_ray
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@normal@: The object's surface normal at the intersection point.
--   				@position@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody2D@s or @Area2D@s, respectively.
intersect_ray ::
                (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                cls ->
                  Vector2 ->
                    Vector2 ->
                      Maybe Array ->
                        Maybe Int -> Maybe Bool -> Maybe Bool -> IO Dictionary
intersect_ray cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantArray V.empty arg3,
       maybe (VariantInt (2147483647)) toVariant arg4,
       maybe (VariantBool True) toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DDirectSpaceState_intersect_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "intersect_ray"
           '[Vector2, Vector2, Maybe Array, Maybe Int, Maybe Bool, Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.intersect_ray

{-# NOINLINE bindPhysics2DDirectSpaceState_intersect_shape #-}

-- | Checks the intersections of a shape, given through a @Physics2DShapeQueryParameters@ object, against the space.
--   				__Note:__ This method does not take into account the @motion@ property of the object. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
bindPhysics2DDirectSpaceState_intersect_shape :: MethodBind
bindPhysics2DDirectSpaceState_intersect_shape
  = unsafePerformIO $
      withCString "Physics2DDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a @Physics2DShapeQueryParameters@ object, against the space.
--   				__Note:__ This method does not take into account the @motion@ property of the object. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@metadata@: The intersecting shape's metadata. This metadata is different from @method Object.get_meta@, and is set with @method Physics2DServer.shape_set_data@.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
intersect_shape ::
                  (Physics2DDirectSpaceState :< cls, Object :< cls) =>
                  cls -> Physics2DShapeQueryParameters -> Maybe Int -> IO Array
intersect_shape cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DDirectSpaceState_intersect_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DDirectSpaceState "intersect_shape"
           '[Physics2DShapeQueryParameters, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DDirectSpaceState.intersect_shape