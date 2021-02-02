{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VideoPlayer
       (Godot.Core.VideoPlayer.sig_finished,
        Godot.Core.VideoPlayer.get_audio_track,
        Godot.Core.VideoPlayer.get_buffering_msec,
        Godot.Core.VideoPlayer.get_bus, Godot.Core.VideoPlayer.get_stream,
        Godot.Core.VideoPlayer.get_stream_name,
        Godot.Core.VideoPlayer.get_stream_position,
        Godot.Core.VideoPlayer.get_video_texture,
        Godot.Core.VideoPlayer.get_volume,
        Godot.Core.VideoPlayer.get_volume_db,
        Godot.Core.VideoPlayer.has_autoplay,
        Godot.Core.VideoPlayer.has_expand,
        Godot.Core.VideoPlayer.is_paused,
        Godot.Core.VideoPlayer.is_playing, Godot.Core.VideoPlayer.play,
        Godot.Core.VideoPlayer.set_audio_track,
        Godot.Core.VideoPlayer.set_autoplay,
        Godot.Core.VideoPlayer.set_buffering_msec,
        Godot.Core.VideoPlayer.set_bus, Godot.Core.VideoPlayer.set_expand,
        Godot.Core.VideoPlayer.set_paused,
        Godot.Core.VideoPlayer.set_stream,
        Godot.Core.VideoPlayer.set_stream_position,
        Godot.Core.VideoPlayer.set_volume,
        Godot.Core.VideoPlayer.set_volume_db, Godot.Core.VideoPlayer.stop)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when playback is finished.
sig_finished :: Godot.Internal.Dispatch.Signal VideoPlayer
sig_finished = Godot.Internal.Dispatch.Signal "finished"

{-# NOINLINE bindVideoPlayer_get_audio_track #-}

-- | The embedded audio track to play.
bindVideoPlayer_get_audio_track :: MethodBind
bindVideoPlayer_get_audio_track
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_audio_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The embedded audio track to play.
get_audio_track ::
                  (VideoPlayer :< cls, Object :< cls) => cls -> IO Int
get_audio_track cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_audio_track (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_buffering_msec #-}

-- | Amount of time in milliseconds to store in buffer while playing.
bindVideoPlayer_get_buffering_msec :: MethodBind
bindVideoPlayer_get_buffering_msec
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_buffering_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time in milliseconds to store in buffer while playing.
get_buffering_msec ::
                     (VideoPlayer :< cls, Object :< cls) => cls -> IO Int
get_buffering_msec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_buffering_msec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_bus #-}

-- | Audio bus to use for sound playback.
bindVideoPlayer_get_bus :: MethodBind
bindVideoPlayer_get_bus
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio bus to use for sound playback.
get_bus ::
          (VideoPlayer :< cls, Object :< cls) => cls -> IO GodotString
get_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_stream #-}

bindVideoPlayer_get_stream :: MethodBind
bindVideoPlayer_get_stream
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_stream ::
             (VideoPlayer :< cls, Object :< cls) => cls -> IO VideoStream
get_stream cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_stream (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_stream_name #-}

-- | Returns the video stream's name.
bindVideoPlayer_get_stream_name :: MethodBind
bindVideoPlayer_get_stream_name
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_stream_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the video stream's name.
get_stream_name ::
                  (VideoPlayer :< cls, Object :< cls) => cls -> IO GodotString
get_stream_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_stream_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_stream_position #-}

-- | The current position of the stream, in seconds.
bindVideoPlayer_get_stream_position :: MethodBind
bindVideoPlayer_get_stream_position
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_stream_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current position of the stream, in seconds.
get_stream_position ::
                      (VideoPlayer :< cls, Object :< cls) => cls -> IO Float
get_stream_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_stream_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_video_texture #-}

-- | Returns the current frame as a [Texture].
bindVideoPlayer_get_video_texture :: MethodBind
bindVideoPlayer_get_video_texture
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_video_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current frame as a [Texture].
get_video_texture ::
                    (VideoPlayer :< cls, Object :< cls) => cls -> IO Texture
get_video_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_video_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_volume #-}

-- | Audio volume as a linear value.
bindVideoPlayer_get_volume :: MethodBind
bindVideoPlayer_get_volume
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_volume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio volume as a linear value.
get_volume ::
             (VideoPlayer :< cls, Object :< cls) => cls -> IO Float
get_volume cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_volume (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_get_volume_db #-}

-- | Audio volume in dB.
bindVideoPlayer_get_volume_db :: MethodBind
bindVideoPlayer_get_volume_db
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "get_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio volume in dB.
get_volume_db ::
                (VideoPlayer :< cls, Object :< cls) => cls -> IO Float
get_volume_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_get_volume_db (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_has_autoplay #-}

-- | If [code]true[/code], playback starts when the scene loads. Default value: [code]false[/code].
bindVideoPlayer_has_autoplay :: MethodBind
bindVideoPlayer_has_autoplay
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "has_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], playback starts when the scene loads. Default value: [code]false[/code].
has_autoplay ::
               (VideoPlayer :< cls, Object :< cls) => cls -> IO Bool
has_autoplay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_has_autoplay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_has_expand #-}

-- | If [code]true[/code], the video scales to the control size. Default value: [code]true[/code].
bindVideoPlayer_has_expand :: MethodBind
bindVideoPlayer_has_expand
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "has_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the video scales to the control size. Default value: [code]true[/code].
has_expand :: (VideoPlayer :< cls, Object :< cls) => cls -> IO Bool
has_expand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_has_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_is_paused #-}

-- | If [code]true[/code], the video is paused.
bindVideoPlayer_is_paused :: MethodBind
bindVideoPlayer_is_paused
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "is_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the video is paused.
is_paused :: (VideoPlayer :< cls, Object :< cls) => cls -> IO Bool
is_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_is_paused (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_is_playing #-}

-- | Returns [code]true[/code] if the video is playing.
bindVideoPlayer_is_playing :: MethodBind
bindVideoPlayer_is_playing
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the video is playing.
is_playing :: (VideoPlayer :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_play #-}

-- | Starts the video playback.
bindVideoPlayer_play :: MethodBind
bindVideoPlayer_play
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts the video playback.
play :: (VideoPlayer :< cls, Object :< cls) => cls -> IO ()
play cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_play (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_audio_track #-}

-- | The embedded audio track to play.
bindVideoPlayer_set_audio_track :: MethodBind
bindVideoPlayer_set_audio_track
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_audio_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The embedded audio track to play.
set_audio_track ::
                  (VideoPlayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_audio_track cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_audio_track (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_autoplay #-}

-- | If [code]true[/code], playback starts when the scene loads. Default value: [code]false[/code].
bindVideoPlayer_set_autoplay :: MethodBind
bindVideoPlayer_set_autoplay
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], playback starts when the scene loads. Default value: [code]false[/code].
set_autoplay ::
               (VideoPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autoplay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_autoplay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_buffering_msec #-}

-- | Amount of time in milliseconds to store in buffer while playing.
bindVideoPlayer_set_buffering_msec :: MethodBind
bindVideoPlayer_set_buffering_msec
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_buffering_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time in milliseconds to store in buffer while playing.
set_buffering_msec ::
                     (VideoPlayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_buffering_msec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_buffering_msec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_bus #-}

-- | Audio bus to use for sound playback.
bindVideoPlayer_set_bus :: MethodBind
bindVideoPlayer_set_bus
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio bus to use for sound playback.
set_bus ::
          (VideoPlayer :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_expand #-}

-- | If [code]true[/code], the video scales to the control size. Default value: [code]true[/code].
bindVideoPlayer_set_expand :: MethodBind
bindVideoPlayer_set_expand
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the video scales to the control size. Default value: [code]true[/code].
set_expand ::
             (VideoPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_paused #-}

-- | If [code]true[/code], the video is paused.
bindVideoPlayer_set_paused :: MethodBind
bindVideoPlayer_set_paused
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the video is paused.
set_paused ::
             (VideoPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_paused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_paused (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_stream #-}

bindVideoPlayer_set_stream :: MethodBind
bindVideoPlayer_set_stream
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_stream ::
             (VideoPlayer :< cls, Object :< cls) => cls -> VideoStream -> IO ()
set_stream cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_stream (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_stream_position #-}

-- | The current position of the stream, in seconds.
bindVideoPlayer_set_stream_position :: MethodBind
bindVideoPlayer_set_stream_position
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_stream_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current position of the stream, in seconds.
set_stream_position ::
                      (VideoPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_stream_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_stream_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_volume #-}

-- | Audio volume as a linear value.
bindVideoPlayer_set_volume :: MethodBind
bindVideoPlayer_set_volume
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_volume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio volume as a linear value.
set_volume ::
             (VideoPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_volume cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_volume (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_set_volume_db #-}

-- | Audio volume in dB.
bindVideoPlayer_set_volume_db :: MethodBind
bindVideoPlayer_set_volume_db
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "set_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Audio volume in dB.
set_volume_db ::
                (VideoPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_volume_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_set_volume_db (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoPlayer_stop #-}

-- | Stops the video playback.
bindVideoPlayer_stop :: MethodBind
bindVideoPlayer_stop
  = unsafePerformIO $
      withCString "VideoPlayer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the video playback.
stop :: (VideoPlayer :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoPlayer_stop (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)