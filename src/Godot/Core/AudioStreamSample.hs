{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamSample
       (Godot.Core.AudioStreamSample._FORMAT_8_BITS,
        Godot.Core.AudioStreamSample._LOOP_PING_PONG,
        Godot.Core.AudioStreamSample._LOOP_BACKWARD,
        Godot.Core.AudioStreamSample._LOOP_DISABLED,
        Godot.Core.AudioStreamSample._FORMAT_IMA_ADPCM,
        Godot.Core.AudioStreamSample._LOOP_FORWARD,
        Godot.Core.AudioStreamSample._FORMAT_16_BITS,
        Godot.Core.AudioStreamSample.get_data,
        Godot.Core.AudioStreamSample.get_format,
        Godot.Core.AudioStreamSample.get_loop_begin,
        Godot.Core.AudioStreamSample.get_loop_end,
        Godot.Core.AudioStreamSample.get_loop_mode,
        Godot.Core.AudioStreamSample.get_mix_rate,
        Godot.Core.AudioStreamSample.is_stereo,
        Godot.Core.AudioStreamSample.save_to_wav,
        Godot.Core.AudioStreamSample.set_data,
        Godot.Core.AudioStreamSample.set_format,
        Godot.Core.AudioStreamSample.set_loop_begin,
        Godot.Core.AudioStreamSample.set_loop_end,
        Godot.Core.AudioStreamSample.set_loop_mode,
        Godot.Core.AudioStreamSample.set_mix_rate,
        Godot.Core.AudioStreamSample.set_stereo)
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

_FORMAT_8_BITS :: Int
_FORMAT_8_BITS = 0

_LOOP_PING_PONG :: Int
_LOOP_PING_PONG = 2

_LOOP_BACKWARD :: Int
_LOOP_BACKWARD = 3

_LOOP_DISABLED :: Int
_LOOP_DISABLED = 0

_FORMAT_IMA_ADPCM :: Int
_FORMAT_IMA_ADPCM = 2

_LOOP_FORWARD :: Int
_LOOP_FORWARD = 1

_FORMAT_16_BITS :: Int
_FORMAT_16_BITS = 1

instance NodeProperty AudioStreamSample "data" PoolByteArray 'False
         where
        nodeProperty = (get_data, wrapDroppingSetter set_data, Nothing)

instance NodeProperty AudioStreamSample "format" Int 'False where
        nodeProperty = (get_format, wrapDroppingSetter set_format, Nothing)

instance NodeProperty AudioStreamSample "loop_begin" Int 'False
         where
        nodeProperty
          = (get_loop_begin, wrapDroppingSetter set_loop_begin, Nothing)

instance NodeProperty AudioStreamSample "loop_end" Int 'False where
        nodeProperty
          = (get_loop_end, wrapDroppingSetter set_loop_end, Nothing)

instance NodeProperty AudioStreamSample "loop_mode" Int 'False
         where
        nodeProperty
          = (get_loop_mode, wrapDroppingSetter set_loop_mode, Nothing)

instance NodeProperty AudioStreamSample "mix_rate" Int 'False where
        nodeProperty
          = (get_mix_rate, wrapDroppingSetter set_mix_rate, Nothing)

instance NodeProperty AudioStreamSample "stereo" Bool 'False where
        nodeProperty = (is_stereo, wrapDroppingSetter set_stereo, Nothing)

{-# NOINLINE bindAudioStreamSample_get_data #-}

-- | Contains the audio data in bytes.
--   			__Note:__ This property expects signed PCM8 data. To convert unsigned PCM8 to signed PCM8, subtract 128 from each byte.
bindAudioStreamSample_get_data :: MethodBind
bindAudioStreamSample_get_data
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Contains the audio data in bytes.
--   			__Note:__ This property expects signed PCM8 data. To convert unsigned PCM8 to signed PCM8, subtract 128 from each byte.
get_data ::
           (AudioStreamSample :< cls, Object :< cls) =>
           cls -> IO PoolByteArray
get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_get_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "get_data" '[]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.AudioStreamSample.get_data

{-# NOINLINE bindAudioStreamSample_get_format #-}

-- | Audio format. See @enum Format@ constants for values.
bindAudioStreamSample_get_format :: MethodBind
bindAudioStreamSample_get_format
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio format. See @enum Format@ constants for values.
get_format ::
             (AudioStreamSample :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_get_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "get_format" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamSample.get_format

{-# NOINLINE bindAudioStreamSample_get_loop_begin #-}

-- | The loop start point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
bindAudioStreamSample_get_loop_begin :: MethodBind
bindAudioStreamSample_get_loop_begin
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "get_loop_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The loop start point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
get_loop_begin ::
                 (AudioStreamSample :< cls, Object :< cls) => cls -> IO Int
get_loop_begin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_get_loop_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "get_loop_begin" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamSample.get_loop_begin

{-# NOINLINE bindAudioStreamSample_get_loop_end #-}

-- | The loop end point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
bindAudioStreamSample_get_loop_end :: MethodBind
bindAudioStreamSample_get_loop_end
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "get_loop_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The loop end point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
get_loop_end ::
               (AudioStreamSample :< cls, Object :< cls) => cls -> IO Int
get_loop_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_get_loop_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "get_loop_end" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamSample.get_loop_end

{-# NOINLINE bindAudioStreamSample_get_loop_mode #-}

-- | The loop mode. This information will be imported automatically from the WAV file if present. See @enum LoopMode@ constants for values.
bindAudioStreamSample_get_loop_mode :: MethodBind
bindAudioStreamSample_get_loop_mode
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "get_loop_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The loop mode. This information will be imported automatically from the WAV file if present. See @enum LoopMode@ constants for values.
get_loop_mode ::
                (AudioStreamSample :< cls, Object :< cls) => cls -> IO Int
get_loop_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_get_loop_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "get_loop_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamSample.get_loop_mode

{-# NOINLINE bindAudioStreamSample_get_mix_rate #-}

-- | The sample rate for mixing this audio. Higher values require more storage space, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are using lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
bindAudioStreamSample_get_mix_rate :: MethodBind
bindAudioStreamSample_get_mix_rate
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "get_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sample rate for mixing this audio. Higher values require more storage space, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are using lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
get_mix_rate ::
               (AudioStreamSample :< cls, Object :< cls) => cls -> IO Int
get_mix_rate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_get_mix_rate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "get_mix_rate" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamSample.get_mix_rate

{-# NOINLINE bindAudioStreamSample_is_stereo #-}

-- | If @true@, audio is stereo.
bindAudioStreamSample_is_stereo :: MethodBind
bindAudioStreamSample_is_stereo
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "is_stereo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is stereo.
is_stereo ::
            (AudioStreamSample :< cls, Object :< cls) => cls -> IO Bool
is_stereo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_is_stereo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "is_stereo" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamSample.is_stereo

{-# NOINLINE bindAudioStreamSample_save_to_wav #-}

-- | Saves the AudioStreamSample as a WAV file to @path@. Samples with IMA ADPCM format can't be saved.
--   				__Note:__ A @.wav@ extension is automatically appended to @path@ if it is missing.
bindAudioStreamSample_save_to_wav :: MethodBind
bindAudioStreamSample_save_to_wav
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "save_to_wav" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the AudioStreamSample as a WAV file to @path@. Samples with IMA ADPCM format can't be saved.
--   				__Note:__ A @.wav@ extension is automatically appended to @path@ if it is missing.
save_to_wav ::
              (AudioStreamSample :< cls, Object :< cls) =>
              cls -> GodotString -> IO Int
save_to_wav cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_save_to_wav
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "save_to_wav" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamSample.save_to_wav

{-# NOINLINE bindAudioStreamSample_set_data #-}

-- | Contains the audio data in bytes.
--   			__Note:__ This property expects signed PCM8 data. To convert unsigned PCM8 to signed PCM8, subtract 128 from each byte.
bindAudioStreamSample_set_data :: MethodBind
bindAudioStreamSample_set_data
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Contains the audio data in bytes.
--   			__Note:__ This property expects signed PCM8 data. To convert unsigned PCM8 to signed PCM8, subtract 128 from each byte.
set_data ::
           (AudioStreamSample :< cls, Object :< cls) =>
           cls -> PoolByteArray -> IO ()
set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_data" '[PoolByteArray]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_data

{-# NOINLINE bindAudioStreamSample_set_format #-}

-- | Audio format. See @enum Format@ constants for values.
bindAudioStreamSample_set_format :: MethodBind
bindAudioStreamSample_set_format
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio format. See @enum Format@ constants for values.
set_format ::
             (AudioStreamSample :< cls, Object :< cls) => cls -> Int -> IO ()
set_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_format" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_format

{-# NOINLINE bindAudioStreamSample_set_loop_begin #-}

-- | The loop start point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
bindAudioStreamSample_set_loop_begin :: MethodBind
bindAudioStreamSample_set_loop_begin
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_loop_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The loop start point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
set_loop_begin ::
                 (AudioStreamSample :< cls, Object :< cls) => cls -> Int -> IO ()
set_loop_begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_loop_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_loop_begin" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_loop_begin

{-# NOINLINE bindAudioStreamSample_set_loop_end #-}

-- | The loop end point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
bindAudioStreamSample_set_loop_end :: MethodBind
bindAudioStreamSample_set_loop_end
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_loop_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The loop end point (in number of samples, relative to the beginning of the sample). This information will be imported automatically from the WAV file if present.
set_loop_end ::
               (AudioStreamSample :< cls, Object :< cls) => cls -> Int -> IO ()
set_loop_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_loop_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_loop_end" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_loop_end

{-# NOINLINE bindAudioStreamSample_set_loop_mode #-}

-- | The loop mode. This information will be imported automatically from the WAV file if present. See @enum LoopMode@ constants for values.
bindAudioStreamSample_set_loop_mode :: MethodBind
bindAudioStreamSample_set_loop_mode
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_loop_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The loop mode. This information will be imported automatically from the WAV file if present. See @enum LoopMode@ constants for values.
set_loop_mode ::
                (AudioStreamSample :< cls, Object :< cls) => cls -> Int -> IO ()
set_loop_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_loop_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_loop_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_loop_mode

{-# NOINLINE bindAudioStreamSample_set_mix_rate #-}

-- | The sample rate for mixing this audio. Higher values require more storage space, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are using lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
bindAudioStreamSample_set_mix_rate :: MethodBind
bindAudioStreamSample_set_mix_rate
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sample rate for mixing this audio. Higher values require more storage space, but result in better quality.
--   			In games, common sample rates in use are @11025@, @16000@, @22050@, @32000@, @44100@, and @48000@.
--   			According to the @url=https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem@Nyquist-Shannon sampling theorem@/url@, there is no quality difference to human hearing when going past 40,000 Hz (since most humans can only hear up to ~20,000 Hz, often less). If you are using lower-pitched sounds such as voices, lower sample rates such as @32000@ or @22050@ may be usable with no loss in quality.
set_mix_rate ::
               (AudioStreamSample :< cls, Object :< cls) => cls -> Int -> IO ()
set_mix_rate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_mix_rate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_mix_rate" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_mix_rate

{-# NOINLINE bindAudioStreamSample_set_stereo #-}

-- | If @true@, audio is stereo.
bindAudioStreamSample_set_stereo :: MethodBind
bindAudioStreamSample_set_stereo
  = unsafePerformIO $
      withCString "AudioStreamSample" $
        \ clsNamePtr ->
          withCString "set_stereo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is stereo.
set_stereo ::
             (AudioStreamSample :< cls, Object :< cls) => cls -> Bool -> IO ()
set_stereo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamSample_set_stereo
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamSample "set_stereo" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamSample.set_stereo