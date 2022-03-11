{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Curve2D
       (Godot.Core.Curve2D._get_data, Godot.Core.Curve2D._set_data,
        Godot.Core.Curve2D.add_point, Godot.Core.Curve2D.clear_points,
        Godot.Core.Curve2D.get_bake_interval,
        Godot.Core.Curve2D.get_baked_length,
        Godot.Core.Curve2D.get_baked_points,
        Godot.Core.Curve2D.get_closest_offset,
        Godot.Core.Curve2D.get_closest_point,
        Godot.Core.Curve2D.get_point_count,
        Godot.Core.Curve2D.get_point_in, Godot.Core.Curve2D.get_point_out,
        Godot.Core.Curve2D.get_point_position,
        Godot.Core.Curve2D.interpolate,
        Godot.Core.Curve2D.interpolate_baked,
        Godot.Core.Curve2D.interpolatef, Godot.Core.Curve2D.remove_point,
        Godot.Core.Curve2D.set_bake_interval,
        Godot.Core.Curve2D.set_point_in, Godot.Core.Curve2D.set_point_out,
        Godot.Core.Curve2D.set_point_position,
        Godot.Core.Curve2D.tessellate)
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

instance NodeProperty Curve2D "_data" Dictionary 'False where
        nodeProperty = (_get_data, wrapDroppingSetter _set_data, Nothing)

instance NodeProperty Curve2D "bake_interval" Float 'False where
        nodeProperty
          = (get_bake_interval, wrapDroppingSetter set_bake_interval,
             Nothing)

{-# NOINLINE bindCurve2D__get_data #-}

bindCurve2D__get_data :: MethodBind
bindCurve2D__get_data
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (Curve2D :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D__get_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "_get_data" '[] (IO Dictionary) where
        nodeMethod = Godot.Core.Curve2D._get_data

{-# NOINLINE bindCurve2D__set_data #-}

bindCurve2D__set_data :: MethodBind
bindCurve2D__set_data
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (Curve2D :< cls, Object :< cls) => cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D__set_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "_set_data" '[Dictionary] (IO ()) where
        nodeMethod = Godot.Core.Curve2D._set_data

{-# NOINLINE bindCurve2D_add_point #-}

-- | Adds a point to a curve at @position@, with control points @in@ and @out@.
--   				If @at_position@ is given, the point is inserted before the point number @at_position@, moving that point (and every point after) after the inserted point. If @at_position@ is not given, or is an illegal value (@at_position <0@ or @at_position >= @method get_point_count@@), the point will be appended at the end of the point list.
bindCurve2D_add_point :: MethodBind
bindCurve2D_add_point
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a point to a curve at @position@, with control points @in@ and @out@.
--   				If @at_position@ is given, the point is inserted before the point number @at_position@, moving that point (and every point after) after the inserted point. If @at_position@ is not given, or is an illegal value (@at_position <0@ or @at_position >= @method get_point_count@@), the point will be appended at the end of the point list.
add_point ::
            (Curve2D :< cls, Object :< cls) =>
            cls ->
              Vector2 -> Maybe Vector2 -> Maybe Vector2 -> Maybe Int -> IO ()
add_point cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantVector2 (V2 0 0) arg2,
       defaultedVariant VariantVector2 (V2 0 0) arg3,
       maybe (VariantInt (-1)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_add_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "add_point"
           '[Vector2, Maybe Vector2, Maybe Vector2, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve2D.add_point

{-# NOINLINE bindCurve2D_clear_points #-}

-- | Removes all points from the curve.
bindCurve2D_clear_points :: MethodBind
bindCurve2D_clear_points
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "clear_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all points from the curve.
clear_points :: (Curve2D :< cls, Object :< cls) => cls -> IO ()
clear_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_clear_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "clear_points" '[] (IO ()) where
        nodeMethod = Godot.Core.Curve2D.clear_points

{-# NOINLINE bindCurve2D_get_bake_interval #-}

-- | The distance in pixels between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
bindCurve2D_get_bake_interval :: MethodBind
bindCurve2D_get_bake_interval
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_bake_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance in pixels between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
get_bake_interval ::
                    (Curve2D :< cls, Object :< cls) => cls -> IO Float
get_bake_interval cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_bake_interval (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_bake_interval" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Curve2D.get_bake_interval

{-# NOINLINE bindCurve2D_get_baked_length #-}

-- | Returns the total length of the curve, based on the cached points. Given enough density (see @bake_interval@), it should be approximate enough.
bindCurve2D_get_baked_length :: MethodBind
bindCurve2D_get_baked_length
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_baked_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total length of the curve, based on the cached points. Given enough density (see @bake_interval@), it should be approximate enough.
get_baked_length ::
                   (Curve2D :< cls, Object :< cls) => cls -> IO Float
get_baked_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_baked_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_baked_length" '[] (IO Float) where
        nodeMethod = Godot.Core.Curve2D.get_baked_length

{-# NOINLINE bindCurve2D_get_baked_points #-}

-- | Returns the cache of points as a @PoolVector2Array@.
bindCurve2D_get_baked_points :: MethodBind
bindCurve2D_get_baked_points
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_baked_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cache of points as a @PoolVector2Array@.
get_baked_points ::
                   (Curve2D :< cls, Object :< cls) => cls -> IO PoolVector2Array
get_baked_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_baked_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_baked_points" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Curve2D.get_baked_points

{-# NOINLINE bindCurve2D_get_closest_offset #-}

-- | Returns the closest offset to @to_point@. This offset is meant to be used in @method interpolate_baked@.
--   				@to_point@ must be in this curve's local space.
bindCurve2D_get_closest_offset :: MethodBind
bindCurve2D_get_closest_offset
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_closest_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest offset to @to_point@. This offset is meant to be used in @method interpolate_baked@.
--   				@to_point@ must be in this curve's local space.
get_closest_offset ::
                     (Curve2D :< cls, Object :< cls) => cls -> Vector2 -> IO Float
get_closest_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_closest_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_closest_offset" '[Vector2]
           (IO Float)
         where
        nodeMethod = Godot.Core.Curve2D.get_closest_offset

{-# NOINLINE bindCurve2D_get_closest_point #-}

-- | Returns the closest baked point (in curve's local space) to @to_point@.
--   				@to_point@ must be in this curve's local space.
bindCurve2D_get_closest_point :: MethodBind
bindCurve2D_get_closest_point
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest baked point (in curve's local space) to @to_point@.
--   				@to_point@ must be in this curve's local space.
get_closest_point ::
                    (Curve2D :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_closest_point" '[Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.get_closest_point

{-# NOINLINE bindCurve2D_get_point_count #-}

-- | Returns the number of points describing the curve.
bindCurve2D_get_point_count :: MethodBind
bindCurve2D_get_point_count
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of points describing the curve.
get_point_count :: (Curve2D :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_point_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Curve2D.get_point_count

{-# NOINLINE bindCurve2D_get_point_in #-}

-- | Returns the position of the control point leading to the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0)@.
bindCurve2D_get_point_in :: MethodBind
bindCurve2D_get_point_in
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_point_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the control point leading to the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0)@.
get_point_in ::
               (Curve2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_in cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_point_in (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_point_in" '[Int] (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.get_point_in

{-# NOINLINE bindCurve2D_get_point_out #-}

-- | Returns the position of the control point leading out of the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0)@.
bindCurve2D_get_point_out :: MethodBind
bindCurve2D_get_point_out
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_point_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the control point leading out of the vertex @idx@. The returned position is relative to the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0)@.
get_point_out ::
                (Curve2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_out cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_point_out (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_point_out" '[Int] (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.get_point_out

{-# NOINLINE bindCurve2D_get_point_position #-}

-- | Returns the position of the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0)@.
bindCurve2D_get_point_position :: MethodBind
bindCurve2D_get_point_position
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the vertex @idx@. If the index is out of bounds, the function sends an error to the console, and returns @(0, 0)@.
get_point_position ::
                     (Curve2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "get_point_position" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.get_point_position

{-# NOINLINE bindCurve2D_interpolate #-}

-- | Returns the position between the vertex @idx@ and the vertex @idx + 1@, where @t@ controls if the point is the first vertex (@t = 0.0@), the last vertex (@t = 1.0@), or in between. Values of @t@ outside the range (@0.0 >= t <=1@) give strange, but predictable results.
--   				If @idx@ is out of bounds it is truncated to the first or last vertex, and @t@ is ignored. If the curve has no points, the function sends an error to the console, and returns @(0, 0)@.
bindCurve2D_interpolate :: MethodBind
bindCurve2D_interpolate
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position between the vertex @idx@ and the vertex @idx + 1@, where @t@ controls if the point is the first vertex (@t = 0.0@), the last vertex (@t = 1.0@), or in between. Values of @t@ outside the range (@0.0 >= t <=1@) give strange, but predictable results.
--   				If @idx@ is out of bounds it is truncated to the first or last vertex, and @t@ is ignored. If the curve has no points, the function sends an error to the console, and returns @(0, 0)@.
interpolate ::
              (Curve2D :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO Vector2
interpolate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_interpolate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "interpolate" '[Int, Float]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.interpolate

{-# NOINLINE bindCurve2D_interpolate_baked #-}

-- | Returns a point within the curve at position @offset@, where @offset@ is measured as a pixel distance along the curve.
--   				To do that, it finds the two cached points where the @offset@ lies between, then interpolates the values. This interpolation is cubic if @cubic@ is set to @true@, or linear if set to @false@.
--   				Cubic interpolation tends to follow the curves better, but linear is faster (and often, precise enough).
bindCurve2D_interpolate_baked :: MethodBind
bindCurve2D_interpolate_baked
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "interpolate_baked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a point within the curve at position @offset@, where @offset@ is measured as a pixel distance along the curve.
--   				To do that, it finds the two cached points where the @offset@ lies between, then interpolates the values. This interpolation is cubic if @cubic@ is set to @true@, or linear if set to @false@.
--   				Cubic interpolation tends to follow the curves better, but linear is faster (and often, precise enough).
interpolate_baked ::
                    (Curve2D :< cls, Object :< cls) =>
                    cls -> Float -> Maybe Bool -> IO Vector2
interpolate_baked cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_interpolate_baked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "interpolate_baked"
           '[Float, Maybe Bool]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.interpolate_baked

{-# NOINLINE bindCurve2D_interpolatef #-}

-- | Returns the position at the vertex @fofs@. It calls @method interpolate@ using the integer part of @fofs@ as @idx@, and its fractional part as @t@.
bindCurve2D_interpolatef :: MethodBind
bindCurve2D_interpolatef
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "interpolatef" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position at the vertex @fofs@. It calls @method interpolate@ using the integer part of @fofs@ as @idx@, and its fractional part as @t@.
interpolatef ::
               (Curve2D :< cls, Object :< cls) => cls -> Float -> IO Vector2
interpolatef cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_interpolatef (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "interpolatef" '[Float] (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve2D.interpolatef

{-# NOINLINE bindCurve2D_remove_point #-}

-- | Deletes the point @idx@ from the curve. Sends an error to the console if @idx@ is out of bounds.
bindCurve2D_remove_point :: MethodBind
bindCurve2D_remove_point
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the point @idx@ from the curve. Sends an error to the console if @idx@ is out of bounds.
remove_point ::
               (Curve2D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "remove_point" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Curve2D.remove_point

{-# NOINLINE bindCurve2D_set_bake_interval #-}

-- | The distance in pixels between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
bindCurve2D_set_bake_interval :: MethodBind
bindCurve2D_set_bake_interval
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "set_bake_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance in pixels between two adjacent cached points. Changing it forces the cache to be recomputed the next time the @method get_baked_points@ or @method get_baked_length@ function is called. The smaller the distance, the more points in the cache and the more memory it will consume, so use with care.
set_bake_interval ::
                    (Curve2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bake_interval cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_set_bake_interval (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "set_bake_interval" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Curve2D.set_bake_interval

{-# NOINLINE bindCurve2D_set_point_in #-}

-- | Sets the position of the control point leading to the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
bindCurve2D_set_point_in :: MethodBind
bindCurve2D_set_point_in
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "set_point_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the control point leading to the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
set_point_in ::
               (Curve2D :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point_in cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_set_point_in (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "set_point_in" '[Int, Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Curve2D.set_point_in

{-# NOINLINE bindCurve2D_set_point_out #-}

-- | Sets the position of the control point leading out of the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
bindCurve2D_set_point_out :: MethodBind
bindCurve2D_set_point_out
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "set_point_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the control point leading out of the vertex @idx@. If the index is out of bounds, the function sends an error to the console. The position is relative to the vertex.
set_point_out ::
                (Curve2D :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point_out cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_set_point_out (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "set_point_out" '[Int, Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Curve2D.set_point_out

{-# NOINLINE bindCurve2D_set_point_position #-}

-- | Sets the position for the vertex @idx@. If the index is out of bounds, the function sends an error to the console.
bindCurve2D_set_point_position :: MethodBind
bindCurve2D_set_point_position
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position for the vertex @idx@. If the index is out of bounds, the function sends an error to the console.
set_point_position ::
                     (Curve2D :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "set_point_position" '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve2D.set_point_position

{-# NOINLINE bindCurve2D_tessellate #-}

-- | Returns a list of points along the curve, with a curvature controlled point density. That is, the curvier parts will have more points than the straighter parts.
--   				This approximation makes straight segments between each point, then subdivides those segments until the resulting shape is similar enough.
--   				@max_stages@ controls how many subdivisions a curve segment may face before it is considered approximate enough. Each subdivision splits the segment in half, so the default 5 stages may mean up to 32 subdivisions per curve segment. Increase with care!
--   				@tolerance_degrees@ controls how many degrees the midpoint of a segment may deviate from the real curve, before the segment has to be subdivided.
bindCurve2D_tessellate :: MethodBind
bindCurve2D_tessellate
  = unsafePerformIO $
      withCString "Curve2D" $
        \ clsNamePtr ->
          withCString "tessellate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of points along the curve, with a curvature controlled point density. That is, the curvier parts will have more points than the straighter parts.
--   				This approximation makes straight segments between each point, then subdivides those segments until the resulting shape is similar enough.
--   				@max_stages@ controls how many subdivisions a curve segment may face before it is considered approximate enough. Each subdivision splits the segment in half, so the default 5 stages may mean up to 32 subdivisions per curve segment. Increase with care!
--   				@tolerance_degrees@ controls how many degrees the midpoint of a segment may deviate from the real curve, before the segment has to be subdivided.
tessellate ::
             (Curve2D :< cls, Object :< cls) =>
             cls -> Maybe Int -> Maybe Float -> IO PoolVector2Array
tessellate cls arg1 arg2
  = withVariantArray
      [maybe (VariantInt (5)) toVariant arg1,
       maybe (VariantReal (4)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve2D_tessellate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve2D "tessellate" '[Maybe Int, Maybe Float]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Curve2D.tessellate