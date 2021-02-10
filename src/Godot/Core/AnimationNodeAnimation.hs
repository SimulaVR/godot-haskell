{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeAnimation
       (Godot.Core.AnimationNodeAnimation.get_animation,
        Godot.Core.AnimationNodeAnimation.set_animation)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeAnimation_get_animation #-}

-- | Animation to use as an output. It is one of the animations provided by [member AnimationTree.anim_player].
bindAnimationNodeAnimation_get_animation :: MethodBind
bindAnimationNodeAnimation_get_animation
  = unsafePerformIO $
      withCString "AnimationNodeAnimation" $
        \ clsNamePtr ->
          withCString "get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animation to use as an output. It is one of the animations provided by [member AnimationTree.anim_player].
get_animation ::
                (AnimationNodeAnimation :< cls, Object :< cls) =>
                cls -> IO GodotString
get_animation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeAnimation_get_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeAnimation_set_animation #-}

-- | Animation to use as an output. It is one of the animations provided by [member AnimationTree.anim_player].
bindAnimationNodeAnimation_set_animation :: MethodBind
bindAnimationNodeAnimation_set_animation
  = unsafePerformIO $
      withCString "AnimationNodeAnimation" $
        \ clsNamePtr ->
          withCString "set_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animation to use as an output. It is one of the animations provided by [member AnimationTree.anim_player].
set_animation ::
                (AnimationNodeAnimation :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeAnimation_set_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)