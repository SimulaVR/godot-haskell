{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Sprite
       (Godot.Core.Sprite.sig_frame_changed,
        Godot.Core.Sprite.sig_texture_changed,
        Godot.Core.Sprite.set_texture, Godot.Core.Sprite.get_texture,
        Godot.Core.Sprite.set_normal_map, Godot.Core.Sprite.get_normal_map,
        Godot.Core.Sprite.set_centered, Godot.Core.Sprite.is_centered,
        Godot.Core.Sprite.set_offset, Godot.Core.Sprite.get_offset,
        Godot.Core.Sprite.set_flip_h, Godot.Core.Sprite.is_flipped_h,
        Godot.Core.Sprite.set_flip_v, Godot.Core.Sprite.is_flipped_v,
        Godot.Core.Sprite.set_region, Godot.Core.Sprite.is_region,
        Godot.Core.Sprite.is_pixel_opaque,
        Godot.Core.Sprite.set_region_rect,
        Godot.Core.Sprite.get_region_rect,
        Godot.Core.Sprite.set_region_filter_clip,
        Godot.Core.Sprite.is_region_filter_clip_enabled,
        Godot.Core.Sprite.set_frame, Godot.Core.Sprite.get_frame,
        Godot.Core.Sprite.set_vframes, Godot.Core.Sprite.get_vframes,
        Godot.Core.Sprite.set_hframes, Godot.Core.Sprite.get_hframes,
        Godot.Core.Sprite.get_rect)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when the [member frame] changes.
sig_frame_changed :: Godot.Internal.Dispatch.Signal Sprite
sig_frame_changed = Godot.Internal.Dispatch.Signal "frame_changed"

-- | Emitted when the [member texture] changes.
sig_texture_changed :: Godot.Internal.Dispatch.Signal Sprite
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

{-# NOINLINE bindSprite_set_texture #-}

-- | [Texture] object to draw.
bindSprite_set_texture :: MethodBind
bindSprite_set_texture
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] object to draw.
set_texture ::
              (Sprite :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_texture #-}

-- | [Texture] object to draw.
bindSprite_get_texture :: MethodBind
bindSprite_get_texture
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] object to draw.
get_texture :: (Sprite :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_normal_map #-}

-- | The normal map gives depth to the Sprite.
bindSprite_set_normal_map :: MethodBind
bindSprite_set_normal_map
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map gives depth to the Sprite.
set_normal_map ::
                 (Sprite :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_normal_map #-}

-- | The normal map gives depth to the Sprite.
bindSprite_get_normal_map :: MethodBind
bindSprite_get_normal_map
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map gives depth to the Sprite.
get_normal_map ::
                 (Sprite :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_centered #-}

-- | If [code]true[/code], texture is centered. Default value: [code]true[/code].
bindSprite_set_centered :: MethodBind
bindSprite_set_centered
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is centered. Default value: [code]true[/code].
set_centered ::
               (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_centered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_centered (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_is_centered #-}

-- | If [code]true[/code], texture is centered. Default value: [code]true[/code].
bindSprite_is_centered :: MethodBind
bindSprite_is_centered
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is centered. Default value: [code]true[/code].
is_centered :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_centered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_centered (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_offset #-}

-- | The texture's drawing offset.
bindSprite_set_offset :: MethodBind
bindSprite_set_offset
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's drawing offset.
set_offset ::
             (Sprite :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_offset #-}

-- | The texture's drawing offset.
bindSprite_get_offset :: MethodBind
bindSprite_get_offset
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's drawing offset.
get_offset :: (Sprite :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_flip_h #-}

-- | If [code]true[/code], texture is flipped horizontally. Default value: [code]false[/code].
bindSprite_set_flip_h :: MethodBind
bindSprite_set_flip_h
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_flip_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is flipped horizontally. Default value: [code]false[/code].
set_flip_h ::
             (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_h cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_flip_h (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_is_flipped_h #-}

-- | If [code]true[/code], texture is flipped horizontally. Default value: [code]false[/code].
bindSprite_is_flipped_h :: MethodBind
bindSprite_is_flipped_h
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_flipped_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is flipped horizontally. Default value: [code]false[/code].
is_flipped_h :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_flipped_h cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_flipped_h (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_flip_v #-}

-- | If [code]true[/code], texture is flipped vertically. Default value: [code]false[/code].
bindSprite_set_flip_v :: MethodBind
bindSprite_set_flip_v
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_flip_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is flipped vertically. Default value: [code]false[/code].
set_flip_v ::
             (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_v cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_flip_v (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_is_flipped_v #-}

-- | If [code]true[/code], texture is flipped vertically. Default value: [code]false[/code].
bindSprite_is_flipped_v :: MethodBind
bindSprite_is_flipped_v
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_flipped_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is flipped vertically. Default value: [code]false[/code].
is_flipped_v :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_flipped_v cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_flipped_v (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_region #-}

-- | If [code]true[/code], texture is cut from a larger atlas texture. See [code]region_rect[/code]. Default value: [code]false[/code].
bindSprite_set_region :: MethodBind
bindSprite_set_region
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is cut from a larger atlas texture. See [code]region_rect[/code]. Default value: [code]false[/code].
set_region ::
             (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_region (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_is_region #-}

-- | If [code]true[/code], texture is cut from a larger atlas texture. See [code]region_rect[/code]. Default value: [code]false[/code].
bindSprite_is_region :: MethodBind
bindSprite_is_region
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture is cut from a larger atlas texture. See [code]region_rect[/code]. Default value: [code]false[/code].
is_region :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_region cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_region (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_is_pixel_opaque #-}

bindSprite_is_pixel_opaque :: MethodBind
bindSprite_is_pixel_opaque
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_pixel_opaque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_pixel_opaque ::
                  (Sprite :< cls, Object :< cls) => cls -> Vector2 -> IO Bool
is_pixel_opaque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_pixel_opaque (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_region_rect #-}

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
bindSprite_set_region_rect :: MethodBind
bindSprite_set_region_rect
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
set_region_rect ::
                  (Sprite :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_region_rect #-}

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
bindSprite_get_region_rect :: MethodBind
bindSprite_get_region_rect
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
get_region_rect ::
                  (Sprite :< cls, Object :< cls) => cls -> IO Rect2
get_region_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_region_filter_clip #-}

-- | If [code]true[/code], the outermost pixels get blurred out.
bindSprite_set_region_filter_clip :: MethodBind
bindSprite_set_region_filter_clip
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_region_filter_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the outermost pixels get blurred out.
set_region_filter_clip ::
                         (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_region_filter_clip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_region_filter_clip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_is_region_filter_clip_enabled #-}

-- | If [code]true[/code], the outermost pixels get blurred out.
bindSprite_is_region_filter_clip_enabled :: MethodBind
bindSprite_is_region_filter_clip_enabled
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_region_filter_clip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the outermost pixels get blurred out.
is_region_filter_clip_enabled ::
                                (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_region_filter_clip_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_region_filter_clip_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_frame #-}

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
bindSprite_set_frame :: MethodBind
bindSprite_set_frame
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
set_frame :: (Sprite :< cls, Object :< cls) => cls -> Int -> IO ()
set_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_frame (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_frame #-}

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
bindSprite_get_frame :: MethodBind
bindSprite_get_frame
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
get_frame :: (Sprite :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_frame (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_vframes #-}

-- | The number of rows in the sprite sheet.
bindSprite_set_vframes :: MethodBind
bindSprite_set_vframes
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_vframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the sprite sheet.
set_vframes ::
              (Sprite :< cls, Object :< cls) => cls -> Int -> IO ()
set_vframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_vframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_vframes #-}

-- | The number of rows in the sprite sheet.
bindSprite_get_vframes :: MethodBind
bindSprite_get_vframes
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_vframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the sprite sheet.
get_vframes :: (Sprite :< cls, Object :< cls) => cls -> IO Int
get_vframes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_vframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_set_hframes #-}

-- | The number of columns in the sprite sheet.
bindSprite_set_hframes :: MethodBind
bindSprite_set_hframes
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_hframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the sprite sheet.
set_hframes ::
              (Sprite :< cls, Object :< cls) => cls -> Int -> IO ()
set_hframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_hframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_hframes #-}

-- | The number of columns in the sprite sheet.
bindSprite_get_hframes :: MethodBind
bindSprite_get_hframes
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_hframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the sprite sheet.
get_hframes :: (Sprite :< cls, Object :< cls) => cls -> IO Int
get_hframes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_hframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite_get_rect #-}

-- | Returns a Rect2 representing the Sprite's boundary relative to its local coordinates.
bindSprite_get_rect :: MethodBind
bindSprite_get_rect
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a Rect2 representing the Sprite's boundary relative to its local coordinates.
get_rect :: (Sprite :< cls, Object :< cls) => cls -> IO Rect2
get_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_rect (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)