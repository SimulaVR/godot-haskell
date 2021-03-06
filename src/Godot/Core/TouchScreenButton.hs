{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TouchScreenButton
       (Godot.Core.TouchScreenButton._VISIBILITY_ALWAYS,
        Godot.Core.TouchScreenButton._VISIBILITY_TOUCHSCREEN_ONLY,
        Godot.Core.TouchScreenButton.sig_pressed,
        Godot.Core.TouchScreenButton.sig_released,
        Godot.Core.TouchScreenButton._input,
        Godot.Core.TouchScreenButton.get_action,
        Godot.Core.TouchScreenButton.get_bitmask,
        Godot.Core.TouchScreenButton.get_shape,
        Godot.Core.TouchScreenButton.get_texture,
        Godot.Core.TouchScreenButton.get_texture_pressed,
        Godot.Core.TouchScreenButton.get_visibility_mode,
        Godot.Core.TouchScreenButton.is_passby_press_enabled,
        Godot.Core.TouchScreenButton.is_pressed,
        Godot.Core.TouchScreenButton.is_shape_centered,
        Godot.Core.TouchScreenButton.is_shape_visible,
        Godot.Core.TouchScreenButton.set_action,
        Godot.Core.TouchScreenButton.set_bitmask,
        Godot.Core.TouchScreenButton.set_passby_press,
        Godot.Core.TouchScreenButton.set_shape,
        Godot.Core.TouchScreenButton.set_shape_centered,
        Godot.Core.TouchScreenButton.set_shape_visible,
        Godot.Core.TouchScreenButton.set_texture,
        Godot.Core.TouchScreenButton.set_texture_pressed,
        Godot.Core.TouchScreenButton.set_visibility_mode)
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

_VISIBILITY_ALWAYS :: Int
_VISIBILITY_ALWAYS = 0

_VISIBILITY_TOUCHSCREEN_ONLY :: Int
_VISIBILITY_TOUCHSCREEN_ONLY = 1

-- | Emitted when the button is pressed (down).
sig_pressed :: Godot.Internal.Dispatch.Signal TouchScreenButton
sig_pressed = Godot.Internal.Dispatch.Signal "pressed"

instance NodeSignal TouchScreenButton "pressed" '[]

-- | Emitted when the button is released (up).
sig_released :: Godot.Internal.Dispatch.Signal TouchScreenButton
sig_released = Godot.Internal.Dispatch.Signal "released"

instance NodeSignal TouchScreenButton "released" '[]

instance NodeProperty TouchScreenButton "action" GodotString 'False
         where
        nodeProperty = (get_action, wrapDroppingSetter set_action, Nothing)

instance NodeProperty TouchScreenButton "bitmask" BitMap 'False
         where
        nodeProperty
          = (get_bitmask, wrapDroppingSetter set_bitmask, Nothing)

instance NodeProperty TouchScreenButton "normal" Texture 'False
         where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

instance NodeProperty TouchScreenButton "passby_press" Bool 'False
         where
        nodeProperty
          = (is_passby_press_enabled, wrapDroppingSetter set_passby_press,
             Nothing)

instance NodeProperty TouchScreenButton "pressed" Texture 'False
         where
        nodeProperty
          = (get_texture_pressed, wrapDroppingSetter set_texture_pressed,
             Nothing)

instance NodeProperty TouchScreenButton "shape" Shape2D 'False
         where
        nodeProperty = (get_shape, wrapDroppingSetter set_shape, Nothing)

instance NodeProperty TouchScreenButton "shape_centered" Bool
           'False
         where
        nodeProperty
          = (is_shape_centered, wrapDroppingSetter set_shape_centered,
             Nothing)

instance NodeProperty TouchScreenButton "shape_visible" Bool 'False
         where
        nodeProperty
          = (is_shape_visible, wrapDroppingSetter set_shape_visible, Nothing)

instance NodeProperty TouchScreenButton "visibility_mode" Int
           'False
         where
        nodeProperty
          = (get_visibility_mode, wrapDroppingSetter set_visibility_mode,
             Nothing)

{-# NOINLINE bindTouchScreenButton__input #-}

bindTouchScreenButton__input :: MethodBind
bindTouchScreenButton__input
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_input ::
         (TouchScreenButton :< cls, Object :< cls) =>
         cls -> InputEvent -> IO ()
_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton__input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton._input

{-# NOINLINE bindTouchScreenButton_get_action #-}

-- | The button's action. Actions can be handled with @InputEventAction@.
bindTouchScreenButton_get_action :: MethodBind
bindTouchScreenButton_get_action
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's action. Actions can be handled with @InputEventAction@.
get_action ::
             (TouchScreenButton :< cls, Object :< cls) => cls -> IO GodotString
get_action cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_get_action
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "get_action" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TouchScreenButton.get_action

{-# NOINLINE bindTouchScreenButton_get_bitmask #-}

-- | The button's bitmask.
bindTouchScreenButton_get_bitmask :: MethodBind
bindTouchScreenButton_get_bitmask
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's bitmask.
get_bitmask ::
              (TouchScreenButton :< cls, Object :< cls) => cls -> IO BitMap
get_bitmask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_get_bitmask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "get_bitmask" '[] (IO BitMap)
         where
        nodeMethod = Godot.Core.TouchScreenButton.get_bitmask

{-# NOINLINE bindTouchScreenButton_get_shape #-}

-- | The button's shape.
bindTouchScreenButton_get_shape :: MethodBind
bindTouchScreenButton_get_shape
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's shape.
get_shape ::
            (TouchScreenButton :< cls, Object :< cls) => cls -> IO Shape2D
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "get_shape" '[] (IO Shape2D)
         where
        nodeMethod = Godot.Core.TouchScreenButton.get_shape

{-# NOINLINE bindTouchScreenButton_get_texture #-}

-- | The button's texture for the normal state.
bindTouchScreenButton_get_texture :: MethodBind
bindTouchScreenButton_get_texture
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's texture for the normal state.
get_texture ::
              (TouchScreenButton :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_get_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "get_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TouchScreenButton.get_texture

{-# NOINLINE bindTouchScreenButton_get_texture_pressed #-}

-- | The button's texture for the pressed state.
bindTouchScreenButton_get_texture_pressed :: MethodBind
bindTouchScreenButton_get_texture_pressed
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_texture_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's texture for the pressed state.
get_texture_pressed ::
                      (TouchScreenButton :< cls, Object :< cls) => cls -> IO Texture
get_texture_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_get_texture_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "get_texture_pressed" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TouchScreenButton.get_texture_pressed

{-# NOINLINE bindTouchScreenButton_get_visibility_mode #-}

-- | The button's visibility mode. See @enum VisibilityMode@ for possible values.
bindTouchScreenButton_get_visibility_mode :: MethodBind
bindTouchScreenButton_get_visibility_mode
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_visibility_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's visibility mode. See @enum VisibilityMode@ for possible values.
get_visibility_mode ::
                      (TouchScreenButton :< cls, Object :< cls) => cls -> IO Int
get_visibility_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_get_visibility_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "get_visibility_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.TouchScreenButton.get_visibility_mode

{-# NOINLINE bindTouchScreenButton_is_passby_press_enabled #-}

-- | If @true@, pass-by presses are enabled.
bindTouchScreenButton_is_passby_press_enabled :: MethodBind
bindTouchScreenButton_is_passby_press_enabled
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_passby_press_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, pass-by presses are enabled.
is_passby_press_enabled ::
                          (TouchScreenButton :< cls, Object :< cls) => cls -> IO Bool
is_passby_press_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTouchScreenButton_is_passby_press_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "is_passby_press_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TouchScreenButton.is_passby_press_enabled

{-# NOINLINE bindTouchScreenButton_is_pressed #-}

-- | Returns @true@ if this button is currently pressed.
bindTouchScreenButton_is_pressed :: MethodBind
bindTouchScreenButton_is_pressed
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this button is currently pressed.
is_pressed ::
             (TouchScreenButton :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_is_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "is_pressed" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.TouchScreenButton.is_pressed

{-# NOINLINE bindTouchScreenButton_is_shape_centered #-}

-- | If @true@, the button's shape is centered in the provided texture. If no texture is used, this property has no effect.
bindTouchScreenButton_is_shape_centered :: MethodBind
bindTouchScreenButton_is_shape_centered
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_shape_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the button's shape is centered in the provided texture. If no texture is used, this property has no effect.
is_shape_centered ::
                    (TouchScreenButton :< cls, Object :< cls) => cls -> IO Bool
is_shape_centered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_is_shape_centered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "is_shape_centered" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TouchScreenButton.is_shape_centered

{-# NOINLINE bindTouchScreenButton_is_shape_visible #-}

-- | If @true@, the button's shape is visible.
bindTouchScreenButton_is_shape_visible :: MethodBind
bindTouchScreenButton_is_shape_visible
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_shape_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the button's shape is visible.
is_shape_visible ::
                   (TouchScreenButton :< cls, Object :< cls) => cls -> IO Bool
is_shape_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_is_shape_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "is_shape_visible" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TouchScreenButton.is_shape_visible

{-# NOINLINE bindTouchScreenButton_set_action #-}

-- | The button's action. Actions can be handled with @InputEventAction@.
bindTouchScreenButton_set_action :: MethodBind
bindTouchScreenButton_set_action
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's action. Actions can be handled with @InputEventAction@.
set_action ::
             (TouchScreenButton :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_action
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_action" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_action

{-# NOINLINE bindTouchScreenButton_set_bitmask #-}

-- | The button's bitmask.
bindTouchScreenButton_set_bitmask :: MethodBind
bindTouchScreenButton_set_bitmask
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's bitmask.
set_bitmask ::
              (TouchScreenButton :< cls, Object :< cls) => cls -> BitMap -> IO ()
set_bitmask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_bitmask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_bitmask" '[BitMap]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_bitmask

{-# NOINLINE bindTouchScreenButton_set_passby_press #-}

-- | If @true@, pass-by presses are enabled.
bindTouchScreenButton_set_passby_press :: MethodBind
bindTouchScreenButton_set_passby_press
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_passby_press" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, pass-by presses are enabled.
set_passby_press ::
                   (TouchScreenButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_passby_press cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_passby_press
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_passby_press" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_passby_press

{-# NOINLINE bindTouchScreenButton_set_shape #-}

-- | The button's shape.
bindTouchScreenButton_set_shape :: MethodBind
bindTouchScreenButton_set_shape
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's shape.
set_shape ::
            (TouchScreenButton :< cls, Object :< cls) =>
            cls -> Shape2D -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_shape" '[Shape2D]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_shape

{-# NOINLINE bindTouchScreenButton_set_shape_centered #-}

-- | If @true@, the button's shape is centered in the provided texture. If no texture is used, this property has no effect.
bindTouchScreenButton_set_shape_centered :: MethodBind
bindTouchScreenButton_set_shape_centered
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_shape_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the button's shape is centered in the provided texture. If no texture is used, this property has no effect.
set_shape_centered ::
                     (TouchScreenButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shape_centered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_shape_centered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_shape_centered" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_shape_centered

{-# NOINLINE bindTouchScreenButton_set_shape_visible #-}

-- | If @true@, the button's shape is visible.
bindTouchScreenButton_set_shape_visible :: MethodBind
bindTouchScreenButton_set_shape_visible
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_shape_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the button's shape is visible.
set_shape_visible ::
                    (TouchScreenButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shape_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_shape_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_shape_visible" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_shape_visible

{-# NOINLINE bindTouchScreenButton_set_texture #-}

-- | The button's texture for the normal state.
bindTouchScreenButton_set_texture :: MethodBind
bindTouchScreenButton_set_texture
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's texture for the normal state.
set_texture ::
              (TouchScreenButton :< cls, Object :< cls) =>
              cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_texture

{-# NOINLINE bindTouchScreenButton_set_texture_pressed #-}

-- | The button's texture for the pressed state.
bindTouchScreenButton_set_texture_pressed :: MethodBind
bindTouchScreenButton_set_texture_pressed
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_texture_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's texture for the pressed state.
set_texture_pressed ::
                      (TouchScreenButton :< cls, Object :< cls) =>
                      cls -> Texture -> IO ()
set_texture_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_texture_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_texture_pressed"
           '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_texture_pressed

{-# NOINLINE bindTouchScreenButton_set_visibility_mode #-}

-- | The button's visibility mode. See @enum VisibilityMode@ for possible values.
bindTouchScreenButton_set_visibility_mode :: MethodBind
bindTouchScreenButton_set_visibility_mode
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_visibility_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's visibility mode. See @enum VisibilityMode@ for possible values.
set_visibility_mode ::
                      (TouchScreenButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_visibility_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTouchScreenButton_set_visibility_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TouchScreenButton "set_visibility_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TouchScreenButton.set_visibility_mode