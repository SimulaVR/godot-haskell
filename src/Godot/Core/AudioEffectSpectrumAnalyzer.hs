{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectSpectrumAnalyzer
       (Godot.Core.AudioEffectSpectrumAnalyzer._FFT_SIZE_2048,
        Godot.Core.AudioEffectSpectrumAnalyzer._FFT_SIZE_4096,
        Godot.Core.AudioEffectSpectrumAnalyzer._FFT_SIZE_MAX,
        Godot.Core.AudioEffectSpectrumAnalyzer._FFT_SIZE_512,
        Godot.Core.AudioEffectSpectrumAnalyzer._FFT_SIZE_256,
        Godot.Core.AudioEffectSpectrumAnalyzer._FFT_SIZE_1024,
        Godot.Core.AudioEffectSpectrumAnalyzer.get_buffer_length,
        Godot.Core.AudioEffectSpectrumAnalyzer.get_fft_size,
        Godot.Core.AudioEffectSpectrumAnalyzer.get_tap_back_pos,
        Godot.Core.AudioEffectSpectrumAnalyzer.set_buffer_length,
        Godot.Core.AudioEffectSpectrumAnalyzer.set_fft_size,
        Godot.Core.AudioEffectSpectrumAnalyzer.set_tap_back_pos)
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

instance NodeProperty AudioEffectSpectrumAnalyzer "buffer_length"
           Float
           'False
         where
        nodeProperty
          = (get_buffer_length, wrapDroppingSetter set_buffer_length,
             Nothing)

instance NodeProperty AudioEffectSpectrumAnalyzer "fft_size" Int
           'False
         where
        nodeProperty
          = (get_fft_size, wrapDroppingSetter set_fft_size, Nothing)

instance NodeProperty AudioEffectSpectrumAnalyzer "tap_back_pos"
           Float
           'False
         where
        nodeProperty
          = (get_tap_back_pos, wrapDroppingSetter set_tap_back_pos, Nothing)

{-# NOINLINE bindAudioEffectSpectrumAnalyzer_get_buffer_length #-}

-- | The length of the buffer to keep (in seconds). Higher values keep data around for longer, but require more memory.
bindAudioEffectSpectrumAnalyzer_get_buffer_length :: MethodBind
bindAudioEffectSpectrumAnalyzer_get_buffer_length
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzer" $
        \ clsNamePtr ->
          withCString "get_buffer_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the buffer to keep (in seconds). Higher values keep data around for longer, but require more memory.
get_buffer_length ::
                    (AudioEffectSpectrumAnalyzer :< cls, Object :< cls) =>
                    cls -> IO Float
get_buffer_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectSpectrumAnalyzer_get_buffer_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzer "get_buffer_length"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AudioEffectSpectrumAnalyzer.get_buffer_length

{-# NOINLINE bindAudioEffectSpectrumAnalyzer_get_fft_size #-}

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the spectrum analysis over time, but have greater latency. The effects of this higher latency are especially noticeable with sudden amplitude changes.
bindAudioEffectSpectrumAnalyzer_get_fft_size :: MethodBind
bindAudioEffectSpectrumAnalyzer_get_fft_size
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzer" $
        \ clsNamePtr ->
          withCString "get_fft_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the spectrum analysis over time, but have greater latency. The effects of this higher latency are especially noticeable with sudden amplitude changes.
get_fft_size ::
               (AudioEffectSpectrumAnalyzer :< cls, Object :< cls) =>
               cls -> IO Int
get_fft_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectSpectrumAnalyzer_get_fft_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzer "get_fft_size" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioEffectSpectrumAnalyzer.get_fft_size

{-# NOINLINE bindAudioEffectSpectrumAnalyzer_get_tap_back_pos #-}

bindAudioEffectSpectrumAnalyzer_get_tap_back_pos :: MethodBind
bindAudioEffectSpectrumAnalyzer_get_tap_back_pos
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzer" $
        \ clsNamePtr ->
          withCString "get_tap_back_pos" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tap_back_pos ::
                   (AudioEffectSpectrumAnalyzer :< cls, Object :< cls) =>
                   cls -> IO Float
get_tap_back_pos cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectSpectrumAnalyzer_get_tap_back_pos
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzer "get_tap_back_pos"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AudioEffectSpectrumAnalyzer.get_tap_back_pos

{-# NOINLINE bindAudioEffectSpectrumAnalyzer_set_buffer_length #-}

-- | The length of the buffer to keep (in seconds). Higher values keep data around for longer, but require more memory.
bindAudioEffectSpectrumAnalyzer_set_buffer_length :: MethodBind
bindAudioEffectSpectrumAnalyzer_set_buffer_length
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzer" $
        \ clsNamePtr ->
          withCString "set_buffer_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the buffer to keep (in seconds). Higher values keep data around for longer, but require more memory.
set_buffer_length ::
                    (AudioEffectSpectrumAnalyzer :< cls, Object :< cls) =>
                    cls -> Float -> IO ()
set_buffer_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectSpectrumAnalyzer_set_buffer_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzer "set_buffer_length"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AudioEffectSpectrumAnalyzer.set_buffer_length

{-# NOINLINE bindAudioEffectSpectrumAnalyzer_set_fft_size #-}

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the spectrum analysis over time, but have greater latency. The effects of this higher latency are especially noticeable with sudden amplitude changes.
bindAudioEffectSpectrumAnalyzer_set_fft_size :: MethodBind
bindAudioEffectSpectrumAnalyzer_set_fft_size
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzer" $
        \ clsNamePtr ->
          withCString "set_fft_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the @url=https://en.wikipedia.org/wiki/Fast_Fourier_transform@Fast Fourier transform@/url@ buffer. Higher values smooth out the spectrum analysis over time, but have greater latency. The effects of this higher latency are especially noticeable with sudden amplitude changes.
set_fft_size ::
               (AudioEffectSpectrumAnalyzer :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_fft_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectSpectrumAnalyzer_set_fft_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzer "set_fft_size"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectSpectrumAnalyzer.set_fft_size

{-# NOINLINE bindAudioEffectSpectrumAnalyzer_set_tap_back_pos #-}

bindAudioEffectSpectrumAnalyzer_set_tap_back_pos :: MethodBind
bindAudioEffectSpectrumAnalyzer_set_tap_back_pos
  = unsafePerformIO $
      withCString "AudioEffectSpectrumAnalyzer" $
        \ clsNamePtr ->
          withCString "set_tap_back_pos" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tap_back_pos ::
                   (AudioEffectSpectrumAnalyzer :< cls, Object :< cls) =>
                   cls -> Float -> IO ()
set_tap_back_pos cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectSpectrumAnalyzer_set_tap_back_pos
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectSpectrumAnalyzer "set_tap_back_pos"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AudioEffectSpectrumAnalyzer.set_tap_back_pos