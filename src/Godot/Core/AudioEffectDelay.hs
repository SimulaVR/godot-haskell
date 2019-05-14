{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectDelay
       (Godot.Core.AudioEffectDelay.set_dry,
        Godot.Core.AudioEffectDelay.get_dry,
        Godot.Core.AudioEffectDelay.set_tap1_active,
        Godot.Core.AudioEffectDelay.is_tap1_active,
        Godot.Core.AudioEffectDelay.set_tap1_delay_ms,
        Godot.Core.AudioEffectDelay.get_tap1_delay_ms,
        Godot.Core.AudioEffectDelay.set_tap1_level_db,
        Godot.Core.AudioEffectDelay.get_tap1_level_db,
        Godot.Core.AudioEffectDelay.set_tap1_pan,
        Godot.Core.AudioEffectDelay.get_tap1_pan,
        Godot.Core.AudioEffectDelay.set_tap2_active,
        Godot.Core.AudioEffectDelay.is_tap2_active,
        Godot.Core.AudioEffectDelay.set_tap2_delay_ms,
        Godot.Core.AudioEffectDelay.get_tap2_delay_ms,
        Godot.Core.AudioEffectDelay.set_tap2_level_db,
        Godot.Core.AudioEffectDelay.get_tap2_level_db,
        Godot.Core.AudioEffectDelay.set_tap2_pan,
        Godot.Core.AudioEffectDelay.get_tap2_pan,
        Godot.Core.AudioEffectDelay.set_feedback_active,
        Godot.Core.AudioEffectDelay.is_feedback_active,
        Godot.Core.AudioEffectDelay.set_feedback_delay_ms,
        Godot.Core.AudioEffectDelay.get_feedback_delay_ms,
        Godot.Core.AudioEffectDelay.set_feedback_level_db,
        Godot.Core.AudioEffectDelay.get_feedback_level_db,
        Godot.Core.AudioEffectDelay.set_feedback_lowpass,
        Godot.Core.AudioEffectDelay.get_feedback_lowpass)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioEffectDelay_set_dry #-}

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1. Default value: [code]1[/code].
bindAudioEffectDelay_set_dry :: MethodBind
bindAudioEffectDelay_set_dry
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1. Default value: [code]1[/code].
set_dry ::
          (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_dry cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_dry #-}

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1. Default value: [code]1[/code].
bindAudioEffectDelay_get_dry :: MethodBind
bindAudioEffectDelay_get_dry
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1. Default value: [code]1[/code].
get_dry ::
          (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_dry cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap1_active #-}

-- | If [code]true[/code], [code]tap1[/code] will be enabled. Default value: [code]true[/code].
bindAudioEffectDelay_set_tap1_active :: MethodBind
bindAudioEffectDelay_set_tap1_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [code]tap1[/code] will be enabled. Default value: [code]true[/code].
set_tap1_active ::
                  (AudioEffectDelay :< cls, Object :< cls) => cls -> Bool -> IO ()
set_tap1_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_is_tap1_active #-}

-- | If [code]true[/code], [code]tap1[/code] will be enabled. Default value: [code]true[/code].
bindAudioEffectDelay_is_tap1_active :: MethodBind
bindAudioEffectDelay_is_tap1_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "is_tap1_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [code]tap1[/code] will be enabled. Default value: [code]true[/code].
is_tap1_active ::
                 (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Bool
is_tap1_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_is_tap1_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap1_delay_ms #-}

-- | [b]Tap1[/b] delay time in milliseconds. Default value: [code]250ms[/code].
bindAudioEffectDelay_set_tap1_delay_ms :: MethodBind
bindAudioEffectDelay_set_tap1_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [b]Tap1[/b] delay time in milliseconds. Default value: [code]250ms[/code].
set_tap1_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap1_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_tap1_delay_ms #-}

-- | [b]Tap1[/b] delay time in milliseconds. Default value: [code]250ms[/code].
bindAudioEffectDelay_get_tap1_delay_ms :: MethodBind
bindAudioEffectDelay_get_tap1_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap1_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [b]Tap1[/b] delay time in milliseconds. Default value: [code]250ms[/code].
get_tap1_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap1_delay_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap1_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap1_level_db #-}

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
bindAudioEffectDelay_set_tap1_level_db :: MethodBind
bindAudioEffectDelay_set_tap1_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
set_tap1_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap1_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_tap1_level_db #-}

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
bindAudioEffectDelay_get_tap1_level_db :: MethodBind
bindAudioEffectDelay_get_tap1_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap1_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
get_tap1_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap1_level_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap1_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap1_pan #-}

-- | Pan position for [code]tap1[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]0.2[/code].
bindAudioEffectDelay_set_tap1_pan :: MethodBind
bindAudioEffectDelay_set_tap1_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for [code]tap1[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]0.2[/code].
set_tap1_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap1_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_tap1_pan #-}

-- | Pan position for [code]tap1[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]0.2[/code].
bindAudioEffectDelay_get_tap1_pan :: MethodBind
bindAudioEffectDelay_get_tap1_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap1_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for [code]tap1[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]0.2[/code].
get_tap1_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap1_pan cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap1_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap2_active #-}

-- | If [code]true[/code], [code]tap2[/code] will be enabled. Default value: [code]true[/code].
bindAudioEffectDelay_set_tap2_active :: MethodBind
bindAudioEffectDelay_set_tap2_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [code]tap2[/code] will be enabled. Default value: [code]true[/code].
set_tap2_active ::
                  (AudioEffectDelay :< cls, Object :< cls) => cls -> Bool -> IO ()
set_tap2_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_is_tap2_active #-}

-- | If [code]true[/code], [code]tap2[/code] will be enabled. Default value: [code]true[/code].
bindAudioEffectDelay_is_tap2_active :: MethodBind
bindAudioEffectDelay_is_tap2_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "is_tap2_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [code]tap2[/code] will be enabled. Default value: [code]true[/code].
is_tap2_active ::
                 (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Bool
is_tap2_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_is_tap2_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap2_delay_ms #-}

-- | [b]Tap2[/b] delay time in milliseconds. Default value: [code]500ms[/code].
bindAudioEffectDelay_set_tap2_delay_ms :: MethodBind
bindAudioEffectDelay_set_tap2_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [b]Tap2[/b] delay time in milliseconds. Default value: [code]500ms[/code].
set_tap2_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap2_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_tap2_delay_ms #-}

-- | [b]Tap2[/b] delay time in milliseconds. Default value: [code]500ms[/code].
bindAudioEffectDelay_get_tap2_delay_ms :: MethodBind
bindAudioEffectDelay_get_tap2_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap2_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [b]Tap2[/b] delay time in milliseconds. Default value: [code]500ms[/code].
get_tap2_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap2_delay_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap2_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap2_level_db #-}

-- | Sound level for [code]tap2[/code]. Default value: [code]-12 dB[/code].
bindAudioEffectDelay_set_tap2_level_db :: MethodBind
bindAudioEffectDelay_set_tap2_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for [code]tap2[/code]. Default value: [code]-12 dB[/code].
set_tap2_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap2_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_tap2_level_db #-}

-- | Sound level for [code]tap2[/code]. Default value: [code]-12 dB[/code].
bindAudioEffectDelay_get_tap2_level_db :: MethodBind
bindAudioEffectDelay_get_tap2_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap2_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for [code]tap2[/code]. Default value: [code]-12 dB[/code].
get_tap2_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap2_level_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap2_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_tap2_pan #-}

-- | Pan position for [code]tap2[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]-0.4[/code].
bindAudioEffectDelay_set_tap2_pan :: MethodBind
bindAudioEffectDelay_set_tap2_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for [code]tap2[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]-0.4[/code].
set_tap2_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap2_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_tap2_pan #-}

-- | Pan position for [code]tap2[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]-0.4[/code].
bindAudioEffectDelay_get_tap2_pan :: MethodBind
bindAudioEffectDelay_get_tap2_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap2_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for [code]tap2[/code]. Value can range from -1 (fully left) to 1 (fully right). Default value: [code]-0.4[/code].
get_tap2_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap2_pan cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap2_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_feedback_active #-}

-- | If [code]true[/code], feedback is enabled. Default value: [code]false[/code].
bindAudioEffectDelay_set_feedback_active :: MethodBind
bindAudioEffectDelay_set_feedback_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], feedback is enabled. Default value: [code]false[/code].
set_feedback_active ::
                      (AudioEffectDelay :< cls, Object :< cls) => cls -> Bool -> IO ()
set_feedback_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_is_feedback_active #-}

-- | If [code]true[/code], feedback is enabled. Default value: [code]false[/code].
bindAudioEffectDelay_is_feedback_active :: MethodBind
bindAudioEffectDelay_is_feedback_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "is_feedback_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], feedback is enabled. Default value: [code]false[/code].
is_feedback_active ::
                     (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Bool
is_feedback_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_is_feedback_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_feedback_delay_ms #-}

-- | Feedback delay time in milliseconds. Default value: [code]340[/code].
bindAudioEffectDelay_set_feedback_delay_ms :: MethodBind
bindAudioEffectDelay_set_feedback_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Feedback delay time in milliseconds. Default value: [code]340[/code].
set_feedback_delay_ms ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_feedback_delay_ms #-}

-- | Feedback delay time in milliseconds. Default value: [code]340[/code].
bindAudioEffectDelay_get_feedback_delay_ms :: MethodBind
bindAudioEffectDelay_get_feedback_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_feedback_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Feedback delay time in milliseconds. Default value: [code]340[/code].
get_feedback_delay_ms ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_feedback_delay_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_feedback_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_feedback_level_db #-}

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
bindAudioEffectDelay_set_feedback_level_db :: MethodBind
bindAudioEffectDelay_set_feedback_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
set_feedback_level_db ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_feedback_level_db #-}

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
bindAudioEffectDelay_get_feedback_level_db :: MethodBind
bindAudioEffectDelay_get_feedback_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_feedback_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for [code]tap1[/code]. Default value: [code]-6 dB[/code].
get_feedback_level_db ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_feedback_level_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_feedback_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_set_feedback_lowpass #-}

-- | Low-pass filter for feedback. Frequencies below the Low Cut value are filtered out of the source signal. Default value: [code]16000[/code].
bindAudioEffectDelay_set_feedback_lowpass :: MethodBind
bindAudioEffectDelay_set_feedback_lowpass
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_lowpass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Low-pass filter for feedback. Frequencies below the Low Cut value are filtered out of the source signal. Default value: [code]16000[/code].
set_feedback_lowpass ::
                       (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback_lowpass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_lowpass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectDelay_get_feedback_lowpass #-}

-- | Low-pass filter for feedback. Frequencies below the Low Cut value are filtered out of the source signal. Default value: [code]16000[/code].
bindAudioEffectDelay_get_feedback_lowpass :: MethodBind
bindAudioEffectDelay_get_feedback_lowpass
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_feedback_lowpass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Low-pass filter for feedback. Frequencies below the Low Cut value are filtered out of the source signal. Default value: [code]16000[/code].
get_feedback_lowpass ::
                       (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_feedback_lowpass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_feedback_lowpass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)