{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectPhaser
       (Godot.Core.AudioEffectPhaser.get_depth,
        Godot.Core.AudioEffectPhaser.get_feedback,
        Godot.Core.AudioEffectPhaser.get_range_max_hz,
        Godot.Core.AudioEffectPhaser.get_range_min_hz,
        Godot.Core.AudioEffectPhaser.get_rate_hz,
        Godot.Core.AudioEffectPhaser.set_depth,
        Godot.Core.AudioEffectPhaser.set_feedback,
        Godot.Core.AudioEffectPhaser.set_range_max_hz,
        Godot.Core.AudioEffectPhaser.set_range_min_hz,
        Godot.Core.AudioEffectPhaser.set_rate_hz)
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

instance NodeProperty AudioEffectPhaser "depth" Float 'False where
        nodeProperty = (get_depth, wrapDroppingSetter set_depth, Nothing)

instance NodeProperty AudioEffectPhaser "feedback" Float 'False
         where
        nodeProperty
          = (get_feedback, wrapDroppingSetter set_feedback, Nothing)

instance NodeProperty AudioEffectPhaser "range_max_hz" Float 'False
         where
        nodeProperty
          = (get_range_max_hz, wrapDroppingSetter set_range_max_hz, Nothing)

instance NodeProperty AudioEffectPhaser "range_min_hz" Float 'False
         where
        nodeProperty
          = (get_range_min_hz, wrapDroppingSetter set_range_min_hz, Nothing)

instance NodeProperty AudioEffectPhaser "rate_hz" Float 'False
         where
        nodeProperty
          = (get_rate_hz, wrapDroppingSetter set_rate_hz, Nothing)

{-# NOINLINE bindAudioEffectPhaser_get_depth #-}

-- | Governs how high the filter frequencies sweep. Low value will primarily affect bass frequencies. High value can sweep high into the treble. Value can range from 0.1 to 4.
bindAudioEffectPhaser_get_depth :: MethodBind
bindAudioEffectPhaser_get_depth
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Governs how high the filter frequencies sweep. Low value will primarily affect bass frequencies. High value can sweep high into the treble. Value can range from 0.1 to 4.
get_depth ::
            (AudioEffectPhaser :< cls, Object :< cls) => cls -> IO Float
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_get_depth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "get_depth" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.get_depth

{-# NOINLINE bindAudioEffectPhaser_get_feedback #-}

-- | Output percent of modified sound. Value can range from 0.1 to 0.9.
bindAudioEffectPhaser_get_feedback :: MethodBind
bindAudioEffectPhaser_get_feedback
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "get_feedback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of modified sound. Value can range from 0.1 to 0.9.
get_feedback ::
               (AudioEffectPhaser :< cls, Object :< cls) => cls -> IO Float
get_feedback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_get_feedback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "get_feedback" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.get_feedback

{-# NOINLINE bindAudioEffectPhaser_get_range_max_hz #-}

-- | Determines the maximum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
bindAudioEffectPhaser_get_range_max_hz :: MethodBind
bindAudioEffectPhaser_get_range_max_hz
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "get_range_max_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the maximum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
get_range_max_hz ::
                   (AudioEffectPhaser :< cls, Object :< cls) => cls -> IO Float
get_range_max_hz cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_get_range_max_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "get_range_max_hz" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.get_range_max_hz

{-# NOINLINE bindAudioEffectPhaser_get_range_min_hz #-}

-- | Determines the minimum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
bindAudioEffectPhaser_get_range_min_hz :: MethodBind
bindAudioEffectPhaser_get_range_min_hz
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "get_range_min_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the minimum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
get_range_min_hz ::
                   (AudioEffectPhaser :< cls, Object :< cls) => cls -> IO Float
get_range_min_hz cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_get_range_min_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "get_range_min_hz" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.get_range_min_hz

{-# NOINLINE bindAudioEffectPhaser_get_rate_hz #-}

-- | Adjusts the rate in Hz at which the effect sweeps up and down across the frequency range.
bindAudioEffectPhaser_get_rate_hz :: MethodBind
bindAudioEffectPhaser_get_rate_hz
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "get_rate_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adjusts the rate in Hz at which the effect sweeps up and down across the frequency range.
get_rate_hz ::
              (AudioEffectPhaser :< cls, Object :< cls) => cls -> IO Float
get_rate_hz cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_get_rate_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "get_rate_hz" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.get_rate_hz

{-# NOINLINE bindAudioEffectPhaser_set_depth #-}

-- | Governs how high the filter frequencies sweep. Low value will primarily affect bass frequencies. High value can sweep high into the treble. Value can range from 0.1 to 4.
bindAudioEffectPhaser_set_depth :: MethodBind
bindAudioEffectPhaser_set_depth
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "set_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Governs how high the filter frequencies sweep. Low value will primarily affect bass frequencies. High value can sweep high into the treble. Value can range from 0.1 to 4.
set_depth ::
            (AudioEffectPhaser :< cls, Object :< cls) => cls -> Float -> IO ()
set_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_set_depth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "set_depth" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.set_depth

{-# NOINLINE bindAudioEffectPhaser_set_feedback #-}

-- | Output percent of modified sound. Value can range from 0.1 to 0.9.
bindAudioEffectPhaser_set_feedback :: MethodBind
bindAudioEffectPhaser_set_feedback
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "set_feedback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Output percent of modified sound. Value can range from 0.1 to 0.9.
set_feedback ::
               (AudioEffectPhaser :< cls, Object :< cls) => cls -> Float -> IO ()
set_feedback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_set_feedback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "set_feedback" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.set_feedback

{-# NOINLINE bindAudioEffectPhaser_set_range_max_hz #-}

-- | Determines the maximum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
bindAudioEffectPhaser_set_range_max_hz :: MethodBind
bindAudioEffectPhaser_set_range_max_hz
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "set_range_max_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the maximum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
set_range_max_hz ::
                   (AudioEffectPhaser :< cls, Object :< cls) => cls -> Float -> IO ()
set_range_max_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_set_range_max_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "set_range_max_hz" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.set_range_max_hz

{-# NOINLINE bindAudioEffectPhaser_set_range_min_hz #-}

-- | Determines the minimum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
bindAudioEffectPhaser_set_range_min_hz :: MethodBind
bindAudioEffectPhaser_set_range_min_hz
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "set_range_min_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the minimum frequency affected by the LFO modulations, in Hz. Value can range from 10 to 10000.
set_range_min_hz ::
                   (AudioEffectPhaser :< cls, Object :< cls) => cls -> Float -> IO ()
set_range_min_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_set_range_min_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "set_range_min_hz" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.set_range_min_hz

{-# NOINLINE bindAudioEffectPhaser_set_rate_hz #-}

-- | Adjusts the rate in Hz at which the effect sweeps up and down across the frequency range.
bindAudioEffectPhaser_set_rate_hz :: MethodBind
bindAudioEffectPhaser_set_rate_hz
  = unsafePerformIO $
      withCString "AudioEffectPhaser" $
        \ clsNamePtr ->
          withCString "set_rate_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adjusts the rate in Hz at which the effect sweeps up and down across the frequency range.
set_rate_hz ::
              (AudioEffectPhaser :< cls, Object :< cls) => cls -> Float -> IO ()
set_rate_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPhaser_set_rate_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPhaser "set_rate_hz" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPhaser.set_rate_hz