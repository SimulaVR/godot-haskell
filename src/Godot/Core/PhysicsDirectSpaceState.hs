{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsDirectSpaceState
       (Godot.Core.PhysicsDirectSpaceState.cast_motion,
        Godot.Core.PhysicsDirectSpaceState.collide_shape,
        Godot.Core.PhysicsDirectSpaceState.get_rest_info,
        Godot.Core.PhysicsDirectSpaceState.intersect_ray,
        Godot.Core.PhysicsDirectSpaceState.intersect_shape)
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

{-# NOINLINE bindPhysicsDirectSpaceState_cast_motion #-}

-- | Checks how far a @Shape@ can move without colliding. All the parameters for the query, including the shape, are supplied through a @PhysicsShapeQueryParameters@ object.
--   				Returns an array with the safe and unsafe proportions (between 0 and 1) of the motion. The safe proportion is the maximum fraction of the motion that can be made without a collision. The unsafe proportion is the minimum fraction of the distance that must be moved for a collision. If no collision is detected a result of @@1.0, 1.0@@ will be returned.
--   				__Note:__ Any @Shape@s that the shape is already colliding with e.g. inside of, will be ignored. Use @method collide_shape@ to determine the @Shape@s that the shape is already colliding with.
bindPhysicsDirectSpaceState_cast_motion :: MethodBind
bindPhysicsDirectSpaceState_cast_motion
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "cast_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks how far a @Shape@ can move without colliding. All the parameters for the query, including the shape, are supplied through a @PhysicsShapeQueryParameters@ object.
--   				Returns an array with the safe and unsafe proportions (between 0 and 1) of the motion. The safe proportion is the maximum fraction of the motion that can be made without a collision. The unsafe proportion is the minimum fraction of the distance that must be moved for a collision. If no collision is detected a result of @@1.0, 1.0@@ will be returned.
--   				__Note:__ Any @Shape@s that the shape is already colliding with e.g. inside of, will be ignored. Use @method collide_shape@ to determine the @Shape@s that the shape is already colliding with.
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

instance NodeMethod PhysicsDirectSpaceState "cast_motion"
           '[PhysicsShapeQueryParameters, Vector3]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsDirectSpaceState.cast_motion

{-# NOINLINE bindPhysicsDirectSpaceState_collide_shape #-}

-- | Checks the intersections of a shape, given through a @PhysicsShapeQueryParameters@ object, against the space. The resulting array contains a list of points where the shape intersects another. Like with @method intersect_shape@, the number of returned results can be limited to save processing time.
bindPhysicsDirectSpaceState_collide_shape :: MethodBind
bindPhysicsDirectSpaceState_collide_shape
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "collide_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a @PhysicsShapeQueryParameters@ object, against the space. The resulting array contains a list of points where the shape intersects another. Like with @method intersect_shape@, the number of returned results can be limited to save processing time.
collide_shape ::
                (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                cls -> PhysicsShapeQueryParameters -> Maybe Int -> IO Array
collide_shape cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_collide_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectSpaceState "collide_shape"
           '[PhysicsShapeQueryParameters, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsDirectSpaceState.collide_shape

{-# NOINLINE bindPhysicsDirectSpaceState_get_rest_info #-}

-- | Checks the intersections of a shape, given through a @PhysicsShapeQueryParameters@ object, against the space. If it collides with more than one shape, the nearest one is selected. The returned object is a dictionary containing the following fields:
--   				@collider_id@: The colliding object's ID.
--   				@linear_velocity@: The colliding object's velocity @Vector3@. If the object is an @Area@, the result is @(0, 0, 0)@.
--   				@normal@: The object's surface normal at the intersection point.
--   				@point@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				If the shape did not intersect anything, then an empty dictionary is returned instead.
bindPhysicsDirectSpaceState_get_rest_info :: MethodBind
bindPhysicsDirectSpaceState_get_rest_info
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "get_rest_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a @PhysicsShapeQueryParameters@ object, against the space. If it collides with more than one shape, the nearest one is selected. The returned object is a dictionary containing the following fields:
--   				@collider_id@: The colliding object's ID.
--   				@linear_velocity@: The colliding object's velocity @Vector3@. If the object is an @Area@, the result is @(0, 0, 0)@.
--   				@normal@: The object's surface normal at the intersection point.
--   				@point@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
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

instance NodeMethod PhysicsDirectSpaceState "get_rest_info"
           '[PhysicsShapeQueryParameters]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.PhysicsDirectSpaceState.get_rest_info

{-# NOINLINE bindPhysicsDirectSpaceState_intersect_ray #-}

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@normal@: The object's surface normal at the intersection point.
--   				@position@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody@s or @Area@s, respectively.
bindPhysicsDirectSpaceState_intersect_ray :: MethodBind
bindPhysicsDirectSpaceState_intersect_ray
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Intersects a ray in a given space. The returned object is a dictionary with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@normal@: The object's surface normal at the intersection point.
--   				@position@: The intersection point.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				If the ray did not intersect anything, then an empty dictionary is returned instead.
--   				Additionally, the method can take an @exclude@ array of objects or @RID@s that are to be excluded from collisions, a @collision_mask@ bitmask representing the physics layers to check in, or booleans to determine if the ray should collide with @PhysicsBody@s or @Area@s, respectively.
intersect_ray ::
                (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                cls ->
                  Vector3 ->
                    Vector3 ->
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
         godot_method_bind_call bindPhysicsDirectSpaceState_intersect_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectSpaceState "intersect_ray"
           '[Vector3, Vector3, Maybe Array, Maybe Int, Maybe Bool, Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.PhysicsDirectSpaceState.intersect_ray

{-# NOINLINE bindPhysicsDirectSpaceState_intersect_shape #-}

-- | Checks the intersections of a shape, given through a @PhysicsShapeQueryParameters@ object, against the space. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
bindPhysicsDirectSpaceState_intersect_shape :: MethodBind
bindPhysicsDirectSpaceState_intersect_shape
  = unsafePerformIO $
      withCString "PhysicsDirectSpaceState" $
        \ clsNamePtr ->
          withCString "intersect_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks the intersections of a shape, given through a @PhysicsShapeQueryParameters@ object, against the space. The intersected shapes are returned in an array containing dictionaries with the following fields:
--   				@collider@: The colliding object.
--   				@collider_id@: The colliding object's ID.
--   				@rid@: The intersecting object's @RID@.
--   				@shape@: The shape index of the colliding shape.
--   				The number of intersections can be limited with the @max_results@ parameter, to reduce the processing time.
intersect_shape ::
                  (PhysicsDirectSpaceState :< cls, Object :< cls) =>
                  cls -> PhysicsShapeQueryParameters -> Maybe Int -> IO Array
intersect_shape cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (32)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsDirectSpaceState_intersect_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsDirectSpaceState "intersect_shape"
           '[PhysicsShapeQueryParameters, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsDirectSpaceState.intersect_shape