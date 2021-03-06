{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamGenerator
       (Godot.Core.AudioStreamGenerator.get_buffer_length,
        Godot.Core.AudioStreamGenerator.get_mix_rate,
        Godot.Core.AudioStreamGenerator.set_buffer_length,
        Godot.Core.AudioStreamGenerator.set_mix_rate)
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
import Godot.Core.AudioStream()

instance NodeProperty AudioStreamGenerator "buffer_length" Float
           'False
         where
        nodeProperty
          = (get_buffer_length, wrapDroppingSetter set_buffer_length,
             Nothing)

instance NodeProperty AudioStreamGenerator "mix_rate" Float 'False
         where
        nodeProperty
          = (get_mix_rate, wrapDroppingSetter set_mix_rate, Nothing)

{-# NOINLINE bindAudioStreamGenerator_get_buffer_length #-}

bindAudioStreamGenerator_get_buffer_length :: MethodBind
bindAudioStreamGenerator_get_buffer_length
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "get_buffer_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_buffer_length ::
                    (AudioStreamGenerator :< cls, Object :< cls) => cls -> IO Float
get_buffer_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_get_buffer_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "get_buffer_length" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.get_buffer_length

{-# NOINLINE bindAudioStreamGenerator_get_mix_rate #-}

bindAudioStreamGenerator_get_mix_rate :: MethodBind
bindAudioStreamGenerator_get_mix_rate
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "get_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mix_rate ::
               (AudioStreamGenerator :< cls, Object :< cls) => cls -> IO Float
get_mix_rate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_get_mix_rate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "get_mix_rate" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.get_mix_rate

{-# NOINLINE bindAudioStreamGenerator_set_buffer_length #-}

bindAudioStreamGenerator_set_buffer_length :: MethodBind
bindAudioStreamGenerator_set_buffer_length
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "set_buffer_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_buffer_length ::
                    (AudioStreamGenerator :< cls, Object :< cls) =>
                    cls -> Float -> IO ()
set_buffer_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_set_buffer_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "set_buffer_length"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.set_buffer_length

{-# NOINLINE bindAudioStreamGenerator_set_mix_rate #-}

bindAudioStreamGenerator_set_mix_rate :: MethodBind
bindAudioStreamGenerator_set_mix_rate
  = unsafePerformIO $
      withCString "AudioStreamGenerator" $
        \ clsNamePtr ->
          withCString "set_mix_rate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mix_rate ::
               (AudioStreamGenerator :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_mix_rate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGenerator_set_mix_rate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGenerator "set_mix_rate" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamGenerator.set_mix_rate