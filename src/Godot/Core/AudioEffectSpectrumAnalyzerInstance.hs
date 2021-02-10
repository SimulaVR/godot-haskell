{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectSpectrumAnalyzerInstance
       (Godot.Core.AudioEffectSpectrumAnalyzerInstance._MAGNITUDE_MAX,
        Godot.Core.AudioEffectSpectrumAnalyzerInstance._MAGNITUDE_AVERAGE,
        Godot.Core.AudioEffectSpectrumAnalyzerInstance.get_magnitude_for_frequency_range)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MAGNITUDE_MAX :: Int
_MAGNITUDE_MAX = 1

_MAGNITUDE_AVERAGE :: Int
_MAGNITUDE_AVERAGE = 0

{-# NOINLINE bindAudioEffectSpectrumAnalyzerInstance_get_magnitude_for_frequency_range
             #-}

bindAudioEffectSpectrumAnalyzerInstance_get_magnitude_for_frequency_range ::
                                                                          MethodBind
bindAudioEffectSpectrumAnalyzerInstance_get_magnitude_for_frequency_range
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzerInstance" $
        \ clsNamePtr ->
          withCString "get_magnitude_for_frequency_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_magnitude_for_frequency_range ::
                                    (AudioEffectSpectrumAnalyzerInstance :< cls, Object :< cls) =>
                                    cls -> Float -> Float -> Int -> IO Vector2
get_magnitude_for_frequency_range cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectSpectrumAnalyzerInstance_get_magnitude_for_frequency_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)