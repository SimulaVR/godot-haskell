{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Geometry
       (Godot.Core.Geometry._END_POLYGON, Godot.Core.Geometry._JOIN_ROUND,
        Godot.Core.Geometry._OPERATION_XOR,
        Godot.Core.Geometry._JOIN_MITER, Godot.Core.Geometry._END_JOINED,
        Godot.Core.Geometry._OPERATION_UNION,
        Godot.Core.Geometry._JOIN_SQUARE,
        Godot.Core.Geometry._OPERATION_INTERSECTION,
        Godot.Core.Geometry._END_BUTT, Godot.Core.Geometry._END_ROUND,
        Godot.Core.Geometry._OPERATION_DIFFERENCE,
        Godot.Core.Geometry._END_SQUARE,
        Godot.Core.Geometry.build_box_planes,
        Godot.Core.Geometry.build_capsule_planes,
        Godot.Core.Geometry.build_cylinder_planes,
        Godot.Core.Geometry.clip_polygon,
        Godot.Core.Geometry.clip_polygons_2d,
        Godot.Core.Geometry.clip_polyline_with_polygon_2d,
        Godot.Core.Geometry.convex_hull_2d,
        Godot.Core.Geometry.exclude_polygons_2d,
        Godot.Core.Geometry.get_closest_point_to_segment,
        Godot.Core.Geometry.get_closest_point_to_segment_2d,
        Godot.Core.Geometry.get_closest_point_to_segment_uncapped,
        Godot.Core.Geometry.get_closest_point_to_segment_uncapped_2d,
        Godot.Core.Geometry.get_closest_points_between_segments,
        Godot.Core.Geometry.get_closest_points_between_segments_2d,
        Godot.Core.Geometry.get_uv84_normal_bit,
        Godot.Core.Geometry.intersect_polygons_2d,
        Godot.Core.Geometry.intersect_polyline_with_polygon_2d,
        Godot.Core.Geometry.is_point_in_circle,
        Godot.Core.Geometry.is_point_in_polygon,
        Godot.Core.Geometry.is_polygon_clockwise,
        Godot.Core.Geometry.line_intersects_line_2d,
        Godot.Core.Geometry.make_atlas,
        Godot.Core.Geometry.merge_polygons_2d,
        Godot.Core.Geometry.offset_polygon_2d,
        Godot.Core.Geometry.offset_polyline_2d,
        Godot.Core.Geometry.point_is_inside_triangle,
        Godot.Core.Geometry.ray_intersects_triangle,
        Godot.Core.Geometry.segment_intersects_circle,
        Godot.Core.Geometry.segment_intersects_convex,
        Godot.Core.Geometry.segment_intersects_cylinder,
        Godot.Core.Geometry.segment_intersects_segment_2d,
        Godot.Core.Geometry.segment_intersects_sphere,
        Godot.Core.Geometry.segment_intersects_triangle,
        Godot.Core.Geometry.triangulate_delaunay_2d,
        Godot.Core.Geometry.triangulate_polygon)
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

_END_POLYGON :: Int
_END_POLYGON = 0

_JOIN_ROUND :: Int
_JOIN_ROUND = 1

_OPERATION_XOR :: Int
_OPERATION_XOR = 3

_JOIN_MITER :: Int
_JOIN_MITER = 2

_END_JOINED :: Int
_END_JOINED = 1

_OPERATION_UNION :: Int
_OPERATION_UNION = 0

_JOIN_SQUARE :: Int
_JOIN_SQUARE = 0

_OPERATION_INTERSECTION :: Int
_OPERATION_INTERSECTION = 2

_END_BUTT :: Int
_END_BUTT = 2

_END_ROUND :: Int
_END_ROUND = 4

_OPERATION_DIFFERENCE :: Int
_OPERATION_DIFFERENCE = 1

_END_SQUARE :: Int
_END_SQUARE = 3

{-# NOINLINE bindGeometry_build_box_planes #-}

-- | Returns an array with 6 @Plane@s that describe the sides of a box centered at the origin. The box size is defined by @extents@, which represents one (positive) corner of the box (i.e. half its actual size).
bindGeometry_build_box_planes :: MethodBind
bindGeometry_build_box_planes
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "build_box_planes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with 6 @Plane@s that describe the sides of a box centered at the origin. The box size is defined by @extents@, which represents one (positive) corner of the box (i.e. half its actual size).
build_box_planes ::
                   (Geometry :< cls, Object :< cls) => cls -> Vector3 -> IO Array
build_box_planes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_build_box_planes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "build_box_planes" '[Vector3]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.build_box_planes

{-# NOINLINE bindGeometry_build_capsule_planes #-}

-- | Returns an array of @Plane@s closely bounding a faceted capsule centered at the origin with radius @radius@ and height @height@. The parameter @sides@ defines how many planes will be generated for the side part of the capsule, whereas @lats@ gives the number of latitudinal steps at the bottom and top of the capsule. The parameter @axis@ describes the axis along which the capsule is oriented (0 for X, 1 for Y, 2 for Z).
bindGeometry_build_capsule_planes :: MethodBind
bindGeometry_build_capsule_planes
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "build_capsule_planes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of @Plane@s closely bounding a faceted capsule centered at the origin with radius @radius@ and height @height@. The parameter @sides@ defines how many planes will be generated for the side part of the capsule, whereas @lats@ gives the number of latitudinal steps at the bottom and top of the capsule. The parameter @axis@ describes the axis along which the capsule is oriented (0 for X, 1 for Y, 2 for Z).
build_capsule_planes ::
                       (Geometry :< cls, Object :< cls) =>
                       cls -> Float -> Float -> Int -> Int -> Maybe Int -> IO Array
build_capsule_planes cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (2)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_build_capsule_planes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "build_capsule_planes"
           '[Float, Float, Int, Int, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.build_capsule_planes

{-# NOINLINE bindGeometry_build_cylinder_planes #-}

-- | Returns an array of @Plane@s closely bounding a faceted cylinder centered at the origin with radius @radius@ and height @height@. The parameter @sides@ defines how many planes will be generated for the round part of the cylinder. The parameter @axis@ describes the axis along which the cylinder is oriented (0 for X, 1 for Y, 2 for Z).
bindGeometry_build_cylinder_planes :: MethodBind
bindGeometry_build_cylinder_planes
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "build_cylinder_planes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of @Plane@s closely bounding a faceted cylinder centered at the origin with radius @radius@ and height @height@. The parameter @sides@ defines how many planes will be generated for the round part of the cylinder. The parameter @axis@ describes the axis along which the cylinder is oriented (0 for X, 1 for Y, 2 for Z).
build_cylinder_planes ::
                        (Geometry :< cls, Object :< cls) =>
                        cls -> Float -> Float -> Int -> Maybe Int -> IO Array
build_cylinder_planes cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantInt (2)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_build_cylinder_planes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "build_cylinder_planes"
           '[Float, Float, Int, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.build_cylinder_planes

{-# NOINLINE bindGeometry_clip_polygon #-}

-- | Clips the polygon defined by the points in @points@ against the @plane@ and returns the points of the clipped polygon.
bindGeometry_clip_polygon :: MethodBind
bindGeometry_clip_polygon
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "clip_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clips the polygon defined by the points in @points@ against the @plane@ and returns the points of the clipped polygon.
clip_polygon ::
               (Geometry :< cls, Object :< cls) =>
               cls -> PoolVector3Array -> Plane -> IO PoolVector3Array
clip_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_clip_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "clip_polygon"
           '[PoolVector3Array, Plane]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.clip_polygon

{-# NOINLINE bindGeometry_clip_polygons_2d #-}

-- | Clips @polygon_a@ against @polygon_b@ and returns an array of clipped polygons. This performs @OPERATION_DIFFERENCE@ between polygons. Returns an empty array if @polygon_b@ completely overlaps @polygon_a@.
--   				If @polygon_b@ is enclosed by @polygon_a@, returns an outer polygon (boundary) and inner polygon (hole) which could be distiguished by calling @method is_polygon_clockwise@.
bindGeometry_clip_polygons_2d :: MethodBind
bindGeometry_clip_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "clip_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clips @polygon_a@ against @polygon_b@ and returns an array of clipped polygons. This performs @OPERATION_DIFFERENCE@ between polygons. Returns an empty array if @polygon_b@ completely overlaps @polygon_a@.
--   				If @polygon_b@ is enclosed by @polygon_a@, returns an outer polygon (boundary) and inner polygon (hole) which could be distiguished by calling @method is_polygon_clockwise@.
clip_polygons_2d ::
                   (Geometry :< cls, Object :< cls) =>
                   cls -> PoolVector2Array -> PoolVector2Array -> IO Array
clip_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_clip_polygons_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "clip_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.clip_polygons_2d

{-# NOINLINE bindGeometry_clip_polyline_with_polygon_2d #-}

-- | Clips @polyline@ against @polygon@ and returns an array of clipped polylines. This performs @OPERATION_DIFFERENCE@ between the polyline and the polygon. This operation can be thought of as cutting a line with a closed shape.
bindGeometry_clip_polyline_with_polygon_2d :: MethodBind
bindGeometry_clip_polyline_with_polygon_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "clip_polyline_with_polygon_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clips @polyline@ against @polygon@ and returns an array of clipped polylines. This performs @OPERATION_DIFFERENCE@ between the polyline and the polygon. This operation can be thought of as cutting a line with a closed shape.
clip_polyline_with_polygon_2d ::
                                (Geometry :< cls, Object :< cls) =>
                                cls -> PoolVector2Array -> PoolVector2Array -> IO Array
clip_polyline_with_polygon_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_clip_polyline_with_polygon_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "clip_polyline_with_polygon_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.clip_polyline_with_polygon_2d

{-# NOINLINE bindGeometry_convex_hull_2d #-}

-- | Given an array of @Vector2@s, returns the convex hull as a list of points in counterclockwise order. The last point is the same as the first one.
bindGeometry_convex_hull_2d :: MethodBind
bindGeometry_convex_hull_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "convex_hull_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given an array of @Vector2@s, returns the convex hull as a list of points in counterclockwise order. The last point is the same as the first one.
convex_hull_2d ::
                 (Geometry :< cls, Object :< cls) =>
                 cls -> PoolVector2Array -> IO PoolVector2Array
convex_hull_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_convex_hull_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "convex_hull_2d" '[PoolVector2Array]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Geometry.convex_hull_2d

{-# NOINLINE bindGeometry_exclude_polygons_2d #-}

-- | Mutually excludes common area defined by intersection of @polygon_a@ and @polygon_b@ (see @method intersect_polygons_2d@) and returns an array of excluded polygons. This performs @OPERATION_XOR@ between polygons. In other words, returns all but common area between polygons.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distiguished by calling @method is_polygon_clockwise@.
bindGeometry_exclude_polygons_2d :: MethodBind
bindGeometry_exclude_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "exclude_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mutually excludes common area defined by intersection of @polygon_a@ and @polygon_b@ (see @method intersect_polygons_2d@) and returns an array of excluded polygons. This performs @OPERATION_XOR@ between polygons. In other words, returns all but common area between polygons.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distiguished by calling @method is_polygon_clockwise@.
exclude_polygons_2d ::
                      (Geometry :< cls, Object :< cls) =>
                      cls -> PoolVector2Array -> PoolVector2Array -> IO Array
exclude_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_exclude_polygons_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "exclude_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.exclude_polygons_2d

{-# NOINLINE bindGeometry_get_closest_point_to_segment #-}

-- | Returns the 3D point on the 3D segment (@s1@, @s2@) that is closest to @point@. The returned point will always be inside the specified segment.
bindGeometry_get_closest_point_to_segment :: MethodBind
bindGeometry_get_closest_point_to_segment
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 3D point on the 3D segment (@s1@, @s2@) that is closest to @point@. The returned point will always be inside the specified segment.
get_closest_point_to_segment ::
                               (Geometry :< cls, Object :< cls) =>
                               cls -> Vector3 -> Vector3 -> Vector3 -> IO Vector3
get_closest_point_to_segment cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_get_closest_point_to_segment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_closest_point_to_segment"
           '[Vector3, Vector3, Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Geometry.get_closest_point_to_segment

{-# NOINLINE bindGeometry_get_closest_point_to_segment_2d #-}

-- | Returns the 2D point on the 2D segment (@s1@, @s2@) that is closest to @point@. The returned point will always be inside the specified segment.
bindGeometry_get_closest_point_to_segment_2d :: MethodBind
bindGeometry_get_closest_point_to_segment_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 2D point on the 2D segment (@s1@, @s2@) that is closest to @point@. The returned point will always be inside the specified segment.
get_closest_point_to_segment_2d ::
                                  (Geometry :< cls, Object :< cls) =>
                                  cls -> Vector2 -> Vector2 -> Vector2 -> IO Vector2
get_closest_point_to_segment_2d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_get_closest_point_to_segment_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_closest_point_to_segment_2d"
           '[Vector2, Vector2, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Geometry.get_closest_point_to_segment_2d

{-# NOINLINE bindGeometry_get_closest_point_to_segment_uncapped #-}

-- | Returns the 3D point on the 3D line defined by (@s1@, @s2@) that is closest to @point@. The returned point can be inside the segment (@s1@, @s2@) or outside of it, i.e. somewhere on the line extending from the segment.
bindGeometry_get_closest_point_to_segment_uncapped :: MethodBind
bindGeometry_get_closest_point_to_segment_uncapped
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment_uncapped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 3D point on the 3D line defined by (@s1@, @s2@) that is closest to @point@. The returned point can be inside the segment (@s1@, @s2@) or outside of it, i.e. somewhere on the line extending from the segment.
get_closest_point_to_segment_uncapped ::
                                        (Geometry :< cls, Object :< cls) =>
                                        cls -> Vector3 -> Vector3 -> Vector3 -> IO Vector3
get_closest_point_to_segment_uncapped cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_point_to_segment_uncapped
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry
           "get_closest_point_to_segment_uncapped"
           '[Vector3, Vector3, Vector3]
           (IO Vector3)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_point_to_segment_uncapped

{-# NOINLINE bindGeometry_get_closest_point_to_segment_uncapped_2d
             #-}

-- | Returns the 2D point on the 2D line defined by (@s1@, @s2@) that is closest to @point@. The returned point can be inside the segment (@s1@, @s2@) or outside of it, i.e. somewhere on the line extending from the segment.
bindGeometry_get_closest_point_to_segment_uncapped_2d :: MethodBind
bindGeometry_get_closest_point_to_segment_uncapped_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment_uncapped_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 2D point on the 2D line defined by (@s1@, @s2@) that is closest to @point@. The returned point can be inside the segment (@s1@, @s2@) or outside of it, i.e. somewhere on the line extending from the segment.
get_closest_point_to_segment_uncapped_2d ::
                                           (Geometry :< cls, Object :< cls) =>
                                           cls -> Vector2 -> Vector2 -> Vector2 -> IO Vector2
get_closest_point_to_segment_uncapped_2d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_point_to_segment_uncapped_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry
           "get_closest_point_to_segment_uncapped_2d"
           '[Vector2, Vector2, Vector2]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_point_to_segment_uncapped_2d

{-# NOINLINE bindGeometry_get_closest_points_between_segments #-}

-- | Given the two 3D segments (@p1@, @p2@) and (@q1@, @q2@), finds those two points on the two segments that are closest to each other. Returns a @PoolVector3Array@ that contains this point on (@p1@, @p2@) as well the accompanying point on (@q1@, @q2@).
bindGeometry_get_closest_points_between_segments :: MethodBind
bindGeometry_get_closest_points_between_segments
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_points_between_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given the two 3D segments (@p1@, @p2@) and (@q1@, @q2@), finds those two points on the two segments that are closest to each other. Returns a @PoolVector3Array@ that contains this point on (@p1@, @p2@) as well the accompanying point on (@q1@, @q2@).
get_closest_points_between_segments ::
                                      (Geometry :< cls, Object :< cls) =>
                                      cls ->
                                        Vector3 ->
                                          Vector3 -> Vector3 -> Vector3 -> IO PoolVector3Array
get_closest_points_between_segments cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_points_between_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_closest_points_between_segments"
           '[Vector3, Vector3, Vector3, Vector3]
           (IO PoolVector3Array)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_points_between_segments

{-# NOINLINE bindGeometry_get_closest_points_between_segments_2d
             #-}

-- | Given the two 2D segments (@p1@, @p2@) and (@q1@, @q2@), finds those two points on the two segments that are closest to each other. Returns a @PoolVector2Array@ that contains this point on (@p1@, @p2@) as well the accompanying point on (@q1@, @q2@).
bindGeometry_get_closest_points_between_segments_2d :: MethodBind
bindGeometry_get_closest_points_between_segments_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_closest_points_between_segments_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given the two 2D segments (@p1@, @p2@) and (@q1@, @q2@), finds those two points on the two segments that are closest to each other. Returns a @PoolVector2Array@ that contains this point on (@p1@, @p2@) as well the accompanying point on (@q1@, @q2@).
get_closest_points_between_segments_2d ::
                                         (Geometry :< cls, Object :< cls) =>
                                         cls ->
                                           Vector2 ->
                                             Vector2 -> Vector2 -> Vector2 -> IO PoolVector2Array
get_closest_points_between_segments_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_get_closest_points_between_segments_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry
           "get_closest_points_between_segments_2d"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO PoolVector2Array)
         where
        nodeMethod
          = Godot.Core.Geometry.get_closest_points_between_segments_2d

{-# NOINLINE bindGeometry_get_uv84_normal_bit #-}

-- | Used internally by the engine.
bindGeometry_get_uv84_normal_bit :: MethodBind
bindGeometry_get_uv84_normal_bit
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "get_uv84_normal_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used internally by the engine.
get_uv84_normal_bit ::
                      (Geometry :< cls, Object :< cls) => cls -> Vector3 -> IO Int
get_uv84_normal_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_get_uv84_normal_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "get_uv84_normal_bit" '[Vector3]
           (IO Int)
         where
        nodeMethod = Godot.Core.Geometry.get_uv84_normal_bit

{-# NOINLINE bindGeometry_intersect_polygons_2d #-}

-- | Intersects @polygon_a@ with @polygon_b@ and returns an array of intersected polygons. This performs @OPERATION_INTERSECTION@ between polygons. In other words, returns common area shared by polygons. Returns an empty array if no intersection occurs.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
bindGeometry_intersect_polygons_2d :: MethodBind
bindGeometry_intersect_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "intersect_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Intersects @polygon_a@ with @polygon_b@ and returns an array of intersected polygons. This performs @OPERATION_INTERSECTION@ between polygons. In other words, returns common area shared by polygons. Returns an empty array if no intersection occurs.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
intersect_polygons_2d ::
                        (Geometry :< cls, Object :< cls) =>
                        cls -> PoolVector2Array -> PoolVector2Array -> IO Array
intersect_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_intersect_polygons_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "intersect_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.intersect_polygons_2d

{-# NOINLINE bindGeometry_intersect_polyline_with_polygon_2d #-}

-- | Intersects @polyline@ with @polygon@ and returns an array of intersected polylines. This performs @OPERATION_INTERSECTION@ between the polyline and the polygon. This operation can be thought of as chopping a line with a closed shape.
bindGeometry_intersect_polyline_with_polygon_2d :: MethodBind
bindGeometry_intersect_polyline_with_polygon_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "intersect_polyline_with_polygon_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Intersects @polyline@ with @polygon@ and returns an array of intersected polylines. This performs @OPERATION_INTERSECTION@ between the polyline and the polygon. This operation can be thought of as chopping a line with a closed shape.
intersect_polyline_with_polygon_2d ::
                                     (Geometry :< cls, Object :< cls) =>
                                     cls -> PoolVector2Array -> PoolVector2Array -> IO Array
intersect_polyline_with_polygon_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometry_intersect_polyline_with_polygon_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "intersect_polyline_with_polygon_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.intersect_polyline_with_polygon_2d

{-# NOINLINE bindGeometry_is_point_in_circle #-}

-- | Returns @true@ if @point@ is inside the circle or if it's located exactly @i@on@/i@ the circle's boundary, otherwise returns @false@.
bindGeometry_is_point_in_circle :: MethodBind
bindGeometry_is_point_in_circle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "is_point_in_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @point@ is inside the circle or if it's located exactly @i@on@/i@ the circle's boundary, otherwise returns @false@.
is_point_in_circle ::
                     (Geometry :< cls, Object :< cls) =>
                     cls -> Vector2 -> Vector2 -> Float -> IO Bool
is_point_in_circle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_is_point_in_circle (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "is_point_in_circle"
           '[Vector2, Vector2, Float]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.is_point_in_circle

{-# NOINLINE bindGeometry_is_point_in_polygon #-}

-- | Returns @true@ if @point@ is inside @polygon@ or if it's located exactly @i@on@/i@ polygon's boundary, otherwise returns @false@.
bindGeometry_is_point_in_polygon :: MethodBind
bindGeometry_is_point_in_polygon
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "is_point_in_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @point@ is inside @polygon@ or if it's located exactly @i@on@/i@ polygon's boundary, otherwise returns @false@.
is_point_in_polygon ::
                      (Geometry :< cls, Object :< cls) =>
                      cls -> Vector2 -> PoolVector2Array -> IO Bool
is_point_in_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_is_point_in_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "is_point_in_polygon"
           '[Vector2, PoolVector2Array]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.is_point_in_polygon

{-# NOINLINE bindGeometry_is_polygon_clockwise #-}

-- | Returns @true@ if @polygon@'s vertices are ordered in clockwise order, otherwise returns @false@.
bindGeometry_is_polygon_clockwise :: MethodBind
bindGeometry_is_polygon_clockwise
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "is_polygon_clockwise" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @polygon@'s vertices are ordered in clockwise order, otherwise returns @false@.
is_polygon_clockwise ::
                       (Geometry :< cls, Object :< cls) =>
                       cls -> PoolVector2Array -> IO Bool
is_polygon_clockwise cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_is_polygon_clockwise
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "is_polygon_clockwise"
           '[PoolVector2Array]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.is_polygon_clockwise

{-# NOINLINE bindGeometry_line_intersects_line_2d #-}

-- | Checks if the two lines (@from_a@, @dir_a@) and (@from_b@, @dir_b@) intersect. If yes, return the point of intersection as @Vector2@. If no intersection takes place, returns an empty @Variant@.
--   				__Note:__ The lines are specified using direction vectors, not end points.
bindGeometry_line_intersects_line_2d :: MethodBind
bindGeometry_line_intersects_line_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "line_intersects_line_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks if the two lines (@from_a@, @dir_a@) and (@from_b@, @dir_b@) intersect. If yes, return the point of intersection as @Vector2@. If no intersection takes place, returns an empty @Variant@.
--   				__Note:__ The lines are specified using direction vectors, not end points.
line_intersects_line_2d ::
                          (Geometry :< cls, Object :< cls) =>
                          cls -> Vector2 -> Vector2 -> Vector2 -> Vector2 -> IO GodotVariant
line_intersects_line_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_line_intersects_line_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "line_intersects_line_2d"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.line_intersects_line_2d

{-# NOINLINE bindGeometry_make_atlas #-}

-- | Given an array of @Vector2@s representing tiles, builds an atlas. The returned dictionary has two keys: @points@ is a vector of @Vector2@ that specifies the positions of each tile, @size@ contains the overall size of the whole atlas as @Vector2@.
bindGeometry_make_atlas :: MethodBind
bindGeometry_make_atlas
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "make_atlas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given an array of @Vector2@s representing tiles, builds an atlas. The returned dictionary has two keys: @points@ is a vector of @Vector2@ that specifies the positions of each tile, @size@ contains the overall size of the whole atlas as @Vector2@.
make_atlas ::
             (Geometry :< cls, Object :< cls) =>
             cls -> PoolVector2Array -> IO Dictionary
make_atlas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_make_atlas (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "make_atlas" '[PoolVector2Array]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.Geometry.make_atlas

{-# NOINLINE bindGeometry_merge_polygons_2d #-}

-- | Merges (combines) @polygon_a@ and @polygon_b@ and returns an array of merged polygons. This performs @OPERATION_UNION@ between polygons.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
bindGeometry_merge_polygons_2d :: MethodBind
bindGeometry_merge_polygons_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "merge_polygons_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Merges (combines) @polygon_a@ and @polygon_b@ and returns an array of merged polygons. This performs @OPERATION_UNION@ between polygons.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
merge_polygons_2d ::
                    (Geometry :< cls, Object :< cls) =>
                    cls -> PoolVector2Array -> PoolVector2Array -> IO Array
merge_polygons_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_merge_polygons_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "merge_polygons_2d"
           '[PoolVector2Array, PoolVector2Array]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.merge_polygons_2d

{-# NOINLINE bindGeometry_offset_polygon_2d #-}

-- | Inflates or deflates @polygon@ by @delta@ units (pixels). If @delta@ is positive, makes the polygon grow outward. If @delta@ is negative, shrinks the polygon inward. Returns an array of polygons because inflating/deflating may result in multiple discrete polygons. Returns an empty array if @delta@ is negative and the absolute value of it approximately exceeds the minimum bounding rectangle dimensions of the polygon.
--   				Each polygon's vertices will be rounded as determined by @join_type@, see @enum PolyJoinType@.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
--   				__Note:__ To translate the polygon's vertices specifically, use the @method Transform2D.xform@ method:
--   				
--   @
--   
--   				var polygon = PoolVector2Array(@Vector2(0, 0), Vector2(100, 0), Vector2(100, 100), Vector2(0, 100)@)
--   				var offset = Vector2(50, 50)
--   				polygon = Transform2D(0, offset).xform(polygon)
--   				print(polygon) # prints @Vector2(50, 50), Vector2(150, 50), Vector2(150, 150), Vector2(50, 150)@
--   				
--   @
bindGeometry_offset_polygon_2d :: MethodBind
bindGeometry_offset_polygon_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "offset_polygon_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Inflates or deflates @polygon@ by @delta@ units (pixels). If @delta@ is positive, makes the polygon grow outward. If @delta@ is negative, shrinks the polygon inward. Returns an array of polygons because inflating/deflating may result in multiple discrete polygons. Returns an empty array if @delta@ is negative and the absolute value of it approximately exceeds the minimum bounding rectangle dimensions of the polygon.
--   				Each polygon's vertices will be rounded as determined by @join_type@, see @enum PolyJoinType@.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
--   				__Note:__ To translate the polygon's vertices specifically, use the @method Transform2D.xform@ method:
--   				
--   @
--   
--   				var polygon = PoolVector2Array(@Vector2(0, 0), Vector2(100, 0), Vector2(100, 100), Vector2(0, 100)@)
--   				var offset = Vector2(50, 50)
--   				polygon = Transform2D(0, offset).xform(polygon)
--   				print(polygon) # prints @Vector2(50, 50), Vector2(150, 50), Vector2(150, 150), Vector2(50, 150)@
--   				
--   @
offset_polygon_2d ::
                    (Geometry :< cls, Object :< cls) =>
                    cls -> PoolVector2Array -> Float -> Maybe Int -> IO Array
offset_polygon_2d cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_offset_polygon_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "offset_polygon_2d"
           '[PoolVector2Array, Float, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.offset_polygon_2d

{-# NOINLINE bindGeometry_offset_polyline_2d #-}

-- | Inflates or deflates @polyline@ by @delta@ units (pixels), producing polygons. If @delta@ is positive, makes the polyline grow outward. Returns an array of polygons because inflating/deflating may result in multiple discrete polygons. If @delta@ is negative, returns an empty array.
--   				Each polygon's vertices will be rounded as determined by @join_type@, see @enum PolyJoinType@.
--   				Each polygon's endpoints will be rounded as determined by @end_type@, see @enum PolyEndType@.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
bindGeometry_offset_polyline_2d :: MethodBind
bindGeometry_offset_polyline_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "offset_polyline_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Inflates or deflates @polyline@ by @delta@ units (pixels), producing polygons. If @delta@ is positive, makes the polyline grow outward. Returns an array of polygons because inflating/deflating may result in multiple discrete polygons. If @delta@ is negative, returns an empty array.
--   				Each polygon's vertices will be rounded as determined by @join_type@, see @enum PolyJoinType@.
--   				Each polygon's endpoints will be rounded as determined by @end_type@, see @enum PolyEndType@.
--   				The operation may result in an outer polygon (boundary) and inner polygon (hole) produced which could be distinguished by calling @method is_polygon_clockwise@.
offset_polyline_2d ::
                     (Geometry :< cls, Object :< cls) =>
                     cls ->
                       PoolVector2Array -> Float -> Maybe Int -> Maybe Int -> IO Array
offset_polyline_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3,
       maybe (VariantInt (3)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_offset_polyline_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "offset_polyline_2d"
           '[PoolVector2Array, Float, Maybe Int, Maybe Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Geometry.offset_polyline_2d

{-# NOINLINE bindGeometry_point_is_inside_triangle #-}

-- | Returns if @point@ is inside the triangle specified by @a@, @b@ and @c@.
bindGeometry_point_is_inside_triangle :: MethodBind
bindGeometry_point_is_inside_triangle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "point_is_inside_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns if @point@ is inside the triangle specified by @a@, @b@ and @c@.
point_is_inside_triangle ::
                           (Geometry :< cls, Object :< cls) =>
                           cls -> Vector2 -> Vector2 -> Vector2 -> Vector2 -> IO Bool
point_is_inside_triangle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_point_is_inside_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "point_is_inside_triangle"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Geometry.point_is_inside_triangle

{-# NOINLINE bindGeometry_ray_intersects_triangle #-}

-- | Tests if the 3D ray starting at @from@ with the direction of @dir@ intersects the triangle specified by @a@, @b@ and @c@. If yes, returns the point of intersection as @Vector3@. If no intersection takes place, an empty @Variant@ is returned.
bindGeometry_ray_intersects_triangle :: MethodBind
bindGeometry_ray_intersects_triangle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "ray_intersects_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tests if the 3D ray starting at @from@ with the direction of @dir@ intersects the triangle specified by @a@, @b@ and @c@. If yes, returns the point of intersection as @Vector3@. If no intersection takes place, an empty @Variant@ is returned.
ray_intersects_triangle ::
                          (Geometry :< cls, Object :< cls) =>
                          cls ->
                            Vector3 ->
                              Vector3 -> Vector3 -> Vector3 -> Vector3 -> IO GodotVariant
ray_intersects_triangle cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_ray_intersects_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "ray_intersects_triangle"
           '[Vector3, Vector3, Vector3, Vector3, Vector3]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.ray_intersects_triangle

{-# NOINLINE bindGeometry_segment_intersects_circle #-}

-- | Given the 2D segment (@segment_from@, @segment_to@), returns the position on the segment (as a number between 0 and 1) at which the segment hits the circle that is located at position @circle_position@ and has radius @circle_radius@. If the segment does not intersect the circle, -1 is returned (this is also the case if the line extending the segment would intersect the circle, but the segment does not).
bindGeometry_segment_intersects_circle :: MethodBind
bindGeometry_segment_intersects_circle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given the 2D segment (@segment_from@, @segment_to@), returns the position on the segment (as a number between 0 and 1) at which the segment hits the circle that is located at position @circle_position@ and has radius @circle_radius@. If the segment does not intersect the circle, -1 is returned (this is also the case if the line extending the segment would intersect the circle, but the segment does not).
segment_intersects_circle ::
                            (Geometry :< cls, Object :< cls) =>
                            cls -> Vector2 -> Vector2 -> Vector2 -> Float -> IO Float
segment_intersects_circle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_circle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_circle"
           '[Vector2, Vector2, Vector2, Float]
           (IO Float)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_circle

{-# NOINLINE bindGeometry_segment_intersects_convex #-}

-- | Given a convex hull defined though the @Plane@s in the array @planes@, tests if the segment (@from@, @to@) intersects with that hull. If an intersection is found, returns a @PoolVector3Array@ containing the point the intersection and the hull's normal. If no intersecion is found, an the returned array is empty.
bindGeometry_segment_intersects_convex :: MethodBind
bindGeometry_segment_intersects_convex
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_convex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given a convex hull defined though the @Plane@s in the array @planes@, tests if the segment (@from@, @to@) intersects with that hull. If an intersection is found, returns a @PoolVector3Array@ containing the point the intersection and the hull's normal. If no intersecion is found, an the returned array is empty.
segment_intersects_convex ::
                            (Geometry :< cls, Object :< cls) =>
                            cls -> Vector3 -> Vector3 -> Array -> IO PoolVector3Array
segment_intersects_convex cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_convex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_convex"
           '[Vector3, Vector3, Array]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_convex

{-# NOINLINE bindGeometry_segment_intersects_cylinder #-}

-- | Checks if the segment (@from@, @to@) intersects the cylinder with height @height@ that is centered at the origin and has radius @radius@. If no, returns an empty @PoolVector3Array@. If an intersection takes place, the returned array contains the point of intersection and the cylinder's normal at the point of intersection.
bindGeometry_segment_intersects_cylinder :: MethodBind
bindGeometry_segment_intersects_cylinder
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_cylinder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks if the segment (@from@, @to@) intersects the cylinder with height @height@ that is centered at the origin and has radius @radius@. If no, returns an empty @PoolVector3Array@. If an intersection takes place, the returned array contains the point of intersection and the cylinder's normal at the point of intersection.
segment_intersects_cylinder ::
                              (Geometry :< cls, Object :< cls) =>
                              cls -> Vector3 -> Vector3 -> Float -> Float -> IO PoolVector3Array
segment_intersects_cylinder cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_cylinder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_cylinder"
           '[Vector3, Vector3, Float, Float]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_cylinder

{-# NOINLINE bindGeometry_segment_intersects_segment_2d #-}

-- | Checks if the two segments (@from_a@, @to_a@) and (@from_b@, @to_b@) intersect. If yes, return the point of intersection as @Vector2@. If no intersection takes place, returns an empty @Variant@.
bindGeometry_segment_intersects_segment_2d :: MethodBind
bindGeometry_segment_intersects_segment_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_segment_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks if the two segments (@from_a@, @to_a@) and (@from_b@, @to_b@) intersect. If yes, return the point of intersection as @Vector2@. If no intersection takes place, returns an empty @Variant@.
segment_intersects_segment_2d ::
                                (Geometry :< cls, Object :< cls) =>
                                cls -> Vector2 -> Vector2 -> Vector2 -> Vector2 -> IO GodotVariant
segment_intersects_segment_2d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_segment_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_segment_2d"
           '[Vector2, Vector2, Vector2, Vector2]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_segment_2d

{-# NOINLINE bindGeometry_segment_intersects_sphere #-}

-- | Checks if the segment (@from@, @to@) intersects the sphere that is located at @sphere_position@ and has radius @sphere_radius@. If no, returns an empty @PoolVector3Array@. If yes, returns a @PoolVector3Array@ containing the point of intersection and the sphere's normal at the point of intersection.
bindGeometry_segment_intersects_sphere :: MethodBind
bindGeometry_segment_intersects_sphere
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_sphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks if the segment (@from@, @to@) intersects the sphere that is located at @sphere_position@ and has radius @sphere_radius@. If no, returns an empty @PoolVector3Array@. If yes, returns a @PoolVector3Array@ containing the point of intersection and the sphere's normal at the point of intersection.
segment_intersects_sphere ::
                            (Geometry :< cls, Object :< cls) =>
                            cls ->
                              Vector3 -> Vector3 -> Vector3 -> Float -> IO PoolVector3Array
segment_intersects_sphere cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_sphere
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_sphere"
           '[Vector3, Vector3, Vector3, Float]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_sphere

{-# NOINLINE bindGeometry_segment_intersects_triangle #-}

-- | Tests if the segment (@from@, @to@) intersects the triangle @a@, @b@, @c@. If yes, returns the point of intersection as @Vector3@. If no intersection takes place, an empty @Variant@ is returned.
bindGeometry_segment_intersects_triangle :: MethodBind
bindGeometry_segment_intersects_triangle
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "segment_intersects_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tests if the segment (@from@, @to@) intersects the triangle @a@, @b@, @c@. If yes, returns the point of intersection as @Vector3@. If no intersection takes place, an empty @Variant@ is returned.
segment_intersects_triangle ::
                              (Geometry :< cls, Object :< cls) =>
                              cls ->
                                Vector3 ->
                                  Vector3 -> Vector3 -> Vector3 -> Vector3 -> IO GodotVariant
segment_intersects_triangle cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_segment_intersects_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "segment_intersects_triangle"
           '[Vector3, Vector3, Vector3, Vector3, Vector3]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Geometry.segment_intersects_triangle

{-# NOINLINE bindGeometry_triangulate_delaunay_2d #-}

-- | Triangulates the area specified by discrete set of @points@ such that no point is inside the circumcircle of any resulting triangle. Returns a @PoolIntArray@ where each triangle consists of three consecutive point indices into @points@ (i.e. the returned array will have @n * 3@ elements, with @n@ being the number of found triangles). If the triangulation did not succeed, an empty @PoolIntArray@ is returned.
bindGeometry_triangulate_delaunay_2d :: MethodBind
bindGeometry_triangulate_delaunay_2d
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "triangulate_delaunay_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Triangulates the area specified by discrete set of @points@ such that no point is inside the circumcircle of any resulting triangle. Returns a @PoolIntArray@ where each triangle consists of three consecutive point indices into @points@ (i.e. the returned array will have @n * 3@ elements, with @n@ being the number of found triangles). If the triangulation did not succeed, an empty @PoolIntArray@ is returned.
triangulate_delaunay_2d ::
                          (Geometry :< cls, Object :< cls) =>
                          cls -> PoolVector2Array -> IO PoolIntArray
triangulate_delaunay_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_triangulate_delaunay_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "triangulate_delaunay_2d"
           '[PoolVector2Array]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.Geometry.triangulate_delaunay_2d

{-# NOINLINE bindGeometry_triangulate_polygon #-}

-- | Triangulates the polygon specified by the points in @polygon@. Returns a @PoolIntArray@ where each triangle consists of three consecutive point indices into @polygon@ (i.e. the returned array will have @n * 3@ elements, with @n@ being the number of found triangles). If the triangulation did not succeed, an empty @PoolIntArray@ is returned.
bindGeometry_triangulate_polygon :: MethodBind
bindGeometry_triangulate_polygon
  = unsafePerformIO $
      withCString "_Geometry" $
        \ clsNamePtr ->
          withCString "triangulate_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Triangulates the polygon specified by the points in @polygon@. Returns a @PoolIntArray@ where each triangle consists of three consecutive point indices into @polygon@ (i.e. the returned array will have @n * 3@ elements, with @n@ being the number of found triangles). If the triangulation did not succeed, an empty @PoolIntArray@ is returned.
triangulate_polygon ::
                      (Geometry :< cls, Object :< cls) =>
                      cls -> PoolVector2Array -> IO PoolIntArray
triangulate_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometry_triangulate_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Geometry "triangulate_polygon"
           '[PoolVector2Array]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.Geometry.triangulate_polygon