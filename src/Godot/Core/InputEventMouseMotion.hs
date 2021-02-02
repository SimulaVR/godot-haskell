{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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

bindInputEventMouseMotion_get_pressure :: MethodBind
bindInputEventMouseMotion_get_pressure
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

-- | Mouse position relative to the previous position (position at the last frame).
bindInputEventMouseMotion_get_relative :: MethodBind
bindInputEventMouseMotion_get_relative
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse position relative to the previous position (position at the last frame).
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

-- | Mouse speed.
bindInputEventMouseMotion_get_speed :: MethodBind
bindInputEventMouseMotion_get_speed
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse speed.
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

bindInputEventMouseMotion_get_tilt :: MethodBind
bindInputEventMouseMotion_get_tilt
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindInputEventMouseMotion_set_pressure :: MethodBind
bindInputEventMouseMotion_set_pressure
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

-- | Mouse position relative to the previous position (position at the last frame).
bindInputEventMouseMotion_set_relative :: MethodBind
bindInputEventMouseMotion_set_relative
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse position relative to the previous position (position at the last frame).
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

-- | Mouse speed.
bindInputEventMouseMotion_set_speed :: MethodBind
bindInputEventMouseMotion_set_speed
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse speed.
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

bindInputEventMouseMotion_set_tilt :: MethodBind
bindInputEventMouseMotion_set_tilt
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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