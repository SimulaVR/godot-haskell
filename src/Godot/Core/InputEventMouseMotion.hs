{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventMouseMotion
       (Godot.Core.InputEventMouseMotion.get_pressure,
        Godot.Core.InputEventMouseMotion.get_relative,
        Godot.Core.InputEventMouseMotion.get_speed,
        Godot.Core.InputEventMouseMotion.get_tilt,
        Godot.Core.InputEventMouseMotion.set_pressure,
        Godot.Core.InputEventMouseMotion.set_relative,
        Godot.Core.InputEventMouseMotion.set_speed,
        Godot.Core.InputEventMouseMotion.set_tilt)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventMouseMotion_get_pressure #-}

-- | Represents the pressure the user puts on the pen. Ranges from [code]0.0[/code] to [code]1.0[/code].
bindInputEventMouseMotion_get_pressure :: MethodBind
bindInputEventMouseMotion_get_pressure
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the pen. Ranges from [code]0.0[/code] to [code]1.0[/code].
get_pressure ::
               (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Float
get_pressure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_get_relative #-}

-- | The mouse position relative to the previous position (position at the last frame).
--   			[b]Note:[/b] Since [InputEventMouseMotion] is only emitted when the mouse moves, the last event won't have a relative position of [code]Vector2(0, 0)[/code] when the user stops moving the mouse.
bindInputEventMouseMotion_get_relative :: MethodBind
bindInputEventMouseMotion_get_relative
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse position relative to the previous position (position at the last frame).
--   			[b]Note:[/b] Since [InputEventMouseMotion] is only emitted when the mouse moves, the last event won't have a relative position of [code]Vector2(0, 0)[/code] when the user stops moving the mouse.
get_relative ::
               (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Vector2
get_relative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_relative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_get_speed #-}

-- | The mouse speed in pixels per second.
bindInputEventMouseMotion_get_speed :: MethodBind
bindInputEventMouseMotion_get_speed
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse speed in pixels per second.
get_speed ::
            (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Vector2
get_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_get_tilt #-}

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from [code]-1.0[/code] to [code]1.0[/code] for both axes.
bindInputEventMouseMotion_get_tilt :: MethodBind
bindInputEventMouseMotion_get_tilt
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from [code]-1.0[/code] to [code]1.0[/code] for both axes.
get_tilt ::
           (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Vector2
get_tilt cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_tilt
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_set_pressure #-}

-- | Represents the pressure the user puts on the pen. Ranges from [code]0.0[/code] to [code]1.0[/code].
bindInputEventMouseMotion_set_pressure :: MethodBind
bindInputEventMouseMotion_set_pressure
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the pen. Ranges from [code]0.0[/code] to [code]1.0[/code].
set_pressure ::
               (InputEventMouseMotion :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_pressure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_set_relative #-}

-- | The mouse position relative to the previous position (position at the last frame).
--   			[b]Note:[/b] Since [InputEventMouseMotion] is only emitted when the mouse moves, the last event won't have a relative position of [code]Vector2(0, 0)[/code] when the user stops moving the mouse.
bindInputEventMouseMotion_set_relative :: MethodBind
bindInputEventMouseMotion_set_relative
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse position relative to the previous position (position at the last frame).
--   			[b]Note:[/b] Since [InputEventMouseMotion] is only emitted when the mouse moves, the last event won't have a relative position of [code]Vector2(0, 0)[/code] when the user stops moving the mouse.
set_relative ::
               (InputEventMouseMotion :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_relative cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_relative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_set_speed #-}

-- | The mouse speed in pixels per second.
bindInputEventMouseMotion_set_speed :: MethodBind
bindInputEventMouseMotion_set_speed
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse speed in pixels per second.
set_speed ::
            (InputEventMouseMotion :< cls, Object :< cls) =>
            cls -> Vector2 -> IO ()
set_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouseMotion_set_tilt #-}

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from [code]-1.0[/code] to [code]1.0[/code] for both axes.
bindInputEventMouseMotion_set_tilt :: MethodBind
bindInputEventMouseMotion_set_tilt
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from [code]-1.0[/code] to [code]1.0[/code] for both axes.
set_tilt ::
           (InputEventMouseMotion :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_tilt cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_tilt
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)