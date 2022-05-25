{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamPlayer
       (Godot.Core.AudioStreamPlayer._MIX_TARGET_CENTER,
        Godot.Core.AudioStreamPlayer._MIX_TARGET_SURROUND,
        Godot.Core.AudioStreamPlayer._MIX_TARGET_STEREO,
        Godot.Core.AudioStreamPlayer.sig_finished,
        Godot.Core.AudioStreamPlayer._bus_layout_changed,
        Godot.Core.AudioStreamPlayer._is_active,
        Godot.Core.AudioStreamPlayer._set_playing,
        Godot.Core.AudioStreamPlayer.get_bus,
        Godot.Core.AudioStreamPlayer.get_mix_target,
        Godot.Core.AudioStreamPlayer.get_pitch_scale,
        Godot.Core.AudioStreamPlayer.get_playback_position,
        Godot.Core.AudioStreamPlayer.get_stream,
        Godot.Core.AudioStreamPlayer.get_stream_paused,
        Godot.Core.AudioStreamPlayer.get_stream_playback,
        Godot.Core.AudioStreamPlayer.get_volume_db,
        Godot.Core.AudioStreamPlayer.is_autoplay_enabled,
        Godot.Core.AudioStreamPlayer.is_playing,
        Godot.Core.AudioStreamPlayer.play,
        Godot.Core.AudioStreamPlayer.seek,
        Godot.Core.AudioStreamPlayer.set_autoplay,
        Godot.Core.AudioStreamPlayer.set_bus,
        Godot.Core.AudioStreamPlayer.set_mix_target,
        Godot.Core.AudioStreamPlayer.set_pitch_scale,
        Godot.Core.AudioStreamPlayer.set_stream,
        Godot.Core.AudioStreamPlayer.set_stream_paused,
        Godot.Core.AudioStreamPlayer.set_volume_db,
        Godot.Core.AudioStreamPlayer.stop)
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
import Godot.Core.Node()

_MIX_TARGET_CENTER :: Int
_MIX_TARGET_CENTER = 2

_MIX_TARGET_SURROUND :: Int
_MIX_TARGET_SURROUND = 1

_MIX_TARGET_STEREO :: Int
_MIX_TARGET_STEREO = 0

-- | Emitted when the audio stops playing.
sig_finished :: Godot.Internal.Dispatch.Signal AudioStreamPlayer
sig_finished = Godot.Internal.Dispatch.Signal "finished"

instance NodeSignal AudioStreamPlayer "finished" '[]

instance NodeProperty AudioStreamPlayer "autoplay" Bool 'False
         where
        nodeProperty
          = (is_autoplay_enabled, wrapDroppingSetter set_autoplay, Nothing)

instance NodeProperty AudioStreamPlayer "bus" GodotString 'False
         where
        nodeProperty = (get_bus, wrapDroppingSetter set_bus, Nothing)

instance NodeProperty AudioStreamPlayer "mix_target" Int 'False
         where
        nodeProperty
          = (get_mix_target, wrapDroppingSetter set_mix_target, Nothing)

instance NodeProperty AudioStreamPlayer "pitch_scale" Float 'False
         where
        nodeProperty
          = (get_pitch_scale, wrapDroppingSetter set_pitch_scale, Nothing)

instance NodeProperty AudioStreamPlayer "playing" Bool 'False where
        nodeProperty
          = (is_playing, wrapDroppingSetter _set_playing, Nothing)

instance NodeProperty AudioStreamPlayer "stream" AudioStream 'False
         where
        nodeProperty = (get_stream, wrapDroppingSetter set_stream, Nothing)

instance NodeProperty AudioStreamPlayer "stream_paused" Bool 'False
         where
        nodeProperty
          = (get_stream_paused, wrapDroppingSetter set_stream_paused,
             Nothing)

instance NodeProperty AudioStreamPlayer "volume_db" Float 'False
         where
        nodeProperty
          = (get_volume_db, wrapDroppingSetter set_volume_db, Nothing)

{-# NOINLINE bindAudioStreamPlayer__bus_layout_changed #-}

bindAudioStreamPlayer__bus_layout_changed :: MethodBind
bindAudioStreamPlayer__bus_layout_changed
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "_bus_layout_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_bus_layout_changed ::
                      (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO ()
_bus_layout_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer__bus_layout_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "_bus_layout_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer._bus_layout_changed

{-# NOINLINE bindAudioStreamPlayer__is_active #-}

bindAudioStreamPlayer__is_active :: MethodBind
bindAudioStreamPlayer__is_active
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_active ::
             (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Bool
_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer__is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "_is_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer._is_active

{-# NOINLINE bindAudioStreamPlayer__set_playing #-}

-- | If @true@, audio is playing.
bindAudioStreamPlayer__set_playing :: MethodBind
bindAudioStreamPlayer__set_playing
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "_set_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is playing.
_set_playing ::
               (AudioStreamPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_playing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer__set_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "_set_playing" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer._set_playing

{-# NOINLINE bindAudioStreamPlayer_get_bus #-}

-- | Bus on which this audio is playing.
bindAudioStreamPlayer_get_bus :: MethodBind
bindAudioStreamPlayer_get_bus
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bus on which this audio is playing.
get_bus ::
          (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO GodotString
get_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_bus" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_bus

{-# NOINLINE bindAudioStreamPlayer_get_mix_target #-}

-- | If the audio configuration has more than two speakers, this sets the target channels. See @enum MixTarget@ constants.
bindAudioStreamPlayer_get_mix_target :: MethodBind
bindAudioStreamPlayer_get_mix_target
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_mix_target" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the audio configuration has more than two speakers, this sets the target channels. See @enum MixTarget@ constants.
get_mix_target ::
                 (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Int
get_mix_target cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_mix_target
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_mix_target" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_mix_target

{-# NOINLINE bindAudioStreamPlayer_get_pitch_scale #-}

-- | Changes the pitch and the tempo of the audio.
bindAudioStreamPlayer_get_pitch_scale :: MethodBind
bindAudioStreamPlayer_get_pitch_scale
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the pitch and the tempo of the audio.
get_pitch_scale ::
                  (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Float
get_pitch_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_pitch_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_pitch_scale

{-# NOINLINE bindAudioStreamPlayer_get_playback_position #-}

-- | Returns the position in the @AudioStream@ in seconds.
bindAudioStreamPlayer_get_playback_position :: MethodBind
bindAudioStreamPlayer_get_playback_position
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_playback_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position in the @AudioStream@ in seconds.
get_playback_position ::
                        (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Float
get_playback_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_playback_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_playback_position" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_playback_position

{-# NOINLINE bindAudioStreamPlayer_get_stream #-}

-- | The @AudioStream@ object to be played.
bindAudioStreamPlayer_get_stream :: MethodBind
bindAudioStreamPlayer_get_stream
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AudioStream@ object to be played.
get_stream ::
             (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO AudioStream
get_stream cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_stream" '[]
           (IO AudioStream)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_stream

{-# NOINLINE bindAudioStreamPlayer_get_stream_paused #-}

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
bindAudioStreamPlayer_get_stream_paused :: MethodBind
bindAudioStreamPlayer_get_stream_paused
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_stream_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
get_stream_paused ::
                    (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Bool
get_stream_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_stream_paused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_stream_paused" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_stream_paused

{-# NOINLINE bindAudioStreamPlayer_get_stream_playback #-}

-- | Returns the @AudioStreamPlayback@ object associated with this @AudioStreamPlayer@.
bindAudioStreamPlayer_get_stream_playback :: MethodBind
bindAudioStreamPlayer_get_stream_playback
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_stream_playback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AudioStreamPlayback@ object associated with this @AudioStreamPlayer@.
get_stream_playback ::
                      (AudioStreamPlayer :< cls, Object :< cls) =>
                      cls -> IO AudioStreamPlayback
get_stream_playback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_stream_playback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_stream_playback" '[]
           (IO AudioStreamPlayback)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_stream_playback

{-# NOINLINE bindAudioStreamPlayer_get_volume_db #-}

-- | Volume of sound, in dB.
bindAudioStreamPlayer_get_volume_db :: MethodBind
bindAudioStreamPlayer_get_volume_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "get_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Volume of sound, in dB.
get_volume_db ::
                (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Float
get_volume_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_get_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "get_volume_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.get_volume_db

{-# NOINLINE bindAudioStreamPlayer_is_autoplay_enabled #-}

-- | If @true@, audio plays when added to scene tree.
bindAudioStreamPlayer_is_autoplay_enabled :: MethodBind
bindAudioStreamPlayer_is_autoplay_enabled
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "is_autoplay_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio plays when added to scene tree.
is_autoplay_enabled ::
                      (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Bool
is_autoplay_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_is_autoplay_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "is_autoplay_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.is_autoplay_enabled

{-# NOINLINE bindAudioStreamPlayer_is_playing #-}

-- | If @true@, audio is playing.
bindAudioStreamPlayer_is_playing :: MethodBind
bindAudioStreamPlayer_is_playing
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is playing.
is_playing ::
             (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_is_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "is_playing" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.is_playing

{-# NOINLINE bindAudioStreamPlayer_play #-}

-- | Plays the audio from the given @from_position@, in seconds.
bindAudioStreamPlayer_play :: MethodBind
bindAudioStreamPlayer_play
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays the audio from the given @from_position@, in seconds.
play ::
       (AudioStreamPlayer :< cls, Object :< cls) =>
       cls -> Maybe Float -> IO ()
play cls arg1
  = withVariantArray [maybe (VariantReal (0)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_play (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "play" '[Maybe Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.play

{-# NOINLINE bindAudioStreamPlayer_seek #-}

-- | Sets the position from which audio will be played, in seconds.
bindAudioStreamPlayer_seek :: MethodBind
bindAudioStreamPlayer_seek
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position from which audio will be played, in seconds.
seek ::
       (AudioStreamPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_seek (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "seek" '[Float] (IO ()) where
        nodeMethod = Godot.Core.AudioStreamPlayer.seek

{-# NOINLINE bindAudioStreamPlayer_set_autoplay #-}

-- | If @true@, audio plays when added to scene tree.
bindAudioStreamPlayer_set_autoplay :: MethodBind
bindAudioStreamPlayer_set_autoplay
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio plays when added to scene tree.
set_autoplay ::
               (AudioStreamPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autoplay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_autoplay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_autoplay" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_autoplay

{-# NOINLINE bindAudioStreamPlayer_set_bus #-}

-- | Bus on which this audio is playing.
bindAudioStreamPlayer_set_bus :: MethodBind
bindAudioStreamPlayer_set_bus
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bus on which this audio is playing.
set_bus ::
          (AudioStreamPlayer :< cls, Object :< cls) =>
          cls -> GodotString -> IO ()
set_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_bus" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_bus

{-# NOINLINE bindAudioStreamPlayer_set_mix_target #-}

-- | If the audio configuration has more than two speakers, this sets the target channels. See @enum MixTarget@ constants.
bindAudioStreamPlayer_set_mix_target :: MethodBind
bindAudioStreamPlayer_set_mix_target
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_mix_target" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the audio configuration has more than two speakers, this sets the target channels. See @enum MixTarget@ constants.
set_mix_target ::
                 (AudioStreamPlayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_mix_target cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_mix_target
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_mix_target" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_mix_target

{-# NOINLINE bindAudioStreamPlayer_set_pitch_scale #-}

-- | Changes the pitch and the tempo of the audio.
bindAudioStreamPlayer_set_pitch_scale :: MethodBind
bindAudioStreamPlayer_set_pitch_scale
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the pitch and the tempo of the audio.
set_pitch_scale ::
                  (AudioStreamPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_pitch_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_pitch_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_pitch_scale

{-# NOINLINE bindAudioStreamPlayer_set_stream #-}

-- | The @AudioStream@ object to be played.
bindAudioStreamPlayer_set_stream :: MethodBind
bindAudioStreamPlayer_set_stream
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AudioStream@ object to be played.
set_stream ::
             (AudioStreamPlayer :< cls, Object :< cls) =>
             cls -> AudioStream -> IO ()
set_stream cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_stream" '[AudioStream]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_stream

{-# NOINLINE bindAudioStreamPlayer_set_stream_paused #-}

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
bindAudioStreamPlayer_set_stream_paused :: MethodBind
bindAudioStreamPlayer_set_stream_paused
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_stream_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
set_stream_paused ::
                    (AudioStreamPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_stream_paused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_stream_paused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_stream_paused" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_stream_paused

{-# NOINLINE bindAudioStreamPlayer_set_volume_db #-}

-- | Volume of sound, in dB.
bindAudioStreamPlayer_set_volume_db :: MethodBind
bindAudioStreamPlayer_set_volume_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "set_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Volume of sound, in dB.
set_volume_db ::
                (AudioStreamPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_volume_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_set_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "set_volume_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer.set_volume_db

{-# NOINLINE bindAudioStreamPlayer_stop #-}

-- | Stops the audio.
bindAudioStreamPlayer_stop :: MethodBind
bindAudioStreamPlayer_stop
  = unsafePerformIO $
      withCString "AudioStreamPlayer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the audio.
stop :: (AudioStreamPlayer :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer_stop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.AudioStreamPlayer.stop