{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectRecord
       (Godot.Core.AudioEffectRecord.get_format,
        Godot.Core.AudioEffectRecord.get_recording,
        Godot.Core.AudioEffectRecord.is_recording_active,
        Godot.Core.AudioEffectRecord.set_format,
        Godot.Core.AudioEffectRecord.set_recording_active)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioEffectRecord_get_format #-}

bindAudioEffectRecord_get_format :: MethodBind
bindAudioEffectRecord_get_format
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_format ::
             (AudioEffectRecord :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_get_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectRecord_get_recording #-}

bindAudioEffectRecord_get_recording :: MethodBind
bindAudioEffectRecord_get_recording
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "get_recording" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_recording ::
                (AudioEffectRecord :< cls, Object :< cls) =>
                cls -> IO AudioStreamSample
get_recording cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_get_recording
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectRecord_is_recording_active #-}

bindAudioEffectRecord_is_recording_active :: MethodBind
bindAudioEffectRecord_is_recording_active
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "is_recording_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_recording_active ::
                      (AudioEffectRecord :< cls, Object :< cls) => cls -> IO Bool
is_recording_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_is_recording_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectRecord_set_format #-}

bindAudioEffectRecord_set_format :: MethodBind
bindAudioEffectRecord_set_format
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "set_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_format ::
             (AudioEffectRecord :< cls, Object :< cls) => cls -> Int -> IO ()
set_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_set_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectRecord_set_recording_active #-}

bindAudioEffectRecord_set_recording_active :: MethodBind
bindAudioEffectRecord_set_recording_active
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "set_recording_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_recording_active ::
                       (AudioEffectRecord :< cls, Object :< cls) => cls -> Bool -> IO ()
set_recording_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_set_recording_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)