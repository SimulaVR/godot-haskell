{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeTransition
       (Godot.Core.AnimationNodeTransition.set_enabled_inputs,
        Godot.Core.AnimationNodeTransition.get_enabled_inputs,
        Godot.Core.AnimationNodeTransition.set_input_as_auto_advance,
        Godot.Core.AnimationNodeTransition.is_input_set_as_auto_advance,
        Godot.Core.AnimationNodeTransition.set_input_caption,
        Godot.Core.AnimationNodeTransition.get_input_caption,
        Godot.Core.AnimationNodeTransition.set_cross_fade_time,
        Godot.Core.AnimationNodeTransition.get_cross_fade_time)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeTransition_set_enabled_inputs #-}

bindAnimationNodeTransition_set_enabled_inputs :: MethodBind
bindAnimationNodeTransition_set_enabled_inputs
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_enabled_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_enabled_inputs ::
                     (AnimationNodeTransition :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
set_enabled_inputs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_enabled_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_get_enabled_inputs #-}

bindAnimationNodeTransition_get_enabled_inputs :: MethodBind
bindAnimationNodeTransition_get_enabled_inputs
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "get_enabled_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_enabled_inputs ::
                     (AnimationNodeTransition :< cls, Object :< cls) => cls -> IO Int
get_enabled_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_get_enabled_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_set_input_as_auto_advance
             #-}

bindAnimationNodeTransition_set_input_as_auto_advance :: MethodBind
bindAnimationNodeTransition_set_input_as_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_input_as_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_as_auto_advance ::
                            (AnimationNodeTransition :< cls, Object :< cls) =>
                            cls -> Int -> Bool -> IO ()
set_input_as_auto_advance cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_input_as_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_is_input_set_as_auto_advance
             #-}

bindAnimationNodeTransition_is_input_set_as_auto_advance ::
                                                         MethodBind
bindAnimationNodeTransition_is_input_set_as_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "is_input_set_as_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_input_set_as_auto_advance ::
                               (AnimationNodeTransition :< cls, Object :< cls) =>
                               cls -> Int -> IO Bool
is_input_set_as_auto_advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_is_input_set_as_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_set_input_caption #-}

bindAnimationNodeTransition_set_input_caption :: MethodBind
bindAnimationNodeTransition_set_input_caption
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_input_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_caption ::
                    (AnimationNodeTransition :< cls, Object :< cls) =>
                    cls -> Int -> GodotString -> IO ()
set_input_caption cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_input_caption
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_get_input_caption #-}

bindAnimationNodeTransition_get_input_caption :: MethodBind
bindAnimationNodeTransition_get_input_caption
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "get_input_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_caption ::
                    (AnimationNodeTransition :< cls, Object :< cls) =>
                    cls -> Int -> IO GodotString
get_input_caption cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_get_input_caption
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_set_cross_fade_time #-}

bindAnimationNodeTransition_set_cross_fade_time :: MethodBind
bindAnimationNodeTransition_set_cross_fade_time
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_cross_fade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cross_fade_time ::
                      (AnimationNodeTransition :< cls, Object :< cls) =>
                      cls -> Float -> IO ()
set_cross_fade_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_cross_fade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeTransition_get_cross_fade_time #-}

bindAnimationNodeTransition_get_cross_fade_time :: MethodBind
bindAnimationNodeTransition_get_cross_fade_time
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "get_cross_fade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cross_fade_time ::
                      (AnimationNodeTransition :< cls, Object :< cls) => cls -> IO Float
get_cross_fade_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_get_cross_fade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)