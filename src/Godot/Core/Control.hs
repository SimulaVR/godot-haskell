{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Control
       (Godot.Core.Control._NOTIFICATION_MOUSE_EXIT,
        Godot.Core.Control._CURSOR_MOVE,
        Godot.Core.Control._NOTIFICATION_MOUSE_ENTER,
        Godot.Core.Control._PRESET_MODE_KEEP_WIDTH,
        Godot.Core.Control._CURSOR_ARROW,
        Godot.Core.Control._GROW_DIRECTION_BEGIN,
        Godot.Core.Control._CURSOR_IBEAM,
        Godot.Core.Control._NOTIFICATION_SCROLL_END,
        Godot.Core.Control._CURSOR_HSPLIT, Godot.Core.Control._FOCUS_ALL,
        Godot.Core.Control._PRESET_BOTTOM_RIGHT,
        Godot.Core.Control._CURSOR_DRAG,
        Godot.Core.Control._PRESET_TOP_LEFT,
        Godot.Core.Control._PRESET_CENTER_TOP,
        Godot.Core.Control._FOCUS_CLICK, Godot.Core.Control._CURSOR_BUSY,
        Godot.Core.Control._SIZE_SHRINK_CENTER,
        Godot.Core.Control._CURSOR_CROSS, Godot.Core.Control._CURSOR_WAIT,
        Godot.Core.Control._PRESET_TOP_RIGHT,
        Godot.Core.Control._NOTIFICATION_THEME_CHANGED,
        Godot.Core.Control._CURSOR_BDIAGSIZE,
        Godot.Core.Control._PRESET_HCENTER_WIDE,
        Godot.Core.Control._GROW_DIRECTION_BOTH,
        Godot.Core.Control._ANCHOR_BEGIN,
        Godot.Core.Control._MOUSE_FILTER_IGNORE,
        Godot.Core.Control._PRESET_TOP_WIDE,
        Godot.Core.Control._PRESET_MODE_MINSIZE,
        Godot.Core.Control._NOTIFICATION_FOCUS_ENTER,
        Godot.Core.Control._SIZE_EXPAND_FILL,
        Godot.Core.Control._CURSOR_HELP,
        Godot.Core.Control._NOTIFICATION_RESIZED,
        Godot.Core.Control._SIZE_EXPAND,
        Godot.Core.Control._CURSOR_CAN_DROP,
        Godot.Core.Control._NOTIFICATION_SCROLL_BEGIN,
        Godot.Core.Control._PRESET_MODE_KEEP_SIZE,
        Godot.Core.Control._GROW_DIRECTION_END,
        Godot.Core.Control._PRESET_VCENTER_WIDE,
        Godot.Core.Control._SIZE_SHRINK_END,
        Godot.Core.Control._PRESET_RIGHT_WIDE,
        Godot.Core.Control._SIZE_FILL,
        Godot.Core.Control._PRESET_BOTTOM_WIDE,
        Godot.Core.Control._CURSOR_POINTING_HAND,
        Godot.Core.Control._PRESET_MODE_KEEP_HEIGHT,
        Godot.Core.Control._CURSOR_FDIAGSIZE,
        Godot.Core.Control._PRESET_WIDE,
        Godot.Core.Control._PRESET_CENTER_LEFT,
        Godot.Core.Control._MOUSE_FILTER_PASS,
        Godot.Core.Control._NOTIFICATION_MODAL_CLOSE,
        Godot.Core.Control._CURSOR_HSIZE,
        Godot.Core.Control._PRESET_CENTER_RIGHT,
        Godot.Core.Control._CURSOR_FORBIDDEN,
        Godot.Core.Control._CURSOR_VSIZE,
        Godot.Core.Control._PRESET_CENTER_BOTTOM,
        Godot.Core.Control._NOTIFICATION_FOCUS_EXIT,
        Godot.Core.Control._PRESET_LEFT_WIDE,
        Godot.Core.Control._ANCHOR_END,
        Godot.Core.Control._MOUSE_FILTER_STOP,
        Godot.Core.Control._PRESET_BOTTOM_LEFT,
        Godot.Core.Control._PRESET_CENTER,
        Godot.Core.Control._CURSOR_VSPLIT, Godot.Core.Control._FOCUS_NONE,
        Godot.Core.Control.sig_focus_entered,
        Godot.Core.Control.sig_focus_exited,
        Godot.Core.Control.sig_gui_input,
        Godot.Core.Control.sig_minimum_size_changed,
        Godot.Core.Control.sig_modal_closed,
        Godot.Core.Control.sig_mouse_entered,
        Godot.Core.Control.sig_mouse_exited,
        Godot.Core.Control.sig_resized,
        Godot.Core.Control.sig_size_flags_changed,
        Godot.Core.Control._clips_input,
        Godot.Core.Control._get_minimum_size,
        Godot.Core.Control._get_tooltip, Godot.Core.Control._gui_input,
        Godot.Core.Control._make_custom_tooltip,
        Godot.Core.Control._override_changed,
        Godot.Core.Control._set_anchor,
        Godot.Core.Control._set_global_position,
        Godot.Core.Control._set_position, Godot.Core.Control._set_size,
        Godot.Core.Control._size_changed,
        Godot.Core.Control._theme_changed,
        Godot.Core.Control._update_minimum_size,
        Godot.Core.Control.accept_event,
        Godot.Core.Control.add_color_override,
        Godot.Core.Control.add_constant_override,
        Godot.Core.Control.add_font_override,
        Godot.Core.Control.add_icon_override,
        Godot.Core.Control.add_shader_override,
        Godot.Core.Control.add_stylebox_override,
        Godot.Core.Control.can_drop_data, Godot.Core.Control.drop_data,
        Godot.Core.Control.force_drag, Godot.Core.Control.get_anchor,
        Godot.Core.Control.get_begin, Godot.Core.Control.get_color,
        Godot.Core.Control.get_combined_minimum_size,
        Godot.Core.Control.get_constant,
        Godot.Core.Control.get_cursor_shape,
        Godot.Core.Control.get_custom_minimum_size,
        Godot.Core.Control.get_default_cursor_shape,
        Godot.Core.Control.get_drag_data, Godot.Core.Control.get_end,
        Godot.Core.Control.get_focus_mode,
        Godot.Core.Control.get_focus_neighbour,
        Godot.Core.Control.get_focus_next,
        Godot.Core.Control.get_focus_owner,
        Godot.Core.Control.get_focus_previous, Godot.Core.Control.get_font,
        Godot.Core.Control.get_global_position,
        Godot.Core.Control.get_global_rect,
        Godot.Core.Control.get_h_grow_direction,
        Godot.Core.Control.get_h_size_flags, Godot.Core.Control.get_icon,
        Godot.Core.Control.get_margin, Godot.Core.Control.get_minimum_size,
        Godot.Core.Control.get_mouse_filter,
        Godot.Core.Control.get_parent_area_size,
        Godot.Core.Control.get_parent_control,
        Godot.Core.Control.get_pivot_offset,
        Godot.Core.Control.get_position, Godot.Core.Control.get_rect,
        Godot.Core.Control.get_rotation,
        Godot.Core.Control.get_rotation_degrees,
        Godot.Core.Control.get_scale, Godot.Core.Control.get_size,
        Godot.Core.Control.get_stretch_ratio,
        Godot.Core.Control.get_stylebox, Godot.Core.Control.get_theme,
        Godot.Core.Control.get_tooltip,
        Godot.Core.Control.get_v_grow_direction,
        Godot.Core.Control.get_v_size_flags,
        Godot.Core.Control.grab_click_focus, Godot.Core.Control.grab_focus,
        Godot.Core.Control.has_color,
        Godot.Core.Control.has_color_override,
        Godot.Core.Control.has_constant,
        Godot.Core.Control.has_constant_override,
        Godot.Core.Control.has_focus, Godot.Core.Control.has_font,
        Godot.Core.Control.has_font_override, Godot.Core.Control.has_icon,
        Godot.Core.Control.has_icon_override, Godot.Core.Control.has_point,
        Godot.Core.Control.has_shader_override,
        Godot.Core.Control.has_stylebox,
        Godot.Core.Control.has_stylebox_override,
        Godot.Core.Control.is_clipping_contents,
        Godot.Core.Control.minimum_size_changed,
        Godot.Core.Control.release_focus, Godot.Core.Control.set_anchor,
        Godot.Core.Control.set_anchor_and_margin,
        Godot.Core.Control.set_anchors_and_margins_preset,
        Godot.Core.Control.set_anchors_preset,
        Godot.Core.Control.set_begin, Godot.Core.Control.set_clip_contents,
        Godot.Core.Control.set_custom_minimum_size,
        Godot.Core.Control.set_default_cursor_shape,
        Godot.Core.Control.set_drag_forwarding,
        Godot.Core.Control.set_drag_preview, Godot.Core.Control.set_end,
        Godot.Core.Control.set_focus_mode,
        Godot.Core.Control.set_focus_neighbour,
        Godot.Core.Control.set_focus_next,
        Godot.Core.Control.set_focus_previous,
        Godot.Core.Control.set_global_position,
        Godot.Core.Control.set_h_grow_direction,
        Godot.Core.Control.set_h_size_flags, Godot.Core.Control.set_margin,
        Godot.Core.Control.set_margins_preset,
        Godot.Core.Control.set_mouse_filter,
        Godot.Core.Control.set_pivot_offset,
        Godot.Core.Control.set_position, Godot.Core.Control.set_rotation,
        Godot.Core.Control.set_rotation_degrees,
        Godot.Core.Control.set_scale, Godot.Core.Control.set_size,
        Godot.Core.Control.set_stretch_ratio, Godot.Core.Control.set_theme,
        Godot.Core.Control.set_tooltip,
        Godot.Core.Control.set_v_grow_direction,
        Godot.Core.Control.set_v_size_flags, Godot.Core.Control.show_modal,
        Godot.Core.Control.warp_mouse)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_MOUSE_EXIT :: Int
_NOTIFICATION_MOUSE_EXIT = 42

_CURSOR_MOVE :: Int
_CURSOR_MOVE = 13

_NOTIFICATION_MOUSE_ENTER :: Int
_NOTIFICATION_MOUSE_ENTER = 41

_PRESET_MODE_KEEP_WIDTH :: Int
_PRESET_MODE_KEEP_WIDTH = 1

_CURSOR_ARROW :: Int
_CURSOR_ARROW = 0

_GROW_DIRECTION_BEGIN :: Int
_GROW_DIRECTION_BEGIN = 0

_CURSOR_IBEAM :: Int
_CURSOR_IBEAM = 1

_NOTIFICATION_SCROLL_END :: Int
_NOTIFICATION_SCROLL_END = 48

_CURSOR_HSPLIT :: Int
_CURSOR_HSPLIT = 15

_FOCUS_ALL :: Int
_FOCUS_ALL = 2

_PRESET_BOTTOM_RIGHT :: Int
_PRESET_BOTTOM_RIGHT = 3

_CURSOR_DRAG :: Int
_CURSOR_DRAG = 6

_PRESET_TOP_LEFT :: Int
_PRESET_TOP_LEFT = 0

_PRESET_CENTER_TOP :: Int
_PRESET_CENTER_TOP = 5

_FOCUS_CLICK :: Int
_FOCUS_CLICK = 1

_CURSOR_BUSY :: Int
_CURSOR_BUSY = 5

_SIZE_SHRINK_CENTER :: Int
_SIZE_SHRINK_CENTER = 4

_CURSOR_CROSS :: Int
_CURSOR_CROSS = 3

_CURSOR_WAIT :: Int
_CURSOR_WAIT = 4

_PRESET_TOP_RIGHT :: Int
_PRESET_TOP_RIGHT = 1

_NOTIFICATION_THEME_CHANGED :: Int
_NOTIFICATION_THEME_CHANGED = 45

_CURSOR_BDIAGSIZE :: Int
_CURSOR_BDIAGSIZE = 11

_PRESET_HCENTER_WIDE :: Int
_PRESET_HCENTER_WIDE = 14

_GROW_DIRECTION_BOTH :: Int
_GROW_DIRECTION_BOTH = 2

_ANCHOR_BEGIN :: Int
_ANCHOR_BEGIN = 0

_MOUSE_FILTER_IGNORE :: Int
_MOUSE_FILTER_IGNORE = 2

_PRESET_TOP_WIDE :: Int
_PRESET_TOP_WIDE = 10

_PRESET_MODE_MINSIZE :: Int
_PRESET_MODE_MINSIZE = 0

_NOTIFICATION_FOCUS_ENTER :: Int
_NOTIFICATION_FOCUS_ENTER = 43

_SIZE_EXPAND_FILL :: Int
_SIZE_EXPAND_FILL = 3

_CURSOR_HELP :: Int
_CURSOR_HELP = 16

_NOTIFICATION_RESIZED :: Int
_NOTIFICATION_RESIZED = 40

_SIZE_EXPAND :: Int
_SIZE_EXPAND = 2

_CURSOR_CAN_DROP :: Int
_CURSOR_CAN_DROP = 7

_NOTIFICATION_SCROLL_BEGIN :: Int
_NOTIFICATION_SCROLL_BEGIN = 47

_PRESET_MODE_KEEP_SIZE :: Int
_PRESET_MODE_KEEP_SIZE = 3

_GROW_DIRECTION_END :: Int
_GROW_DIRECTION_END = 1

_PRESET_VCENTER_WIDE :: Int
_PRESET_VCENTER_WIDE = 13

_SIZE_SHRINK_END :: Int
_SIZE_SHRINK_END = 8

_PRESET_RIGHT_WIDE :: Int
_PRESET_RIGHT_WIDE = 11

_SIZE_FILL :: Int
_SIZE_FILL = 1

_PRESET_BOTTOM_WIDE :: Int
_PRESET_BOTTOM_WIDE = 12

_CURSOR_POINTING_HAND :: Int
_CURSOR_POINTING_HAND = 2

_PRESET_MODE_KEEP_HEIGHT :: Int
_PRESET_MODE_KEEP_HEIGHT = 2

_CURSOR_FDIAGSIZE :: Int
_CURSOR_FDIAGSIZE = 12

_PRESET_WIDE :: Int
_PRESET_WIDE = 15

_PRESET_CENTER_LEFT :: Int
_PRESET_CENTER_LEFT = 4

_MOUSE_FILTER_PASS :: Int
_MOUSE_FILTER_PASS = 1

_NOTIFICATION_MODAL_CLOSE :: Int
_NOTIFICATION_MODAL_CLOSE = 46

_CURSOR_HSIZE :: Int
_CURSOR_HSIZE = 10

_PRESET_CENTER_RIGHT :: Int
_PRESET_CENTER_RIGHT = 6

_CURSOR_FORBIDDEN :: Int
_CURSOR_FORBIDDEN = 8

_CURSOR_VSIZE :: Int
_CURSOR_VSIZE = 9

_PRESET_CENTER_BOTTOM :: Int
_PRESET_CENTER_BOTTOM = 7

_NOTIFICATION_FOCUS_EXIT :: Int
_NOTIFICATION_FOCUS_EXIT = 44

_PRESET_LEFT_WIDE :: Int
_PRESET_LEFT_WIDE = 9

_ANCHOR_END :: Int
_ANCHOR_END = 1

_MOUSE_FILTER_STOP :: Int
_MOUSE_FILTER_STOP = 0

_PRESET_BOTTOM_LEFT :: Int
_PRESET_BOTTOM_LEFT = 2

_PRESET_CENTER :: Int
_PRESET_CENTER = 8

_CURSOR_VSPLIT :: Int
_CURSOR_VSPLIT = 14

_FOCUS_NONE :: Int
_FOCUS_NONE = 0

-- | Emitted when the node gains keyboard focus.
sig_focus_entered :: Godot.Internal.Dispatch.Signal Control
sig_focus_entered = Godot.Internal.Dispatch.Signal "focus_entered"

-- | Emitted when the node loses keyboard focus.
sig_focus_exited :: Godot.Internal.Dispatch.Signal Control
sig_focus_exited = Godot.Internal.Dispatch.Signal "focus_exited"

-- | Emitted when the node receives an [InputEvent].
sig_gui_input :: Godot.Internal.Dispatch.Signal Control
sig_gui_input = Godot.Internal.Dispatch.Signal "gui_input"

-- | Emitted when the node's minimum size changes.
sig_minimum_size_changed :: Godot.Internal.Dispatch.Signal Control
sig_minimum_size_changed
  = Godot.Internal.Dispatch.Signal "minimum_size_changed"

-- | Emitted when a modal [code]Control[/code] is closed. See [method show_modal].
sig_modal_closed :: Godot.Internal.Dispatch.Signal Control
sig_modal_closed = Godot.Internal.Dispatch.Signal "modal_closed"

-- | Emitted when the mouse enters the control's [code]Rect[/code] area, provided its [member mouse_filter] lets the event reach it.
sig_mouse_entered :: Godot.Internal.Dispatch.Signal Control
sig_mouse_entered = Godot.Internal.Dispatch.Signal "mouse_entered"

-- | Emitted when the mouse leaves the control's [code]Rect[/code] area, provided its [member mouse_filter] lets the event reach it.
sig_mouse_exited :: Godot.Internal.Dispatch.Signal Control
sig_mouse_exited = Godot.Internal.Dispatch.Signal "mouse_exited"

-- | Emitted when the control changes size.
sig_resized :: Godot.Internal.Dispatch.Signal Control
sig_resized = Godot.Internal.Dispatch.Signal "resized"

-- | Emitted when one of the size flags changes. See [member size_flags_horizontal] and [member size_flags_vertical].
sig_size_flags_changed :: Godot.Internal.Dispatch.Signal Control
sig_size_flags_changed
  = Godot.Internal.Dispatch.Signal "size_flags_changed"

{-# NOINLINE bindControl__clips_input #-}

bindControl__clips_input :: MethodBind
bindControl__clips_input
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_clips_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_clips_input :: (Control :< cls, Object :< cls) => cls -> IO Bool
_clips_input cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__clips_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__get_minimum_size #-}

-- | Returns the minimum size for this control. See [member rect_min_size].
bindControl__get_minimum_size :: MethodBind
bindControl__get_minimum_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_get_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the minimum size for this control. See [member rect_min_size].
_get_minimum_size ::
                    (Control :< cls, Object :< cls) => cls -> IO Vector2
_get_minimum_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__get_minimum_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__get_tooltip #-}

-- | Changes the tooltip text. The tooltip appears when the user's mouse cursor stays idle over this control for a few moments, provided that the [member mouse_filter] property is not [constant MOUSE_FILTER_IGNORE].
bindControl__get_tooltip :: MethodBind
bindControl__get_tooltip
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_get_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the tooltip text. The tooltip appears when the user's mouse cursor stays idle over this control for a few moments, provided that the [member mouse_filter] property is not [constant MOUSE_FILTER_IGNORE].
_get_tooltip ::
               (Control :< cls, Object :< cls) => cls -> IO GodotString
_get_tooltip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__get_tooltip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__gui_input #-}

-- | Use this method to process and accept inputs on UI elements. See [method accept_event].
--   				Replaces Godot 2's [code]_input_event[/code].
bindControl__gui_input :: MethodBind
bindControl__gui_input
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Use this method to process and accept inputs on UI elements. See [method accept_event].
--   				Replaces Godot 2's [code]_input_event[/code].
_gui_input ::
             (Control :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__make_custom_tooltip #-}

bindControl__make_custom_tooltip :: MethodBind
bindControl__make_custom_tooltip
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_make_custom_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_make_custom_tooltip ::
                       (Control :< cls, Object :< cls) => cls -> GodotString -> IO Object
_make_custom_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__make_custom_tooltip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__override_changed #-}

bindControl__override_changed :: MethodBind
bindControl__override_changed
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_override_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_override_changed ::
                    (Control :< cls, Object :< cls) => cls -> IO ()
_override_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__override_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__set_anchor #-}

-- | Anchors the bottom edge of the node to the origin, the center, or the end of its parent control. It changes how the bottom margin updates when the node moves or changes size. You can use one of the [code]ANCHOR_*[/code] constants for convenience. Default value: [constant ANCHOR_BEGIN].
bindControl__set_anchor :: MethodBind
bindControl__set_anchor
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_set_anchor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Anchors the bottom edge of the node to the origin, the center, or the end of its parent control. It changes how the bottom margin updates when the node moves or changes size. You can use one of the [code]ANCHOR_*[/code] constants for convenience. Default value: [constant ANCHOR_BEGIN].
_set_anchor ::
              (Control :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
_set_anchor cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__set_anchor (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__set_global_position #-}

bindControl__set_global_position :: MethodBind
bindControl__set_global_position
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_set_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_global_position ::
                       (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_set_global_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__set_global_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__set_position #-}

bindControl__set_position :: MethodBind
bindControl__set_position
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_position ::
                (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__set_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__set_size #-}

bindControl__set_size :: MethodBind
bindControl__set_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_size ::
            (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__size_changed #-}

bindControl__size_changed :: MethodBind
bindControl__size_changed
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_size_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_size_changed :: (Control :< cls, Object :< cls) => cls -> IO ()
_size_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__size_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__theme_changed #-}

bindControl__theme_changed :: MethodBind
bindControl__theme_changed
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_theme_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_theme_changed :: (Control :< cls, Object :< cls) => cls -> IO ()
_theme_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__theme_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl__update_minimum_size #-}

bindControl__update_minimum_size :: MethodBind
bindControl__update_minimum_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "_update_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_minimum_size ::
                       (Control :< cls, Object :< cls) => cls -> IO ()
_update_minimum_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl__update_minimum_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_accept_event #-}

-- | Marks an input event as handled. Once you accept an input event, it stops propagating, even to nodes listening to [method Node._unhandled_input] or [method Node._unhandled_key_input].
bindControl_accept_event :: MethodBind
bindControl_accept_event
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "accept_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Marks an input event as handled. Once you accept an input event, it stops propagating, even to nodes listening to [method Node._unhandled_input] or [method Node._unhandled_key_input].
accept_event :: (Control :< cls, Object :< cls) => cls -> IO ()
accept_event cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_accept_event (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_add_color_override #-}

-- | Overrides the color in the [member theme] resource the node uses.
bindControl_add_color_override :: MethodBind
bindControl_add_color_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "add_color_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the color in the [member theme] resource the node uses.
add_color_override ::
                     (Control :< cls, Object :< cls) =>
                     cls -> GodotString -> Color -> IO ()
add_color_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_add_color_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_add_constant_override #-}

-- | Overrides an integer constant in the [member theme] resource the node uses. If the [code]constant[/code] is invalid, Godot clears the override.
bindControl_add_constant_override :: MethodBind
bindControl_add_constant_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "add_constant_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides an integer constant in the [member theme] resource the node uses. If the [code]constant[/code] is invalid, Godot clears the override.
add_constant_override ::
                        (Control :< cls, Object :< cls) =>
                        cls -> GodotString -> Int -> IO ()
add_constant_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_add_constant_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_add_font_override #-}

-- | Overrides the [code]name[/code] font in the [member theme] resource the node uses. If [code]font[/code] is empty, Godot clears the override.
bindControl_add_font_override :: MethodBind
bindControl_add_font_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "add_font_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the [code]name[/code] font in the [member theme] resource the node uses. If [code]font[/code] is empty, Godot clears the override.
add_font_override ::
                    (Control :< cls, Object :< cls) =>
                    cls -> GodotString -> Font -> IO ()
add_font_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_add_font_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_add_icon_override #-}

-- | Overrides the [code]name[/code] icon in the [member theme] resource the node uses. If [code]icon[/code] is empty, Godot clears the override.
bindControl_add_icon_override :: MethodBind
bindControl_add_icon_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "add_icon_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the [code]name[/code] icon in the [member theme] resource the node uses. If [code]icon[/code] is empty, Godot clears the override.
add_icon_override ::
                    (Control :< cls, Object :< cls) =>
                    cls -> GodotString -> Texture -> IO ()
add_icon_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_add_icon_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_add_shader_override #-}

-- | Overrides the [code]name[/code] shader in the [member theme] resource the node uses. If [code]shader[/code] is empty, Godot clears the override.
bindControl_add_shader_override :: MethodBind
bindControl_add_shader_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "add_shader_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the [code]name[/code] shader in the [member theme] resource the node uses. If [code]shader[/code] is empty, Godot clears the override.
add_shader_override ::
                      (Control :< cls, Object :< cls) =>
                      cls -> GodotString -> Shader -> IO ()
add_shader_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_add_shader_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_add_stylebox_override #-}

-- | Overrides the [code]name[/code] [StyleBox] in the [member theme] resource the node uses. If [code]stylebox[/code] is empty, Godot clears the override.
bindControl_add_stylebox_override :: MethodBind
bindControl_add_stylebox_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "add_stylebox_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the [code]name[/code] [StyleBox] in the [member theme] resource the node uses. If [code]stylebox[/code] is empty, Godot clears the override.
add_stylebox_override ::
                        (Control :< cls, Object :< cls) =>
                        cls -> GodotString -> StyleBox -> IO ()
add_stylebox_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_add_stylebox_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_can_drop_data #-}

-- | Godot calls this method to test if [code]data[/code] from a control's [method get_drag_data] can be dropped at [code]position[/code]. [code]position[/code] is local to this control.
--   				This method should only be used to test the data. Process the data in [method drop_data].
--   				[codeblock]
--   				extends Control
--   
--   				func can_drop_data(position, data):
--   				    # check position if it is relevant to you
--   				    # otherwise just check data
--   				    return typeof(data) == TYPE_DICTIONARY and data.has('expected')
--   				[/codeblock]
bindControl_can_drop_data :: MethodBind
bindControl_can_drop_data
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "can_drop_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Godot calls this method to test if [code]data[/code] from a control's [method get_drag_data] can be dropped at [code]position[/code]. [code]position[/code] is local to this control.
--   				This method should only be used to test the data. Process the data in [method drop_data].
--   				[codeblock]
--   				extends Control
--   
--   				func can_drop_data(position, data):
--   				    # check position if it is relevant to you
--   				    # otherwise just check data
--   				    return typeof(data) == TYPE_DICTIONARY and data.has('expected')
--   				[/codeblock]
can_drop_data ::
                (Control :< cls, Object :< cls) =>
                cls -> Vector2 -> GodotVariant -> IO Bool
can_drop_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_can_drop_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_drop_data #-}

-- | Godot calls this method to pass you the [code]data[/code] from a control's [method get_drag_data] result. Godot first calls [method can_drop_data] to test if [code]data[/code] is allowed to drop at [code]position[/code] where [code]position[/code] is local to this control.
--   				[codeblock]
--   				extends ColorRect
--   
--   				func can_drop_data(position, data):
--   				    return typeof(data) == TYPE_DICTIONARY and data.has('color')
--   
--   				func drop_data(position, data):
--   				    color = data['color']
--   				[/codeblock]
bindControl_drop_data :: MethodBind
bindControl_drop_data
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "drop_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Godot calls this method to pass you the [code]data[/code] from a control's [method get_drag_data] result. Godot first calls [method can_drop_data] to test if [code]data[/code] is allowed to drop at [code]position[/code] where [code]position[/code] is local to this control.
--   				[codeblock]
--   				extends ColorRect
--   
--   				func can_drop_data(position, data):
--   				    return typeof(data) == TYPE_DICTIONARY and data.has('color')
--   
--   				func drop_data(position, data):
--   				    color = data['color']
--   				[/codeblock]
drop_data ::
            (Control :< cls, Object :< cls) =>
            cls -> Vector2 -> GodotVariant -> IO ()
drop_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_drop_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_force_drag #-}

-- | Forces drag and bypasses [method get_drag_data] and [method set_drag_preview] by passing [code]data[/code] and [code]preview[/code]. Drag will start even if the mouse is neither over nor pressed on this control.
--   				The methods [method can_drop_data] and [method drop_data] must be implemented on controls that want to receive drop data.
bindControl_force_drag :: MethodBind
bindControl_force_drag
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "force_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forces drag and bypasses [method get_drag_data] and [method set_drag_preview] by passing [code]data[/code] and [code]preview[/code]. Drag will start even if the mouse is neither over nor pressed on this control.
--   				The methods [method can_drop_data] and [method drop_data] must be implemented on controls that want to receive drop data.
force_drag ::
             (Control :< cls, Object :< cls) =>
             cls -> GodotVariant -> Control -> IO ()
force_drag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_force_drag (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_anchor #-}

-- | Anchors the bottom edge of the node to the origin, the center, or the end of its parent control. It changes how the bottom margin updates when the node moves or changes size. You can use one of the [code]ANCHOR_*[/code] constants for convenience. Default value: [constant ANCHOR_BEGIN].
bindControl_get_anchor :: MethodBind
bindControl_get_anchor
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_anchor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Anchors the bottom edge of the node to the origin, the center, or the end of its parent control. It changes how the bottom margin updates when the node moves or changes size. You can use one of the [code]ANCHOR_*[/code] constants for convenience. Default value: [constant ANCHOR_BEGIN].
get_anchor ::
             (Control :< cls, Object :< cls) => cls -> Int -> IO Float
get_anchor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_anchor (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_begin #-}

-- | Returns [member margin_left] and [member margin_top]. See also [member rect_position].
bindControl_get_begin :: MethodBind
bindControl_get_begin
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [member margin_left] and [member margin_top]. See also [member rect_position].
get_begin :: (Control :< cls, Object :< cls) => cls -> IO Vector2
get_begin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_begin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_color #-}

bindControl_get_color :: MethodBind
bindControl_get_color
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color ::
            (Control :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> IO Color
get_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_combined_minimum_size #-}

bindControl_get_combined_minimum_size :: MethodBind
bindControl_get_combined_minimum_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_combined_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_combined_minimum_size ::
                            (Control :< cls, Object :< cls) => cls -> IO Vector2
get_combined_minimum_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_combined_minimum_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_constant #-}

bindControl_get_constant :: MethodBind
bindControl_get_constant
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant ::
               (Control :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Int
get_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_constant (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_cursor_shape #-}

-- | Returns the mouse cursor shape the control displays on mouse hover. See [enum CursorShape].
bindControl_get_cursor_shape :: MethodBind
bindControl_get_cursor_shape
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mouse cursor shape the control displays on mouse hover. See [enum CursorShape].
get_cursor_shape ::
                   (Control :< cls, Object :< cls) => cls -> Vector2 -> IO Int
get_cursor_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_cursor_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_custom_minimum_size #-}

-- | The minimum size of the node's bounding rectangle. If you set it to a value greater than (0, 0), the node's bounding rectangle will always have at least this size, even if its content is smaller. If it's set to (0, 0), the node sizes automatically to fit its content, be it a texture or child nodes.
bindControl_get_custom_minimum_size :: MethodBind
bindControl_get_custom_minimum_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_custom_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum size of the node's bounding rectangle. If you set it to a value greater than (0, 0), the node's bounding rectangle will always have at least this size, even if its content is smaller. If it's set to (0, 0), the node sizes automatically to fit its content, be it a texture or child nodes.
get_custom_minimum_size ::
                          (Control :< cls, Object :< cls) => cls -> IO Vector2
get_custom_minimum_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_custom_minimum_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_default_cursor_shape #-}

-- | The default cursor shape for this control. Useful for Godot plugins and applications or games that use the system's mouse cursors.
--   			[b]Note:[/b] On Linux, shapes may vary depending on the cursor theme of the system.
bindControl_get_default_cursor_shape :: MethodBind
bindControl_get_default_cursor_shape
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_default_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default cursor shape for this control. Useful for Godot plugins and applications or games that use the system's mouse cursors.
--   			[b]Note:[/b] On Linux, shapes may vary depending on the cursor theme of the system.
get_default_cursor_shape ::
                           (Control :< cls, Object :< cls) => cls -> IO Int
get_default_cursor_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_default_cursor_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_drag_data #-}

-- | Godot calls this method to get data that can be dragged and dropped onto controls that expect drop data. Returns null if there is no data to drag. Controls that want to receive drop data should implement [method can_drop_data] and [method drop_data]. [code]position[/code] is local to this control. Drag may be forced with [method force_drag].
--   				A preview that will follow the mouse that should represent the data can be set with [method set_drag_preview]. A good time to set the preview is in this method.
--   				[codeblock]
--   				extends Control
--   
--   				func get_drag_data(position):
--   				    var mydata = make_data()
--   				    set_drag_preview(make_preview(mydata))
--   				    return mydata
--   				[/codeblock]
bindControl_get_drag_data :: MethodBind
bindControl_get_drag_data
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_drag_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Godot calls this method to get data that can be dragged and dropped onto controls that expect drop data. Returns null if there is no data to drag. Controls that want to receive drop data should implement [method can_drop_data] and [method drop_data]. [code]position[/code] is local to this control. Drag may be forced with [method force_drag].
--   				A preview that will follow the mouse that should represent the data can be set with [method set_drag_preview]. A good time to set the preview is in this method.
--   				[codeblock]
--   				extends Control
--   
--   				func get_drag_data(position):
--   				    var mydata = make_data()
--   				    set_drag_preview(make_preview(mydata))
--   				    return mydata
--   				[/codeblock]
get_drag_data ::
                (Control :< cls, Object :< cls) =>
                cls -> Vector2 -> IO GodotVariant
get_drag_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_drag_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_end #-}

-- | Returns [member margin_right] and [member margin_bottom].
bindControl_get_end :: MethodBind
bindControl_get_end
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [member margin_right] and [member margin_bottom].
get_end :: (Control :< cls, Object :< cls) => cls -> IO Vector2
get_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_end (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_focus_mode #-}

-- | The focus access mode for the control (None, Click or All). Only one Control can be focused at the same time, and it will receive keyboard signals.
bindControl_get_focus_mode :: MethodBind
bindControl_get_focus_mode
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_focus_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The focus access mode for the control (None, Click or All). Only one Control can be focused at the same time, and it will receive keyboard signals.
get_focus_mode :: (Control :< cls, Object :< cls) => cls -> IO Int
get_focus_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_focus_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_focus_neighbour #-}

-- | Tells Godot which node it should give keyboard focus to if the user presses the down arrow on the keyboard or down on a gamepad by default. You can change the key by editing the [code]ui_down[/code] input action. The node must be a [code]Control[/code]. If this property is not set, Godot will give focus to the closest [code]Control[/code] to the bottom of this one.
bindControl_get_focus_neighbour :: MethodBind
bindControl_get_focus_neighbour
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_focus_neighbour" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells Godot which node it should give keyboard focus to if the user presses the down arrow on the keyboard or down on a gamepad by default. You can change the key by editing the [code]ui_down[/code] input action. The node must be a [code]Control[/code]. If this property is not set, Godot will give focus to the closest [code]Control[/code] to the bottom of this one.
get_focus_neighbour ::
                      (Control :< cls, Object :< cls) => cls -> Int -> IO NodePath
get_focus_neighbour cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_focus_neighbour (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_focus_next #-}

-- | Tells Godot which node it should give keyboard focus to if the user presses Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_next[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
bindControl_get_focus_next :: MethodBind
bindControl_get_focus_next
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_focus_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells Godot which node it should give keyboard focus to if the user presses Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_next[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
get_focus_next ::
                 (Control :< cls, Object :< cls) => cls -> IO NodePath
get_focus_next cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_focus_next (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_focus_owner #-}

-- | Returns the control that has the keyboard focus or [code]null[/code] if none.
bindControl_get_focus_owner :: MethodBind
bindControl_get_focus_owner
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_focus_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the control that has the keyboard focus or [code]null[/code] if none.
get_focus_owner ::
                  (Control :< cls, Object :< cls) => cls -> IO Control
get_focus_owner cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_focus_owner (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_focus_previous #-}

-- | Tells Godot which node it should give keyboard focus to if the user presses Shift+Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_prev[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
bindControl_get_focus_previous :: MethodBind
bindControl_get_focus_previous
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_focus_previous" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells Godot which node it should give keyboard focus to if the user presses Shift+Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_prev[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
get_focus_previous ::
                     (Control :< cls, Object :< cls) => cls -> IO NodePath
get_focus_previous cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_focus_previous (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_font #-}

bindControl_get_font :: MethodBind
bindControl_get_font
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_font ::
           (Control :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Font
get_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_font (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_global_position #-}

-- | The node's global position, relative to the world (usually to the top-left corner of the window).
bindControl_get_global_position :: MethodBind
bindControl_get_global_position
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's global position, relative to the world (usually to the top-left corner of the window).
get_global_position ::
                      (Control :< cls, Object :< cls) => cls -> IO Vector2
get_global_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_global_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_global_rect #-}

-- | Returns the position and size of the control relative to the top-left corner of the screen. See [member rect_position] and [member rect_size].
bindControl_get_global_rect :: MethodBind
bindControl_get_global_rect
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_global_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position and size of the control relative to the top-left corner of the screen. See [member rect_position] and [member rect_size].
get_global_rect ::
                  (Control :< cls, Object :< cls) => cls -> IO Rect2
get_global_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_global_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_h_grow_direction #-}

-- | Controls the direction on the horizontal axis in which the control should grow if its horizontal minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
bindControl_get_h_grow_direction :: MethodBind
bindControl_get_h_grow_direction
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_h_grow_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the direction on the horizontal axis in which the control should grow if its horizontal minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
get_h_grow_direction ::
                       (Control :< cls, Object :< cls) => cls -> IO Int
get_h_grow_direction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_h_grow_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_h_size_flags #-}

-- | Tells the parent [Container] nodes how they should resize and place the node on the X axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
bindControl_get_h_size_flags :: MethodBind
bindControl_get_h_size_flags
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_h_size_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells the parent [Container] nodes how they should resize and place the node on the X axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
get_h_size_flags ::
                   (Control :< cls, Object :< cls) => cls -> IO Int
get_h_size_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_h_size_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_icon #-}

bindControl_get_icon :: MethodBind
bindControl_get_icon
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_icon ::
           (Control :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Texture
get_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_icon (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_margin #-}

-- | Distance between the node's bottom edge and its parent control, based on [member anchor_bottom].
--   			Margins are often controlled by one or multiple parent [Container] nodes, so you should not modify them manually if your node is a direct child of a [Container]. Margins update automatically when you move or resize the node.
bindControl_get_margin :: MethodBind
bindControl_get_margin
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance between the node's bottom edge and its parent control, based on [member anchor_bottom].
--   			Margins are often controlled by one or multiple parent [Container] nodes, so you should not modify them manually if your node is a direct child of a [Container]. Margins update automatically when you move or resize the node.
get_margin ::
             (Control :< cls, Object :< cls) => cls -> Int -> IO Float
get_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_minimum_size #-}

-- | Returns the minimum size for this control. See [member rect_min_size].
bindControl_get_minimum_size :: MethodBind
bindControl_get_minimum_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the minimum size for this control. See [member rect_min_size].
get_minimum_size ::
                   (Control :< cls, Object :< cls) => cls -> IO Vector2
get_minimum_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_minimum_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_mouse_filter #-}

-- | Controls whether the control will be able to receive mouse button input events through [method _gui_input] and how these events should be handled. Also controls whether the control can receive the [signal mouse_entered], and [signal mouse_exited] signals. See the constants to learn what each does.
bindControl_get_mouse_filter :: MethodBind
bindControl_get_mouse_filter
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_mouse_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls whether the control will be able to receive mouse button input events through [method _gui_input] and how these events should be handled. Also controls whether the control can receive the [signal mouse_entered], and [signal mouse_exited] signals. See the constants to learn what each does.
get_mouse_filter ::
                   (Control :< cls, Object :< cls) => cls -> IO Int
get_mouse_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_mouse_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_parent_area_size #-}

-- | Returns the width/height occupied in the parent control.
bindControl_get_parent_area_size :: MethodBind
bindControl_get_parent_area_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_parent_area_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the width/height occupied in the parent control.
get_parent_area_size ::
                       (Control :< cls, Object :< cls) => cls -> IO Vector2
get_parent_area_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_parent_area_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_parent_control #-}

-- | Returns the parent control node.
bindControl_get_parent_control :: MethodBind
bindControl_get_parent_control
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_parent_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent control node.
get_parent_control ::
                     (Control :< cls, Object :< cls) => cls -> IO Control
get_parent_control cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_parent_control (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_pivot_offset #-}

-- | By default, the node's pivot is its top-left corner. When you change its [member rect_scale], it will scale around this pivot. Set this property to [member rect_size] / 2 to center the pivot in the node's rectangle.
bindControl_get_pivot_offset :: MethodBind
bindControl_get_pivot_offset
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_pivot_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | By default, the node's pivot is its top-left corner. When you change its [member rect_scale], it will scale around this pivot. Set this property to [member rect_size] / 2 to center the pivot in the node's rectangle.
get_pivot_offset ::
                   (Control :< cls, Object :< cls) => cls -> IO Vector2
get_pivot_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_pivot_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_position #-}

-- | The node's position, relative to its parent. It corresponds to the rectangle's top-left corner. The property is not affected by [member rect_pivot_offset].
bindControl_get_position :: MethodBind
bindControl_get_position
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's position, relative to its parent. It corresponds to the rectangle's top-left corner. The property is not affected by [member rect_pivot_offset].
get_position ::
               (Control :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_rect #-}

-- | Returns the position and size of the control relative to the top-left corner of the parent Control. See [member rect_position] and [member rect_size].
bindControl_get_rect :: MethodBind
bindControl_get_rect
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position and size of the control relative to the top-left corner of the parent Control. See [member rect_position] and [member rect_size].
get_rect :: (Control :< cls, Object :< cls) => cls -> IO Rect2
get_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_rect (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_rotation #-}

-- | Returns the rotation (in radians).
bindControl_get_rotation :: MethodBind
bindControl_get_rotation
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rotation (in radians).
get_rotation :: (Control :< cls, Object :< cls) => cls -> IO Float
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_rotation_degrees #-}

-- | The node's rotation around its pivot, in degrees. See [member rect_pivot_offset] to change the pivot's position.
bindControl_get_rotation_degrees :: MethodBind
bindControl_get_rotation_degrees
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's rotation around its pivot, in degrees. See [member rect_pivot_offset] to change the pivot's position.
get_rotation_degrees ::
                       (Control :< cls, Object :< cls) => cls -> IO Float
get_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_scale #-}

-- | The node's scale, relative to its [member rect_size]. Change this property to scale the node around its [member rect_pivot_offset].
bindControl_get_scale :: MethodBind
bindControl_get_scale
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's scale, relative to its [member rect_size]. Change this property to scale the node around its [member rect_pivot_offset].
get_scale :: (Control :< cls, Object :< cls) => cls -> IO Vector2
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_size #-}

-- | The size of the node's bounding rectangle, in pixels. [Container] nodes update this property automatically.
bindControl_get_size :: MethodBind
bindControl_get_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the node's bounding rectangle, in pixels. [Container] nodes update this property automatically.
get_size :: (Control :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_stretch_ratio #-}

-- | If the node and at least one of its neighbours uses the [constant SIZE_EXPAND] size flag, the parent [Container] will let it take more or less space depending on this property. If this node has a stretch ratio of 2 and its neighbour a ratio of 1, this node will take two thirds of the available space.
bindControl_get_stretch_ratio :: MethodBind
bindControl_get_stretch_ratio
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_stretch_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the node and at least one of its neighbours uses the [constant SIZE_EXPAND] size flag, the parent [Container] will let it take more or less space depending on this property. If this node has a stretch ratio of 2 and its neighbour a ratio of 1, this node will take two thirds of the available space.
get_stretch_ratio ::
                    (Control :< cls, Object :< cls) => cls -> IO Float
get_stretch_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_stretch_ratio (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_stylebox #-}

bindControl_get_stylebox :: MethodBind
bindControl_get_stylebox
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_stylebox ::
               (Control :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO StyleBox
get_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_theme #-}

-- | Changing this property replaces the current [Theme] resource this node and all its [code]Control[/code] children use.
bindControl_get_theme :: MethodBind
bindControl_get_theme
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changing this property replaces the current [Theme] resource this node and all its [code]Control[/code] children use.
get_theme :: (Control :< cls, Object :< cls) => cls -> IO Theme
get_theme cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_theme (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_tooltip #-}

-- | Returns the tooltip, which will appear when the cursor is resting over this control.
bindControl_get_tooltip :: MethodBind
bindControl_get_tooltip
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tooltip, which will appear when the cursor is resting over this control.
get_tooltip ::
              (Control :< cls, Object :< cls) => cls -> Vector2 -> IO GodotString
get_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_tooltip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_v_grow_direction #-}

-- | Controls the direction on the vertical axis in which the control should grow if its vertical minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
bindControl_get_v_grow_direction :: MethodBind
bindControl_get_v_grow_direction
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_v_grow_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the direction on the vertical axis in which the control should grow if its vertical minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
get_v_grow_direction ::
                       (Control :< cls, Object :< cls) => cls -> IO Int
get_v_grow_direction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_v_grow_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_get_v_size_flags #-}

-- | Tells the parent [Container] nodes how they should resize and place the node on the Y axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
bindControl_get_v_size_flags :: MethodBind
bindControl_get_v_size_flags
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "get_v_size_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells the parent [Container] nodes how they should resize and place the node on the Y axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
get_v_size_flags ::
                   (Control :< cls, Object :< cls) => cls -> IO Int
get_v_size_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_get_v_size_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_grab_click_focus #-}

bindControl_grab_click_focus :: MethodBind
bindControl_grab_click_focus
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "grab_click_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

grab_click_focus :: (Control :< cls, Object :< cls) => cls -> IO ()
grab_click_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_grab_click_focus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_grab_focus #-}

-- | Steal the focus from another control and become the focused control (see [member focus_mode]).
bindControl_grab_focus :: MethodBind
bindControl_grab_focus
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "grab_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Steal the focus from another control and become the focused control (see [member focus_mode]).
grab_focus :: (Control :< cls, Object :< cls) => cls -> IO ()
grab_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_grab_focus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_color #-}

bindControl_has_color :: MethodBind
bindControl_has_color
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_color ::
            (Control :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> IO Bool
has_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_color_override #-}

bindControl_has_color_override :: MethodBind
bindControl_has_color_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_color_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_color_override ::
                     (Control :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_color_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_color_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_constant #-}

bindControl_has_constant :: MethodBind
bindControl_has_constant
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_constant ::
               (Control :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Bool
has_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_constant (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_constant_override #-}

bindControl_has_constant_override :: MethodBind
bindControl_has_constant_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_constant_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_constant_override ::
                        (Control :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_constant_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_constant_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_focus #-}

-- | Returns [code]true[/code] if this is the current focused control. See [member focus_mode].
bindControl_has_focus :: MethodBind
bindControl_has_focus
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this is the current focused control. See [member focus_mode].
has_focus :: (Control :< cls, Object :< cls) => cls -> IO Bool
has_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_focus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_font #-}

bindControl_has_font :: MethodBind
bindControl_has_font
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_font ::
           (Control :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Bool
has_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_font (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_font_override #-}

bindControl_has_font_override :: MethodBind
bindControl_has_font_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_font_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_font_override ::
                    (Control :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_font_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_font_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_icon #-}

bindControl_has_icon :: MethodBind
bindControl_has_icon
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_icon ::
           (Control :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Bool
has_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_icon (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_icon_override #-}

bindControl_has_icon_override :: MethodBind
bindControl_has_icon_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_icon_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_icon_override ::
                    (Control :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_icon_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_icon_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_point #-}

bindControl_has_point :: MethodBind
bindControl_has_point
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_point ::
            (Control :< cls, Object :< cls) => cls -> Vector2 -> IO Bool
has_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_shader_override #-}

bindControl_has_shader_override :: MethodBind
bindControl_has_shader_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_shader_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_shader_override ::
                      (Control :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_shader_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_shader_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_stylebox #-}

bindControl_has_stylebox :: MethodBind
bindControl_has_stylebox
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_stylebox ::
               (Control :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Bool
has_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_has_stylebox_override #-}

bindControl_has_stylebox_override :: MethodBind
bindControl_has_stylebox_override
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "has_stylebox_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_stylebox_override ::
                        (Control :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_stylebox_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_has_stylebox_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_is_clipping_contents #-}

-- | Enables whether rendering of children should be clipped to this control's rectangle. If [code]true[/code], parts of a child which would be visibly outside of this control's rectangle will not be rendered.
bindControl_is_clipping_contents :: MethodBind
bindControl_is_clipping_contents
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "is_clipping_contents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables whether rendering of children should be clipped to this control's rectangle. If [code]true[/code], parts of a child which would be visibly outside of this control's rectangle will not be rendered.
is_clipping_contents ::
                       (Control :< cls, Object :< cls) => cls -> IO Bool
is_clipping_contents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_is_clipping_contents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_minimum_size_changed #-}

bindControl_minimum_size_changed :: MethodBind
bindControl_minimum_size_changed
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "minimum_size_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

minimum_size_changed ::
                       (Control :< cls, Object :< cls) => cls -> IO ()
minimum_size_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_minimum_size_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_release_focus #-}

-- | Give up the focus. No other control will be able to receive keyboard input.
bindControl_release_focus :: MethodBind
bindControl_release_focus
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "release_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Give up the focus. No other control will be able to receive keyboard input.
release_focus :: (Control :< cls, Object :< cls) => cls -> IO ()
release_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_release_focus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_anchor #-}

bindControl_set_anchor :: MethodBind
bindControl_set_anchor
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_anchor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_anchor ::
             (Control :< cls, Object :< cls) =>
             cls -> Int -> Float -> Bool -> Bool -> IO ()
set_anchor cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_anchor (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_anchor_and_margin #-}

bindControl_set_anchor_and_margin :: MethodBind
bindControl_set_anchor_and_margin
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_anchor_and_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_anchor_and_margin ::
                        (Control :< cls, Object :< cls) =>
                        cls -> Int -> Float -> Float -> Bool -> IO ()
set_anchor_and_margin cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_anchor_and_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_anchors_and_margins_preset #-}

bindControl_set_anchors_and_margins_preset :: MethodBind
bindControl_set_anchors_and_margins_preset
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_anchors_and_margins_preset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_anchors_and_margins_preset ::
                                 (Control :< cls, Object :< cls) =>
                                 cls -> Int -> Int -> Int -> IO ()
set_anchors_and_margins_preset cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_anchors_and_margins_preset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_anchors_preset #-}

bindControl_set_anchors_preset :: MethodBind
bindControl_set_anchors_preset
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_anchors_preset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_anchors_preset ::
                     (Control :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_anchors_preset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_anchors_preset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_begin #-}

-- | Sets [member margin_left] and [member margin_top] at the same time.
bindControl_set_begin :: MethodBind
bindControl_set_begin
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets [member margin_left] and [member margin_top] at the same time.
set_begin ::
            (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_begin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_clip_contents #-}

-- | Enables whether rendering of children should be clipped to this control's rectangle. If [code]true[/code], parts of a child which would be visibly outside of this control's rectangle will not be rendered.
bindControl_set_clip_contents :: MethodBind
bindControl_set_clip_contents
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_clip_contents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables whether rendering of children should be clipped to this control's rectangle. If [code]true[/code], parts of a child which would be visibly outside of this control's rectangle will not be rendered.
set_clip_contents ::
                    (Control :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_contents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_clip_contents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_custom_minimum_size #-}

-- | The minimum size of the node's bounding rectangle. If you set it to a value greater than (0, 0), the node's bounding rectangle will always have at least this size, even if its content is smaller. If it's set to (0, 0), the node sizes automatically to fit its content, be it a texture or child nodes.
bindControl_set_custom_minimum_size :: MethodBind
bindControl_set_custom_minimum_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_custom_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum size of the node's bounding rectangle. If you set it to a value greater than (0, 0), the node's bounding rectangle will always have at least this size, even if its content is smaller. If it's set to (0, 0), the node sizes automatically to fit its content, be it a texture or child nodes.
set_custom_minimum_size ::
                          (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_custom_minimum_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_custom_minimum_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_default_cursor_shape #-}

-- | The default cursor shape for this control. Useful for Godot plugins and applications or games that use the system's mouse cursors.
--   			[b]Note:[/b] On Linux, shapes may vary depending on the cursor theme of the system.
bindControl_set_default_cursor_shape :: MethodBind
bindControl_set_default_cursor_shape
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_default_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default cursor shape for this control. Useful for Godot plugins and applications or games that use the system's mouse cursors.
--   			[b]Note:[/b] On Linux, shapes may vary depending on the cursor theme of the system.
set_default_cursor_shape ::
                           (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_default_cursor_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_default_cursor_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_drag_forwarding #-}

-- | Forwards the handling of this control's drag and drop to [code]target[/code] control.
--   				Forwarding can be implemented in the target control similar to the methods [method get_drag_data], [method can_drop_data], and [method drop_data] but with two differences:
--   				1. The function name must be suffixed with [b]_fw[/b]
--   				2. The function must take an extra argument that is the control doing the forwarding
--   				[codeblock]
--   				# ThisControl.gd
--   				extends Control
--   				func _ready():
--   				    set_drag_forwarding(target_control)
--   
--   				# TargetControl.gd
--   				extends Control
--   				func can_drop_data_fw(position, data, from_control):
--   				    return true
--   
--   				func drop_data_fw(position, data, from_control):
--   				    my_handle_data(data)
--   
--   				func get_drag_data_fw(position, from_control):
--   				    set_drag_preview(my_preview)
--   				    return my_data()
--   				[/codeblock]
bindControl_set_drag_forwarding :: MethodBind
bindControl_set_drag_forwarding
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_drag_forwarding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forwards the handling of this control's drag and drop to [code]target[/code] control.
--   				Forwarding can be implemented in the target control similar to the methods [method get_drag_data], [method can_drop_data], and [method drop_data] but with two differences:
--   				1. The function name must be suffixed with [b]_fw[/b]
--   				2. The function must take an extra argument that is the control doing the forwarding
--   				[codeblock]
--   				# ThisControl.gd
--   				extends Control
--   				func _ready():
--   				    set_drag_forwarding(target_control)
--   
--   				# TargetControl.gd
--   				extends Control
--   				func can_drop_data_fw(position, data, from_control):
--   				    return true
--   
--   				func drop_data_fw(position, data, from_control):
--   				    my_handle_data(data)
--   
--   				func get_drag_data_fw(position, from_control):
--   				    set_drag_preview(my_preview)
--   				    return my_data()
--   				[/codeblock]
set_drag_forwarding ::
                      (Control :< cls, Object :< cls) => cls -> Control -> IO ()
set_drag_forwarding cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_drag_forwarding (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_drag_preview #-}

-- | Shows the given control at the mouse pointer. A good time to call this method is in [method get_drag_data].
bindControl_set_drag_preview :: MethodBind
bindControl_set_drag_preview
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_drag_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the given control at the mouse pointer. A good time to call this method is in [method get_drag_data].
set_drag_preview ::
                   (Control :< cls, Object :< cls) => cls -> Control -> IO ()
set_drag_preview cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_drag_preview (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_end #-}

-- | Sets [member margin_right] and [member margin_bottom] at the same time.
bindControl_set_end :: MethodBind
bindControl_set_end
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets [member margin_right] and [member margin_bottom] at the same time.
set_end ::
          (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_end (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_focus_mode #-}

-- | The focus access mode for the control (None, Click or All). Only one Control can be focused at the same time, and it will receive keyboard signals.
bindControl_set_focus_mode :: MethodBind
bindControl_set_focus_mode
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_focus_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The focus access mode for the control (None, Click or All). Only one Control can be focused at the same time, and it will receive keyboard signals.
set_focus_mode ::
                 (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_focus_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_focus_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_focus_neighbour #-}

-- | Tells Godot which node it should give keyboard focus to if the user presses the down arrow on the keyboard or down on a gamepad by default. You can change the key by editing the [code]ui_down[/code] input action. The node must be a [code]Control[/code]. If this property is not set, Godot will give focus to the closest [code]Control[/code] to the bottom of this one.
bindControl_set_focus_neighbour :: MethodBind
bindControl_set_focus_neighbour
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_focus_neighbour" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells Godot which node it should give keyboard focus to if the user presses the down arrow on the keyboard or down on a gamepad by default. You can change the key by editing the [code]ui_down[/code] input action. The node must be a [code]Control[/code]. If this property is not set, Godot will give focus to the closest [code]Control[/code] to the bottom of this one.
set_focus_neighbour ::
                      (Control :< cls, Object :< cls) => cls -> Int -> NodePath -> IO ()
set_focus_neighbour cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_focus_neighbour (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_focus_next #-}

-- | Tells Godot which node it should give keyboard focus to if the user presses Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_next[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
bindControl_set_focus_next :: MethodBind
bindControl_set_focus_next
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_focus_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells Godot which node it should give keyboard focus to if the user presses Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_next[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
set_focus_next ::
                 (Control :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_focus_next cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_focus_next (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_focus_previous #-}

-- | Tells Godot which node it should give keyboard focus to if the user presses Shift+Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_prev[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
bindControl_set_focus_previous :: MethodBind
bindControl_set_focus_previous
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_focus_previous" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells Godot which node it should give keyboard focus to if the user presses Shift+Tab on a keyboard by default. You can change the key by editing the [code]ui_focus_prev[/code] input action.
--   			If this property is not set, Godot will select a "best guess" based on surrounding nodes in the scene tree.
set_focus_previous ::
                     (Control :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_focus_previous cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_focus_previous (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_global_position #-}

-- | The node's global position, relative to the world (usually to the top-left corner of the window).
bindControl_set_global_position :: MethodBind
bindControl_set_global_position
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's global position, relative to the world (usually to the top-left corner of the window).
set_global_position ::
                      (Control :< cls, Object :< cls) => cls -> Vector2 -> Bool -> IO ()
set_global_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_global_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_h_grow_direction #-}

-- | Controls the direction on the horizontal axis in which the control should grow if its horizontal minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
bindControl_set_h_grow_direction :: MethodBind
bindControl_set_h_grow_direction
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_h_grow_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the direction on the horizontal axis in which the control should grow if its horizontal minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
set_h_grow_direction ::
                       (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_h_grow_direction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_h_grow_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_h_size_flags #-}

-- | Tells the parent [Container] nodes how they should resize and place the node on the X axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
bindControl_set_h_size_flags :: MethodBind
bindControl_set_h_size_flags
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_h_size_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells the parent [Container] nodes how they should resize and place the node on the X axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
set_h_size_flags ::
                   (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_h_size_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_h_size_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_margin #-}

-- | Distance between the node's bottom edge and its parent control, based on [member anchor_bottom].
--   			Margins are often controlled by one or multiple parent [Container] nodes, so you should not modify them manually if your node is a direct child of a [Container]. Margins update automatically when you move or resize the node.
bindControl_set_margin :: MethodBind
bindControl_set_margin
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance between the node's bottom edge and its parent control, based on [member anchor_bottom].
--   			Margins are often controlled by one or multiple parent [Container] nodes, so you should not modify them manually if your node is a direct child of a [Container]. Margins update automatically when you move or resize the node.
set_margin ::
             (Control :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_margins_preset #-}

bindControl_set_margins_preset :: MethodBind
bindControl_set_margins_preset
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_margins_preset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_margins_preset ::
                     (Control :< cls, Object :< cls) =>
                     cls -> Int -> Int -> Int -> IO ()
set_margins_preset cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_margins_preset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_mouse_filter #-}

-- | Controls whether the control will be able to receive mouse button input events through [method _gui_input] and how these events should be handled. Also controls whether the control can receive the [signal mouse_entered], and [signal mouse_exited] signals. See the constants to learn what each does.
bindControl_set_mouse_filter :: MethodBind
bindControl_set_mouse_filter
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_mouse_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls whether the control will be able to receive mouse button input events through [method _gui_input] and how these events should be handled. Also controls whether the control can receive the [signal mouse_entered], and [signal mouse_exited] signals. See the constants to learn what each does.
set_mouse_filter ::
                   (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_mouse_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_mouse_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_pivot_offset #-}

-- | By default, the node's pivot is its top-left corner. When you change its [member rect_scale], it will scale around this pivot. Set this property to [member rect_size] / 2 to center the pivot in the node's rectangle.
bindControl_set_pivot_offset :: MethodBind
bindControl_set_pivot_offset
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_pivot_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | By default, the node's pivot is its top-left corner. When you change its [member rect_scale], it will scale around this pivot. Set this property to [member rect_size] / 2 to center the pivot in the node's rectangle.
set_pivot_offset ::
                   (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_pivot_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_pivot_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_position #-}

-- | The node's position, relative to its parent. It corresponds to the rectangle's top-left corner. The property is not affected by [member rect_pivot_offset].
bindControl_set_position :: MethodBind
bindControl_set_position
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's position, relative to its parent. It corresponds to the rectangle's top-left corner. The property is not affected by [member rect_pivot_offset].
set_position ::
               (Control :< cls, Object :< cls) => cls -> Vector2 -> Bool -> IO ()
set_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_rotation #-}

-- | Sets the rotation (in radians).
bindControl_set_rotation :: MethodBind
bindControl_set_rotation
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the rotation (in radians).
set_rotation ::
               (Control :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_rotation_degrees #-}

-- | The node's rotation around its pivot, in degrees. See [member rect_pivot_offset] to change the pivot's position.
bindControl_set_rotation_degrees :: MethodBind
bindControl_set_rotation_degrees
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's rotation around its pivot, in degrees. See [member rect_pivot_offset] to change the pivot's position.
set_rotation_degrees ::
                       (Control :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_scale #-}

-- | The node's scale, relative to its [member rect_size]. Change this property to scale the node around its [member rect_pivot_offset].
bindControl_set_scale :: MethodBind
bindControl_set_scale
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's scale, relative to its [member rect_size]. Change this property to scale the node around its [member rect_pivot_offset].
set_scale ::
            (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_size #-}

-- | The size of the node's bounding rectangle, in pixels. [Container] nodes update this property automatically.
bindControl_set_size :: MethodBind
bindControl_set_size
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the node's bounding rectangle, in pixels. [Container] nodes update this property automatically.
set_size ::
           (Control :< cls, Object :< cls) => cls -> Vector2 -> Bool -> IO ()
set_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_stretch_ratio #-}

-- | If the node and at least one of its neighbours uses the [constant SIZE_EXPAND] size flag, the parent [Container] will let it take more or less space depending on this property. If this node has a stretch ratio of 2 and its neighbour a ratio of 1, this node will take two thirds of the available space.
bindControl_set_stretch_ratio :: MethodBind
bindControl_set_stretch_ratio
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_stretch_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the node and at least one of its neighbours uses the [constant SIZE_EXPAND] size flag, the parent [Container] will let it take more or less space depending on this property. If this node has a stretch ratio of 2 and its neighbour a ratio of 1, this node will take two thirds of the available space.
set_stretch_ratio ::
                    (Control :< cls, Object :< cls) => cls -> Float -> IO ()
set_stretch_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_stretch_ratio (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_theme #-}

-- | Changing this property replaces the current [Theme] resource this node and all its [code]Control[/code] children use.
bindControl_set_theme :: MethodBind
bindControl_set_theme
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changing this property replaces the current [Theme] resource this node and all its [code]Control[/code] children use.
set_theme ::
            (Control :< cls, Object :< cls) => cls -> Theme -> IO ()
set_theme cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_theme (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_tooltip #-}

-- | Changes the tooltip text. The tooltip appears when the user's mouse cursor stays idle over this control for a few moments, provided that the [member mouse_filter] property is not [constant MOUSE_FILTER_IGNORE].
bindControl_set_tooltip :: MethodBind
bindControl_set_tooltip
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the tooltip text. The tooltip appears when the user's mouse cursor stays idle over this control for a few moments, provided that the [member mouse_filter] property is not [constant MOUSE_FILTER_IGNORE].
set_tooltip ::
              (Control :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_tooltip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_v_grow_direction #-}

-- | Controls the direction on the vertical axis in which the control should grow if its vertical minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
bindControl_set_v_grow_direction :: MethodBind
bindControl_set_v_grow_direction
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_v_grow_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the direction on the vertical axis in which the control should grow if its vertical minimum size is changed to be greater than its current size, as the control always has to be at least the minimum size.
set_v_grow_direction ::
                       (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_v_grow_direction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_v_grow_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_set_v_size_flags #-}

-- | Tells the parent [Container] nodes how they should resize and place the node on the Y axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
bindControl_set_v_size_flags :: MethodBind
bindControl_set_v_size_flags
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "set_v_size_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells the parent [Container] nodes how they should resize and place the node on the Y axis. Use one of the [code]SIZE_*[/code] constants to change the flags. See the constants to learn what each does.
set_v_size_flags ::
                   (Control :< cls, Object :< cls) => cls -> Int -> IO ()
set_v_size_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_set_v_size_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_show_modal #-}

-- | Displays a control as modal. Control must be a subwindow. Modal controls capture the input signals until closed or the area outside them is accessed. When a modal control loses focus, or the ESC key is pressed, they automatically hide. Modal controls are used extensively for popup dialogs and menus.
bindControl_show_modal :: MethodBind
bindControl_show_modal
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "show_modal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Displays a control as modal. Control must be a subwindow. Modal controls capture the input signals until closed or the area outside them is accessed. When a modal control loses focus, or the ESC key is pressed, they automatically hide. Modal controls are used extensively for popup dialogs and menus.
show_modal ::
             (Control :< cls, Object :< cls) => cls -> Bool -> IO ()
show_modal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_show_modal (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindControl_warp_mouse #-}

bindControl_warp_mouse :: MethodBind
bindControl_warp_mouse
  = unsafePerformIO $
      withCString "Control" $
        \ clsNamePtr ->
          withCString "warp_mouse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

warp_mouse ::
             (Control :< cls, Object :< cls) => cls -> Vector2 -> IO ()
warp_mouse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindControl_warp_mouse (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)