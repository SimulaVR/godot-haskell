{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TabContainer
       (Godot.Core.TabContainer._ALIGN_RIGHT,
        Godot.Core.TabContainer._ALIGN_LEFT,
        Godot.Core.TabContainer._ALIGN_CENTER,
        Godot.Core.TabContainer.sig_pre_popup_pressed,
        Godot.Core.TabContainer.sig_tab_selected,
        Godot.Core.TabContainer.sig_tab_changed,
        Godot.Core.TabContainer._gui_input,
        Godot.Core.TabContainer.get_tab_count,
        Godot.Core.TabContainer.set_current_tab,
        Godot.Core.TabContainer.get_current_tab,
        Godot.Core.TabContainer.get_previous_tab,
        Godot.Core.TabContainer.get_current_tab_control,
        Godot.Core.TabContainer.get_tab_control,
        Godot.Core.TabContainer.set_tab_align,
        Godot.Core.TabContainer.get_tab_align,
        Godot.Core.TabContainer.set_tabs_visible,
        Godot.Core.TabContainer.are_tabs_visible,
        Godot.Core.TabContainer.set_tab_title,
        Godot.Core.TabContainer.get_tab_title,
        Godot.Core.TabContainer.set_tab_icon,
        Godot.Core.TabContainer.get_tab_icon,
        Godot.Core.TabContainer.set_tab_disabled,
        Godot.Core.TabContainer.get_tab_disabled,
        Godot.Core.TabContainer.set_popup,
        Godot.Core.TabContainer.get_popup,
        Godot.Core.TabContainer.set_drag_to_rearrange_enabled,
        Godot.Core.TabContainer.get_drag_to_rearrange_enabled,
        Godot.Core.TabContainer.set_tabs_rearrange_group,
        Godot.Core.TabContainer.get_tabs_rearrange_group,
        Godot.Core.TabContainer._child_renamed_callback,
        Godot.Core.TabContainer._on_theme_changed,
        Godot.Core.TabContainer._update_current_tab)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

-- | Emitted when the [code]TabContainer[/code]'s [Popup] button is clicked. See [method set_popup] for details.
sig_pre_popup_pressed ::
                      Godot.Internal.Dispatch.Signal TabContainer
sig_pre_popup_pressed
  = Godot.Internal.Dispatch.Signal "pre_popup_pressed"

-- | Emitted when a tab is selected, even if it is the current tab.
sig_tab_selected :: Godot.Internal.Dispatch.Signal TabContainer
sig_tab_selected = Godot.Internal.Dispatch.Signal "tab_selected"

-- | Emitted when switching to another tab.
sig_tab_changed :: Godot.Internal.Dispatch.Signal TabContainer
sig_tab_changed = Godot.Internal.Dispatch.Signal "tab_changed"

{-# NOINLINE bindTabContainer__gui_input #-}

bindTabContainer__gui_input :: MethodBind
bindTabContainer__gui_input
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (TabContainer :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tab_count #-}

-- | Returns the number of tabs.
bindTabContainer_get_tab_count :: MethodBind
bindTabContainer_get_tab_count
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tab_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of tabs.
get_tab_count ::
                (TabContainer :< cls, Object :< cls) => cls -> IO Int
get_tab_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tab_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_current_tab #-}

-- | The current tab index. When set, this index's [Control] node's [code]visible[/code] property is set to [code]true[/code] and all others are set to [code]false[/code].
bindTabContainer_set_current_tab :: MethodBind
bindTabContainer_set_current_tab
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current tab index. When set, this index's [Control] node's [code]visible[/code] property is set to [code]true[/code] and all others are set to [code]false[/code].
set_current_tab ::
                  (TabContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_current_tab cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_current_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_current_tab #-}

-- | The current tab index. When set, this index's [Control] node's [code]visible[/code] property is set to [code]true[/code] and all others are set to [code]false[/code].
bindTabContainer_get_current_tab :: MethodBind
bindTabContainer_get_current_tab
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current tab index. When set, this index's [Control] node's [code]visible[/code] property is set to [code]true[/code] and all others are set to [code]false[/code].
get_current_tab ::
                  (TabContainer :< cls, Object :< cls) => cls -> IO Int
get_current_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_current_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_previous_tab #-}

-- | Returns the previously active tab index.
bindTabContainer_get_previous_tab :: MethodBind
bindTabContainer_get_previous_tab
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_previous_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the previously active tab index.
get_previous_tab ::
                   (TabContainer :< cls, Object :< cls) => cls -> IO Int
get_previous_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_previous_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_current_tab_control #-}

-- | Returns the child [Control] node located at the active tab index.
bindTabContainer_get_current_tab_control :: MethodBind
bindTabContainer_get_current_tab_control
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_current_tab_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the child [Control] node located at the active tab index.
get_current_tab_control ::
                          (TabContainer :< cls, Object :< cls) => cls -> IO Control
get_current_tab_control cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_current_tab_control
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tab_control #-}

-- | Returns the currently visible tab's [Control] node.
bindTabContainer_get_tab_control :: MethodBind
bindTabContainer_get_tab_control
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tab_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently visible tab's [Control] node.
get_tab_control ::
                  (TabContainer :< cls, Object :< cls) => cls -> Int -> IO Control
get_tab_control cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tab_control
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_tab_align #-}

-- | The alignment of all tabs in the tab container. See the [code]ALIGN_*[/code] constants for details.
bindTabContainer_set_tab_align :: MethodBind
bindTabContainer_set_tab_align
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_tab_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of all tabs in the tab container. See the [code]ALIGN_*[/code] constants for details.
set_tab_align ::
                (TabContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_tab_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_tab_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tab_align #-}

-- | The alignment of all tabs in the tab container. See the [code]ALIGN_*[/code] constants for details.
bindTabContainer_get_tab_align :: MethodBind
bindTabContainer_get_tab_align
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tab_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of all tabs in the tab container. See the [code]ALIGN_*[/code] constants for details.
get_tab_align ::
                (TabContainer :< cls, Object :< cls) => cls -> IO Int
get_tab_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tab_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_tabs_visible #-}

-- | If [code]true[/code], tabs are visible. If [code]false[/code], tabs' content and titles are hidden. Default value: [code]true[/code].
bindTabContainer_set_tabs_visible :: MethodBind
bindTabContainer_set_tabs_visible
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_tabs_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], tabs are visible. If [code]false[/code], tabs' content and titles are hidden. Default value: [code]true[/code].
set_tabs_visible ::
                   (TabContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_tabs_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_tabs_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_are_tabs_visible #-}

-- | If [code]true[/code], tabs are visible. If [code]false[/code], tabs' content and titles are hidden. Default value: [code]true[/code].
bindTabContainer_are_tabs_visible :: MethodBind
bindTabContainer_are_tabs_visible
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "are_tabs_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], tabs are visible. If [code]false[/code], tabs' content and titles are hidden. Default value: [code]true[/code].
are_tabs_visible ::
                   (TabContainer :< cls, Object :< cls) => cls -> IO Bool
are_tabs_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_are_tabs_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_tab_title #-}

-- | Sets a title for the tab at index [code]tab_idx[/code]. Tab titles default to the name of the indexed child node, but this can be overridden with [method set_tab_title].
bindTabContainer_set_tab_title :: MethodBind
bindTabContainer_set_tab_title
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_tab_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a title for the tab at index [code]tab_idx[/code]. Tab titles default to the name of the indexed child node, but this can be overridden with [method set_tab_title].
set_tab_title ::
                (TabContainer :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
set_tab_title cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_tab_title (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tab_title #-}

-- | Returns the title of the tab at index [code]tab_idx[/code]. Tab titles default to the name of the indexed child node, but this can be overridden with [method set_tab_title].
bindTabContainer_get_tab_title :: MethodBind
bindTabContainer_get_tab_title
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tab_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the title of the tab at index [code]tab_idx[/code]. Tab titles default to the name of the indexed child node, but this can be overridden with [method set_tab_title].
get_tab_title ::
                (TabContainer :< cls, Object :< cls) =>
                cls -> Int -> IO GodotString
get_tab_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tab_title (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_tab_icon #-}

-- | Sets an icon for the tab at index [code]tab_idx[/code].
bindTabContainer_set_tab_icon :: MethodBind
bindTabContainer_set_tab_icon
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_tab_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an icon for the tab at index [code]tab_idx[/code].
set_tab_icon ::
               (TabContainer :< cls, Object :< cls) =>
               cls -> Int -> Texture -> IO ()
set_tab_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_tab_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tab_icon #-}

-- | Returns the [Texture] for the tab at index [code]tab_idx[/code] or null if the tab has no [Texture].
bindTabContainer_get_tab_icon :: MethodBind
bindTabContainer_get_tab_icon
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tab_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Texture] for the tab at index [code]tab_idx[/code] or null if the tab has no [Texture].
get_tab_icon ::
               (TabContainer :< cls, Object :< cls) => cls -> Int -> IO Texture
get_tab_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tab_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_tab_disabled #-}

-- | If [code]disabled[/code] is false, hides the tab at index [code]tab_idx[/code]. Note that its title text will remain, unless also removed with [method set_tab_title].
bindTabContainer_set_tab_disabled :: MethodBind
bindTabContainer_set_tab_disabled
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_tab_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]disabled[/code] is false, hides the tab at index [code]tab_idx[/code]. Note that its title text will remain, unless also removed with [method set_tab_title].
set_tab_disabled ::
                   (TabContainer :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_tab_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_tab_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tab_disabled #-}

-- | Returns [code]true[/code] if the tab at index [code]tab_idx[/code] is disabled.
bindTabContainer_get_tab_disabled :: MethodBind
bindTabContainer_get_tab_disabled
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tab_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the tab at index [code]tab_idx[/code] is disabled.
get_tab_disabled ::
                   (TabContainer :< cls, Object :< cls) => cls -> Int -> IO Bool
get_tab_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tab_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_popup #-}

-- | If set on a [Popup] node instance, a popup menu icon appears in the top-right corner of the [code]TabContainer[/code]. Clicking it will expand the [Popup] node.
bindTabContainer_set_popup :: MethodBind
bindTabContainer_set_popup
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set on a [Popup] node instance, a popup menu icon appears in the top-right corner of the [code]TabContainer[/code]. Clicking it will expand the [Popup] node.
set_popup ::
            (TabContainer :< cls, Object :< cls) => cls -> Node -> IO ()
set_popup cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_popup (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_popup #-}

-- | Returns the [Popup] node instance if one has been set already with [method set_popup].
bindTabContainer_get_popup :: MethodBind
bindTabContainer_get_popup
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Popup] node instance if one has been set already with [method set_popup].
get_popup ::
            (TabContainer :< cls, Object :< cls) => cls -> IO Popup
get_popup cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_popup (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_drag_to_rearrange_enabled #-}

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
bindTabContainer_set_drag_to_rearrange_enabled :: MethodBind
bindTabContainer_set_drag_to_rearrange_enabled
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_drag_to_rearrange_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
set_drag_to_rearrange_enabled ::
                                (TabContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_drag_to_rearrange_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTabContainer_set_drag_to_rearrange_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_drag_to_rearrange_enabled #-}

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
bindTabContainer_get_drag_to_rearrange_enabled :: MethodBind
bindTabContainer_get_drag_to_rearrange_enabled
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_drag_to_rearrange_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], tabs can be rearranged with mouse drag.
get_drag_to_rearrange_enabled ::
                                (TabContainer :< cls, Object :< cls) => cls -> IO Bool
get_drag_to_rearrange_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTabContainer_get_drag_to_rearrange_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_set_tabs_rearrange_group #-}

-- | Defines rearrange group id, choose for each [code]TabContainer[/code] the same value to enable tab drag between [code]TabContainer[/code]. Enable drag with [code]set_drag_to_rearrange_enabled(true)[/code].
bindTabContainer_set_tabs_rearrange_group :: MethodBind
bindTabContainer_set_tabs_rearrange_group
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "set_tabs_rearrange_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines rearrange group id, choose for each [code]TabContainer[/code] the same value to enable tab drag between [code]TabContainer[/code]. Enable drag with [code]set_drag_to_rearrange_enabled(true)[/code].
set_tabs_rearrange_group ::
                           (TabContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_tabs_rearrange_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_set_tabs_rearrange_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer_get_tabs_rearrange_group #-}

-- | Returns the [code]TabContainer[/code] rearrange group id.
bindTabContainer_get_tabs_rearrange_group :: MethodBind
bindTabContainer_get_tabs_rearrange_group
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "get_tabs_rearrange_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [code]TabContainer[/code] rearrange group id.
get_tabs_rearrange_group ::
                           (TabContainer :< cls, Object :< cls) => cls -> IO Int
get_tabs_rearrange_group cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer_get_tabs_rearrange_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer__child_renamed_callback #-}

bindTabContainer__child_renamed_callback :: MethodBind
bindTabContainer__child_renamed_callback
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "_child_renamed_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_child_renamed_callback ::
                          (TabContainer :< cls, Object :< cls) => cls -> IO ()
_child_renamed_callback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer__child_renamed_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer__on_theme_changed #-}

bindTabContainer__on_theme_changed :: MethodBind
bindTabContainer__on_theme_changed
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "_on_theme_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_on_theme_changed ::
                    (TabContainer :< cls, Object :< cls) => cls -> IO ()
_on_theme_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer__on_theme_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTabContainer__update_current_tab #-}

bindTabContainer__update_current_tab :: MethodBind
bindTabContainer__update_current_tab
  = unsafePerformIO $
      withCString "TabContainer" $
        \ clsNamePtr ->
          withCString "_update_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_current_tab ::
                      (TabContainer :< cls, Object :< cls) => cls -> IO ()
_update_current_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabContainer__update_current_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)