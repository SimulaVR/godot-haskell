{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeStateMachinePlayback
       (Godot.Core.AnimationNodeStateMachinePlayback.travel,
        Godot.Core.AnimationNodeStateMachinePlayback.start,
        Godot.Core.AnimationNodeStateMachinePlayback.stop,
        Godot.Core.AnimationNodeStateMachinePlayback.is_playing,
        Godot.Core.AnimationNodeStateMachinePlayback.get_current_node,
        Godot.Core.AnimationNodeStateMachinePlayback.get_travel_path)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeStateMachinePlayback_travel #-}

-- | Transition from the current state to another one, while visiting all the intermediate ones. This is done via the A* algorithm.
bindAnimationNodeStateMachinePlayback_travel :: MethodBind
bindAnimationNodeStateMachinePlayback_travel
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transition from the current state to another one, while visiting all the intermediate ones. This is done via the A* algorithm.
travel ::
         (AnimationNodeStateMachinePlayback :< cls, Object :< cls) =>
         cls -> GodotString -> IO ()
travel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachinePlayback_travel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachinePlayback_start #-}

bindAnimationNodeStateMachinePlayback_start :: MethodBind
bindAnimationNodeStateMachinePlayback_start
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

start ::
        (AnimationNodeStateMachinePlayback :< cls, Object :< cls) =>
        cls -> GodotString -> IO ()
start cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachinePlayback_start
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachinePlayback_stop #-}

bindAnimationNodeStateMachinePlayback_stop :: MethodBind
bindAnimationNodeStateMachinePlayback_stop
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

stop ::
       (AnimationNodeStateMachinePlayback :< cls, Object :< cls) =>
       cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachinePlayback_stop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachinePlayback_is_playing #-}

bindAnimationNodeStateMachinePlayback_is_playing :: MethodBind
bindAnimationNodeStateMachinePlayback_is_playing
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_playing ::
             (AnimationNodeStateMachinePlayback :< cls, Object :< cls) =>
             cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachinePlayback_is_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachinePlayback_get_current_node
             #-}

bindAnimationNodeStateMachinePlayback_get_current_node ::
                                                       MethodBind
bindAnimationNodeStateMachinePlayback_get_current_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "get_current_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_current_node ::
                   (AnimationNodeStateMachinePlayback :< cls, Object :< cls) =>
                   cls -> IO GodotString
get_current_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachinePlayback_get_current_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachinePlayback_get_travel_path
             #-}

bindAnimationNodeStateMachinePlayback_get_travel_path :: MethodBind
bindAnimationNodeStateMachinePlayback_get_travel_path
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "get_travel_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_travel_path ::
                  (AnimationNodeStateMachinePlayback :< cls, Object :< cls) =>
                  cls -> IO PoolStringArray
get_travel_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachinePlayback_get_travel_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)