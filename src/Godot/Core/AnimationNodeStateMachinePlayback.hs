{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeStateMachinePlayback
       (Godot.Core.AnimationNodeStateMachinePlayback.get_current_node,
        Godot.Core.AnimationNodeStateMachinePlayback.get_travel_path,
        Godot.Core.AnimationNodeStateMachinePlayback.is_playing,
        Godot.Core.AnimationNodeStateMachinePlayback.start,
        Godot.Core.AnimationNodeStateMachinePlayback.stop,
        Godot.Core.AnimationNodeStateMachinePlayback.travel)
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
import Godot.Core.Resource()

{-# NOINLINE bindAnimationNodeStateMachinePlayback_get_current_node
             #-}

-- | Returns the currently playing animation state.
bindAnimationNodeStateMachinePlayback_get_current_node ::
                                                       MethodBind
bindAnimationNodeStateMachinePlayback_get_current_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "get_current_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently playing animation state.
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

instance NodeMethod AnimationNodeStateMachinePlayback
           "get_current_node"
           '[]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachinePlayback.get_current_node

{-# NOINLINE bindAnimationNodeStateMachinePlayback_get_travel_path
             #-}

-- | Returns the current travel path as computed internally by the A* algorithm.
bindAnimationNodeStateMachinePlayback_get_travel_path :: MethodBind
bindAnimationNodeStateMachinePlayback_get_travel_path
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "get_travel_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current travel path as computed internally by the A* algorithm.
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

instance NodeMethod AnimationNodeStateMachinePlayback
           "get_travel_path"
           '[]
           (IO PoolStringArray)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachinePlayback.get_travel_path

{-# NOINLINE bindAnimationNodeStateMachinePlayback_is_playing #-}

-- | Returns @true@ if an animation is playing.
bindAnimationNodeStateMachinePlayback_is_playing :: MethodBind
bindAnimationNodeStateMachinePlayback_is_playing
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if an animation is playing.
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

instance NodeMethod AnimationNodeStateMachinePlayback "is_playing"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachinePlayback.is_playing

{-# NOINLINE bindAnimationNodeStateMachinePlayback_start #-}

-- | Starts playing the given animation.
bindAnimationNodeStateMachinePlayback_start :: MethodBind
bindAnimationNodeStateMachinePlayback_start
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts playing the given animation.
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

instance NodeMethod AnimationNodeStateMachinePlayback "start"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeStateMachinePlayback.start

{-# NOINLINE bindAnimationNodeStateMachinePlayback_stop #-}

-- | Stops the currently playing animation.
bindAnimationNodeStateMachinePlayback_stop :: MethodBind
bindAnimationNodeStateMachinePlayback_stop
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the currently playing animation.
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

instance NodeMethod AnimationNodeStateMachinePlayback "stop" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeStateMachinePlayback.stop

{-# NOINLINE bindAnimationNodeStateMachinePlayback_travel #-}

-- | Transitions from the current state to another one, following the shortest path.
bindAnimationNodeStateMachinePlayback_travel :: MethodBind
bindAnimationNodeStateMachinePlayback_travel
  = unsafePerformIO $
      withCString "AnimationNodeStateMachinePlayback" $
        \ clsNamePtr ->
          withCString "travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transitions from the current state to another one, following the shortest path.
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

instance NodeMethod AnimationNodeStateMachinePlayback "travel"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeStateMachinePlayback.travel