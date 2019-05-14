{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventMouse
       (Godot.Core.InputEventMouse.set_button_mask,
        Godot.Core.InputEventMouse.get_button_mask,
        Godot.Core.InputEventMouse.set_position,
        Godot.Core.InputEventMouse.get_position,
        Godot.Core.InputEventMouse.set_global_position,
        Godot.Core.InputEventMouse.get_global_position)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventMouse_set_button_mask #-}

-- | Mouse button mask identifier, one of or a bitwise combination of the BUTTON_MASK_* constants in [@GlobalScope].
bindInputEventMouse_set_button_mask :: MethodBind
bindInputEventMouse_set_button_mask
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "set_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse button mask identifier, one of or a bitwise combination of the BUTTON_MASK_* constants in [@GlobalScope].
set_button_mask ::
                  (InputEventMouse :< cls, Object :< cls) => cls -> Int -> IO ()
set_button_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouse_set_button_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouse_get_button_mask #-}

-- | Mouse button mask identifier, one of or a bitwise combination of the BUTTON_MASK_* constants in [@GlobalScope].
bindInputEventMouse_get_button_mask :: MethodBind
bindInputEventMouse_get_button_mask
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "get_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse button mask identifier, one of or a bitwise combination of the BUTTON_MASK_* constants in [@GlobalScope].
get_button_mask ::
                  (InputEventMouse :< cls, Object :< cls) => cls -> IO Int
get_button_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouse_get_button_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouse_set_position #-}

-- | Mouse local position relative to the [Viewport]. If used in [method Control._gui_input] the position is relative to the current [Control] which is under the mouse.
bindInputEventMouse_set_position :: MethodBind
bindInputEventMouse_set_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse local position relative to the [Viewport]. If used in [method Control._gui_input] the position is relative to the current [Control] which is under the mouse.
set_position ::
               (InputEventMouse :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouse_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouse_get_position #-}

-- | Mouse local position relative to the [Viewport]. If used in [method Control._gui_input] the position is relative to the current [Control] which is under the mouse.
bindInputEventMouse_get_position :: MethodBind
bindInputEventMouse_get_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse local position relative to the [Viewport]. If used in [method Control._gui_input] the position is relative to the current [Control] which is under the mouse.
get_position ::
               (InputEventMouse :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouse_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouse_set_global_position #-}

-- | Mouse position relative to the current [Viewport] when used in [method Control._gui_input], otherwise is at 0,0.
bindInputEventMouse_set_global_position :: MethodBind
bindInputEventMouse_set_global_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "set_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse position relative to the current [Viewport] when used in [method Control._gui_input], otherwise is at 0,0.
set_global_position ::
                      (InputEventMouse :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_global_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouse_set_global_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventMouse_get_global_position #-}

-- | Mouse position relative to the current [Viewport] when used in [method Control._gui_input], otherwise is at 0,0.
bindInputEventMouse_get_global_position :: MethodBind
bindInputEventMouse_get_global_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "get_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mouse position relative to the current [Viewport] when used in [method Control._gui_input], otherwise is at 0,0.
get_global_position ::
                      (InputEventMouse :< cls, Object :< cls) => cls -> IO Vector2
get_global_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouse_get_global_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)