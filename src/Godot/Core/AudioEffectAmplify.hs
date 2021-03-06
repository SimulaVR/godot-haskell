{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectAmplify
       (Godot.Core.AudioEffectAmplify.get_volume_db,
        Godot.Core.AudioEffectAmplify.set_volume_db)
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

instance NodeProperty AudioEffectAmplify "volume_db" Float 'False
         where
        nodeProperty
          = (get_volume_db, wrapDroppingSetter set_volume_db, Nothing)

{-# NOINLINE bindAudioEffectAmplify_get_volume_db #-}

-- | Amount of amplification in decibels. Positive values make the sound louder, negative values make it quieter. Value can range from -80 to 24.
bindAudioEffectAmplify_get_volume_db :: MethodBind
bindAudioEffectAmplify_get_volume_db
  = unsafePerformIO $
      withCString "AudioEffectAmplify" $
        \ clsNamePtr ->
          withCString "get_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of amplification in decibels. Positive values make the sound louder, negative values make it quieter. Value can range from -80 to 24.
get_volume_db ::
                (AudioEffectAmplify :< cls, Object :< cls) => cls -> IO Float
get_volume_db cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectAmplify_get_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectAmplify "get_volume_db" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectAmplify.get_volume_db

{-# NOINLINE bindAudioEffectAmplify_set_volume_db #-}

-- | Amount of amplification in decibels. Positive values make the sound louder, negative values make it quieter. Value can range from -80 to 24.
bindAudioEffectAmplify_set_volume_db :: MethodBind
bindAudioEffectAmplify_set_volume_db
  = unsafePerformIO $
      withCString "AudioEffectAmplify" $
        \ clsNamePtr ->
          withCString "set_volume_db" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of amplification in decibels. Positive values make the sound louder, negative values make it quieter. Value can range from -80 to 24.
set_volume_db ::
                (AudioEffectAmplify :< cls, Object :< cls) => cls -> Float -> IO ()
set_volume_db cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectAmplify_set_volume_db
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectAmplify "set_volume_db" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectAmplify.set_volume_db