{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ColorPicker
       (Godot.Core.ColorPicker.sig_color_changed,
        Godot.Core.ColorPicker.sig_preset_added,
        Godot.Core.ColorPicker.sig_preset_removed,
        Godot.Core.ColorPicker._add_preset_pressed,
        Godot.Core.ColorPicker._focus_enter,
        Godot.Core.ColorPicker._focus_exit,
        Godot.Core.ColorPicker._hsv_draw,
        Godot.Core.ColorPicker._html_entered,
        Godot.Core.ColorPicker._html_focus_exit,
        Godot.Core.ColorPicker._preset_input,
        Godot.Core.ColorPicker._sample_draw,
        Godot.Core.ColorPicker._screen_input,
        Godot.Core.ColorPicker._screen_pick_pressed,
        Godot.Core.ColorPicker._text_type_toggled,
        Godot.Core.ColorPicker._update_presets,
        Godot.Core.ColorPicker._uv_input,
        Godot.Core.ColorPicker._value_changed,
        Godot.Core.ColorPicker._w_input, Godot.Core.ColorPicker.add_preset,
        Godot.Core.ColorPicker.are_presets_enabled,
        Godot.Core.ColorPicker.are_presets_visible,
        Godot.Core.ColorPicker.erase_preset,
        Godot.Core.ColorPicker.get_pick_color,
        Godot.Core.ColorPicker.get_presets,
        Godot.Core.ColorPicker.is_deferred_mode,
        Godot.Core.ColorPicker.is_editing_alpha,
        Godot.Core.ColorPicker.is_hsv_mode,
        Godot.Core.ColorPicker.is_raw_mode,
        Godot.Core.ColorPicker.set_deferred_mode,
        Godot.Core.ColorPicker.set_edit_alpha,
        Godot.Core.ColorPicker.set_hsv_mode,
        Godot.Core.ColorPicker.set_pick_color,
        Godot.Core.ColorPicker.set_presets_enabled,
        Godot.Core.ColorPicker.set_presets_visible,
        Godot.Core.ColorPicker.set_raw_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when the color is changed.
sig_color_changed :: Godot.Internal.Dispatch.Signal ColorPicker
sig_color_changed = Godot.Internal.Dispatch.Signal "color_changed"

instance NodeSignal ColorPicker "color_changed" '[Color]

-- | Emitted when a preset is added.
sig_preset_added :: Godot.Internal.Dispatch.Signal ColorPicker
sig_preset_added = Godot.Internal.Dispatch.Signal "preset_added"

instance NodeSignal ColorPicker "preset_added" '[Color]

-- | Emitted when a preset is removed.
sig_preset_removed :: Godot.Internal.Dispatch.Signal ColorPicker
sig_preset_removed
  = Godot.Internal.Dispatch.Signal "preset_removed"

instance NodeSignal ColorPicker "preset_removed" '[Color]

{-# NOINLINE bindColorPicker__add_preset_pressed #-}

bindColorPicker__add_preset_pressed :: MethodBind
bindColorPicker__add_preset_pressed
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_add_preset_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_add_preset_pressed ::
                      (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_add_preset_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__add_preset_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__focus_enter #-}

bindColorPicker__focus_enter :: MethodBind
bindColorPicker__focus_enter
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_focus_enter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_focus_enter :: (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_focus_enter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__focus_enter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__focus_exit #-}

bindColorPicker__focus_exit :: MethodBind
bindColorPicker__focus_exit
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_focus_exit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_focus_exit :: (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_focus_exit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__focus_exit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__hsv_draw #-}

bindColorPicker__hsv_draw :: MethodBind
bindColorPicker__hsv_draw
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_hsv_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_hsv_draw ::
            (ColorPicker :< cls, Object :< cls) =>
            cls -> Int -> Control -> IO ()
_hsv_draw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__hsv_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__html_entered #-}

bindColorPicker__html_entered :: MethodBind
bindColorPicker__html_entered
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_html_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_html_entered ::
                (ColorPicker :< cls, Object :< cls) => cls -> GodotString -> IO ()
_html_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__html_entered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__html_focus_exit #-}

bindColorPicker__html_focus_exit :: MethodBind
bindColorPicker__html_focus_exit
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_html_focus_exit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_html_focus_exit ::
                   (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_html_focus_exit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__html_focus_exit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__preset_input #-}

bindColorPicker__preset_input :: MethodBind
bindColorPicker__preset_input
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_preset_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_preset_input ::
                (ColorPicker :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_preset_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__preset_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__sample_draw #-}

bindColorPicker__sample_draw :: MethodBind
bindColorPicker__sample_draw
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_sample_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_sample_draw :: (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_sample_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__sample_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__screen_input #-}

bindColorPicker__screen_input :: MethodBind
bindColorPicker__screen_input
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_screen_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_screen_input ::
                (ColorPicker :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_screen_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__screen_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__screen_pick_pressed #-}

bindColorPicker__screen_pick_pressed :: MethodBind
bindColorPicker__screen_pick_pressed
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_screen_pick_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_screen_pick_pressed ::
                       (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_screen_pick_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__screen_pick_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__text_type_toggled #-}

bindColorPicker__text_type_toggled :: MethodBind
bindColorPicker__text_type_toggled
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_text_type_toggled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_text_type_toggled ::
                     (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_text_type_toggled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__text_type_toggled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__update_presets #-}

bindColorPicker__update_presets :: MethodBind
bindColorPicker__update_presets
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_update_presets" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_presets ::
                  (ColorPicker :< cls, Object :< cls) => cls -> IO ()
_update_presets cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__update_presets (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__uv_input #-}

bindColorPicker__uv_input :: MethodBind
bindColorPicker__uv_input
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_uv_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_uv_input ::
            (ColorPicker :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_uv_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__uv_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__value_changed #-}

bindColorPicker__value_changed :: MethodBind
bindColorPicker__value_changed
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_value_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_value_changed ::
                 (ColorPicker :< cls, Object :< cls) => cls -> Float -> IO ()
_value_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__value_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker__w_input #-}

bindColorPicker__w_input :: MethodBind
bindColorPicker__w_input
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "_w_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_w_input ::
           (ColorPicker :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_w_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker__w_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_add_preset #-}

-- | Adds the given color to a list of color presets. The presets are displayed in the color picker and the user will be able to select them.
--   				[b]Note:[/b] the presets list is only for [i]this[/i] color picker.
bindColorPicker_add_preset :: MethodBind
bindColorPicker_add_preset
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "add_preset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the given color to a list of color presets. The presets are displayed in the color picker and the user will be able to select them.
--   				[b]Note:[/b] the presets list is only for [i]this[/i] color picker.
add_preset ::
             (ColorPicker :< cls, Object :< cls) => cls -> Color -> IO ()
add_preset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_add_preset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_are_presets_enabled #-}

-- | If [code]true[/code], the "add preset" button is enabled.
bindColorPicker_are_presets_enabled :: MethodBind
bindColorPicker_are_presets_enabled
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "are_presets_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the "add preset" button is enabled.
are_presets_enabled ::
                      (ColorPicker :< cls, Object :< cls) => cls -> IO Bool
are_presets_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_are_presets_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_are_presets_visible #-}

-- | If [code]true[/code], saved color presets are visible.
bindColorPicker_are_presets_visible :: MethodBind
bindColorPicker_are_presets_visible
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "are_presets_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], saved color presets are visible.
are_presets_visible ::
                      (ColorPicker :< cls, Object :< cls) => cls -> IO Bool
are_presets_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_are_presets_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_erase_preset #-}

-- | Removes the given color from the list of color presets of this color picker.
bindColorPicker_erase_preset :: MethodBind
bindColorPicker_erase_preset
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "erase_preset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given color from the list of color presets of this color picker.
erase_preset ::
               (ColorPicker :< cls, Object :< cls) => cls -> Color -> IO ()
erase_preset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_erase_preset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_get_pick_color #-}

-- | The currently selected color.
bindColorPicker_get_pick_color :: MethodBind
bindColorPicker_get_pick_color
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "get_pick_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected color.
get_pick_color ::
                 (ColorPicker :< cls, Object :< cls) => cls -> IO Color
get_pick_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_get_pick_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_get_presets #-}

-- | Returns the list of colors in the presets of the color picker.
bindColorPicker_get_presets :: MethodBind
bindColorPicker_get_presets
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "get_presets" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of colors in the presets of the color picker.
get_presets ::
              (ColorPicker :< cls, Object :< cls) => cls -> IO PoolColorArray
get_presets cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_get_presets (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_is_deferred_mode #-}

-- | If [code]true[/code], the color will apply only after the user releases the mouse button, otherwise it will apply immediately even in mouse motion event (which can cause performance issues).
bindColorPicker_is_deferred_mode :: MethodBind
bindColorPicker_is_deferred_mode
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "is_deferred_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the color will apply only after the user releases the mouse button, otherwise it will apply immediately even in mouse motion event (which can cause performance issues).
is_deferred_mode ::
                   (ColorPicker :< cls, Object :< cls) => cls -> IO Bool
is_deferred_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_is_deferred_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_is_editing_alpha #-}

-- | If [code]true[/code], shows an alpha channel slider (transparency).
bindColorPicker_is_editing_alpha :: MethodBind
bindColorPicker_is_editing_alpha
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "is_editing_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], shows an alpha channel slider (transparency).
is_editing_alpha ::
                   (ColorPicker :< cls, Object :< cls) => cls -> IO Bool
is_editing_alpha cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_is_editing_alpha
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_is_hsv_mode #-}

-- | If [code]true[/code], allows editing the color with Hue/Saturation/Value sliders.
--   			[b]Note:[/b] Cannot be enabled if raw mode is on.
bindColorPicker_is_hsv_mode :: MethodBind
bindColorPicker_is_hsv_mode
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "is_hsv_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], allows editing the color with Hue/Saturation/Value sliders.
--   			[b]Note:[/b] Cannot be enabled if raw mode is on.
is_hsv_mode ::
              (ColorPicker :< cls, Object :< cls) => cls -> IO Bool
is_hsv_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_is_hsv_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_is_raw_mode #-}

-- | If [code]true[/code], allows the color R, G, B component values to go beyond 1.0, which can be used for certain special operations that require it (like tinting without darkening or rendering sprites in HDR).
--   			[b]Note:[/b] Cannot be enabled if HSV mode is on.
bindColorPicker_is_raw_mode :: MethodBind
bindColorPicker_is_raw_mode
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "is_raw_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], allows the color R, G, B component values to go beyond 1.0, which can be used for certain special operations that require it (like tinting without darkening or rendering sprites in HDR).
--   			[b]Note:[/b] Cannot be enabled if HSV mode is on.
is_raw_mode ::
              (ColorPicker :< cls, Object :< cls) => cls -> IO Bool
is_raw_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_is_raw_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_deferred_mode #-}

-- | If [code]true[/code], the color will apply only after the user releases the mouse button, otherwise it will apply immediately even in mouse motion event (which can cause performance issues).
bindColorPicker_set_deferred_mode :: MethodBind
bindColorPicker_set_deferred_mode
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_deferred_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the color will apply only after the user releases the mouse button, otherwise it will apply immediately even in mouse motion event (which can cause performance issues).
set_deferred_mode ::
                    (ColorPicker :< cls, Object :< cls) => cls -> Bool -> IO ()
set_deferred_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_deferred_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_edit_alpha #-}

-- | If [code]true[/code], shows an alpha channel slider (transparency).
bindColorPicker_set_edit_alpha :: MethodBind
bindColorPicker_set_edit_alpha
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_edit_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], shows an alpha channel slider (transparency).
set_edit_alpha ::
                 (ColorPicker :< cls, Object :< cls) => cls -> Bool -> IO ()
set_edit_alpha cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_edit_alpha (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_hsv_mode #-}

-- | If [code]true[/code], allows editing the color with Hue/Saturation/Value sliders.
--   			[b]Note:[/b] Cannot be enabled if raw mode is on.
bindColorPicker_set_hsv_mode :: MethodBind
bindColorPicker_set_hsv_mode
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_hsv_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], allows editing the color with Hue/Saturation/Value sliders.
--   			[b]Note:[/b] Cannot be enabled if raw mode is on.
set_hsv_mode ::
               (ColorPicker :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hsv_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_hsv_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_pick_color #-}

-- | The currently selected color.
bindColorPicker_set_pick_color :: MethodBind
bindColorPicker_set_pick_color
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_pick_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected color.
set_pick_color ::
                 (ColorPicker :< cls, Object :< cls) => cls -> Color -> IO ()
set_pick_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_pick_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_presets_enabled #-}

-- | If [code]true[/code], the "add preset" button is enabled.
bindColorPicker_set_presets_enabled :: MethodBind
bindColorPicker_set_presets_enabled
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_presets_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the "add preset" button is enabled.
set_presets_enabled ::
                      (ColorPicker :< cls, Object :< cls) => cls -> Bool -> IO ()
set_presets_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_presets_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_presets_visible #-}

-- | If [code]true[/code], saved color presets are visible.
bindColorPicker_set_presets_visible :: MethodBind
bindColorPicker_set_presets_visible
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_presets_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], saved color presets are visible.
set_presets_visible ::
                      (ColorPicker :< cls, Object :< cls) => cls -> Bool -> IO ()
set_presets_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_presets_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorPicker_set_raw_mode #-}

-- | If [code]true[/code], allows the color R, G, B component values to go beyond 1.0, which can be used for certain special operations that require it (like tinting without darkening or rendering sprites in HDR).
--   			[b]Note:[/b] Cannot be enabled if HSV mode is on.
bindColorPicker_set_raw_mode :: MethodBind
bindColorPicker_set_raw_mode
  = unsafePerformIO $
      withCString "ColorPicker" $
        \ clsNamePtr ->
          withCString "set_raw_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], allows the color R, G, B component values to go beyond 1.0, which can be used for certain special operations that require it (like tinting without darkening or rendering sprites in HDR).
--   			[b]Note:[/b] Cannot be enabled if HSV mode is on.
set_raw_mode ::
               (ColorPicker :< cls, Object :< cls) => cls -> Bool -> IO ()
set_raw_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorPicker_set_raw_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)