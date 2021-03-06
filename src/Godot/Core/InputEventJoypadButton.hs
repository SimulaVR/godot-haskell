{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventJoypadButton
       (Godot.Core.InputEventJoypadButton.is_pressed,
        Godot.Core.InputEventJoypadButton.get_button_index,
        Godot.Core.InputEventJoypadButton.get_pressure,
        Godot.Core.InputEventJoypadButton.set_button_index,
        Godot.Core.InputEventJoypadButton.set_pressed,
        Godot.Core.InputEventJoypadButton.set_pressure)
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

instance NodeProperty InputEventJoypadButton "button_index" Int
           'False
         where
        nodeProperty
          = (get_button_index, wrapDroppingSetter set_button_index, Nothing)

{-# NOINLINE bindInputEventJoypadButton_is_pressed #-}

-- | If @true@, the button's state is pressed. If @false@, the button's state is released.
bindInputEventJoypadButton_is_pressed :: MethodBind
bindInputEventJoypadButton_is_pressed
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the button's state is pressed. If @false@, the button's state is released.
is_pressed ::
             (InputEventJoypadButton :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_is_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventJoypadButton "is_pressed" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.InputEventJoypadButton.is_pressed

instance NodeProperty InputEventJoypadButton "pressed" Bool 'False
         where
        nodeProperty
          = (is_pressed, wrapDroppingSetter set_pressed, Nothing)

instance NodeProperty InputEventJoypadButton "pressure" Float
           'False
         where
        nodeProperty
          = (get_pressure, wrapDroppingSetter set_pressure, Nothing)

{-# NOINLINE bindInputEventJoypadButton_get_button_index #-}

-- | Button identifier. One of the @enum JoystickList@ button constants.
bindInputEventJoypadButton_get_button_index :: MethodBind
bindInputEventJoypadButton_get_button_index
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "get_button_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Button identifier. One of the @enum JoystickList@ button constants.
get_button_index ::
                   (InputEventJoypadButton :< cls, Object :< cls) => cls -> IO Int
get_button_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_get_button_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventJoypadButton "get_button_index" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.InputEventJoypadButton.get_button_index

{-# NOINLINE bindInputEventJoypadButton_get_pressure #-}

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from @0@ to @1@.
bindInputEventJoypadButton_get_pressure :: MethodBind
bindInputEventJoypadButton_get_pressure
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from @0@ to @1@.
get_pressure ::
               (InputEventJoypadButton :< cls, Object :< cls) => cls -> IO Float
get_pressure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_get_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventJoypadButton "get_pressure" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.InputEventJoypadButton.get_pressure

{-# NOINLINE bindInputEventJoypadButton_set_button_index #-}

-- | Button identifier. One of the @enum JoystickList@ button constants.
bindInputEventJoypadButton_set_button_index :: MethodBind
bindInputEventJoypadButton_set_button_index
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "set_button_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Button identifier. One of the @enum JoystickList@ button constants.
set_button_index ::
                   (InputEventJoypadButton :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_button_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_set_button_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventJoypadButton "set_button_index"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventJoypadButton.set_button_index

{-# NOINLINE bindInputEventJoypadButton_set_pressed #-}

-- | If @true@, the button's state is pressed. If @false@, the button's state is released.
bindInputEventJoypadButton_set_pressed :: MethodBind
bindInputEventJoypadButton_set_pressed
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the button's state is pressed. If @false@, the button's state is released.
set_pressed ::
              (InputEventJoypadButton :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_set_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventJoypadButton "set_pressed" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventJoypadButton.set_pressed

{-# NOINLINE bindInputEventJoypadButton_set_pressure #-}

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from @0@ to @1@.
bindInputEventJoypadButton_set_pressure :: MethodBind
bindInputEventJoypadButton_set_pressure
  = unsafePerformIO $
      withCString "InputEventJoypadButton" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the button with his finger, if the controller supports it. Ranges from @0@ to @1@.
set_pressure ::
               (InputEventJoypadButton :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_pressure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventJoypadButton_set_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventJoypadButton "set_pressure" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventJoypadButton.set_pressure