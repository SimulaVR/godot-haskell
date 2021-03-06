{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventMouse
       (Godot.Core.InputEventMouse.get_button_mask,
        Godot.Core.InputEventMouse.get_global_position,
        Godot.Core.InputEventMouse.get_position,
        Godot.Core.InputEventMouse.set_button_mask,
        Godot.Core.InputEventMouse.set_global_position,
        Godot.Core.InputEventMouse.set_position)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.InputEventWithModifiers()

instance NodeProperty InputEventMouse "button_mask" Int 'False
         where
        nodeProperty
          = (get_button_mask, wrapDroppingSetter set_button_mask, Nothing)

instance NodeProperty InputEventMouse "global_position" Vector2
           'False
         where
        nodeProperty
          = (get_global_position, wrapDroppingSetter set_global_position,
             Nothing)

instance NodeProperty InputEventMouse "position" Vector2 'False
         where
        nodeProperty
          = (get_position, wrapDroppingSetter set_position, Nothing)

{-# NOINLINE bindInputEventMouse_get_button_mask #-}

-- | The mouse button mask identifier, one of or a bitwise combination of the @enum ButtonList@ button masks.
bindInputEventMouse_get_button_mask :: MethodBind
bindInputEventMouse_get_button_mask
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "get_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse button mask identifier, one of or a bitwise combination of the @enum ButtonList@ button masks.
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

instance NodeMethod InputEventMouse "get_button_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.InputEventMouse.get_button_mask

{-# NOINLINE bindInputEventMouse_get_global_position #-}

-- | The global mouse position relative to the current @Viewport@ when used in @method Control._gui_input@, otherwise is at 0,0.
bindInputEventMouse_get_global_position :: MethodBind
bindInputEventMouse_get_global_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "get_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global mouse position relative to the current @Viewport@ when used in @method Control._gui_input@, otherwise is at 0,0.
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

instance NodeMethod InputEventMouse "get_global_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventMouse.get_global_position

{-# NOINLINE bindInputEventMouse_get_position #-}

-- | The local mouse position relative to the @Viewport@. If used in @method Control._gui_input@, the position is relative to the current @Control@ which is under the mouse.
bindInputEventMouse_get_position :: MethodBind
bindInputEventMouse_get_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The local mouse position relative to the @Viewport@. If used in @method Control._gui_input@, the position is relative to the current @Control@ which is under the mouse.
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

instance NodeMethod InputEventMouse "get_position" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventMouse.get_position

{-# NOINLINE bindInputEventMouse_set_button_mask #-}

-- | The mouse button mask identifier, one of or a bitwise combination of the @enum ButtonList@ button masks.
bindInputEventMouse_set_button_mask :: MethodBind
bindInputEventMouse_set_button_mask
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "set_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse button mask identifier, one of or a bitwise combination of the @enum ButtonList@ button masks.
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

instance NodeMethod InputEventMouse "set_button_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouse.set_button_mask

{-# NOINLINE bindInputEventMouse_set_global_position #-}

-- | The global mouse position relative to the current @Viewport@ when used in @method Control._gui_input@, otherwise is at 0,0.
bindInputEventMouse_set_global_position :: MethodBind
bindInputEventMouse_set_global_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "set_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global mouse position relative to the current @Viewport@ when used in @method Control._gui_input@, otherwise is at 0,0.
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

instance NodeMethod InputEventMouse "set_global_position"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouse.set_global_position

{-# NOINLINE bindInputEventMouse_set_position #-}

-- | The local mouse position relative to the @Viewport@. If used in @method Control._gui_input@, the position is relative to the current @Control@ which is under the mouse.
bindInputEventMouse_set_position :: MethodBind
bindInputEventMouse_set_position
  = unsafePerformIO $
      withCString "InputEventMouse" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The local mouse position relative to the @Viewport@. If used in @method Control._gui_input@, the position is relative to the current @Control@ which is under the mouse.
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

instance NodeMethod InputEventMouse "set_position" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouse.set_position