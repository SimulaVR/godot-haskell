{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventJoypadButton
       (Godot.Core.InputEventJoypadButton.is_pressed,
        Godot.Core.InputEventJoypadButton.get_button_index,
        Godot.Core.InputEventJoypadButton.get_pressure,
        Godot.Core.InputEventJoypadButton.set_button_index,
        Godot.Core.InputEventJoypadButton.set_pressed,
        Godot.Core.InputEventJoypadButton.set_pressure)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventJoypadButton_is_pressed #-}

-- | If [code]true[/code], the button's state is pressed. If [code]false[/code], the button's state is released.
bindInputEventJoypadButton_is_pressed :: MethodBind
bindInputEventJoypadButton_is_pressed
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's state is pressed. If [code]false[/code], the button's state is released.
is_pressed ::
             (InputEventJoypadButton :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_is_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadButton_get_button_index #-}

-- | Button identifier. One of the [code]JOY_BUTTON_*[/code] constants from [@GlobalScope].
bindInputEventJoypadButton_get_button_index :: MethodBind
bindInputEventJoypadButton_get_button_index
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "get_button_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Button identifier. One of the [code]JOY_BUTTON_*[/code] constants from [@GlobalScope].
get_button_index ::
                   (InputEventJoypadButton :< cls, Object :< cls) => cls -> IO Int
get_button_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_get_button_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadButton_get_pressure #-}

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from [code]0[/code] to [code]1[/code].
bindInputEventJoypadButton_get_pressure :: MethodBind
bindInputEventJoypadButton_get_pressure
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from [code]0[/code] to [code]1[/code].
get_pressure ::
               (InputEventJoypadButton :< cls, Object :< cls) => cls -> IO Float
get_pressure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_get_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadButton_set_button_index #-}

-- | Button identifier. One of the [code]JOY_BUTTON_*[/code] constants from [@GlobalScope].
bindInputEventJoypadButton_set_button_index :: MethodBind
bindInputEventJoypadButton_set_button_index
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "set_button_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Button identifier. One of the [code]JOY_BUTTON_*[/code] constants from [@GlobalScope].
set_button_index ::
                   (InputEventJoypadButton :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_button_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_set_button_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadButton_set_pressed #-}

-- | If [code]true[/code], the button's state is pressed. If [code]false[/code], the button's state is released.
bindInputEventJoypadButton_set_pressed :: MethodBind
bindInputEventJoypadButton_set_pressed
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's state is pressed. If [code]false[/code], the button's state is released.
set_pressed ::
              (InputEventJoypadButton :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_set_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadButton_set_pressure #-}

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from [code]0[/code] to [code]1[/code].
bindInputEventJoypadButton_set_pressure :: MethodBind
bindInputEventJoypadButton_set_pressure
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from [code]0[/code] to [code]1[/code].
set_pressure ::
               (InputEventJoypadButton :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_pressure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_set_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)