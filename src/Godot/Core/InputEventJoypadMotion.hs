{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventJoypadMotion
       (Godot.Core.InputEventJoypadMotion.get_axis,
        Godot.Core.InputEventJoypadMotion.get_axis_value,
        Godot.Core.InputEventJoypadMotion.set_axis,
        Godot.Core.InputEventJoypadMotion.set_axis_value)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventJoypadMotion_get_axis #-}

-- | Axis identifier. Use one of the [enum JoystickList] axis constants.
bindInputEventJoypadMotion_get_axis :: MethodBind
bindInputEventJoypadMotion_get_axis
  = unsafePerformIO $
      withCString "InputEventJoypadMotion" $
        \ clsNamePtr ->
          withCString "get_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Axis identifier. Use one of the [enum JoystickList] axis constants.
get_axis ::
           (InputEventJoypadMotion :< cls, Object :< cls) => cls -> IO Int
get_axis cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadMotion_get_axis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadMotion_get_axis_value #-}

-- | Current position of the joystick on the given axis. The value ranges from [code]-1.0[/code] to [code]1.0[/code]. A value of [code]0[/code] means the axis is in its resting position.
bindInputEventJoypadMotion_get_axis_value :: MethodBind
bindInputEventJoypadMotion_get_axis_value
  = unsafePerformIO $
      withCString "InputEventJoypadMotion" $
        \ clsNamePtr ->
          withCString "get_axis_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current position of the joystick on the given axis. The value ranges from [code]-1.0[/code] to [code]1.0[/code]. A value of [code]0[/code] means the axis is in its resting position.
get_axis_value ::
                 (InputEventJoypadMotion :< cls, Object :< cls) => cls -> IO Float
get_axis_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadMotion_get_axis_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadMotion_set_axis #-}

-- | Axis identifier. Use one of the [enum JoystickList] axis constants.
bindInputEventJoypadMotion_set_axis :: MethodBind
bindInputEventJoypadMotion_set_axis
  = unsafePerformIO $
      withCString "InputEventJoypadMotion" $
        \ clsNamePtr ->
          withCString "set_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Axis identifier. Use one of the [enum JoystickList] axis constants.
set_axis ::
           (InputEventJoypadMotion :< cls, Object :< cls) =>
           cls -> Int -> IO ()
set_axis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadMotion_set_axis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventJoypadMotion_set_axis_value #-}

-- | Current position of the joystick on the given axis. The value ranges from [code]-1.0[/code] to [code]1.0[/code]. A value of [code]0[/code] means the axis is in its resting position.
bindInputEventJoypadMotion_set_axis_value :: MethodBind
bindInputEventJoypadMotion_set_axis_value
  = unsafePerformIO $
      withCString "InputEventJoypadMotion" $
        \ clsNamePtr ->
          withCString "set_axis_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current position of the joystick on the given axis. The value ranges from [code]-1.0[/code] to [code]1.0[/code]. A value of [code]0[/code] means the axis is in its resting position.
set_axis_value ::
                 (InputEventJoypadMotion :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_axis_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadMotion_set_axis_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)