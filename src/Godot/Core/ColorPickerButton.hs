{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ColorPickerButton
       (Godot.Core.ColorPickerButton.sig_popup_closed,
        Godot.Core.ColorPickerButton.sig_color_changed,
        Godot.Core.ColorPickerButton.set_pick_color,
        Godot.Core.ColorPickerButton.get_pick_color,
        Godot.Core.ColorPickerButton.get_picker,
        Godot.Core.ColorPickerButton.get_popup,
        Godot.Core.ColorPickerButton.set_edit_alpha,
        Godot.Core.ColorPickerButton.is_editing_alpha,
        Godot.Core.ColorPickerButton._color_changed,
        Godot.Core.ColorPickerButton._modal_closed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_popup_closed ::
                 Godot.Internal.Dispatch.Signal ColorPickerButton
sig_popup_closed = Godot.Internal.Dispatch.Signal "popup_closed"

-- | Emitted when the color changes.
sig_color_changed ::
                  Godot.Internal.Dispatch.Signal ColorPickerButton
sig_color_changed = Godot.Internal.Dispatch.Signal "color_changed"

{-# NOINLINE bindColorPickerButton_set_pick_color #-}

-- | The currently selected color.
bindColorPickerButton_set_pick_color :: MethodBind
bindColorPickerButton_set_pick_color
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "set_pick_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected color.
set_pick_color ::
                 (ColorPickerButton :< cls, Object :< cls) => cls -> Color -> IO ()
set_pick_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton_set_pick_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton_get_pick_color #-}

-- | The currently selected color.
bindColorPickerButton_get_pick_color :: MethodBind
bindColorPickerButton_get_pick_color
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "get_pick_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected color.
get_pick_color ::
                 (ColorPickerButton :< cls, Object :< cls) => cls -> IO Color
get_pick_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton_get_pick_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton_get_picker #-}

-- | Returns the [ColorPicker] that this node toggles.
bindColorPickerButton_get_picker :: MethodBind
bindColorPickerButton_get_picker
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "get_picker" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [ColorPicker] that this node toggles.
get_picker ::
             (ColorPickerButton :< cls, Object :< cls) => cls -> IO ColorPicker
get_picker cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton_get_picker
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton_get_popup #-}

-- | Returns the control's [PopupPanel] which allows you to connect to popup signals. This allows you to handle events when the ColorPicker is shown or hidden.
bindColorPickerButton_get_popup :: MethodBind
bindColorPickerButton_get_popup
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "get_popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the control's [PopupPanel] which allows you to connect to popup signals. This allows you to handle events when the ColorPicker is shown or hidden.
get_popup ::
            (ColorPickerButton :< cls, Object :< cls) => cls -> IO PopupPanel
get_popup cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton_get_popup (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton_set_edit_alpha #-}

-- | If [code]true[/code], the alpha channel in the displayed [ColorPicker] will be visible. Default value: [code]true[/code].
bindColorPickerButton_set_edit_alpha :: MethodBind
bindColorPickerButton_set_edit_alpha
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "set_edit_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the alpha channel in the displayed [ColorPicker] will be visible. Default value: [code]true[/code].
set_edit_alpha ::
                 (ColorPickerButton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_edit_alpha cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton_set_edit_alpha
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton_is_editing_alpha #-}

-- | If [code]true[/code], the alpha channel in the displayed [ColorPicker] will be visible. Default value: [code]true[/code].
bindColorPickerButton_is_editing_alpha :: MethodBind
bindColorPickerButton_is_editing_alpha
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "is_editing_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the alpha channel in the displayed [ColorPicker] will be visible. Default value: [code]true[/code].
is_editing_alpha ::
                   (ColorPickerButton :< cls, Object :< cls) => cls -> IO Bool
is_editing_alpha cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton_is_editing_alpha
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton__color_changed #-}

bindColorPickerButton__color_changed :: MethodBind
bindColorPickerButton__color_changed
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "_color_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_color_changed ::
                 (ColorPickerButton :< cls, Object :< cls) => cls -> Color -> IO ()
_color_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton__color_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPickerButton__modal_closed #-}

bindColorPickerButton__modal_closed :: MethodBind
bindColorPickerButton__modal_closed
  = unsafePerformIO $
      withCString "ColorPickerButton" $
        \ clsNamePtr ->
          withCString "_modal_closed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_modal_closed ::
                (ColorPickerButton :< cls, Object :< cls) => cls -> IO ()
_modal_closed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPickerButton__modal_closed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)