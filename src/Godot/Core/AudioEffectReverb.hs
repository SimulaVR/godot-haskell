{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectReverb
       (Godot.Core.AudioEffectReverb.get_damping,
        Godot.Core.AudioEffectReverb.get_dry,
        Godot.Core.AudioEffectReverb.get_hpf,
        Godot.Core.AudioEffectReverb.get_predelay_feedback,
        Godot.Core.AudioEffectReverb.get_predelay_msec,
        Godot.Core.AudioEffectReverb.get_room_size,
        Godot.Core.AudioEffectReverb.get_spread,
        Godot.Core.AudioEffectReverb.get_wet,
        Godot.Core.AudioEffectReverb.set_damping,
        Godot.Core.AudioEffectReverb.set_dry,
        Godot.Core.AudioEffectReverb.set_hpf,
        Godot.Core.AudioEffectReverb.set_predelay_feedback,
        Godot.Core.AudioEffectReverb.set_predelay_msec,
        Godot.Core.AudioEffectReverb.set_room_size,
        Godot.Core.AudioEffectReverb.set_spread,
        Godot.Core.AudioEffectReverb.set_wet)
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

instance NodeProperty AudioEffectReverb "damping" Float 'False
         where
        nodeProperty
          = (get_damping, wrapDroppingSetter set_damping, Nothing)

instance NodeProperty AudioEffectReverb "dry" Float 'False where
        nodeProperty = (get_dry, wrapDroppingSetter set_dry, Nothing)

instance NodeProperty AudioEffectReverb "hipass" Float 'False where
        nodeProperty = (get_hpf, wrapDroppingSetter set_hpf, Nothing)

instance NodeProperty AudioEffectReverb "predelay_feedback" Float
           'False
         where
        nodeProperty
          = (get_predelay_feedback, wrapDroppingSetter set_predelay_feedback,
             Nothing)

instance NodeProperty AudioEffectReverb "predelay_msec" Float
           'False
         where
        nodeProperty
          = (get_predelay_msec, wrapDroppingSetter set_predelay_msec,
             Nothing)

instance NodeProperty AudioEffectReverb "room_size" Float 'False
         where
        nodeProperty
          = (get_room_size, wrapDroppingSetter set_room_size, Nothing)

instance NodeProperty AudioEffectReverb "spread" Float 'False where
        nodeProperty = (get_spread, wrapDroppingSetter set_spread, Nothing)

instance NodeProperty AudioEffectReverb "wet" Float 'False where
        nodeProperty = (get_wet, wrapDroppingSetter set_wet, Nothing)

{-# NOINLINE bindAudioEffectReverb_get_damping #-}

-- | Defines how reflective the imaginary room's walls are. Value can range from 0 to 1.
bindAudioEffectReverb_get_damping :: MethodBind
bindAudioEffectReverb_get_damping
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_damping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines how reflective the imaginary room's walls are. Value can range from 0 to 1.
get_damping ::
              (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_damping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_damping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_damping" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_damping

{-# NOINLINE bindAudioEffectReverb_get_dry #-}

-- | Output percent of original sound. At 0, only modified sound is outputted. Value can range from 0 to 1.
bindAudioEffectReverb_get_dry :: MethodBind
bindAudioEffectReverb_get_dry
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of original sound. At 0, only modified sound is outputted. Value can range from 0 to 1.
get_dry ::
          (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_dry cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_dry" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_dry

{-# NOINLINE bindAudioEffectReverb_get_hpf #-}

-- | High-pass filter passes signals with a frequency higher than a certain cutoff frequency and attenuates signals with frequencies lower than the cutoff frequency. Value can range from 0 to 1.
bindAudioEffectReverb_get_hpf :: MethodBind
bindAudioEffectReverb_get_hpf
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_hpf" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | High-pass filter passes signals with a frequency higher than a certain cutoff frequency and attenuates signals with frequencies lower than the cutoff frequency. Value can range from 0 to 1.
get_hpf ::
          (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_hpf cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_hpf (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_hpf" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_hpf

{-# NOINLINE bindAudioEffectReverb_get_predelay_feedback #-}

-- | Output percent of predelay. Value can range from 0 to 1.
bindAudioEffectReverb_get_predelay_feedback :: MethodBind
bindAudioEffectReverb_get_predelay_feedback
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_predelay_feedback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of predelay. Value can range from 0 to 1.
get_predelay_feedback ::
                        (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_predelay_feedback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_predelay_feedback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_predelay_feedback" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_predelay_feedback

{-# NOINLINE bindAudioEffectReverb_get_predelay_msec #-}

-- | Time between the original signal and the early reflections of the reverb signal, in milliseconds.
bindAudioEffectReverb_get_predelay_msec :: MethodBind
bindAudioEffectReverb_get_predelay_msec
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_predelay_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Time between the original signal and the early reflections of the reverb signal, in milliseconds.
get_predelay_msec ::
                    (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_predelay_msec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_predelay_msec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_predelay_msec" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_predelay_msec

{-# NOINLINE bindAudioEffectReverb_get_room_size #-}

-- | Dimensions of simulated room. Bigger means more echoes. Value can range from 0 to 1.
bindAudioEffectReverb_get_room_size :: MethodBind
bindAudioEffectReverb_get_room_size
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_room_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dimensions of simulated room. Bigger means more echoes. Value can range from 0 to 1.
get_room_size ::
                (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_room_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_room_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_room_size" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_room_size

{-# NOINLINE bindAudioEffectReverb_get_spread #-}

-- | Widens or narrows the stereo image of the reverb tail. 1 means fully widens. Value can range from 0 to 1.
bindAudioEffectReverb_get_spread :: MethodBind
bindAudioEffectReverb_get_spread
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Widens or narrows the stereo image of the reverb tail. 1 means fully widens. Value can range from 0 to 1.
get_spread ::
             (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_spread cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_spread
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_spread" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_spread

{-# NOINLINE bindAudioEffectReverb_get_wet #-}

-- | Output percent of modified sound. At 0, only original sound is outputted. Value can range from 0 to 1.
bindAudioEffectReverb_get_wet :: MethodBind
bindAudioEffectReverb_get_wet
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "get_wet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of modified sound. At 0, only original sound is outputted. Value can range from 0 to 1.
get_wet ::
          (AudioEffectReverb :< cls, Object :< cls) => cls -> IO Float
get_wet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_get_wet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "get_wet" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectReverb.get_wet

{-# NOINLINE bindAudioEffectReverb_set_damping #-}

-- | Defines how reflective the imaginary room's walls are. Value can range from 0 to 1.
bindAudioEffectReverb_set_damping :: MethodBind
bindAudioEffectReverb_set_damping
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_damping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines how reflective the imaginary room's walls are. Value can range from 0 to 1.
set_damping ::
              (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_damping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_damping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_damping" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_damping

{-# NOINLINE bindAudioEffectReverb_set_dry #-}

-- | Output percent of original sound. At 0, only modified sound is outputted. Value can range from 0 to 1.
bindAudioEffectReverb_set_dry :: MethodBind
bindAudioEffectReverb_set_dry
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of original sound. At 0, only modified sound is outputted. Value can range from 0 to 1.
set_dry ::
          (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_dry cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_dry" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_dry

{-# NOINLINE bindAudioEffectReverb_set_hpf #-}

-- | High-pass filter passes signals with a frequency higher than a certain cutoff frequency and attenuates signals with frequencies lower than the cutoff frequency. Value can range from 0 to 1.
bindAudioEffectReverb_set_hpf :: MethodBind
bindAudioEffectReverb_set_hpf
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_hpf" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | High-pass filter passes signals with a frequency higher than a certain cutoff frequency and attenuates signals with frequencies lower than the cutoff frequency. Value can range from 0 to 1.
set_hpf ::
          (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_hpf cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_hpf (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_hpf" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_hpf

{-# NOINLINE bindAudioEffectReverb_set_predelay_feedback #-}

-- | Output percent of predelay. Value can range from 0 to 1.
bindAudioEffectReverb_set_predelay_feedback :: MethodBind
bindAudioEffectReverb_set_predelay_feedback
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_predelay_feedback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of predelay. Value can range from 0 to 1.
set_predelay_feedback ::
                        (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_predelay_feedback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_predelay_feedback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_predelay_feedback"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_predelay_feedback

{-# NOINLINE bindAudioEffectReverb_set_predelay_msec #-}

-- | Time between the original signal and the early reflections of the reverb signal, in milliseconds.
bindAudioEffectReverb_set_predelay_msec :: MethodBind
bindAudioEffectReverb_set_predelay_msec
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_predelay_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Time between the original signal and the early reflections of the reverb signal, in milliseconds.
set_predelay_msec ::
                    (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_predelay_msec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_predelay_msec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_predelay_msec" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_predelay_msec

{-# NOINLINE bindAudioEffectReverb_set_room_size #-}

-- | Dimensions of simulated room. Bigger means more echoes. Value can range from 0 to 1.
bindAudioEffectReverb_set_room_size :: MethodBind
bindAudioEffectReverb_set_room_size
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_room_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dimensions of simulated room. Bigger means more echoes. Value can range from 0 to 1.
set_room_size ::
                (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_room_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_room_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_room_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_room_size

{-# NOINLINE bindAudioEffectReverb_set_spread #-}

-- | Widens or narrows the stereo image of the reverb tail. 1 means fully widens. Value can range from 0 to 1.
bindAudioEffectReverb_set_spread :: MethodBind
bindAudioEffectReverb_set_spread
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Widens or narrows the stereo image of the reverb tail. 1 means fully widens. Value can range from 0 to 1.
set_spread ::
             (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_spread cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_spread
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_spread" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_spread

{-# NOINLINE bindAudioEffectReverb_set_wet #-}

-- | Output percent of modified sound. At 0, only original sound is outputted. Value can range from 0 to 1.
bindAudioEffectReverb_set_wet :: MethodBind
bindAudioEffectReverb_set_wet
  = unsafePerformIO $
      withCString "AudioEffectReverb" $
        \ clsNamePtr ->
          withCString "set_wet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of modified sound. At 0, only original sound is outputted. Value can range from 0 to 1.
set_wet ::
          (AudioEffectReverb :< cls, Object :< cls) => cls -> Float -> IO ()
set_wet cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectReverb_set_wet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectReverb "set_wet" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectReverb.set_wet