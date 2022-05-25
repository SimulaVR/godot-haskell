{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamPlayer3D
       (Godot.Core.AudioStreamPlayer3D._ATTENUATION_LOGARITHMIC,
        Godot.Core.AudioStreamPlayer3D._ATTENUATION_INVERSE_SQUARE_DISTANCE,
        Godot.Core.AudioStreamPlayer3D._OUT_OF_RANGE_PAUSE,
        Godot.Core.AudioStreamPlayer3D._ATTENUATION_INVERSE_DISTANCE,
        Godot.Core.AudioStreamPlayer3D._OUT_OF_RANGE_MIX,
        Godot.Core.AudioStreamPlayer3D._DOPPLER_TRACKING_IDLE_STEP,
        Godot.Core.AudioStreamPlayer3D._ATTENUATION_DISABLED,
        Godot.Core.AudioStreamPlayer3D._DOPPLER_TRACKING_PHYSICS_STEP,
        Godot.Core.AudioStreamPlayer3D._DOPPLER_TRACKING_DISABLED,
        Godot.Core.AudioStreamPlayer3D.sig_finished,
        Godot.Core.AudioStreamPlayer3D._bus_layout_changed,
        Godot.Core.AudioStreamPlayer3D._is_active,
        Godot.Core.AudioStreamPlayer3D._set_playing,
        Godot.Core.AudioStreamPlayer3D.get_area_mask,
        Godot.Core.AudioStreamPlayer3D.get_attenuation_filter_cutoff_hz,
        Godot.Core.AudioStreamPlayer3D.get_attenuation_filter_db,
        Godot.Core.AudioStreamPlayer3D.get_attenuation_model,
        Godot.Core.AudioStreamPlayer3D.get_bus,
        Godot.Core.AudioStreamPlayer3D.get_doppler_tracking,
        Godot.Core.AudioStreamPlayer3D.get_emission_angle,
        Godot.Core.AudioStreamPlayer3D.get_emission_angle_filter_attenuation_db,
        Godot.Core.AudioStreamPlayer3D.get_max_db,
        Godot.Core.AudioStreamPlayer3D.get_max_distance,
        Godot.Core.AudioStreamPlayer3D.get_out_of_range_mode,
        Godot.Core.AudioStreamPlayer3D.get_pitch_scale,
        Godot.Core.AudioStreamPlayer3D.get_playback_position,
        Godot.Core.AudioStreamPlayer3D.get_stream,
        Godot.Core.AudioStreamPlayer3D.get_stream_paused,
        Godot.Core.AudioStreamPlayer3D.get_stream_playback,
        Godot.Core.AudioStreamPlayer3D.get_unit_db,
        Godot.Core.AudioStreamPlayer3D.get_unit_size,
        Godot.Core.AudioStreamPlayer3D.is_autoplay_enabled,
        Godot.Core.AudioStreamPlayer3D.is_emission_angle_enabled,
        Godot.Core.AudioStreamPlayer3D.is_playing,
        Godot.Core.AudioStreamPlayer3D.play,
        Godot.Core.AudioStreamPlayer3D.seek,
        Godot.Core.AudioStreamPlayer3D.set_area_mask,
        Godot.Core.AudioStreamPlayer3D.set_attenuation_filter_cutoff_hz,
        Godot.Core.AudioStreamPlayer3D.set_attenuation_filter_db,
        Godot.Core.AudioStreamPlayer3D.set_attenuation_model,
        Godot.Core.AudioStreamPlayer3D.set_autoplay,
        Godot.Core.AudioStreamPlayer3D.set_bus,
        Godot.Core.AudioStreamPlayer3D.set_doppler_tracking,
        Godot.Core.AudioStreamPlayer3D.set_emission_angle,
        Godot.Core.AudioStreamPlayer3D.set_emission_angle_enabled,
        Godot.Core.AudioStreamPlayer3D.set_emission_angle_filter_attenuation_db,
        Godot.Core.AudioStreamPlayer3D.set_max_db,
        Godot.Core.AudioStreamPlayer3D.set_max_distance,
        Godot.Core.AudioStreamPlayer3D.set_out_of_range_mode,
        Godot.Core.AudioStreamPlayer3D.set_pitch_scale,
        Godot.Core.AudioStreamPlayer3D.set_stream,
        Godot.Core.AudioStreamPlayer3D.set_stream_paused,
        Godot.Core.AudioStreamPlayer3D.set_unit_db,
        Godot.Core.AudioStreamPlayer3D.set_unit_size,
        Godot.Core.AudioStreamPlayer3D.stop)
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
import Godot.Core.Spatial()

_ATTENUATION_LOGARITHMIC :: Int
_ATTENUATION_LOGARITHMIC = 2

_ATTENUATION_INVERSE_SQUARE_DISTANCE :: Int
_ATTENUATION_INVERSE_SQUARE_DISTANCE = 1

_OUT_OF_RANGE_PAUSE :: Int
_OUT_OF_RANGE_PAUSE = 1

_ATTENUATION_INVERSE_DISTANCE :: Int
_ATTENUATION_INVERSE_DISTANCE = 0

_OUT_OF_RANGE_MIX :: Int
_OUT_OF_RANGE_MIX = 0

_DOPPLER_TRACKING_IDLE_STEP :: Int
_DOPPLER_TRACKING_IDLE_STEP = 1

_ATTENUATION_DISABLED :: Int
_ATTENUATION_DISABLED = 3

_DOPPLER_TRACKING_PHYSICS_STEP :: Int
_DOPPLER_TRACKING_PHYSICS_STEP = 2

_DOPPLER_TRACKING_DISABLED :: Int
_DOPPLER_TRACKING_DISABLED = 0

-- | Emitted when the audio stops playing.
sig_finished :: Godot.Internal.Dispatch.Signal AudioStreamPlayer3D
sig_finished = Godot.Internal.Dispatch.Signal "finished"

instance NodeSignal AudioStreamPlayer3D "finished" '[]

instance NodeProperty AudioStreamPlayer3D "area_mask" Int 'False
         where
        nodeProperty
          = (get_area_mask, wrapDroppingSetter set_area_mask, Nothing)

instance NodeProperty AudioStreamPlayer3D
           "attenuation_filter_cutoff_hz"
           Float
           'False
         where
        nodeProperty
          = (get_attenuation_filter_cutoff_hz,
             wrapDroppingSetter set_attenuation_filter_cutoff_hz, Nothing)

instance NodeProperty AudioStreamPlayer3D "attenuation_filter_db"
           Float
           'False
         where
        nodeProperty
          = (get_attenuation_filter_db,
             wrapDroppingSetter set_attenuation_filter_db, Nothing)

instance NodeProperty AudioStreamPlayer3D "attenuation_model" Int
           'False
         where
        nodeProperty
          = (get_attenuation_model, wrapDroppingSetter set_attenuation_model,
             Nothing)

instance NodeProperty AudioStreamPlayer3D "autoplay" Bool 'False
         where
        nodeProperty
          = (is_autoplay_enabled, wrapDroppingSetter set_autoplay, Nothing)

instance NodeProperty AudioStreamPlayer3D "bus" GodotString 'False
         where
        nodeProperty = (get_bus, wrapDroppingSetter set_bus, Nothing)

instance NodeProperty AudioStreamPlayer3D "doppler_tracking" Int
           'False
         where
        nodeProperty
          = (get_doppler_tracking, wrapDroppingSetter set_doppler_tracking,
             Nothing)

instance NodeProperty AudioStreamPlayer3D "emission_angle_degrees"
           Float
           'False
         where
        nodeProperty
          = (get_emission_angle, wrapDroppingSetter set_emission_angle,
             Nothing)

instance NodeProperty AudioStreamPlayer3D "emission_angle_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_emission_angle_enabled,
             wrapDroppingSetter set_emission_angle_enabled, Nothing)

