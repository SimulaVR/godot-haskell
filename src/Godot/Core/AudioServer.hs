{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioServer
       (Godot.Core.AudioServer._SPEAKER_SURROUND_71,
        Godot.Core.AudioServer._SPEAKER_SURROUND_31,
        Godot.Core.AudioServer._SPEAKER_MODE_STEREO,
        Godot.Core.AudioServer._SPEAKER_SURROUND_51,
        Godot.Core.AudioServer.sig_bus_layout_changed,
        Godot.Core.AudioServer.add_bus,
        Godot.Core.AudioServer.add_bus_effect,
        Godot.Core.AudioServer.capture_get_device,
        Godot.Core.AudioServer.capture_get_device_list,
        Godot.Core.AudioServer.capture_set_device,
        Godot.Core.AudioServer.generate_bus_layout,
        Godot.Core.AudioServer.get_bus_channels,
        Godot.Core.AudioServer.get_bus_count,
        Godot.Core.AudioServer.get_bus_effect,
        Godot.Core.AudioServer.get_bus_effect_count,
        Godot.Core.AudioServer.get_bus_effect_instance,
        Godot.Core.AudioServer.get_bus_index,
        Godot.Core.AudioServer.get_bus_name,
        Godot.Core.AudioServer.get_bus_peak_volume_left_db,
        Godot.Core.AudioServer.get_bus_peak_volume_right_db,
        Godot.Core.AudioServer.get_bus_send,
        Godot.Core.AudioServer.get_bus_volume_db,
        Godot.Core.AudioServer.get_device,
        Godot.Core.AudioServer.get_device_list,
        Godot.Core.AudioServer.get_global_rate_scale,
        Godot.Core.AudioServer.get_mix_rate,
        Godot.Core.AudioServer.get_output_latency,
        Godot.Core.AudioServer.get_speaker_mode,
        Godot.Core.AudioServer.get_time_since_last_mix,
        Godot.Core.AudioServer.get_time_to_next_mix,
        Godot.Core.AudioServer.is_bus_bypassing_effects,
        Godot.Core.AudioServer.is_bus_effect_enabled,
        Godot.Core.AudioServer.is_bus_mute,
        Godot.Core.AudioServer.is_bus_solo, Godot.Core.AudioServer.lock,
        Godot.Core.AudioServer.move_bus, Godot.Core.AudioServer.remove_bus,
        Godot.Core.AudioServer.remove_bus_effect,
        Godot.Core.AudioServer.set_bus_bypass_effects,
        Godot.Core.AudioServer.set_bus_count,
        Godot.Core.AudioServer.set_bus_effect_enabled,
        Godot.Core.AudioServer.set_bus_layout,
        Godot.Core.AudioServer.set_bus_mute,
        Godot.Core.AudioServer.set_bus_name,
        Godot.Core.AudioServer.set_bus_send,
        Godot.Core.AudioServer.set_bus_solo,
        Godot.Core.AudioServer.set_bus_volume_db,
        Godot.Core.AudioServer.set_device,
        Godot.Core.AudioServer.set_global_rate_scale,
        Godot.Core.AudioServer.swap_bus_effects,
        Godot.Core.AudioServer.unlock)
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
import Godot.Core.Object()

_SPEAKER_SURROUND_71 :: Int
_SPEAKER_SURROUND_71 = 3

_SPEAKER_SURROUND_31 :: Int
_SPEAKER_SURROUND_31 = 1

_SPEAKER_MODE_STEREO :: Int
_SPEAKER_MODE_STEREO = 0

_SPEAKER_SURROUND_51 :: Int
_SPEAKER_SURROUND_51 = 2

-- | Emitted when the @AudioBusLayout@ changes.
sig_bus_layout_changed ::
                       Godot.Internal.Dispatch.Signal AudioServer
sig_bus_layout_changed
  = Godot.Internal.Dispatch.Signal "bus_layout_changed"

instance NodeSignal AudioServer "bus_layout_changed" '[]

instance NodeProperty AudioServer "bus_count" Int 'False where
        nodeProperty
          = (get_bus_count, wrapDroppingSetter set_bus_count, Nothing)

instance NodeProperty AudioServer "device" GodotString 'False where
        nodeProperty = (get_device, wrapDroppingSetter set_device, Nothing)

instance NodeProperty AudioServer "global_rate_scale" Float 'False
         where
        nodeProperty
          = (get_global_rate_scale, wrapDroppingSetter set_global_rate_scale,
             Nothing)

{-# NOINLINE bindAudioServer_add_bus #-}

-- | Adds a bus at @at_position@.
bindAudioServer_add_bus :: MethodBind
bindAudioServer_add_bus
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "add_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a bus at @at_position@.
add_bus ::
          (AudioServer :< cls, Object :< cls) => cls -> Maybe Int -> IO ()
add_bus cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_add_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "add_bus" '[Maybe Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.add_bus

{-# NOINLINE bindAudioServer_add_bus_effect #-}

-- | Adds an @AudioEffect@ effect to the bus @bus_idx@ at @at_position@.
bindAudioServer_add_bus_effect :: MethodBind
bindAudioServer_add_bus_effect
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "add_bus_effect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an @AudioEffect@ effect to the bus @bus_idx@ at @at_position@.
add_bus_effect ::
                 (AudioServer :< cls, Object :< cls) =>
                 cls -> Int -> AudioEffect -> Maybe Int -> IO ()
add_bus_effect cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_add_bus_effect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "add_bus_effect"
           '[Int, AudioEffect, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.add_bus_effect

{-# NOINLINE bindAudioServer_capture_get_device #-}

-- | Name of the current device for audio input (see @method capture_get_device_list@).
bindAudioServer_capture_get_device :: MethodBind
bindAudioServer_capture_get_device
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "capture_get_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the current device for audio input (see @method capture_get_device_list@).
capture_get_device ::
                     (AudioServer :< cls, Object :< cls) => cls -> IO GodotString
capture_get_device cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_capture_get_device
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "capture_get_device" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioServer.capture_get_device

{-# NOINLINE bindAudioServer_capture_get_device_list #-}

-- | Returns the names of all audio input devices detected on the system.
bindAudioServer_capture_get_device_list :: MethodBind
bindAudioServer_capture_get_device_list
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "capture_get_device_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the names of all audio input devices detected on the system.
capture_get_device_list ::
                          (AudioServer :< cls, Object :< cls) => cls -> IO Array
capture_get_device_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_capture_get_device_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "capture_get_device_list" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.AudioServer.capture_get_device_list

{-# NOINLINE bindAudioServer_capture_set_device #-}

-- | Sets which audio input device is used for audio capture.
bindAudioServer_capture_set_device :: MethodBind
bindAudioServer_capture_set_device
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "capture_set_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets which audio input device is used for audio capture.
capture_set_device ::
                     (AudioServer :< cls, Object :< cls) => cls -> GodotString -> IO ()
capture_set_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_capture_set_device
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "capture_set_device" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.capture_set_device

{-# NOINLINE bindAudioServer_generate_bus_layout #-}

-- | Generates an @AudioBusLayout@ using the available buses and effects.
bindAudioServer_generate_bus_layout :: MethodBind
bindAudioServer_generate_bus_layout
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "generate_bus_layout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates an @AudioBusLayout@ using the available buses and effects.
generate_bus_layout ::
                      (AudioServer :< cls, Object :< cls) => cls -> IO AudioBusLayout
generate_bus_layout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_generate_bus_layout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "generate_bus_layout" '[]
           (IO AudioBusLayout)
         where
        nodeMethod = Godot.Core.AudioServer.generate_bus_layout

{-# NOINLINE bindAudioServer_get_bus_channels #-}

-- | Returns the amount of channels of the bus at index @bus_idx@.
bindAudioServer_get_bus_channels :: MethodBind
bindAudioServer_get_bus_channels
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_channels" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of channels of the bus at index @bus_idx@.
get_bus_channels ::
                   (AudioServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_bus_channels cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_channels
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_channels" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_channels

{-# NOINLINE bindAudioServer_get_bus_count #-}

-- | Number of available audio buses.
bindAudioServer_get_bus_count :: MethodBind
bindAudioServer_get_bus_count
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of available audio buses.
get_bus_count ::
                (AudioServer :< cls, Object :< cls) => cls -> IO Int
get_bus_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_count" '[] (IO Int) where
        nodeMethod = Godot.Core.AudioServer.get_bus_count

{-# NOINLINE bindAudioServer_get_bus_effect #-}

-- | Returns the @AudioEffect@ at position @effect_idx@ in bus @bus_idx@.
bindAudioServer_get_bus_effect :: MethodBind
bindAudioServer_get_bus_effect
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_effect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AudioEffect@ at position @effect_idx@ in bus @bus_idx@.
get_bus_effect ::
                 (AudioServer :< cls, Object :< cls) =>
                 cls -> Int -> Int -> IO AudioEffect
get_bus_effect cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_effect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_effect" '[Int, Int]
           (IO AudioEffect)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_effect

{-# NOINLINE bindAudioServer_get_bus_effect_count #-}

-- | Returns the number of effects on the bus at @bus_idx@.
bindAudioServer_get_bus_effect_count :: MethodBind
bindAudioServer_get_bus_effect_count
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_effect_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of effects on the bus at @bus_idx@.
get_bus_effect_count ::
                       (AudioServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_bus_effect_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_effect_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_effect_count" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_effect_count

{-# NOINLINE bindAudioServer_get_bus_effect_instance #-}

-- | Returns the @AudioEffectInstance@ assigned to the given bus and effect indices (and optionally channel).
bindAudioServer_get_bus_effect_instance :: MethodBind
bindAudioServer_get_bus_effect_instance
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_effect_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AudioEffectInstance@ assigned to the given bus and effect indices (and optionally channel).
get_bus_effect_instance ::
                          (AudioServer :< cls, Object :< cls) =>
                          cls -> Int -> Int -> Maybe Int -> IO AudioEffectInstance
get_bus_effect_instance cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_effect_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_effect_instance"
           '[Int, Int, Maybe Int]
           (IO AudioEffectInstance)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_effect_instance

{-# NOINLINE bindAudioServer_get_bus_index #-}

-- | Returns the index of the bus with the name @bus_name@.
bindAudioServer_get_bus_index :: MethodBind
bindAudioServer_get_bus_index
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the bus with the name @bus_name@.
get_bus_index ::
                (AudioServer :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_bus_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_index" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_index

{-# NOINLINE bindAudioServer_get_bus_name #-}

-- | Returns the name of the bus with the index @bus_idx@.
bindAudioServer_get_bus_name :: MethodBind
bindAudioServer_get_bus_name
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the bus with the index @bus_idx@.
get_bus_name ::
               (AudioServer :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_bus_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_name

{-# NOINLINE bindAudioServer_get_bus_peak_volume_left_db #-}

-- | Returns the peak volume of the left speaker at bus index @bus_idx@ and channel index @channel@.
bindAudioServer_get_bus_peak_volume_left_db :: MethodBind
bindAudioServer_get_bus_peak_volume_left_db
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_peak_volume_left_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peak volume of the left speaker at bus index @bus_idx@ and channel index @channel@.
get_bus_peak_volume_left_db ::
                              (AudioServer :< cls, Object :< cls) =>
                              cls -> Int -> Int -> IO Float
get_bus_peak_volume_left_db cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_peak_volume_left_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_peak_volume_left_db"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_peak_volume_left_db

{-# NOINLINE bindAudioServer_get_bus_peak_volume_right_db #-}

-- | Returns the peak volume of the right speaker at bus index @bus_idx@ and channel index @channel@.
bindAudioServer_get_bus_peak_volume_right_db :: MethodBind
bindAudioServer_get_bus_peak_volume_right_db
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_peak_volume_right_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peak volume of the right speaker at bus index @bus_idx@ and channel index @channel@.
get_bus_peak_volume_right_db ::
                               (AudioServer :< cls, Object :< cls) =>
                               cls -> Int -> Int -> IO Float
get_bus_peak_volume_right_db cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_peak_volume_right_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_peak_volume_right_db"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_peak_volume_right_db

{-# NOINLINE bindAudioServer_get_bus_send #-}

-- | Returns the name of the bus that the bus at index @bus_idx@ sends to.
bindAudioServer_get_bus_send :: MethodBind
bindAudioServer_get_bus_send
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_send" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the bus that the bus at index @bus_idx@ sends to.
get_bus_send ::
               (AudioServer :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_bus_send cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_send (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_send" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_send

{-# NOINLINE bindAudioServer_get_bus_volume_db #-}

-- | Returns the volume of the bus at index @bus_idx@ in dB.
bindAudioServer_get_bus_volume_db :: MethodBind
bindAudioServer_get_bus_volume_db
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_bus_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the volume of the bus at index @bus_idx@ in dB.
get_bus_volume_db ::
                    (AudioServer :< cls, Object :< cls) => cls -> Int -> IO Float
get_bus_volume_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_bus_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_bus_volume_db" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_bus_volume_db

{-# NOINLINE bindAudioServer_get_device #-}

-- | Name of the current device for audio output (see @method get_device_list@).
bindAudioServer_get_device :: MethodBind
bindAudioServer_get_device
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the current device for audio output (see @method get_device_list@).
get_device ::
             (AudioServer :< cls, Object :< cls) => cls -> IO GodotString
get_device cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_device (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_device" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.AudioServer.get_device

{-# NOINLINE bindAudioServer_get_device_list #-}

-- | Returns the names of all audio devices detected on the system.
bindAudioServer_get_device_list :: MethodBind
bindAudioServer_get_device_list
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_device_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the names of all audio devices detected on the system.
get_device_list ::
                  (AudioServer :< cls, Object :< cls) => cls -> IO Array
get_device_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_device_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_device_list" '[] (IO Array)
         where
        nodeMethod = Godot.Core.AudioServer.get_device_list

{-# NOINLINE bindAudioServer_get_global_rate_scale #-}

-- | Scales the rate at which audio is played (i.e. setting it to @0.5@ will make the audio be played twice as fast).
bindAudioServer_get_global_rate_scale :: MethodBind
bindAudioServer_get_global_rate_scale
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_global_rate_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the rate at which audio is played (i.e. setting it to @0.5@ will make the audio be played twice as fast).
get_global_rate_scale ::
                        (AudioServer :< cls, Object :< cls) => cls -> IO Float
get_global_rate_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_global_rate_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_global_rate_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_global_rate_scale

{-# NOINLINE bindAudioServer_get_mix_rate #-}

-- | Returns the sample rate at the output of the @AudioServer@.
bindAudioServer_get_mix_rate :: MethodBind
bindAudioServer_get_mix_rate
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the sample rate at the output of the @AudioServer@.
get_mix_rate ::
               (AudioServer :< cls, Object :< cls) => cls -> IO Float
get_mix_rate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_mix_rate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_mix_rate" '[] (IO Float) where
        nodeMethod = Godot.Core.AudioServer.get_mix_rate

{-# NOINLINE bindAudioServer_get_output_latency #-}

-- | Returns the audio driver's output latency.
bindAudioServer_get_output_latency :: MethodBind
bindAudioServer_get_output_latency
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_output_latency" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the audio driver's output latency.
get_output_latency ::
                     (AudioServer :< cls, Object :< cls) => cls -> IO Float
get_output_latency cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_output_latency
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_output_latency" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_output_latency

{-# NOINLINE bindAudioServer_get_speaker_mode #-}

-- | Returns the speaker configuration.
bindAudioServer_get_speaker_mode :: MethodBind
bindAudioServer_get_speaker_mode
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_speaker_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the speaker configuration.
get_speaker_mode ::
                   (AudioServer :< cls, Object :< cls) => cls -> IO Int
get_speaker_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_speaker_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_speaker_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioServer.get_speaker_mode

{-# NOINLINE bindAudioServer_get_time_since_last_mix #-}

-- | Returns the relative time since the last mix occurred.
bindAudioServer_get_time_since_last_mix :: MethodBind
bindAudioServer_get_time_since_last_mix
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_time_since_last_mix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the relative time since the last mix occurred.
get_time_since_last_mix ::
                          (AudioServer :< cls, Object :< cls) => cls -> IO Float
get_time_since_last_mix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_time_since_last_mix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_time_since_last_mix" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_time_since_last_mix

{-# NOINLINE bindAudioServer_get_time_to_next_mix #-}

-- | Returns the relative time until the next mix occurs.
bindAudioServer_get_time_to_next_mix :: MethodBind
bindAudioServer_get_time_to_next_mix
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "get_time_to_next_mix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the relative time until the next mix occurs.
get_time_to_next_mix ::
                       (AudioServer :< cls, Object :< cls) => cls -> IO Float
get_time_to_next_mix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_get_time_to_next_mix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "get_time_to_next_mix" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioServer.get_time_to_next_mix

{-# NOINLINE bindAudioServer_is_bus_bypassing_effects #-}

-- | If @true@, the bus at index @bus_idx@ is bypassing effects.
bindAudioServer_is_bus_bypassing_effects :: MethodBind
bindAudioServer_is_bus_bypassing_effects
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "is_bus_bypassing_effects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bus at index @bus_idx@ is bypassing effects.
is_bus_bypassing_effects ::
                           (AudioServer :< cls, Object :< cls) => cls -> Int -> IO Bool
is_bus_bypassing_effects cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_is_bus_bypassing_effects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "is_bus_bypassing_effects" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioServer.is_bus_bypassing_effects

{-# NOINLINE bindAudioServer_is_bus_effect_enabled #-}

-- | If @true@, the effect at index @effect_idx@ on the bus at index @bus_idx@ is enabled.
bindAudioServer_is_bus_effect_enabled :: MethodBind
bindAudioServer_is_bus_effect_enabled
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "is_bus_effect_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the effect at index @effect_idx@ on the bus at index @bus_idx@ is enabled.
is_bus_effect_enabled ::
                        (AudioServer :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_bus_effect_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_is_bus_effect_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "is_bus_effect_enabled" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioServer.is_bus_effect_enabled

{-# NOINLINE bindAudioServer_is_bus_mute #-}

-- | If @true@, the bus at index @bus_idx@ is muted.
bindAudioServer_is_bus_mute :: MethodBind
bindAudioServer_is_bus_mute
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "is_bus_mute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bus at index @bus_idx@ is muted.
is_bus_mute ::
              (AudioServer :< cls, Object :< cls) => cls -> Int -> IO Bool
is_bus_mute cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_is_bus_mute (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "is_bus_mute" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioServer.is_bus_mute

{-# NOINLINE bindAudioServer_is_bus_solo #-}

-- | If @true@, the bus at index @bus_idx@ is in solo mode.
bindAudioServer_is_bus_solo :: MethodBind
bindAudioServer_is_bus_solo
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "is_bus_solo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bus at index @bus_idx@ is in solo mode.
is_bus_solo ::
              (AudioServer :< cls, Object :< cls) => cls -> Int -> IO Bool
is_bus_solo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_is_bus_solo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "is_bus_solo" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioServer.is_bus_solo

{-# NOINLINE bindAudioServer_lock #-}

-- | Locks the audio driver's main loop.
--   				__Note:__ Remember to unlock it afterwards.
bindAudioServer_lock :: MethodBind
bindAudioServer_lock
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Locks the audio driver's main loop.
--   				__Note:__ Remember to unlock it afterwards.
lock :: (AudioServer :< cls, Object :< cls) => cls -> IO ()
lock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_lock (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "lock" '[] (IO ()) where
        nodeMethod = Godot.Core.AudioServer.lock

{-# NOINLINE bindAudioServer_move_bus #-}

-- | Moves the bus from index @index@ to index @to_index@.
bindAudioServer_move_bus :: MethodBind
bindAudioServer_move_bus
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "move_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the bus from index @index@ to index @to_index@.
move_bus ::
           (AudioServer :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
move_bus cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_move_bus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "move_bus" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.move_bus

{-# NOINLINE bindAudioServer_remove_bus #-}

-- | Removes the bus at index @index@.
bindAudioServer_remove_bus :: MethodBind
bindAudioServer_remove_bus
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "remove_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the bus at index @index@.
remove_bus ::
             (AudioServer :< cls, Object :< cls) => cls -> Int -> IO ()
remove_bus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_remove_bus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "remove_bus" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AudioServer.remove_bus

{-# NOINLINE bindAudioServer_remove_bus_effect #-}

-- | Removes the effect at index @effect_idx@ from the bus at index @bus_idx@.
bindAudioServer_remove_bus_effect :: MethodBind
bindAudioServer_remove_bus_effect
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "remove_bus_effect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the effect at index @effect_idx@ from the bus at index @bus_idx@.
remove_bus_effect ::
                    (AudioServer :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
remove_bus_effect cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_remove_bus_effect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "remove_bus_effect" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.remove_bus_effect

{-# NOINLINE bindAudioServer_set_bus_bypass_effects #-}

-- | If @true@, the bus at index @bus_idx@ is bypassing effects.
bindAudioServer_set_bus_bypass_effects :: MethodBind
bindAudioServer_set_bus_bypass_effects
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_bypass_effects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bus at index @bus_idx@ is bypassing effects.
set_bus_bypass_effects ::
                         (AudioServer :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_bus_bypass_effects cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_bypass_effects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_bypass_effects"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_bypass_effects

{-# NOINLINE bindAudioServer_set_bus_count #-}

-- | Number of available audio buses.
bindAudioServer_set_bus_count :: MethodBind
bindAudioServer_set_bus_count
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of available audio buses.
set_bus_count ::
                (AudioServer :< cls, Object :< cls) => cls -> Int -> IO ()
set_bus_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_count" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_count

{-# NOINLINE bindAudioServer_set_bus_effect_enabled #-}

-- | If @true@, the effect at index @effect_idx@ on the bus at index @bus_idx@ is enabled.
bindAudioServer_set_bus_effect_enabled :: MethodBind
bindAudioServer_set_bus_effect_enabled
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_effect_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the effect at index @effect_idx@ on the bus at index @bus_idx@ is enabled.
set_bus_effect_enabled ::
                         (AudioServer :< cls, Object :< cls) =>
                         cls -> Int -> Int -> Bool -> IO ()
set_bus_effect_enabled cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_effect_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_effect_enabled"
           '[Int, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_effect_enabled

{-# NOINLINE bindAudioServer_set_bus_layout #-}

-- | Overwrites the currently used @AudioBusLayout@.
bindAudioServer_set_bus_layout :: MethodBind
bindAudioServer_set_bus_layout
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_layout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overwrites the currently used @AudioBusLayout@.
set_bus_layout ::
                 (AudioServer :< cls, Object :< cls) =>
                 cls -> AudioBusLayout -> IO ()
set_bus_layout cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_layout (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_layout" '[AudioBusLayout]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_layout

{-# NOINLINE bindAudioServer_set_bus_mute #-}

-- | If @true@, the bus at index @bus_idx@ is muted.
bindAudioServer_set_bus_mute :: MethodBind
bindAudioServer_set_bus_mute
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_mute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bus at index @bus_idx@ is muted.
set_bus_mute ::
               (AudioServer :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_bus_mute cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_mute (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_mute" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_mute

{-# NOINLINE bindAudioServer_set_bus_name #-}

-- | Sets the name of the bus at index @bus_idx@ to @name@.
bindAudioServer_set_bus_name :: MethodBind
bindAudioServer_set_bus_name
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the name of the bus at index @bus_idx@ to @name@.
set_bus_name ::
               (AudioServer :< cls, Object :< cls) =>
               cls -> Int -> GodotString -> IO ()
set_bus_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_name" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_name

{-# NOINLINE bindAudioServer_set_bus_send #-}

-- | Connects the output of the bus at @bus_idx@ to the bus named @send@.
bindAudioServer_set_bus_send :: MethodBind
bindAudioServer_set_bus_send
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_send" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects the output of the bus at @bus_idx@ to the bus named @send@.
set_bus_send ::
               (AudioServer :< cls, Object :< cls) =>
               cls -> Int -> GodotString -> IO ()
set_bus_send cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_send (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_send" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_send

{-# NOINLINE bindAudioServer_set_bus_solo #-}

-- | If @true@, the bus at index @bus_idx@ is in solo mode.
bindAudioServer_set_bus_solo :: MethodBind
bindAudioServer_set_bus_solo
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_solo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bus at index @bus_idx@ is in solo mode.
set_bus_solo ::
               (AudioServer :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_bus_solo cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_solo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_solo" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_solo

{-# NOINLINE bindAudioServer_set_bus_volume_db #-}

-- | Sets the volume of the bus at index @bus_idx@ to @volume_db@.
bindAudioServer_set_bus_volume_db :: MethodBind
bindAudioServer_set_bus_volume_db
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_bus_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the volume of the bus at index @bus_idx@ to @volume_db@.
set_bus_volume_db ::
                    (AudioServer :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_bus_volume_db cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_bus_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_bus_volume_db" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_bus_volume_db

{-# NOINLINE bindAudioServer_set_device #-}

-- | Name of the current device for audio output (see @method get_device_list@).
bindAudioServer_set_device :: MethodBind
bindAudioServer_set_device
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the current device for audio output (see @method get_device_list@).
set_device ::
             (AudioServer :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_device (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_device" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_device

{-# NOINLINE bindAudioServer_set_global_rate_scale #-}

-- | Scales the rate at which audio is played (i.e. setting it to @0.5@ will make the audio be played twice as fast).
bindAudioServer_set_global_rate_scale :: MethodBind
bindAudioServer_set_global_rate_scale
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "set_global_rate_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the rate at which audio is played (i.e. setting it to @0.5@ will make the audio be played twice as fast).
set_global_rate_scale ::
                        (AudioServer :< cls, Object :< cls) => cls -> Float -> IO ()
set_global_rate_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_set_global_rate_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "set_global_rate_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.set_global_rate_scale

{-# NOINLINE bindAudioServer_swap_bus_effects #-}

-- | Swaps the position of two effects in bus @bus_idx@.
bindAudioServer_swap_bus_effects :: MethodBind
bindAudioServer_swap_bus_effects
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "swap_bus_effects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Swaps the position of two effects in bus @bus_idx@.
swap_bus_effects ::
                   (AudioServer :< cls, Object :< cls) =>
                   cls -> Int -> Int -> Int -> IO ()
swap_bus_effects cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_swap_bus_effects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "swap_bus_effects" '[Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioServer.swap_bus_effects

{-# NOINLINE bindAudioServer_unlock #-}

-- | Unlocks the audio driver's main loop. (After locking it, you should always unlock it.)
bindAudioServer_unlock :: MethodBind
bindAudioServer_unlock
  = unsafePerformIO $
      withCString "AudioServer" $
        \ clsNamePtr ->
          withCString "unlock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unlocks the audio driver's main loop. (After locking it, you should always unlock it.)
unlock :: (AudioServer :< cls, Object :< cls) => cls -> IO ()
unlock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioServer_unlock (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioServer "unlock" '[] (IO ()) where
        nodeMethod = Godot.Core.AudioServer.unlock