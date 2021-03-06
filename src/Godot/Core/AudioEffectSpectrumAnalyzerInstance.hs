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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.AudioEffectInstance()

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
                                    cls -> Float -> Float -> Maybe Int -> IO Vector2
get_magnitude_for_frequency_range cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectSpectrumAnalyzerInstance_get_magnitude_for_frequency_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzerInstance
           "get_magnitude_for_frequency_range"
           '[Float, Float, Maybe Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.AudioEffectSpectrumAnalyzerInstance.get_magnitude_for_frequency_range