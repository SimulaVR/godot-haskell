{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.BaseButton
       (Godot.Core.BaseButton._DRAW_NORMAL,
        Godot.Core.BaseButton._DRAW_DISABLED,
        Godot.Core.BaseButton._ACTION_MODE_BUTTON_RELEASE,
        Godot.Core.BaseButton._DRAW_HOVER_PRESSED,
        Godot.Core.BaseButton._ACTION_MODE_BUTTON_PRESS,
        Godot.Core.BaseButton._DRAW_PRESSED,
        Godot.Core.BaseButton._DRAW_HOVER,
        Godot.Core.BaseButton.sig_button_down,
        Godot.Core.BaseButton.sig_button_up,
        Godot.Core.BaseButton.sig_pressed,
        Godot.Core.BaseButton.sig_toggled,
        Godot.Core.BaseButton._gui_input, Godot.Core.BaseButton._pressed,
        Godot.Core.BaseButton._toggled,
        Godot.Core.BaseButton._unhandled_input,
        Godot.Core.BaseButton.get_action_mode,
        Godot.Core.BaseButton.get_button_group,
        Godot.Core.BaseButton.get_button_mask,
        Godot.Core.BaseButton.get_draw_mode,
        Godot.Core.BaseButton.get_enabled_focus_mode,
        Godot.Core.BaseButton.get_shortcut,
        Godot.Core.BaseButton.is_disabled,
        Godot.Core.BaseButton.is_hovered,
        Godot.Core.BaseButton.is_keep_pressed_outside,
        Godot.Core.BaseButton.is_pressed,
        Godot.Core.BaseButton.is_shortcut_in_tooltip_enabled,
        Godot.Core.BaseButton.is_toggle_mode,
        Godot.Core.BaseButton.set_action_mode,
        Godot.Core.BaseButton.set_button_group,
        Godot.Core.BaseButton.set_button_mask,
        Godot.Core.BaseButton.set_disabled,
        Godot.Core.BaseButton.set_enabled_focus_mode,
        Godot.Core.BaseButton.set_keep_pressed_outside,
        Godot.Core.BaseButton.set_pressed,
        Godot.Core.BaseButton.set_shortcut,
        Godot.Core.BaseButton.set_shortcut_in_tooltip,
        Godot.Core.BaseButton.set_toggle_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_DRAW_NORMAL :: Int
_DRAW_NORMAL = 0

_DRAW_DISABLED :: Int
_DRAW_DISABLED = 3

_ACTION_MODE_BUTTON_RELEASE :: Int
_ACTION_MODE_BUTTON_RELEASE = 1

_DRAW_HOVER_PRESSED :: Int
_DRAW_HOVER_PRESSED = 4

_ACTION_MODE_BUTTON_PRESS :: Int
_ACTION_MODE_BUTTON_PRESS = 0

_DRAW_PRESSED :: Int
_DRAW_PRESSED = 1

_DRAW_HOVER :: Int
_DRAW_HOVER = 2

-- | Emitted when the button starts being held down.
sig_button_down :: Godot.Internal.Dispatch.Signal BaseButton
sig_button_down = Godot.Internal.Dispatch.Signal "button_down"

-- | Emitted when the button stops being held down.
sig_button_up :: Godot.Internal.Dispatch.Signal BaseButton
sig_button_up = Godot.Internal.Dispatch.Signal "button_up"

-- | This signal is emitted every time the button is toggled or pressed (i.e. activated, so on [code]button_down[/code] if "Click on press" is active and on [code]button_up[/code] otherwise).
sig_pressed :: Godot.Internal.Dispatch.Signal BaseButton
sig_pressed = Godot.Internal.Dispatch.Signal "pressed"

-- | This signal is emitted when the button was just toggled between pressed and normal states (only if toggle_mode is active). The new state is contained in the [i]button_pressed[/i] argument.
sig_toggled :: Godot.Internal.Dispatch.Signal BaseButton
sig_toggled = Godot.Internal.Dispatch.Signal "toggled"

{-# NOINLINE bindBaseButton__gui_input #-}

bindBaseButton__gui_input :: MethodBind
bindBaseButton__gui_input
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (BaseButton :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton__pressed #-}

-- | Called when the button is pressed.
bindBaseButton__pressed :: MethodBind
bindBaseButton__pressed
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the button is pressed.
_pressed :: (BaseButton :< cls, Object :< cls) => cls -> IO ()
_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton__pressed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton__toggled #-}

-- | Called when the button is toggled (only if toggle_mode is active).
bindBaseButton__toggled :: MethodBind
bindBaseButton__toggled
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "_toggled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the button is toggled (only if toggle_mode is active).
_toggled ::
           (BaseButton :< cls, Object :< cls) => cls -> Bool -> IO ()
_toggled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton__toggled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton__unhandled_input #-}

bindBaseButton__unhandled_input :: MethodBind
bindBaseButton__unhandled_input
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unhandled_input ::
                   (BaseButton :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton__unhandled_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_get_action_mode #-}

-- | Determines when the button is considered clicked, one of the ACTION_MODE_* constants.
bindBaseButton_get_action_mode :: MethodBind
bindBaseButton_get_action_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "get_action_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when the button is considered clicked, one of the ACTION_MODE_* constants.
get_action_mode ::
                  (BaseButton :< cls, Object :< cls) => cls -> IO Int
get_action_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_get_action_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_get_button_group #-}

-- | [ButtonGroup] associated to the button.
bindBaseButton_get_button_group :: MethodBind
bindBaseButton_get_button_group
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "get_button_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [ButtonGroup] associated to the button.
get_button_group ::
                   (BaseButton :< cls, Object :< cls) => cls -> IO ButtonGroup
get_button_group cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_get_button_group (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_get_button_mask #-}

-- | Binary mask to choose which mouse buttons this button will respond to.
--   			To allow both left-click and right-click, set this to 3, because it's BUTTON_MASK_LEFT | BUTTON_MASK_RIGHT.
bindBaseButton_get_button_mask :: MethodBind
bindBaseButton_get_button_mask
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "get_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binary mask to choose which mouse buttons this button will respond to.
--   			To allow both left-click and right-click, set this to 3, because it's BUTTON_MASK_LEFT | BUTTON_MASK_RIGHT.
get_button_mask ::
                  (BaseButton :< cls, Object :< cls) => cls -> IO Int
get_button_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_get_button_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_get_draw_mode #-}

-- | Returns the visual state used to draw the button. This is useful mainly when implementing your own draw code by either overriding _draw() or connecting to "draw" signal. The visual state of the button is defined by the DRAW_* enum.
bindBaseButton_get_draw_mode :: MethodBind
bindBaseButton_get_draw_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "get_draw_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the visual state used to draw the button. This is useful mainly when implementing your own draw code by either overriding _draw() or connecting to "draw" signal. The visual state of the button is defined by the DRAW_* enum.
get_draw_mode ::
                (BaseButton :< cls, Object :< cls) => cls -> IO Int
get_draw_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_get_draw_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_get_enabled_focus_mode #-}

-- | Focus access mode to use when switching between enabled/disabled (see [member Control.focus_mode] and [member disabled]).
bindBaseButton_get_enabled_focus_mode :: MethodBind
bindBaseButton_get_enabled_focus_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "get_enabled_focus_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Focus access mode to use when switching between enabled/disabled (see [member Control.focus_mode] and [member disabled]).
get_enabled_focus_mode ::
                         (BaseButton :< cls, Object :< cls) => cls -> IO Int
get_enabled_focus_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_get_enabled_focus_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_get_shortcut #-}

-- | [ShortCut] associated to the button.
bindBaseButton_get_shortcut :: MethodBind
bindBaseButton_get_shortcut
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "get_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [ShortCut] associated to the button.
get_shortcut ::
               (BaseButton :< cls, Object :< cls) => cls -> IO ShortCut
get_shortcut cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_get_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_is_disabled #-}

-- | If [code]true[/code], the button is in disabled state and can't be clicked or toggled.
bindBaseButton_is_disabled :: MethodBind
bindBaseButton_is_disabled
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button is in disabled state and can't be clicked or toggled.
is_disabled :: (BaseButton :< cls, Object :< cls) => cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_is_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_is_hovered #-}

-- | Returns [code]true[/code] if the mouse has entered the button and has not left it yet.
bindBaseButton_is_hovered :: MethodBind
bindBaseButton_is_hovered
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "is_hovered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the mouse has entered the button and has not left it yet.
is_hovered :: (BaseButton :< cls, Object :< cls) => cls -> IO Bool
is_hovered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_is_hovered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_is_keep_pressed_outside #-}

bindBaseButton_is_keep_pressed_outside :: MethodBind
bindBaseButton_is_keep_pressed_outside
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "is_keep_pressed_outside" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_keep_pressed_outside ::
                          (BaseButton :< cls, Object :< cls) => cls -> IO Bool
is_keep_pressed_outside cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_is_keep_pressed_outside
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_is_pressed #-}

-- | If [code]true[/code], the button's state is pressed. Means the button is pressed down or toggled (if toggle_mode is active).
bindBaseButton_is_pressed :: MethodBind
bindBaseButton_is_pressed
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's state is pressed. Means the button is pressed down or toggled (if toggle_mode is active).
is_pressed :: (BaseButton :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_is_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_is_shortcut_in_tooltip_enabled #-}

-- | If [code]true[/code], the button will add information about its shortcut in the tooltip.
bindBaseButton_is_shortcut_in_tooltip_enabled :: MethodBind
bindBaseButton_is_shortcut_in_tooltip_enabled
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "is_shortcut_in_tooltip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button will add information about its shortcut in the tooltip.
is_shortcut_in_tooltip_enabled ::
                                 (BaseButton :< cls, Object :< cls) => cls -> IO Bool
is_shortcut_in_tooltip_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindBaseButton_is_shortcut_in_tooltip_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_is_toggle_mode #-}

-- | If [code]true[/code], the button is in toggle mode. Makes the button flip state between pressed and unpressed each time its area is clicked.
bindBaseButton_is_toggle_mode :: MethodBind
bindBaseButton_is_toggle_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "is_toggle_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button is in toggle mode. Makes the button flip state between pressed and unpressed each time its area is clicked.
is_toggle_mode ::
                 (BaseButton :< cls, Object :< cls) => cls -> IO Bool
is_toggle_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_is_toggle_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_action_mode #-}

-- | Determines when the button is considered clicked, one of the ACTION_MODE_* constants.
bindBaseButton_set_action_mode :: MethodBind
bindBaseButton_set_action_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_action_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when the button is considered clicked, one of the ACTION_MODE_* constants.
set_action_mode ::
                  (BaseButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_action_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_action_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_button_group #-}

-- | [ButtonGroup] associated to the button.
bindBaseButton_set_button_group :: MethodBind
bindBaseButton_set_button_group
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_button_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [ButtonGroup] associated to the button.
set_button_group ::
                   (BaseButton :< cls, Object :< cls) => cls -> ButtonGroup -> IO ()
set_button_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_button_group (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_button_mask #-}

-- | Binary mask to choose which mouse buttons this button will respond to.
--   			To allow both left-click and right-click, set this to 3, because it's BUTTON_MASK_LEFT | BUTTON_MASK_RIGHT.
bindBaseButton_set_button_mask :: MethodBind
bindBaseButton_set_button_mask
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binary mask to choose which mouse buttons this button will respond to.
--   			To allow both left-click and right-click, set this to 3, because it's BUTTON_MASK_LEFT | BUTTON_MASK_RIGHT.
set_button_mask ::
                  (BaseButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_button_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_button_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_disabled #-}

-- | If [code]true[/code], the button is in disabled state and can't be clicked or toggled.
bindBaseButton_set_disabled :: MethodBind
bindBaseButton_set_disabled
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button is in disabled state and can't be clicked or toggled.
set_disabled ::
               (BaseButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_enabled_focus_mode #-}

-- | Focus access mode to use when switching between enabled/disabled (see [member Control.focus_mode] and [member disabled]).
bindBaseButton_set_enabled_focus_mode :: MethodBind
bindBaseButton_set_enabled_focus_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_enabled_focus_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Focus access mode to use when switching between enabled/disabled (see [member Control.focus_mode] and [member disabled]).
set_enabled_focus_mode ::
                         (BaseButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_enabled_focus_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_enabled_focus_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_keep_pressed_outside #-}

bindBaseButton_set_keep_pressed_outside :: MethodBind
bindBaseButton_set_keep_pressed_outside
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_keep_pressed_outside" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_keep_pressed_outside ::
                           (BaseButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_keep_pressed_outside cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_keep_pressed_outside
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_pressed #-}

-- | If [code]true[/code], the button's state is pressed. Means the button is pressed down or toggled (if toggle_mode is active).
bindBaseButton_set_pressed :: MethodBind
bindBaseButton_set_pressed
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button's state is pressed. Means the button is pressed down or toggled (if toggle_mode is active).
set_pressed ::
              (BaseButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_shortcut #-}

-- | [ShortCut] associated to the button.
bindBaseButton_set_shortcut :: MethodBind
bindBaseButton_set_shortcut
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [ShortCut] associated to the button.
set_shortcut ::
               (BaseButton :< cls, Object :< cls) => cls -> ShortCut -> IO ()
set_shortcut cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_shortcut_in_tooltip #-}

-- | If [code]true[/code], the button will add information about its shortcut in the tooltip.
bindBaseButton_set_shortcut_in_tooltip :: MethodBind
bindBaseButton_set_shortcut_in_tooltip
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_shortcut_in_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button will add information about its shortcut in the tooltip.
set_shortcut_in_tooltip ::
                          (BaseButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shortcut_in_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_shortcut_in_tooltip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBaseButton_set_toggle_mode #-}

-- | If [code]true[/code], the button is in toggle mode. Makes the button flip state between pressed and unpressed each time its area is clicked.
bindBaseButton_set_toggle_mode :: MethodBind
bindBaseButton_set_toggle_mode
  = unsafePerformIO $
      withCString "BaseButton" $
        \ clsNamePtr ->
          withCString "set_toggle_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the button is in toggle mode. Makes the button flip state between pressed and unpressed each time its area is clicked.
set_toggle_mode ::
                  (BaseButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_toggle_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBaseButton_set_toggle_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)