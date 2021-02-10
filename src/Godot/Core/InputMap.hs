{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputMap
       (Godot.Core.InputMap.action_add_event,
        Godot.Core.InputMap.action_erase_event,
        Godot.Core.InputMap.action_erase_events,
        Godot.Core.InputMap.action_has_event,
        Godot.Core.InputMap.action_set_deadzone,
        Godot.Core.InputMap.add_action, Godot.Core.InputMap.erase_action,
        Godot.Core.InputMap.event_is_action,
        Godot.Core.InputMap.get_action_list,
        Godot.Core.InputMap.get_actions, Godot.Core.InputMap.has_action,
        Godot.Core.InputMap.load_from_globals)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputMap_action_add_event #-}

-- | Adds an [InputEvent] to an action. This [InputEvent] will trigger the action.
bindInputMap_action_add_event :: MethodBind
bindInputMap_action_add_event
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "action_add_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an [InputEvent] to an action. This [InputEvent] will trigger the action.
action_add_event ::
                   (InputMap :< cls, Object :< cls) =>
                   cls -> GodotString -> InputEvent -> IO ()
action_add_event cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_action_add_event (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_action_erase_event #-}

-- | Removes an [InputEvent] from an action.
bindInputMap_action_erase_event :: MethodBind
bindInputMap_action_erase_event
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "action_erase_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes an [InputEvent] from an action.
action_erase_event ::
                     (InputMap :< cls, Object :< cls) =>
                     cls -> GodotString -> InputEvent -> IO ()
action_erase_event cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_action_erase_event (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_action_erase_events #-}

-- | Removes all events from an action.
bindInputMap_action_erase_events :: MethodBind
bindInputMap_action_erase_events
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "action_erase_events" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all events from an action.
action_erase_events ::
                      (InputMap :< cls, Object :< cls) => cls -> GodotString -> IO ()
action_erase_events cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_action_erase_events
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_action_has_event #-}

-- | Returns [code]true[/code] if the action has the given [InputEvent] associated with it.
bindInputMap_action_has_event :: MethodBind
bindInputMap_action_has_event
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "action_has_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the action has the given [InputEvent] associated with it.
action_has_event ::
                   (InputMap :< cls, Object :< cls) =>
                   cls -> GodotString -> InputEvent -> IO Bool
action_has_event cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_action_has_event (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_action_set_deadzone #-}

-- | Sets a deadzone value for the action.
bindInputMap_action_set_deadzone :: MethodBind
bindInputMap_action_set_deadzone
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "action_set_deadzone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a deadzone value for the action.
action_set_deadzone ::
                      (InputMap :< cls, Object :< cls) =>
                      cls -> GodotString -> Float -> IO ()
action_set_deadzone cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_action_set_deadzone
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_add_action #-}

-- | Adds an empty action to the [InputMap] with a configurable [code]deadzone[/code].
--   				An [InputEvent] can then be added to this action with [method action_add_event].
bindInputMap_add_action :: MethodBind
bindInputMap_add_action
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "add_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an empty action to the [InputMap] with a configurable [code]deadzone[/code].
--   				An [InputEvent] can then be added to this action with [method action_add_event].
add_action ::
             (InputMap :< cls, Object :< cls) =>
             cls -> GodotString -> Float -> IO ()
add_action cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_add_action (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_erase_action #-}

-- | Removes an action from the [InputMap].
bindInputMap_erase_action :: MethodBind
bindInputMap_erase_action
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "erase_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes an action from the [InputMap].
erase_action ::
               (InputMap :< cls, Object :< cls) => cls -> GodotString -> IO ()
erase_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_erase_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_event_is_action #-}

-- | Returns [code]true[/code] if the given event is part of an existing action. This method ignores keyboard modifiers if the given [InputEvent] is not pressed (for proper release detection). See [method action_has_event] if you don't want this behavior.
bindInputMap_event_is_action :: MethodBind
bindInputMap_event_is_action
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "event_is_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given event is part of an existing action. This method ignores keyboard modifiers if the given [InputEvent] is not pressed (for proper release detection). See [method action_has_event] if you don't want this behavior.
event_is_action ::
                  (InputMap :< cls, Object :< cls) =>
                  cls -> InputEvent -> GodotString -> IO Bool
event_is_action cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_event_is_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_get_action_list #-}

-- | Returns an array of [InputEvent]s associated with a given action.
bindInputMap_get_action_list :: MethodBind
bindInputMap_get_action_list
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "get_action_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of [InputEvent]s associated with a given action.
get_action_list ::
                  (InputMap :< cls, Object :< cls) => cls -> GodotString -> IO Array
get_action_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_get_action_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_get_actions #-}

-- | Returns an array of all actions in the [InputMap].
bindInputMap_get_actions :: MethodBind
bindInputMap_get_actions
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "get_actions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all actions in the [InputMap].
get_actions :: (InputMap :< cls, Object :< cls) => cls -> IO Array
get_actions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_get_actions (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_has_action #-}

-- | Returns [code]true[/code] if the [InputMap] has a registered action with the given name.
bindInputMap_has_action :: MethodBind
bindInputMap_has_action
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "has_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the [InputMap] has a registered action with the given name.
has_action ::
             (InputMap :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_has_action (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputMap_load_from_globals #-}

-- | Clears all [InputEventAction] in the [InputMap] and load it anew from [ProjectSettings].
bindInputMap_load_from_globals :: MethodBind
bindInputMap_load_from_globals
  = unsafePerformIO $
      withCString "InputMap" $
        \ clsNamePtr ->
          withCString "load_from_globals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all [InputEventAction] in the [InputMap] and load it anew from [ProjectSettings].
load_from_globals ::
                    (InputMap :< cls, Object :< cls) => cls -> IO ()
load_from_globals cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputMap_load_from_globals (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)