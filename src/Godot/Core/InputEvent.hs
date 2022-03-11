{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEvent
       (Godot.Core.InputEvent.accumulate, Godot.Core.InputEvent.as_text,
        Godot.Core.InputEvent.get_action_strength,
        Godot.Core.InputEvent.get_device, Godot.Core.InputEvent.is_action,
        Godot.Core.InputEvent.is_action_pressed,
        Godot.Core.InputEvent.is_action_released,
        Godot.Core.InputEvent.is_action_type,
        Godot.Core.InputEvent.is_echo, Godot.Core.InputEvent.is_pressed,
        Godot.Core.InputEvent.set_device,
        Godot.Core.InputEvent.shortcut_match,
        Godot.Core.InputEvent.xformed_by)
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
import Godot.Core.Resource()

instance NodeProperty InputEvent "device" Int 'False where
        nodeProperty = (get_device, wrapDroppingSetter set_device, Nothing)

{-# NOINLINE bindInputEvent_accumulate #-}

-- | Returns @true@ if the given input event and this input event can be added together (only for events of type @InputEventMouseMotion@).
--   				The given input event's position, global position and speed will be copied. The resulting @relative@ is a sum of both events. Both events' modifiers have to be identical.
bindInputEvent_accumulate :: MethodBind
bindInputEvent_accumulate
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "accumulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given input event and this input event can be added together (only for events of type @InputEventMouseMotion@).
--   				The given input event's position, global position and speed will be copied. The resulting @relative@ is a sum of both events. Both events' modifiers have to be identical.
accumulate ::
             (InputEvent :< cls, Object :< cls) => cls -> InputEvent -> IO Bool
accumulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_accumulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "accumulate" '[InputEvent] (IO Bool)
         where
        nodeMethod = Godot.Core.InputEvent.accumulate

{-# NOINLINE bindInputEvent_as_text #-}

-- | Returns a @String@ representation of the event.
bindInputEvent_as_text :: MethodBind
bindInputEvent_as_text
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "as_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @String@ representation of the event.
as_text ::
          (InputEvent :< cls, Object :< cls) => cls -> IO GodotString
as_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_as_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "as_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.InputEvent.as_text

{-# NOINLINE bindInputEvent_get_action_strength #-}

-- | Returns a value between 0.0 and 1.0 depending on the given actions' state. Useful for getting the value of events of type @InputEventJoypadMotion@.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
bindInputEvent_get_action_strength :: MethodBind
bindInputEvent_get_action_strength
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "get_action_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value between 0.0 and 1.0 depending on the given actions' state. Useful for getting the value of events of type @InputEventJoypadMotion@.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
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

instance NodeMethod InputEvent "get_action_strength" '[GodotString]
           (IO Float)
         where
        nodeMethod = Godot.Core.InputEvent.get_action_strength

{-# NOINLINE bindInputEvent_get_device #-}

-- | The event's device ID.
--   			__Note:__ This device ID will always be @-1@ for emulated mouse input from a touchscreen. This can be used to distinguish emulated mouse input from physical mouse input.
bindInputEvent_get_device :: MethodBind
bindInputEvent_get_device
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "get_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The event's device ID.
--   			__Note:__ This device ID will always be @-1@ for emulated mouse input from a touchscreen. This can be used to distinguish emulated mouse input from physical mouse input.
get_device :: (InputEvent :< cls, Object :< cls) => cls -> IO Int
get_device cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_get_device (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "get_device" '[] (IO Int) where
        nodeMethod = Godot.Core.InputEvent.get_device

{-# NOINLINE bindInputEvent_is_action #-}

-- | Returns @true@ if this input event matches a pre-defined action of any type.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
bindInputEvent_is_action :: MethodBind
bindInputEvent_is_action
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this input event matches a pre-defined action of any type.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
is_action ::
            (InputEvent :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "is_action" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.InputEvent.is_action

{-# NOINLINE bindInputEvent_is_action_pressed #-}

-- | Returns @true@ if the given action is being pressed (and is not an echo event for @InputEventKey@ events, unless @allow_echo@ is @true@). Not relevant for events of type @InputEventMouseMotion@ or @InputEventScreenDrag@.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Due to keyboard ghosting, @method is_action_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=https://docs.godotengine.org/en/3.4/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
bindInputEvent_is_action_pressed :: MethodBind
bindInputEvent_is_action_pressed
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given action is being pressed (and is not an echo event for @InputEventKey@ events, unless @allow_echo@ is @true@). Not relevant for events of type @InputEventMouseMotion@ or @InputEventScreenDrag@.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
--   				__Note:__ Due to keyboard ghosting, @method is_action_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=https://docs.godotengine.org/en/3.4/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
is_action_pressed ::
                    (InputEvent :< cls, Object :< cls) =>
                    cls -> GodotString -> Maybe Bool -> IO Bool
is_action_pressed cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "is_action_pressed"
           '[GodotString, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.InputEvent.is_action_pressed

{-# NOINLINE bindInputEvent_is_action_released #-}

-- | Returns @true@ if the given action is released (i.e. not pressed). Not relevant for events of type @InputEventMouseMotion@ or @InputEventScreenDrag@.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
bindInputEvent_is_action_released :: MethodBind
bindInputEvent_is_action_released
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action_released" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given action is released (i.e. not pressed). Not relevant for events of type @InputEventMouseMotion@ or @InputEventScreenDrag@.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
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

instance NodeMethod InputEvent "is_action_released" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.InputEvent.is_action_released

{-# NOINLINE bindInputEvent_is_action_type #-}

-- | Returns @true@ if this input event's type is one that can be assigned to an input action.
bindInputEvent_is_action_type :: MethodBind
bindInputEvent_is_action_type
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_action_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this input event's type is one that can be assigned to an input action.
is_action_type ::
                 (InputEvent :< cls, Object :< cls) => cls -> IO Bool
is_action_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_action_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "is_action_type" '[] (IO Bool) where
        nodeMethod = Godot.Core.InputEvent.is_action_type

{-# NOINLINE bindInputEvent_is_echo #-}

-- | Returns @true@ if this input event is an echo event (only for events of type @InputEventKey@).
bindInputEvent_is_echo :: MethodBind
bindInputEvent_is_echo
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_echo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this input event is an echo event (only for events of type @InputEventKey@).
is_echo :: (InputEvent :< cls, Object :< cls) => cls -> IO Bool
is_echo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_echo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "is_echo" '[] (IO Bool) where
        nodeMethod = Godot.Core.InputEvent.is_echo

{-# NOINLINE bindInputEvent_is_pressed #-}

-- | Returns @true@ if this input event is pressed. Not relevant for events of type @InputEventMouseMotion@ or @InputEventScreenDrag@.
--   				__Note:__ Due to keyboard ghosting, @method is_action_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=https://docs.godotengine.org/en/3.4/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
bindInputEvent_is_pressed :: MethodBind
bindInputEvent_is_pressed
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this input event is pressed. Not relevant for events of type @InputEventMouseMotion@ or @InputEventScreenDrag@.
--   				__Note:__ Due to keyboard ghosting, @method is_action_pressed@ may return @false@ even if one of the action's keys is pressed. See @url=https://docs.godotengine.org/en/3.4/tutorials/inputs/input_examples.html#keyboard-events@Input examples@/url@ in the documentation for more information.
is_pressed :: (InputEvent :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_is_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "is_pressed" '[] (IO Bool) where
        nodeMethod = Godot.Core.InputEvent.is_pressed

{-# NOINLINE bindInputEvent_set_device #-}

-- | The event's device ID.
--   			__Note:__ This device ID will always be @-1@ for emulated mouse input from a touchscreen. This can be used to distinguish emulated mouse input from physical mouse input.
bindInputEvent_set_device :: MethodBind
bindInputEvent_set_device
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "set_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The event's device ID.
--   			__Note:__ This device ID will always be @-1@ for emulated mouse input from a touchscreen. This can be used to distinguish emulated mouse input from physical mouse input.
set_device ::
             (InputEvent :< cls, Object :< cls) => cls -> Int -> IO ()
set_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_set_device (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "set_device" '[Int] (IO ()) where
        nodeMethod = Godot.Core.InputEvent.set_device

{-# NOINLINE bindInputEvent_shortcut_match #-}

-- | Returns @true@ if the specified @event@ matches this event. Only valid for action events i.e key (@InputEventKey@), button (@InputEventMouseButton@ or @InputEventJoypadButton@), axis @InputEventJoypadMotion@ or action (@InputEventAction@) events.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
bindInputEvent_shortcut_match :: MethodBind
bindInputEvent_shortcut_match
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "shortcut_match" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified @event@ matches this event. Only valid for action events i.e key (@InputEventKey@), button (@InputEventMouseButton@ or @InputEventJoypadButton@), axis @InputEventJoypadMotion@ or action (@InputEventAction@) events.
--   				If @exact_match@ is @false@, it ignores the input modifiers for @InputEventKey@ and @InputEventMouseButton@ events, and the direction for @InputEventJoypadMotion@ events.
shortcut_match ::
                 (InputEvent :< cls, Object :< cls) => cls -> InputEvent -> IO Bool
shortcut_match cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_shortcut_match (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "shortcut_match" '[InputEvent]
           (IO Bool)
         where
        nodeMethod = Godot.Core.InputEvent.shortcut_match

{-# NOINLINE bindInputEvent_xformed_by #-}

-- | Returns a copy of the given input event which has been offset by @local_ofs@ and transformed by @xform@. Relevant for events of type @InputEventMouseButton@, @InputEventMouseMotion@, @InputEventScreenTouch@, @InputEventScreenDrag@, @InputEventMagnifyGesture@ and @InputEventPanGesture@.
bindInputEvent_xformed_by :: MethodBind
bindInputEvent_xformed_by
  = unsafePerformIO $
      withCString "InputEvent" $
        \ clsNamePtr ->
          withCString "xformed_by" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a copy of the given input event which has been offset by @local_ofs@ and transformed by @xform@. Relevant for events of type @InputEventMouseButton@, @InputEventMouseMotion@, @InputEventScreenTouch@, @InputEventScreenDrag@, @InputEventMagnifyGesture@ and @InputEventPanGesture@.
xformed_by ::
             (InputEvent :< cls, Object :< cls) =>
             cls -> Transform2d -> Maybe Vector2 -> IO InputEvent
xformed_by cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantVector2 (V2 0 0) arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEvent_xformed_by (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEvent "xformed_by"
           '[Transform2d, Maybe Vector2]
           (IO InputEvent)
         where
        nodeMethod = Godot.Core.InputEvent.xformed_by