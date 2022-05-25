{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Animation
       (Godot.Core.Animation._TYPE_BEZIER,
        Godot.Core.Animation._INTERPOLATION_CUBIC,
        Godot.Core.Animation._UPDATE_TRIGGER,
        Godot.Core.Animation._UPDATE_DISCRETE,
        Godot.Core.Animation._TYPE_TRANSFORM,
        Godot.Core.Animation._UPDATE_CAPTURE,
        Godot.Core.Animation._UPDATE_CONTINUOUS,
        Godot.Core.Animation._TYPE_METHOD,
        Godot.Core.Animation._TYPE_ANIMATION,
        Godot.Core.Animation._TYPE_VALUE, Godot.Core.Animation._TYPE_AUDIO,
        Godot.Core.Animation._INTERPOLATION_LINEAR,
        Godot.Core.Animation._INTERPOLATION_NEAREST,
        Godot.Core.Animation.sig_tracks_changed,
        Godot.Core.Animation.add_track,
        Godot.Core.Animation.animation_track_get_key_animation,
        Godot.Core.Animation.animation_track_insert_key,
        Godot.Core.Animation.animation_track_set_key_animation,
        Godot.Core.Animation.audio_track_get_key_end_offset,
        Godot.Core.Animation.audio_track_get_key_start_offset,
        Godot.Core.Animation.audio_track_get_key_stream,
        Godot.Core.Animation.audio_track_insert_key,
        Godot.Core.Animation.audio_track_set_key_end_offset,
        Godot.Core.Animation.audio_track_set_key_start_offset,
        Godot.Core.Animation.audio_track_set_key_stream,
        Godot.Core.Animation.bezier_track_get_key_in_handle,
        Godot.Core.Animation.bezier_track_get_key_out_handle,
        Godot.Core.Animation.bezier_track_get_key_value,
        Godot.Core.Animation.bezier_track_insert_key,
        Godot.Core.Animation.bezier_track_interpolate,
        Godot.Core.Animation.bezier_track_set_key_in_handle,
        Godot.Core.Animation.bezier_track_set_key_out_handle,
        Godot.Core.Animation.bezier_track_set_key_value,
        Godot.Core.Animation.clear, Godot.Core.Animation.copy_track,
        Godot.Core.Animation.find_track, Godot.Core.Animation.get_length,
        Godot.Core.Animation.get_step,
        Godot.Core.Animation.get_track_count,
        Godot.Core.Animation.has_loop,
        Godot.Core.Animation.method_track_get_key_indices,
        Godot.Core.Animation.method_track_get_name,
        Godot.Core.Animation.method_track_get_params,
        Godot.Core.Animation.remove_track, Godot.Core.Animation.set_length,
        Godot.Core.Animation.set_loop, Godot.Core.Animation.set_step,
        Godot.Core.Animation.track_find_key,
        Godot.Core.Animation.track_get_interpolation_loop_wrap,
        Godot.Core.Animation.track_get_interpolation_type,
        Godot.Core.Animation.track_get_key_count,
        Godot.Core.Animation.track_get_key_time,
        Godot.Core.Animation.track_get_key_transition,
        Godot.Core.Animation.track_get_key_value,
        Godot.Core.Animation.track_get_path,
        Godot.Core.Animation.track_get_type,
        Godot.Core.Animation.track_insert_key,
        Godot.Core.Animation.track_is_enabled,
        Godot.Core.Animation.track_is_imported,
        Godot.Core.Animation.track_move_down,
        Godot.Core.Animation.track_move_to,
        Godot.Core.Animation.track_move_up,
        Godot.Core.Animation.track_remove_key,
        Godot.Core.Animation.track_remove_key_at_position,
        Godot.Core.Animation.track_set_enabled,
        Godot.Core.Animation.track_set_imported,
        Godot.Core.Animation.track_set_interpolation_loop_wrap,
        Godot.Core.Animation.track_set_interpolation_type,
        Godot.Core.Animation.track_set_key_time,
        Godot.Core.Animation.track_set_key_transition,
        Godot.Core.Animation.track_set_key_value,
        Godot.Core.Animation.track_set_path,
        Godot.Core.Animation.track_swap,
        Godot.Core.Animation.transform_track_insert_key,
        Godot.Core.Animation.transform_track_interpolate,
        Godot.Core.Animation.value_track_get_key_indices,
        Godot.Core.Animation.value_track_get_update_mode,
        Godot.Core.Animation.value_track_set_update_mode)
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
import Godot.Core.Resource()

_TYPE_BEZIER :: Int
_TYPE_BEZIER = 3

_INTERPOLATION_CUBIC :: Int
_INTERPOLATION_CUBIC = 2

_UPDATE_TRIGGER :: Int
_UPDATE_TRIGGER = 2

_UPDATE_DISCRETE :: Int
_UPDATE_DISCRETE = 1

_TYPE_TRANSFORM :: Int
_TYPE_TRANSFORM = 1

_UPDATE_CAPTURE :: Int
_UPDATE_CAPTURE = 3

_UPDATE_CONTINUOUS :: Int
_UPDATE_CONTINUOUS = 0

_TYPE_METHOD :: Int
_TYPE_METHOD = 2

_TYPE_ANIMATION :: Int
_TYPE_ANIMATION = 5

_TYPE_VALUE :: Int
_TYPE_VALUE = 0

_TYPE_AUDIO :: Int
_TYPE_AUDIO = 4

_INTERPOLATION_LINEAR :: Int
_INTERPOLATION_LINEAR = 1

_INTERPOLATION_NEAREST :: Int
_INTERPOLATION_NEAREST = 0

sig_tracks_changed :: Godot.Internal.Dispatch.Signal Animation
sig_tracks_changed
  = Godot.Internal.Dispatch.Signal "tracks_changed"

instance NodeSignal Animation "tracks_changed" '[]

instance NodeProperty Animation "length" Float 'False where
        nodeProperty = (get_length, wrapDroppingSetter set_length, Nothing)

instance NodeProperty Animation "loop" Bool 'False where
        nodeProperty = (has_loop, wrapDroppingSetter set_loop, Nothing)

instance NodeProperty Animation "step" Float 'False where
        nodeProperty = (get_step, wrapDroppingSetter set_step, Nothing)

{-# NOINLINE bindAnimation_add_track #-}

-- | Adds a track to the Animation.
bindAnimation_add_track :: MethodBind
bindAnimation_add_track
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "add_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a track to the Animation.
add_track ::
            (Animation :< cls, Object :< cls) =>
            cls -> Int -> Maybe Int -> IO Int
add_track cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_add_track (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "add_track" '[Int, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.add_track

{-# NOINLINE bindAnimation_animation_track_get_key_animation #-}

bindAnimation_animation_track_get_key_animation :: MethodBind
bindAnimation_animation_track_get_key_animation
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "animation_track_get_key_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

animation_track_get_key_animation ::
                                    (Animation :< cls, Object :< cls) =>
                                    cls -> Int -> Int -> IO GodotString
animation_track_get_key_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_animation_track_get_key_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "animation_track_get_key_animation"
           '[Int, Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Animation.animation_track_get_key_animation

{-# NOINLINE bindAnimation_animation_track_insert_key #-}

bindAnimation_animation_track_insert_key :: MethodBind
bindAnimation_animation_track_insert_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "animation_track_insert_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

animation_track_insert_key ::
                             (Animation :< cls, Object :< cls) =>
                             cls -> Int -> Float -> GodotString -> IO Int
animation_track_insert_key cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_animation_track_insert_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "animation_track_insert_key"
           '[Int, Float, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.animation_track_insert_key

{-# NOINLINE bindAnimation_animation_track_set_key_animation #-}

bindAnimation_animation_track_set_key_animation :: MethodBind
bindAnimation_animation_track_set_key_animation
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "animation_track_set_key_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

animation_track_set_key_animation ::
                                    (Animation :< cls, Object :< cls) =>
                                    cls -> Int -> Int -> GodotString -> IO ()
animation_track_set_key_animation cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_animation_track_set_key_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "animation_track_set_key_animation"
           '[Int, Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.animation_track_set_key_animation

{-# NOINLINE bindAnimation_audio_track_get_key_end_offset #-}

bindAnimation_audio_track_get_key_end_offset :: MethodBind
bindAnimation_audio_track_get_key_end_offset
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_get_key_end_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_get_key_end_offset ::
                                 (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
audio_track_get_key_end_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_audio_track_get_key_end_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_get_key_end_offset"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Animation.audio_track_get_key_end_offset

{-# NOINLINE bindAnimation_audio_track_get_key_start_offset #-}

bindAnimation_audio_track_get_key_start_offset :: MethodBind
bindAnimation_audio_track_get_key_start_offset
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_get_key_start_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_get_key_start_offset ::
                                   (Animation :< cls, Object :< cls) =>
                                   cls -> Int -> Int -> IO Float
audio_track_get_key_start_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_audio_track_get_key_start_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_get_key_start_offset"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Animation.audio_track_get_key_start_offset

{-# NOINLINE bindAnimation_audio_track_get_key_stream #-}

bindAnimation_audio_track_get_key_stream :: MethodBind
bindAnimation_audio_track_get_key_stream
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_get_key_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_get_key_stream ::
                             (Animation :< cls, Object :< cls) =>
                             cls -> Int -> Int -> IO Resource
audio_track_get_key_stream cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_audio_track_get_key_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_get_key_stream"
           '[Int, Int]
           (IO Resource)
         where
        nodeMethod = Godot.Core.Animation.audio_track_get_key_stream

{-# NOINLINE bindAnimation_audio_track_insert_key #-}

bindAnimation_audio_track_insert_key :: MethodBind
bindAnimation_audio_track_insert_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_insert_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_insert_key ::
                         (Animation :< cls, Object :< cls) =>
                         cls ->
                           Int -> Float -> Resource -> Maybe Float -> Maybe Float -> IO Int
audio_track_insert_key cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantReal (0)) toVariant arg4,
       maybe (VariantReal (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_audio_track_insert_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_insert_key"
           '[Int, Float, Resource, Maybe Float, Maybe Float]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.audio_track_insert_key

{-# NOINLINE bindAnimation_audio_track_set_key_end_offset #-}

bindAnimation_audio_track_set_key_end_offset :: MethodBind
bindAnimation_audio_track_set_key_end_offset
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_set_key_end_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_set_key_end_offset ::
                                 (Animation :< cls, Object :< cls) =>
                                 cls -> Int -> Int -> Float -> IO ()
audio_track_set_key_end_offset cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_audio_track_set_key_end_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_set_key_end_offset"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.audio_track_set_key_end_offset

{-# NOINLINE bindAnimation_audio_track_set_key_start_offset #-}

bindAnimation_audio_track_set_key_start_offset :: MethodBind
bindAnimation_audio_track_set_key_start_offset
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_set_key_start_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_set_key_start_offset ::
                                   (Animation :< cls, Object :< cls) =>
                                   cls -> Int -> Int -> Float -> IO ()
audio_track_set_key_start_offset cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_audio_track_set_key_start_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_set_key_start_offset"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.audio_track_set_key_start_offset

{-# NOINLINE bindAnimation_audio_track_set_key_stream #-}

bindAnimation_audio_track_set_key_stream :: MethodBind
bindAnimation_audio_track_set_key_stream
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "audio_track_set_key_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

audio_track_set_key_stream ::
                             (Animation :< cls, Object :< cls) =>
                             cls -> Int -> Int -> Resource -> IO ()
audio_track_set_key_stream cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_audio_track_set_key_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "audio_track_set_key_stream"
           '[Int, Int, Resource]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.audio_track_set_key_stream

{-# NOINLINE bindAnimation_bezier_track_get_key_in_handle #-}

bindAnimation_bezier_track_get_key_in_handle :: MethodBind
bindAnimation_bezier_track_get_key_in_handle
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_get_key_in_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_get_key_in_handle ::
                                 (Animation :< cls, Object :< cls) =>
                                 cls -> Int -> Int -> IO Vector2
bezier_track_get_key_in_handle cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_bezier_track_get_key_in_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_get_key_in_handle"
           '[Int, Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Animation.bezier_track_get_key_in_handle

{-# NOINLINE bindAnimation_bezier_track_get_key_out_handle #-}

bindAnimation_bezier_track_get_key_out_handle :: MethodBind
bindAnimation_bezier_track_get_key_out_handle
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_get_key_out_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_get_key_out_handle ::
                                  (Animation :< cls, Object :< cls) =>
                                  cls -> Int -> Int -> IO Vector2
bezier_track_get_key_out_handle cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_bezier_track_get_key_out_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_get_key_out_handle"
           '[Int, Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Animation.bezier_track_get_key_out_handle

{-# NOINLINE bindAnimation_bezier_track_get_key_value #-}

bindAnimation_bezier_track_get_key_value :: MethodBind
bindAnimation_bezier_track_get_key_value
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_get_key_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_get_key_value ::
                             (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
bezier_track_get_key_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_bezier_track_get_key_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_get_key_value"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Animation.bezier_track_get_key_value

{-# NOINLINE bindAnimation_bezier_track_insert_key #-}

bindAnimation_bezier_track_insert_key :: MethodBind
bindAnimation_bezier_track_insert_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_insert_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_insert_key ::
                          (Animation :< cls, Object :< cls) =>
                          cls ->
                            Int -> Float -> Float -> Maybe Vector2 -> Maybe Vector2 -> IO Int
bezier_track_insert_key cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantVector2 (V2 0 0) arg4,
       defaultedVariant VariantVector2 (V2 0 0) arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_bezier_track_insert_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_insert_key"
           '[Int, Float, Float, Maybe Vector2, Maybe Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.bezier_track_insert_key

{-# NOINLINE bindAnimation_bezier_track_interpolate #-}

bindAnimation_bezier_track_interpolate :: MethodBind
bindAnimation_bezier_track_interpolate
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_interpolate ::
                           (Animation :< cls, Object :< cls) =>
                           cls -> Int -> Float -> IO Float
bezier_track_interpolate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_bezier_track_interpolate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_interpolate"
           '[Int, Float]
           (IO Float)
         where
        nodeMethod = Godot.Core.Animation.bezier_track_interpolate

{-# NOINLINE bindAnimation_bezier_track_set_key_in_handle #-}

bindAnimation_bezier_track_set_key_in_handle :: MethodBind
bindAnimation_bezier_track_set_key_in_handle
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_set_key_in_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_set_key_in_handle ::
                                 (Animation :< cls, Object :< cls) =>
                                 cls -> Int -> Int -> Vector2 -> IO ()
bezier_track_set_key_in_handle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_bezier_track_set_key_in_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_set_key_in_handle"
           '[Int, Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.bezier_track_set_key_in_handle

{-# NOINLINE bindAnimation_bezier_track_set_key_out_handle #-}

bindAnimation_bezier_track_set_key_out_handle :: MethodBind
bindAnimation_bezier_track_set_key_out_handle
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_set_key_out_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_set_key_out_handle ::
                                  (Animation :< cls, Object :< cls) =>
                                  cls -> Int -> Int -> Vector2 -> IO ()
bezier_track_set_key_out_handle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_bezier_track_set_key_out_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_set_key_out_handle"
           '[Int, Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.bezier_track_set_key_out_handle

{-# NOINLINE bindAnimation_bezier_track_set_key_value #-}

bindAnimation_bezier_track_set_key_value :: MethodBind
bindAnimation_bezier_track_set_key_value
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "bezier_track_set_key_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bezier_track_set_key_value ::
                             (Animation :< cls, Object :< cls) =>
                             cls -> Int -> Int -> Float -> IO ()
bezier_track_set_key_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_bezier_track_set_key_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "bezier_track_set_key_value"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.bezier_track_set_key_value

{-# NOINLINE bindAnimation_clear #-}

-- | Clear the animation (clear all tracks and reset all).
bindAnimation_clear :: MethodBind
bindAnimation_clear
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the animation (clear all tracks and reset all).
clear :: (Animation :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.Animation.clear

{-# NOINLINE bindAnimation_copy_track #-}

-- | Adds a new track that is a copy of the given track from @to_animation@.
bindAnimation_copy_track :: MethodBind
bindAnimation_copy_track
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "copy_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new track that is a copy of the given track from @to_animation@.
copy_track ::
             (Animation :< cls, Object :< cls) =>
             cls -> Int -> Animation -> IO ()
copy_track cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_copy_track (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "copy_track" '[Int, Animation]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.copy_track

{-# NOINLINE bindAnimation_find_track #-}

-- | Returns the index of the specified track. If the track is not found, return -1.
bindAnimation_find_track :: MethodBind
bindAnimation_find_track
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "find_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the specified track. If the track is not found, return -1.
find_track ::
             (Animation :< cls, Object :< cls) => cls -> NodePath -> IO Int
find_track cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_find_track (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "find_track" '[NodePath] (IO Int)
         where
        nodeMethod = Godot.Core.Animation.find_track

{-# NOINLINE bindAnimation_get_length #-}

-- | The total length of the animation (in seconds).
--   			__Note:__ Length is not delimited by the last key, as this one may be before or after the end to ensure correct interpolation and looping.
bindAnimation_get_length :: MethodBind
bindAnimation_get_length
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The total length of the animation (in seconds).
--   			__Note:__ Length is not delimited by the last key, as this one may be before or after the end to ensure correct interpolation and looping.
get_length :: (Animation :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_get_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "get_length" '[] (IO Float) where
        nodeMethod = Godot.Core.Animation.get_length

{-# NOINLINE bindAnimation_get_step #-}

-- | The animation step value.
bindAnimation_get_step :: MethodBind
bindAnimation_get_step
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The animation step value.
get_step :: (Animation :< cls, Object :< cls) => cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_get_step (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "get_step" '[] (IO Float) where
        nodeMethod = Godot.Core.Animation.get_step

{-# NOINLINE bindAnimation_get_track_count #-}

-- | Returns the amount of tracks in the animation.
bindAnimation_get_track_count :: MethodBind
bindAnimation_get_track_count
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "get_track_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of tracks in the animation.
get_track_count ::
                  (Animation :< cls, Object :< cls) => cls -> IO Int
get_track_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_get_track_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "get_track_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Animation.get_track_count

{-# NOINLINE bindAnimation_has_loop #-}

-- | A flag indicating that the animation must loop. This is uses for correct interpolation of animation cycles, and for hinting the player that it must restart the animation.
bindAnimation_has_loop :: MethodBind
bindAnimation_has_loop
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "has_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A flag indicating that the animation must loop. This is uses for correct interpolation of animation cycles, and for hinting the player that it must restart the animation.
has_loop :: (Animation :< cls, Object :< cls) => cls -> IO Bool
has_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_has_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "has_loop" '[] (IO Bool) where
        nodeMethod = Godot.Core.Animation.has_loop

{-# NOINLINE bindAnimation_method_track_get_key_indices #-}

-- | Returns all the key indices of a method track, given a position and delta time.
bindAnimation_method_track_get_key_indices :: MethodBind
bindAnimation_method_track_get_key_indices
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "method_track_get_key_indices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the key indices of a method track, given a position and delta time.
method_track_get_key_indices ::
                               (Animation :< cls, Object :< cls) =>
                               cls -> Int -> Float -> Float -> IO PoolIntArray
method_track_get_key_indices cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_method_track_get_key_indices
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "method_track_get_key_indices"
           '[Int, Float, Float]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.Animation.method_track_get_key_indices

{-# NOINLINE bindAnimation_method_track_get_name #-}

-- | Returns the method name of a method track.
bindAnimation_method_track_get_name :: MethodBind
bindAnimation_method_track_get_name
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "method_track_get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the method name of a method track.
method_track_get_name ::
                        (Animation :< cls, Object :< cls) =>
                        cls -> Int -> Int -> IO GodotString
method_track_get_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_method_track_get_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "method_track_get_name" '[Int, Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Animation.method_track_get_name

{-# NOINLINE bindAnimation_method_track_get_params #-}

-- | Returns the arguments values to be called on a method track for a given key in a given track.
bindAnimation_method_track_get_params :: MethodBind
bindAnimation_method_track_get_params
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "method_track_get_params" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the arguments values to be called on a method track for a given key in a given track.
method_track_get_params ::
                          (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO Array
method_track_get_params cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_method_track_get_params
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "method_track_get_params" '[Int, Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.Animation.method_track_get_params

{-# NOINLINE bindAnimation_remove_track #-}

-- | Removes a track by specifying the track index.
bindAnimation_remove_track :: MethodBind
bindAnimation_remove_track
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "remove_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a track by specifying the track index.
remove_track ::
               (Animation :< cls, Object :< cls) => cls -> Int -> IO ()
remove_track cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_remove_track (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "remove_track" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Animation.remove_track

{-# NOINLINE bindAnimation_set_length #-}

-- | The total length of the animation (in seconds).
--   			__Note:__ Length is not delimited by the last key, as this one may be before or after the end to ensure correct interpolation and looping.
bindAnimation_set_length :: MethodBind
bindAnimation_set_length
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The total length of the animation (in seconds).
--   			__Note:__ Length is not delimited by the last key, as this one may be before or after the end to ensure correct interpolation and looping.
set_length ::
             (Animation :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_set_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "set_length" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Animation.set_length

{-# NOINLINE bindAnimation_set_loop #-}

-- | A flag indicating that the animation must loop. This is uses for correct interpolation of animation cycles, and for hinting the player that it must restart the animation.
bindAnimation_set_loop :: MethodBind
bindAnimation_set_loop
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "set_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A flag indicating that the animation must loop. This is uses for correct interpolation of animation cycles, and for hinting the player that it must restart the animation.
set_loop ::
           (Animation :< cls, Object :< cls) => cls -> Bool -> IO ()
set_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_set_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "set_loop" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Animation.set_loop

{-# NOINLINE bindAnimation_set_step #-}

-- | The animation step value.
bindAnimation_set_step :: MethodBind
bindAnimation_set_step
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "set_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The animation step value.
set_step ::
           (Animation :< cls, Object :< cls) => cls -> Float -> IO ()
set_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_set_step (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "set_step" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Animation.set_step

{-# NOINLINE bindAnimation_track_find_key #-}

-- | Finds the key index by time in a given track. Optionally, only find it if the exact time is given.
bindAnimation_track_find_key :: MethodBind
bindAnimation_track_find_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_find_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Finds the key index by time in a given track. Optionally, only find it if the exact time is given.
track_find_key ::
                 (Animation :< cls, Object :< cls) =>
                 cls -> Int -> Float -> Maybe Bool -> IO Int
track_find_key cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_find_key (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_find_key"
           '[Int, Float, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.track_find_key

{-# NOINLINE bindAnimation_track_get_interpolation_loop_wrap #-}

-- | Returns @true@ if the track at @idx@ wraps the interpolation loop. New tracks wrap the interpolation loop by default.
bindAnimation_track_get_interpolation_loop_wrap :: MethodBind
bindAnimation_track_get_interpolation_loop_wrap
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_interpolation_loop_wrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the track at @idx@ wraps the interpolation loop. New tracks wrap the interpolation loop by default.
track_get_interpolation_loop_wrap ::
                                    (Animation :< cls, Object :< cls) => cls -> Int -> IO Bool
track_get_interpolation_loop_wrap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_track_get_interpolation_loop_wrap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_interpolation_loop_wrap"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Animation.track_get_interpolation_loop_wrap

{-# NOINLINE bindAnimation_track_get_interpolation_type #-}

-- | Returns the interpolation type of a given track.
bindAnimation_track_get_interpolation_type :: MethodBind
bindAnimation_track_get_interpolation_type
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_interpolation_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the interpolation type of a given track.
track_get_interpolation_type ::
                               (Animation :< cls, Object :< cls) => cls -> Int -> IO Int
track_get_interpolation_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_interpolation_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_interpolation_type" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.track_get_interpolation_type

{-# NOINLINE bindAnimation_track_get_key_count #-}

-- | Returns the amount of keys in a given track.
bindAnimation_track_get_key_count :: MethodBind
bindAnimation_track_get_key_count
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_key_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of keys in a given track.
track_get_key_count ::
                      (Animation :< cls, Object :< cls) => cls -> Int -> IO Int
track_get_key_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_key_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_key_count" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.Animation.track_get_key_count

{-# NOINLINE bindAnimation_track_get_key_time #-}

-- | Returns the time at which the key is located.
bindAnimation_track_get_key_time :: MethodBind
bindAnimation_track_get_key_time
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_key_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the time at which the key is located.
track_get_key_time ::
                     (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
track_get_key_time cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_key_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_key_time" '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Animation.track_get_key_time

{-# NOINLINE bindAnimation_track_get_key_transition #-}

-- | Returns the transition curve (easing) for a specific key (see the built-in math function @method @GDScript.ease@).
bindAnimation_track_get_key_transition :: MethodBind
bindAnimation_track_get_key_transition
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_key_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transition curve (easing) for a specific key (see the built-in math function @method @GDScript.ease@).
track_get_key_transition ::
                           (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
track_get_key_transition cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_key_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_key_transition"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.Animation.track_get_key_transition

{-# NOINLINE bindAnimation_track_get_key_value #-}

-- | Returns the value of a given key in a given track.
bindAnimation_track_get_key_value :: MethodBind
bindAnimation_track_get_key_value
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_key_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a given key in a given track.
track_get_key_value ::
                      (Animation :< cls, Object :< cls) =>
                      cls -> Int -> Int -> IO GodotVariant
track_get_key_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_key_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_key_value" '[Int, Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Animation.track_get_key_value

{-# NOINLINE bindAnimation_track_get_path #-}

-- | Gets the path of a track. For more information on the path format, see @method track_set_path@.
bindAnimation_track_get_path :: MethodBind
bindAnimation_track_get_path
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the path of a track. For more information on the path format, see @method track_set_path@.
track_get_path ::
                 (Animation :< cls, Object :< cls) => cls -> Int -> IO NodePath
track_get_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_path" '[Int] (IO NodePath)
         where
        nodeMethod = Godot.Core.Animation.track_get_path

{-# NOINLINE bindAnimation_track_get_type #-}

-- | Gets the type of a track.
bindAnimation_track_get_type :: MethodBind
bindAnimation_track_get_type
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the type of a track.
track_get_type ::
                 (Animation :< cls, Object :< cls) => cls -> Int -> IO Int
track_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_get_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_get_type" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.Animation.track_get_type

{-# NOINLINE bindAnimation_track_insert_key #-}

-- | Insert a generic key in a given track.
bindAnimation_track_insert_key :: MethodBind
bindAnimation_track_insert_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_insert_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Insert a generic key in a given track.
track_insert_key ::
                   (Animation :< cls, Object :< cls) =>
                   cls -> Int -> Float -> GodotVariant -> Maybe Float -> IO ()
track_insert_key cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantReal (1)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_insert_key (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_insert_key"
           '[Int, Float, GodotVariant, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_insert_key

{-# NOINLINE bindAnimation_track_is_enabled #-}

-- | Returns @true@ if the track at index @idx@ is enabled.
bindAnimation_track_is_enabled :: MethodBind
bindAnimation_track_is_enabled
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the track at index @idx@ is enabled.
track_is_enabled ::
                   (Animation :< cls, Object :< cls) => cls -> Int -> IO Bool
track_is_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_is_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_is_enabled" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Animation.track_is_enabled

{-# NOINLINE bindAnimation_track_is_imported #-}

-- | Returns @true@ if the given track is imported. Else, return @false@.
bindAnimation_track_is_imported :: MethodBind
bindAnimation_track_is_imported
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_is_imported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given track is imported. Else, return @false@.
track_is_imported ::
                    (Animation :< cls, Object :< cls) => cls -> Int -> IO Bool
track_is_imported cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_is_imported (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_is_imported" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Animation.track_is_imported

{-# NOINLINE bindAnimation_track_move_down #-}

-- | Moves a track down.
bindAnimation_track_move_down :: MethodBind
bindAnimation_track_move_down
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_move_down" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves a track down.
track_move_down ::
                  (Animation :< cls, Object :< cls) => cls -> Int -> IO ()
track_move_down cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_move_down (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_move_down" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_move_down

{-# NOINLINE bindAnimation_track_move_to #-}

-- | Changes the index position of track @idx@ to the one defined in @to_idx@.
bindAnimation_track_move_to :: MethodBind
bindAnimation_track_move_to
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_move_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the index position of track @idx@ to the one defined in @to_idx@.
track_move_to ::
                (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
track_move_to cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_move_to (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_move_to" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_move_to

{-# NOINLINE bindAnimation_track_move_up #-}

-- | Moves a track up.
bindAnimation_track_move_up :: MethodBind
bindAnimation_track_move_up
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_move_up" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves a track up.
track_move_up ::
                (Animation :< cls, Object :< cls) => cls -> Int -> IO ()
track_move_up cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_move_up (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_move_up" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Animation.track_move_up

{-# NOINLINE bindAnimation_track_remove_key #-}

-- | Removes a key by index in a given track.
bindAnimation_track_remove_key :: MethodBind
bindAnimation_track_remove_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_remove_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a key by index in a given track.
track_remove_key ::
                   (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
track_remove_key cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_remove_key (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_remove_key" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_remove_key

{-# NOINLINE bindAnimation_track_remove_key_at_position #-}

-- | Removes a key by position (seconds) in a given track.
bindAnimation_track_remove_key_at_position :: MethodBind
bindAnimation_track_remove_key_at_position
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_remove_key_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a key by position (seconds) in a given track.
track_remove_key_at_position ::
                               (Animation :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
track_remove_key_at_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_remove_key_at_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_remove_key_at_position"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_remove_key_at_position

{-# NOINLINE bindAnimation_track_set_enabled #-}

-- | Enables/disables the given track. Tracks are enabled by default.
bindAnimation_track_set_enabled :: MethodBind
bindAnimation_track_set_enabled
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables/disables the given track. Tracks are enabled by default.
track_set_enabled ::
                    (Animation :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
track_set_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_enabled" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_enabled

{-# NOINLINE bindAnimation_track_set_imported #-}

-- | Sets the given track as imported or not.
bindAnimation_track_set_imported :: MethodBind
bindAnimation_track_set_imported
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_imported" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given track as imported or not.
track_set_imported ::
                     (Animation :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
track_set_imported cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_imported
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_imported" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_imported

{-# NOINLINE bindAnimation_track_set_interpolation_loop_wrap #-}

-- | If @true@, the track at @idx@ wraps the interpolation loop.
bindAnimation_track_set_interpolation_loop_wrap :: MethodBind
bindAnimation_track_set_interpolation_loop_wrap
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_interpolation_loop_wrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the track at @idx@ wraps the interpolation loop.
track_set_interpolation_loop_wrap ::
                                    (Animation :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
track_set_interpolation_loop_wrap cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimation_track_set_interpolation_loop_wrap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_interpolation_loop_wrap"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_interpolation_loop_wrap

{-# NOINLINE bindAnimation_track_set_interpolation_type #-}

-- | Sets the interpolation type of a given track.
bindAnimation_track_set_interpolation_type :: MethodBind
bindAnimation_track_set_interpolation_type
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_interpolation_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the interpolation type of a given track.
track_set_interpolation_type ::
                               (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
track_set_interpolation_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_interpolation_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_interpolation_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_interpolation_type

{-# NOINLINE bindAnimation_track_set_key_time #-}

-- | Sets the time of an existing key.
bindAnimation_track_set_key_time :: MethodBind
bindAnimation_track_set_key_time
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_key_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time of an existing key.
track_set_key_time ::
                     (Animation :< cls, Object :< cls) =>
                     cls -> Int -> Int -> Float -> IO ()
track_set_key_time cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_key_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_key_time"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_key_time

{-# NOINLINE bindAnimation_track_set_key_transition #-}

-- | Sets the transition curve (easing) for a specific key (see the built-in math function @method @GDScript.ease@).
bindAnimation_track_set_key_transition :: MethodBind
bindAnimation_track_set_key_transition
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_key_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transition curve (easing) for a specific key (see the built-in math function @method @GDScript.ease@).
track_set_key_transition ::
                           (Animation :< cls, Object :< cls) =>
                           cls -> Int -> Int -> Float -> IO ()
track_set_key_transition cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_key_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_key_transition"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_key_transition

{-# NOINLINE bindAnimation_track_set_key_value #-}

-- | Sets the value of an existing key.
bindAnimation_track_set_key_value :: MethodBind
bindAnimation_track_set_key_value
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_key_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of an existing key.
track_set_key_value ::
                      (Animation :< cls, Object :< cls) =>
                      cls -> Int -> Int -> GodotVariant -> IO ()
track_set_key_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_key_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_key_value"
           '[Int, Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_key_value

{-# NOINLINE bindAnimation_track_set_path #-}

-- | Sets the path of a track. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. Tracks that control properties or bones must append their name after the path, separated by @":"@.
--   				For example, @"character/skeleton:ankle"@ or @"character/mesh:transform/local"@.
bindAnimation_track_set_path :: MethodBind
bindAnimation_track_set_path
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_set_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the path of a track. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. Tracks that control properties or bones must append their name after the path, separated by @":"@.
--   				For example, @"character/skeleton:ankle"@ or @"character/mesh:transform/local"@.
track_set_path ::
                 (Animation :< cls, Object :< cls) =>
                 cls -> Int -> NodePath -> IO ()
track_set_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_set_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_set_path" '[Int, NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_set_path

{-# NOINLINE bindAnimation_track_swap #-}

-- | Swaps the track @idx@'s index position with the track @with_idx@.
bindAnimation_track_swap :: MethodBind
bindAnimation_track_swap
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "track_swap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Swaps the track @idx@'s index position with the track @with_idx@.
track_swap ::
             (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
track_swap cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_track_swap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "track_swap" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.Animation.track_swap

{-# NOINLINE bindAnimation_transform_track_insert_key #-}

-- | Insert a transform key for a transform track.
bindAnimation_transform_track_insert_key :: MethodBind
bindAnimation_transform_track_insert_key
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "transform_track_insert_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Insert a transform key for a transform track.
transform_track_insert_key ::
                             (Animation :< cls, Object :< cls) =>
                             cls -> Int -> Float -> Vector3 -> Quat -> Vector3 -> IO Int
transform_track_insert_key cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_transform_track_insert_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "transform_track_insert_key"
           '[Int, Float, Vector3, Quat, Vector3]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.transform_track_insert_key

{-# NOINLINE bindAnimation_transform_track_interpolate #-}

-- | Returns the interpolated value of a transform track at a given time (in seconds). An array consisting of 3 elements: position (@Vector3@), rotation (@Quat@) and scale (@Vector3@).
bindAnimation_transform_track_interpolate :: MethodBind
bindAnimation_transform_track_interpolate
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "transform_track_interpolate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the interpolated value of a transform track at a given time (in seconds). An array consisting of 3 elements: position (@Vector3@), rotation (@Quat@) and scale (@Vector3@).
transform_track_interpolate ::
                              (Animation :< cls, Object :< cls) =>
                              cls -> Int -> Float -> IO Array
transform_track_interpolate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_transform_track_interpolate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "transform_track_interpolate"
           '[Int, Float]
           (IO Array)
         where
        nodeMethod = Godot.Core.Animation.transform_track_interpolate

{-# NOINLINE bindAnimation_value_track_get_key_indices #-}

-- | Returns all the key indices of a value track, given a position and delta time.
bindAnimation_value_track_get_key_indices :: MethodBind
bindAnimation_value_track_get_key_indices
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "value_track_get_key_indices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the key indices of a value track, given a position and delta time.
value_track_get_key_indices ::
                              (Animation :< cls, Object :< cls) =>
                              cls -> Int -> Float -> Float -> IO PoolIntArray
value_track_get_key_indices cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_value_track_get_key_indices
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "value_track_get_key_indices"
           '[Int, Float, Float]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.Animation.value_track_get_key_indices

{-# NOINLINE bindAnimation_value_track_get_update_mode #-}

-- | Returns the update mode of a value track.
bindAnimation_value_track_get_update_mode :: MethodBind
bindAnimation_value_track_get_update_mode
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "value_track_get_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the update mode of a value track.
value_track_get_update_mode ::
                              (Animation :< cls, Object :< cls) => cls -> Int -> IO Int
value_track_get_update_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_value_track_get_update_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "value_track_get_update_mode" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Animation.value_track_get_update_mode

{-# NOINLINE bindAnimation_value_track_set_update_mode #-}

-- | Sets the update mode (see @enum UpdateMode@) of a value track.
bindAnimation_value_track_set_update_mode :: MethodBind
bindAnimation_value_track_set_update_mode
  = unsafePerformIO $
      withCString "Animation" $
        \ clsNamePtr ->
          withCString "value_track_set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the update mode (see @enum UpdateMode@) of a value track.
value_track_set_update_mode ::
                              (Animation :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
value_track_set_update_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimation_value_track_set_update_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Animation "value_track_set_update_mode"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Animation.value_track_set_update_mode