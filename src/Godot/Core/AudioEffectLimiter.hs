{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectLimiter
       (Godot.Core.AudioEffectLimiter.set_ceiling_db,
        Godot.Core.AudioEffectLimiter.get_ceiling_db,
        Godot.Core.AudioEffectLimiter.set_threshold_db,
        Godot.Core.AudioEffectLimiter.get_threshold_db,
        Godot.Core.AudioEffectLimiter.set_soft_clip_db,
        Godot.Core.AudioEffectLimiter.get_soft_clip_db,
        Godot.Core.AudioEffectLimiter.set_soft_clip_ratio,
        Godot.Core.AudioEffectLimiter.get_soft_clip_ratio)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioEffectLimiter_set_ceiling_db #-}

-- | The waveform's maximum allowed value. Value can range from -20 to -0.1. Default value: [code]-0.1dB[/code].
bindAudioEffectLimiter_set_ceiling_db :: MethodBind
bindAudioEffectLimiter_set_ceiling_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_ceiling_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The waveform's maximum allowed value. Value can range from -20 to -0.1. Default value: [code]-0.1dB[/code].
set_ceiling_db ::
                 (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_ceiling_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_ceiling_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_get_ceiling_db #-}

-- | The waveform's maximum allowed value. Value can range from -20 to -0.1. Default value: [code]-0.1dB[/code].
bindAudioEffectLimiter_get_ceiling_db :: MethodBind
bindAudioEffectLimiter_get_ceiling_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_ceiling_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The waveform's maximum allowed value. Value can range from -20 to -0.1. Default value: [code]-0.1dB[/code].
get_ceiling_db ::
                 (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_ceiling_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_ceiling_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_set_threshold_db #-}

-- | Threshold from which the limiter begins to be active. Value can range from -30 to 0. Default value: [code]0dB[/code].
bindAudioEffectLimiter_set_threshold_db :: MethodBind
bindAudioEffectLimiter_set_threshold_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_threshold_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold from which the limiter begins to be active. Value can range from -30 to 0. Default value: [code]0dB[/code].
set_threshold_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_threshold_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_threshold_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_get_threshold_db #-}

-- | Threshold from which the limiter begins to be active. Value can range from -30 to 0. Default value: [code]0dB[/code].
bindAudioEffectLimiter_get_threshold_db :: MethodBind
bindAudioEffectLimiter_get_threshold_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_threshold_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold from which the limiter begins to be active. Value can range from -30 to 0. Default value: [code]0dB[/code].
get_threshold_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_threshold_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_threshold_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_set_soft_clip_db #-}

-- | Applies a gain to the limited waves. Value can range from 0 to 6. Default value: [code]2dB[/code].
bindAudioEffectLimiter_set_soft_clip_db :: MethodBind
bindAudioEffectLimiter_set_soft_clip_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_soft_clip_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a gain to the limited waves. Value can range from 0 to 6. Default value: [code]2dB[/code].
set_soft_clip_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_soft_clip_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_soft_clip_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_get_soft_clip_db #-}

-- | Applies a gain to the limited waves. Value can range from 0 to 6. Default value: [code]2dB[/code].
bindAudioEffectLimiter_get_soft_clip_db :: MethodBind
bindAudioEffectLimiter_get_soft_clip_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_soft_clip_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a gain to the limited waves. Value can range from 0 to 6. Default value: [code]2dB[/code].
get_soft_clip_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_soft_clip_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_soft_clip_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_set_soft_clip_ratio #-}

bindAudioEffectLimiter_set_soft_clip_ratio :: MethodBind
bindAudioEffectLimiter_set_soft_clip_ratio
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_soft_clip_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_soft_clip_ratio ::
                      (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_soft_clip_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_soft_clip_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectLimiter_get_soft_clip_ratio #-}

bindAudioEffectLimiter_get_soft_clip_ratio :: MethodBind
bindAudioEffectLimiter_get_soft_clip_ratio
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_soft_clip_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_soft_clip_ratio ::
                      (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_soft_clip_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_soft_clip_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)