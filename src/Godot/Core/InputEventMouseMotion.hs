{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventMouseMotion
       (Godot.Core.InputEventMouseMotion.set_relative,
        Godot.Core.InputEventMouseMotion.get_relative,
        Godot.Core.InputEventMouseMotion.set_speed,
        Godot.Core.InputEventMouseMotion.get_speed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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