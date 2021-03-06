{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PathFollow2D
       (Godot.Core.PathFollow2D.get_cubic_interpolation,
        Godot.Core.PathFollow2D.get_h_offset,
        Godot.Core.PathFollow2D.get_lookahead,
        Godot.Core.PathFollow2D.get_offset,
        Godot.Core.PathFollow2D.get_unit_offset,
        Godot.Core.PathFollow2D.get_v_offset,
        Godot.Core.PathFollow2D.has_loop,
        Godot.Core.PathFollow2D.is_rotating,
        Godot.Core.PathFollow2D.set_cubic_interpolation,
        Godot.Core.PathFollow2D.set_h_offset,
        Godot.Core.PathFollow2D.set_lookahead,
        Godot.Core.PathFollow2D.set_loop,
        Godot.Core.PathFollow2D.set_offset,
        Godot.Core.PathFollow2D.set_rotate,
        Godot.Core.PathFollow2D.set_unit_offset,
        Godot.Core.PathFollow2D.set_v_offset)
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
import Godot.Core.Node2D()

instance NodeProperty PathFollow2D "cubic_interp" Bool 'False where
        nodeProperty
          = (get_cubic_interpolation,
             wrapDroppingSetter set_cubic_interpolation, Nothing)

instance NodeProperty PathFollow2D "h_offset" Float 'False where
        nodeProperty
          = (get_h_offset, wrapDroppingSetter set_h_offset, Nothing)

instance NodeProperty PathFollow2D "lookahead" Float 'False where
        nodeProperty
          = (get_lookahead, wrapDroppingSetter set_lookahead, Nothing)

instance NodeProperty PathFollow2D "loop" Bool 'False where
        nodeProperty = (has_loop, wrapDroppingSetter set_loop, Nothing)

instance NodeProperty PathFollow2D "offset" Float 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty PathFollow2D "rotate" Bool 'False where
        nodeProperty
          = (is_rotating, wrapDroppingSetter set_rotate, Nothing)

instance NodeProperty PathFollow2D "unit_offset" Float 'False where
        nodeProperty
          = (get_unit_offset, wrapDroppingSetter set_unit_offset, Nothing)

instance NodeProperty PathFollow2D "v_offset" Float 'False where
        nodeProperty
          = (get_v_offset, wrapDroppingSetter set_v_offset, Nothing)

{-# NOINLINE bindPathFollow2D_get_cubic_interpolation #-}

-- | If @true@, the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the @Curve2D@ of the @Path2D@ are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
bindPathFollow2D_get_cubic_interpolation :: MethodBind
bindPathFollow2D_get_cubic_interpolation
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "get_cubic_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the @Curve2D@ of the @Path2D@ are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
get_cubic_interpolation ::
                          (PathFollow2D :< cls, Object :< cls) => cls -> IO Bool
get_cubic_interpolation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_get_cubic_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "get_cubic_interpolation" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PathFollow2D.get_cubic_interpolation

{-# NOINLINE bindPathFollow2D_get_h_offset #-}

-- | The node's offset along the curve.
bindPathFollow2D_get_h_offset :: MethodBind
bindPathFollow2D_get_h_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset along the curve.
get_h_offset ::
               (PathFollow2D :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_get_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "get_h_offset" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PathFollow2D.get_h_offset

{-# NOINLINE bindPathFollow2D_get_lookahead #-}

-- | How far to look ahead of the curve to calculate the tangent if the node is rotating. E.g. shorter lookaheads will lead to faster rotations.
bindPathFollow2D_get_lookahead :: MethodBind
bindPathFollow2D_get_lookahead
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "get_lookahead" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How far to look ahead of the curve to calculate the tangent if the node is rotating. E.g. shorter lookaheads will lead to faster rotations.
get_lookahead ::
                (PathFollow2D :< cls, Object :< cls) => cls -> IO Float
get_lookahead cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_get_lookahead (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "get_lookahead" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PathFollow2D.get_lookahead

{-# NOINLINE bindPathFollow2D_get_offset #-}

-- | The distance along the path in pixels.
bindPathFollow2D_get_offset :: MethodBind
bindPathFollow2D_get_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance along the path in pixels.
get_offset ::
             (PathFollow2D :< cls, Object :< cls) => cls -> IO Float
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "get_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.PathFollow2D.get_offset

{-# NOINLINE bindPathFollow2D_get_unit_offset #-}

-- | The distance along the path as a number in the range 0.0 (for the first vertex) to 1.0 (for the last). This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
bindPathFollow2D_get_unit_offset :: MethodBind
bindPathFollow2D_get_unit_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "get_unit_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance along the path as a number in the range 0.0 (for the first vertex) to 1.0 (for the last). This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
get_unit_offset ::
                  (PathFollow2D :< cls, Object :< cls) => cls -> IO Float
get_unit_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_get_unit_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "get_unit_offset" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PathFollow2D.get_unit_offset

{-# NOINLINE bindPathFollow2D_get_v_offset #-}

-- | The node's offset perpendicular to the curve.
bindPathFollow2D_get_v_offset :: MethodBind
bindPathFollow2D_get_v_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset perpendicular to the curve.
get_v_offset ::
               (PathFollow2D :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_get_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "get_v_offset" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PathFollow2D.get_v_offset

{-# NOINLINE bindPathFollow2D_has_loop #-}

-- | If @true@, any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
bindPathFollow2D_has_loop :: MethodBind
bindPathFollow2D_has_loop
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "has_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
has_loop :: (PathFollow2D :< cls, Object :< cls) => cls -> IO Bool
has_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_has_loop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "has_loop" '[] (IO Bool) where
        nodeMethod = Godot.Core.PathFollow2D.has_loop

{-# NOINLINE bindPathFollow2D_is_rotating #-}

-- | If @true@, this node rotates to follow the path, making its descendants rotate.
bindPathFollow2D_is_rotating :: MethodBind
bindPathFollow2D_is_rotating
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "is_rotating" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this node rotates to follow the path, making its descendants rotate.
is_rotating ::
              (PathFollow2D :< cls, Object :< cls) => cls -> IO Bool
is_rotating cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_is_rotating (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "is_rotating" '[] (IO Bool) where
        nodeMethod = Godot.Core.PathFollow2D.is_rotating

{-# NOINLINE bindPathFollow2D_set_cubic_interpolation #-}

-- | If @true@, the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the @Curve2D@ of the @Path2D@ are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
bindPathFollow2D_set_cubic_interpolation :: MethodBind
bindPathFollow2D_set_cubic_interpolation
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_cubic_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the position between two cached points is interpolated cubically, and linearly otherwise.
--   			The points along the @Curve2D@ of the @Path2D@ are precomputed before use, for faster calculations. The point at the requested offset is then calculated interpolating between two adjacent cached points. This may present a problem if the curve makes sharp turns, as the cached points may not follow the curve closely enough.
--   			There are two answers to this problem: either increase the number of cached points and increase memory consumption, or make a cubic interpolation between two points at the cost of (slightly) slower calculations.
set_cubic_interpolation ::
                          (PathFollow2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_cubic_interpolation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_cubic_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_cubic_interpolation" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PathFollow2D.set_cubic_interpolation

{-# NOINLINE bindPathFollow2D_set_h_offset #-}

-- | The node's offset along the curve.
bindPathFollow2D_set_h_offset :: MethodBind
bindPathFollow2D_set_h_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset along the curve.
set_h_offset ::
               (PathFollow2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_h_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow2D.set_h_offset

{-# NOINLINE bindPathFollow2D_set_lookahead #-}

-- | How far to look ahead of the curve to calculate the tangent if the node is rotating. E.g. shorter lookaheads will lead to faster rotations.
bindPathFollow2D_set_lookahead :: MethodBind
bindPathFollow2D_set_lookahead
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_lookahead" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How far to look ahead of the curve to calculate the tangent if the node is rotating. E.g. shorter lookaheads will lead to faster rotations.
set_lookahead ::
                (PathFollow2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_lookahead cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_lookahead (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_lookahead" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow2D.set_lookahead

{-# NOINLINE bindPathFollow2D_set_loop #-}

-- | If @true@, any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
bindPathFollow2D_set_loop :: MethodBind
bindPathFollow2D_set_loop
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, any offset outside the path's length will wrap around, instead of stopping at the ends. Use it for cyclic paths.
set_loop ::
           (PathFollow2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_loop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_loop" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.PathFollow2D.set_loop

{-# NOINLINE bindPathFollow2D_set_offset #-}

-- | The distance along the path in pixels.
bindPathFollow2D_set_offset :: MethodBind
bindPathFollow2D_set_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance along the path in pixels.
set_offset ::
             (PathFollow2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow2D.set_offset

{-# NOINLINE bindPathFollow2D_set_rotate #-}

-- | If @true@, this node rotates to follow the path, making its descendants rotate.
bindPathFollow2D_set_rotate :: MethodBind
bindPathFollow2D_set_rotate
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this node rotates to follow the path, making its descendants rotate.
set_rotate ::
             (PathFollow2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_rotate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_rotate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_rotate" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.PathFollow2D.set_rotate

{-# NOINLINE bindPathFollow2D_set_unit_offset #-}

-- | The distance along the path as a number in the range 0.0 (for the first vertex) to 1.0 (for the last). This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
bindPathFollow2D_set_unit_offset :: MethodBind
bindPathFollow2D_set_unit_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_unit_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance along the path as a number in the range 0.0 (for the first vertex) to 1.0 (for the last). This is just another way of expressing the offset within the path, as the offset supplied is multiplied internally by the path's length.
set_unit_offset ::
                  (PathFollow2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_unit_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_unit_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_unit_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow2D.set_unit_offset

{-# NOINLINE bindPathFollow2D_set_v_offset #-}

-- | The node's offset perpendicular to the curve.
bindPathFollow2D_set_v_offset :: MethodBind
bindPathFollow2D_set_v_offset
  = unsafePerformIO $
      withCString "PathFollow2D" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's offset perpendicular to the curve.
set_v_offset ::
               (PathFollow2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPathFollow2D_set_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PathFollow2D "set_v_offset" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PathFollow2D.set_v_offset