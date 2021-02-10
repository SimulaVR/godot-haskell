{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Curve3D
       (Godot.Core.Curve3D._get_data, Godot.Core.Curve3D._set_data,
        Godot.Core.Curve3D.add_point, Godot.Core.Curve3D.clear_points,
        Godot.Core.Curve3D.get_bake_interval,
        Godot.Core.Curve3D.get_baked_length,
        Godot.Core.Curve3D.get_baked_points,
        Godot.Core.Curve3D.get_baked_tilts,
        Godot.Core.Curve3D.get_baked_up_vectors,
        Godot.Core.Curve3D.get_closest_offset,
        Godot.Core.Curve3D.get_closest_point,
        Godot.Core.Curve3D.get_point_count,
        Godot.Core.Curve3D.get_point_in, Godot.Core.Curve3D.get_point_out,
        Godot.Core.Curve3D.get_point_position,
        Godot.Core.Curve3D.get_point_tilt, Godot.Core.Curve3D.interpolate,
        Godot.Core.Curve3D.interpolate_baked,
        Godot.Core.Curve3D.interpolate_baked_up_vector,
        Godot.Core.Curve3D.interpolatef,
        Godot.Core.Curve3D.is_up_vector_enabled,
        Godot.Core.Curve3D.remove_point,
        Godot.Core.Curve3D.set_bake_interval,
        Godot.Core.Curve3D.set_point_in, Godot.Core.Curve3D.set_point_out,
        Godot.Core.Curve3D.set_point_position,
        Godot.Core.Curve3D.set_point_tilt,
        Godot.Core.Curve3D.set_up_vector_enabled,
        Godot.Core.Curve3D.tessellate)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCurve3D__get_data #-}

bindCurve3D__get_data :: MethodBind
bindCurve3D__get_data
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (Curve3D :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D__get_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D__set_data #-}

bindCurve3D__set_data :: MethodBind
bindCurve3D__set_data
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (Curve3D :< cls, Object :< cls) => cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D__set_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_add_point #-}

-- | Adds a point to a curve at [code]position[/code], with control points [code]in[/code] and [code]out[/code].
--   				If [code]at_position[/code] is given, the point is inserted before the point number [code]at_position[/code], moving that point (and every point after) after the inserted point. If [code]at_position[/code] is not given, or is an illegal value ([code]at_position <0[/code] or [code]at_position >= [method get_point_count][/code]), the point will be appended at the end of the point list.
bindCurve3D_add_point :: MethodBind
bindCurve3D_add_point
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a point to a curve at [code]position[/code], with control points [code]in[/code] and [code]out[/code].
--   				If [code]at_position[/code] is given, the point is inserted before the point number [code]at_position[/code], moving that point (and every point after) after the inserted point. If [code]at_position[/code] is not given, or is an illegal value ([code]at_position <0[/code] or [code]at_position >= [method get_point_count][/code]), the point will be appended at the end of the point list.
add_point ::
            (Curve3D :< cls, Object :< cls) =>
            cls -> Vector3 -> Vector3 -> Vector3 -> Int -> IO ()
add_point cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_add_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_clear_points #-}

-- | Removes all points from the curve.
bindCurve3D_clear_points :: MethodBind
bindCurve3D_clear_points
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "clear_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all points from the curve.
clear_points :: (Curve3D :< cls, Object :< cls) => cls -> IO ()
clear_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_clear_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_bake_interval #-}

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the [method get_baked_points] or [method get_baked_length] function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
bindCurve3D_get_bake_interval :: MethodBind
bindCurve3D_get_bake_interval
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_bake_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the [method get_baked_points] or [method get_baked_length] function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
get_bake_interval ::
                    (Curve3D :< cls, Object :< cls) => cls -> IO Float
get_bake_interval cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_bake_interval (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_baked_length #-}

-- | Returns the total length of the curve, based on the cached points. Given enough density (see [member bake_interval]), it should be approximate enough.
bindCurve3D_get_baked_length :: MethodBind
bindCurve3D_get_baked_length
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total length of the curve, based on the cached points. Given enough density (see [member bake_interval]), it should be approximate enough.
get_baked_length ::
                   (Curve3D :< cls, Object :< cls) => cls -> IO Float
get_baked_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_baked_points #-}

-- | Returns the cache of points as a [PoolVector3Array].
bindCurve3D_get_baked_points :: MethodBind
bindCurve3D_get_baked_points
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of points as a [PoolVector3Array].
get_baked_points ::
                   (Curve3D :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_baked_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_baked_tilts #-}

-- | Returns the cache of tilts as a [PoolRealArray].
bindCurve3D_get_baked_tilts :: MethodBind
bindCurve3D_get_baked_tilts
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_tilts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of tilts as a [PoolRealArray].
get_baked_tilts ::
                  (Curve3D :< cls, Object :< cls) => cls -> IO PoolRealArray
get_baked_tilts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_tilts (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_baked_up_vectors #-}

-- | Returns the cache of up vectors as a [PoolVector3Array].
--   				If [member up_vector_enabled] is [code]false[/code], the cache will be empty.
bindCurve3D_get_baked_up_vectors :: MethodBind
bindCurve3D_get_baked_up_vectors
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_up_vectors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of up vectors as a [PoolVector3Array].
--   				If [member up_vector_enabled] is [code]false[/code], the cache will be empty.
get_baked_up_vectors ::
                       (Curve3D :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_baked_up_vectors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_up_vectors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_closest_offset #-}

-- | Returns the closest offset to [code]to_point[/code]. This offset is meant to be used in [method interpolate_baked] or [method interpolate_baked_up_vector].
--   				[code]to_point[/code] must be in this curve's local space.
bindCurve3D_get_closest_offset :: MethodBind
bindCurve3D_get_closest_offset
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_closest_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest offset to [code]to_point[/code]. This offset is meant to be used in [method interpolate_baked] or [method interpolate_baked_up_vector].
--   				[code]to_point[/code] must be in this curve's local space.
get_closest_offset ::
                     (Curve3D :< cls, Object :< cls) => cls -> Vector3 -> IO Float
get_closest_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_closest_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_closest_point #-}

-- | Returns the closest point (in curve's local space) to [code]to_point[/code].
--   				[code]to_point[/code] must be in this curve's local space.
bindCurve3D_get_closest_point :: MethodBind
bindCurve3D_get_closest_point
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest point (in curve's local space) to [code]to_point[/code].
--   				[code]to_point[/code] must be in this curve's local space.
get_closest_point ::
                    (Curve3D :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_point_count #-}

-- | Returns the number of points describing the curve.
bindCurve3D_get_point_count :: MethodBind
bindCurve3D_get_point_count
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of points describing the curve.
get_point_count :: (Curve3D :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_point_in #-}

-- | Returns the position of the control point leading to the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
bindCurve3D_get_point_in :: MethodBind
bindCurve3D_get_point_in
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the control point leading to the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
get_point_in ::
               (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_in cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_in (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_point_out #-}

-- | Returns the position of the control point leading out of the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
bindCurve3D_get_point_out :: MethodBind
bindCurve3D_get_point_out
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the control point leading out of the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
get_point_out ::
                (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_out cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_out (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_point_position #-}

-- | Returns the position of the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
bindCurve3D_get_point_position :: MethodBind
bindCurve3D_get_point_position
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
get_point_position ::
                     (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_get_point_tilt #-}

-- | Returns the tilt angle in radians for the point [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code]0[/code].
bindCurve3D_get_point_tilt :: MethodBind
bindCurve3D_get_point_tilt
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tilt angle in radians for the point [code]idx[/code]. If the index is out of bounds, the function sends an error to the console, and returns [code]0[/code].
get_point_tilt ::
                 (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_tilt cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_tilt (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_interpolate #-}

-- | Returns the position between the vertex [code]idx[/code] and the vertex [code]idx + 1[/code], where [code]t[/code] controls if the point is the first vertex ([code]t = 0.0[/code]), the last vertex ([code]t = 1.0[/code]), or in between. Values of [code]t[/code] outside the range ([code]0.0 >= t <=1[/code]) give strange, but predictable results.
--   				If [code]idx[/code] is out of bounds it is truncated to the first or last vertex, and [code]t[/code] is ignored. If the curve has no points, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
bindCurve3D_interpolate :: MethodBind
bindCurve3D_interpolate
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position between the vertex [code]idx[/code] and the vertex [code]idx + 1[/code], where [code]t[/code] controls if the point is the first vertex ([code]t = 0.0[/code]), the last vertex ([code]t = 1.0[/code]), or in between. Values of [code]t[/code] outside the range ([code]0.0 >= t <=1[/code]) give strange, but predictable results.
--   				If [code]idx[/code] is out of bounds it is truncated to the first or last vertex, and [code]t[/code] is ignored. If the curve has no points, the function sends an error to the console, and returns [code](0, 0, 0)[/code].
interpolate ::
              (Curve3D :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO Vector3
interpolate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_interpolate_baked #-}

-- | Returns a point within the curve at position [code]offset[/code], where [code]offset[/code] is measured as a pixel distance along the curve.
--   				To do that, it finds the two cached points where the [code]offset[/code] lies between, then interpolates the values. This interpolation is cubic if [code]cubic[/code] is set to [code]true[/code], or linear if set to [code]false[/code].
--   				Cubic interpolation tends to follow the curves better, but linear is faster (and often, precise enough).
bindCurve3D_interpolate_baked :: MethodBind
bindCurve3D_interpolate_baked
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolate_baked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a point within the curve at position [code]offset[/code], where [code]offset[/code] is measured as a pixel distance along the curve.
--   				To do that, it finds the two cached points where the [code]offset[/code] lies between, then interpolates the values. This interpolation is cubic if [code]cubic[/code] is set to [code]true[/code], or linear if set to [code]false[/code].
--   				Cubic interpolation tends to follow the curves better, but linear is faster (and often, precise enough).
interpolate_baked ::
                    (Curve3D :< cls, Object :< cls) =>
                    cls -> Float -> Bool -> IO Vector3
interpolate_baked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolate_baked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_interpolate_baked_up_vector #-}

-- | Returns an up vector within the curve at position [code]offset[/code], where [code]offset[/code] is measured as a distance in 3D units along the curve.
--   				To do that, it finds the two cached up vectors where the [code]offset[/code] lies between, then interpolates the values. If [code]apply_tilt[/code] is [code]true[/code], an interpolated tilt is applied to the interpolated up vector.
--   				If the curve has no up vectors, the function sends an error to the console, and returns [code](0, 1, 0)[/code].
bindCurve3D_interpolate_baked_up_vector :: MethodBind
bindCurve3D_interpolate_baked_up_vector
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolate_baked_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an up vector within the curve at position [code]offset[/code], where [code]offset[/code] is measured as a distance in 3D units along the curve.
--   				To do that, it finds the two cached up vectors where the [code]offset[/code] lies between, then interpolates the values. If [code]apply_tilt[/code] is [code]true[/code], an interpolated tilt is applied to the interpolated up vector.
--   				If the curve has no up vectors, the function sends an error to the console, and returns [code](0, 1, 0)[/code].
interpolate_baked_up_vector ::
                              (Curve3D :< cls, Object :< cls) =>
                              cls -> Float -> Bool -> IO Vector3
interpolate_baked_up_vector cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolate_baked_up_vector
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_interpolatef #-}

-- | Returns the position at the vertex [code]fofs[/code]. It calls [method interpolate] using the integer part of [code]fofs[/code] as [code]idx[/code], and its fractional part as [code]t[/code].
bindCurve3D_interpolatef :: MethodBind
bindCurve3D_interpolatef
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolatef" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position at the vertex [code]fofs[/code]. It calls [method interpolate] using the integer part of [code]fofs[/code] as [code]idx[/code], and its fractional part as [code]t[/code].
interpolatef ::
               (Curve3D :< cls, Object :< cls) => cls -> Float -> IO Vector3
interpolatef cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolatef (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_is_up_vector_enabled #-}

-- | If [code]true[/code], the curve will bake up vectors used for orientation. This is used when [member PathFollow.rotation_mode] is set to [constant PathFollow.ROTATION_ORIENTED]. Changing it forces the cache to be recomputed.
bindCurve3D_is_up_vector_enabled :: MethodBind
bindCurve3D_is_up_vector_enabled
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "is_up_vector_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the curve will bake up vectors used for orientation. This is used when [member PathFollow.rotation_mode] is set to [constant PathFollow.ROTATION_ORIENTED]. Changing it forces the cache to be recomputed.
is_up_vector_enabled ::
                       (Curve3D :< cls, Object :< cls) => cls -> IO Bool
is_up_vector_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_is_up_vector_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_remove_point #-}

-- | Deletes the point [code]idx[/code] from the curve. Sends an error to the console if [code]idx[/code] is out of bounds.
bindCurve3D_remove_point :: MethodBind
bindCurve3D_remove_point
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the point [code]idx[/code] from the curve. Sends an error to the console if [code]idx[/code] is out of bounds.
remove_point ::
               (Curve3D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_set_bake_interval #-}

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the [method get_baked_points] or [method get_baked_length] function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
bindCurve3D_set_bake_interval :: MethodBind
bindCurve3D_set_bake_interval
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_bake_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the [method get_baked_points] or [method get_baked_length] function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
set_bake_interval ::
                    (Curve3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bake_interval cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_bake_interval (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_set_point_in #-}

-- | Sets the position of the control point leading to the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
bindCurve3D_set_point_in :: MethodBind
bindCurve3D_set_point_in
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the control point leading to the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
set_point_in ::
               (Curve3D :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_in cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_in (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_set_point_out #-}

-- | Sets the position of the control point leading out of the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
bindCurve3D_set_point_out :: MethodBind
bindCurve3D_set_point_out
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the control point leading out of the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
set_point_out ::
                (Curve3D :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_out cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_out (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_set_point_position #-}

-- | Sets the position for the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
bindCurve3D_set_point_position :: MethodBind
bindCurve3D_set_point_position
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position for the vertex [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
set_point_position ::
                     (Curve3D :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_set_point_tilt #-}

-- | Sets the tilt angle in radians for the point [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
--   				The tilt controls the rotation along the look-at axis an object traveling the path would have. In the case of a curve controlling a [PathFollow], this tilt is an offset over the natural tilt the [PathFollow] calculates.
bindCurve3D_set_point_tilt :: MethodBind
bindCurve3D_set_point_tilt
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tilt angle in radians for the point [code]idx[/code]. If the index is out of bounds, the function sends an error to the console.
--   				The tilt controls the rotation along the look-at axis an object traveling the path would have. In the case of a curve controlling a [PathFollow], this tilt is an offset over the natural tilt the [PathFollow] calculates.
set_point_tilt ::
                 (Curve3D :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_tilt cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_tilt (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_set_up_vector_enabled #-}

-- | If [code]true[/code], the curve will bake up vectors used for orientation. This is used when [member PathFollow.rotation_mode] is set to [constant PathFollow.ROTATION_ORIENTED]. Changing it forces the cache to be recomputed.
bindCurve3D_set_up_vector_enabled :: MethodBind
bindCurve3D_set_up_vector_enabled
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_up_vector_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the curve will bake up vectors used for orientation. This is used when [member PathFollow.rotation_mode] is set to [constant PathFollow.ROTATION_ORIENTED]. Changing it forces the cache to be recomputed.
set_up_vector_enabled ::
                        (Curve3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_up_vector_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_up_vector_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCurve3D_tessellate #-}

-- | Returns a list of points along the curve, with a curvature controlled point density. That is, the curvier parts will have more points than the straighter parts.
--   				This approximation makes straight segments between each point, then subdivides those segments until the resulting shape is similar enough.
--   				[code]max_stages[/code] controls how many subdivisions a curve segment may face before it is considered approximate enough. Each subdivision splits the segment in half, so the default 5 stages may mean up to 32 subdivisions per curve segment. Increase with care!
--   				[code]tolerance_degrees[/code] controls how many degrees the midpoint of a segment may deviate from the real curve, before the segment has to be subdivided.
bindCurve3D_tessellate :: MethodBind
bindCurve3D_tessellate
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "tessellate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of points along the curve, with a curvature controlled point density. That is, the curvier parts will have more points than the straighter parts.
--   				This approximation makes straight segments between each point, then subdivides those segments until the resulting shape is similar enough.
--   				[code]max_stages[/code] controls how many subdivisions a curve segment may face before it is considered approximate enough. Each subdivision splits the segment in half, so the default 5 stages may mean up to 32 subdivisions per curve segment. Increase with care!
--   				[code]tolerance_degrees[/code] controls how many degrees the midpoint of a segment may deviate from the real curve, before the segment has to be subdivided.
tessellate ::
             (Curve3D :< cls, Object :< cls) =>
             cls -> Int -> Float -> IO PoolVector3Array
tessellate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_tessellate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)