{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventMIDI
       (Godot.Core.InputEventMIDI.get_channel,
        Godot.Core.InputEventMIDI.get_controller_number,
        Godot.Core.InputEventMIDI.get_controller_value,
        Godot.Core.InputEventMIDI.get_instrument,
        Godot.Core.InputEventMIDI.get_message,
        Godot.Core.InputEventMIDI.get_pitch,
        Godot.Core.InputEventMIDI.get_pressure,
        Godot.Core.InputEventMIDI.get_velocity,
        Godot.Core.InputEventMIDI.set_channel,
        Godot.Core.InputEventMIDI.set_controller_number,
        Godot.Core.InputEventMIDI.set_controller_value,
        Godot.Core.InputEventMIDI.set_instrument,
        Godot.Core.InputEventMIDI.set_message,
        Godot.Core.InputEventMIDI.set_pitch,
        Godot.Core.InputEventMIDI.set_pressure,
        Godot.Core.InputEventMIDI.set_velocity)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventMIDI_get_channel #-}

bindInputEventMIDI_get_channel :: MethodBind
bindInputEventMIDI_get_channel
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_channel ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_channel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_controller_number #-}

bindInputEventMIDI_get_controller_number :: MethodBind
bindInputEventMIDI_get_controller_number
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_controller_number" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_controller_number ::
                        (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_controller_number cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_controller_number
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_controller_value #-}

bindInputEventMIDI_get_controller_value :: MethodBind
bindInputEventMIDI_get_controller_value
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_controller_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_controller_value ::
                       (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_controller_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_controller_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_instrument #-}

bindInputEventMIDI_get_instrument :: MethodBind
bindInputEventMIDI_get_instrument
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_instrument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_instrument ::
                 (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_instrument cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_instrument
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_message #-}

bindInputEventMIDI_get_message :: MethodBind
bindInputEventMIDI_get_message
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_message ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_message cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_message (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_pitch #-}

bindInputEventMIDI_get_pitch :: MethodBind
bindInputEventMIDI_get_pitch
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_pitch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pitch ::
            (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_pitch cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_pitch (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_pressure #-}

bindInputEventMIDI_get_pressure :: MethodBind
bindInputEventMIDI_get_pressure
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pressure ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_pressure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_pressure (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_get_velocity #-}

bindInputEventMIDI_get_velocity :: MethodBind
bindInputEventMIDI_get_velocity
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "get_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_velocity ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> IO Int
get_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_get_velocity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_channel #-}

bindInputEventMIDI_set_channel :: MethodBind
bindInputEventMIDI_set_channel
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_channel ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_channel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_controller_number #-}

bindInputEventMIDI_set_controller_number :: MethodBind
bindInputEventMIDI_set_controller_number
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_controller_number" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_controller_number ::
                        (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_controller_number cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_controller_number
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_controller_value #-}

bindInputEventMIDI_set_controller_value :: MethodBind
bindInputEventMIDI_set_controller_value
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_controller_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_controller_value ::
                       (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_controller_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_controller_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_instrument #-}

bindInputEventMIDI_set_instrument :: MethodBind
bindInputEventMIDI_set_instrument
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_instrument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_instrument ::
                 (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_instrument cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_instrument
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_message #-}

bindInputEventMIDI_set_message :: MethodBind
bindInputEventMIDI_set_message
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_message ::
              (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_message cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_message (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_pitch #-}

bindInputEventMIDI_set_pitch :: MethodBind
bindInputEventMIDI_set_pitch
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_pitch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_pitch ::
            (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_pitch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_pitch (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_pressure #-}

bindInputEventMIDI_set_pressure :: MethodBind
bindInputEventMIDI_set_pressure
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_pressure ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_pressure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_pressure (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMIDI_set_velocity #-}

bindInputEventMIDI_set_velocity :: MethodBind
bindInputEventMIDI_set_velocity
  = unsafePerformIO $
      withCString "InputEventMIDI" $
        \ clsNamePtr ->
          withCString "set_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_velocity ::
               (InputEventMIDI :< cls, Object :< cls) => cls -> Int -> IO ()
set_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMIDI_set_velocity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)