{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectPanner
       (Godot.Core.AudioEffectPanner.get_pan,
        Godot.Core.AudioEffectPanner.set_pan)
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

instance NodeProperty AudioEffectPanner "pan" Float 'False where
        nodeProperty = (get_pan, wrapDroppingSetter set_pan, Nothing)

{-# NOINLINE bindAudioEffectPanner_get_pan #-}

-- | Pan position. Value can range from -1 (fully left) to 1 (fully right).
bindAudioEffectPanner_get_pan :: MethodBind
bindAudioEffectPanner_get_pan
  = unsafePerformIO $
      withCString "AudioEffectPanner" $
        \ clsNamePtr ->
          withCString "get_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position. Value can range from -1 (fully left) to 1 (fully right).
get_pan ::
          (AudioEffectPanner :< cls, Object :< cls) => cls -> IO Float
get_pan cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPanner_get_pan (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPanner "get_pan" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectPanner.get_pan

{-# NOINLINE bindAudioEffectPanner_set_pan #-}

-- | Pan position. Value can range from -1 (fully left) to 1 (fully right).
bindAudioEffectPanner_set_pan :: MethodBind
bindAudioEffectPanner_set_pan
  = unsafePerformIO $
      withCString "AudioEffectPanner" $
        \ clsNamePtr ->
          withCString "set_pan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pan position. Value can range from -1 (fully left) to 1 (fully right).
set_pan ::
          (AudioEffectPanner :< cls, Object :< cls) => cls -> Float -> IO ()
set_pan cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectPanner_set_pan (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectPanner "set_pan" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectPanner.set_pan