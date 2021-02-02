{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventGesture
       (Godot.Core.InputEventGesture.get_position,
        Godot.Core.InputEventGesture.set_position)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventGesture_get_position #-}

bindInputEventGesture_get_position :: MethodBind
bindInputEventGesture_get_position
  = unsafePerformIO $
      withCString "InputEventGesture" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_position ::
               (InputEventGesture :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventGesture_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventGesture_set_position #-}

bindInputEventGesture_set_position :: MethodBind
bindInputEventGesture_set_position
  = unsafePerformIO $
      withCString "InputEventGesture" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_position ::
               (InputEventGesture :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventGesture_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)