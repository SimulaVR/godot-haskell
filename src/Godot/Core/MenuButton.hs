{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MenuButton
       (Godot.Core.MenuButton.sig_about_to_show,
        Godot.Core.MenuButton._get_items, Godot.Core.MenuButton._set_items,
        Godot.Core.MenuButton._unhandled_key_input,
        Godot.Core.MenuButton.get_popup,
        Godot.Core.MenuButton.is_switch_on_hover,
        Godot.Core.MenuButton.set_disable_shortcuts,
        Godot.Core.MenuButton.set_switch_on_hover)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when [PopupMenu] of this MenuButton is about to show.
sig_about_to_show :: Godot.Internal.Dispatch.Signal MenuButton
sig_about_to_show = Godot.Internal.Dispatch.Signal "about_to_show"

instance NodeSignal MenuButton "about_to_show" '[]

{-# NOINLINE bindMenuButton__get_items #-}

bindMenuButton__get_items :: MethodBind
bindMenuButton__get_items
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "_get_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_items :: (MenuButton :< cls, Object :< cls) => cls -> IO Array
_get_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton__get_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMenuButton__set_items #-}

bindMenuButton__set_items :: MethodBind
bindMenuButton__set_items
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "_set_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_items ::
             (MenuButton :< cls, Object :< cls) => cls -> Array -> IO ()
_set_items cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton__set_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMenuButton__unhandled_key_input #-}

bindMenuButton__unhandled_key_input :: MethodBind
bindMenuButton__unhandled_key_input
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "_unhandled_key_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unhandled_key_input ::
                       (MenuButton :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_unhandled_key_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton__unhandled_key_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMenuButton_get_popup #-}

-- | Returns the [PopupMenu] contained in this button.
bindMenuButton_get_popup :: MethodBind
bindMenuButton_get_popup
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "get_popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [PopupMenu] contained in this button.
get_popup ::
            (MenuButton :< cls, Object :< cls) => cls -> IO PopupMenu
get_popup cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton_get_popup (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMenuButton_is_switch_on_hover #-}

-- | If [code]true[/code], when the cursor hovers above another [MenuButton] within the same parent which also has [code]switch_on_hover[/code] enabled, it will close the current [MenuButton] and open the other one.
bindMenuButton_is_switch_on_hover :: MethodBind
bindMenuButton_is_switch_on_hover
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "is_switch_on_hover" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], when the cursor hovers above another [MenuButton] within the same parent which also has [code]switch_on_hover[/code] enabled, it will close the current [MenuButton] and open the other one.
is_switch_on_hover ::
                     (MenuButton :< cls, Object :< cls) => cls -> IO Bool
is_switch_on_hover cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton_is_switch_on_hover
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMenuButton_set_disable_shortcuts #-}

-- | If [code]true[/code], shortcuts are disabled and cannot be used to trigger the button.
bindMenuButton_set_disable_shortcuts :: MethodBind
bindMenuButton_set_disable_shortcuts
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "set_disable_shortcuts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], shortcuts are disabled and cannot be used to trigger the button.
set_disable_shortcuts ::
                        (MenuButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_shortcuts cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton_set_disable_shortcuts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMenuButton_set_switch_on_hover #-}

-- | If [code]true[/code], when the cursor hovers above another [MenuButton] within the same parent which also has [code]switch_on_hover[/code] enabled, it will close the current [MenuButton] and open the other one.
bindMenuButton_set_switch_on_hover :: MethodBind
bindMenuButton_set_switch_on_hover
  = unsafePerformIO $
      withCString "MenuButton" $
        \ clsNamePtr ->
          withCString "set_switch_on_hover" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], when the cursor hovers above another [MenuButton] within the same parent which also has [code]switch_on_hover[/code] enabled, it will close the current [MenuButton] and open the other one.
set_switch_on_hover ::
                      (MenuButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_switch_on_hover cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMenuButton_set_switch_on_hover
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)