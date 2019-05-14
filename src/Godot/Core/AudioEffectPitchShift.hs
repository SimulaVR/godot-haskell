{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectPitchShift
       (Godot.Core.AudioEffectPitchShift.set_pitch_scale,
        Godot.Core.AudioEffectPitchShift.get_pitch_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioEffectPitchShift_set_pitch_scale #-}

-- | Pitch value. Can range from 0 (-1 octave) to 16 (+16 octaves).
bindAudioEffectPitchShift_set_pitch_scale :: MethodBind
bindAudioEffectPitchShift_set_pitch_scale
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "set_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pitch value. Can range from 0 (-1 octave) to 16 (+16 octaves).
set_pitch_scale ::
                  (AudioEffectPitchShift :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_pitch_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPitchShift_set_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAudioEffectPitchShift_get_pitch_scale #-}

-- | Pitch value. Can range from 0 (-1 octave) to 16 (+16 octaves).
bindAudioEffectPitchShift_get_pitch_scale :: MethodBind
bindAudioEffectPitchShift_get_pitch_scale
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "get_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pitch value. Can range from 0 (-1 octave) to 16 (+16 octaves).
get_pitch_scale ::
                  (AudioEffectPitchShift :< cls, Object :< cls) => cls -> IO Float
get_pitch_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPitchShift_get_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)