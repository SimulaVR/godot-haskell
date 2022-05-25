{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Curve
       (Godot.Core.Curve._TANGENT_MODE_COUNT,
        Godot.Core.Curve._TANGENT_LINEAR, Godot.Core.Curve._TANGENT_FREE,
        Godot.Core.Curve.sig_range_changed, Godot.Core.Curve._get_data,
        Godot.Core.Curve._set_data, Godot.Core.Curve.add_point,
        Godot.Core.Curve.bake, Godot.Core.Curve.clean_dupes,
        Godot.Core.Curve.clear_points,
        Godot.Core.Curve.get_bake_resolution,
        Godot.Core.Curve.get_max_value, Godot.Core.Curve.get_min_value,
        Godot.Core.Curve.get_point_count,
        Godot.Core.Curve.get_point_left_mode,
        Godot.Core.Curve.get_point_left_tangent,
        Godot.Core.Curve.get_point_position,
        Godot.Core.Curve.get_point_right_mode,
        Godot.Core.Curve.get_point_right_tangent,
        Godot.Core.Curve.interpolate, Godot.Core.Curve.interpolate_baked,
        Godot.Core.Curve.remove_point,
        Godot.Core.Curve.set_bake_resolution,
        Godot.Core.Curve.set_max_value, Godot.Core.Curve.set_min_value,
        Godot.Core.Curve.set_point_left_mode,
        Godot.Core.Curve.set_point_left_tangent,
        Godot.Core.Curve.set_point_offset,
        Godot.Core.Curve.set_point_right_mode,
        Godot.Core.Curve.set_point_right_tangent,
        Godot.Core.Curve.set_point_value)
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

_TANGENT_MODE_COUNT :: Int
_TANGENT_MODE_COUNT = 2

_TANGENT_LINEAR :: Int
_TANGENT_LINEAR = 1

_TANGENT_FREE :: Int
_TANGENT_FREE = 0

-- | Emitted when @max_value@ or @min_value@ is changed.
sig_range_changed :: Godot.Internal.Dispatch.Signal Curve
sig_range_changed = Godot.Internal.Dispatch.Signal "range_changed"

instance NodeSignal Curve "range_changed" '[]

instance NodeProperty Curve "_data" Array 'False where
        nodeProperty = (_get_data, wrapDroppingSetter _set_data, Nothing)

instance NodeProperty Curve "bake_resolution" Int 'False where
        nodeProperty
          = (get_bake_resolution, wrapDroppingSetter set_bake_resolution,
             Nothing)

instance NodeProperty Curve "max_value" Float 'False where
        nodeProperty
          = (get_max_value, wrapDroppingSetter set_max_value, Nothing)

instance NodeProperty Curve "min_value" Float 'False where
        nodeProperty
          = (get_min_value, wrapDroppingSetter set_min_value, Nothing)

{-# NOINLINE bindCurve__get_data #-}

bindCurve__get_data :: MethodBind
bindCurve__get_data
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data :: (Curve :< cls, Object :< cls) => cls -> IO Array
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve__get_data (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "_get_data" '[] (IO Array) where
        nodeMethod = Godot.Core.Curve._get_data

{-# NOINLINE bindCurve__set_data #-}

bindCurve__set_data :: MethodBind
bindCurve__set_data
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data :: (Curve :< cls, Object :< cls) => cls -> Array -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve__set_data (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "_set_data" '[Array] (IO ()) where
        nodeMethod = Godot.Core.Curve._set_data

{-# NOINLINE bindCurve_add_point #-}

-- | Adds a point to the curve. For each side, if the @*_mode@ is @TANGENT_LINEAR@, the @*_tangent@ angle (in degrees) uses the slope of the curve halfway to the adjacent point. Allows custom assignments to the @*_tangent@ angle if @*_mode@ is set to @TANGENT_FREE@.
bindCurve_add_point :: MethodBind
bindCurve_add_point
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a point to the curve. For each side, if the @*_mode@ is @TANGENT_LINEAR@, the @*_tangent@ angle (in degrees) uses the slope of the curve halfway to the adjacent point. Allows custom assignments to the @*_tangent@ angle if @*_mode@ is set to @TANGENT_FREE@.
add_point ::
            (Curve :< cls, Object :< cls) =>
            cls ->
              Vector2 ->
                Maybe Float -> Maybe Float -> Maybe Int -> Maybe Int -> IO Int
add_point cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, maybe (VariantReal (0)) toVariant arg2,
       maybe (VariantReal (0)) toVariant arg3,
       maybe (VariantInt (0)) toVariant arg4,
       maybe (VariantInt (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_add_point (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "add_point"
           '[Vector2, Maybe Float, Maybe Float, Maybe Int, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Curve.add_point

{-# NOINLINE bindCurve_bake #-}

-- | Recomputes the baked cache of points for the curve.
bindCurve_bake :: MethodBind
bindCurve_bake
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Recomputes the baked cache of points for the curve.
bake :: (Curve :< cls, Object :< cls) => cls -> IO ()
bake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_bake (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "bake" '[] (IO ()) where
        nodeMethod = Godot.Core.Curve.bake

{-# NOINLINE bindCurve_clean_dupes #-}

-- | Removes points that are closer than @CMP_EPSILON@ (0.00001) units to their neighbor on the curve.
bindCurve_clean_dupes :: MethodBind
bindCurve_clean_dupes
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "clean_dupes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes points that are closer than @CMP_EPSILON@ (0.00001) units to their neighbor on the curve.
clean_dupes :: (Curve :< cls, Object :< cls) => cls -> IO ()
clean_dupes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_clean_dupes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "clean_dupes" '[] (IO ()) where
        nodeMethod = Godot.Core.Curve.clean_dupes

{-# NOINLINE bindCurve_clear_points #-}

-- | Removes all points from the curve.
bindCurve_clear_points :: MethodBind
bindCurve_clear_points
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "clear_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all points from the curve.
clear_points :: (Curve :< cls, Object :< cls) => cls -> IO ()
clear_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_clear_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "clear_points" '[] (IO ()) where
        nodeMethod = Godot.Core.Curve.clear_points

{-# NOINLINE bindCurve_get_bake_resolution #-}

-- | The number of points to include in the baked (i.e. cached) curve data.
bindCurve_get_bake_resolution :: MethodBind
bindCurve_get_bake_resolution
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_bake_resolution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of points to include in the baked (i.e. cached) curve data.
get_bake_resolution ::
                      (Curve :< cls, Object :< cls) => cls -> IO Int
get_bake_resolution cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_bake_resolution (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_bake_resolution" '[] (IO Int) where
        nodeMethod = Godot.Core.Curve.get_bake_resolution

{-# NOINLINE bindCurve_get_max_value #-}

-- | The maximum value the curve can reach.
bindCurve_get_max_value :: MethodBind
bindCurve_get_max_value
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_max_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum value the curve can reach.
get_max_value :: (Curve :< cls, Object :< cls) => cls -> IO Float
get_max_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_max_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_max_value" '[] (IO Float) where
        nodeMethod = Godot.Core.Curve.get_max_value

{-# NOINLINE bindCurve_get_min_value #-}

-- | The minimum value the curve can reach.
bindCurve_get_min_value :: MethodBind
bindCurve_get_min_value
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_min_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum value the curve can reach.
get_min_value :: (Curve :< cls, Object :< cls) => cls -> IO Float
get_min_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_min_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_min_value" '[] (IO Float) where
        nodeMethod = Godot.Core.Curve.get_min_value

{-# NOINLINE bindCurve_get_point_count #-}

-- | Returns the number of points describing the curve.
bindCurve_get_point_count :: MethodBind
bindCurve_get_point_count
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of points describing the curve.
get_point_count :: (Curve :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_point_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Curve.get_point_count

{-# NOINLINE bindCurve_get_point_left_mode #-}

-- | Returns the left @enum TangentMode@ for the point at @index@.
bindCurve_get_point_left_mode :: MethodBind
bindCurve_get_point_left_mode
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_point_left_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the left @enum TangentMode@ for the point at @index@.
get_point_left_mode ::
                      (Curve :< cls, Object :< cls) => cls -> Int -> IO Int
get_point_left_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_point_left_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_point_left_mode" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.Curve.get_point_left_mode

{-# NOINLINE bindCurve_get_point_left_tangent #-}

-- | Returns the left tangent angle (in degrees) for the point at @index@.
bindCurve_get_point_left_tangent :: MethodBind
bindCurve_get_point_left_tangent
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_point_left_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the left tangent angle (in degrees) for the point at @index@.
get_point_left_tangent ::
                         (Curve :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_left_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_point_left_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_point_left_tangent" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Curve.get_point_left_tangent

{-# NOINLINE bindCurve_get_point_position #-}

-- | Returns the curve coordinates for the point at @index@.
bindCurve_get_point_position :: MethodBind
bindCurve_get_point_position
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the curve coordinates for the point at @index@.
get_point_position ::
                     (Curve :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_point_position" '[Int] (IO Vector2)
         where
        nodeMethod = Godot.Core.Curve.get_point_position

{-# NOINLINE bindCurve_get_point_right_mode #-}

-- | Returns the right @enum TangentMode@ for the point at @index@.
bindCurve_get_point_right_mode :: MethodBind
bindCurve_get_point_right_mode
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_point_right_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the right @enum TangentMode@ for the point at @index@.
get_point_right_mode ::
                       (Curve :< cls, Object :< cls) => cls -> Int -> IO Int
get_point_right_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_point_right_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_point_right_mode" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.Curve.get_point_right_mode

{-# NOINLINE bindCurve_get_point_right_tangent #-}

-- | Returns the right tangent angle (in degrees) for the point at @index@.
bindCurve_get_point_right_tangent :: MethodBind
bindCurve_get_point_right_tangent
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "get_point_right_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the right tangent angle (in degrees) for the point at @index@.
get_point_right_tangent ::
                          (Curve :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_right_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_get_point_right_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "get_point_right_tangent" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Curve.get_point_right_tangent

{-# NOINLINE bindCurve_interpolate #-}

-- | Returns the Y value for the point that would exist at the X position @offset@ along the curve.
bindCurve_interpolate :: MethodBind
bindCurve_interpolate
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the Y value for the point that would exist at the X position @offset@ along the curve.
interpolate ::
              (Curve :< cls, Object :< cls) => cls -> Float -> IO Float
interpolate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_interpolate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "interpolate" '[Float] (IO Float) where
        nodeMethod = Godot.Core.Curve.interpolate

{-# NOINLINE bindCurve_interpolate_baked #-}

-- | Returns the Y value for the point that would exist at the X position @offset@ along the curve using the baked cache. Bakes the curve's points if not already baked.
bindCurve_interpolate_baked :: MethodBind
bindCurve_interpolate_baked
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "interpolate_baked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the Y value for the point that would exist at the X position @offset@ along the curve using the baked cache. Bakes the curve's points if not already baked.
interpolate_baked ::
                    (Curve :< cls, Object :< cls) => cls -> Float -> IO Float
interpolate_baked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_interpolate_baked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "interpolate_baked" '[Float] (IO Float)
         where
        nodeMethod = Godot.Core.Curve.interpolate_baked

{-# NOINLINE bindCurve_remove_point #-}

-- | Removes the point at @index@ from the curve.
bindCurve_remove_point :: MethodBind
bindCurve_remove_point
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the point at @index@ from the curve.
remove_point ::
               (Curve :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "remove_point" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Curve.remove_point

{-# NOINLINE bindCurve_set_bake_resolution #-}

-- | The number of points to include in the baked (i.e. cached) curve data.
bindCurve_set_bake_resolution :: MethodBind
bindCurve_set_bake_resolution
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_bake_resolution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of points to include in the baked (i.e. cached) curve data.
set_bake_resolution ::
                      (Curve :< cls, Object :< cls) => cls -> Int -> IO ()
set_bake_resolution cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_bake_resolution (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_bake_resolution" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Curve.set_bake_resolution

{-# NOINLINE bindCurve_set_max_value #-}

-- | The maximum value the curve can reach.
bindCurve_set_max_value :: MethodBind
bindCurve_set_max_value
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_max_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum value the curve can reach.
set_max_value ::
                (Curve :< cls, Object :< cls) => cls -> Float -> IO ()
set_max_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_max_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_max_value" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Curve.set_max_value

{-# NOINLINE bindCurve_set_min_value #-}

-- | The minimum value the curve can reach.
bindCurve_set_min_value :: MethodBind
bindCurve_set_min_value
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_min_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum value the curve can reach.
set_min_value ::
                (Curve :< cls, Object :< cls) => cls -> Float -> IO ()
set_min_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_min_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_min_value" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Curve.set_min_value

{-# NOINLINE bindCurve_set_point_left_mode #-}

-- | Sets the left @enum TangentMode@ for the point at @index@ to @mode@.
bindCurve_set_point_left_mode :: MethodBind
bindCurve_set_point_left_mode
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_point_left_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the left @enum TangentMode@ for the point at @index@ to @mode@.
set_point_left_mode ::
                      (Curve :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_point_left_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_point_left_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_point_left_mode" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.Curve.set_point_left_mode

{-# NOINLINE bindCurve_set_point_left_tangent #-}

-- | Sets the left tangent angle for the point at @index@ to @tangent@.
bindCurve_set_point_left_tangent :: MethodBind
bindCurve_set_point_left_tangent
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_point_left_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the left tangent angle for the point at @index@ to @tangent@.
set_point_left_tangent ::
                         (Curve :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_left_tangent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_point_left_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_point_left_tangent" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve.set_point_left_tangent

{-# NOINLINE bindCurve_set_point_offset #-}

-- | Sets the offset from @0.5@.
bindCurve_set_point_offset :: MethodBind
bindCurve_set_point_offset
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_point_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the offset from @0.5@.
set_point_offset ::
                   (Curve :< cls, Object :< cls) => cls -> Int -> Float -> IO Int
set_point_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_point_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_point_offset" '[Int, Float] (IO Int)
         where
        nodeMethod = Godot.Core.Curve.set_point_offset

{-# NOINLINE bindCurve_set_point_right_mode #-}

-- | Sets the right @enum TangentMode@ for the point at @index@ to @mode@.
bindCurve_set_point_right_mode :: MethodBind
bindCurve_set_point_right_mode
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_point_right_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the right @enum TangentMode@ for the point at @index@ to @mode@.
set_point_right_mode ::
                       (Curve :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_point_right_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_point_right_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_point_right_mode" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve.set_point_right_mode

{-# NOINLINE bindCurve_set_point_right_tangent #-}

-- | Sets the right tangent angle for the point at @index@ to @tangent@.
bindCurve_set_point_right_tangent :: MethodBind
bindCurve_set_point_right_tangent
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_point_right_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the right tangent angle for the point at @index@ to @tangent@.
set_point_right_tangent ::
                          (Curve :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_right_tangent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_point_right_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_point_right_tangent" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Curve.set_point_right_tangent

{-# NOINLINE bindCurve_set_point_value #-}

-- | Assigns the vertical position @y@ to the point at @index@.
bindCurve_set_point_value :: MethodBind
bindCurve_set_point_value
  = unsafePerformIO $
      withCString "Curve" $
        \ clsNamePtr ->
          withCString "set_point_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns the vertical position @y@ to the point at @index@.
set_point_value ::
                  (Curve :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurve_set_point_value (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Curve "set_point_value" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.Curve.set_point_value