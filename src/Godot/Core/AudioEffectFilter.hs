{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectFilter
       (Godot.Core.AudioEffectFilter._FILTER_24DB,
        Godot.Core.AudioEffectFilter._FILTER_12DB,
        Godot.Core.AudioEffectFilter._FILTER_18DB,
        Godot.Core.AudioEffectFilter._FILTER_6DB,
        Godot.Core.AudioEffectFilter.get_cutoff,
        Godot.Core.AudioEffectFilter.get_db,
        Godot.Core.AudioEffectFilter.get_gain,
        Godot.Core.AudioEffectFilter.get_resonance,
        Godot.Core.AudioEffectFilter.set_cutoff,
        Godot.Core.AudioEffectFilter.set_db,
        Godot.Core.AudioEffectFilter.set_gain,
        Godot.Core.AudioEffectFilter.set_resonance)
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

_FILTER_24DB :: Int
_FILTER_24DB = 3

_FILTER_12DB :: Int
_FILTER_12DB = 1

_FILTER_18DB :: Int
_FILTER_18DB = 2

_FILTER_6DB :: Int
_FILTER_6DB = 0

instance NodeProperty AudioEffectFilter "cutoff_hz" Float 'False
         where
        nodeProperty = (get_cutoff, wrapDroppingSetter set_cutoff, Nothing)

instance NodeProperty AudioEffectFilter "db" Int 'False where
        nodeProperty = (get_db, wrapDroppingSetter set_db, Nothing)

instance NodeProperty AudioEffectFilter "gain" Float 'False where
        nodeProperty = (get_gain, wrapDroppingSetter set_gain, Nothing)

instance NodeProperty AudioEffectFilter "resonance" Float 'False
         where
        nodeProperty
          = (get_resonance, wrapDroppingSetter set_resonance, Nothing)

{-# NOINLINE bindAudioEffectFilter_get_cutoff #-}

-- | Threshold frequency for the filter, in Hz.
bindAudioEffectFilter_get_cutoff :: MethodBind
bindAudioEffectFilter_get_cutoff
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "get_cutoff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold frequency for the filter, in Hz.
get_cutoff ::
             (AudioEffectFilter :< cls, Object :< cls) => cls -> IO Float
get_cutoff cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_get_cutoff
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "get_cutoff" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectFilter.get_cutoff

{-# NOINLINE bindAudioEffectFilter_get_db #-}

bindAudioEffectFilter_get_db :: MethodBind
bindAudioEffectFilter_get_db
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "get_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_db ::
         (AudioEffectFilter :< cls, Object :< cls) => cls -> IO Int
get_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_get_db (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "get_db" '[] (IO Int) where
        nodeMethod = Godot.Core.AudioEffectFilter.get_db

{-# NOINLINE bindAudioEffectFilter_get_gain #-}

-- | Gain amount of the frequencies after the filter.
bindAudioEffectFilter_get_gain :: MethodBind
bindAudioEffectFilter_get_gain
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "get_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gain amount of the frequencies after the filter.
get_gain ::
           (AudioEffectFilter :< cls, Object :< cls) => cls -> IO Float
get_gain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_get_gain (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "get_gain" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectFilter.get_gain

{-# NOINLINE bindAudioEffectFilter_get_resonance #-}

-- | Amount of boost in the frequency range near the cutoff frequency.
bindAudioEffectFilter_get_resonance :: MethodBind
bindAudioEffectFilter_get_resonance
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "get_resonance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of boost in the frequency range near the cutoff frequency.
get_resonance ::
                (AudioEffectFilter :< cls, Object :< cls) => cls -> IO Float
get_resonance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_get_resonance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "get_resonance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectFilter.get_resonance

{-# NOINLINE bindAudioEffectFilter_set_cutoff #-}

-- | Threshold frequency for the filter, in Hz.
bindAudioEffectFilter_set_cutoff :: MethodBind
bindAudioEffectFilter_set_cutoff
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "set_cutoff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold frequency for the filter, in Hz.
set_cutoff ::
             (AudioEffectFilter :< cls, Object :< cls) => cls -> Float -> IO ()
set_cutoff cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_set_cutoff
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "set_cutoff" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectFilter.set_cutoff

{-# NOINLINE bindAudioEffectFilter_set_db #-}

bindAudioEffectFilter_set_db :: MethodBind
bindAudioEffectFilter_set_db
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "set_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_db ::
         (AudioEffectFilter :< cls, Object :< cls) => cls -> Int -> IO ()
set_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_set_db (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "set_db" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AudioEffectFilter.set_db

{-# NOINLINE bindAudioEffectFilter_set_gain #-}

-- | Gain amount of the frequencies after the filter.
bindAudioEffectFilter_set_gain :: MethodBind
bindAudioEffectFilter_set_gain
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "set_gain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gain amount of the frequencies after the filter.
set_gain ::
           (AudioEffectFilter :< cls, Object :< cls) => cls -> Float -> IO ()
set_gain cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_set_gain (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "set_gain" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectFilter.set_gain

{-# NOINLINE bindAudioEffectFilter_set_resonance #-}

-- | Amount of boost in the frequency range near the cutoff frequency.
bindAudioEffectFilter_set_resonance :: MethodBind
bindAudioEffectFilter_set_resonance
  = unsafePerformIO $
      withCString "AudioEffectFilter" $
        \ clsNamePtr ->
          withCString "set_resonance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of boost in the frequency range near the cutoff frequency.
set_resonance ::
                (AudioEffectFilter :< cls, Object :< cls) => cls -> Float -> IO ()
set_resonance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectFilter_set_resonance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectFilter "set_resonance" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectFilter.set_resonance