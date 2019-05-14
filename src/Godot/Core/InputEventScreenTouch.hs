{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventScreenTouch
       (Godot.Core.InputEventScreenTouch.is_pressed,
        Godot.Core.InputEventScreenTouch.set_index,
        Godot.Core.InputEventScreenTouch.get_index,
        Godot.Core.InputEventScreenTouch.set_position,
        Godot.Core.InputEventScreenTouch.get_position,
        Godot.Core.InputEventScreenTouch.set_pressed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventScreenTouch_is_pressed #-}

-- | If [code]true[/code], the touch's state is pressed. If [code]false[/code], the touch's state is released.
bindInputEventScreenTouch_is_pressed :: MethodBind
bindInputEventScreenTouch_is_pressed
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the touch's state is pressed. If [code]false[/code], the touch's state is released.
is_pressed ::
             (InputEventScreenTouch :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_is_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventScreenTouch_set_index #-}

-- | Touch index in the case of a multi-touch event. One index = one finger.
bindInputEventScreenTouch_set_index :: MethodBind
bindInputEventScreenTouch_set_index
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "set_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Touch index in the case of a multi-touch event. One index = one finger.
set_index ::
            (InputEventScreenTouch :< cls, Object :< cls) =>
            cls -> Int -> IO ()
set_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_set_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventScreenTouch_get_index #-}

-- | Touch index in the case of a multi-touch event. One index = one finger.
bindInputEventScreenTouch_get_index :: MethodBind
bindInputEventScreenTouch_get_index
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "get_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Touch index in the case of a multi-touch event. One index = one finger.
get_index ::
            (InputEventScreenTouch :< cls, Object :< cls) => cls -> IO Int
get_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_get_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventScreenTouch_set_position #-}

-- | Touch position.
bindInputEventScreenTouch_set_position :: MethodBind
bindInputEventScreenTouch_set_position
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Touch position.
set_position ::
               (InputEventScreenTouch :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventScreenTouch_get_position #-}

-- | Touch position.
bindInputEventScreenTouch_get_position :: MethodBind
bindInputEventScreenTouch_get_position
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Touch position.
get_position ::
               (InputEventScreenTouch :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventScreenTouch_set_pressed #-}

-- | If [code]true[/code], the touch's state is pressed. If [code]false[/code], the touch's state is released.
bindInputEventScreenTouch_set_pressed :: MethodBind
bindInputEventScreenTouch_set_pressed
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the touch's state is pressed. If [code]false[/code], the touch's state is released.
set_pressed ::
              (InputEventScreenTouch :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_set_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)