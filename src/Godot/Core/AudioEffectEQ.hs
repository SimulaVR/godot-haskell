{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectEQ
       (Godot.Core.AudioEffectEQ.get_band_count,
        Godot.Core.AudioEffectEQ.get_band_gain_db,
        Godot.Core.AudioEffectEQ.set_band_gain_db)
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

{-# NOINLINE bindAudioEffectEQ_get_band_count #-}

-- | Returns the number of bands of the equalizer.
bindAudioEffectEQ_get_band_count :: MethodBind
bindAudioEffectEQ_get_band_count
  = unsafePerformIO $
      withCString "AudioEffectEQ" $
        \ clsNamePtr ->
          withCString "get_band_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of bands of the equalizer.
get_band_count ::
                 (AudioEffectEQ :< cls, Object :< cls) => cls -> IO Int
get_band_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectEQ_get_band_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectEQ "get_band_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioEffectEQ.get_band_count

{-# NOINLINE bindAudioEffectEQ_get_band_gain_db #-}

-- | Returns the band's gain at the specified index, in dB.
bindAudioEffectEQ_get_band_gain_db :: MethodBind
bindAudioEffectEQ_get_band_gain_db
  = unsafePerformIO $
      withCString "AudioEffectEQ" $
        \ clsNamePtr ->
          withCString "get_band_gain_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the band's gain at the specified index, in dB.
get_band_gain_db ::
                   (AudioEffectEQ :< cls, Object :< cls) => cls -> Int -> IO Float
get_band_gain_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectEQ_get_band_gain_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectEQ "get_band_gain_db" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectEQ.get_band_gain_db

{-# NOINLINE bindAudioEffectEQ_set_band_gain_db #-}

-- | Sets band's gain at the specified index, in dB.
bindAudioEffectEQ_set_band_gain_db :: MethodBind
bindAudioEffectEQ_set_band_gain_db
  = unsafePerformIO $
      withCString "AudioEffectEQ" $
        \ clsNamePtr ->
          withCString "set_band_gain_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets band's gain at the specified index, in dB.
set_band_gain_db ::
                   (AudioEffectEQ :< cls, Object :< cls) =>
                   cls -> Int -> Float -> IO ()
set_band_gain_db cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectEQ_set_band_gain_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectEQ "set_band_gain_db" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectEQ.set_band_gain_db