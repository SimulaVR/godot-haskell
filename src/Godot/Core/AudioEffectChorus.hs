{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectChorus
       (Godot.Core.AudioEffectChorus.get_dry,
        Godot.Core.AudioEffectChorus.get_voice_count,
        Godot.Core.AudioEffectChorus.get_voice_cutoff_hz,
        Godot.Core.AudioEffectChorus.get_voice_delay_ms,
        Godot.Core.AudioEffectChorus.get_voice_depth_ms,
        Godot.Core.AudioEffectChorus.get_voice_level_db,
        Godot.Core.AudioEffectChorus.get_voice_pan,
        Godot.Core.AudioEffectChorus.get_voice_rate_hz,
        Godot.Core.AudioEffectChorus.get_wet,
        Godot.Core.AudioEffectChorus.set_dry,
        Godot.Core.AudioEffectChorus.set_voice_count,
        Godot.Core.AudioEffectChorus.set_voice_cutoff_hz,
        Godot.Core.AudioEffectChorus.set_voice_delay_ms,
        Godot.Core.AudioEffectChorus.set_voice_depth_ms,
        Godot.Core.AudioEffectChorus.set_voice_level_db,
        Godot.Core.AudioEffectChorus.set_voice_pan,
        Godot.Core.AudioEffectChorus.set_voice_rate_hz,
        Godot.Core.AudioEffectChorus.set_wet)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioEffectChorus_get_dry #-}

-- | The effect's raw signal.
bindAudioEffectChorus_get_dry :: MethodBind
bindAudioEffectChorus_get_dry
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's raw signal.
get_dry ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> IO Float
get_dry cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_count #-}

-- | The amount of voices in the effect.
bindAudioEffectChorus_get_voice_count :: MethodBind
bindAudioEffectChorus_get_voice_count
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of voices in the effect.
get_voice_count ::
                  (AudioEffectChorus :< cls, Object :< cls) => cls -> IO Int
get_voice_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_cutoff_hz #-}

-- | The voice's cutoff frequency.
bindAudioEffectChorus_get_voice_cutoff_hz :: MethodBind
bindAudioEffectChorus_get_voice_cutoff_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_cutoff_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's cutoff frequency.
get_voice_cutoff_hz ::
                      (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_cutoff_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_cutoff_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_delay_ms #-}

-- | The voice's signal delay.
bindAudioEffectChorus_get_voice_delay_ms :: MethodBind
bindAudioEffectChorus_get_voice_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's signal delay.
get_voice_delay_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_depth_ms #-}

-- | The voice filter's depth.
bindAudioEffectChorus_get_voice_depth_ms :: MethodBind
bindAudioEffectChorus_get_voice_depth_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_depth_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice filter's depth.
get_voice_depth_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_depth_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_depth_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_level_db #-}

-- | The voice's volume.
bindAudioEffectChorus_get_voice_level_db :: MethodBind
bindAudioEffectChorus_get_voice_level_db
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's volume.
get_voice_level_db ::
                     (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_pan #-}

-- | The voice's pan level.
bindAudioEffectChorus_get_voice_pan :: MethodBind
bindAudioEffectChorus_get_voice_pan
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's pan level.
get_voice_pan ::
                (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_voice_rate_hz #-}

-- | The voice's filter rate.
bindAudioEffectChorus_get_voice_rate_hz :: MethodBind
bindAudioEffectChorus_get_voice_rate_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_rate_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's filter rate.
get_voice_rate_hz ::
                    (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_rate_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_rate_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_get_wet #-}

-- | The effect's processed signal.
bindAudioEffectChorus_get_wet :: MethodBind
bindAudioEffectChorus_get_wet
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_wet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's processed signal.
get_wet ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> IO Float
get_wet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_wet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_dry #-}

-- | The effect's raw signal.
bindAudioEffectChorus_set_dry :: MethodBind
bindAudioEffectChorus_set_dry
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's raw signal.
set_dry ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> Float -> IO ()
set_dry cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_count #-}

-- | The amount of voices in the effect.
bindAudioEffectChorus_set_voice_count :: MethodBind
bindAudioEffectChorus_set_voice_count
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of voices in the effect.
set_voice_count ::
                  (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO ()
set_voice_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_cutoff_hz #-}

-- | The voice's cutoff frequency.
bindAudioEffectChorus_set_voice_cutoff_hz :: MethodBind
bindAudioEffectChorus_set_voice_cutoff_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_cutoff_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's cutoff frequency.
set_voice_cutoff_hz ::
                      (AudioEffectChorus :< cls, Object :< cls) =>
                      cls -> Int -> Float -> IO ()
set_voice_cutoff_hz cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_cutoff_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_delay_ms #-}

-- | The voice's signal delay.
bindAudioEffectChorus_set_voice_delay_ms :: MethodBind
bindAudioEffectChorus_set_voice_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's signal delay.
set_voice_delay_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) =>
                     cls -> Int -> Float -> IO ()
set_voice_delay_ms cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_depth_ms #-}

-- | The voice filter's depth.
bindAudioEffectChorus_set_voice_depth_ms :: MethodBind
bindAudioEffectChorus_set_voice_depth_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_depth_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice filter's depth.
set_voice_depth_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) =>
                     cls -> Int -> Float -> IO ()
set_voice_depth_ms cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_depth_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_level_db #-}

-- | The voice's volume.
bindAudioEffectChorus_set_voice_level_db :: MethodBind
bindAudioEffectChorus_set_voice_level_db
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's volume.
set_voice_level_db ::
                     (AudioEffectChorus :< cls, Object :< cls) =>
                     cls -> Int -> Float -> IO ()
set_voice_level_db cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_pan #-}

-- | The voice's pan level.
bindAudioEffectChorus_set_voice_pan :: MethodBind
bindAudioEffectChorus_set_voice_pan
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's pan level.
set_voice_pan ::
                (AudioEffectChorus :< cls, Object :< cls) =>
                cls -> Int -> Float -> IO ()
set_voice_pan cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_voice_rate_hz #-}

-- | The voice's filter rate.
bindAudioEffectChorus_set_voice_rate_hz :: MethodBind
bindAudioEffectChorus_set_voice_rate_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_rate_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's filter rate.
set_voice_rate_hz ::
                    (AudioEffectChorus :< cls, Object :< cls) =>
                    cls -> Int -> Float -> IO ()
set_voice_rate_hz cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_rate_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectChorus_set_wet #-}

-- | The effect's processed signal.
bindAudioEffectChorus_set_wet :: MethodBind
bindAudioEffectChorus_set_wet
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_wet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's processed signal.
set_wet ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> Float -> IO ()
set_wet cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_wet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)