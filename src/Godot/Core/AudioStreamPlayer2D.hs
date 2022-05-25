{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamPlayer2D
       (Godot.Core.AudioStreamPlayer2D.sig_finished,
        Godot.Core.AudioStreamPlayer2D._bus_layout_changed,
        Godot.Core.AudioStreamPlayer2D._is_active,
        Godot.Core.AudioStreamPlayer2D._set_playing,
        Godot.Core.AudioStreamPlayer2D.get_area_mask,
        Godot.Core.AudioStreamPlayer2D.get_attenuation,
        Godot.Core.AudioStreamPlayer2D.get_bus,
        Godot.Core.AudioStreamPlayer2D.get_max_distance,
        Godot.Core.AudioStreamPlayer2D.get_pitch_scale,
        Godot.Core.AudioStreamPlayer2D.get_playback_position,
        Godot.Core.AudioStreamPlayer2D.get_stream,
        Godot.Core.AudioStreamPlayer2D.get_stream_paused,
        Godot.Core.AudioStreamPlayer2D.get_stream_playback,
        Godot.Core.AudioStreamPlayer2D.get_volume_db,
        Godot.Core.AudioStreamPlayer2D.is_autoplay_enabled,
        Godot.Core.AudioStreamPlayer2D.is_playing,
        Godot.Core.AudioStreamPlayer2D.play,
        Godot.Core.AudioStreamPlayer2D.seek,
        Godot.Core.AudioStreamPlayer2D.set_area_mask,
        Godot.Core.AudioStreamPlayer2D.set_attenuation,
        Godot.Core.AudioStreamPlayer2D.set_autoplay,
        Godot.Core.AudioStreamPlayer2D.set_bus,
        Godot.Core.AudioStreamPlayer2D.set_max_distance,
        Godot.Core.AudioStreamPlayer2D.set_pitch_scale,
        Godot.Core.AudioStreamPlayer2D.set_stream,
        Godot.Core.AudioStreamPlayer2D.set_stream_paused,
        Godot.Core.AudioStreamPlayer2D.set_volume_db,
        Godot.Core.AudioStreamPlayer2D.stop)
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
import Godot.Core.Node2D()

-- | Emitted when the audio stops playing.
sig_finished :: Godot.Internal.Dispatch.Signal AudioStreamPlayer2D
sig_finished = Godot.Internal.Dispatch.Signal "finished"

instance NodeSignal AudioStreamPlayer2D "finished" '[]

instance NodeProperty AudioStreamPlayer2D "area_mask" Int 'False
         where
        nodeProperty
          = (get_area_mask, wrapDroppingSetter set_area_mask, Nothing)

instance NodeProperty AudioStreamPlayer2D "attenuation" Float
           'False
         where
        nodeProperty
          = (get_attenuation, wrapDroppingSetter set_attenuation, Nothing)

instance NodeProperty AudioStreamPlayer2D "autoplay" Bool 'False
         where
        nodeProperty
          = (is_autoplay_enabled, wrapDroppingSetter set_autoplay, Nothing)

instance NodeProperty AudioStreamPlayer2D "bus" GodotString 'False
         where
        nodeProperty = (get_bus, wrapDroppingSetter set_bus, Nothing)

instance NodeProperty AudioStreamPlayer2D "max_distance" Float
           'False
         where
        nodeProperty
          = (get_max_distance, wrapDroppingSetter set_max_distance, Nothing)

instance NodeProperty AudioStreamPlayer2D "pitch_scale" Float
           'False
         where
        nodeProperty
          = (get_pitch_scale, wrapDroppingSetter set_pitch_scale, Nothing)

instance NodeProperty AudioStreamPlayer2D "playing" Bool 'False
         where
        nodeProperty
          = (is_playing, wrapDroppingSetter _set_playing, Nothing)

instance NodeProperty AudioStreamPlayer2D "stream" AudioStream
           'False
         where
        nodeProperty = (get_stream, wrapDroppingSetter set_stream, Nothing)

instance NodeProperty AudioStreamPlayer2D "stream_paused" Bool
           'False
         where
        nodeProperty
          = (get_stream_paused, wrapDroppingSetter set_stream_paused,
             Nothing)

instance NodeProperty AudioStreamPlayer2D "volume_db" Float 'False
         where
        nodeProperty
          = (get_volume_db, wrapDroppingSetter set_volume_db, Nothing)

{-# NOINLINE bindAudioStreamPlayer2D__bus_layout_changed #-}

bindAudioStreamPlayer2D__bus_layout_changed :: MethodBind
bindAudioStreamPlayer2D__bus_layout_changed
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "_bus_layout_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_bus_layout_changed ::
                      (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO ()
_bus_layout_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D__bus_layout_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "_bus_layout_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D._bus_layout_changed

{-# NOINLINE bindAudioStreamPlayer2D__is_active #-}

bindAudioStreamPlayer2D__is_active :: MethodBind
bindAudioStreamPlayer2D__is_active
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_active ::
             (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Bool
_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D__is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "_is_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D._is_active

{-# NOINLINE bindAudioStreamPlayer2D__set_playing #-}

-- | If @true@, audio is playing.
bindAudioStreamPlayer2D__set_playing :: MethodBind
bindAudioStreamPlayer2D__set_playing
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "_set_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is playing.
_set_playing ::
               (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_playing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D__set_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "_set_playing" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D._set_playing

{-# NOINLINE bindAudioStreamPlayer2D_get_area_mask #-}

-- | Areas in which this sound plays.
bindAudioStreamPlayer2D_get_area_mask :: MethodBind
bindAudioStreamPlayer2D_get_area_mask
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_area_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Areas in which this sound plays.
get_area_mask ::
                (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Int
get_area_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_area_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_area_mask" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_area_mask

{-# NOINLINE bindAudioStreamPlayer2D_get_attenuation #-}

-- | Dampens audio over distance with this as an exponent.
bindAudioStreamPlayer2D_get_attenuation :: MethodBind
bindAudioStreamPlayer2D_get_attenuation
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_attenuation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dampens audio over distance with this as an exponent.
get_attenuation ::
                  (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Float
get_attenuation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_attenuation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_attenuation" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_attenuation

{-# NOINLINE bindAudioStreamPlayer2D_get_bus #-}

-- | Bus on which this audio is playing.
bindAudioStreamPlayer2D_get_bus :: MethodBind
bindAudioStreamPlayer2D_get_bus
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bus on which this audio is playing.
get_bus ::
          (AudioStreamPlayer2D :< cls, Object :< cls) =>
          cls -> IO GodotString
get_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_bus" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_bus

{-# NOINLINE bindAudioStreamPlayer2D_get_max_distance #-}

-- | Maximum distance from which audio is still hearable.
bindAudioStreamPlayer2D_get_max_distance :: MethodBind
bindAudioStreamPlayer2D_get_max_distance
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum distance from which audio is still hearable.
get_max_distance ::
                   (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Float
get_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_max_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_max_distance

{-# NOINLINE bindAudioStreamPlayer2D_get_pitch_scale #-}

-- | Changes the pitch and the tempo of the audio.
bindAudioStreamPlayer2D_get_pitch_scale :: MethodBind
bindAudioStreamPlayer2D_get_pitch_scale
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the pitch and the tempo of the audio.
get_pitch_scale ::
                  (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Float
get_pitch_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_pitch_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_pitch_scale

{-# NOINLINE bindAudioStreamPlayer2D_get_playback_position #-}

-- | Returns the position in the @AudioStream@.
bindAudioStreamPlayer2D_get_playback_position :: MethodBind
bindAudioStreamPlayer2D_get_playback_position
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_playback_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position in the @AudioStream@.
get_playback_position ::
                        (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Float
get_playback_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer2D_get_playback_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_playback_position" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_playback_position

{-# NOINLINE bindAudioStreamPlayer2D_get_stream #-}

-- | The @AudioStream@ object to be played.
bindAudioStreamPlayer2D_get_stream :: MethodBind
bindAudioStreamPlayer2D_get_stream
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AudioStream@ object to be played.
get_stream ::
             (AudioStreamPlayer2D :< cls, Object :< cls) =>
             cls -> IO AudioStream
get_stream cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_stream" '[]
           (IO AudioStream)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_stream

{-# NOINLINE bindAudioStreamPlayer2D_get_stream_paused #-}

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
bindAudioStreamPlayer2D_get_stream_paused :: MethodBind
bindAudioStreamPlayer2D_get_stream_paused
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_stream_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
get_stream_paused ::
                    (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Bool
get_stream_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_stream_paused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_stream_paused" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_stream_paused

{-# NOINLINE bindAudioStreamPlayer2D_get_stream_playback #-}

-- | Returns the @AudioStreamPlayback@ object associated with this @AudioStreamPlayer2D@.
bindAudioStreamPlayer2D_get_stream_playback :: MethodBind
bindAudioStreamPlayer2D_get_stream_playback
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_stream_playback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AudioStreamPlayback@ object associated with this @AudioStreamPlayer2D@.
get_stream_playback ::
                      (AudioStreamPlayer2D :< cls, Object :< cls) =>
                      cls -> IO AudioStreamPlayback
get_stream_playback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_stream_playback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_stream_playback" '[]
           (IO AudioStreamPlayback)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_stream_playback

{-# NOINLINE bindAudioStreamPlayer2D_get_volume_db #-}

-- | Base volume without dampening.
bindAudioStreamPlayer2D_get_volume_db :: MethodBind
bindAudioStreamPlayer2D_get_volume_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "get_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base volume without dampening.
get_volume_db ::
                (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Float
get_volume_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_get_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "get_volume_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.get_volume_db

{-# NOINLINE bindAudioStreamPlayer2D_is_autoplay_enabled #-}

-- | If @true@, audio plays when added to scene tree.
bindAudioStreamPlayer2D_is_autoplay_enabled :: MethodBind
bindAudioStreamPlayer2D_is_autoplay_enabled
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "is_autoplay_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio plays when added to scene tree.
is_autoplay_enabled ::
                      (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Bool
is_autoplay_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_is_autoplay_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "is_autoplay_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.is_autoplay_enabled

{-# NOINLINE bindAudioStreamPlayer2D_is_playing #-}

-- | If @true@, audio is playing.
bindAudioStreamPlayer2D_is_playing :: MethodBind
bindAudioStreamPlayer2D_is_playing
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is playing.
is_playing ::
             (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_is_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "is_playing" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.is_playing

{-# NOINLINE bindAudioStreamPlayer2D_play #-}

-- | Plays the audio from the given position @from_position@, in seconds.
bindAudioStreamPlayer2D_play :: MethodBind
bindAudioStreamPlayer2D_play
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays the audio from the given position @from_position@, in seconds.
play ::
       (AudioStreamPlayer2D :< cls, Object :< cls) =>
       cls -> Maybe Float -> IO ()
play cls arg1
  = withVariantArray [maybe (VariantReal (0)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_play (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "play" '[Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.play

{-# NOINLINE bindAudioStreamPlayer2D_seek #-}

-- | Sets the position from which audio will be played, in seconds.
bindAudioStreamPlayer2D_seek :: MethodBind
bindAudioStreamPlayer2D_seek
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position from which audio will be played, in seconds.
seek ::
       (AudioStreamPlayer2D :< cls, Object :< cls) =>
       cls -> Float -> IO ()
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_seek (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "seek" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.seek

{-# NOINLINE bindAudioStreamPlayer2D_set_area_mask #-}

-- | Areas in which this sound plays.
bindAudioStreamPlayer2D_set_area_mask :: MethodBind
bindAudioStreamPlayer2D_set_area_mask
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_area_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Areas in which this sound plays.
set_area_mask ::
                (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_area_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_area_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_area_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_area_mask

{-# NOINLINE bindAudioStreamPlayer2D_set_attenuation #-}

-- | Dampens audio over distance with this as an exponent.
bindAudioStreamPlayer2D_set_attenuation :: MethodBind
bindAudioStreamPlayer2D_set_attenuation
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_attenuation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dampens audio over distance with this as an exponent.
set_attenuation ::
                  (AudioStreamPlayer2D :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_attenuation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_attenuation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_attenuation" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_attenuation

{-# NOINLINE bindAudioStreamPlayer2D_set_autoplay #-}

-- | If @true@, audio plays when added to scene tree.
bindAudioStreamPlayer2D_set_autoplay :: MethodBind
bindAudioStreamPlayer2D_set_autoplay
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio plays when added to scene tree.
set_autoplay ::
               (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autoplay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_autoplay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_autoplay" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_autoplay

{-# NOINLINE bindAudioStreamPlayer2D_set_bus #-}

-- | Bus on which this audio is playing.
bindAudioStreamPlayer2D_set_bus :: MethodBind
bindAudioStreamPlayer2D_set_bus
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bus on which this audio is playing.
set_bus ::
          (AudioStreamPlayer2D :< cls, Object :< cls) =>
          cls -> GodotString -> IO ()
set_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_bus" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_bus

{-# NOINLINE bindAudioStreamPlayer2D_set_max_distance #-}

-- | Maximum distance from which audio is still hearable.
bindAudioStreamPlayer2D_set_max_distance :: MethodBind
bindAudioStreamPlayer2D_set_max_distance
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum distance from which audio is still hearable.
set_max_distance ::
                   (AudioStreamPlayer2D :< cls, Object :< cls) =>
                   cls -> Float -> IO ()
set_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_max_distance" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_max_distance

{-# NOINLINE bindAudioStreamPlayer2D_set_pitch_scale #-}

-- | Changes the pitch and the tempo of the audio.
bindAudioStreamPlayer2D_set_pitch_scale :: MethodBind
bindAudioStreamPlayer2D_set_pitch_scale
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the pitch and the tempo of the audio.
set_pitch_scale ::
                  (AudioStreamPlayer2D :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_pitch_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_pitch_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_pitch_scale

{-# NOINLINE bindAudioStreamPlayer2D_set_stream #-}

-- | The @AudioStream@ object to be played.
bindAudioStreamPlayer2D_set_stream :: MethodBind
bindAudioStreamPlayer2D_set_stream
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AudioStream@ object to be played.
set_stream ::
             (AudioStreamPlayer2D :< cls, Object :< cls) =>
             cls -> AudioStream -> IO ()
set_stream cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_stream" '[AudioStream]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_stream

{-# NOINLINE bindAudioStreamPlayer2D_set_stream_paused #-}

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
bindAudioStreamPlayer2D_set_stream_paused :: MethodBind
bindAudioStreamPlayer2D_set_stream_paused
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_stream_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
set_stream_paused ::
                    (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_stream_paused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_stream_paused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_stream_paused" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_stream_paused

{-# NOINLINE bindAudioStreamPlayer2D_set_volume_db #-}

-- | Base volume without dampening.
bindAudioStreamPlayer2D_set_volume_db :: MethodBind
bindAudioStreamPlayer2D_set_volume_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "set_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base volume without dampening.
set_volume_db ::
                (AudioStreamPlayer2D :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_volume_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_set_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "set_volume_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.set_volume_db

{-# NOINLINE bindAudioStreamPlayer2D_stop #-}

-- | Stops the audio.
bindAudioStreamPlayer2D_stop :: MethodBind
bindAudioStreamPlayer2D_stop
  = unsafePerformIO $
      withCString "AudioStreamPlayer2D" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the audio.
stop :: (AudioStreamPlayer2D :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer2D_stop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer2D "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.AudioStreamPlayer2D.stop