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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Resource()

instance NodeProperty Curve3D "_data" Dictionary 'False where
        nodeProperty = (_get_data, wrapDroppingSetter _set_data, Nothing)

instance NodeProperty Curve3D "bake_interval" Float 'False where
        nodeProperty
          = (get_bake_interval, wrapDroppingSetter set_bake_interval,
             Nothing)

instance NodeProperty Curve3D "up_vector_enabled" Bool 'False where
        nodeProperty
          = (is_up_vector_enabled, wrapDroppingSetter set_up_vector_enabled,
             Nothing)

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

instance NodeMethod Curve3D "_get_data" '[] (IO Dictionary) where
        nodeMethod = Godot.Core.Curve3D._get_data

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

instance NodeMethod Curve3D "_set_data" '[Dictionary] (IO ()) where
        nodeMethod = Godot.Core.Curve3D._set_data

{-# NOINLINE bindCurve3D_add_point #-}

-- | Adds a point to a curve at @position@, with control points @in@ and @out@.
--   				If @at_position@ is given, the point is inserted before the point number @at_position@, moving that point (and every point after) after the inserted point. If @at_position@ is not given, or is an illegal value (@at_position <0@ or @at_position >= @method get_point_count@@), the point will be appended at the end of the point list.
bindCurve3D_add_point :: MethodBind
bindCurve3D_add_point
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a point to a curve at @position@, with control points @in@ and @out@.
--   				If @at_position@ is given, the point is inserted before the point number @at_position@, moving that point (and every point after) after the inserted point. If @at_position@ is not given, or is an illegal value (@at_position <0@ or @at_position >= @method get_point_count@@), the point will be appended at the end of the point list.
add_point ::
            (Curve3D :< cls, Object :< cls) =>
            cls ->
              Vector3 -> Maybe Vector3 -> Maybe Vector3 -> Maybe Int -> IO ()
add_point cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantVector3 (V3 0 0 0) arg2,
       defaultedVariant VariantVector3 (V3 0 0 0) arg3,
       maybe (VariantInt (-1)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_add_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "add_point"
           '[Vector3, Maybe Vector3, Maybe Vector3, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.add_point

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

instance NodeMethod Curve3D "clear_points" '[] (IO ()) where
        nodeMethod = Godot.Core.Curve3D.clear_points

{-# NOINLINE bindCurve3D_get_bake_interval #-}

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
bindCurve3D_get_bake_interval :: MethodBind
bindCurve3D_get_bake_interval
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_bake_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
get_bake_interval ::
                    (Curve3D :< cls, Object :< cls) => cls -> IO Float
get_bake_interval cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_bake_interval (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_bake_interval" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Curve3D.get_bake_interval

{-# NOINLINE bindCurve3D_get_baked_length #-}

-- | Returns the total length of the curve, based on the cached points. Given enough density (see @bake_interval@), it should be approximate enough.
bindCurve3D_get_baked_length :: MethodBind
bindCurve3D_get_baked_length
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total length of the curve, based on the cached points. Given enough density (see @bake_interval@), it should be approximate enough.
get_baked_length ::
                   (Curve3D :< cls, Object :< cls) => cls -> IO Float
get_baked_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_baked_length" '[] (IO Float) where
        nodeMethod = Godot.Core.Curve3D.get_baked_length

{-# NOINLINE bindCurve3D_get_baked_points #-}

-- | Returns the cache of points as a @PoolVector3Array@.
bindCurve3D_get_baked_points :: MethodBind
bindCurve3D_get_baked_points
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of points as a @PoolVector3Array@.
get_baked_points ::
                   (Curve3D :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_baked_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_baked_points" '[]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Curve3D.get_baked_points

{-# NOINLINE bindCurve3D_get_baked_tilts #-}

-- | Returns the cache of tilts as a @PoolRealArray@.
bindCurve3D_get_baked_tilts :: MethodBind
bindCurve3D_get_baked_tilts
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_tilts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of tilts as a @PoolRealArray@.
get_baked_tilts ::
                  (Curve3D :< cls, Object :< cls) => cls -> IO PoolRealArray
get_baked_tilts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_baked_tilts (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_baked_tilts" '[]
           (IO PoolRealArray)
         where
        nodeMethod = Godot.Core.Curve3D.get_baked_tilts

{-# NOINLINE bindCurve3D_get_baked_up_vectors #-}

-- | Returns the cache of up vectors as a @PoolVector3Array@.
--   				If @up_vector_enabled@ is @false@, the cache will be empty.
bindCurve3D_get_baked_up_vectors :: MethodBind
bindCurve3D_get_baked_up_vectors
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_baked_up_vectors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of up vectors as a @PoolVector3Array@.
--   				If @up_vector_enabled@ is @false@, the cache will be empty.
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

instance NodeMethod Curve3D "get_baked_up_vectors" '[]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Curve3D.get_baked_up_vectors

{-# NOINLINE bindCurve3D_get_closest_offset #-}

-- | Returns the closest offset to @to_point@. This offset is meant to be used in @method interpolate_baked@ or @method interpolate_baked_up_vector@.
--   				@to_point@ must be in this curve's local space.
bindCurve3D_get_closest_offset :: MethodBind
bindCurve3D_get_closest_offset
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_closest_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest offset to @to_point@. This offset is meant to be used in @method interpolate_baked@ or @method interpolate_baked_up_vector@.
--   				@to_point@ must be in this curve's local space.
get_closest_offset ::
                     (Curve3D :< cls, Object :< cls) => cls -> Vector3 -> IO Float
get_closest_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_closest_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_closest_offset" '[Vector3]
           (IO Float)
         where
        nodeMethod = Godot.Core.Curve3D.get_closest_offset

{-# NOINLINE bindCurve3D_get_closest_point #-}

-- | Returns the closest baked point (in curve's local space) to @to_point@.
--   				@to_point@ must be in this curve's local space.
bindCurve3D_get_closest_point :: MethodBind
bindCurve3D_get_closest_point
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest baked point (in curve's local space) to @to_point@.
--   				@to_point@ must be in this curve's local space.
get_closest_point ::
                    (Curve3D :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_closest_point" '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.get_closest_point

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

instance NodeMethod Curve3D "get_point_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Curve3D.get_point_count

{-# NOINLINE bindCurve3D_get_point_in #-}

-- | Returns the position of the control point leading to the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0, 0)@.
bindCurve3D_get_point_in :: MethodBind
bindCurve3D_get_point_in
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the control point leading to the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0, 0)@.
get_point_in ::
               (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_in cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_in (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_point_in" '[Int] (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.get_point_in

{-# NOINLINE bindCurve3D_get_point_out #-}

-- | Returns the position of the control point leading out of the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0, 0)@.
bindCurve3D_get_point_out :: MethodBind
bindCurve3D_get_point_out
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the control point leading out of the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0, 0)@.
get_point_out ::
                (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_out cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_out (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_point_out" '[Int] (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.get_point_out

{-# NOINLINE bindCurve3D_get_point_position #-}

-- | Returns the position of the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0, 0)@.
bindCurve3D_get_point_position :: MethodBind
bindCurve3D_get_point_position
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0, 0)@.
get_point_position ::
                     (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_point_position" '[Int]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.get_point_position

{-# NOINLINE bindCurve3D_get_point_tilt #-}

-- | Returns the tilt angle in radians for the point @idx@. If the index is out of bounds, the function sends an error to the console, and returns @0@.
bindCurve3D_get_point_tilt :: MethodBind
bindCurve3D_get_point_tilt
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "get_point_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tilt angle in radians for the point @idx@. If the index is out of bounds, the function sends an error to the console, and returns @0@.
get_point_tilt ::
                 (Curve3D :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_tilt cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_get_point_tilt (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "get_point_tilt" '[Int] (IO Float)
         where
        nodeMethod = Godot.Core.Curve3D.get_point_tilt

{-# NOINLINE bindCurve3D_interpolate #-}

-- | Returns the position between the vertex @idx@ and the vertex @idx + 1@, where @t@ controls if the point is the first vertex (@t = 0.0@), the last vertex (@t = 1.0@), or in between. Values of @t@ outside the range (@0.0 >= t <=1@) give strange, but predictable results.
--   				If @idx@ is out of bounds it is truncated to the first or last vertex, and @t@ is ignored. If the curve has no points, the function sends an error to the console, and returns @(0, 0, 0)@.
bindCurve3D_interpolate :: MethodBind
bindCurve3D_interpolate
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position between the vertex @idx@ and the vertex @idx + 1@, where @t@ controls if the point is the first vertex (@t = 0.0@), the last vertex (@t = 1.0@), or in between. Values of @t@ outside the range (@0.0 >= t <=1@) give strange, but predictable results.
--   				If @idx@ is out of bounds it is truncated to the first or last vertex, and @t@ is ignored. If the curve has no points, the function sends an error to the console, and returns @(0, 0, 0)@.
interpolate ::
              (Curve3D :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO Vector3
interpolate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "interpolate" '[Int, Float]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.interpolate

{-# NOINLINE bindCurve3D_interpolate_baked #-}

-- | Returns a point within the curve at position @offset@, where @offset@ is measured as a distance in 3D units along the curve.
--   				To do that, it finds the two cached points where the @offset@ lies between, then interpolates the values. This interpolation is cubic if @cubic@ is set to @true@, or linear if set to @false@.
--   				Cubic interpolation tends to follow the curves better, but linear is faster (and often, precise enough).
bindCurve3D_interpolate_baked :: MethodBind
bindCurve3D_interpolate_baked
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolate_baked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a point within the curve at position @offset@, where @offset@ is measured as a distance in 3D units along the curve.
--   				To do that, it finds the two cached points where the @offset@ lies between, then interpolates the values. This interpolation is cubic if @cubic@ is set to @true@, or linear if set to @false@.
--   				Cubic interpolation tends to follow the curves better, but linear is faster (and often, precise enough).
interpolate_baked ::
                    (Curve3D :< cls, Object :< cls) =>
                    cls -> Float -> Maybe Bool -> IO Vector3
interpolate_baked cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolate_baked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "interpolate_baked"
           '[Float, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.interpolate_baked

{-# NOINLINE bindCurve3D_interpolate_baked_up_vector #-}

-- | Returns an up vector within the curve at position @offset@, where @offset@ is measured as a distance in 3D units along the curve.
--   				To do that, it finds the two cached up vectors where the @offset@ lies between, then interpolates the values. If @apply_tilt@ is @true@, an interpolated tilt is applied to the interpolated up vector.
--   				If the curve has no up vectors, the function sends an error to the console, and returns @(0, 1, 0)@.
bindCurve3D_interpolate_baked_up_vector :: MethodBind
bindCurve3D_interpolate_baked_up_vector
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolate_baked_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an up vector within the curve at position @offset@, where @offset@ is measured as a distance in 3D units along the curve.
--   				To do that, it finds the two cached up vectors where the @offset@ lies between, then interpolates the values. If @apply_tilt@ is @true@, an interpolated tilt is applied to the interpolated up vector.
--   				If the curve has no up vectors, the function sends an error to the console, and returns @(0, 1, 0)@.
interpolate_baked_up_vector ::
                              (Curve3D :< cls, Object :< cls) =>
                              cls -> Float -> Maybe Bool -> IO Vector3
interpolate_baked_up_vector cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolate_baked_up_vector
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "interpolate_baked_up_vector"
           '[Float, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.interpolate_baked_up_vector

{-# NOINLINE bindCurve3D_interpolatef #-}

-- | Returns the position at the vertex @fofs@. It calls @method interpolate@ using the integer part of @fofs@ as @idx@, and its fractional part as @t@.
bindCurve3D_interpolatef :: MethodBind
bindCurve3D_interpolatef
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "interpolatef" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position at the vertex @fofs@. It calls @method interpolate@ using the integer part of @fofs@ as @idx@, and its fractional part as @t@.
interpolatef ::
               (Curve3D :< cls, Object :< cls) => cls -> Float -> IO Vector3
interpolatef cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_interpolatef (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "interpolatef" '[Float] (IO Vector3)
         where
        nodeMethod = Godot.Core.Curve3D.interpolatef

{-# NOINLINE bindCurve3D_is_up_vector_enabled #-}

-- | If @true@, the curve will bake up vectors used for orientation. This is used when @PathFollow.rotation_mode@ is set to @PathFollow.ROTATION_ORIENTED@. Changing it forces the cache to be recomputed.
bindCurve3D_is_up_vector_enabled :: MethodBind
bindCurve3D_is_up_vector_enabled
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "is_up_vector_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the curve will bake up vectors used for orientation. This is used when @PathFollow.rotation_mode@ is set to @PathFollow.ROTATION_ORIENTED@. Changing it forces the cache to be recomputed.
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

instance NodeMethod Curve3D "is_up_vector_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Curve3D.is_up_vector_enabled

{-# NOINLINE bindCurve3D_remove_point #-}

-- | Deletes the point @idx@ from the curve. Sends an error to the console if @idx@ is out of bounds.
bindCurve3D_remove_point :: MethodBind
bindCurve3D_remove_point
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the point @idx@ from the curve. Sends an error to the console if @idx@ is out of bounds.
remove_point ::
               (Curve3D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "remove_point" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Curve3D.remove_point

{-# NOINLINE bindCurve3D_set_bake_interval #-}

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
bindCurve3D_set_bake_interval :: MethodBind
bindCurve3D_set_bake_interval
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_bake_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance in meters between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
set_bake_interval ::
                    (Curve3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bake_interval cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_bake_interval (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "set_bake_interval" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.set_bake_interval

{-# NOINLINE bindCurve3D_set_point_in #-}

-- | Sets the position of the control point leading to the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
bindCurve3D_set_point_in :: MethodBind
bindCurve3D_set_point_in
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the control point leading to the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
set_point_in ::
               (Curve3D :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_in cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_in (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "set_point_in" '[Int, Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.set_point_in

{-# NOINLINE bindCurve3D_set_point_out #-}

-- | Sets the position of the control point leading out of the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
bindCurve3D_set_point_out :: MethodBind
bindCurve3D_set_point_out
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the control point leading out of the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
set_point_out ::
                (Curve3D :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_out cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_out (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "set_point_out" '[Int, Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.set_point_out

{-# NOINLINE bindCurve3D_set_point_position #-}

-- | Sets the position for the vertex @idx@. If the index is out of bounds, the function sends an error to the console.
bindCurve3D_set_point_position :: MethodBind
bindCurve3D_set_point_position
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position for the vertex @idx@. If the index is out of bounds, the function sends an error to the console.
set_point_position ::
                     (Curve3D :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "set_point_position" '[Int, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.set_point_position

{-# NOINLINE bindCurve3D_set_point_tilt #-}

-- | Sets the tilt angle in radians for the point @idx@. If the index is out of bounds, the function sends an error to the console.
--   				The tilt controls the rotation along the look-at axis an object traveling the path would have. In the case of a curve controlling a @PathFollow@, this tilt is an offset over the natural tilt the @PathFollow@ calculates.
bindCurve3D_set_point_tilt :: MethodBind
bindCurve3D_set_point_tilt
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_point_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tilt angle in radians for the point @idx@. If the index is out of bounds, the function sends an error to the console.
--   				The tilt controls the rotation along the look-at axis an object traveling the path would have. In the case of a curve controlling a @PathFollow@, this tilt is an offset over the natural tilt the @PathFollow@ calculates.
set_point_tilt ::
                 (Curve3D :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_tilt cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_set_point_tilt (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "set_point_tilt" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.set_point_tilt

{-# NOINLINE bindCurve3D_set_up_vector_enabled #-}

-- | If @true@, the curve will bake up vectors used for orientation. This is used when @PathFollow.rotation_mode@ is set to @PathFollow.ROTATION_ORIENTED@. Changing it forces the cache to be recomputed.
bindCurve3D_set_up_vector_enabled :: MethodBind
bindCurve3D_set_up_vector_enabled
  = unsafePerformIO $
      withCString "Curve3D" $
        \ clsNamePtr ->
          withCString "set_up_vector_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the curve will bake up vectors used for orientation. This is used when @PathFollow.rotation_mode@ is set to @PathFollow.ROTATION_ORIENTED@. Changing it forces the cache to be recomputed.
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

instance NodeMethod Curve3D "set_up_vector_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Curve3D.set_up_vector_enabled

{-# NOINLINE bindCurve3D_tessellate #-}

-- | Returns a list of points along the curve, with a curvature controlled point density. That is, the curvier parts will have more points than the straighter parts.
--   				This approximation makes straight segments between each point, then subdivides those segments until the resulting shape is similar enough.
--   				@max_stages@ controls how many subdivisions a curve segment may face before it is considered approximate enough. Each subdivision splits the segment in half, so the default 5 stages may mean up to 32 subdivisions per curve segment. Increase with care!
--   				@tolerance_degrees@ controls how many degrees the midpoint of a segment may deviate from the real curve, before the segment has to be subdivided.
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
--   				@max_stages@ controls how many subdivisions a curve segment may face before it is considered approximate enough. Each subdivision splits the segment in half, so the default 5 stages may mean up to 32 subdivisions per curve segment. Increase with care!
--   				@tolerance_degrees@ controls how many degrees the midpoint of a segment may deviate from the real curve, before the segment has to be subdivided.
tessellate ::
             (Curve3D :< cls, Object :< cls) =>
             cls -> Maybe Int -> Maybe Float -> IO PoolVector3Array
tessellate cls arg1 arg2
  = withVariantArray
      [maybe (VariantInt (5)) toVariant arg1,
       maybe (VariantReal (4)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve3D_tessellate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve3D "tessellate" '[Maybe Int, Maybe Float]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Curve3D.tessellate