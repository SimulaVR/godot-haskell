{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Specifies the format in which the sample will be recorded. See [enum AudioStreamSample.Format] for available formats.
bindAudioEffectRecord_get_format :: MethodBind
bindAudioEffectRecord_get_format
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the format in which the sample will be recorded. See [enum AudioStreamSample.Format] for available formats.
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

-- | Returns the recorded sample.
bindAudioEffectRecord_get_recording :: MethodBind
bindAudioEffectRecord_get_recording
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "get_recording" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the recorded sample.
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

-- | Returns whether the recording is active or not.
bindAudioEffectRecord_is_recording_active :: MethodBind
bindAudioEffectRecord_is_recording_active
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "is_recording_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the recording is active or not.
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

-- | Specifies the format in which the sample will be recorded. See [enum AudioStreamSample.Format] for available formats.
bindAudioEffectRecord_set_format :: MethodBind
bindAudioEffectRecord_set_format
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "set_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the format in which the sample will be recorded. See [enum AudioStreamSample.Format] for available formats.
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

-- | If [code]true[/code], the sound will be recorded. Note that restarting the recording will remove the previously recorded sample.
bindAudioEffectRecord_set_recording_active :: MethodBind
bindAudioEffectRecord_set_recording_active
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "set_recording_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the sound will be recorded. Note that restarting the recording will remove the previously recorded sample.
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