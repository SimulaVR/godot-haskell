{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectLimiter
       (Godot.Core.AudioEffectLimiter.get_ceiling_db,
        Godot.Core.AudioEffectLimiter.get_soft_clip_db,
        Godot.Core.AudioEffectLimiter.get_soft_clip_ratio,
        Godot.Core.AudioEffectLimiter.get_threshold_db,
        Godot.Core.AudioEffectLimiter.set_ceiling_db,
        Godot.Core.AudioEffectLimiter.set_soft_clip_db,
        Godot.Core.AudioEffectLimiter.set_soft_clip_ratio,
        Godot.Core.AudioEffectLimiter.set_threshold_db)
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

instance NodeProperty AudioEffectLimiter "ceiling_db" Float 'False
         where
        nodeProperty
          = (get_ceiling_db, wrapDroppingSetter set_ceiling_db, Nothing)

instance NodeProperty AudioEffectLimiter "soft_clip_db" Float
           'False
         where
        nodeProperty
          = (get_soft_clip_db, wrapDroppingSetter set_soft_clip_db, Nothing)

instance NodeProperty AudioEffectLimiter "soft_clip_ratio" Float
           'False
         where
        nodeProperty
          = (get_soft_clip_ratio, wrapDroppingSetter set_soft_clip_ratio,
             Nothing)

instance NodeProperty AudioEffectLimiter "threshold_db" Float
           'False
         where
        nodeProperty
          = (get_threshold_db, wrapDroppingSetter set_threshold_db, Nothing)

{-# NOINLINE bindAudioEffectLimiter_get_ceiling_db #-}

-- | The waveform's maximum allowed value, in decibels. Value can range from -20 to -0.1.
bindAudioEffectLimiter_get_ceiling_db :: MethodBind
bindAudioEffectLimiter_get_ceiling_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_ceiling_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The waveform's maximum allowed value, in decibels. Value can range from -20 to -0.1.
get_ceiling_db ::
                 (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_ceiling_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_ceiling_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "get_ceiling_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.get_ceiling_db

{-# NOINLINE bindAudioEffectLimiter_get_soft_clip_db #-}

-- | Applies a gain to the limited waves, in decibels. Value can range from 0 to 6.
bindAudioEffectLimiter_get_soft_clip_db :: MethodBind
bindAudioEffectLimiter_get_soft_clip_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_soft_clip_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a gain to the limited waves, in decibels. Value can range from 0 to 6.
get_soft_clip_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_soft_clip_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_soft_clip_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "get_soft_clip_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.get_soft_clip_db

{-# NOINLINE bindAudioEffectLimiter_get_soft_clip_ratio #-}

bindAudioEffectLimiter_get_soft_clip_ratio :: MethodBind
bindAudioEffectLimiter_get_soft_clip_ratio
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_soft_clip_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_soft_clip_ratio ::
                      (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_soft_clip_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_soft_clip_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "get_soft_clip_ratio" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.get_soft_clip_ratio

{-# NOINLINE bindAudioEffectLimiter_get_threshold_db #-}

-- | Threshold from which the limiter begins to be active, in decibels. Value can range from -30 to 0.
bindAudioEffectLimiter_get_threshold_db :: MethodBind
bindAudioEffectLimiter_get_threshold_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "get_threshold_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold from which the limiter begins to be active, in decibels. Value can range from -30 to 0.
get_threshold_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> IO Float
get_threshold_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_get_threshold_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "get_threshold_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.get_threshold_db

{-# NOINLINE bindAudioEffectLimiter_set_ceiling_db #-}

-- | The waveform's maximum allowed value, in decibels. Value can range from -20 to -0.1.
bindAudioEffectLimiter_set_ceiling_db :: MethodBind
bindAudioEffectLimiter_set_ceiling_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_ceiling_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The waveform's maximum allowed value, in decibels. Value can range from -20 to -0.1.
set_ceiling_db ::
                 (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_ceiling_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_ceiling_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "set_ceiling_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.set_ceiling_db

{-# NOINLINE bindAudioEffectLimiter_set_soft_clip_db #-}

-- | Applies a gain to the limited waves, in decibels. Value can range from 0 to 6.
bindAudioEffectLimiter_set_soft_clip_db :: MethodBind
bindAudioEffectLimiter_set_soft_clip_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_soft_clip_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a gain to the limited waves, in decibels. Value can range from 0 to 6.
set_soft_clip_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_soft_clip_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_soft_clip_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "set_soft_clip_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.set_soft_clip_db

{-# NOINLINE bindAudioEffectLimiter_set_soft_clip_ratio #-}

bindAudioEffectLimiter_set_soft_clip_ratio :: MethodBind
bindAudioEffectLimiter_set_soft_clip_ratio
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_soft_clip_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_soft_clip_ratio ::
                      (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_soft_clip_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_soft_clip_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "set_soft_clip_ratio"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.set_soft_clip_ratio

{-# NOINLINE bindAudioEffectLimiter_set_threshold_db #-}

-- | Threshold from which the limiter begins to be active, in decibels. Value can range from -30 to 0.
bindAudioEffectLimiter_set_threshold_db :: MethodBind
bindAudioEffectLimiter_set_threshold_db
  = unsafePerformIO $
      withCString "AudioEffectLimiter" $
        \ clsNamePtr ->
          withCString "set_threshold_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold from which the limiter begins to be active, in decibels. Value can range from -30 to 0.
set_threshold_db ::
                   (AudioEffectLimiter :< cls, Object :< cls) => cls -> Float -> IO ()
set_threshold_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectLimiter_set_threshold_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectLimiter "set_threshold_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectLimiter.set_threshold_db