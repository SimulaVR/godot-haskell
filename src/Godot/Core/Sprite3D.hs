{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Sprite3D
       (Godot.Core.Sprite3D.sig_frame_changed,
        Godot.Core.Sprite3D.get_frame,
        Godot.Core.Sprite3D.get_frame_coords,
        Godot.Core.Sprite3D.get_hframes,
        Godot.Core.Sprite3D.get_region_rect,
        Godot.Core.Sprite3D.get_texture, Godot.Core.Sprite3D.get_vframes,
        Godot.Core.Sprite3D.is_region, Godot.Core.Sprite3D.set_frame,
        Godot.Core.Sprite3D.set_frame_coords,
        Godot.Core.Sprite3D.set_hframes, Godot.Core.Sprite3D.set_region,
        Godot.Core.Sprite3D.set_region_rect,
        Godot.Core.Sprite3D.set_texture, Godot.Core.Sprite3D.set_vframes)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when the [member frame] changes.
sig_frame_changed :: Godot.Internal.Dispatch.Signal Sprite3D
sig_frame_changed = Godot.Internal.Dispatch.Signal "frame_changed"

instance NodeSignal Sprite3D "frame_changed" '[]

{-# NOINLINE bindSprite3D_get_frame #-}

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
bindSprite3D_get_frame :: MethodBind
bindSprite3D_get_frame
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
get_frame :: (Sprite3D :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_frame (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_get_frame_coords #-}

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the [member frame] property. [member vframes] or [member hframes] must be greater than 1.
bindSprite3D_get_frame_coords :: MethodBind
bindSprite3D_get_frame_coords
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_frame_coords" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the [member frame] property. [member vframes] or [member hframes] must be greater than 1.
get_frame_coords ::
                   (Sprite3D :< cls, Object :< cls) => cls -> IO Vector2
get_frame_coords cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_frame_coords (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_get_hframes #-}

-- | The number of columns in the sprite sheet.
bindSprite3D_get_hframes :: MethodBind
bindSprite3D_get_hframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_hframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the sprite sheet.
get_hframes :: (Sprite3D :< cls, Object :< cls) => cls -> IO Int
get_hframes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_hframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_get_region_rect #-}

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
bindSprite3D_get_region_rect :: MethodBind
bindSprite3D_get_region_rect
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
get_region_rect ::
                  (Sprite3D :< cls, Object :< cls) => cls -> IO Rect2
get_region_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_get_texture #-}

-- | [Texture] object to draw. If [member GeometryInstance.material_override] is used, this will be overridden.
bindSprite3D_get_texture :: MethodBind
bindSprite3D_get_texture
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] object to draw. If [member GeometryInstance.material_override] is used, this will be overridden.
get_texture ::
              (Sprite3D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_get_vframes #-}

-- | The number of rows in the sprite sheet.
bindSprite3D_get_vframes :: MethodBind
bindSprite3D_get_vframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_vframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the sprite sheet.
get_vframes :: (Sprite3D :< cls, Object :< cls) => cls -> IO Int
get_vframes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_vframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_is_region #-}

-- | If [code]true[/code], texture will be cut from a larger atlas texture. See [member region_rect].
bindSprite3D_is_region :: MethodBind
bindSprite3D_is_region
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "is_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture will be cut from a larger atlas texture. See [member region_rect].
is_region :: (Sprite3D :< cls, Object :< cls) => cls -> IO Bool
is_region cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_is_region (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_frame #-}

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
bindSprite3D_set_frame :: MethodBind
bindSprite3D_set_frame
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. [member vframes] or [member hframes] must be greater than 1.
set_frame ::
            (Sprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_frame (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_frame_coords #-}

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the [member frame] property. [member vframes] or [member hframes] must be greater than 1.
bindSprite3D_set_frame_coords :: MethodBind
bindSprite3D_set_frame_coords
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_frame_coords" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the [member frame] property. [member vframes] or [member hframes] must be greater than 1.
set_frame_coords ::
                   (Sprite3D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_frame_coords cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_frame_coords (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_hframes #-}

-- | The number of columns in the sprite sheet.
bindSprite3D_set_hframes :: MethodBind
bindSprite3D_set_hframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_hframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the sprite sheet.
set_hframes ::
              (Sprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_hframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_hframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_region #-}

-- | If [code]true[/code], texture will be cut from a larger atlas texture. See [member region_rect].
bindSprite3D_set_region :: MethodBind
bindSprite3D_set_region
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], texture will be cut from a larger atlas texture. See [member region_rect].
set_region ::
             (Sprite3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_region (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_region_rect #-}

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
bindSprite3D_set_region_rect :: MethodBind
bindSprite3D_set_region_rect
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. [member region_enabled] must be [code]true[/code].
set_region_rect ::
                  (Sprite3D :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_texture #-}

-- | [Texture] object to draw. If [member GeometryInstance.material_override] is used, this will be overridden.
bindSprite3D_set_texture :: MethodBind
bindSprite3D_set_texture
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] object to draw. If [member GeometryInstance.material_override] is used, this will be overridden.
set_texture ::
              (Sprite3D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSprite3D_set_vframes #-}

-- | The number of rows in the sprite sheet.
bindSprite3D_set_vframes :: MethodBind
bindSprite3D_set_vframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_vframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the sprite sheet.
set_vframes ::
              (Sprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_vframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_vframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)