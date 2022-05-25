{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectRecord
       (Godot.Core.AudioEffectRecord.get_format,
        Godot.Core.AudioEffectRecord.get_recording,
        Godot.Core.AudioEffectRecord.is_recording_active,
        Godot.Core.AudioEffectRecord.set_format,
        Godot.Core.AudioEffectRecord.set_recording_active)
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

instance NodeProperty AudioEffectRecord "format" Int 'False where
        nodeProperty = (get_format, wrapDroppingSetter set_format, Nothing)

{-# NOINLINE bindAudioEffectRecord_get_format #-}

bindAudioEffectRecord_get_format :: MethodBind
bindAudioEffectRecord_get_format
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_format ::
             (AudioEffectRecord :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_get_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectRecord "get_format" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AudioEffectRecord.get_format

{-# NOINLINE bindAudioEffectRecord_get_recording #-}

bindAudioEffectRecord_get_recording :: MethodBind
bindAudioEffectRecord_get_recording
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "get_recording" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_recording ::
                (AudioEffectRecord :< cls, Object :< cls) =>
                cls -> IO AudioStreamSample
get_recording cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_get_recording
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectRecord "get_recording" '[]
           (IO AudioStreamSample)
         where
        nodeMethod = Godot.Core.AudioEffectRecord.get_recording

{-# NOINLINE bindAudioEffectRecord_is_recording_active #-}

bindAudioEffectRecord_is_recording_active :: MethodBind
bindAudioEffectRecord_is_recording_active
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "is_recording_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_recording_active ::
                      (AudioEffectRecord :< cls, Object :< cls) => cls -> IO Bool
is_recording_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_is_recording_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectRecord "is_recording_active" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioEffectRecord.is_recording_active

{-# NOINLINE bindAudioEffectRecord_set_format #-}

bindAudioEffectRecord_set_format :: MethodBind
bindAudioEffectRecord_set_format
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "set_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_format ::
             (AudioEffectRecord :< cls, Object :< cls) => cls -> Int -> IO ()
set_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_set_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectRecord "set_format" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectRecord.set_format

{-# NOINLINE bindAudioEffectRecord_set_recording_active #-}

bindAudioEffectRecord_set_recording_active :: MethodBind
bindAudioEffectRecord_set_recording_active
  = unsafePerformIO $
      withCString "AudioEffectRecord" $
        \ clsNamePtr ->
          withCString "set_recording_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_recording_active ::
                       (AudioEffectRecord :< cls, Object :< cls) => cls -> Bool -> IO ()
set_recording_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectRecord_set_recording_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectRecord "set_recording_active"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectRecord.set_recording_active