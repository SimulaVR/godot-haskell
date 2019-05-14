{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TextureButton
       (Godot.Core.TextureButton._STRETCH_TILE,
        Godot.Core.TextureButton._STRETCH_KEEP_ASPECT_COVERED,
        Godot.Core.TextureButton._STRETCH_KEEP_ASPECT,
        Godot.Core.TextureButton._STRETCH_SCALE,
        Godot.Core.TextureButton._STRETCH_KEEP,
        Godot.Core.TextureButton._STRETCH_KEEP_CENTERED,
        Godot.Core.TextureButton._STRETCH_KEEP_ASPECT_CENTERED,
        Godot.Core.TextureButton.set_normal_texture,
        Godot.Core.TextureButton.set_pressed_texture,
        Godot.Core.TextureButton.set_hover_texture,
        Godot.Core.TextureButton.set_disabled_texture,
        Godot.Core.TextureButton.set_focused_texture,
        Godot.Core.TextureButton.set_click_mask,
        Godot.Core.TextureButton.set_expand,
        Godot.Core.TextureButton.set_stretch_mode,
        Godot.Core.TextureButton.get_normal_texture,
        Godot.Core.TextureButton.get_pressed_texture,
        Godot.Core.TextureButton.get_hover_texture,
        Godot.Core.TextureButton.get_disabled_texture,
        Godot.Core.TextureButton.get_focused_texture,
        Godot.Core.TextureButton.get_click_mask,
        Godot.Core.TextureButton.get_expand,
        Godot.Core.TextureButton.get_stretch_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STRETCH_TILE :: Int
_STRETCH_TILE = 1

_STRETCH_KEEP_ASPECT_COVERED :: Int
_STRETCH_KEEP_ASPECT_COVERED = 6

_STRETCH_KEEP_ASPECT :: Int
_STRETCH_KEEP_ASPECT = 4

_STRETCH_SCALE :: Int
_STRETCH_SCALE = 0

_STRETCH_KEEP :: Int
_STRETCH_KEEP = 2

_STRETCH_KEEP_CENTERED :: Int
_STRETCH_KEEP_CENTERED = 3

_STRETCH_KEEP_ASPECT_CENTERED :: Int
_STRETCH_KEEP_ASPECT_CENTERED = 5

{-# NOINLINE bindTextureButton_set_normal_texture #-}

-- | Texture to display by default, when the node is [b]not[/b] in the disabled, focused, hover or pressed state.
bindTextureButton_set_normal_texture :: MethodBind
bindTextureButton_set_normal_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display by default, when the node is [b]not[/b] in the disabled, focused, hover or pressed state.
set_normal_texture ::
                     (TextureButton :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_normal_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_pressed_texture #-}

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the enter key or if the player presses the [member BaseButton.shortcut] key.
bindTextureButton_set_pressed_texture :: MethodBind
bindTextureButton_set_pressed_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_pressed_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the enter key or if the player presses the [member BaseButton.shortcut] key.
set_pressed_texture ::
                      (TextureButton :< cls, Object :< cls) => cls -> Texture -> IO ()
set_pressed_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_pressed_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_hover_texture #-}

-- | Texture to display when the mouse hovers the node.
bindTextureButton_set_hover_texture :: MethodBind
bindTextureButton_set_hover_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_hover_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the mouse hovers the node.
set_hover_texture ::
                    (TextureButton :< cls, Object :< cls) => cls -> Texture -> IO ()
set_hover_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_hover_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_disabled_texture #-}

-- | Texture to display when the node is disabled. See [member BaseButton.disabled].
bindTextureButton_set_disabled_texture :: MethodBind
bindTextureButton_set_disabled_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_disabled_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the node is disabled. See [member BaseButton.disabled].
set_disabled_texture ::
                       (TextureButton :< cls, Object :< cls) => cls -> Texture -> IO ()
set_disabled_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_disabled_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_focused_texture #-}

-- | Texture to display when the node has mouse or keyboard focus.
bindTextureButton_set_focused_texture :: MethodBind
bindTextureButton_set_focused_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_focused_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the node has mouse or keyboard focus.
set_focused_texture ::
                      (TextureButton :< cls, Object :< cls) => cls -> Texture -> IO ()
set_focused_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_focused_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_click_mask #-}

-- | Pure black and white [BitMap] image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
bindTextureButton_set_click_mask :: MethodBind
bindTextureButton_set_click_mask
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_click_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pure black and white [BitMap] image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
set_click_mask ::
                 (TextureButton :< cls, Object :< cls) => cls -> BitMap -> IO ()
set_click_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_click_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_expand #-}

-- | If [code]true[/code], the texture stretches to the edges of the node's bounding rectangle using the [member stretch_mode]. If [code]false[/code], the texture will not scale with the node. Default value: [code]false[/code].
bindTextureButton_set_expand :: MethodBind
bindTextureButton_set_expand
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the texture stretches to the edges of the node's bounding rectangle using the [member stretch_mode]. If [code]false[/code], the texture will not scale with the node. Default value: [code]false[/code].
set_expand ::
             (TextureButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_set_stretch_mode #-}

-- | Controls the texture's behavior when you resize the node's bounding rectangle, [b]only if[/b] [member expand] is [code]true[/code]. Set it to one of the [code]STRETCH_*[/code] constants. See the constants to learn more.
bindTextureButton_set_stretch_mode :: MethodBind
bindTextureButton_set_stretch_mode
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when you resize the node's bounding rectangle, [b]only if[/b] [member expand] is [code]true[/code]. Set it to one of the [code]STRETCH_*[/code] constants. See the constants to learn more.
set_stretch_mode ::
                   (TextureButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_stretch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_normal_texture #-}

-- | Texture to display by default, when the node is [b]not[/b] in the disabled, focused, hover or pressed state.
bindTextureButton_get_normal_texture :: MethodBind
bindTextureButton_get_normal_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display by default, when the node is [b]not[/b] in the disabled, focused, hover or pressed state.
get_normal_texture ::
                     (TextureButton :< cls, Object :< cls) => cls -> IO Texture
get_normal_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_normal_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_pressed_texture #-}

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the enter key or if the player presses the [member BaseButton.shortcut] key.
bindTextureButton_get_pressed_texture :: MethodBind
bindTextureButton_get_pressed_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_pressed_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the enter key or if the player presses the [member BaseButton.shortcut] key.
get_pressed_texture ::
                      (TextureButton :< cls, Object :< cls) => cls -> IO Texture
get_pressed_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_pressed_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_hover_texture #-}

-- | Texture to display when the mouse hovers the node.
bindTextureButton_get_hover_texture :: MethodBind
bindTextureButton_get_hover_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_hover_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the mouse hovers the node.
get_hover_texture ::
                    (TextureButton :< cls, Object :< cls) => cls -> IO Texture
get_hover_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_hover_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_disabled_texture #-}

-- | Texture to display when the node is disabled. See [member BaseButton.disabled].
bindTextureButton_get_disabled_texture :: MethodBind
bindTextureButton_get_disabled_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_disabled_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the node is disabled. See [member BaseButton.disabled].
get_disabled_texture ::
                       (TextureButton :< cls, Object :< cls) => cls -> IO Texture
get_disabled_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_disabled_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_focused_texture #-}

-- | Texture to display when the node has mouse or keyboard focus.
bindTextureButton_get_focused_texture :: MethodBind
bindTextureButton_get_focused_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_focused_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the node has mouse or keyboard focus.
get_focused_texture ::
                      (TextureButton :< cls, Object :< cls) => cls -> IO Texture
get_focused_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_focused_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_click_mask #-}

-- | Pure black and white [BitMap] image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
bindTextureButton_get_click_mask :: MethodBind
bindTextureButton_get_click_mask
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_click_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pure black and white [BitMap] image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
get_click_mask ::
                 (TextureButton :< cls, Object :< cls) => cls -> IO BitMap
get_click_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_click_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_expand #-}

-- | If [code]true[/code], the texture stretches to the edges of the node's bounding rectangle using the [member stretch_mode]. If [code]false[/code], the texture will not scale with the node. Default value: [code]false[/code].
bindTextureButton_get_expand :: MethodBind
bindTextureButton_get_expand
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the texture stretches to the edges of the node's bounding rectangle using the [member stretch_mode]. If [code]false[/code], the texture will not scale with the node. Default value: [code]false[/code].
get_expand ::
             (TextureButton :< cls, Object :< cls) => cls -> IO Bool
get_expand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureButton_get_stretch_mode #-}

-- | Controls the texture's behavior when you resize the node's bounding rectangle, [b]only if[/b] [member expand] is [code]true[/code]. Set it to one of the [code]STRETCH_*[/code] constants. See the constants to learn more.
bindTextureButton_get_stretch_mode :: MethodBind
bindTextureButton_get_stretch_mode
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when you resize the node's bounding rectangle, [b]only if[/b] [member expand] is [code]true[/code]. Set it to one of the [code]STRETCH_*[/code] constants. See the constants to learn more.
get_stretch_mode ::
                   (TextureButton :< cls, Object :< cls) => cls -> IO Int
get_stretch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)