{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeStateMachineTransition
       (Godot.Core.AnimationNodeStateMachineTransition._SWITCH_MODE_IMMEDIATE,
        Godot.Core.AnimationNodeStateMachineTransition._SWITCH_MODE_SYNC,
        Godot.Core.AnimationNodeStateMachineTransition._SWITCH_MODE_AT_END,
        Godot.Core.AnimationNodeStateMachineTransition.sig_advance_condition_changed,
        Godot.Core.AnimationNodeStateMachineTransition.set_switch_mode,
        Godot.Core.AnimationNodeStateMachineTransition.get_switch_mode,
        Godot.Core.AnimationNodeStateMachineTransition.set_auto_advance,
        Godot.Core.AnimationNodeStateMachineTransition.has_auto_advance,
        Godot.Core.AnimationNodeStateMachineTransition.set_advance_condition,
        Godot.Core.AnimationNodeStateMachineTransition.get_advance_condition,
        Godot.Core.AnimationNodeStateMachineTransition.set_xfade_time,
        Godot.Core.AnimationNodeStateMachineTransition.get_xfade_time,
        Godot.Core.AnimationNodeStateMachineTransition.set_disabled,
        Godot.Core.AnimationNodeStateMachineTransition.is_disabled,
        Godot.Core.AnimationNodeStateMachineTransition.set_priority,
        Godot.Core.AnimationNodeStateMachineTransition.get_priority)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SWITCH_MODE_IMMEDIATE :: Int
_SWITCH_MODE_IMMEDIATE = 0

_SWITCH_MODE_SYNC :: Int
_SWITCH_MODE_SYNC = 1

_SWITCH_MODE_AT_END :: Int
_SWITCH_MODE_AT_END = 2

sig_advance_condition_changed ::
                              Godot.Internal.Dispatch.Signal AnimationNodeStateMachineTransition
sig_advance_condition_changed
  = Godot.Internal.Dispatch.Signal "advance_condition_changed"

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_switch_mode
             #-}

-- | The transition type.
bindAnimationNodeStateMachineTransition_set_switch_mode ::
                                                        MethodBind
bindAnimationNodeStateMachineTransition_set_switch_mode
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_switch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition type.
set_switch_mode ::
                  (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
set_switch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_switch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_switch_mode
             #-}

-- | The transition type.
bindAnimationNodeStateMachineTransition_get_switch_mode ::
                                                        MethodBind
bindAnimationNodeStateMachineTransition_get_switch_mode
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_switch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition type.
get_switch_mode ::
                  (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                  cls -> IO Int
get_switch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_switch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_auto_advance
             #-}

-- | Turn on the transition automatically when this state is reached. This works best with [code]SWITCH_MODE_AT_END[/code].
bindAnimationNodeStateMachineTransition_set_auto_advance ::
                                                         MethodBind
bindAnimationNodeStateMachineTransition_set_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on the transition automatically when this state is reached. This works best with [code]SWITCH_MODE_AT_END[/code].
set_auto_advance ::
                   (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                   cls -> Bool -> IO ()
set_auto_advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_has_auto_advance
             #-}

-- | Turn on the transition automatically when this state is reached. This works best with [code]SWITCH_MODE_AT_END[/code].
bindAnimationNodeStateMachineTransition_has_auto_advance ::
                                                         MethodBind
bindAnimationNodeStateMachineTransition_has_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "has_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on the transition automatically when this state is reached. This works best with [code]SWITCH_MODE_AT_END[/code].
has_auto_advance ::
                   (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                   cls -> IO Bool
has_auto_advance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_has_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_advance_condition
             #-}

-- | Turn on auto advance when this condition is set. This is a custom text field that can be filled with a variable name. The variable can be modified from code.
bindAnimationNodeStateMachineTransition_set_advance_condition ::
                                                              MethodBind
bindAnimationNodeStateMachineTransition_set_advance_condition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_advance_condition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on auto advance when this condition is set. This is a custom text field that can be filled with a variable name. The variable can be modified from code.
set_advance_condition ::
                        (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                        cls -> GodotString -> IO ()
set_advance_condition cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_advance_condition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_advance_condition
             #-}

-- | Turn on auto advance when this condition is set. This is a custom text field that can be filled with a variable name. The variable can be modified from code.
bindAnimationNodeStateMachineTransition_get_advance_condition ::
                                                              MethodBind
bindAnimationNodeStateMachineTransition_get_advance_condition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_advance_condition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on auto advance when this condition is set. This is a custom text field that can be filled with a variable name. The variable can be modified from code.
get_advance_condition ::
                        (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                        cls -> IO GodotString
get_advance_condition cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_advance_condition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_xfade_time
             #-}

-- | The time to cross-fade between this state and the next.
bindAnimationNodeStateMachineTransition_set_xfade_time ::
                                                       MethodBind
bindAnimationNodeStateMachineTransition_set_xfade_time
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time to cross-fade between this state and the next.
set_xfade_time ::
                 (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_xfade_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_xfade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_xfade_time
             #-}

-- | The time to cross-fade between this state and the next.
bindAnimationNodeStateMachineTransition_get_xfade_time ::
                                                       MethodBind
bindAnimationNodeStateMachineTransition_get_xfade_time
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time to cross-fade between this state and the next.
get_xfade_time ::
                 (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                 cls -> IO Float
get_xfade_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_xfade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_disabled
             #-}

-- | Don't use this transition during [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
bindAnimationNodeStateMachineTransition_set_disabled :: MethodBind
bindAnimationNodeStateMachineTransition_set_disabled
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Don't use this transition during [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
set_disabled ::
               (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
               cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_is_disabled
             #-}

-- | Don't use this transition during [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
bindAnimationNodeStateMachineTransition_is_disabled :: MethodBind
bindAnimationNodeStateMachineTransition_is_disabled
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Don't use this transition during [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
is_disabled ::
              (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
              cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_is_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_priority
             #-}

-- | Lower priority transitions are preferred when travelling through the tree via [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
bindAnimationNodeStateMachineTransition_set_priority :: MethodBind
bindAnimationNodeStateMachineTransition_set_priority
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lower priority transitions are preferred when travelling through the tree via [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
set_priority ::
               (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_priority
             #-}

-- | Lower priority transitions are preferred when travelling through the tree via [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
bindAnimationNodeStateMachineTransition_get_priority :: MethodBind
bindAnimationNodeStateMachineTransition_get_priority
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lower priority transitions are preferred when travelling through the tree via [method AnimationNodeStateMachinePlayback.travel] or [member auto_advance].
get_priority ::
               (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
               cls -> IO Int
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)