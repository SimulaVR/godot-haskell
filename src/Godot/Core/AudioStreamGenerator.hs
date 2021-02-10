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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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