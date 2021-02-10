{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventMouseButton
       (Godot.Core.InputEventMouseButton.is_pressed,
        Godot.Core.InputEventMouseButton.get_button_index,
        Godot.Core.InputEventMouseButton.get_factor,
        Godot.Core.InputEventMouseButton.is_doubleclick,
        Godot.Core.InputEventMouseButton.set_button_index,
        Godot.Core.InputEventMouseButton.set_doubleclick,
        Godot.Core.InputEventMouseButton.set_factor,
        Godot.Core.InputEventMouseButton.set_pressed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventMouseButton_is_pressed #-}

-- | If [code]true[/code], the mouse button's state is pressed. If [code]false[/code], the mouse button's state is released.
bindInputEventMouseButton_is_pressed :: MethodBind
bindInputEventMouseButton_is_pressed
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the mouse button's state is pressed. If [code]false[/code], the mouse button's state is released.
is_pressed ::
             (InputEventMouseButton :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_is_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_get_button_index #-}

-- | The mouse button identifier, one of the [enum ButtonList] button or button wheel constants.
bindInputEventMouseButton_get_button_index :: MethodBind
bindInputEventMouseButton_get_button_index
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "get_button_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse button identifier, one of the [enum ButtonList] button or button wheel constants.
get_button_index ::
                   (InputEventMouseButton :< cls, Object :< cls) => cls -> IO Int
get_button_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_get_button_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_get_factor #-}

-- | The amount (or delta) of the event. When used for high-precision scroll events, this indicates the scroll amount (vertical or horizontal). This is only supported on some platforms; the reported sensitivity varies depending on the platform. May be [code]0[/code] if not supported.
bindInputEventMouseButton_get_factor :: MethodBind
bindInputEventMouseButton_get_factor
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "get_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount (or delta) of the event. When used for high-precision scroll events, this indicates the scroll amount (vertical or horizontal). This is only supported on some platforms; the reported sensitivity varies depending on the platform. May be [code]0[/code] if not supported.
get_factor ::
             (InputEventMouseButton :< cls, Object :< cls) => cls -> IO Float
get_factor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_get_factor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_is_doubleclick #-}

-- | If [code]true[/code], the mouse button's state is a double-click.
bindInputEventMouseButton_is_doubleclick :: MethodBind
bindInputEventMouseButton_is_doubleclick
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "is_doubleclick" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the mouse button's state is a double-click.
is_doubleclick ::
                 (InputEventMouseButton :< cls, Object :< cls) => cls -> IO Bool
is_doubleclick cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_is_doubleclick
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_set_button_index #-}

-- | The mouse button identifier, one of the [enum ButtonList] button or button wheel constants.
bindInputEventMouseButton_set_button_index :: MethodBind
bindInputEventMouseButton_set_button_index
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "set_button_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse button identifier, one of the [enum ButtonList] button or button wheel constants.
set_button_index ::
                   (InputEventMouseButton :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_button_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_set_button_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_set_doubleclick #-}

-- | If [code]true[/code], the mouse button's state is a double-click.
bindInputEventMouseButton_set_doubleclick :: MethodBind
bindInputEventMouseButton_set_doubleclick
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "set_doubleclick" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the mouse button's state is a double-click.
set_doubleclick ::
                  (InputEventMouseButton :< cls, Object :< cls) =>
                  cls -> Bool -> IO ()
set_doubleclick cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_set_doubleclick
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_set_factor #-}

-- | The amount (or delta) of the event. When used for high-precision scroll events, this indicates the scroll amount (vertical or horizontal). This is only supported on some platforms; the reported sensitivity varies depending on the platform. May be [code]0[/code] if not supported.
bindInputEventMouseButton_set_factor :: MethodBind
bindInputEventMouseButton_set_factor
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "set_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount (or delta) of the event. When used for high-precision scroll events, this indicates the scroll amount (vertical or horizontal). This is only supported on some platforms; the reported sensitivity varies depending on the platform. May be [code]0[/code] if not supported.
set_factor ::
             (InputEventMouseButton :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_factor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_set_factor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseButton_set_pressed #-}

-- | If [code]true[/code], the mouse button's state is pressed. If [code]false[/code], the mouse button's state is released.
bindInputEventMouseButton_set_pressed :: MethodBind
bindInputEventMouseButton_set_pressed
  = unsafePerformIO $
      withCString "InputEventMouseButton" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the mouse button's state is pressed. If [code]false[/code], the mouse button's state is released.
set_pressed ::
              (InputEventMouseButton :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseButton_set_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)