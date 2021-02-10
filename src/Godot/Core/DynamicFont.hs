{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.DynamicFont
       (Godot.Core.DynamicFont._SPACING_TOP,
        Godot.Core.DynamicFont._SPACING_SPACE,
        Godot.Core.DynamicFont._SPACING_CHAR,
        Godot.Core.DynamicFont._SPACING_BOTTOM,
        Godot.Core.DynamicFont.add_fallback,
        Godot.Core.DynamicFont.get_fallback,
        Godot.Core.DynamicFont.get_fallback_count,
        Godot.Core.DynamicFont.get_font_data,
        Godot.Core.DynamicFont.get_outline_color,
        Godot.Core.DynamicFont.get_outline_size,
        Godot.Core.DynamicFont.get_size,
        Godot.Core.DynamicFont.get_spacing,
        Godot.Core.DynamicFont.get_use_filter,
        Godot.Core.DynamicFont.get_use_mipmaps,
        Godot.Core.DynamicFont.remove_fallback,
        Godot.Core.DynamicFont.set_fallback,
        Godot.Core.DynamicFont.set_font_data,
        Godot.Core.DynamicFont.set_outline_color,
        Godot.Core.DynamicFont.set_outline_size,
        Godot.Core.DynamicFont.set_size,
        Godot.Core.DynamicFont.set_spacing,
        Godot.Core.DynamicFont.set_use_filter,
        Godot.Core.DynamicFont.set_use_mipmaps)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SPACING_TOP :: Int
_SPACING_TOP = 0

_SPACING_SPACE :: Int
_SPACING_SPACE = 3

_SPACING_CHAR :: Int
_SPACING_CHAR = 2

_SPACING_BOTTOM :: Int
_SPACING_BOTTOM = 1

{-# NOINLINE bindDynamicFont_add_fallback #-}

-- | Adds a fallback font.
bindDynamicFont_add_fallback :: MethodBind
bindDynamicFont_add_fallback
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "add_fallback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a fallback font.
add_fallback ::
               (DynamicFont :< cls, Object :< cls) =>
               cls -> DynamicFontData -> IO ()
add_fallback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_add_fallback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_fallback #-}

-- | Returns the fallback font at index [code]idx[/code].
bindDynamicFont_get_fallback :: MethodBind
bindDynamicFont_get_fallback
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_fallback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the fallback font at index [code]idx[/code].
get_fallback ::
               (DynamicFont :< cls, Object :< cls) =>
               cls -> Int -> IO DynamicFontData
get_fallback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_fallback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_fallback_count #-}

-- | Returns the number of fallback fonts.
bindDynamicFont_get_fallback_count :: MethodBind
bindDynamicFont_get_fallback_count
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_fallback_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of fallback fonts.
get_fallback_count ::
                     (DynamicFont :< cls, Object :< cls) => cls -> IO Int
get_fallback_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_fallback_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_font_data #-}

-- | The font data.
bindDynamicFont_get_font_data :: MethodBind
bindDynamicFont_get_font_data
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_font_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font data.
get_font_data ::
                (DynamicFont :< cls, Object :< cls) => cls -> IO DynamicFontData
get_font_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_font_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_outline_color #-}

-- | The font outline's color.
--   			[b]Note:[/b] It's recommended to leave this at the default value so that you can adjust it in individual controls. For example, if the outline is made black here, it won't be possible to change its color using a Label's font outline modulate theme item.
bindDynamicFont_get_outline_color :: MethodBind
bindDynamicFont_get_outline_color
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_outline_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font outline's color.
--   			[b]Note:[/b] It's recommended to leave this at the default value so that you can adjust it in individual controls. For example, if the outline is made black here, it won't be possible to change its color using a Label's font outline modulate theme item.
get_outline_color ::
                    (DynamicFont :< cls, Object :< cls) => cls -> IO Color
get_outline_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_outline_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_outline_size #-}

-- | The font outline's thickness in pixels (not relative to the font size).
bindDynamicFont_get_outline_size :: MethodBind
bindDynamicFont_get_outline_size
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_outline_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font outline's thickness in pixels (not relative to the font size).
get_outline_size ::
                   (DynamicFont :< cls, Object :< cls) => cls -> IO Int
get_outline_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_outline_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_size #-}

-- | The font size in pixels.
bindDynamicFont_get_size :: MethodBind
bindDynamicFont_get_size
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font size in pixels.
get_size :: (DynamicFont :< cls, Object :< cls) => cls -> IO Int
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_spacing #-}

-- | Returns the spacing for the given [code]type[/code] (see [enum SpacingType]).
bindDynamicFont_get_spacing :: MethodBind
bindDynamicFont_get_spacing
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the spacing for the given [code]type[/code] (see [enum SpacingType]).
get_spacing ::
              (DynamicFont :< cls, Object :< cls) => cls -> Int -> IO Int
get_spacing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_spacing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_use_filter #-}

-- | If [code]true[/code], filtering is used. This makes the font blurry instead of pixelated when scaling it if font oversampling is disabled or ineffective. It's recommended to enable this when using the font in a control whose size changes over time, unless a pixel art aesthetic is desired.
bindDynamicFont_get_use_filter :: MethodBind
bindDynamicFont_get_use_filter
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_use_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], filtering is used. This makes the font blurry instead of pixelated when scaling it if font oversampling is disabled or ineffective. It's recommended to enable this when using the font in a control whose size changes over time, unless a pixel art aesthetic is desired.
get_use_filter ::
                 (DynamicFont :< cls, Object :< cls) => cls -> IO Bool
get_use_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_use_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_get_use_mipmaps #-}

-- | If [code]true[/code], mipmapping is used. This improves the font's appearance when downscaling it if font oversampling is disabled or ineffective.
bindDynamicFont_get_use_mipmaps :: MethodBind
bindDynamicFont_get_use_mipmaps
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "get_use_mipmaps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], mipmapping is used. This improves the font's appearance when downscaling it if font oversampling is disabled or ineffective.
get_use_mipmaps ::
                  (DynamicFont :< cls, Object :< cls) => cls -> IO Bool
get_use_mipmaps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_get_use_mipmaps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_remove_fallback #-}

-- | Removes the fallback font at index [code]idx[/code].
bindDynamicFont_remove_fallback :: MethodBind
bindDynamicFont_remove_fallback
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "remove_fallback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the fallback font at index [code]idx[/code].
remove_fallback ::
                  (DynamicFont :< cls, Object :< cls) => cls -> Int -> IO ()
remove_fallback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_remove_fallback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_fallback #-}

-- | Sets the fallback font at index [code]idx[/code].
bindDynamicFont_set_fallback :: MethodBind
bindDynamicFont_set_fallback
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_fallback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the fallback font at index [code]idx[/code].
set_fallback ::
               (DynamicFont :< cls, Object :< cls) =>
               cls -> Int -> DynamicFontData -> IO ()
set_fallback cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_fallback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_font_data #-}

-- | The font data.
bindDynamicFont_set_font_data :: MethodBind
bindDynamicFont_set_font_data
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_font_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font data.
set_font_data ::
                (DynamicFont :< cls, Object :< cls) =>
                cls -> DynamicFontData -> IO ()
set_font_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_font_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_outline_color #-}

-- | The font outline's color.
--   			[b]Note:[/b] It's recommended to leave this at the default value so that you can adjust it in individual controls. For example, if the outline is made black here, it won't be possible to change its color using a Label's font outline modulate theme item.
bindDynamicFont_set_outline_color :: MethodBind
bindDynamicFont_set_outline_color
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_outline_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font outline's color.
--   			[b]Note:[/b] It's recommended to leave this at the default value so that you can adjust it in individual controls. For example, if the outline is made black here, it won't be possible to change its color using a Label's font outline modulate theme item.
set_outline_color ::
                    (DynamicFont :< cls, Object :< cls) => cls -> Color -> IO ()
set_outline_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_outline_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_outline_size #-}

-- | The font outline's thickness in pixels (not relative to the font size).
bindDynamicFont_set_outline_size :: MethodBind
bindDynamicFont_set_outline_size
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_outline_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font outline's thickness in pixels (not relative to the font size).
set_outline_size ::
                   (DynamicFont :< cls, Object :< cls) => cls -> Int -> IO ()
set_outline_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_outline_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_size #-}

-- | The font size in pixels.
bindDynamicFont_set_size :: MethodBind
bindDynamicFont_set_size
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font size in pixels.
set_size ::
           (DynamicFont :< cls, Object :< cls) => cls -> Int -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_spacing #-}

-- | Sets the spacing for [code]type[/code] (see [enum SpacingType]) to [code]value[/code] in pixels (not relative to the font size).
bindDynamicFont_set_spacing :: MethodBind
bindDynamicFont_set_spacing
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the spacing for [code]type[/code] (see [enum SpacingType]) to [code]value[/code] in pixels (not relative to the font size).
set_spacing ::
              (DynamicFont :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_spacing cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_spacing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_use_filter #-}

-- | If [code]true[/code], filtering is used. This makes the font blurry instead of pixelated when scaling it if font oversampling is disabled or ineffective. It's recommended to enable this when using the font in a control whose size changes over time, unless a pixel art aesthetic is desired.
bindDynamicFont_set_use_filter :: MethodBind
bindDynamicFont_set_use_filter
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_use_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], filtering is used. This makes the font blurry instead of pixelated when scaling it if font oversampling is disabled or ineffective. It's recommended to enable this when using the font in a control whose size changes over time, unless a pixel art aesthetic is desired.
set_use_filter ::
                 (DynamicFont :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_use_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFont_set_use_mipmaps #-}

-- | If [code]true[/code], mipmapping is used. This improves the font's appearance when downscaling it if font oversampling is disabled or ineffective.
bindDynamicFont_set_use_mipmaps :: MethodBind
bindDynamicFont_set_use_mipmaps
  = unsafePerformIO $
      withCString "DynamicFont" $
        \ clsNamePtr ->
          withCString "set_use_mipmaps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], mipmapping is used. This improves the font's appearance when downscaling it if font oversampling is disabled or ineffective.
set_use_mipmaps ::
                  (DynamicFont :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_mipmaps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFont_set_use_mipmaps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)