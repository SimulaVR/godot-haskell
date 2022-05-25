{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextureButton
       (Godot.Core.TextureButton._STRETCH_KEEP_ASPECT,
        Godot.Core.TextureButton._STRETCH_KEEP,
        Godot.Core.TextureButton._STRETCH_KEEP_ASPECT_CENTERED,
        Godot.Core.TextureButton._STRETCH_SCALE,
        Godot.Core.TextureButton._STRETCH_KEEP_ASPECT_COVERED,
        Godot.Core.TextureButton._STRETCH_TILE,
        Godot.Core.TextureButton._STRETCH_KEEP_CENTERED,
        Godot.Core.TextureButton.get_click_mask,
        Godot.Core.TextureButton.get_disabled_texture,
        Godot.Core.TextureButton.get_expand,
        Godot.Core.TextureButton.get_focused_texture,
        Godot.Core.TextureButton.get_hover_texture,
        Godot.Core.TextureButton.get_normal_texture,
        Godot.Core.TextureButton.get_pressed_texture,
        Godot.Core.TextureButton.get_stretch_mode,
        Godot.Core.TextureButton.set_click_mask,
        Godot.Core.TextureButton.set_disabled_texture,
        Godot.Core.TextureButton.set_expand,
        Godot.Core.TextureButton.set_focused_texture,
        Godot.Core.TextureButton.set_hover_texture,
        Godot.Core.TextureButton.set_normal_texture,
        Godot.Core.TextureButton.set_pressed_texture,
        Godot.Core.TextureButton.set_stretch_mode)
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
import Godot.Core.BaseButton()

_STRETCH_KEEP_ASPECT :: Int
_STRETCH_KEEP_ASPECT = 4

_STRETCH_KEEP :: Int
_STRETCH_KEEP = 2

_STRETCH_KEEP_ASPECT_CENTERED :: Int
_STRETCH_KEEP_ASPECT_CENTERED = 5

_STRETCH_SCALE :: Int
_STRETCH_SCALE = 0

_STRETCH_KEEP_ASPECT_COVERED :: Int
_STRETCH_KEEP_ASPECT_COVERED = 6

_STRETCH_TILE :: Int
_STRETCH_TILE = 1

_STRETCH_KEEP_CENTERED :: Int
_STRETCH_KEEP_CENTERED = 3

instance NodeProperty TextureButton "expand" Bool 'False where
        nodeProperty = (get_expand, wrapDroppingSetter set_expand, Nothing)

instance NodeProperty TextureButton "stretch_mode" Int 'False where
        nodeProperty
          = (get_stretch_mode, wrapDroppingSetter set_stretch_mode, Nothing)

instance NodeProperty TextureButton "texture_click_mask" BitMap
           'False
         where
        nodeProperty
          = (get_click_mask, wrapDroppingSetter set_click_mask, Nothing)

instance NodeProperty TextureButton "texture_disabled" Texture
           'False
         where
        nodeProperty
          = (get_disabled_texture, wrapDroppingSetter set_disabled_texture,
             Nothing)

instance NodeProperty TextureButton "texture_focused" Texture
           'False
         where
        nodeProperty
          = (get_focused_texture, wrapDroppingSetter set_focused_texture,
             Nothing)

instance NodeProperty TextureButton "texture_hover" Texture 'False
         where
        nodeProperty
          = (get_hover_texture, wrapDroppingSetter set_hover_texture,
             Nothing)

instance NodeProperty TextureButton "texture_normal" Texture 'False
         where
        nodeProperty
          = (get_normal_texture, wrapDroppingSetter set_normal_texture,
             Nothing)

instance NodeProperty TextureButton "texture_pressed" Texture
           'False
         where
        nodeProperty
          = (get_pressed_texture, wrapDroppingSetter set_pressed_texture,
             Nothing)

{-# NOINLINE bindTextureButton_get_click_mask #-}

-- | Pure black and white @BitMap@ image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
bindTextureButton_get_click_mask :: MethodBind
bindTextureButton_get_click_mask
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_click_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pure black and white @BitMap@ image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
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

instance NodeMethod TextureButton "get_click_mask" '[] (IO BitMap)
         where
        nodeMethod = Godot.Core.TextureButton.get_click_mask

{-# NOINLINE bindTextureButton_get_disabled_texture #-}

-- | Texture to display when the node is disabled. See @BaseButton.disabled@.
bindTextureButton_get_disabled_texture :: MethodBind
bindTextureButton_get_disabled_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_disabled_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the node is disabled. See @BaseButton.disabled@.
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

instance NodeMethod TextureButton "get_disabled_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureButton.get_disabled_texture

{-# NOINLINE bindTextureButton_get_expand #-}

-- | If @true@, the texture stretches to the edges of the node's bounding rectangle using the @stretch_mode@. If @false@, the texture will not scale with the node.
bindTextureButton_get_expand :: MethodBind
bindTextureButton_get_expand
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the texture stretches to the edges of the node's bounding rectangle using the @stretch_mode@. If @false@, the texture will not scale with the node.
get_expand ::
             (TextureButton :< cls, Object :< cls) => cls -> IO Bool
get_expand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_get_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureButton "get_expand" '[] (IO Bool) where
        nodeMethod = Godot.Core.TextureButton.get_expand

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

instance NodeMethod TextureButton "get_focused_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureButton.get_focused_texture

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

instance NodeMethod TextureButton "get_hover_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureButton.get_hover_texture

{-# NOINLINE bindTextureButton_get_normal_texture #-}

-- | Texture to display by default, when the node is __not__ in the disabled, focused, hover or pressed state.
bindTextureButton_get_normal_texture :: MethodBind
bindTextureButton_get_normal_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display by default, when the node is __not__ in the disabled, focused, hover or pressed state.
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

instance NodeMethod TextureButton "get_normal_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureButton.get_normal_texture

{-# NOINLINE bindTextureButton_get_pressed_texture #-}

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the @BaseButton.shortcut@ key.
bindTextureButton_get_pressed_texture :: MethodBind
bindTextureButton_get_pressed_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_pressed_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the @BaseButton.shortcut@ key.
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

instance NodeMethod TextureButton "get_pressed_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureButton.get_pressed_texture

{-# NOINLINE bindTextureButton_get_stretch_mode #-}

-- | Controls the texture's behavior when you resize the node's bounding rectangle, __only if__ @expand@ is @true@. Set it to one of the @enum StretchMode@ constants. See the constants to learn more.
bindTextureButton_get_stretch_mode :: MethodBind
bindTextureButton_get_stretch_mode
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "get_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when you resize the node's bounding rectangle, __only if__ @expand@ is @true@. Set it to one of the @enum StretchMode@ constants. See the constants to learn more.
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

instance NodeMethod TextureButton "get_stretch_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TextureButton.get_stretch_mode

{-# NOINLINE bindTextureButton_set_click_mask #-}

-- | Pure black and white @BitMap@ image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
bindTextureButton_set_click_mask :: MethodBind
bindTextureButton_set_click_mask
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_click_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pure black and white @BitMap@ image to use for click detection. On the mask, white pixels represent the button's clickable area. Use it to create buttons with curved shapes.
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

instance NodeMethod TextureButton "set_click_mask" '[BitMap]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_click_mask

{-# NOINLINE bindTextureButton_set_disabled_texture #-}

-- | Texture to display when the node is disabled. See @BaseButton.disabled@.
bindTextureButton_set_disabled_texture :: MethodBind
bindTextureButton_set_disabled_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_disabled_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display when the node is disabled. See @BaseButton.disabled@.
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

instance NodeMethod TextureButton "set_disabled_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_disabled_texture

{-# NOINLINE bindTextureButton_set_expand #-}

-- | If @true@, the texture stretches to the edges of the node's bounding rectangle using the @stretch_mode@. If @false@, the texture will not scale with the node.
bindTextureButton_set_expand :: MethodBind
bindTextureButton_set_expand
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the texture stretches to the edges of the node's bounding rectangle using the @stretch_mode@. If @false@, the texture will not scale with the node.
set_expand ::
             (TextureButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureButton_set_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureButton "set_expand" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_expand

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

instance NodeMethod TextureButton "set_focused_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_focused_texture

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

instance NodeMethod TextureButton "set_hover_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_hover_texture

{-# NOINLINE bindTextureButton_set_normal_texture #-}

-- | Texture to display by default, when the node is __not__ in the disabled, focused, hover or pressed state.
bindTextureButton_set_normal_texture :: MethodBind
bindTextureButton_set_normal_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display by default, when the node is __not__ in the disabled, focused, hover or pressed state.
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

instance NodeMethod TextureButton "set_normal_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_normal_texture

{-# NOINLINE bindTextureButton_set_pressed_texture #-}

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the @BaseButton.shortcut@ key.
bindTextureButton_set_pressed_texture :: MethodBind
bindTextureButton_set_pressed_texture
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_pressed_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture to display on mouse down over the node, if the node has keyboard focus and the player presses the Enter key or if the player presses the @BaseButton.shortcut@ key.
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

instance NodeMethod TextureButton "set_pressed_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_pressed_texture

{-# NOINLINE bindTextureButton_set_stretch_mode #-}

-- | Controls the texture's behavior when you resize the node's bounding rectangle, __only if__ @expand@ is @true@. Set it to one of the @enum StretchMode@ constants. See the constants to learn more.
bindTextureButton_set_stretch_mode :: MethodBind
bindTextureButton_set_stretch_mode
  = unsafePerformIO $
      withCString "TextureButton" $
        \ clsNamePtr ->
          withCString "set_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when you resize the node's bounding rectangle, __only if__ @expand@ is @true@. Set it to one of the @enum StretchMode@ constants. See the constants to learn more.
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

instance NodeMethod TextureButton "set_stretch_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TextureButton.set_stretch_mode