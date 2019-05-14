{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEvent
       (Godot.Core.InputEvent.set_device,
        Godot.Core.InputEvent.get_device, Godot.Core.InputEvent.is_action,
        Godot.Core.InputEvent.is_action_pressed,
        Godot.Core.InputEvent.is_action_released,
        Godot.Core.InputEvent.get_action_strength,
        Godot.Core.InputEvent.is_pressed, Godot.Core.InputEvent.is_echo,
        Godot.Core.InputEvent.as_text,
        Godot.Core.InputEvent.shortcut_match,
        Godot.Core.InputEvent.is_action_type,
        Godot.Core.InputEvent.accumulate, Godot.Core.InputEvent.xformed_by)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEvent_set_device #-}

-- | The event's device ID.
bindInputEvent_set_device :: MethodBind
bindInputEvent_set_device
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "set_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The event's device ID.
set_device ::
             (InputEvent :< cls, Object :< cls) => cls -> Int -> IO ()
set_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_set_device (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_get_device #-}

-- | The event's device ID.
bindInputEvent_get_device :: MethodBind
bindInputEvent_get_device
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "get_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The event's device ID.
get_device :: (InputEvent :< cls, Object :< cls) => cls -> IO Int
get_device cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_get_device (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_is_action #-}

-- | Returns [code]true[/code] if this input event matches a pre-defined action of any type.
bindInputEvent_is_action :: MethodBind
bindInputEvent_is_action
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this input event matches a pre-defined action of any type.
is_action ::
            (InputEvent :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_is_action_pressed #-}

-- | Returns [code]true[/code] if the given action is being pressed (and is not an echo event for KEY events). Not relevant for the event types [code]MOUSE_MOTION[/code], [code]SCREEN_DRAG[/code] or [code]NONE[/code].
bindInputEvent_is_action_pressed :: MethodBind
bindInputEvent_is_action_pressed
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given action is being pressed (and is not an echo event for KEY events). Not relevant for the event types [code]MOUSE_MOTION[/code], [code]SCREEN_DRAG[/code] or [code]NONE[/code].
is_action_pressed ::
                    (InputEvent :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_is_action_released #-}

-- | Returns [code]true[/code] if the given action is released (i.e. not pressed). Not relevant for the event types [code]MOUSE_MOTION[/code], [code]SCREEN_DRAG[/code] or [code]NONE[/code].
bindInputEvent_is_action_released :: MethodBind
bindInputEvent_is_action_released
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action_released" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given action is released (i.e. not pressed). Not relevant for the event types [code]MOUSE_MOTION[/code], [code]SCREEN_DRAG[/code] or [code]NONE[/code].
is_action_released ::
                     (InputEvent :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action_released cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action_released
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_get_action_strength #-}

bindInputEvent_get_action_strength :: MethodBind
bindInputEvent_get_action_strength
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "get_action_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_action_strength ::
                      (InputEvent :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Float
get_action_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_get_action_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_is_pressed #-}

-- | Returns [code]true[/code] if this input event is pressed. Not relevant for the event types [code]MOUSE_MOTION[/code], [code]SCREEN_DRAG[/code] or [code]NONE[/code].
bindInputEvent_is_pressed :: MethodBind
bindInputEvent_is_pressed
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this input event is pressed. Not relevant for the event types [code]MOUSE_MOTION[/code], [code]SCREEN_DRAG[/code] or [code]NONE[/code].
is_pressed :: (InputEvent :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_is_echo #-}

-- | Returns [code]true[/code] if this input event is an echo event (only for events of type KEY).
bindInputEvent_is_echo :: MethodBind
bindInputEvent_is_echo
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_echo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this input event is an echo event (only for events of type KEY).
is_echo :: (InputEvent :< cls, Object :< cls) => cls -> IO Bool
is_echo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_echo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_as_text #-}

-- | Returns a [String] representation of the event.
bindInputEvent_as_text :: MethodBind
bindInputEvent_as_text
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "as_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [String] representation of the event.
as_text ::
          (InputEvent :< cls, Object :< cls) => cls -> IO GodotString
as_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_as_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_shortcut_match #-}

bindInputEvent_shortcut_match :: MethodBind
bindInputEvent_shortcut_match
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "shortcut_match" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shortcut_match ::
                 (InputEvent :< cls, Object :< cls) => cls -> InputEvent -> IO Bool
shortcut_match cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_shortcut_match (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_is_action_type #-}

-- | Returns [code]true[/code] if this input event's type is one of the [code]InputEvent[/code] constants.
bindInputEvent_is_action_type :: MethodBind
bindInputEvent_is_action_type
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this input event's type is one of the [code]InputEvent[/code] constants.
is_action_type ::
                 (InputEvent :< cls, Object :< cls) => cls -> IO Bool
is_action_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_accumulate #-}

bindInputEvent_accumulate :: MethodBind
bindInputEvent_accumulate
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "accumulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

accumulate ::
             (InputEvent :< cls, Object :< cls) => cls -> InputEvent -> IO Bool
accumulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_accumulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEvent_xformed_by #-}

bindInputEvent_xformed_by :: MethodBind
bindInputEvent_xformed_by
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "xformed_by" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

xformed_by ::
             (InputEvent :< cls, Object :< cls) =>
             cls -> Transform2d -> Vector2 -> IO InputEvent
xformed_by cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_xformed_by (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)