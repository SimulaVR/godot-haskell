{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AudioStream (Godot.Core.AudioStream.get_length)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAudioStream_get_length #-}

-- | Returns the length of the audio stream in seconds.
bindAudioStream_get_length :: MethodBind
bindAudioStream_get_length
  = unsafePerformIO $
      withCString "AudioStream" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the length of the audio stream in seconds.
get_length ::
             (AudioStream :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStream_get_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)