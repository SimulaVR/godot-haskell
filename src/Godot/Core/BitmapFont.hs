{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.BitmapFont
       (Godot.Core.BitmapFont.get_height,
        Godot.Core.BitmapFont.get_ascent,
        Godot.Core.BitmapFont.is_distance_field_hint,
        Godot.Core.BitmapFont.create_from_fnt,
        Godot.Core.BitmapFont.set_height, Godot.Core.BitmapFont.set_ascent,
        Godot.Core.BitmapFont.add_kerning_pair,
        Godot.Core.BitmapFont.get_kerning_pair,
        Godot.Core.BitmapFont.add_texture, Godot.Core.BitmapFont.add_char,
        Godot.Core.BitmapFont.get_texture_count,
        Godot.Core.BitmapFont.get_texture,
        Godot.Core.BitmapFont.get_char_size,
        Godot.Core.BitmapFont.set_distance_field_hint,
        Godot.Core.BitmapFont.clear, Godot.Core.BitmapFont._set_chars,
        Godot.Core.BitmapFont._get_chars,
        Godot.Core.BitmapFont._set_kernings,
        Godot.Core.BitmapFont._get_kernings,
        Godot.Core.BitmapFont._set_textures,
        Godot.Core.BitmapFont._get_textures,
        Godot.Core.BitmapFont.set_fallback,
        Godot.Core.BitmapFont.get_fallback)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindBitmapFont_get_height #-}

-- | Total font height (ascent plus descent) in pixels.
bindBitmapFont_get_height :: MethodBind
bindBitmapFont_get_height
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Total font height (ascent plus descent) in pixels.
get_height :: (BitmapFont :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_get_ascent #-}

-- | Ascent (number of pixels above the baseline).
bindBitmapFont_get_ascent :: MethodBind
bindBitmapFont_get_ascent
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_ascent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ascent (number of pixels above the baseline).
get_ascent :: (BitmapFont :< cls, Object :< cls) => cls -> IO Float
get_ascent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_ascent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_is_distance_field_hint #-}

-- | If [code]true[/code], distance field hint is enabled.
bindBitmapFont_is_distance_field_hint :: MethodBind
bindBitmapFont_is_distance_field_hint
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "is_distance_field_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], distance field hint is enabled.
is_distance_field_hint ::
                         (BitmapFont :< cls, Object :< cls) => cls -> IO Bool
is_distance_field_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_is_distance_field_hint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_create_from_fnt #-}

-- | Creates a BitmapFont from the [code]*.fnt[/code] file at [code]path[/code].
bindBitmapFont_create_from_fnt :: MethodBind
bindBitmapFont_create_from_fnt
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "create_from_fnt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a BitmapFont from the [code]*.fnt[/code] file at [code]path[/code].
create_from_fnt ::
                  (BitmapFont :< cls, Object :< cls) => cls -> GodotString -> IO Int
create_from_fnt cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_create_from_fnt (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_set_height #-}

-- | Total font height (ascent plus descent) in pixels.
bindBitmapFont_set_height :: MethodBind
bindBitmapFont_set_height
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Total font height (ascent plus descent) in pixels.
set_height ::
             (BitmapFont :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_set_ascent #-}

-- | Ascent (number of pixels above the baseline).
bindBitmapFont_set_ascent :: MethodBind
bindBitmapFont_set_ascent
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "set_ascent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ascent (number of pixels above the baseline).
set_ascent ::
             (BitmapFont :< cls, Object :< cls) => cls -> Float -> IO ()
set_ascent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_set_ascent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_add_kerning_pair #-}

-- | Adds a kerning pair to the [code]BitmapFont[/code] as a difference. Kerning pairs are special cases where a typeface advance is determined by the next character.
bindBitmapFont_add_kerning_pair :: MethodBind
bindBitmapFont_add_kerning_pair
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "add_kerning_pair" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a kerning pair to the [code]BitmapFont[/code] as a difference. Kerning pairs are special cases where a typeface advance is determined by the next character.
add_kerning_pair ::
                   (BitmapFont :< cls, Object :< cls) =>
                   cls -> Int -> Int -> Int -> IO ()
add_kerning_pair cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_add_kerning_pair (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_get_kerning_pair #-}

-- | Returns a kerning pair as a difference.
bindBitmapFont_get_kerning_pair :: MethodBind
bindBitmapFont_get_kerning_pair
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_kerning_pair" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a kerning pair as a difference.
get_kerning_pair ::
                   (BitmapFont :< cls, Object :< cls) => cls -> Int -> Int -> IO Int
get_kerning_pair cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_kerning_pair (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_add_texture #-}

-- | Adds a texture to the [code]BitmapFont[/code].
bindBitmapFont_add_texture :: MethodBind
bindBitmapFont_add_texture
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "add_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a texture to the [code]BitmapFont[/code].
add_texture ::
              (BitmapFont :< cls, Object :< cls) => cls -> Texture -> IO ()
add_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_add_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_add_char #-}

-- | Adds a character to the font, where [code]character[/code] is the unicode value, [code]texture[/code] is the texture index, [code]rect[/code] is the region in the texture (in pixels!), [code]align[/code] is the (optional) alignment for the character and [code]advance[/code] is the (optional) advance.
bindBitmapFont_add_char :: MethodBind
bindBitmapFont_add_char
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "add_char" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a character to the font, where [code]character[/code] is the unicode value, [code]texture[/code] is the texture index, [code]rect[/code] is the region in the texture (in pixels!), [code]align[/code] is the (optional) alignment for the character and [code]advance[/code] is the (optional) advance.
add_char ::
           (BitmapFont :< cls, Object :< cls) =>
           cls -> Int -> Int -> Rect2 -> Vector2 -> Float -> IO ()
add_char cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_add_char (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_get_texture_count #-}

-- | Returns the number of textures in the BitmapFont atlas.
bindBitmapFont_get_texture_count :: MethodBind
bindBitmapFont_get_texture_count
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_texture_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of textures in the BitmapFont atlas.
get_texture_count ::
                    (BitmapFont :< cls, Object :< cls) => cls -> IO Int
get_texture_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_texture_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_get_texture #-}

-- | Returns the font atlas texture at index [code]idx[/code].
bindBitmapFont_get_texture :: MethodBind
bindBitmapFont_get_texture
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the font atlas texture at index [code]idx[/code].
get_texture ::
              (BitmapFont :< cls, Object :< cls) => cls -> Int -> IO Texture
get_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_get_char_size #-}

-- | Returns the size of a character, optionally taking kerning into account if the next character is provided.
bindBitmapFont_get_char_size :: MethodBind
bindBitmapFont_get_char_size
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_char_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of a character, optionally taking kerning into account if the next character is provided.
get_char_size ::
                (BitmapFont :< cls, Object :< cls) =>
                cls -> Int -> Int -> IO Vector2
get_char_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_char_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_set_distance_field_hint #-}

-- | If [code]true[/code], distance field hint is enabled.
bindBitmapFont_set_distance_field_hint :: MethodBind
bindBitmapFont_set_distance_field_hint
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "set_distance_field_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], distance field hint is enabled.
set_distance_field_hint ::
                          (BitmapFont :< cls, Object :< cls) => cls -> Bool -> IO ()
set_distance_field_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_set_distance_field_hint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_clear #-}

-- | Clears all the font data and settings.
bindBitmapFont_clear :: MethodBind
bindBitmapFont_clear
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all the font data and settings.
clear :: (BitmapFont :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont__set_chars #-}

bindBitmapFont__set_chars :: MethodBind
bindBitmapFont__set_chars
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "_set_chars" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_chars ::
             (BitmapFont :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
_set_chars cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont__set_chars (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont__get_chars #-}

bindBitmapFont__get_chars :: MethodBind
bindBitmapFont__get_chars
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "_get_chars" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_chars ::
             (BitmapFont :< cls, Object :< cls) => cls -> IO PoolIntArray
_get_chars cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont__get_chars (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont__set_kernings #-}

bindBitmapFont__set_kernings :: MethodBind
bindBitmapFont__set_kernings
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "_set_kernings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_kernings ::
                (BitmapFont :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
_set_kernings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont__set_kernings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont__get_kernings #-}

bindBitmapFont__get_kernings :: MethodBind
bindBitmapFont__get_kernings
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "_get_kernings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_kernings ::
                (BitmapFont :< cls, Object :< cls) => cls -> IO PoolIntArray
_get_kernings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont__get_kernings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont__set_textures #-}

bindBitmapFont__set_textures :: MethodBind
bindBitmapFont__set_textures
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "_set_textures" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_textures ::
                (BitmapFont :< cls, Object :< cls) => cls -> Array -> IO ()
_set_textures cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont__set_textures (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont__get_textures #-}

bindBitmapFont__get_textures :: MethodBind
bindBitmapFont__get_textures
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "_get_textures" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_textures ::
                (BitmapFont :< cls, Object :< cls) => cls -> IO Array
_get_textures cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont__get_textures (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_set_fallback #-}

-- | The fallback font.
bindBitmapFont_set_fallback :: MethodBind
bindBitmapFont_set_fallback
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "set_fallback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fallback font.
set_fallback ::
               (BitmapFont :< cls, Object :< cls) => cls -> BitmapFont -> IO ()
set_fallback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_set_fallback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBitmapFont_get_fallback #-}

-- | The fallback font.
bindBitmapFont_get_fallback :: MethodBind
bindBitmapFont_get_fallback
  = unsafePerformIO $
      withCString "BitmapFont" $
        \ clsNamePtr ->
          withCString "get_fallback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fallback font.
get_fallback ::
               (BitmapFont :< cls, Object :< cls) => cls -> IO BitmapFont
get_fallback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBitmapFont_get_fallback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)