instance NodeProperty AudioStreamPlayer3D
           "emission_angle_filter_attenuation_db"
           Float
           'False
         where
        nodeProperty
          = (get_emission_angle_filter_attenuation_db,
             wrapDroppingSetter set_emission_angle_filter_attenuation_db,
             Nothing)

instance NodeProperty AudioStreamPlayer3D "max_db" Float 'False
         where
        nodeProperty = (get_max_db, wrapDroppingSetter set_max_db, Nothing)

instance NodeProperty AudioStreamPlayer3D "max_distance" Float
           'False
         where
        nodeProperty
          = (get_max_distance, wrapDroppingSetter set_max_distance, Nothing)

instance NodeProperty AudioStreamPlayer3D "out_of_range_mode" Int
           'False
         where
        nodeProperty
          = (get_out_of_range_mode, wrapDroppingSetter set_out_of_range_mode,
             Nothing)

instance NodeProperty AudioStreamPlayer3D "pitch_scale" Float
           'False
         where
        nodeProperty
          = (get_pitch_scale, wrapDroppingSetter set_pitch_scale, Nothing)

instance NodeProperty AudioStreamPlayer3D "playing" Bool 'False
         where
        nodeProperty
          = (is_playing, wrapDroppingSetter _set_playing, Nothing)

