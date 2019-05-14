{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeAdd2
       (Godot.Core.AnimationNodeAdd2.set_use_sync,
        Godot.Core.AnimationNodeAdd2.is_using_sync)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeAdd2_set_use_sync #-}

bindAnimationNodeAdd2_set_use_sync :: MethodBind
bindAnimationNodeAdd2_set_use_sync
  = unsafePerformIO $
      withCString "AnimationNodeAdd2" $
        \ clsNamePtr ->
          withCString "set_use_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_sync ::
               (AnimationNodeAdd2 :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_sync cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeAdd2_set_use_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeAdd2_is_using_sync #-}

bindAnimationNodeAdd2_is_using_sync :: MethodBind
bindAnimationNodeAdd2_is_using_sync
  = unsafePerformIO $
      withCString "AnimationNodeAdd2" $
        \ clsNamePtr ->
          withCString "is_using_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_sync ::
                (AnimationNodeAdd2 :< cls, Object :< cls) => cls -> IO Bool
is_using_sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeAdd2_is_using_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)