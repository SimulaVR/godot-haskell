{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeOneShot
       (Godot.Core.AnimationNodeOneShot._MIX_MODE_ADD,
        Godot.Core.AnimationNodeOneShot._MIX_MODE_BLEND,
        Godot.Core.AnimationNodeOneShot.get_autorestart_delay,
        Godot.Core.AnimationNodeOneShot.get_autorestart_random_delay,
        Godot.Core.AnimationNodeOneShot.get_fadein_time,
        Godot.Core.AnimationNodeOneShot.get_fadeout_time,
        Godot.Core.AnimationNodeOneShot.get_mix_mode,
        Godot.Core.AnimationNodeOneShot.has_autorestart,
        Godot.Core.AnimationNodeOneShot.is_using_sync,
        Godot.Core.AnimationNodeOneShot.set_autorestart,
        Godot.Core.AnimationNodeOneShot.set_autorestart_delay,
        Godot.Core.AnimationNodeOneShot.set_autorestart_random_delay,
        Godot.Core.AnimationNodeOneShot.set_fadein_time,
        Godot.Core.AnimationNodeOneShot.set_fadeout_time,
        Godot.Core.AnimationNodeOneShot.set_mix_mode,
        Godot.Core.AnimationNodeOneShot.set_use_sync)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MIX_MODE_ADD :: Int
_MIX_MODE_ADD = 1

_MIX_MODE_BLEND :: Int
_MIX_MODE_BLEND = 0

{-# NOINLINE bindAnimationNodeOneShot_get_autorestart_delay #-}

-- | The delay after which the automatic restart is triggered, in seconds.
bindAnimationNodeOneShot_get_autorestart_delay :: MethodBind
bindAnimationNodeOneShot_get_autorestart_delay
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "get_autorestart_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The delay after which the automatic restart is triggered, in seconds.
get_autorestart_delay ::
                        (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Float
get_autorestart_delay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeOneShot_get_autorestart_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_get_autorestart_random_delay
             #-}

-- | If [member autorestart] is [code]true[/code], a random additional delay (in seconds) between 0 and this value will be added to [member autorestart_delay].
bindAnimationNodeOneShot_get_autorestart_random_delay :: MethodBind
bindAnimationNodeOneShot_get_autorestart_random_delay
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "get_autorestart_random_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [member autorestart] is [code]true[/code], a random additional delay (in seconds) between 0 and this value will be added to [member autorestart_delay].
get_autorestart_random_delay ::
                               (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Float
get_autorestart_random_delay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeOneShot_get_autorestart_random_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_get_fadein_time #-}

bindAnimationNodeOneShot_get_fadein_time :: MethodBind
bindAnimationNodeOneShot_get_fadein_time
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "get_fadein_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fadein_time ::
                  (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Float
get_fadein_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_get_fadein_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_get_fadeout_time #-}

bindAnimationNodeOneShot_get_fadeout_time :: MethodBind
bindAnimationNodeOneShot_get_fadeout_time
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "get_fadeout_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_fadeout_time ::
                   (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Float
get_fadeout_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_get_fadeout_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_get_mix_mode #-}

bindAnimationNodeOneShot_get_mix_mode :: MethodBind
bindAnimationNodeOneShot_get_mix_mode
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "get_mix_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mix_mode ::
               (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Int
get_mix_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_get_mix_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_has_autorestart #-}

-- | If [code]true[/code], the sub-animation will restart automatically after finishing.
bindAnimationNodeOneShot_has_autorestart :: MethodBind
bindAnimationNodeOneShot_has_autorestart
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "has_autorestart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the sub-animation will restart automatically after finishing.
has_autorestart ::
                  (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Bool
has_autorestart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_has_autorestart
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_is_using_sync #-}

bindAnimationNodeOneShot_is_using_sync :: MethodBind
bindAnimationNodeOneShot_is_using_sync
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "is_using_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_sync ::
                (AnimationNodeOneShot :< cls, Object :< cls) => cls -> IO Bool
is_using_sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_is_using_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_autorestart #-}

-- | If [code]true[/code], the sub-animation will restart automatically after finishing.
bindAnimationNodeOneShot_set_autorestart :: MethodBind
bindAnimationNodeOneShot_set_autorestart
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_autorestart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the sub-animation will restart automatically after finishing.
set_autorestart ::
                  (AnimationNodeOneShot :< cls, Object :< cls) =>
                  cls -> Bool -> IO ()
set_autorestart cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_set_autorestart
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_autorestart_delay #-}

-- | The delay after which the automatic restart is triggered, in seconds.
bindAnimationNodeOneShot_set_autorestart_delay :: MethodBind
bindAnimationNodeOneShot_set_autorestart_delay
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_autorestart_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The delay after which the automatic restart is triggered, in seconds.
set_autorestart_delay ::
                        (AnimationNodeOneShot :< cls, Object :< cls) =>
                        cls -> Float -> IO ()
set_autorestart_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeOneShot_set_autorestart_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_autorestart_random_delay
             #-}

-- | If [member autorestart] is [code]true[/code], a random additional delay (in seconds) between 0 and this value will be added to [member autorestart_delay].
bindAnimationNodeOneShot_set_autorestart_random_delay :: MethodBind
bindAnimationNodeOneShot_set_autorestart_random_delay
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_autorestart_random_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [member autorestart] is [code]true[/code], a random additional delay (in seconds) between 0 and this value will be added to [member autorestart_delay].
set_autorestart_random_delay ::
                               (AnimationNodeOneShot :< cls, Object :< cls) =>
                               cls -> Float -> IO ()
set_autorestart_random_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeOneShot_set_autorestart_random_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_fadein_time #-}

bindAnimationNodeOneShot_set_fadein_time :: MethodBind
bindAnimationNodeOneShot_set_fadein_time
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_fadein_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fadein_time ::
                  (AnimationNodeOneShot :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_fadein_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_set_fadein_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_fadeout_time #-}

bindAnimationNodeOneShot_set_fadeout_time :: MethodBind
bindAnimationNodeOneShot_set_fadeout_time
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_fadeout_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_fadeout_time ::
                   (AnimationNodeOneShot :< cls, Object :< cls) =>
                   cls -> Float -> IO ()
set_fadeout_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_set_fadeout_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_mix_mode #-}

bindAnimationNodeOneShot_set_mix_mode :: MethodBind
bindAnimationNodeOneShot_set_mix_mode
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_mix_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mix_mode ::
               (AnimationNodeOneShot :< cls, Object :< cls) => cls -> Int -> IO ()
set_mix_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_set_mix_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeOneShot_set_use_sync #-}

bindAnimationNodeOneShot_set_use_sync :: MethodBind
bindAnimationNodeOneShot_set_use_sync
  = unsafePerformIO $
      withCString "AnimationNodeOneShot" $
        \ clsNamePtr ->
          withCString "set_use_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_sync ::
               (AnimationNodeOneShot :< cls, Object :< cls) =>
               cls -> Bool -> IO ()
set_use_sync cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeOneShot_set_use_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)