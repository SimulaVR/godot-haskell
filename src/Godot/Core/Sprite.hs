{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Sprite
       (Godot.Core.Sprite.sig_frame_changed,
        Godot.Core.Sprite.sig_texture_changed,
        Godot.Core.Sprite._texture_changed, Godot.Core.Sprite.get_frame,
        Godot.Core.Sprite.get_frame_coords, Godot.Core.Sprite.get_hframes,
        Godot.Core.Sprite.get_normal_map, Godot.Core.Sprite.get_offset,
        Godot.Core.Sprite.get_rect, Godot.Core.Sprite.get_region_rect,
        Godot.Core.Sprite.get_texture, Godot.Core.Sprite.get_vframes,
        Godot.Core.Sprite.is_centered, Godot.Core.Sprite.is_flipped_h,
        Godot.Core.Sprite.is_flipped_v, Godot.Core.Sprite.is_pixel_opaque,
        Godot.Core.Sprite.is_region,
        Godot.Core.Sprite.is_region_filter_clip_enabled,
        Godot.Core.Sprite.set_centered, Godot.Core.Sprite.set_flip_h,
        Godot.Core.Sprite.set_flip_v, Godot.Core.Sprite.set_frame,
        Godot.Core.Sprite.set_frame_coords, Godot.Core.Sprite.set_hframes,
        Godot.Core.Sprite.set_normal_map, Godot.Core.Sprite.set_offset,
        Godot.Core.Sprite.set_region,
        Godot.Core.Sprite.set_region_filter_clip,
        Godot.Core.Sprite.set_region_rect, Godot.Core.Sprite.set_texture,
        Godot.Core.Sprite.set_vframes)
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

-- | Emitted when the @frame@ changes.
sig_frame_changed :: Godot.Internal.Dispatch.Signal Sprite
sig_frame_changed = Godot.Internal.Dispatch.Signal "frame_changed"

instance NodeSignal Sprite "frame_changed" '[]

-- | Emitted when the @texture@ changes.
sig_texture_changed :: Godot.Internal.Dispatch.Signal Sprite
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

instance NodeSignal Sprite "texture_changed" '[]

instance NodeProperty Sprite "centered" Bool 'False where
        nodeProperty
          = (is_centered, wrapDroppingSetter set_centered, Nothing)

instance NodeProperty Sprite "flip_h" Bool 'False where
        nodeProperty
          = (is_flipped_h, wrapDroppingSetter set_flip_h, Nothing)

instance NodeProperty Sprite "flip_v" Bool 'False where
        nodeProperty
          = (is_flipped_v, wrapDroppingSetter set_flip_v, Nothing)

instance NodeProperty Sprite "frame" Int 'False where
        nodeProperty = (get_frame, wrapDroppingSetter set_frame, Nothing)

instance NodeProperty Sprite "frame_coords" Vector2 'False where
        nodeProperty
          = (get_frame_coords, wrapDroppingSetter set_frame_coords, Nothing)

instance NodeProperty Sprite "hframes" Int 'False where
        nodeProperty
          = (get_hframes, wrapDroppingSetter set_hframes, Nothing)

instance NodeProperty Sprite "normal_map" Texture 'False where
        nodeProperty
          = (get_normal_map, wrapDroppingSetter set_normal_map, Nothing)

instance NodeProperty Sprite "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty Sprite "region_enabled" Bool 'False where
        nodeProperty = (is_region, wrapDroppingSetter set_region, Nothing)

instance NodeProperty Sprite "region_filter_clip" Bool 'False where
        nodeProperty
          = (is_region_filter_clip_enabled,
             wrapDroppingSetter set_region_filter_clip, Nothing)

instance NodeProperty Sprite "region_rect" Rect2 'False where
        nodeProperty
          = (get_region_rect, wrapDroppingSetter set_region_rect, Nothing)

instance NodeProperty Sprite "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

instance NodeProperty Sprite "vframes" Int 'False where
        nodeProperty
          = (get_vframes, wrapDroppingSetter set_vframes, Nothing)

{-# NOINLINE bindSprite__texture_changed #-}

bindSprite__texture_changed :: MethodBind
bindSprite__texture_changed
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "_texture_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_texture_changed :: (Sprite :< cls, Object :< cls) => cls -> IO ()
_texture_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite__texture_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "_texture_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.Sprite._texture_changed

{-# NOINLINE bindSprite_get_frame #-}

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
bindSprite_get_frame :: MethodBind
bindSprite_get_frame
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
get_frame :: (Sprite :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_frame (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "get_frame" '[] (IO Int) where
        nodeMethod = Godot.Core.Sprite.get_frame

{-# NOINLINE bindSprite_get_frame_coords #-}

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
bindSprite_get_frame_coords :: MethodBind
bindSprite_get_frame_coords
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_frame_coords" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
get_frame_coords ::
                   (Sprite :< cls, Object :< cls) => cls -> IO Vector2
get_frame_coords cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_frame_coords (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "get_frame_coords" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Sprite.get_frame_coords

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

instance NodeMethod Sprite "get_hframes" '[] (IO Int) where
        nodeMethod = Godot.Core.Sprite.get_hframes

{-# NOINLINE bindSprite_get_normal_map #-}

-- | The normal map gives depth to the Sprite.
--   			__Note:__ Godot expects the normal map to use X+, Y-, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
bindSprite_get_normal_map :: MethodBind
bindSprite_get_normal_map
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map gives depth to the Sprite.
--   			__Note:__ Godot expects the normal map to use X+, Y-, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
get_normal_map ::
                 (Sprite :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "get_normal_map" '[] (IO Texture) where
        nodeMethod = Godot.Core.Sprite.get_normal_map

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

instance NodeMethod Sprite "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.Sprite.get_offset

{-# NOINLINE bindSprite_get_rect #-}

-- | Returns a @Rect2@ representing the Sprite's boundary in local coordinates. Can be used to detect if the Sprite was clicked. Example:
--   				
--   @
--   
--   				func _input(event):
--   				    if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
--   				        if get_rect().has_point(to_local(event.position)):
--   				            print("A click!")
--   				
--   @
bindSprite_get_rect :: MethodBind
bindSprite_get_rect
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @Rect2@ representing the Sprite's boundary in local coordinates. Can be used to detect if the Sprite was clicked. Example:
--   				
--   @
--   
--   				func _input(event):
--   				    if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
--   				        if get_rect().has_point(to_local(event.position)):
--   				            print("A click!")
--   				
--   @
get_rect :: (Sprite :< cls, Object :< cls) => cls -> IO Rect2
get_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_rect (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "get_rect" '[] (IO Rect2) where
        nodeMethod = Godot.Core.Sprite.get_rect

{-# NOINLINE bindSprite_get_region_rect #-}

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
bindSprite_get_region_rect :: MethodBind
bindSprite_get_region_rect
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
get_region_rect ::
                  (Sprite :< cls, Object :< cls) => cls -> IO Rect2
get_region_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "get_region_rect" '[] (IO Rect2) where
        nodeMethod = Godot.Core.Sprite.get_region_rect

{-# NOINLINE bindSprite_get_texture #-}

-- | @Texture@ object to draw.
bindSprite_get_texture :: MethodBind
bindSprite_get_texture
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ object to draw.
get_texture :: (Sprite :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "get_texture" '[] (IO Texture) where
        nodeMethod = Godot.Core.Sprite.get_texture

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

instance NodeMethod Sprite "get_vframes" '[] (IO Int) where
        nodeMethod = Godot.Core.Sprite.get_vframes

{-# NOINLINE bindSprite_is_centered #-}

-- | If @true@, texture is centered.
bindSprite_is_centered :: MethodBind
bindSprite_is_centered
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is centered.
is_centered :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_centered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_centered (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "is_centered" '[] (IO Bool) where
        nodeMethod = Godot.Core.Sprite.is_centered

{-# NOINLINE bindSprite_is_flipped_h #-}

-- | If @true@, texture is flipped horizontally.
bindSprite_is_flipped_h :: MethodBind
bindSprite_is_flipped_h
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_flipped_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
is_flipped_h :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_flipped_h cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_flipped_h (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "is_flipped_h" '[] (IO Bool) where
        nodeMethod = Godot.Core.Sprite.is_flipped_h

{-# NOINLINE bindSprite_is_flipped_v #-}

-- | If @true@, texture is flipped vertically.
bindSprite_is_flipped_v :: MethodBind
bindSprite_is_flipped_v
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_flipped_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
is_flipped_v :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_flipped_v cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_flipped_v (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "is_flipped_v" '[] (IO Bool) where
        nodeMethod = Godot.Core.Sprite.is_flipped_v

{-# NOINLINE bindSprite_is_pixel_opaque #-}

-- | Returns @true@, if the pixel at the given position is opaque and @false@ in other case.
--   				__Note:__ It also returns @false@, if the sprite's texture is @null@ or if the given position is invalid.
bindSprite_is_pixel_opaque :: MethodBind
bindSprite_is_pixel_opaque
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_pixel_opaque" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@, if the pixel at the given position is opaque and @false@ in other case.
--   				__Note:__ It also returns @false@, if the sprite's texture is @null@ or if the given position is invalid.
is_pixel_opaque ::
                  (Sprite :< cls, Object :< cls) => cls -> Vector2 -> IO Bool
is_pixel_opaque cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_pixel_opaque (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "is_pixel_opaque" '[Vector2] (IO Bool)
         where
        nodeMethod = Godot.Core.Sprite.is_pixel_opaque

{-# NOINLINE bindSprite_is_region #-}

-- | If @true@, texture is cut from a larger atlas texture. See @region_rect@.
bindSprite_is_region :: MethodBind
bindSprite_is_region
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is cut from a larger atlas texture. See @region_rect@.
is_region :: (Sprite :< cls, Object :< cls) => cls -> IO Bool
is_region cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_is_region (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "is_region" '[] (IO Bool) where
        nodeMethod = Godot.Core.Sprite.is_region

{-# NOINLINE bindSprite_is_region_filter_clip_enabled #-}

-- | If @true@, the outermost pixels get blurred out.
bindSprite_is_region_filter_clip_enabled :: MethodBind
bindSprite_is_region_filter_clip_enabled
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "is_region_filter_clip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the outermost pixels get blurred out.
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

instance NodeMethod Sprite "is_region_filter_clip_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Sprite.is_region_filter_clip_enabled

{-# NOINLINE bindSprite_set_centered #-}

-- | If @true@, texture is centered.
bindSprite_set_centered :: MethodBind
bindSprite_set_centered
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is centered.
set_centered ::
               (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_centered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_centered (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_centered" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_centered

{-# NOINLINE bindSprite_set_flip_h #-}

-- | If @true@, texture is flipped horizontally.
bindSprite_set_flip_h :: MethodBind
bindSprite_set_flip_h
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_flip_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
set_flip_h ::
             (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_h cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_flip_h (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_flip_h" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_flip_h

{-# NOINLINE bindSprite_set_flip_v #-}

-- | If @true@, texture is flipped vertically.
bindSprite_set_flip_v :: MethodBind
bindSprite_set_flip_v
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_flip_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
set_flip_v ::
             (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_v cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_flip_v (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_flip_v" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_flip_v

{-# NOINLINE bindSprite_set_frame #-}

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
bindSprite_set_frame :: MethodBind
bindSprite_set_frame
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
set_frame :: (Sprite :< cls, Object :< cls) => cls -> Int -> IO ()
set_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_frame (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_frame" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_frame

{-# NOINLINE bindSprite_set_frame_coords #-}

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
bindSprite_set_frame_coords :: MethodBind
bindSprite_set_frame_coords
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_frame_coords" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
set_frame_coords ::
                   (Sprite :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_frame_coords cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_frame_coords (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_frame_coords" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Sprite.set_frame_coords

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

instance NodeMethod Sprite "set_hframes" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_hframes

{-# NOINLINE bindSprite_set_normal_map #-}

-- | The normal map gives depth to the Sprite.
--   			__Note:__ Godot expects the normal map to use X+, Y-, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
bindSprite_set_normal_map :: MethodBind
bindSprite_set_normal_map
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map gives depth to the Sprite.
--   			__Note:__ Godot expects the normal map to use X+, Y-, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
set_normal_map ::
                 (Sprite :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_normal_map" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.Sprite.set_normal_map

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

instance NodeMethod Sprite "set_offset" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_offset

{-# NOINLINE bindSprite_set_region #-}

-- | If @true@, texture is cut from a larger atlas texture. See @region_rect@.
bindSprite_set_region :: MethodBind
bindSprite_set_region
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is cut from a larger atlas texture. See @region_rect@.
set_region ::
             (Sprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_region (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_region" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_region

{-# NOINLINE bindSprite_set_region_filter_clip #-}

-- | If @true@, the outermost pixels get blurred out.
bindSprite_set_region_filter_clip :: MethodBind
bindSprite_set_region_filter_clip
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_region_filter_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the outermost pixels get blurred out.
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

instance NodeMethod Sprite "set_region_filter_clip" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Sprite.set_region_filter_clip

{-# NOINLINE bindSprite_set_region_rect #-}

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
bindSprite_set_region_rect :: MethodBind
bindSprite_set_region_rect
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
set_region_rect ::
                  (Sprite :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_region_rect" '[Rect2] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_region_rect

{-# NOINLINE bindSprite_set_texture #-}

-- | @Texture@ object to draw.
bindSprite_set_texture :: MethodBind
bindSprite_set_texture
  = unsafePerformIO $
      withCString "Sprite" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ object to draw.
set_texture ::
              (Sprite :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite_set_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite "set_texture" '[Texture] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_texture

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

instance NodeMethod Sprite "set_vframes" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sprite.set_vframes