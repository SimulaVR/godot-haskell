{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectPitchShift
       (Godot.Core.AudioEffectPitchShift._FFT_SIZE_2048,
        Godot.Core.AudioEffectPitchShift._FFT_SIZE_4096,
        Godot.Core.AudioEffectPitchShift._FFT_SIZE_MAX,
        Godot.Core.AudioEffectPitchShift._FFT_SIZE_512,
        Godot.Core.AudioEffectPitchShift._FFT_SIZE_256,
        Godot.Core.AudioEffectPitchShift._FFT_SIZE_1024,
        Godot.Core.AudioEffectPitchShift.get_fft_size,
        Godot.Core.AudioEffectPitchShift.get_oversampling,
        Godot.Core.AudioEffectPitchShift.get_pitch_scale,
        Godot.Core.AudioEffectPitchShift.set_fft_size,
        Godot.Core.AudioEffectPitchShift.set_oversampling,
        Godot.Core.AudioEffectPitchShift.set_pitch_scale)
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
import Godot.Core.AudioEffect()

_FFT_SIZE_2048 :: Int
_FFT_SIZE_2048 = 3

_FFT_SIZE_4096 :: Int
_FFT_SIZE_4096 = 4

_FFT_SIZE_MAX :: Int
_FFT_SIZE_MAX = 5

_FFT_SIZE_512 :: Int
_FFT_SIZE_512 = 1

_FFT_SIZE_256 :: Int
_FFT_SIZE_256 = 0

_FFT_SIZE_1024 :: Int
_FFT_SIZE_1024 = 2

instance NodeProperty AudioEffectPitchShift "fft_size" Int 'False
         where
        nodeProperty
          = (get_fft_size, wrapDroppingSetter set_fft_size, Nothing)

instance NodeProperty AudioEffectPitchShift "oversampling" Int
           'False
         where
        nodeProperty
          = (get_oversampling, wrapDroppingSetter set_oversampling, Nothing)

instance NodeProperty AudioEffectPitchShift "pitch_scale" Float
           'False
         where
        nodeProperty
          = (get_pitch_scale, wrapDroppingSetter set_pitch_scale, Nothing)

{-# NOINLINE bindAudioEffectPitchShift_get_fft_size #-}

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the effect over time, but have greater latency. The effects of this higher latency are especially noticeable on sounds that have sudden amplitude changes.
bindAudioEffectPitchShift_get_fft_size :: MethodBind
bindAudioEffectPitchShift_get_fft_size
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "get_fft_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the effect over time, but have greater latency. The effects of this higher latency are especially noticeable on sounds that have sudden amplitude changes.
get_fft_size ::
               (AudioEffectPitchShift :< cls, Object :< cls) => cls -> IO Int
get_fft_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPitchShift_get_fft_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPitchShift "get_fft_size" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioEffectPitchShift.get_fft_size

{-# NOINLINE bindAudioEffectPitchShift_get_oversampling #-}

-- | The oversampling factor to use. Higher values result in better quality, but are more demanding on the CPU and may cause audio cracking if the CPU can't keep up.
bindAudioEffectPitchShift_get_oversampling :: MethodBind
bindAudioEffectPitchShift_get_oversampling
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "get_oversampling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The oversampling factor to use. Higher values result in better quality, but are more demanding on the CPU and may cause audio cracking if the CPU can't keep up.
get_oversampling ::
                   (AudioEffectPitchShift :< cls, Object :< cls) => cls -> IO Int
get_oversampling cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPitchShift_get_oversampling
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPitchShift "get_oversampling" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioEffectPitchShift.get_oversampling

{-# NOINLINE bindAudioEffectPitchShift_get_pitch_scale #-}

-- | The pitch scale to use. @1.0@ is the default pitch and plays sounds unaltered. @pitch_scale@ can range from @0.0@ (infinitely low pitch, inaudible) to @16@ (16 times higher than the initial pitch).
bindAudioEffectPitchShift_get_pitch_scale :: MethodBind
bindAudioEffectPitchShift_get_pitch_scale
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "get_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The pitch scale to use. @1.0@ is the default pitch and plays sounds unaltered. @pitch_scale@ can range from @0.0@ (infinitely low pitch, inaudible) to @16@ (16 times higher than the initial pitch).
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

instance NodeMethod AudioEffectPitchShift "get_pitch_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPitchShift.get_pitch_scale

{-# NOINLINE bindAudioEffectPitchShift_set_fft_size #-}

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the effect over time, but have greater latency. The effects of this higher latency are especially noticeable on sounds that have sudden amplitude changes.
bindAudioEffectPitchShift_set_fft_size :: MethodBind
bindAudioEffectPitchShift_set_fft_size
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "set_fft_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the effect over time, but have greater latency. The effects of this higher latency are especially noticeable on sounds that have sudden amplitude changes.
set_fft_size ::
               (AudioEffectPitchShift :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_fft_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPitchShift_set_fft_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPitchShift "set_fft_size" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPitchShift.set_fft_size

{-# NOINLINE bindAudioEffectPitchShift_set_oversampling #-}

-- | The oversampling factor to use. Higher values result in better quality, but are more demanding on the CPU and may cause audio cracking if the CPU can't keep up.
bindAudioEffectPitchShift_set_oversampling :: MethodBind
bindAudioEffectPitchShift_set_oversampling
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "set_oversampling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The oversampling factor to use. Higher values result in better quality, but are more demanding on the CPU and may cause audio cracking if the CPU can't keep up.
set_oversampling ::
                   (AudioEffectPitchShift :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_oversampling cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPitchShift_set_oversampling
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPitchShift "set_oversampling" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPitchShift.set_oversampling

{-# NOINLINE bindAudioEffectPitchShift_set_pitch_scale #-}

-- | The pitch scale to use. @1.0@ is the default pitch and plays sounds unaltered. @pitch_scale@ can range from @0.0@ (infinitely low pitch, inaudible) to @16@ (16 times higher than the initial pitch).
bindAudioEffectPitchShift_set_pitch_scale :: MethodBind
bindAudioEffectPitchShift_set_pitch_scale
  = unsafePerformIO $
      withCString "AudioEffectPitchShift" $
        \ clsNamePtr ->
          withCString "set_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The pitch scale to use. @1.0@ is the default pitch and plays sounds unaltered. @pitch_scale@ can range from @0.0@ (infinitely low pitch, inaudible) to @16@ (16 times higher than the initial pitch).
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

instance NodeMethod AudioEffectPitchShift "set_pitch_scale"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPitchShift.set_pitch_scale