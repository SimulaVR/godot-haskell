{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Gradient
       (Godot.Core.Gradient.add_point, Godot.Core.Gradient.get_color,
        Godot.Core.Gradient.get_colors, Godot.Core.Gradient.get_offset,
        Godot.Core.Gradient.get_offsets,
        Godot.Core.Gradient.get_point_count,
        Godot.Core.Gradient.interpolate, Godot.Core.Gradient.remove_point,
        Godot.Core.Gradient.set_color, Godot.Core.Gradient.set_colors,
        Godot.Core.Gradient.set_offset, Godot.Core.Gradient.set_offsets)
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

instance NodeProperty Gradient "colors" PoolColorArray 'False where
        nodeProperty = (get_colors, wrapDroppingSetter set_colors, Nothing)

instance NodeProperty Gradient "offsets" PoolRealArray 'False where
        nodeProperty
          = (get_offsets, wrapDroppingSetter set_offsets, Nothing)

{-# NOINLINE bindGradient_add_point #-}

-- | Adds the specified color to the end of the ramp, with the specified offset.
bindGradient_add_point :: MethodBind
bindGradient_add_point
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the specified color to the end of the ramp, with the specified offset.
add_point ::
            (Gradient :< cls, Object :< cls) => cls -> Float -> Color -> IO ()
add_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_add_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "add_point" '[Float, Color] (IO ())
         where
        nodeMethod = Godot.Core.Gradient.add_point

{-# NOINLINE bindGradient_get_color #-}

-- | Returns the color of the ramp color at index @point@.
bindGradient_get_color :: MethodBind
bindGradient_get_color
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color of the ramp color at index @point@.
get_color ::
            (Gradient :< cls, Object :< cls) => cls -> Int -> IO Color
get_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_get_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "get_color" '[Int] (IO Color) where
        nodeMethod = Godot.Core.Gradient.get_color

{-# NOINLINE bindGradient_get_colors #-}

-- | Gradient's colors returned as a @PoolColorArray@.
bindGradient_get_colors :: MethodBind
bindGradient_get_colors
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "get_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gradient's colors returned as a @PoolColorArray@.
get_colors ::
             (Gradient :< cls, Object :< cls) => cls -> IO PoolColorArray
get_colors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_get_colors (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "get_colors" '[] (IO PoolColorArray)
         where
        nodeMethod = Godot.Core.Gradient.get_colors

{-# NOINLINE bindGradient_get_offset #-}

-- | Returns the offset of the ramp color at index @point@.
bindGradient_get_offset :: MethodBind
bindGradient_get_offset
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the offset of the ramp color at index @point@.
get_offset ::
             (Gradient :< cls, Object :< cls) => cls -> Int -> IO Float
get_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "get_offset" '[Int] (IO Float) where
        nodeMethod = Godot.Core.Gradient.get_offset

{-# NOINLINE bindGradient_get_offsets #-}

-- | Gradient's offsets returned as a @PoolRealArray@.
bindGradient_get_offsets :: MethodBind
bindGradient_get_offsets
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "get_offsets" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gradient's offsets returned as a @PoolRealArray@.
get_offsets ::
              (Gradient :< cls, Object :< cls) => cls -> IO PoolRealArray
get_offsets cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_get_offsets (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "get_offsets" '[] (IO PoolRealArray)
         where
        nodeMethod = Godot.Core.Gradient.get_offsets

{-# NOINLINE bindGradient_get_point_count #-}

-- | Returns the number of colors in the ramp.
bindGradient_get_point_count :: MethodBind
bindGradient_get_point_count
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of colors in the ramp.
get_point_count ::
                  (Gradient :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "get_point_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Gradient.get_point_count

{-# NOINLINE bindGradient_interpolate #-}

-- | Returns the interpolated color specified by @offset@.
bindGradient_interpolate :: MethodBind
bindGradient_interpolate
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the interpolated color specified by @offset@.
interpolate ::
              (Gradient :< cls, Object :< cls) => cls -> Float -> IO Color
interpolate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_interpolate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "interpolate" '[Float] (IO Color)
         where
        nodeMethod = Godot.Core.Gradient.interpolate

{-# NOINLINE bindGradient_remove_point #-}

-- | Removes the color at the index @point@.
bindGradient_remove_point :: MethodBind
bindGradient_remove_point
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the color at the index @point@.
remove_point ::
               (Gradient :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_remove_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "remove_point" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Gradient.remove_point

{-# NOINLINE bindGradient_set_color #-}

-- | Sets the color of the ramp color at index @point@.
bindGradient_set_color :: MethodBind
bindGradient_set_color
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of the ramp color at index @point@.
set_color ::
            (Gradient :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_set_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "set_color" '[Int, Color] (IO ())
         where
        nodeMethod = Godot.Core.Gradient.set_color

{-# NOINLINE bindGradient_set_colors #-}

-- | Gradient's colors returned as a @PoolColorArray@.
bindGradient_set_colors :: MethodBind
bindGradient_set_colors
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "set_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gradient's colors returned as a @PoolColorArray@.
set_colors ::
             (Gradient :< cls, Object :< cls) => cls -> PoolColorArray -> IO ()
set_colors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_set_colors (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "set_colors" '[PoolColorArray] (IO ())
         where
        nodeMethod = Godot.Core.Gradient.set_colors

{-# NOINLINE bindGradient_set_offset #-}

-- | Sets the offset for the ramp color at index @point@.
bindGradient_set_offset :: MethodBind
bindGradient_set_offset
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the offset for the ramp color at index @point@.
set_offset ::
             (Gradient :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_set_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "set_offset" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.Gradient.set_offset

{-# NOINLINE bindGradient_set_offsets #-}

-- | Gradient's offsets returned as a @PoolRealArray@.
bindGradient_set_offsets :: MethodBind
bindGradient_set_offsets
  = unsafePerformIO $
      withCString "Gradient" $
        \ clsNamePtr ->
          withCString "set_offsets" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gradient's offsets returned as a @PoolRealArray@.
set_offsets ::
              (Gradient :< cls, Object :< cls) => cls -> PoolRealArray -> IO ()
set_offsets cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradient_set_offsets (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Gradient "set_offsets" '[PoolRealArray] (IO ())
         where
        nodeMethod = Godot.Core.Gradient.set_offsets