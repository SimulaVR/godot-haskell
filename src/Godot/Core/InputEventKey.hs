{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventKey
       (Godot.Core.InputEventKey.is_echo,
        Godot.Core.InputEventKey.is_pressed,
        Godot.Core.InputEventKey.get_scancode,
        Godot.Core.InputEventKey.get_scancode_with_modifiers,
        Godot.Core.InputEventKey.get_unicode,
        Godot.Core.InputEventKey.set_echo,
        Godot.Core.InputEventKey.set_pressed,
        Godot.Core.InputEventKey.set_scancode,
        Godot.Core.InputEventKey.set_unicode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventKey_is_echo #-}

-- | If [code]true[/code], the key was already pressed before this event. It means the user is holding the key down.
bindInputEventKey_is_echo :: MethodBind
bindInputEventKey_is_echo
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "is_echo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the key was already pressed before this event. It means the user is holding the key down.
is_echo :: (InputEventKey :< cls, Object :< cls) => cls -> IO Int
is_echo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_is_echo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_is_pressed #-}

-- | If [code]true[/code], the key's state is pressed. If [code]false[/code], the key's state is released.
bindInputEventKey_is_pressed :: MethodBind
bindInputEventKey_is_pressed
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the key's state is pressed. If [code]false[/code], the key's state is released.
is_pressed ::
             (InputEventKey :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_is_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_get_scancode #-}

-- | The key scancode, which corresponds to one of the [enum KeyList] constants.
--   			To get a human-readable representation of the [InputEventKey], use [code]OS.get_scancode_string(event.scancode)[/code] where [code]event[/code] is the [InputEventKey].
bindInputEventKey_get_scancode :: MethodBind
bindInputEventKey_get_scancode
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "get_scancode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The key scancode, which corresponds to one of the [enum KeyList] constants.
--   			To get a human-readable representation of the [InputEventKey], use [code]OS.get_scancode_string(event.scancode)[/code] where [code]event[/code] is the [InputEventKey].
get_scancode ::
               (InputEventKey :< cls, Object :< cls) => cls -> IO Int
get_scancode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_get_scancode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_get_scancode_with_modifiers #-}

-- | Returns the scancode combined with modifier keys such as [code]Shift[/code] or [code]Alt[/code]. See also [InputEventWithModifiers].
--   				To get a human-readable representation of the [InputEventKey] with modifiers, use [code]OS.get_scancode_string(event.get_scancode_with_modifiers())[/code] where [code]event[/code] is the [InputEventKey].
bindInputEventKey_get_scancode_with_modifiers :: MethodBind
bindInputEventKey_get_scancode_with_modifiers
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "get_scancode_with_modifiers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the scancode combined with modifier keys such as [code]Shift[/code] or [code]Alt[/code]. See also [InputEventWithModifiers].
--   				To get a human-readable representation of the [InputEventKey] with modifiers, use [code]OS.get_scancode_string(event.get_scancode_with_modifiers())[/code] where [code]event[/code] is the [InputEventKey].
get_scancode_with_modifiers ::
                              (InputEventKey :< cls, Object :< cls) => cls -> IO Int
get_scancode_with_modifiers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindInputEventKey_get_scancode_with_modifiers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_get_unicode #-}

-- | The key Unicode identifier (when relevant). Unicode identifiers for the composite characters and complex scripts may not be available unless IME input mode is active. See [method OS.set_ime_active] for more information.
bindInputEventKey_get_unicode :: MethodBind
bindInputEventKey_get_unicode
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "get_unicode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The key Unicode identifier (when relevant). Unicode identifiers for the composite characters and complex scripts may not be available unless IME input mode is active. See [method OS.set_ime_active] for more information.
get_unicode ::
              (InputEventKey :< cls, Object :< cls) => cls -> IO Int
get_unicode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_get_unicode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_set_echo #-}

-- | If [code]true[/code], the key was already pressed before this event. It means the user is holding the key down.
bindInputEventKey_set_echo :: MethodBind
bindInputEventKey_set_echo
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "set_echo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the key was already pressed before this event. It means the user is holding the key down.
set_echo ::
           (InputEventKey :< cls, Object :< cls) => cls -> Bool -> IO ()
set_echo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_set_echo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_set_pressed #-}

-- | If [code]true[/code], the key's state is pressed. If [code]false[/code], the key's state is released.
bindInputEventKey_set_pressed :: MethodBind
bindInputEventKey_set_pressed
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the key's state is pressed. If [code]false[/code], the key's state is released.
set_pressed ::
              (InputEventKey :< cls, Object :< cls) => cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_set_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_set_scancode #-}

-- | The key scancode, which corresponds to one of the [enum KeyList] constants.
--   			To get a human-readable representation of the [InputEventKey], use [code]OS.get_scancode_string(event.scancode)[/code] where [code]event[/code] is the [InputEventKey].
bindInputEventKey_set_scancode :: MethodBind
bindInputEventKey_set_scancode
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "set_scancode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The key scancode, which corresponds to one of the [enum KeyList] constants.
--   			To get a human-readable representation of the [InputEventKey], use [code]OS.get_scancode_string(event.scancode)[/code] where [code]event[/code] is the [InputEventKey].
set_scancode ::
               (InputEventKey :< cls, Object :< cls) => cls -> Int -> IO ()
set_scancode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_set_scancode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventKey_set_unicode #-}

-- | The key Unicode identifier (when relevant). Unicode identifiers for the composite characters and complex scripts may not be available unless IME input mode is active. See [method OS.set_ime_active] for more information.
bindInputEventKey_set_unicode :: MethodBind
bindInputEventKey_set_unicode
  = unsafePerformIO $
      withCString "InputEventKey" $
        \ clsNamePtr ->
          withCString "set_unicode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The key Unicode identifier (when relevant). Unicode identifiers for the composite characters and complex scripts may not be available unless IME input mode is active. See [method OS.set_ime_active] for more information.
set_unicode ::
              (InputEventKey :< cls, Object :< cls) => cls -> Int -> IO ()
set_unicode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventKey_set_unicode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)