instance NodeProperty AudioStreamPlayer3D "stream" AudioStream
           'False
         where
        nodeProperty = (get_stream, wrapDroppingSetter set_stream, Nothing)

instance NodeProperty AudioStreamPlayer3D "stream_paused" Bool
           'False
         where
        nodeProperty
          = (get_stream_paused, wrapDroppingSetter set_stream_paused,
             Nothing)

instance NodeProperty AudioStreamPlayer3D "unit_db" Float 'False
         where
        nodeProperty
          = (get_unit_db, wrapDroppingSetter set_unit_db, Nothing)

instance NodeProperty AudioStreamPlayer3D "unit_size" Float 'False
         where
        nodeProperty
          = (get_unit_size, wrapDroppingSetter set_unit_size, Nothing)

{-# NOINLINE bindAudioStreamPlayer3D__bus_layout_changed #-}

bindAudioStreamPlayer3D__bus_layout_changed :: MethodBind
bindAudioStreamPlayer3D__bus_layout_changed
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "_bus_layout_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_bus_layout_changed ::
                      (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO ()
_bus_layout_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D__bus_layout_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "_bus_layout_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D._bus_layout_changed

{-# NOINLINE bindAudioStreamPlayer3D__is_active #-}

bindAudioStreamPlayer3D__is_active :: MethodBind
bindAudioStreamPlayer3D__is_active
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_active ::
             (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Bool
_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D__is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "_is_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D._is_active

{-# NOINLINE bindAudioStreamPlayer3D__set_playing #-}

-- | If @true@, audio is playing.
bindAudioStreamPlayer3D__set_playing :: MethodBind
bindAudioStreamPlayer3D__set_playing
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "_set_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is playing.
_set_playing ::
               (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_playing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D__set_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "_set_playing" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D._set_playing

{-# NOINLINE bindAudioStreamPlayer3D_get_area_mask #-}

-- | Areas in which this sound plays.
bindAudioStreamPlayer3D_get_area_mask :: MethodBind
bindAudioStreamPlayer3D_get_area_mask
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_area_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Areas in which this sound plays.
get_area_mask ::
                (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Int
get_area_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_area_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_area_mask" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_area_mask

{-# NOINLINE bindAudioStreamPlayer3D_get_attenuation_filter_cutoff_hz
             #-}

-- | Dampens audio above this frequency, in Hz.
bindAudioStreamPlayer3D_get_attenuation_filter_cutoff_hz ::
                                                         MethodBind
bindAudioStreamPlayer3D_get_attenuation_filter_cutoff_hz
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_attenuation_filter_cutoff_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dampens audio above this frequency, in Hz.
get_attenuation_filter_cutoff_hz ::
                                   (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_attenuation_filter_cutoff_hz cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_get_attenuation_filter_cutoff_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D
           "get_attenuation_filter_cutoff_hz"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.get_attenuation_filter_cutoff_hz

{-# NOINLINE bindAudioStreamPlayer3D_get_attenuation_filter_db #-}

-- | Amount how much the filter affects the loudness, in dB.
bindAudioStreamPlayer3D_get_attenuation_filter_db :: MethodBind
bindAudioStreamPlayer3D_get_attenuation_filter_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_attenuation_filter_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount how much the filter affects the loudness, in dB.
get_attenuation_filter_db ::
                            (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_attenuation_filter_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_get_attenuation_filter_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_attenuation_filter_db"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.get_attenuation_filter_db

{-# NOINLINE bindAudioStreamPlayer3D_get_attenuation_model #-}

-- | Decides if audio should get quieter with distance linearly, quadratically, logarithmically, or not be affected by distance, effectively disabling attenuation.
bindAudioStreamPlayer3D_get_attenuation_model :: MethodBind
bindAudioStreamPlayer3D_get_attenuation_model
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_attenuation_model" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decides if audio should get quieter with distance linearly, quadratically, logarithmically, or not be affected by distance, effectively disabling attenuation.
get_attenuation_model ::
                        (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Int
get_attenuation_model cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_get_attenuation_model
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_attenuation_model" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_attenuation_model

{-# NOINLINE bindAudioStreamPlayer3D_get_bus #-}

-- | Bus on which this audio is playing.
bindAudioStreamPlayer3D_get_bus :: MethodBind
bindAudioStreamPlayer3D_get_bus
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bus on which this audio is playing.
get_bus ::
          (AudioStreamPlayer3D :< cls, Object :< cls) =>
          cls -> IO GodotString
get_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_bus" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_bus

{-# NOINLINE bindAudioStreamPlayer3D_get_doppler_tracking #-}

-- | Decides in which step the Doppler effect should be calculated.
bindAudioStreamPlayer3D_get_doppler_tracking :: MethodBind
bindAudioStreamPlayer3D_get_doppler_tracking
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decides in which step the Doppler effect should be calculated.
get_doppler_tracking ::
                       (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Int
get_doppler_tracking cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_doppler_tracking
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_doppler_tracking" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_doppler_tracking

{-# NOINLINE bindAudioStreamPlayer3D_get_emission_angle #-}

-- | The angle in which the audio reaches cameras undampened.
bindAudioStreamPlayer3D_get_emission_angle :: MethodBind
bindAudioStreamPlayer3D_get_emission_angle
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_emission_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The angle in which the audio reaches cameras undampened.
get_emission_angle ::
                     (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_emission_angle cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_emission_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_emission_angle" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_emission_angle

{-# NOINLINE bindAudioStreamPlayer3D_get_emission_angle_filter_attenuation_db
             #-}

-- | Dampens audio if camera is outside of @emission_angle_degrees@ and @emission_angle_enabled@ is set by this factor, in dB.
bindAudioStreamPlayer3D_get_emission_angle_filter_attenuation_db ::
                                                                 MethodBind
bindAudioStreamPlayer3D_get_emission_angle_filter_attenuation_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_emission_angle_filter_attenuation_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dampens audio if camera is outside of @emission_angle_degrees@ and @emission_angle_enabled@ is set by this factor, in dB.
get_emission_angle_filter_attenuation_db ::
                                           (AudioStreamPlayer3D :< cls, Object :< cls) =>
                                           cls -> IO Float
get_emission_angle_filter_attenuation_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_get_emission_angle_filter_attenuation_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D
           "get_emission_angle_filter_attenuation_db"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.get_emission_angle_filter_attenuation_db

{-# NOINLINE bindAudioStreamPlayer3D_get_max_db #-}

-- | Sets the absolute maximum of the soundlevel, in dB.
bindAudioStreamPlayer3D_get_max_db :: MethodBind
bindAudioStreamPlayer3D_get_max_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_max_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the absolute maximum of the soundlevel, in dB.
get_max_db ::
             (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_max_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_max_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_max_db" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_max_db

{-# NOINLINE bindAudioStreamPlayer3D_get_max_distance #-}

-- | Sets the distance from which the @out_of_range_mode@ takes effect. Has no effect if set to 0.
bindAudioStreamPlayer3D_get_max_distance :: MethodBind
bindAudioStreamPlayer3D_get_max_distance
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the distance from which the @out_of_range_mode@ takes effect. Has no effect if set to 0.
get_max_distance ::
                   (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_max_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_max_distance

{-# NOINLINE bindAudioStreamPlayer3D_get_out_of_range_mode #-}

-- | Decides if audio should pause when source is outside of @max_distance@ range.
bindAudioStreamPlayer3D_get_out_of_range_mode :: MethodBind
bindAudioStreamPlayer3D_get_out_of_range_mode
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_out_of_range_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decides if audio should pause when source is outside of @max_distance@ range.
get_out_of_range_mode ::
                        (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Int
get_out_of_range_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_get_out_of_range_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_out_of_range_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_out_of_range_mode

{-# NOINLINE bindAudioStreamPlayer3D_get_pitch_scale #-}

-- | Changes the pitch and the tempo of the audio.
bindAudioStreamPlayer3D_get_pitch_scale :: MethodBind
bindAudioStreamPlayer3D_get_pitch_scale
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the pitch and the tempo of the audio.
get_pitch_scale ::
                  (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_pitch_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_pitch_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_pitch_scale

{-# NOINLINE bindAudioStreamPlayer3D_get_playback_position #-}

-- | Returns the position in the @AudioStream@.
bindAudioStreamPlayer3D_get_playback_position :: MethodBind
bindAudioStreamPlayer3D_get_playback_position
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_playback_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position in the @AudioStream@.
get_playback_position ::
                        (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_playback_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_get_playback_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_playback_position" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_playback_position

{-# NOINLINE bindAudioStreamPlayer3D_get_stream #-}

-- | The @AudioStream@ object to be played.
bindAudioStreamPlayer3D_get_stream :: MethodBind
bindAudioStreamPlayer3D_get_stream
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AudioStream@ object to be played.
get_stream ::
             (AudioStreamPlayer3D :< cls, Object :< cls) =>
             cls -> IO AudioStream
get_stream cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_stream" '[]
           (IO AudioStream)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_stream

{-# NOINLINE bindAudioStreamPlayer3D_get_stream_paused #-}

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
bindAudioStreamPlayer3D_get_stream_paused :: MethodBind
bindAudioStreamPlayer3D_get_stream_paused
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_stream_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
get_stream_paused ::
                    (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Bool
get_stream_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_stream_paused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_stream_paused" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_stream_paused

{-# NOINLINE bindAudioStreamPlayer3D_get_stream_playback #-}

-- | Returns the @AudioStreamPlayback@ object associated with this @AudioStreamPlayer3D@.
bindAudioStreamPlayer3D_get_stream_playback :: MethodBind
bindAudioStreamPlayer3D_get_stream_playback
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_stream_playback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AudioStreamPlayback@ object associated with this @AudioStreamPlayer3D@.
get_stream_playback ::
                      (AudioStreamPlayer3D :< cls, Object :< cls) =>
                      cls -> IO AudioStreamPlayback
get_stream_playback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_stream_playback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_stream_playback" '[]
           (IO AudioStreamPlayback)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_stream_playback

{-# NOINLINE bindAudioStreamPlayer3D_get_unit_db #-}

-- | Base sound level unaffected by dampening, in dB.
bindAudioStreamPlayer3D_get_unit_db :: MethodBind
bindAudioStreamPlayer3D_get_unit_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_unit_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base sound level unaffected by dampening, in dB.
get_unit_db ::
              (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_unit_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_unit_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_unit_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_unit_db

{-# NOINLINE bindAudioStreamPlayer3D_get_unit_size #-}

-- | Factor for the attenuation effect.
bindAudioStreamPlayer3D_get_unit_size :: MethodBind
bindAudioStreamPlayer3D_get_unit_size
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "get_unit_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Factor for the attenuation effect.
get_unit_size ::
                (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Float
get_unit_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_get_unit_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "get_unit_size" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.get_unit_size

{-# NOINLINE bindAudioStreamPlayer3D_is_autoplay_enabled #-}

-- | If @true@, audio plays when added to scene tree.
bindAudioStreamPlayer3D_is_autoplay_enabled :: MethodBind
bindAudioStreamPlayer3D_is_autoplay_enabled
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "is_autoplay_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio plays when added to scene tree.
is_autoplay_enabled ::
                      (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Bool
is_autoplay_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_is_autoplay_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "is_autoplay_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.is_autoplay_enabled

{-# NOINLINE bindAudioStreamPlayer3D_is_emission_angle_enabled #-}

-- | If @true@, the audio should be dampened according to the direction of the sound.
bindAudioStreamPlayer3D_is_emission_angle_enabled :: MethodBind
bindAudioStreamPlayer3D_is_emission_angle_enabled
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "is_emission_angle_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the audio should be dampened according to the direction of the sound.
is_emission_angle_enabled ::
                            (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Bool
is_emission_angle_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_is_emission_angle_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "is_emission_angle_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.is_emission_angle_enabled

{-# NOINLINE bindAudioStreamPlayer3D_is_playing #-}

-- | If @true@, audio is playing.
bindAudioStreamPlayer3D_is_playing :: MethodBind
bindAudioStreamPlayer3D_is_playing
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio is playing.
is_playing ::
             (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_is_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "is_playing" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.is_playing

{-# NOINLINE bindAudioStreamPlayer3D_play #-}

-- | Plays the audio from the given position @from_position@, in seconds.
bindAudioStreamPlayer3D_play :: MethodBind
bindAudioStreamPlayer3D_play
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays the audio from the given position @from_position@, in seconds.
play ::
       (AudioStreamPlayer3D :< cls, Object :< cls) =>
       cls -> Maybe Float -> IO ()
play cls arg1
  = withVariantArray [maybe (VariantReal (0)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_play (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "play" '[Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.play

{-# NOINLINE bindAudioStreamPlayer3D_seek #-}

-- | Sets the position from which audio will be played, in seconds.
bindAudioStreamPlayer3D_seek :: MethodBind
bindAudioStreamPlayer3D_seek
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position from which audio will be played, in seconds.
seek ::
       (AudioStreamPlayer3D :< cls, Object :< cls) =>
       cls -> Float -> IO ()
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_seek (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "seek" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.seek

{-# NOINLINE bindAudioStreamPlayer3D_set_area_mask #-}

-- | Areas in which this sound plays.
bindAudioStreamPlayer3D_set_area_mask :: MethodBind
bindAudioStreamPlayer3D_set_area_mask
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_area_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Areas in which this sound plays.
set_area_mask ::
                (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_area_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_area_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_area_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_area_mask

{-# NOINLINE bindAudioStreamPlayer3D_set_attenuation_filter_cutoff_hz
             #-}

-- | Dampens audio above this frequency, in Hz.
bindAudioStreamPlayer3D_set_attenuation_filter_cutoff_hz ::
                                                         MethodBind
bindAudioStreamPlayer3D_set_attenuation_filter_cutoff_hz
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_attenuation_filter_cutoff_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dampens audio above this frequency, in Hz.
set_attenuation_filter_cutoff_hz ::
                                   (AudioStreamPlayer3D :< cls, Object :< cls) =>
                                   cls -> Float -> IO ()
set_attenuation_filter_cutoff_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_set_attenuation_filter_cutoff_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D
           "set_attenuation_filter_cutoff_hz"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.set_attenuation_filter_cutoff_hz

{-# NOINLINE bindAudioStreamPlayer3D_set_attenuation_filter_db #-}

-- | Amount how much the filter affects the loudness, in dB.
bindAudioStreamPlayer3D_set_attenuation_filter_db :: MethodBind
bindAudioStreamPlayer3D_set_attenuation_filter_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_attenuation_filter_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount how much the filter affects the loudness, in dB.
set_attenuation_filter_db ::
                            (AudioStreamPlayer3D :< cls, Object :< cls) =>
                            cls -> Float -> IO ()
set_attenuation_filter_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_set_attenuation_filter_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_attenuation_filter_db"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.set_attenuation_filter_db

{-# NOINLINE bindAudioStreamPlayer3D_set_attenuation_model #-}

-- | Decides if audio should get quieter with distance linearly, quadratically, logarithmically, or not be affected by distance, effectively disabling attenuation.
bindAudioStreamPlayer3D_set_attenuation_model :: MethodBind
bindAudioStreamPlayer3D_set_attenuation_model
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_attenuation_model" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decides if audio should get quieter with distance linearly, quadratically, logarithmically, or not be affected by distance, effectively disabling attenuation.
set_attenuation_model ::
                        (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_attenuation_model cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_set_attenuation_model
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_attenuation_model"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_attenuation_model

{-# NOINLINE bindAudioStreamPlayer3D_set_autoplay #-}

-- | If @true@, audio plays when added to scene tree.
bindAudioStreamPlayer3D_set_autoplay :: MethodBind
bindAudioStreamPlayer3D_set_autoplay
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, audio plays when added to scene tree.
set_autoplay ::
               (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autoplay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_autoplay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_autoplay" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_autoplay

{-# NOINLINE bindAudioStreamPlayer3D_set_bus #-}

-- | Bus on which this audio is playing.
bindAudioStreamPlayer3D_set_bus :: MethodBind
bindAudioStreamPlayer3D_set_bus
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bus on which this audio is playing.
set_bus ::
          (AudioStreamPlayer3D :< cls, Object :< cls) =>
          cls -> GodotString -> IO ()
set_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_bus" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_bus

{-# NOINLINE bindAudioStreamPlayer3D_set_doppler_tracking #-}

-- | Decides in which step the Doppler effect should be calculated.
bindAudioStreamPlayer3D_set_doppler_tracking :: MethodBind
bindAudioStreamPlayer3D_set_doppler_tracking
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decides in which step the Doppler effect should be calculated.
set_doppler_tracking ::
                       (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_doppler_tracking cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_doppler_tracking
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_doppler_tracking"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_doppler_tracking

{-# NOINLINE bindAudioStreamPlayer3D_set_emission_angle #-}

-- | The angle in which the audio reaches cameras undampened.
bindAudioStreamPlayer3D_set_emission_angle :: MethodBind
bindAudioStreamPlayer3D_set_emission_angle
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_emission_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The angle in which the audio reaches cameras undampened.
set_emission_angle ::
                     (AudioStreamPlayer3D :< cls, Object :< cls) =>
                     cls -> Float -> IO ()
set_emission_angle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_emission_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_emission_angle"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_emission_angle

{-# NOINLINE bindAudioStreamPlayer3D_set_emission_angle_enabled #-}

-- | If @true@, the audio should be dampened according to the direction of the sound.
bindAudioStreamPlayer3D_set_emission_angle_enabled :: MethodBind
bindAudioStreamPlayer3D_set_emission_angle_enabled
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_emission_angle_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the audio should be dampened according to the direction of the sound.
set_emission_angle_enabled ::
                             (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emission_angle_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_set_emission_angle_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D
           "set_emission_angle_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.set_emission_angle_enabled

{-# NOINLINE bindAudioStreamPlayer3D_set_emission_angle_filter_attenuation_db
             #-}

-- | Dampens audio if camera is outside of @emission_angle_degrees@ and @emission_angle_enabled@ is set by this factor, in dB.
bindAudioStreamPlayer3D_set_emission_angle_filter_attenuation_db ::
                                                                 MethodBind
bindAudioStreamPlayer3D_set_emission_angle_filter_attenuation_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_emission_angle_filter_attenuation_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dampens audio if camera is outside of @emission_angle_degrees@ and @emission_angle_enabled@ is set by this factor, in dB.
set_emission_angle_filter_attenuation_db ::
                                           (AudioStreamPlayer3D :< cls, Object :< cls) =>
                                           cls -> Float -> IO ()
set_emission_angle_filter_attenuation_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_set_emission_angle_filter_attenuation_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D
           "set_emission_angle_filter_attenuation_db"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AudioStreamPlayer3D.set_emission_angle_filter_attenuation_db

{-# NOINLINE bindAudioStreamPlayer3D_set_max_db #-}

-- | Sets the absolute maximum of the soundlevel, in dB.
bindAudioStreamPlayer3D_set_max_db :: MethodBind
bindAudioStreamPlayer3D_set_max_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_max_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the absolute maximum of the soundlevel, in dB.
set_max_db ::
             (AudioStreamPlayer3D :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_max_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_max_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_max_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_max_db

{-# NOINLINE bindAudioStreamPlayer3D_set_max_distance #-}

-- | Sets the distance from which the @out_of_range_mode@ takes effect. Has no effect if set to 0.
bindAudioStreamPlayer3D_set_max_distance :: MethodBind
bindAudioStreamPlayer3D_set_max_distance
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the distance from which the @out_of_range_mode@ takes effect. Has no effect if set to 0.
set_max_distance ::
                   (AudioStreamPlayer3D :< cls, Object :< cls) =>
                   cls -> Float -> IO ()
set_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_max_distance" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_max_distance

{-# NOINLINE bindAudioStreamPlayer3D_set_out_of_range_mode #-}

-- | Decides if audio should pause when source is outside of @max_distance@ range.
bindAudioStreamPlayer3D_set_out_of_range_mode :: MethodBind
bindAudioStreamPlayer3D_set_out_of_range_mode
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_out_of_range_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decides if audio should pause when source is outside of @max_distance@ range.
set_out_of_range_mode ::
                        (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_out_of_range_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamPlayer3D_set_out_of_range_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_out_of_range_mode"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_out_of_range_mode

{-# NOINLINE bindAudioStreamPlayer3D_set_pitch_scale #-}

-- | Changes the pitch and the tempo of the audio.
bindAudioStreamPlayer3D_set_pitch_scale :: MethodBind
bindAudioStreamPlayer3D_set_pitch_scale
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_pitch_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the pitch and the tempo of the audio.
set_pitch_scale ::
                  (AudioStreamPlayer3D :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_pitch_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_pitch_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_pitch_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_pitch_scale

{-# NOINLINE bindAudioStreamPlayer3D_set_stream #-}

-- | The @AudioStream@ object to be played.
bindAudioStreamPlayer3D_set_stream :: MethodBind
bindAudioStreamPlayer3D_set_stream
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AudioStream@ object to be played.
set_stream ::
             (AudioStreamPlayer3D :< cls, Object :< cls) =>
             cls -> AudioStream -> IO ()
set_stream cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_stream" '[AudioStream]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_stream

{-# NOINLINE bindAudioStreamPlayer3D_set_stream_paused #-}

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
bindAudioStreamPlayer3D_set_stream_paused :: MethodBind
bindAudioStreamPlayer3D_set_stream_paused
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_stream_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the playback is paused. You can resume it by setting @stream_paused@ to @false@.
set_stream_paused ::
                    (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_stream_paused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_stream_paused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_stream_paused" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_stream_paused

{-# NOINLINE bindAudioStreamPlayer3D_set_unit_db #-}

-- | Base sound level unaffected by dampening, in dB.
bindAudioStreamPlayer3D_set_unit_db :: MethodBind
bindAudioStreamPlayer3D_set_unit_db
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_unit_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base sound level unaffected by dampening, in dB.
set_unit_db ::
              (AudioStreamPlayer3D :< cls, Object :< cls) =>
              cls -> Float -> IO ()
set_unit_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_unit_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_unit_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_unit_db

{-# NOINLINE bindAudioStreamPlayer3D_set_unit_size #-}

-- | Factor for the attenuation effect.
bindAudioStreamPlayer3D_set_unit_size :: MethodBind
bindAudioStreamPlayer3D_set_unit_size
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "set_unit_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Factor for the attenuation effect.
set_unit_size ::
                (AudioStreamPlayer3D :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_unit_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_set_unit_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "set_unit_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.set_unit_size

{-# NOINLINE bindAudioStreamPlayer3D_stop #-}

-- | Stops the audio.
bindAudioStreamPlayer3D_stop :: MethodBind
bindAudioStreamPlayer3D_stop
  = unsafePerformIO $
      withCString "AudioStreamPlayer3D" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the audio.
stop :: (AudioStreamPlayer3D :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamPlayer3D_stop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamPlayer3D "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.AudioStreamPlayer3D.stop