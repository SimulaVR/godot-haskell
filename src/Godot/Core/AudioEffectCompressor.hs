{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectCompressor
       (Godot.Core.AudioEffectCompressor.get_attack_us,
        Godot.Core.AudioEffectCompressor.get_gain,
        Godot.Core.AudioEffectCompressor.get_mix,
        Godot.Core.AudioEffectCompressor.get_ratio,
        Godot.Core.AudioEffectCompressor.get_release_ms,
        Godot.Core.AudioEffectCompressor.get_sidechain,
        Godot.Core.AudioEffectCompressor.get_threshold,
        Godot.Core.AudioEffectCompressor.set_attack_us,
        Godot.Core.AudioEffectCompressor.set_gain,
        Godot.Core.AudioEffectCompressor.set_mix,
        Godot.Core.AudioEffectCompressor.set_ratio,
        Godot.Core.AudioEffectCompressor.set_release_ms,
        Godot.Core.AudioEffectCompressor.set_sidechain,
        Godot.Core.AudioEffectCompressor.set_threshold)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioEffectCompressor_get_attack_us #-}

-- | Compressor's reaction time when the signal exceeds the threshold. Value can range from 20 to 2000. Default value: [code]20ms[/code].
bindAudioEffectCompressor_get_attack_us :: MethodBind
bindAudioEffectCompressor_get_attack_us
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_attack_us" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Compressor's reaction time when the signal exceeds the threshold. Value can range from 20 to 2000. Default value: [code]20ms[/code].
get_attack_us ::
                (AudioEffectCompressor :< cls, Object :< cls) => cls -> IO Float
get_attack_us cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_attack_us
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_get_gain #-}

-- | Gain applied to the output signal.
bindAudioEffectCompressor_get_gain :: MethodBind
bindAudioEffectCompressor_get_gain
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gain applied to the output signal.
get_gain ::
           (AudioEffectCompressor :< cls, Object :< cls) => cls -> IO Float
get_gain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_gain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_get_mix #-}

-- | Balance between original signal and effect signal. Value can range from 0 (totally dry) to 1 (totally wet). Default value: [code]1[/code].
bindAudioEffectCompressor_get_mix :: MethodBind
bindAudioEffectCompressor_get_mix
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_mix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Balance between original signal and effect signal. Value can range from 0 (totally dry) to 1 (totally wet). Default value: [code]1[/code].
get_mix ::
          (AudioEffectCompressor :< cls, Object :< cls) => cls -> IO Float
get_mix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_mix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_get_ratio #-}

-- | Amount of compression applied to the audio once it passes the threshold level. The higher the ratio the more the loud parts of the audio will be compressed. Value can range from 1 to 48. Default value: [code]4[/code].
bindAudioEffectCompressor_get_ratio :: MethodBind
bindAudioEffectCompressor_get_ratio
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of compression applied to the audio once it passes the threshold level. The higher the ratio the more the loud parts of the audio will be compressed. Value can range from 1 to 48. Default value: [code]4[/code].
get_ratio ::
            (AudioEffectCompressor :< cls, Object :< cls) => cls -> IO Float
get_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_get_release_ms #-}

-- | Compressor's delay time to stop reducing the signal after the signal level falls below the threshold. Value can range from 20 to 2000. Default value: [code]250ms[/code].
bindAudioEffectCompressor_get_release_ms :: MethodBind
bindAudioEffectCompressor_get_release_ms
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_release_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Compressor's delay time to stop reducing the signal after the signal level falls below the threshold. Value can range from 20 to 2000. Default value: [code]250ms[/code].
get_release_ms ::
                 (AudioEffectCompressor :< cls, Object :< cls) => cls -> IO Float
get_release_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_release_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_get_sidechain #-}

-- | Reduce the sound level using another audio bus for threshold detection.
bindAudioEffectCompressor_get_sidechain :: MethodBind
bindAudioEffectCompressor_get_sidechain
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_sidechain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reduce the sound level using another audio bus for threshold detection.
get_sidechain ::
                (AudioEffectCompressor :< cls, Object :< cls) =>
                cls -> IO GodotString
get_sidechain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_sidechain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_get_threshold #-}

-- | The level above which compression is applied to the audio. Value can range from -60 to 0. Default value: [code]0[/code].
bindAudioEffectCompressor_get_threshold :: MethodBind
bindAudioEffectCompressor_get_threshold
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "get_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The level above which compression is applied to the audio. Value can range from -60 to 0. Default value: [code]0[/code].
get_threshold ::
                (AudioEffectCompressor :< cls, Object :< cls) => cls -> IO Float
get_threshold cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_get_threshold
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_attack_us #-}

-- | Compressor's reaction time when the signal exceeds the threshold. Value can range from 20 to 2000. Default value: [code]20ms[/code].
bindAudioEffectCompressor_set_attack_us :: MethodBind
bindAudioEffectCompressor_set_attack_us
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_attack_us" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Compressor's reaction time when the signal exceeds the threshold. Value can range from 20 to 2000. Default value: [code]20ms[/code].
set_attack_us ::
                (AudioEffectCompressor :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_attack_us cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_attack_us
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_gain #-}

-- | Gain applied to the output signal.
bindAudioEffectCompressor_set_gain :: MethodBind
bindAudioEffectCompressor_set_gain
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gain applied to the output signal.
set_gain ::
           (AudioEffectCompressor :< cls, Object :< cls) =>
           cls -> Float -> IO ()
set_gain cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_gain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_mix #-}

-- | Balance between original signal and effect signal. Value can range from 0 (totally dry) to 1 (totally wet). Default value: [code]1[/code].
bindAudioEffectCompressor_set_mix :: MethodBind
bindAudioEffectCompressor_set_mix
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_mix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Balance between original signal and effect signal. Value can range from 0 (totally dry) to 1 (totally wet). Default value: [code]1[/code].
set_mix ::
          (AudioEffectCompressor :< cls, Object :< cls) =>
          cls -> Float -> IO ()
set_mix cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_mix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_ratio #-}

-- | Amount of compression applied to the audio once it passes the threshold level. The higher the ratio the more the loud parts of the audio will be compressed. Value can range from 1 to 48. Default value: [code]4[/code].
bindAudioEffectCompressor_set_ratio :: MethodBind
bindAudioEffectCompressor_set_ratio
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of compression applied to the audio once it passes the threshold level. The higher the ratio the more the loud parts of the audio will be compressed. Value can range from 1 to 48. Default value: [code]4[/code].
set_ratio ::
            (AudioEffectCompressor :< cls, Object :< cls) =>
            cls -> Float -> IO ()
set_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_release_ms #-}

-- | Compressor's delay time to stop reducing the signal after the signal level falls below the threshold. Value can range from 20 to 2000. Default value: [code]250ms[/code].
bindAudioEffectCompressor_set_release_ms :: MethodBind
bindAudioEffectCompressor_set_release_ms
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_release_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Compressor's delay time to stop reducing the signal after the signal level falls below the threshold. Value can range from 20 to 2000. Default value: [code]250ms[/code].
set_release_ms ::
                 (AudioEffectCompressor :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_release_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_release_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_sidechain #-}

-- | Reduce the sound level using another audio bus for threshold detection.
bindAudioEffectCompressor_set_sidechain :: MethodBind
bindAudioEffectCompressor_set_sidechain
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_sidechain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reduce the sound level using another audio bus for threshold detection.
set_sidechain ::
                (AudioEffectCompressor :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_sidechain cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_sidechain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectCompressor_set_threshold #-}

-- | The level above which compression is applied to the audio. Value can range from -60 to 0. Default value: [code]0[/code].
bindAudioEffectCompressor_set_threshold :: MethodBind
bindAudioEffectCompressor_set_threshold
  = unsafePerformIO $
      withCString "AudioEffectCompressor" $
        \ clsNamePtr ->
          withCString "set_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The level above which compression is applied to the audio. Value can range from -60 to 0. Default value: [code]0[/code].
set_threshold ::
                (AudioEffectCompressor :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_threshold cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectCompressor_set_threshold
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)