{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventAction
       (Godot.Core.InputEventAction.is_pressed,
        Godot.Core.InputEventAction.get_action,
        Godot.Core.InputEventAction.get_strength,
        Godot.Core.InputEventAction.set_action,
        Godot.Core.InputEventAction.set_pressed,
        Godot.Core.InputEventAction.set_strength)
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
import Godot.Core.InputEvent()

instance NodeProperty InputEventAction "action" GodotString 'False
         where
        nodeProperty = (get_action, wrapDroppingSetter set_action, Nothing)

{-# NOINLINE bindInputEventAction_is_pressed #-}

-- | If @true@, the action's state is pressed. If @false@, the action's state is released.
bindInputEventAction_is_pressed :: MethodBind
bindInputEventAction_is_pressed
  = unsafePerformIO $
      withCString "InputEventAction" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the action's state is pressed. If @false@, the action's state is released.
is_pressed ::
             (InputEventAction :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventAction_is_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventAction "is_pressed" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.InputEventAction.is_pressed

instance NodeProperty InputEventAction "pressed" Bool 'False where
        nodeProperty
          = (is_pressed, wrapDroppingSetter set_pressed, Nothing)

instance NodeProperty InputEventAction "strength" Float 'False
         where
        nodeProperty
          = (get_strength, wrapDroppingSetter set_strength, Nothing)

{-# NOINLINE bindInputEventAction_get_action #-}

-- | The action's name. Actions are accessed via this @String@.
bindInputEventAction_get_action :: MethodBind
bindInputEventAction_get_action
  = unsafePerformIO $
      withCString "InputEventAction" $
        \ clsNamePtr ->
          withCString "get_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The action's name. Actions are accessed via this @String@.
get_action ::
             (InputEventAction :< cls, Object :< cls) => cls -> IO GodotString
get_action cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventAction_get_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventAction "get_action" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.InputEventAction.get_action

{-# NOINLINE bindInputEventAction_get_strength #-}

-- | The action's strength between 0 and 1. This value is considered as equal to 0 if pressed is @false@. The event strength allows faking analog joypad motion events, by specifying how strongly the joypad axis is bent or pressed.
bindInputEventAction_get_strength :: MethodBind
bindInputEventAction_get_strength
  = unsafePerformIO $
      withCString "InputEventAction" $
        \ clsNamePtr ->
          withCString "get_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The action's strength between 0 and 1. This value is considered as equal to 0 if pressed is @false@. The event strength allows faking analog joypad motion events, by specifying how strongly the joypad axis is bent or pressed.
get_strength ::
               (InputEventAction :< cls, Object :< cls) => cls -> IO Float
get_strength cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventAction_get_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventAction "get_strength" '[] (IO Float)
         where
        nodeMethod = Godot.Core.InputEventAction.get_strength

{-# NOINLINE bindInputEventAction_set_action #-}

-- | The action's name. Actions are accessed via this @String@.
bindInputEventAction_set_action :: MethodBind
bindInputEventAction_set_action
  = unsafePerformIO $
      withCString "InputEventAction" $
        \ clsNamePtr ->
          withCString "set_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The action's name. Actions are accessed via this @String@.
set_action ::
             (InputEventAction :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventAction_set_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventAction "set_action" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventAction.set_action

{-# NOINLINE bindInputEventAction_set_pressed #-}

-- | If @true@, the action's state is pressed. If @false@, the action's state is released.
bindInputEventAction_set_pressed :: MethodBind
bindInputEventAction_set_pressed
  = unsafePerformIO $
      withCString "InputEventAction" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the action's state is pressed. If @false@, the action's state is released.
set_pressed ::
              (InputEventAction :< cls, Object :< cls) => cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventAction_set_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventAction "set_pressed" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.InputEventAction.set_pressed

{-# NOINLINE bindInputEventAction_set_strength #-}

-- | The action's strength between 0 and 1. This value is considered as equal to 0 if pressed is @false@. The event strength allows faking analog joypad motion events, by specifying how strongly the joypad axis is bent or pressed.
bindInputEventAction_set_strength :: MethodBind
bindInputEventAction_set_strength
  = unsafePerformIO $
      withCString "InputEventAction" $
        \ clsNamePtr ->
          withCString "set_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The action's strength between 0 and 1. This value is considered as equal to 0 if pressed is @false@. The event strength allows faking analog joypad motion events, by specifying how strongly the joypad axis is bent or pressed.
set_strength ::
               (InputEventAction :< cls, Object :< cls) => cls -> Float -> IO ()
set_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventAction_set_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventAction "set_strength" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventAction.set_strength