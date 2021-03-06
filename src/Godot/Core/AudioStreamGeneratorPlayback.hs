{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamGeneratorPlayback
       (Godot.Core.AudioStreamGeneratorPlayback.can_push_buffer,
        Godot.Core.AudioStreamGeneratorPlayback.clear_buffer,
        Godot.Core.AudioStreamGeneratorPlayback.get_frames_available,
        Godot.Core.AudioStreamGeneratorPlayback.get_skips,
        Godot.Core.AudioStreamGeneratorPlayback.push_buffer,
        Godot.Core.AudioStreamGeneratorPlayback.push_frame)
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
import Godot.Core.AudioStreamPlaybackResampled()

{-# NOINLINE bindAudioStreamGeneratorPlayback_can_push_buffer #-}

bindAudioStreamGeneratorPlayback_can_push_buffer :: MethodBind
bindAudioStreamGeneratorPlayback_can_push_buffer
  = unsafePerformIO $
      withCString "AudioStreamGeneratorPlayback" $
        \ clsNamePtr ->
          withCString "can_push_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

can_push_buffer ::
                  (AudioStreamGeneratorPlayback :< cls, Object :< cls) =>
                  cls -> Int -> IO Bool
can_push_buffer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamGeneratorPlayback_can_push_buffer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGeneratorPlayback "can_push_buffer"
           '[Int]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AudioStreamGeneratorPlayback.can_push_buffer

{-# NOINLINE bindAudioStreamGeneratorPlayback_clear_buffer #-}

bindAudioStreamGeneratorPlayback_clear_buffer :: MethodBind
bindAudioStreamGeneratorPlayback_clear_buffer
  = unsafePerformIO $
      withCString "AudioStreamGeneratorPlayback" $
        \ clsNamePtr ->
          withCString "clear_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_buffer ::
               (AudioStreamGeneratorPlayback :< cls, Object :< cls) =>
               cls -> IO ()
clear_buffer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamGeneratorPlayback_clear_buffer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGeneratorPlayback "clear_buffer" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamGeneratorPlayback.clear_buffer

{-# NOINLINE bindAudioStreamGeneratorPlayback_get_frames_available
             #-}

bindAudioStreamGeneratorPlayback_get_frames_available :: MethodBind
bindAudioStreamGeneratorPlayback_get_frames_available
  = unsafePerformIO $
      withCString "AudioStreamGeneratorPlayback" $
        \ clsNamePtr ->
          withCString "get_frames_available" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_frames_available ::
                       (AudioStreamGeneratorPlayback :< cls, Object :< cls) =>
                       cls -> IO Int
get_frames_available cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioStreamGeneratorPlayback_get_frames_available
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGeneratorPlayback
           "get_frames_available"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AudioStreamGeneratorPlayback.get_frames_available

{-# NOINLINE bindAudioStreamGeneratorPlayback_get_skips #-}

bindAudioStreamGeneratorPlayback_get_skips :: MethodBind
bindAudioStreamGeneratorPlayback_get_skips
  = unsafePerformIO $
      withCString "AudioStreamGeneratorPlayback" $
        \ clsNamePtr ->
          withCString "get_skips" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skips ::
            (AudioStreamGeneratorPlayback :< cls, Object :< cls) =>
            cls -> IO Int
get_skips cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGeneratorPlayback_get_skips
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGeneratorPlayback "get_skips" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AudioStreamGeneratorPlayback.get_skips

{-# NOINLINE bindAudioStreamGeneratorPlayback_push_buffer #-}

bindAudioStreamGeneratorPlayback_push_buffer :: MethodBind
bindAudioStreamGeneratorPlayback_push_buffer
  = unsafePerformIO $
      withCString "AudioStreamGeneratorPlayback" $
        \ clsNamePtr ->
          withCString "push_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

push_buffer ::
              (AudioStreamGeneratorPlayback :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO Bool
push_buffer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGeneratorPlayback_push_buffer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGeneratorPlayback "push_buffer"
           '[PoolVector2Array]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamGeneratorPlayback.push_buffer

{-# NOINLINE bindAudioStreamGeneratorPlayback_push_frame #-}

bindAudioStreamGeneratorPlayback_push_frame :: MethodBind
bindAudioStreamGeneratorPlayback_push_frame
  = unsafePerformIO $
      withCString "AudioStreamGeneratorPlayback" $
        \ clsNamePtr ->
          withCString "push_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

push_frame ::
             (AudioStreamGeneratorPlayback :< cls, Object :< cls) =>
             cls -> Vector2 -> IO Bool
push_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamGeneratorPlayback_push_frame
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamGeneratorPlayback "push_frame"
           '[Vector2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamGeneratorPlayback.push_frame