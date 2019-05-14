{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeBlend2
       (Godot.Core.AnimationNodeBlend2.set_use_sync,
        Godot.Core.AnimationNodeBlend2.is_using_sync)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeBlend2_set_use_sync #-}

bindAnimationNodeBlend2_set_use_sync :: MethodBind
bindAnimationNodeBlend2_set_use_sync
  = unsafePerformIO $
      withCString "AnimationNodeBlend2" $
        \ clsNamePtr ->
          withCString "set_use_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_sync ::
               (AnimationNodeBlend2 :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_sync cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlend2_set_use_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlend2_is_using_sync #-}

bindAnimationNodeBlend2_is_using_sync :: MethodBind
bindAnimationNodeBlend2_is_using_sync
  = unsafePerformIO $
      withCString "AnimationNodeBlend2" $
        \ clsNamePtr ->
          withCString "is_using_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_sync ::
                (AnimationNodeBlend2 :< cls, Object :< cls) => cls -> IO Bool
is_using_sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlend2_is_using_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)