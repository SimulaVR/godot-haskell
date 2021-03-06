{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioEffectStereoEnhance
       (Godot.Core.AudioEffectStereoEnhance.get_pan_pullout,
        Godot.Core.AudioEffectStereoEnhance.get_surround,
        Godot.Core.AudioEffectStereoEnhance.get_time_pullout,
        Godot.Core.AudioEffectStereoEnhance.set_pan_pullout,
        Godot.Core.AudioEffectStereoEnhance.set_surround,
        Godot.Core.AudioEffectStereoEnhance.set_time_pullout)
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

instance NodeProperty AudioEffectStereoEnhance "pan_pullout" Float
           'False
         where
        nodeProperty
          = (get_pan_pullout, wrapDroppingSetter set_pan_pullout, Nothing)

instance NodeProperty AudioEffectStereoEnhance "surround" Float
           'False
         where
        nodeProperty
          = (get_surround, wrapDroppingSetter set_surround, Nothing)

instance NodeProperty AudioEffectStereoEnhance "time_pullout_ms"
           Float
           'False
         where
        nodeProperty
          = (get_time_pullout, wrapDroppingSetter set_time_pullout, Nothing)

{-# NOINLINE bindAudioEffectStereoEnhance_get_pan_pullout #-}

bindAudioEffectStereoEnhance_get_pan_pullout :: MethodBind
bindAudioEffectStereoEnhance_get_pan_pullout
  = unsafePerformIO $
      withCString "AudioEffectStereoEnhance" $
        \ clsNamePtr ->
          withCString "get_pan_pullout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pan_pullout ::
                  (AudioEffectStereoEnhance :< cls, Object :< cls) => cls -> IO Float
get_pan_pullout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectStereoEnhance_get_pan_pullout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectStereoEnhance "get_pan_pullout" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectStereoEnhance.get_pan_pullout

{-# NOINLINE bindAudioEffectStereoEnhance_get_surround #-}

bindAudioEffectStereoEnhance_get_surround :: MethodBind
bindAudioEffectStereoEnhance_get_surround
  = unsafePerformIO $
      withCString "AudioEffectStereoEnhance" $
        \ clsNamePtr ->
          withCString "get_surround" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_surround ::
               (AudioEffectStereoEnhance :< cls, Object :< cls) => cls -> IO Float
get_surround cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectStereoEnhance_get_surround
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectStereoEnhance "get_surround" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectStereoEnhance.get_surround

{-# NOINLINE bindAudioEffectStereoEnhance_get_time_pullout #-}

bindAudioEffectStereoEnhance_get_time_pullout :: MethodBind
bindAudioEffectStereoEnhance_get_time_pullout
  = unsafePerformIO $
      withCString "AudioEffectStereoEnhance" $
        \ clsNamePtr ->
          withCString "get_time_pullout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_time_pullout ::
                   (AudioEffectStereoEnhance :< cls, Object :< cls) => cls -> IO Float
get_time_pullout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectStereoEnhance_get_time_pullout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectStereoEnhance "get_time_pullout" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioEffectStereoEnhance.get_time_pullout

{-# NOINLINE bindAudioEffectStereoEnhance_set_pan_pullout #-}

bindAudioEffectStereoEnhance_set_pan_pullout :: MethodBind
bindAudioEffectStereoEnhance_set_pan_pullout
  = unsafePerformIO $
      withCString "AudioEffectStereoEnhance" $
        \ clsNamePtr ->
          withCString "set_pan_pullout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_pan_pullout ::
                  (AudioEffectStereoEnhance :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_pan_pullout cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectStereoEnhance_set_pan_pullout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectStereoEnhance "set_pan_pullout"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectStereoEnhance.set_pan_pullout

{-# NOINLINE bindAudioEffectStereoEnhance_set_surround #-}

bindAudioEffectStereoEnhance_set_surround :: MethodBind
bindAudioEffectStereoEnhance_set_surround
  = unsafePerformIO $
      withCString "AudioEffectStereoEnhance" $
        \ clsNamePtr ->
          withCString "set_surround" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_surround ::
               (AudioEffectStereoEnhance :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_surround cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioEffectStereoEnhance_set_surround
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectStereoEnhance "set_surround"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectStereoEnhance.set_surround

{-# NOINLINE bindAudioEffectStereoEnhance_set_time_pullout #-}

bindAudioEffectStereoEnhance_set_time_pullout :: MethodBind
bindAudioEffectStereoEnhance_set_time_pullout
  = unsafePerformIO $
      withCString "AudioEffectStereoEnhance" $
        \ clsNamePtr ->
          withCString "set_time_pullout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_time_pullout ::
                   (AudioEffectStereoEnhance :< cls, Object :< cls) =>
                   cls -> Float -> IO ()
set_time_pullout cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAudioEffectStereoEnhance_set_time_pullout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioEffectStereoEnhance "set_time_pullout"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioEffectStereoEnhance.set_time_pullout