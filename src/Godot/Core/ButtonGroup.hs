{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ButtonGroup
       (Godot.Core.ButtonGroup.get_pressed_button,
        Godot.Core.ButtonGroup.get_buttons)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindButtonGroup_get_buttons #-}

-- | Returns an [Array] of [Button]s who have this as their [code]ButtonGroup[/code] (see [member BaseButton.group]).
bindButtonGroup_get_buttons :: MethodBind
bindButtonGroup_get_buttons
  = unsafePerformIO $
      withCString "ButtonGroup" $
        \ clsNamePtr ->
          withCString "get_buttons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Array] of [Button]s who have this as their [code]ButtonGroup[/code] (see [member BaseButton.group]).
get_buttons ::
              (ButtonGroup :< cls, Object :< cls) => cls -> IO Array
get_buttons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButtonGroup_get_buttons (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)