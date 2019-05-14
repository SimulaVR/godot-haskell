{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TouchScreenButton
       (Godot.Core.TouchScreenButton._VISIBILITY_ALWAYS,
        Godot.Core.TouchScreenButton._VISIBILITY_TOUCHSCREEN_ONLY,
        Godot.Core.TouchScreenButton.sig_released,
        Godot.Core.TouchScreenButton.sig_pressed,
        Godot.Core.TouchScreenButton.set_texture,
        Godot.Core.TouchScreenButton.get_texture,
        Godot.Core.TouchScreenButton.set_texture_pressed,
        Godot.Core.TouchScreenButton.get_texture_pressed,
        Godot.Core.TouchScreenButton.set_bitmask,
        Godot.Core.TouchScreenButton.get_bitmask,
        Godot.Core.TouchScreenButton.set_shape,
        Godot.Core.TouchScreenButton.get_shape,
        Godot.Core.TouchScreenButton.set_shape_centered,
        Godot.Core.TouchScreenButton.is_shape_centered,
        Godot.Core.TouchScreenButton.set_shape_visible,
        Godot.Core.TouchScreenButton.is_shape_visible,
        Godot.Core.TouchScreenButton.set_action,
        Godot.Core.TouchScreenButton.get_action,
        Godot.Core.TouchScreenButton.set_visibility_mode,
        Godot.Core.TouchScreenButton.get_visibility_mode,
        Godot.Core.TouchScreenButton.set_passby_press,
        Godot.Core.TouchScreenButton.is_passby_press_enabled,
        Godot.Core.TouchScreenButton.is_pressed,
        Godot.Core.TouchScreenButton._input)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_VISIBILITY_ALWAYS :: Int
_VISIBILITY_ALWAYS = 0

_VISIBILITY_TOUCHSCREEN_ONLY :: Int
_VISIBILITY_TOUCHSCREEN_ONLY = 1

-- | Emitted when the button is released (up).
sig_released :: Godot.Internal.Dispatch.Signal TouchScreenButton
sig_released = Godot.Internal.Dispatch.Signal "released"

-- | Emitted when the button is pressed (down).
sig_pressed :: Godot.Internal.Dispatch.Signal TouchScreenButton
sig_pressed = Godot.Internal.Dispatch.Signal "pressed"

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

{-# NOINLINE bindTouchScreenButton_set_shape_centered #-}

-- | If [code]true[/code], the button's shape is centered.
bindTouchScreenButton_set_shape_centered :: MethodBind
bindTouchScreenButton_set_shape_centered
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_shape_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's shape is centered.
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

{-# NOINLINE bindTouchScreenButton_is_shape_centered #-}

-- | If [code]true[/code], the button's shape is centered.
bindTouchScreenButton_is_shape_centered :: MethodBind
bindTouchScreenButton_is_shape_centered
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_shape_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's shape is centered.
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

{-# NOINLINE bindTouchScreenButton_set_shape_visible #-}

-- | If [code]true[/code], the button's shape is visible.
bindTouchScreenButton_set_shape_visible :: MethodBind
bindTouchScreenButton_set_shape_visible
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_shape_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's shape is visible.
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

{-# NOINLINE bindTouchScreenButton_is_shape_visible #-}

-- | If [code]true[/code], the button's shape is visible.
bindTouchScreenButton_is_shape_visible :: MethodBind
bindTouchScreenButton_is_shape_visible
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_shape_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's shape is visible.
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

{-# NOINLINE bindTouchScreenButton_set_action #-}

-- | The button's action. Actions can be handled with [InputEventAction].
bindTouchScreenButton_set_action :: MethodBind
bindTouchScreenButton_set_action
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's action. Actions can be handled with [InputEventAction].
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

{-# NOINLINE bindTouchScreenButton_get_action #-}

-- | The button's action. Actions can be handled with [InputEventAction].
bindTouchScreenButton_get_action :: MethodBind
bindTouchScreenButton_get_action
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's action. Actions can be handled with [InputEventAction].
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

{-# NOINLINE bindTouchScreenButton_set_visibility_mode #-}

-- | The button's visibility mode. See [code]VISIBILITY_*[/code] constants.
bindTouchScreenButton_set_visibility_mode :: MethodBind
bindTouchScreenButton_set_visibility_mode
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_visibility_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's visibility mode. See [code]VISIBILITY_*[/code] constants.
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

{-# NOINLINE bindTouchScreenButton_get_visibility_mode #-}

-- | The button's visibility mode. See [code]VISIBILITY_*[/code] constants.
bindTouchScreenButton_get_visibility_mode :: MethodBind
bindTouchScreenButton_get_visibility_mode
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "get_visibility_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's visibility mode. See [code]VISIBILITY_*[/code] constants.
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

{-# NOINLINE bindTouchScreenButton_set_passby_press #-}

-- | If [code]true[/code], passby presses are enabled.
bindTouchScreenButton_set_passby_press :: MethodBind
bindTouchScreenButton_set_passby_press
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "set_passby_press" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], passby presses are enabled.
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

{-# NOINLINE bindTouchScreenButton_is_passby_press_enabled #-}

-- | If [code]true[/code], passby presses are enabled.
bindTouchScreenButton_is_passby_press_enabled :: MethodBind
bindTouchScreenButton_is_passby_press_enabled
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_passby_press_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], passby presses are enabled.
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

{-# NOINLINE bindTouchScreenButton_is_pressed #-}

-- | Returns [code]true[/code] if this button is currently pressed.
bindTouchScreenButton_is_pressed :: MethodBind
bindTouchScreenButton_is_pressed
  = unsafePerformIO $
      withCString "TouchScreenButton" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this button is currently pressed.
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