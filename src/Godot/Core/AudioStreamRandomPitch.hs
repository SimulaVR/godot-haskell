{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamRandomPitch
       (Godot.Core.AudioStreamRandomPitch.get_audio_stream,
        Godot.Core.AudioStreamRandomPitch.get_random_pitch,
        Godot.Core.AudioStreamRandomPitch.set_audio_stream,
        Godot.Core.AudioStreamRandomPitch.set_random_pitch)
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

instance NodeProperty AudioStreamRandomPitch "audio_stream"
           AudioStream
           'False
         where
        nodeProperty
          = (get_audio_stream, wrapDroppingSetter set_audio_stream, Nothing)

instance NodeProperty AudioStreamRandomPitch "random_pitch" Float
           'False
         where
        nodeProperty
          = (get_random_pitch, wrapDroppingSetter set_random_pitch, Nothing)

{-# NOINLINE bindAudioStreamRandomPitch_get_audio_stream #-}

-- | The current @AudioStream@.
bindAudioStreamRandomPitch_get_audio_stream :: MethodBind
bindAudioStreamRandomPitch_get_audio_stream
  = unsafePerformIO $
      withCString "AudioStreamRandomPitch" $
        \ clsNamePtr ->
          withCString "get_audio_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current @AudioStream@.
get_audio_stream ::
                   (AudioStreamRandomPitch :< cls, Object :< cls) =>
                   cls -> IO AudioStream
get_audio_stream cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamRandomPitch_get_audio_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamRandomPitch "get_audio_stream" '[]
           (IO AudioStream)
         where
        nodeMethod = Godot.Core.AudioStreamRandomPitch.get_audio_stream

{-# NOINLINE bindAudioStreamRandomPitch_get_random_pitch #-}

-- | The intensity of random pitch variation.
bindAudioStreamRandomPitch_get_random_pitch :: MethodBind
bindAudioStreamRandomPitch_get_random_pitch
  = unsafePerformIO $
      withCString "AudioStreamRandomPitch" $
        \ clsNamePtr ->
          withCString "get_random_pitch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The intensity of random pitch variation.
get_random_pitch ::
                   (AudioStreamRandomPitch :< cls, Object :< cls) => cls -> IO Float
get_random_pitch cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamRandomPitch_get_random_pitch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamRandomPitch "get_random_pitch" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamRandomPitch.get_random_pitch

{-# NOINLINE bindAudioStreamRandomPitch_set_audio_stream #-}

-- | The current @AudioStream@.
bindAudioStreamRandomPitch_set_audio_stream :: MethodBind
bindAudioStreamRandomPitch_set_audio_stream
  = unsafePerformIO $
      withCString "AudioStreamRandomPitch" $
        \ clsNamePtr ->
          withCString "set_audio_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current @AudioStream@.
set_audio_stream ::
                   (AudioStreamRandomPitch :< cls, Object :< cls) =>
                   cls -> AudioStream -> IO ()
set_audio_stream cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamRandomPitch_set_audio_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamRandomPitch "set_audio_stream"
           '[AudioStream]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamRandomPitch.set_audio_stream

{-# NOINLINE bindAudioStreamRandomPitch_set_random_pitch #-}

-- | The intensity of random pitch variation.
bindAudioStreamRandomPitch_set_random_pitch :: MethodBind
bindAudioStreamRandomPitch_set_random_pitch
  = unsafePerformIO $
      withCString "AudioStreamRandomPitch" $
        \ clsNamePtr ->
          withCString "set_random_pitch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The intensity of random pitch variation.
set_random_pitch ::
                   (AudioStreamRandomPitch :< cls, Object :< cls) =>
                   cls -> Float -> IO ()
set_random_pitch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamRandomPitch_set_random_pitch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamRandomPitch "set_random_pitch"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamRandomPitch.set_random_pitch