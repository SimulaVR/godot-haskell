{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamGenerator
       (Godot.Core.AudioStreamGenerator.get_buffer_length,
        Godot.Core.AudioStreamGenerator.get_mix_rate,
        Godot.Core.AudioStreamGenerator.set_buffer_length,
        Godot.Core.AudioStreamGenerator.set_mix_rate)
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
import Godot.Core.AudioStream()

instance NodeProperty AudioStreamGenerator "buffer_length" Float
           'False
         where
        nodeProperty
          = (get_buffer_length, wrapDroppingSetter set_buffer_length,
             Nothing)

instance NodeProperty AudioStreamGenerator "mix_rate" Float 'False
         where
        nodeProperty
          = (get_mix_rate, wrapDroppingSetter set_mix_rate, Nothing)

{-# NOINLINE bindAudioStreamGenerator_get_buffer_length #-}

-- | The length of the buffer to generate (in seconds). Lower values result in less latency, but require the script to generate audio data faster, resulting in increased CPU usage and more risk for audio cracking if the CPU can't keep up.
bindAudioStreamGenerator_get_buffer_length :: MethodBind
bindAudioStreamGenerator_get_buffer_length
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "get_buffer_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the buffer to generate (in seconds). Lower values result in less latency, but require the script to generate audio data faster, resulting in increased CPU usage and more risk for audio cracking if the CPU can't keep up.
get_buffer_length ::
                    (AudioStreamGenerator :< cls, Object :< cls) => cls -> IO Float
get_buffer_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_get_buffer_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "get_buffer_length" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.get_buffer_length

{-# NOINLINE bindAudioStreamGenerator_get_mix_rate #-}

-- | The sample rate to use (in Hz). Higher values are more demanding for the CPU to generate, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are generating lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
bindAudioStreamGenerator_get_mix_rate :: MethodBind
bindAudioStreamGenerator_get_mix_rate
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "get_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sample rate to use (in Hz). Higher values are more demanding for the CPU to generate, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are generating lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
get_mix_rate ::
               (AudioStreamGenerator :< cls, Object :< cls) => cls -> IO Float
get_mix_rate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_get_mix_rate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "get_mix_rate" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.get_mix_rate

{-# NOINLINE bindAudioStreamGenerator_set_buffer_length #-}

-- | The length of the buffer to generate (in seconds). Lower values result in less latency, but require the script to generate audio data faster, resulting in increased CPU usage and more risk for audio cracking if the CPU can't keep up.
bindAudioStreamGenerator_set_buffer_length :: MethodBind
bindAudioStreamGenerator_set_buffer_length
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "set_buffer_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the buffer to generate (in seconds). Lower values result in less latency, but require the script to generate audio data faster, resulting in increased CPU usage and more risk for audio cracking if the CPU can't keep up.
set_buffer_length ::
                    (AudioStreamGenerator :< cls, Object :< cls) =>
                    cls -> Float -> IO ()
set_buffer_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_set_buffer_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "set_buffer_length"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.set_buffer_length

{-# NOINLINE bindAudioStreamGenerator_set_mix_rate #-}

-- | The sample rate to use (in Hz). Higher values are more demanding for the CPU to generate, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are generating lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
bindAudioStreamGenerator_set_mix_rate :: MethodBind
bindAudioStreamGenerator_set_mix_rate
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "set_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sample rate to use (in Hz). Higher values are more demanding for the CPU to generate, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are generating lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
set_mix_rate ::
               (AudioStreamGenerator :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_mix_rate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_set_mix_rate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "set_mix_rate" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.set_mix_rate