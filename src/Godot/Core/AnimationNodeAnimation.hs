{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeAnimation
       (Godot.Core.AnimationNodeAnimation.set_animation,
        Godot.Core.AnimationNodeAnimation.get_animation)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeAnimation_set_animation #-}

bindAnimationNodeAnimation_set_animation :: MethodBind
bindAnimationNodeAnimation_set_animation
  = unsafePerformIO $
      withCString "AnimationNodeAnimation" $
        \ clsNamePtr ->
          withCString "set_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeAnimation_get_animation #-}

bindAnimationNodeAnimation_get_animation :: MethodBind
bindAnimationNodeAnimation_get_animation
  = unsafePerformIO $
      withCString "AnimationNodeAnimation" $
        \ clsNamePtr ->
          withCString "get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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