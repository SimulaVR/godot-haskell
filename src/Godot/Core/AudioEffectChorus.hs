{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectChorus
       (Godot.Core.AudioEffectChorus.get_dry,
        Godot.Core.AudioEffectChorus.get_voice_count,
        Godot.Core.AudioEffectChorus.get_voice_cutoff_hz,
        Godot.Core.AudioEffectChorus.get_voice_delay_ms,
        Godot.Core.AudioEffectChorus.get_voice_depth_ms,
        Godot.Core.AudioEffectChorus.get_voice_level_db,
        Godot.Core.AudioEffectChorus.get_voice_pan,
        Godot.Core.AudioEffectChorus.get_voice_rate_hz,
        Godot.Core.AudioEffectChorus.get_wet,
        Godot.Core.AudioEffectChorus.set_dry,
        Godot.Core.AudioEffectChorus.set_voice_count,
        Godot.Core.AudioEffectChorus.set_voice_cutoff_hz,
        Godot.Core.AudioEffectChorus.set_voice_delay_ms,
        Godot.Core.AudioEffectChorus.set_voice_depth_ms,
        Godot.Core.AudioEffectChorus.set_voice_level_db,
        Godot.Core.AudioEffectChorus.set_voice_pan,
        Godot.Core.AudioEffectChorus.set_voice_rate_hz,
        Godot.Core.AudioEffectChorus.set_wet)
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

instance NodeProperty AudioEffectChorus "dry" Float 'False where
        nodeProperty = (get_dry, wrapDroppingSetter set_dry, Nothing)

instance NodeProperty AudioEffectChorus "voice/1/cutoff_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_voice_cutoff_hz,
             wrapIndexedSetter 0 set_voice_cutoff_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/1/delay_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_voice_delay_ms,
             wrapIndexedSetter 0 set_voice_delay_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/1/depth_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_voice_depth_ms,
             wrapIndexedSetter 0 set_voice_depth_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/1/level_db" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_voice_level_db,
             wrapIndexedSetter 0 set_voice_level_db, Nothing)

instance NodeProperty AudioEffectChorus "voice/1/pan" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_voice_pan,
             wrapIndexedSetter 0 set_voice_pan, Nothing)

instance NodeProperty AudioEffectChorus "voice/1/rate_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_voice_rate_hz,
             wrapIndexedSetter 0 set_voice_rate_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/2/cutoff_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_voice_cutoff_hz,
             wrapIndexedSetter 1 set_voice_cutoff_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/2/delay_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_voice_delay_ms,
             wrapIndexedSetter 1 set_voice_delay_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/2/depth_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_voice_depth_ms,
             wrapIndexedSetter 1 set_voice_depth_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/2/level_db" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_voice_level_db,
             wrapIndexedSetter 1 set_voice_level_db, Nothing)

instance NodeProperty AudioEffectChorus "voice/2/pan" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_voice_pan,
             wrapIndexedSetter 1 set_voice_pan, Nothing)

instance NodeProperty AudioEffectChorus "voice/2/rate_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_voice_rate_hz,
             wrapIndexedSetter 1 set_voice_rate_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/3/cutoff_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_voice_cutoff_hz,
             wrapIndexedSetter 2 set_voice_cutoff_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/3/delay_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_voice_delay_ms,
             wrapIndexedSetter 2 set_voice_delay_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/3/depth_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_voice_depth_ms,
             wrapIndexedSetter 2 set_voice_depth_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/3/level_db" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_voice_level_db,
             wrapIndexedSetter 2 set_voice_level_db, Nothing)

instance NodeProperty AudioEffectChorus "voice/3/pan" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_voice_pan,
             wrapIndexedSetter 2 set_voice_pan, Nothing)

instance NodeProperty AudioEffectChorus "voice/3/rate_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_voice_rate_hz,
             wrapIndexedSetter 2 set_voice_rate_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/4/cutoff_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_voice_cutoff_hz,
             wrapIndexedSetter 3 set_voice_cutoff_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice/4/delay_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_voice_delay_ms,
             wrapIndexedSetter 3 set_voice_delay_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/4/depth_ms" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_voice_depth_ms,
             wrapIndexedSetter 3 set_voice_depth_ms, Nothing)

