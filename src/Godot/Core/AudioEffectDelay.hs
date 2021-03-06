{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectDelay
       (Godot.Core.AudioEffectDelay.get_dry,
        Godot.Core.AudioEffectDelay.get_feedback_delay_ms,
        Godot.Core.AudioEffectDelay.get_feedback_level_db,
        Godot.Core.AudioEffectDelay.get_feedback_lowpass,
        Godot.Core.AudioEffectDelay.get_tap1_delay_ms,
        Godot.Core.AudioEffectDelay.get_tap1_level_db,
        Godot.Core.AudioEffectDelay.get_tap1_pan,
        Godot.Core.AudioEffectDelay.get_tap2_delay_ms,
        Godot.Core.AudioEffectDelay.get_tap2_level_db,
        Godot.Core.AudioEffectDelay.get_tap2_pan,
        Godot.Core.AudioEffectDelay.is_feedback_active,
        Godot.Core.AudioEffectDelay.is_tap1_active,
        Godot.Core.AudioEffectDelay.is_tap2_active,
        Godot.Core.AudioEffectDelay.set_dry,
        Godot.Core.AudioEffectDelay.set_feedback_active,
        Godot.Core.AudioEffectDelay.set_feedback_delay_ms,
        Godot.Core.AudioEffectDelay.set_feedback_level_db,
        Godot.Core.AudioEffectDelay.set_feedback_lowpass,
        Godot.Core.AudioEffectDelay.set_tap1_active,
        Godot.Core.AudioEffectDelay.set_tap1_delay_ms,
        Godot.Core.AudioEffectDelay.set_tap1_level_db,
        Godot.Core.AudioEffectDelay.set_tap1_pan,
        Godot.Core.AudioEffectDelay.set_tap2_active,
        Godot.Core.AudioEffectDelay.set_tap2_delay_ms,
        Godot.Core.AudioEffectDelay.set_tap2_level_db,
        Godot.Core.AudioEffectDelay.set_tap2_pan)
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

instance NodeProperty AudioEffectDelay "dry" Float 'False where
        nodeProperty = (get_dry, wrapDroppingSetter set_dry, Nothing)

instance NodeProperty AudioEffectDelay "feedback/active" Bool
           'False
         where
        nodeProperty
          = (is_feedback_active, wrapDroppingSetter set_feedback_active,
             Nothing)

instance NodeProperty AudioEffectDelay "feedback/delay_ms" Float
           'False
         where
        nodeProperty
          = (get_feedback_delay_ms, wrapDroppingSetter set_feedback_delay_ms,
             Nothing)

instance NodeProperty AudioEffectDelay "feedback/level_db" Float
           'False
         where
        nodeProperty
          = (get_feedback_level_db, wrapDroppingSetter set_feedback_level_db,
             Nothing)

instance NodeProperty AudioEffectDelay "feedback/lowpass" Float
           'False
         where
        nodeProperty
          = (get_feedback_lowpass, wrapDroppingSetter set_feedback_lowpass,
             Nothing)

instance NodeProperty AudioEffectDelay "tap1/active" Bool 'False
         where
        nodeProperty
          = (is_tap1_active, wrapDroppingSetter set_tap1_active, Nothing)

instance NodeProperty AudioEffectDelay "tap1/delay_ms" Float 'False
         where
        nodeProperty
          = (get_tap1_delay_ms, wrapDroppingSetter set_tap1_delay_ms,
             Nothing)

instance NodeProperty AudioEffectDelay "tap1/level_db" Float 'False
         where
        nodeProperty
          = (get_tap1_level_db, wrapDroppingSetter set_tap1_level_db,
             Nothing)

instance NodeProperty AudioEffectDelay "tap1/pan" Float 'False
         where
        nodeProperty
          = (get_tap1_pan, wrapDroppingSetter set_tap1_pan, Nothing)

instance NodeProperty AudioEffectDelay "tap2/active" Bool 'False
         where
        nodeProperty
          = (is_tap2_active, wrapDroppingSetter set_tap2_active, Nothing)

instance NodeProperty AudioEffectDelay "tap2/delay_ms" Float 'False
         where
        nodeProperty
          = (get_tap2_delay_ms, wrapDroppingSetter set_tap2_delay_ms,
             Nothing)

instance NodeProperty AudioEffectDelay "tap2/level_db" Float 'False
         where
        nodeProperty
          = (get_tap2_level_db, wrapDroppingSetter set_tap2_level_db,
             Nothing)

instance NodeProperty AudioEffectDelay "tap2/pan" Float 'False
         where
        nodeProperty
          = (get_tap2_pan, wrapDroppingSetter set_tap2_pan, Nothing)

{-# NOINLINE bindAudioEffectDelay_get_dry #-}

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1.
bindAudioEffectDelay_get_dry :: MethodBind
bindAudioEffectDelay_get_dry
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1.
get_dry ::
          (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_dry cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_dry" '[] (IO Float) where
        nodeMethod = Godot.Core.AudioEffectDelay.get_dry

{-# NOINLINE bindAudioEffectDelay_get_feedback_delay_ms #-}

-- | Feedback delay time in milliseconds.
bindAudioEffectDelay_get_feedback_delay_ms :: MethodBind
bindAudioEffectDelay_get_feedback_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_feedback_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Feedback delay time in milliseconds.
get_feedback_delay_ms ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_feedback_delay_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_feedback_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_feedback_delay_ms" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_feedback_delay_ms

{-# NOINLINE bindAudioEffectDelay_get_feedback_level_db #-}

-- | Sound level for @tap1@.
bindAudioEffectDelay_get_feedback_level_db :: MethodBind
bindAudioEffectDelay_get_feedback_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_feedback_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for @tap1@.
get_feedback_level_db ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_feedback_level_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_feedback_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_feedback_level_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_feedback_level_db

{-# NOINLINE bindAudioEffectDelay_get_feedback_lowpass #-}

-- | Low-pass filter for feedback, in Hz. Frequencies below this value are filtered out of the source signal.
bindAudioEffectDelay_get_feedback_lowpass :: MethodBind
bindAudioEffectDelay_get_feedback_lowpass
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_feedback_lowpass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Low-pass filter for feedback, in Hz. Frequencies below this value are filtered out of the source signal.
get_feedback_lowpass ::
                       (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_feedback_lowpass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_feedback_lowpass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_feedback_lowpass" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_feedback_lowpass

{-# NOINLINE bindAudioEffectDelay_get_tap1_delay_ms #-}

-- | @tap1@ delay time in milliseconds.
bindAudioEffectDelay_get_tap1_delay_ms :: MethodBind
bindAudioEffectDelay_get_tap1_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap1_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @tap1@ delay time in milliseconds.
get_tap1_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap1_delay_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap1_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_tap1_delay_ms" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_tap1_delay_ms

{-# NOINLINE bindAudioEffectDelay_get_tap1_level_db #-}

-- | Sound level for @tap1@.
bindAudioEffectDelay_get_tap1_level_db :: MethodBind
bindAudioEffectDelay_get_tap1_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap1_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for @tap1@.
get_tap1_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap1_level_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap1_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_tap1_level_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_tap1_level_db

{-# NOINLINE bindAudioEffectDelay_get_tap1_pan #-}

-- | Pan position for @tap1@. Value can range from -1 (fully left) to 1 (fully right).
bindAudioEffectDelay_get_tap1_pan :: MethodBind
bindAudioEffectDelay_get_tap1_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap1_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for @tap1@. Value can range from -1 (fully left) to 1 (fully right).
get_tap1_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap1_pan cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap1_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_tap1_pan" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_tap1_pan

{-# NOINLINE bindAudioEffectDelay_get_tap2_delay_ms #-}

-- | __Tap2__ delay time in milliseconds.
bindAudioEffectDelay_get_tap2_delay_ms :: MethodBind
bindAudioEffectDelay_get_tap2_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap2_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | __Tap2__ delay time in milliseconds.
get_tap2_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap2_delay_ms cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap2_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_tap2_delay_ms" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_tap2_delay_ms

{-# NOINLINE bindAudioEffectDelay_get_tap2_level_db #-}

-- | Sound level for @tap2@.
bindAudioEffectDelay_get_tap2_level_db :: MethodBind
bindAudioEffectDelay_get_tap2_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap2_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for @tap2@.
get_tap2_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap2_level_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap2_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_tap2_level_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_tap2_level_db

{-# NOINLINE bindAudioEffectDelay_get_tap2_pan #-}

-- | Pan position for @tap2@. Value can range from -1 (fully left) to 1 (fully right).
bindAudioEffectDelay_get_tap2_pan :: MethodBind
bindAudioEffectDelay_get_tap2_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "get_tap2_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for @tap2@. Value can range from -1 (fully left) to 1 (fully right).
get_tap2_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Float
get_tap2_pan cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_get_tap2_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "get_tap2_pan" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.get_tap2_pan

{-# NOINLINE bindAudioEffectDelay_is_feedback_active #-}

-- | If @true@, feedback is enabled.
bindAudioEffectDelay_is_feedback_active :: MethodBind
bindAudioEffectDelay_is_feedback_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "is_feedback_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, feedback is enabled.
is_feedback_active ::
                     (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Bool
is_feedback_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_is_feedback_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "is_feedback_active" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.is_feedback_active

{-# NOINLINE bindAudioEffectDelay_is_tap1_active #-}

-- | If @true@, @tap1@ will be enabled.
bindAudioEffectDelay_is_tap1_active :: MethodBind
bindAudioEffectDelay_is_tap1_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "is_tap1_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @tap1@ will be enabled.
is_tap1_active ::
                 (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Bool
is_tap1_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_is_tap1_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "is_tap1_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.is_tap1_active

{-# NOINLINE bindAudioEffectDelay_is_tap2_active #-}

-- | If @true@, @tap2@ will be enabled.
bindAudioEffectDelay_is_tap2_active :: MethodBind
bindAudioEffectDelay_is_tap2_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "is_tap2_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @tap2@ will be enabled.
is_tap2_active ::
                 (AudioEffectDelay :< cls, Object :< cls) => cls -> IO Bool
is_tap2_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_is_tap2_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "is_tap2_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioEffectDelay.is_tap2_active

{-# NOINLINE bindAudioEffectDelay_set_dry #-}

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1.
bindAudioEffectDelay_set_dry :: MethodBind
bindAudioEffectDelay_set_dry
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of original sound. At 0, only delayed sounds are output. Value can range from 0 to 1.
set_dry ::
          (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_dry cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_dry" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_dry

{-# NOINLINE bindAudioEffectDelay_set_feedback_active #-}

-- | If @true@, feedback is enabled.
bindAudioEffectDelay_set_feedback_active :: MethodBind
bindAudioEffectDelay_set_feedback_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, feedback is enabled.
set_feedback_active ::
                      (AudioEffectDelay :< cls, Object :< cls) => cls -> Bool -> IO ()
set_feedback_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_feedback_active" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_feedback_active

{-# NOINLINE bindAudioEffectDelay_set_feedback_delay_ms #-}

-- | Feedback delay time in milliseconds.
bindAudioEffectDelay_set_feedback_delay_ms :: MethodBind
bindAudioEffectDelay_set_feedback_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Feedback delay time in milliseconds.
set_feedback_delay_ms ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_feedback_delay_ms"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_feedback_delay_ms

{-# NOINLINE bindAudioEffectDelay_set_feedback_level_db #-}

-- | Sound level for @tap1@.
bindAudioEffectDelay_set_feedback_level_db :: MethodBind
bindAudioEffectDelay_set_feedback_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for @tap1@.
set_feedback_level_db ::
                        (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_feedback_level_db"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_feedback_level_db

{-# NOINLINE bindAudioEffectDelay_set_feedback_lowpass #-}

-- | Low-pass filter for feedback, in Hz. Frequencies below this value are filtered out of the source signal.
bindAudioEffectDelay_set_feedback_lowpass :: MethodBind
bindAudioEffectDelay_set_feedback_lowpass
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_feedback_lowpass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Low-pass filter for feedback, in Hz. Frequencies below this value are filtered out of the source signal.
set_feedback_lowpass ::
                       (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback_lowpass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_feedback_lowpass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_feedback_lowpass"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_feedback_lowpass

{-# NOINLINE bindAudioEffectDelay_set_tap1_active #-}

-- | If @true@, @tap1@ will be enabled.
bindAudioEffectDelay_set_tap1_active :: MethodBind
bindAudioEffectDelay_set_tap1_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @tap1@ will be enabled.
set_tap1_active ::
                  (AudioEffectDelay :< cls, Object :< cls) => cls -> Bool -> IO ()
set_tap1_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap1_active" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap1_active

{-# NOINLINE bindAudioEffectDelay_set_tap1_delay_ms #-}

-- | @tap1@ delay time in milliseconds.
bindAudioEffectDelay_set_tap1_delay_ms :: MethodBind
bindAudioEffectDelay_set_tap1_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @tap1@ delay time in milliseconds.
set_tap1_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap1_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap1_delay_ms" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap1_delay_ms

{-# NOINLINE bindAudioEffectDelay_set_tap1_level_db #-}

-- | Sound level for @tap1@.
bindAudioEffectDelay_set_tap1_level_db :: MethodBind
bindAudioEffectDelay_set_tap1_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for @tap1@.
set_tap1_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap1_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap1_level_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap1_level_db

{-# NOINLINE bindAudioEffectDelay_set_tap1_pan #-}

-- | Pan position for @tap1@. Value can range from -1 (fully left) to 1 (fully right).
bindAudioEffectDelay_set_tap1_pan :: MethodBind
bindAudioEffectDelay_set_tap1_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap1_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for @tap1@. Value can range from -1 (fully left) to 1 (fully right).
set_tap1_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap1_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap1_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap1_pan" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap1_pan

{-# NOINLINE bindAudioEffectDelay_set_tap2_active #-}

-- | If @true@, @tap2@ will be enabled.
bindAudioEffectDelay_set_tap2_active :: MethodBind
bindAudioEffectDelay_set_tap2_active
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @tap2@ will be enabled.
set_tap2_active ::
                  (AudioEffectDelay :< cls, Object :< cls) => cls -> Bool -> IO ()
set_tap2_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap2_active" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap2_active

{-# NOINLINE bindAudioEffectDelay_set_tap2_delay_ms #-}

-- | __Tap2__ delay time in milliseconds.
bindAudioEffectDelay_set_tap2_delay_ms :: MethodBind
bindAudioEffectDelay_set_tap2_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | __Tap2__ delay time in milliseconds.
set_tap2_delay_ms ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap2_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap2_delay_ms" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap2_delay_ms

{-# NOINLINE bindAudioEffectDelay_set_tap2_level_db #-}

-- | Sound level for @tap2@.
bindAudioEffectDelay_set_tap2_level_db :: MethodBind
bindAudioEffectDelay_set_tap2_level_db
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sound level for @tap2@.
set_tap2_level_db ::
                    (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap2_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap2_level_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap2_level_db

{-# NOINLINE bindAudioEffectDelay_set_tap2_pan #-}

-- | Pan position for @tap2@. Value can range from -1 (fully left) to 1 (fully right).
bindAudioEffectDelay_set_tap2_pan :: MethodBind
bindAudioEffectDelay_set_tap2_pan
  = unsafePerformIO $
      withCString "AudioEffectDelay" $
        \ clsNamePtr ->
          withCString "set_tap2_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position for @tap2@. Value can range from -1 (fully left) to 1 (fully right).
set_tap2_pan ::
               (AudioEffectDelay :< cls, Object :< cls) => cls -> Float -> IO ()
set_tap2_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectDelay_set_tap2_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectDelay "set_tap2_pan" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectDelay.set_tap2_pan