{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventPanGesture
       (Godot.Core.InputEventPanGesture.get_delta,
        Godot.Core.InputEventPanGesture.set_delta)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventPanGesture_get_delta #-}

bindInputEventPanGesture_get_delta :: MethodBind
bindInputEventPanGesture_get_delta
  = unsafePerformIO $
      withCString "InputEventPanGesture" $
        \ clsNamePtr ->
          withCString "get_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_delta ::
            (InputEventPanGesture :< cls, Object :< cls) => cls -> IO Vector2
get_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventPanGesture_get_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventPanGesture_set_delta #-}

bindInputEventPanGesture_set_delta :: MethodBind
bindInputEventPanGesture_set_delta
  = unsafePerformIO $
      withCString "InputEventPanGesture" $
        \ clsNamePtr ->
          withCString "set_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_delta ::
            (InputEventPanGesture :< cls, Object :< cls) =>
            cls -> Vector2 -> IO ()
set_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventPanGesture_set_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)