instance NodeProperty AudioEffectChorus "voice/4/level_db" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_voice_level_db,
             wrapIndexedSetter 3 set_voice_level_db, Nothing)

instance NodeProperty AudioEffectChorus "voice/4/pan" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_voice_pan,
             wrapIndexedSetter 3 set_voice_pan, Nothing)

instance NodeProperty AudioEffectChorus "voice/4/rate_hz" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_voice_rate_hz,
             wrapIndexedSetter 3 set_voice_rate_hz, Nothing)

instance NodeProperty AudioEffectChorus "voice_count" Int 'False
         where
        nodeProperty
          = (get_voice_count, wrapDroppingSetter set_voice_count, Nothing)

instance NodeProperty AudioEffectChorus "wet" Float 'False where
        nodeProperty = (get_wet, wrapDroppingSetter set_wet, Nothing)

{-# NOINLINE bindAudioEffectChorus_get_dry #-}

-- | The effect's raw signal.
bindAudioEffectChorus_get_dry :: MethodBind
bindAudioEffectChorus_get_dry
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's raw signal.
get_dry ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> IO Float
get_dry cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_dry" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_dry

{-# NOINLINE bindAudioEffectChorus_get_voice_count #-}

-- | The amount of voices in the effect.
bindAudioEffectChorus_get_voice_count :: MethodBind
bindAudioEffectChorus_get_voice_count
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of voices in the effect.
get_voice_count ::
                  (AudioEffectChorus :< cls, Object :< cls) => cls -> IO Int
get_voice_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_count

{-# NOINLINE bindAudioEffectChorus_get_voice_cutoff_hz #-}

-- | The voice's cutoff frequency.
bindAudioEffectChorus_get_voice_cutoff_hz :: MethodBind
bindAudioEffectChorus_get_voice_cutoff_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_cutoff_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's cutoff frequency.
get_voice_cutoff_hz ::
                      (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_cutoff_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_cutoff_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_cutoff_hz" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_cutoff_hz

{-# NOINLINE bindAudioEffectChorus_get_voice_delay_ms #-}

-- | The voice's signal delay.
bindAudioEffectChorus_get_voice_delay_ms :: MethodBind
bindAudioEffectChorus_get_voice_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's signal delay.
get_voice_delay_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_delay_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_delay_ms" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_delay_ms

{-# NOINLINE bindAudioEffectChorus_get_voice_depth_ms #-}

-- | The voice filter's depth.
bindAudioEffectChorus_get_voice_depth_ms :: MethodBind
bindAudioEffectChorus_get_voice_depth_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_depth_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice filter's depth.
get_voice_depth_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_depth_ms cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_depth_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_depth_ms" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_depth_ms

{-# NOINLINE bindAudioEffectChorus_get_voice_level_db #-}

-- | The voice's volume.
bindAudioEffectChorus_get_voice_level_db :: MethodBind
bindAudioEffectChorus_get_voice_level_db
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's volume.
get_voice_level_db ::
                     (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_level_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_level_db" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_level_db

{-# NOINLINE bindAudioEffectChorus_get_voice_pan #-}

-- | The voice's pan level.
bindAudioEffectChorus_get_voice_pan :: MethodBind
bindAudioEffectChorus_get_voice_pan
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's pan level.
get_voice_pan ::
                (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_pan" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_pan

{-# NOINLINE bindAudioEffectChorus_get_voice_rate_hz #-}

-- | The voice's filter rate.
bindAudioEffectChorus_get_voice_rate_hz :: MethodBind
bindAudioEffectChorus_get_voice_rate_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_voice_rate_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's filter rate.
get_voice_rate_hz ::
                    (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO Float
get_voice_rate_hz cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_voice_rate_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_voice_rate_hz" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_voice_rate_hz

{-# NOINLINE bindAudioEffectChorus_get_wet #-}

-- | The effect's processed signal.
bindAudioEffectChorus_get_wet :: MethodBind
bindAudioEffectChorus_get_wet
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "get_wet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's processed signal.
get_wet ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> IO Float
get_wet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_get_wet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "get_wet" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectChorus.get_wet

{-# NOINLINE bindAudioEffectChorus_set_dry #-}

-- | The effect's raw signal.
bindAudioEffectChorus_set_dry :: MethodBind
bindAudioEffectChorus_set_dry
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_dry" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's raw signal.
set_dry ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> Float -> IO ()
set_dry cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_dry (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_dry" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_dry

{-# NOINLINE bindAudioEffectChorus_set_voice_count #-}

-- | The amount of voices in the effect.
bindAudioEffectChorus_set_voice_count :: MethodBind
bindAudioEffectChorus_set_voice_count
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of voices in the effect.
set_voice_count ::
                  (AudioEffectChorus :< cls, Object :< cls) => cls -> Int -> IO ()
set_voice_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_count" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_count

{-# NOINLINE bindAudioEffectChorus_set_voice_cutoff_hz #-}

-- | The voice's cutoff frequency.
bindAudioEffectChorus_set_voice_cutoff_hz :: MethodBind
bindAudioEffectChorus_set_voice_cutoff_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_cutoff_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's cutoff frequency.
set_voice_cutoff_hz ::
                      (AudioEffectChorus :< cls, Object :< cls) =>
                      cls -> Int -> Float -> IO ()
set_voice_cutoff_hz cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_cutoff_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_cutoff_hz"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_cutoff_hz

{-# NOINLINE bindAudioEffectChorus_set_voice_delay_ms #-}

-- | The voice's signal delay.
bindAudioEffectChorus_set_voice_delay_ms :: MethodBind
bindAudioEffectChorus_set_voice_delay_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_delay_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's signal delay.
set_voice_delay_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) =>
                     cls -> Int -> Float -> IO ()
set_voice_delay_ms cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_delay_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_delay_ms"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_delay_ms

{-# NOINLINE bindAudioEffectChorus_set_voice_depth_ms #-}

-- | The voice filter's depth.
bindAudioEffectChorus_set_voice_depth_ms :: MethodBind
bindAudioEffectChorus_set_voice_depth_ms
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_depth_ms" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice filter's depth.
set_voice_depth_ms ::
                     (AudioEffectChorus :< cls, Object :< cls) =>
                     cls -> Int -> Float -> IO ()
set_voice_depth_ms cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_depth_ms
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_depth_ms"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_depth_ms

{-# NOINLINE bindAudioEffectChorus_set_voice_level_db #-}

-- | The voice's volume.
bindAudioEffectChorus_set_voice_level_db :: MethodBind
bindAudioEffectChorus_set_voice_level_db
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_level_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's volume.
set_voice_level_db ::
                     (AudioEffectChorus :< cls, Object :< cls) =>
                     cls -> Int -> Float -> IO ()
set_voice_level_db cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_level_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_level_db"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_level_db

{-# NOINLINE bindAudioEffectChorus_set_voice_pan #-}

-- | The voice's pan level.
bindAudioEffectChorus_set_voice_pan :: MethodBind
bindAudioEffectChorus_set_voice_pan
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's pan level.
set_voice_pan ::
                (AudioEffectChorus :< cls, Object :< cls) =>
                cls -> Int -> Float -> IO ()
set_voice_pan cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_pan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_pan" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_pan

{-# NOINLINE bindAudioEffectChorus_set_voice_rate_hz #-}

-- | The voice's filter rate.
bindAudioEffectChorus_set_voice_rate_hz :: MethodBind
bindAudioEffectChorus_set_voice_rate_hz
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_voice_rate_hz" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The voice's filter rate.
set_voice_rate_hz ::
                    (AudioEffectChorus :< cls, Object :< cls) =>
                    cls -> Int -> Float -> IO ()
set_voice_rate_hz cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_voice_rate_hz
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_voice_rate_hz"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_voice_rate_hz

{-# NOINLINE bindAudioEffectChorus_set_wet #-}

-- | The effect's processed signal.
bindAudioEffectChorus_set_wet :: MethodBind
bindAudioEffectChorus_set_wet
  = unsafePerformIO $
      withCString "AudioEffectChorus" $
        \ clsNamePtr ->
          withCString "set_wet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The effect's processed signal.
set_wet ::
          (AudioEffectChorus :< cls, Object :< cls) => cls -> Float -> IO ()
set_wet cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectChorus_set_wet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectChorus "set_wet" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectChorus.set_wet