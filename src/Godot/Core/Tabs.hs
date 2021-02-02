{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Tabs
       (Godot.Core.Tabs._ALIGN_RIGHT,
        Godot.Core.Tabs._CLOSE_BUTTON_SHOW_ACTIVE_ONLY,
        Godot.Core.Tabs._ALIGN_MAX, Godot.Core.Tabs._CLOSE_BUTTON_MAX,
        Godot.Core.Tabs._CLOSE_BUTTON_SHOW_ALWAYS,
        Godot.Core.Tabs._CLOSE_BUTTON_SHOW_NEVER,
        Godot.Core.Tabs._ALIGN_LEFT, Godot.Core.Tabs._ALIGN_CENTER,
        Godot.Core.Tabs.sig_reposition_active_tab_request,
        Godot.Core.Tabs.sig_right_button_pressed,
        Godot.Core.Tabs.sig_tab_changed, Godot.Core.Tabs.sig_tab_clicked,
        Godot.Core.Tabs.sig_tab_close, Godot.Core.Tabs.sig_tab_hover,
        Godot.Core.Tabs._gui_input, Godot.Core.Tabs._on_mouse_exited,
        Godot.Core.Tabs._update_hover, Godot.Core.Tabs.add_tab,
        Godot.Core.Tabs.ensure_tab_visible,
        Godot.Core.Tabs.get_current_tab,
        Godot.Core.Tabs.get_drag_to_rearrange_enabled,
        Godot.Core.Tabs.get_offset_buttons_visible,
        Godot.Core.Tabs.get_scrolling_enabled,
        Godot.Core.Tabs.get_select_with_rmb, Godot.Core.Tabs.get_tab_align,
        Godot.Core.Tabs.get_tab_close_display_policy,
        Godot.Core.Tabs.get_tab_count, Godot.Core.Tabs.get_tab_disabled,
        Godot.Core.Tabs.get_tab_icon, Godot.Core.Tabs.get_tab_offset,
        Godot.Core.Tabs.get_tab_rect, Godot.Core.Tabs.get_tab_title,
        Godot.Core.Tabs.get_tabs_rearrange_group, Godot.Core.Tabs.move_tab,
        Godot.Core.Tabs.remove_tab, Godot.Core.Tabs.set_current_tab,
        Godot.Core.Tabs.set_drag_to_rearrange_enabled,
        Godot.Core.Tabs.set_scrolling_enabled,
        Godot.Core.Tabs.set_select_with_rmb, Godot.Core.Tabs.set_tab_align,
        Godot.Core.Tabs.set_tab_close_display_policy,
        Godot.Core.Tabs.set_tab_disabled, Godot.Core.Tabs.set_tab_icon,
        Godot.Core.Tabs.set_tab_title,
        Godot.Core.Tabs.set_tabs_rearrange_group)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_CLOSE_BUTTON_SHOW_ACTIVE_ONLY :: Int
_CLOSE_BUTTON_SHOW_ACTIVE_ONLY = 1

_ALIGN_MAX :: Int
_ALIGN_MAX = 3

_CLOSE_BUTTON_MAX :: Int
_CLOSE_BUTTON_MAX = 3

_CLOSE_BUTTON_SHOW_ALWAYS :: Int
_CLOSE_BUTTON_SHOW_ALWAYS = 2

_CLOSE_BUTTON_SHOW_NEVER :: Int
_CLOSE_BUTTON_SHOW_NEVER = 0

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

sig_reposition_active_tab_request ::
                                  Godot.Internal.Dispatch.Signal Tabs
sig_reposition_active_tab_request
  = Godot.Internal.Dispatch.Signal "reposition_active_tab_request"

sig_right_button_pressed :: Godot.Internal.Dispatch.Signal Tabs
sig_right_button_pressed
  = Godot.Internal.Dispatch.Signal "right_button_pressed"

sig_tab_changed :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_changed = Godot.Internal.Dispatch.Signal "tab_changed"

sig_tab_clicked :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_clicked = Godot.Internal.Dispatch.Signal "tab_clicked"

sig_tab_close :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_close = Godot.Internal.Dispatch.Signal "tab_close"

sig_tab_hover :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_hover = Godot.Internal.Dispatch.Signal "tab_hover"

{-# NOINLINE bindTabs__gui_input #-}

bindTabs__gui_input :: MethodBind
bindTabs__gui_input
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (Tabs :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs__gui_input (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs__on_mouse_exited #-}

bindTabs__on_mouse_exited :: MethodBind
bindTabs__on_mouse_exited
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "_on_mouse_exited" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_on_mouse_exited :: (Tabs :< cls, Object :< cls) => cls -> IO ()
_on_mouse_exited cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs__on_mouse_exited (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs__update_hover #-}

bindTabs__update_hover :: MethodBind
bindTabs__update_hover
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "_update_hover" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_hover :: (Tabs :< cls, Object :< cls) => cls -> IO ()
_update_hover cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs__update_hover (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_add_tab #-}

-- | Adds a new tab.
bindTabs_add_tab :: MethodBind
bindTabs_add_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "add_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new tab.
add_tab ::
          (Tabs :< cls, Object :< cls) =>
          cls -> GodotString -> Texture -> IO ()
add_tab cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_add_tab (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_ensure_tab_visible #-}

-- | Moves the Scroll view to make the tab visible.
bindTabs_ensure_tab_visible :: MethodBind
bindTabs_ensure_tab_visible
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "ensure_tab_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the Scroll view to make the tab visible.
ensure_tab_visible ::
                     (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
ensure_tab_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_ensure_tab_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_current_tab #-}

-- | Select tab at index [code]tab_idx[/code].
bindTabs_get_current_tab :: MethodBind
bindTabs_get_current_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select tab at index [code]tab_idx[/code].
get_current_tab :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_current_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_current_tab (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_drag_to_rearrange_enabled #-}

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
bindTabs_get_drag_to_rearrange_enabled :: MethodBind
bindTabs_get_drag_to_rearrange_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_drag_to_rearrange_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
get_drag_to_rearrange_enabled ::
                                (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_drag_to_rearrange_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_drag_to_rearrange_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_offset_buttons_visible #-}

bindTabs_get_offset_buttons_visible :: MethodBind
bindTabs_get_offset_buttons_visible
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_offset_buttons_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_offset_buttons_visible ::
                             (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_offset_buttons_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_offset_buttons_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_scrolling_enabled #-}

bindTabs_get_scrolling_enabled :: MethodBind
bindTabs_get_scrolling_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_scrolling_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_scrolling_enabled ::
                        (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_scrolling_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_scrolling_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_select_with_rmb #-}

-- | Returns [code]true[/code] if select with right mouse button is enabled.
bindTabs_get_select_with_rmb :: MethodBind
bindTabs_get_select_with_rmb
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_select_with_rmb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if select with right mouse button is enabled.
get_select_with_rmb ::
                      (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_select_with_rmb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_select_with_rmb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_align #-}

-- | The alignment of all tabs. See enum [code]TabAlign[/code] constants for details.
bindTabs_get_tab_align :: MethodBind
bindTabs_get_tab_align
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of all tabs. See enum [code]TabAlign[/code] constants for details.
get_tab_align :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_close_display_policy #-}

bindTabs_get_tab_close_display_policy :: MethodBind
bindTabs_get_tab_close_display_policy
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_close_display_policy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tab_close_display_policy ::
                               (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_close_display_policy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_close_display_policy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_count #-}

-- | Returns the number of tabs.
bindTabs_get_tab_count :: MethodBind
bindTabs_get_tab_count
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of tabs.
get_tab_count :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_disabled #-}

-- | Returns [code]true[/code] if the tab at index [code]tab_idx[/code] is disabled.
bindTabs_get_tab_disabled :: MethodBind
bindTabs_get_tab_disabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the tab at index [code]tab_idx[/code] is disabled.
get_tab_disabled ::
                   (Tabs :< cls, Object :< cls) => cls -> Int -> IO Bool
get_tab_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_icon #-}

-- | Returns the [Texture] for the tab at index [code]tab_idx[/code] or null if the tab has no [Texture].
bindTabs_get_tab_icon :: MethodBind
bindTabs_get_tab_icon
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Texture] for the tab at index [code]tab_idx[/code] or null if the tab has no [Texture].
get_tab_icon ::
               (Tabs :< cls, Object :< cls) => cls -> Int -> IO Texture
get_tab_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_offset #-}

bindTabs_get_tab_offset :: MethodBind
bindTabs_get_tab_offset
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tab_offset :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_rect #-}

-- | Returns tab [Rect2] with local position and size.
bindTabs_get_tab_rect :: MethodBind
bindTabs_get_tab_rect
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns tab [Rect2] with local position and size.
get_tab_rect ::
               (Tabs :< cls, Object :< cls) => cls -> Int -> IO Rect2
get_tab_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_rect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tab_title #-}

-- | Returns the title of the tab at index [code]tab_idx[/code]. Tab titles default to the name of the indexed child node, but this can be overridden with [method set_tab_title].
bindTabs_get_tab_title :: MethodBind
bindTabs_get_tab_title
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the title of the tab at index [code]tab_idx[/code]. Tab titles default to the name of the indexed child node, but this can be overridden with [method set_tab_title].
get_tab_title ::
                (Tabs :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_tab_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_get_tabs_rearrange_group #-}

-- | Returns the [code]Tabs[/code] rearrange group id.
bindTabs_get_tabs_rearrange_group :: MethodBind
bindTabs_get_tabs_rearrange_group
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tabs_rearrange_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [code]Tabs[/code] rearrange group id.
get_tabs_rearrange_group ::
                           (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tabs_rearrange_group cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tabs_rearrange_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_move_tab #-}

-- | Rearrange tab.
bindTabs_move_tab :: MethodBind
bindTabs_move_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "move_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rearrange tab.
move_tab ::
           (Tabs :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
move_tab cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_move_tab (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_remove_tab #-}

-- | Removes tab at index [code]tab_idx[/code]
bindTabs_remove_tab :: MethodBind
bindTabs_remove_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "remove_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes tab at index [code]tab_idx[/code]
remove_tab :: (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
remove_tab cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_remove_tab (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_current_tab #-}

-- | Select tab at index [code]tab_idx[/code].
bindTabs_set_current_tab :: MethodBind
bindTabs_set_current_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select tab at index [code]tab_idx[/code].
set_current_tab ::
                  (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_current_tab cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_current_tab (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_drag_to_rearrange_enabled #-}

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
bindTabs_set_drag_to_rearrange_enabled :: MethodBind
bindTabs_set_drag_to_rearrange_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_drag_to_rearrange_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
set_drag_to_rearrange_enabled ::
                                (Tabs :< cls, Object :< cls) => cls -> Bool -> IO ()
set_drag_to_rearrange_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_drag_to_rearrange_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_scrolling_enabled #-}

bindTabs_set_scrolling_enabled :: MethodBind
bindTabs_set_scrolling_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_scrolling_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_scrolling_enabled ::
                        (Tabs :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scrolling_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_scrolling_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_select_with_rmb #-}

-- | If [code]true[/code], enables selecting a tab with right mouse button.
bindTabs_set_select_with_rmb :: MethodBind
bindTabs_set_select_with_rmb
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_select_with_rmb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables selecting a tab with right mouse button.
set_select_with_rmb ::
                      (Tabs :< cls, Object :< cls) => cls -> Bool -> IO ()
set_select_with_rmb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_select_with_rmb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_tab_align #-}

-- | The alignment of all tabs. See enum [code]TabAlign[/code] constants for details.
bindTabs_set_tab_align :: MethodBind
bindTabs_set_tab_align
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of all tabs. See enum [code]TabAlign[/code] constants for details.
set_tab_align ::
                (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_tab_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_tab_close_display_policy #-}

bindTabs_set_tab_close_display_policy :: MethodBind
bindTabs_set_tab_close_display_policy
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_close_display_policy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_tab_close_display_policy ::
                               (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_tab_close_display_policy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_close_display_policy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_tab_disabled #-}

-- | If [code]disabled[/code] is [code]false[/code], hides the tab at index [code]tab_idx[/code]. Note that its title text will remain, unless also removed with [method set_tab_title].
bindTabs_set_tab_disabled :: MethodBind
bindTabs_set_tab_disabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]disabled[/code] is [code]false[/code], hides the tab at index [code]tab_idx[/code]. Note that its title text will remain, unless also removed with [method set_tab_title].
set_tab_disabled ::
                   (Tabs :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_tab_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_tab_icon #-}

-- | Sets an icon for the tab at index [code]tab_idx[/code].
bindTabs_set_tab_icon :: MethodBind
bindTabs_set_tab_icon
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an icon for the tab at index [code]tab_idx[/code].
set_tab_icon ::
               (Tabs :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_tab_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_tab_title #-}

-- | Sets a title for the tab at index [code]tab_idx[/code].
bindTabs_set_tab_title :: MethodBind
bindTabs_set_tab_title
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a title for the tab at index [code]tab_idx[/code].
set_tab_title ::
                (Tabs :< cls, Object :< cls) => cls -> Int -> GodotString -> IO ()
set_tab_title cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabs_set_tabs_rearrange_group #-}

-- | Defines rearrange group id, choose for each [code]Tabs[/code] the same value to enable tab drag between [code]Tabs[/code]. Enable drag with [code]set_drag_to_rearrange_enabled(true)[/code].
bindTabs_set_tabs_rearrange_group :: MethodBind
bindTabs_set_tabs_rearrange_group
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tabs_rearrange_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines rearrange group id, choose for each [code]Tabs[/code] the same value to enable tab drag between [code]Tabs[/code]. Enable drag with [code]set_drag_to_rearrange_enabled(true)[/code].
set_tabs_rearrange_group ::
                           (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_tabs_rearrange_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tabs_rearrange_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)