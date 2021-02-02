{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PathFollow
       (Godot.Core.PathFollow._ROTATION_ORIENTED,
        Godot.Core.PathFollow._ROTATION_XY,
        Godot.Core.PathFollow._ROTATION_Y,
        Godot.Core.PathFollow._ROTATION_XYZ,
        Godot.Core.PathFollow._ROTATION_NONE,
        Godot.Core.PathFollow.get_cubic_interpolation,
        Godot.Core.PathFollow.get_h_offset,
        Godot.Core.PathFollow.get_offset,
        Godot.Core.PathFollow.get_rotation_mode,
        Godot.Core.PathFollow.get_unit_offset,
        Godot.Core.PathFollow.get_v_offset, Godot.Core.PathFollow.has_loop,
        Godot.Core.PathFollow.set_cubic_interpolation,
        Godot.Core.PathFollow.set_h_offset, Godot.Core.PathFollow.set_loop,
        Godot.Core.PathFollow.set_offset,
        Godot.Core.PathFollow.set_rotation_mode,
        Godot.Core.PathFollow.set_unit_offset,
        Godot.Core.PathFollow.set_v_offset)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ROTATION_ORIENTED :: Int
_ROTATION_ORIENTED = 4

_ROTATION_XY :: Int
_ROTATION_XY = 2

_ROTATION_Y :: Int
_ROTATION_Y = 1

_ROTATION_XYZ :: Int
_ROTATION_XYZ = 3

_ROTATION_NONE :: Int
_ROTATION_NONE = 0

{-# NOINLINE bindPathFollow_get_cubic_interpolation #-}

-- | If [code]true[/code], the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the [Curve3D] of the [Path] are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: Either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
bindPathFollow_get_cubic_interpolation :: MethodBind
bindPathFollow_get_cubic_interpolation
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_cubic_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the [Curve3D] of the [Path] are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: Either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
get_cubic_interpolation ::
                          (PathFollow :< cls, Object :< cls) => cls -> IO Bool
get_cubic_interpolation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_cubic_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_get_h_offset #-}

-- | The node's offset along the curve.
bindPathFollow_get_h_offset :: MethodBind
bindPathFollow_get_h_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset along the curve.
get_h_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_get_offset #-}

-- | The distance from the first vertex, measured in 3D units along the path. This sets this node's position to a point within the path.
bindPathFollow_get_offset :: MethodBind
bindPathFollow_get_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance from the first vertex, measured in 3D units along the path. This sets this node's position to a point within the path.
get_offset :: (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_get_rotation_mode #-}

-- | Allows or forbids rotation on one or more axes, depending on the [enum RotationMode] constants being used.
bindPathFollow_get_rotation_mode :: MethodBind
bindPathFollow_get_rotation_mode
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_rotation_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows or forbids rotation on one or more axes, depending on the [enum RotationMode] constants being used.
get_rotation_mode ::
                    (PathFollow :< cls, Object :< cls) => cls -> IO Int
get_rotation_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_rotation_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_get_unit_offset #-}

-- | The distance from the first vertex, considering 0.0 as the first vertex and 1.0 as the last. This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
bindPathFollow_get_unit_offset :: MethodBind
bindPathFollow_get_unit_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_unit_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance from the first vertex, considering 0.0 as the first vertex and 1.0 as the last. This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
get_unit_offset ::
                  (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_unit_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_unit_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_get_v_offset #-}

-- | The node's offset perpendicular to the curve.
bindPathFollow_get_v_offset :: MethodBind
bindPathFollow_get_v_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset perpendicular to the curve.
get_v_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_get_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_has_loop #-}

-- | If [code]true[/code], any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
bindPathFollow_has_loop :: MethodBind
bindPathFollow_has_loop
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "has_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
has_loop :: (PathFollow :< cls, Object :< cls) => cls -> IO Bool
has_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_has_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_cubic_interpolation #-}

-- | If [code]true[/code], the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the [Curve3D] of the [Path] are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: Either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
bindPathFollow_set_cubic_interpolation :: MethodBind
bindPathFollow_set_cubic_interpolation
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_cubic_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the [Curve3D] of the [Path] are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: Either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
set_cubic_interpolation ::
                          (PathFollow :< cls, Object :< cls) => cls -> Bool -> IO ()
set_cubic_interpolation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_cubic_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_h_offset #-}

-- | The node's offset along the curve.
bindPathFollow_set_h_offset :: MethodBind
bindPathFollow_set_h_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset along the curve.
set_h_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_loop #-}

-- | If [code]true[/code], any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
bindPathFollow_set_loop :: MethodBind
bindPathFollow_set_loop
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
set_loop ::
           (PathFollow :< cls, Object :< cls) => cls -> Bool -> IO ()
set_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_offset #-}

-- | The distance from the first vertex, measured in 3D units along the path. This sets this node's position to a point within the path.
bindPathFollow_set_offset :: MethodBind
bindPathFollow_set_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance from the first vertex, measured in 3D units along the path. This sets this node's position to a point within the path.
set_offset ::
             (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_rotation_mode #-}

-- | Allows or forbids rotation on one or more axes, depending on the [enum RotationMode] constants being used.
bindPathFollow_set_rotation_mode :: MethodBind
bindPathFollow_set_rotation_mode
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_rotation_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows or forbids rotation on one or more axes, depending on the [enum RotationMode] constants being used.
set_rotation_mode ::
                    (PathFollow :< cls, Object :< cls) => cls -> Int -> IO ()
set_rotation_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_rotation_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_unit_offset #-}

-- | The distance from the first vertex, considering 0.0 as the first vertex and 1.0 as the last. This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
bindPathFollow_set_unit_offset :: MethodBind
bindPathFollow_set_unit_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_unit_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance from the first vertex, considering 0.0 as the first vertex and 1.0 as the last. This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
set_unit_offset ::
                  (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_unit_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_unit_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPathFollow_set_v_offset #-}

-- | The node's offset perpendicular to the curve.
bindPathFollow_set_v_offset :: MethodBind
bindPathFollow_set_v_offset
  = unsafePerformIO $
      withCString "PathFollow" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset perpendicular to the curve.
set_v_offset ::
               (PathFollow :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow_set_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)