{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.BitMap
       (Godot.Core.BitMap._get_data, Godot.Core.BitMap._set_data,
        Godot.Core.BitMap.create,
        Godot.Core.BitMap.create_from_image_alpha,
        Godot.Core.BitMap.get_bit, Godot.Core.BitMap.get_size,
        Godot.Core.BitMap.get_true_bit_count, Godot.Core.BitMap.grow_mask,
        Godot.Core.BitMap.opaque_to_polygons, Godot.Core.BitMap.set_bit,
        Godot.Core.BitMap.set_bit_rect)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindBitMap__get_data #-}

bindBitMap__get_data :: MethodBind
bindBitMap__get_data
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data :: (BitMap :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap__get_data (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap__set_data #-}

bindBitMap__set_data :: MethodBind
bindBitMap__set_data
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (BitMap :< cls, Object :< cls) => cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap__set_data (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_create #-}

-- | Creates a bitmap with the specified size, filled with [code]false[/code].
bindBitMap_create :: MethodBind
bindBitMap_create
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a bitmap with the specified size, filled with [code]false[/code].
create :: (BitMap :< cls, Object :< cls) => cls -> Vector2 -> IO ()
create cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_create (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_create_from_image_alpha #-}

-- | Creates a bitmap that matches the given image dimensions, every element of the bitmap is set to [code]false[/code] if the alpha value of the image at that position is equal to [code]threshold[/code] or less, and [code]true[/code] in other case.
bindBitMap_create_from_image_alpha :: MethodBind
bindBitMap_create_from_image_alpha
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "create_from_image_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a bitmap that matches the given image dimensions, every element of the bitmap is set to [code]false[/code] if the alpha value of the image at that position is equal to [code]threshold[/code] or less, and [code]true[/code] in other case.
create_from_image_alpha ::
                          (BitMap :< cls, Object :< cls) => cls -> Image -> Float -> IO ()
create_from_image_alpha cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_create_from_image_alpha
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_get_bit #-}

-- | Returns bitmap's value at the specified position.
bindBitMap_get_bit :: MethodBind
bindBitMap_get_bit
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "get_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns bitmap's value at the specified position.
get_bit ::
          (BitMap :< cls, Object :< cls) => cls -> Vector2 -> IO Bool
get_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_get_bit (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_get_size #-}

-- | Returns bitmap's dimensions.
bindBitMap_get_size :: MethodBind
bindBitMap_get_size
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns bitmap's dimensions.
get_size :: (BitMap :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_get_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_get_true_bit_count #-}

-- | Returns the amount of bitmap elements that are set to [code]true[/code].
bindBitMap_get_true_bit_count :: MethodBind
bindBitMap_get_true_bit_count
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "get_true_bit_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of bitmap elements that are set to [code]true[/code].
get_true_bit_count ::
                     (BitMap :< cls, Object :< cls) => cls -> IO Int
get_true_bit_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_get_true_bit_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_grow_mask #-}

-- | Applies morphological dilation to the bitmap. The first argument is the dilation amount, Rect2 is the area where the dilation will be applied.
bindBitMap_grow_mask :: MethodBind
bindBitMap_grow_mask
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "grow_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies morphological dilation to the bitmap. The first argument is the dilation amount, Rect2 is the area where the dilation will be applied.
grow_mask ::
            (BitMap :< cls, Object :< cls) => cls -> Int -> Rect2 -> IO ()
grow_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_grow_mask (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_opaque_to_polygons #-}

bindBitMap_opaque_to_polygons :: MethodBind
bindBitMap_opaque_to_polygons
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "opaque_to_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

opaque_to_polygons ::
                     (BitMap :< cls, Object :< cls) => cls -> Rect2 -> Float -> IO Array
opaque_to_polygons cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_opaque_to_polygons (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_set_bit #-}

-- | Sets the bitmap's element at the specified position, to the specified value.
bindBitMap_set_bit :: MethodBind
bindBitMap_set_bit
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "set_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bitmap's element at the specified position, to the specified value.
set_bit ::
          (BitMap :< cls, Object :< cls) => cls -> Vector2 -> Bool -> IO ()
set_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_set_bit (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitMap_set_bit_rect #-}

-- | Sets a rectangular portion of the bitmap to the specified value.
bindBitMap_set_bit_rect :: MethodBind
bindBitMap_set_bit_rect
  = unsafePerformIO $
      withCString "BitMap" $
        \ clsNamePtr ->
          withCString "set_bit_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a rectangular portion of the bitmap to the specified value.
set_bit_rect ::
               (BitMap :< cls, Object :< cls) => cls -> Rect2 -> Bool -> IO ()
set_bit_rect cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitMap_set_bit_rect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)