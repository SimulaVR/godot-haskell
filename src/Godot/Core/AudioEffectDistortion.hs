{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectDistortion
       (Godot.Core.AudioEffectDistortion._MODE_CLIP,
        Godot.Core.AudioEffectDistortion._MODE_LOFI,
        Godot.Core.AudioEffectDistortion._MODE_OVERDRIVE,
        Godot.Core.AudioEffectDistortion._MODE_WAVESHAPE,
        Godot.Core.AudioEffectDistortion._MODE_ATAN,
        Godot.Core.AudioEffectDistortion.set_mode,
        Godot.Core.AudioEffectDistortion.get_mode,
        Godot.Core.AudioEffectDistortion.set_pre_gain,
        Godot.Core.AudioEffectDistortion.get_pre_gain,
        Godot.Core.AudioEffectDistortion.set_keep_hf_hz,
        Godot.Core.AudioEffectDistortion.get_keep_hf_hz,
        Godot.Core.AudioEffectDistortion.set_drive,
        Godot.Core.AudioEffectDistortion.get_drive,
        Godot.Core.AudioEffectDistortion.set_post_gain,
        Godot.Core.AudioEffectDistortion.get_post_gain)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_CLIP :: Int
_MODE_CLIP = 0

_MODE_LOFI :: Int
_MODE_LOFI = 2

_MODE_OVERDRIVE :: Int
_MODE_OVERDRIVE = 3

_MODE_WAVESHAPE :: Int
_MODE_WAVESHAPE = 4

_MODE_ATAN :: Int
_MODE_ATAN = 1

{-# NOINLINE bindAudioEffectDistortion_set_mode #-}

-- | Distortion type. Default value: [code]MODE_CLIP[/code].
bindAudioEffectDistortion_set_mode :: MethodBind
bindAudioEffectDistortion_set_mode
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distortion type. Default value: [code]MODE_CLIP[/code].
set_mode ::
           (AudioEffectDistortion :< cls, Object :< cls) =>
           cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_set_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_get_mode #-}

-- | Distortion type. Default value: [code]MODE_CLIP[/code].
bindAudioEffectDistortion_get_mode :: MethodBind
bindAudioEffectDistortion_get_mode
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distortion type. Default value: [code]MODE_CLIP[/code].
get_mode ::
           (AudioEffectDistortion :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_get_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_set_pre_gain #-}

-- | Increases or decreases the volume before the effect. Value can range from -60 to 60. Default value: [code]0[/code].
bindAudioEffectDistortion_set_pre_gain :: MethodBind
bindAudioEffectDistortion_set_pre_gain
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "set_pre_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increases or decreases the volume before the effect. Value can range from -60 to 60. Default value: [code]0[/code].
set_pre_gain ::
               (AudioEffectDistortion :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_pre_gain cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_set_pre_gain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_get_pre_gain #-}

-- | Increases or decreases the volume before the effect. Value can range from -60 to 60. Default value: [code]0[/code].
bindAudioEffectDistortion_get_pre_gain :: MethodBind
bindAudioEffectDistortion_get_pre_gain
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "get_pre_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increases or decreases the volume before the effect. Value can range from -60 to 60. Default value: [code]0[/code].
get_pre_gain ::
               (AudioEffectDistortion :< cls, Object :< cls) => cls -> IO Float
get_pre_gain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_get_pre_gain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_set_keep_hf_hz #-}

-- | High-pass filter. Frequencies higher than this value will not be affected by the distortion. Value can range from 1 to 20000. Default value: [code]16000[/code].
bindAudioEffectDistortion_set_keep_hf_hz :: MethodBind
bindAudioEffectDistortion_set_keep_hf_hz
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "set_keep_hf_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | High-pass filter. Frequencies higher than this value will not be affected by the distortion. Value can range from 1 to 20000. Default value: [code]16000[/code].
set_keep_hf_hz ::
                 (AudioEffectDistortion :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_keep_hf_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_set_keep_hf_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_get_keep_hf_hz #-}

-- | High-pass filter. Frequencies higher than this value will not be affected by the distortion. Value can range from 1 to 20000. Default value: [code]16000[/code].
bindAudioEffectDistortion_get_keep_hf_hz :: MethodBind
bindAudioEffectDistortion_get_keep_hf_hz
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "get_keep_hf_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | High-pass filter. Frequencies higher than this value will not be affected by the distortion. Value can range from 1 to 20000. Default value: [code]16000[/code].
get_keep_hf_hz ::
                 (AudioEffectDistortion :< cls, Object :< cls) => cls -> IO Float
get_keep_hf_hz cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_get_keep_hf_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_set_drive #-}

-- | Distortion power. Value can range from 0 to 1. Default value: [code]0[/code].
bindAudioEffectDistortion_set_drive :: MethodBind
bindAudioEffectDistortion_set_drive
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "set_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distortion power. Value can range from 0 to 1. Default value: [code]0[/code].
set_drive ::
            (AudioEffectDistortion :< cls, Object :< cls) =>
            cls -> Float -> IO ()
set_drive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_set_drive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_get_drive #-}

-- | Distortion power. Value can range from 0 to 1. Default value: [code]0[/code].
bindAudioEffectDistortion_get_drive :: MethodBind
bindAudioEffectDistortion_get_drive
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "get_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distortion power. Value can range from 0 to 1. Default value: [code]0[/code].
get_drive ::
            (AudioEffectDistortion :< cls, Object :< cls) => cls -> IO Float
get_drive cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_get_drive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_set_post_gain #-}

-- | Increases or decreases the volume after the effect. Value can range from -80 to 24. Default value: [code]0[/code].
bindAudioEffectDistortion_set_post_gain :: MethodBind
bindAudioEffectDistortion_set_post_gain
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "set_post_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increases or decreases the volume after the effect. Value can range from -80 to 24. Default value: [code]0[/code].
set_post_gain ::
                (AudioEffectDistortion :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_post_gain cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_set_post_gain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDistortion_get_post_gain #-}

-- | Increases or decreases the volume after the effect. Value can range from -80 to 24. Default value: [code]0[/code].
bindAudioEffectDistortion_get_post_gain :: MethodBind
bindAudioEffectDistortion_get_post_gain
  = unsafePerformIO $
      withCString "AudioEffectDistortion" $
        \ clsNamePtr ->
          withCString "get_post_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increases or decreases the volume after the effect. Value can range from -80 to 24. Default value: [code]0[/code].
get_post_gain ::
                (AudioEffectDistortion :< cls, Object :< cls) => cls -> IO Float
get_post_gain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDistortion_get_post_gain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)