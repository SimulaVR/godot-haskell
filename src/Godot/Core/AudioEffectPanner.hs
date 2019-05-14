{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioEffectPanner
       (Godot.Core.AudioEffectPanner.set_pan,
        Godot.Core.AudioEffectPanner.get_pan)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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