{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ButtonGroup
       (Godot.Core.ButtonGroup.get_buttons,
        Godot.Core.ButtonGroup.get_pressed_button)
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
import Godot.Core.Resource()

{-# NOINLINE bindButtonGroup_get_buttons #-}

-- | Returns an @Array@ of @Button@s who have this as their @ButtonGroup@ (see @BaseButton.group@).
bindButtonGroup_get_buttons :: MethodBind
bindButtonGroup_get_buttons
  = unsafePerformIO $
      withCString "ButtonGroup" $
        \ clsNamePtr ->
          withCString "get_buttons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @Button@s who have this as their @ButtonGroup@ (see @BaseButton.group@).
get_buttons ::
              (ButtonGroup :< cls, Object :< cls) => cls -> IO Array
get_buttons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButtonGroup_get_buttons (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ButtonGroup "get_buttons" '[] (IO Array) where
        nodeMethod = Godot.Core.ButtonGroup.get_buttons

{-# NOINLINE bindButtonGroup_get_pressed_button #-}

-- | Returns the current pressed button.
bindButtonGroup_get_pressed_button :: MethodBind
bindButtonGroup_get_pressed_button
  = unsafePerformIO $
      withCString "ButtonGroup" $
        \ clsNamePtr ->
          withCString "get_pressed_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current pressed button.
get_pressed_button ::
                     (ButtonGroup :< cls, Object :< cls) => cls -> IO BaseButton
get_pressed_button cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButtonGroup_get_pressed_button
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ButtonGroup "get_pressed_button" '[]
           (IO BaseButton)
         where
        nodeMethod = Godot.Core.ButtonGroup.get_pressed_button