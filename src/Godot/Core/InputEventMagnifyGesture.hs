{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventMagnifyGesture
       (Godot.Core.InputEventMagnifyGesture.get_factor,
        Godot.Core.InputEventMagnifyGesture.set_factor)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventMagnifyGesture_get_factor #-}

bindInputEventMagnifyGesture_get_factor :: MethodBind
bindInputEventMagnifyGesture_get_factor
  = unsafePerformIO $
      withCString "InputEventMagnifyGesture" $
        \ clsNamePtr ->
          withCString "get_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_factor ::
             (InputEventMagnifyGesture :< cls, Object :< cls) => cls -> IO Float
get_factor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMagnifyGesture_get_factor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMagnifyGesture_set_factor #-}

bindInputEventMagnifyGesture_set_factor :: MethodBind
bindInputEventMagnifyGesture_set_factor
  = unsafePerformIO $
      withCString "InputEventMagnifyGesture" $
        \ clsNamePtr ->
          withCString "set_factor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_factor ::
             (InputEventMagnifyGesture :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_factor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMagnifyGesture_set_factor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)