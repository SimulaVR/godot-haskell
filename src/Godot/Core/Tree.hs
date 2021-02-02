{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Tree
       (Godot.Core.Tree._DROP_MODE_DISABLED, Godot.Core.Tree._SELECT_ROW,
        Godot.Core.Tree._SELECT_MULTI, Godot.Core.Tree._DROP_MODE_ON_ITEM,
        Godot.Core.Tree._DROP_MODE_INBETWEEN,
        Godot.Core.Tree._SELECT_SINGLE, Godot.Core.Tree.sig_button_pressed,
        Godot.Core.Tree.sig_cell_selected,
        Godot.Core.Tree.sig_column_title_pressed,
        Godot.Core.Tree.sig_custom_popup_edited,
        Godot.Core.Tree.sig_empty_rmb,
        Godot.Core.Tree.sig_empty_tree_rmb_selected,
        Godot.Core.Tree.sig_item_activated,
        Godot.Core.Tree.sig_item_collapsed,
        Godot.Core.Tree.sig_item_custom_button_pressed,
        Godot.Core.Tree.sig_item_double_clicked,
        Godot.Core.Tree.sig_item_edited,
        Godot.Core.Tree.sig_item_rmb_edited,
        Godot.Core.Tree.sig_item_rmb_selected,
        Godot.Core.Tree.sig_item_selected,
        Godot.Core.Tree.sig_multi_selected,
        Godot.Core.Tree.sig_nothing_selected, Godot.Core.Tree._gui_input,
        Godot.Core.Tree._popup_select,
        Godot.Core.Tree._range_click_timeout,
        Godot.Core.Tree._scroll_moved, Godot.Core.Tree._text_editor_enter,
        Godot.Core.Tree._text_editor_modal_close,
        Godot.Core.Tree._value_editor_changed,
        Godot.Core.Tree.are_column_titles_visible, Godot.Core.Tree.clear,
        Godot.Core.Tree.create_item,
        Godot.Core.Tree.ensure_cursor_is_visible,
        Godot.Core.Tree.get_allow_reselect,
        Godot.Core.Tree.get_allow_rmb_select,
        Godot.Core.Tree.get_column_at_position,
        Godot.Core.Tree.get_column_title, Godot.Core.Tree.get_column_width,
        Godot.Core.Tree.get_columns, Godot.Core.Tree.get_custom_popup_rect,
        Godot.Core.Tree.get_drop_mode_flags,
        Godot.Core.Tree.get_drop_section_at_position,
        Godot.Core.Tree.get_edited, Godot.Core.Tree.get_edited_column,
        Godot.Core.Tree.get_item_area_rect,
        Godot.Core.Tree.get_item_at_position,
        Godot.Core.Tree.get_next_selected,
        Godot.Core.Tree.get_pressed_button, Godot.Core.Tree.get_root,
        Godot.Core.Tree.get_scroll, Godot.Core.Tree.get_select_mode,
        Godot.Core.Tree.get_selected, Godot.Core.Tree.get_selected_column,
        Godot.Core.Tree.is_folding_hidden, Godot.Core.Tree.is_root_hidden,
        Godot.Core.Tree.set_allow_reselect,
        Godot.Core.Tree.set_allow_rmb_select,
        Godot.Core.Tree.set_column_expand,
        Godot.Core.Tree.set_column_min_width,
        Godot.Core.Tree.set_column_title,
        Godot.Core.Tree.set_column_titles_visible,
        Godot.Core.Tree.set_columns, Godot.Core.Tree.set_drop_mode_flags,
        Godot.Core.Tree.set_hide_folding, Godot.Core.Tree.set_hide_root,
        Godot.Core.Tree.set_select_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_DROP_MODE_DISABLED :: Int
_DROP_MODE_DISABLED = 0

_SELECT_ROW :: Int
_SELECT_ROW = 1

_SELECT_MULTI :: Int
_SELECT_MULTI = 2

_DROP_MODE_ON_ITEM :: Int
_DROP_MODE_ON_ITEM = 1

_DROP_MODE_INBETWEEN :: Int
_DROP_MODE_INBETWEEN = 2

_SELECT_SINGLE :: Int
_SELECT_SINGLE = 0

-- | Emitted when a button on the tree was pressed (see [method TreeItem.add_button]).
sig_button_pressed :: Godot.Internal.Dispatch.Signal Tree
sig_button_pressed
  = Godot.Internal.Dispatch.Signal "button_pressed"

-- | Emitted when a cell is selected.
sig_cell_selected :: Godot.Internal.Dispatch.Signal Tree
sig_cell_selected = Godot.Internal.Dispatch.Signal "cell_selected"

-- | Emitted when a column's title is pressed.
sig_column_title_pressed :: Godot.Internal.Dispatch.Signal Tree
sig_column_title_pressed
  = Godot.Internal.Dispatch.Signal "column_title_pressed"

-- | Emitted when a cell with the [constant TreeItem.CELL_MODE_CUSTOM] is clicked to be edited.
sig_custom_popup_edited :: Godot.Internal.Dispatch.Signal Tree
sig_custom_popup_edited
  = Godot.Internal.Dispatch.Signal "custom_popup_edited"

sig_empty_rmb :: Godot.Internal.Dispatch.Signal Tree
sig_empty_rmb = Godot.Internal.Dispatch.Signal "empty_rmb"

-- | Emitted when the right mouse button is pressed if RMB selection is active and the tree is empty.
sig_empty_tree_rmb_selected :: Godot.Internal.Dispatch.Signal Tree
sig_empty_tree_rmb_selected
  = Godot.Internal.Dispatch.Signal "empty_tree_rmb_selected"

-- | Emitted when an item's label is double-clicked.
sig_item_activated :: Godot.Internal.Dispatch.Signal Tree
sig_item_activated
  = Godot.Internal.Dispatch.Signal "item_activated"

-- | Emitted when an item is collapsed by a click on the folding arrow.
sig_item_collapsed :: Godot.Internal.Dispatch.Signal Tree
sig_item_collapsed
  = Godot.Internal.Dispatch.Signal "item_collapsed"

sig_item_custom_button_pressed ::
                               Godot.Internal.Dispatch.Signal Tree
sig_item_custom_button_pressed
  = Godot.Internal.Dispatch.Signal "item_custom_button_pressed"

-- | Emitted when an item's icon is double-clicked.
sig_item_double_clicked :: Godot.Internal.Dispatch.Signal Tree
sig_item_double_clicked
  = Godot.Internal.Dispatch.Signal "item_double_clicked"

-- | Emitted when an item is edited.
sig_item_edited :: Godot.Internal.Dispatch.Signal Tree
sig_item_edited = Godot.Internal.Dispatch.Signal "item_edited"

-- | Emitted when an item is edited using the right mouse button.
sig_item_rmb_edited :: Godot.Internal.Dispatch.Signal Tree
sig_item_rmb_edited
  = Godot.Internal.Dispatch.Signal "item_rmb_edited"

-- | Emitted when an item is selected with the right mouse button.
sig_item_rmb_selected :: Godot.Internal.Dispatch.Signal Tree
sig_item_rmb_selected
  = Godot.Internal.Dispatch.Signal "item_rmb_selected"

-- | Emitted when an item is selected.
sig_item_selected :: Godot.Internal.Dispatch.Signal Tree
sig_item_selected = Godot.Internal.Dispatch.Signal "item_selected"

-- | Emitted instead of [code]item_selected[/code] when [code]select_mode[/code] is [constant SELECT_MULTI].
sig_multi_selected :: Godot.Internal.Dispatch.Signal Tree
sig_multi_selected
  = Godot.Internal.Dispatch.Signal "multi_selected"

sig_nothing_selected :: Godot.Internal.Dispatch.Signal Tree
sig_nothing_selected
  = Godot.Internal.Dispatch.Signal "nothing_selected"

{-# NOINLINE bindTree__gui_input #-}

bindTree__gui_input :: MethodBind
bindTree__gui_input
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (Tree :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__gui_input (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree__popup_select #-}

bindTree__popup_select :: MethodBind
bindTree__popup_select
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_popup_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_popup_select ::
                (Tree :< cls, Object :< cls) => cls -> Int -> IO ()
_popup_select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__popup_select (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree__range_click_timeout #-}

bindTree__range_click_timeout :: MethodBind
bindTree__range_click_timeout
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_range_click_timeout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_range_click_timeout ::
                       (Tree :< cls, Object :< cls) => cls -> IO ()
_range_click_timeout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__range_click_timeout (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree__scroll_moved #-}

bindTree__scroll_moved :: MethodBind
bindTree__scroll_moved
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_scroll_moved" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_scroll_moved ::
                (Tree :< cls, Object :< cls) => cls -> Float -> IO ()
_scroll_moved cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__scroll_moved (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree__text_editor_enter #-}

bindTree__text_editor_enter :: MethodBind
bindTree__text_editor_enter
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_text_editor_enter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_text_editor_enter ::
                     (Tree :< cls, Object :< cls) => cls -> GodotString -> IO ()
_text_editor_enter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__text_editor_enter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree__text_editor_modal_close #-}

bindTree__text_editor_modal_close :: MethodBind
bindTree__text_editor_modal_close
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_text_editor_modal_close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_text_editor_modal_close ::
                           (Tree :< cls, Object :< cls) => cls -> IO ()
_text_editor_modal_close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__text_editor_modal_close
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree__value_editor_changed #-}

bindTree__value_editor_changed :: MethodBind
bindTree__value_editor_changed
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "_value_editor_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_value_editor_changed ::
                        (Tree :< cls, Object :< cls) => cls -> Float -> IO ()
_value_editor_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree__value_editor_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_are_column_titles_visible #-}

-- | Returns [code]true[/code] if the column titles are being shown.
bindTree_are_column_titles_visible :: MethodBind
bindTree_are_column_titles_visible
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "are_column_titles_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the column titles are being shown.
are_column_titles_visible ::
                            (Tree :< cls, Object :< cls) => cls -> IO Bool
are_column_titles_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_are_column_titles_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_clear #-}

-- | Clears the tree. This removes all items.
bindTree_clear :: MethodBind
bindTree_clear
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the tree. This removes all items.
clear :: (Tree :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_clear (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_create_item #-}

-- | Create an item in the tree and add it as the last child of [code]parent[/code]. If parent is not given, it will be added as the root's last child, or it'll the be the root itself if the tree is empty.
bindTree_create_item :: MethodBind
bindTree_create_item
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "create_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create an item in the tree and add it as the last child of [code]parent[/code]. If parent is not given, it will be added as the root's last child, or it'll the be the root itself if the tree is empty.
create_item ::
              (Tree :< cls, Object :< cls) => cls -> Object -> Int -> IO TreeItem
create_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_create_item (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_ensure_cursor_is_visible #-}

-- | Makes the currently selected item visible. This will scroll the tree to make sure the selected item is visible.
bindTree_ensure_cursor_is_visible :: MethodBind
bindTree_ensure_cursor_is_visible
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "ensure_cursor_is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes the currently selected item visible. This will scroll the tree to make sure the selected item is visible.
ensure_cursor_is_visible ::
                           (Tree :< cls, Object :< cls) => cls -> IO ()
ensure_cursor_is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_ensure_cursor_is_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_allow_reselect #-}

-- | If [code]true[/code], the currently selected cell may be selected again.
bindTree_get_allow_reselect :: MethodBind
bindTree_get_allow_reselect
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_allow_reselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the currently selected cell may be selected again.
get_allow_reselect ::
                     (Tree :< cls, Object :< cls) => cls -> IO Bool
get_allow_reselect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_allow_reselect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_allow_rmb_select #-}

-- | If [code]true[/code], a right mouse button click can select items.
bindTree_get_allow_rmb_select :: MethodBind
bindTree_get_allow_rmb_select
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_allow_rmb_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right mouse button click can select items.
get_allow_rmb_select ::
                       (Tree :< cls, Object :< cls) => cls -> IO Bool
get_allow_rmb_select cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_allow_rmb_select (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_column_at_position #-}

-- | Returns the column index under the given point.
bindTree_get_column_at_position :: MethodBind
bindTree_get_column_at_position
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_column_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column index under the given point.
get_column_at_position ::
                         (Tree :< cls, Object :< cls) => cls -> Vector2 -> IO Int
get_column_at_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_column_at_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_column_title #-}

-- | Returns the column's title.
bindTree_get_column_title :: MethodBind
bindTree_get_column_title
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_column_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column's title.
get_column_title ::
                   (Tree :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_column_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_column_title (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_column_width #-}

-- | Returns the column's width in pixels.
bindTree_get_column_width :: MethodBind
bindTree_get_column_width
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column's width in pixels.
get_column_width ::
                   (Tree :< cls, Object :< cls) => cls -> Int -> IO Int
get_column_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_column_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_columns #-}

-- | The amount of columns.
bindTree_get_columns :: MethodBind
bindTree_get_columns
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of columns.
get_columns :: (Tree :< cls, Object :< cls) => cls -> IO Int
get_columns cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_columns (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_custom_popup_rect #-}

-- | Returns the rectangle for custom popups. Helper to create custom cell controls that display a popup. See [method TreeItem.set_cell_mode].
bindTree_get_custom_popup_rect :: MethodBind
bindTree_get_custom_popup_rect
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_custom_popup_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rectangle for custom popups. Helper to create custom cell controls that display a popup. See [method TreeItem.set_cell_mode].
get_custom_popup_rect ::
                        (Tree :< cls, Object :< cls) => cls -> IO Rect2
get_custom_popup_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_custom_popup_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_drop_mode_flags #-}

-- | The drop mode as an OR combination of flags. See [code]DROP_MODE_*[/code] constants. Once dropping is done, reverts to [constant DROP_MODE_DISABLED]. Setting this during [method Control.can_drop_data] is recommended.
bindTree_get_drop_mode_flags :: MethodBind
bindTree_get_drop_mode_flags
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_drop_mode_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drop mode as an OR combination of flags. See [code]DROP_MODE_*[/code] constants. Once dropping is done, reverts to [constant DROP_MODE_DISABLED]. Setting this during [method Control.can_drop_data] is recommended.
get_drop_mode_flags ::
                      (Tree :< cls, Object :< cls) => cls -> IO Int
get_drop_mode_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_drop_mode_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_drop_section_at_position #-}

-- | If [member drop_mode_flags] includes [constant DROP_MODE_INBETWEEN], returns -1 if [code]position[/code] is the upper part of a tree item at that position, 1 for the lower part, and additionally 0 for the middle part if [member drop_mode_flags] includes [constant DROP_MODE_ON_ITEM].
--   				Otherwise, returns 0. If there are no tree item at [code]position[/code], returns -100.
bindTree_get_drop_section_at_position :: MethodBind
bindTree_get_drop_section_at_position
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_drop_section_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [member drop_mode_flags] includes [constant DROP_MODE_INBETWEEN], returns -1 if [code]position[/code] is the upper part of a tree item at that position, 1 for the lower part, and additionally 0 for the middle part if [member drop_mode_flags] includes [constant DROP_MODE_ON_ITEM].
--   				Otherwise, returns 0. If there are no tree item at [code]position[/code], returns -100.
get_drop_section_at_position ::
                               (Tree :< cls, Object :< cls) => cls -> Vector2 -> IO Int
get_drop_section_at_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_drop_section_at_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_edited #-}

-- | Returns the currently edited item. This is only available for custom cell mode.
bindTree_get_edited :: MethodBind
bindTree_get_edited
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_edited" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently edited item. This is only available for custom cell mode.
get_edited :: (Tree :< cls, Object :< cls) => cls -> IO TreeItem
get_edited cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_edited (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_edited_column #-}

-- | Returns the column for the currently edited item. This is only available for custom cell mode.
bindTree_get_edited_column :: MethodBind
bindTree_get_edited_column
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_edited_column" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column for the currently edited item. This is only available for custom cell mode.
get_edited_column :: (Tree :< cls, Object :< cls) => cls -> IO Int
get_edited_column cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_edited_column (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_item_area_rect #-}

-- | Returns the rectangle area for the specified item. If column is specified, only get the position and size of that column, otherwise get the rectangle containing all columns.
bindTree_get_item_area_rect :: MethodBind
bindTree_get_item_area_rect
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_item_area_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rectangle area for the specified item. If column is specified, only get the position and size of that column, otherwise get the rectangle containing all columns.
get_item_area_rect ::
                     (Tree :< cls, Object :< cls) => cls -> Object -> Int -> IO Rect2
get_item_area_rect cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_item_area_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_item_at_position #-}

-- | Returns the tree item at the specified position (relative to the tree origin position).
bindTree_get_item_at_position :: MethodBind
bindTree_get_item_at_position
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_item_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tree item at the specified position (relative to the tree origin position).
get_item_at_position ::
                       (Tree :< cls, Object :< cls) => cls -> Vector2 -> IO TreeItem
get_item_at_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_item_at_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_next_selected #-}

-- | Returns the next selected item after the given one.
bindTree_get_next_selected :: MethodBind
bindTree_get_next_selected
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_next_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next selected item after the given one.
get_next_selected ::
                    (Tree :< cls, Object :< cls) => cls -> Object -> IO TreeItem
get_next_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_next_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_pressed_button #-}

-- | Returns the last pressed button's index.
bindTree_get_pressed_button :: MethodBind
bindTree_get_pressed_button
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_pressed_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the last pressed button's index.
get_pressed_button :: (Tree :< cls, Object :< cls) => cls -> IO Int
get_pressed_button cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_pressed_button (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_root #-}

-- | Returns the tree's root item.
bindTree_get_root :: MethodBind
bindTree_get_root
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tree's root item.
get_root :: (Tree :< cls, Object :< cls) => cls -> IO TreeItem
get_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_root (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_scroll #-}

-- | Returns the current scrolling position.
bindTree_get_scroll :: MethodBind
bindTree_get_scroll
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current scrolling position.
get_scroll :: (Tree :< cls, Object :< cls) => cls -> IO Vector2
get_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_scroll (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_select_mode #-}

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
bindTree_get_select_mode :: MethodBind
bindTree_get_select_mode
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_select_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
get_select_mode :: (Tree :< cls, Object :< cls) => cls -> IO Int
get_select_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_select_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_selected #-}

-- | Returns the currently selected item.
bindTree_get_selected :: MethodBind
bindTree_get_selected
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently selected item.
get_selected :: (Tree :< cls, Object :< cls) => cls -> IO TreeItem
get_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_selected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_get_selected_column #-}

-- | Returns the current selection's column.
bindTree_get_selected_column :: MethodBind
bindTree_get_selected_column
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "get_selected_column" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current selection's column.
get_selected_column ::
                      (Tree :< cls, Object :< cls) => cls -> IO Int
get_selected_column cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_get_selected_column (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_is_folding_hidden #-}

-- | If [code]true[/code], the folding arrow is hidden.
bindTree_is_folding_hidden :: MethodBind
bindTree_is_folding_hidden
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "is_folding_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the folding arrow is hidden.
is_folding_hidden :: (Tree :< cls, Object :< cls) => cls -> IO Bool
is_folding_hidden cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_is_folding_hidden (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_is_root_hidden #-}

-- | If [code]true[/code], the tree's root is hidden.
bindTree_is_root_hidden :: MethodBind
bindTree_is_root_hidden
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "is_root_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the tree's root is hidden.
is_root_hidden :: (Tree :< cls, Object :< cls) => cls -> IO Bool
is_root_hidden cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_is_root_hidden (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_allow_reselect #-}

-- | If [code]true[/code], the currently selected cell may be selected again.
bindTree_set_allow_reselect :: MethodBind
bindTree_set_allow_reselect
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_allow_reselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the currently selected cell may be selected again.
set_allow_reselect ::
                     (Tree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_reselect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_allow_reselect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_allow_rmb_select #-}

-- | If [code]true[/code], a right mouse button click can select items.
bindTree_set_allow_rmb_select :: MethodBind
bindTree_set_allow_rmb_select
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_allow_rmb_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right mouse button click can select items.
set_allow_rmb_select ::
                       (Tree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_rmb_select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_allow_rmb_select (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_column_expand #-}

-- | If [code]true[/code], the column will have the "Expand" flag of [Control]. Columns that have the "Expand" flag will use their "min_width" in a similar fashion to [member Control.size_flags_stretch_ratio].
bindTree_set_column_expand :: MethodBind
bindTree_set_column_expand
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_column_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the column will have the "Expand" flag of [Control]. Columns that have the "Expand" flag will use their "min_width" in a similar fashion to [member Control.size_flags_stretch_ratio].
set_column_expand ::
                    (Tree :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_column_expand cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_column_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_column_min_width #-}

-- | Sets the minimum width of a column. Columns that have the "Expand" flag will use their "min_width" in a similar fashion to [member Control.size_flags_stretch_ratio].
bindTree_set_column_min_width :: MethodBind
bindTree_set_column_min_width
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_column_min_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the minimum width of a column. Columns that have the "Expand" flag will use their "min_width" in a similar fashion to [member Control.size_flags_stretch_ratio].
set_column_min_width ::
                       (Tree :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_column_min_width cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_column_min_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_column_title #-}

-- | Set the title of a column.
bindTree_set_column_title :: MethodBind
bindTree_set_column_title
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_column_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the title of a column.
set_column_title ::
                   (Tree :< cls, Object :< cls) => cls -> Int -> GodotString -> IO ()
set_column_title cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_column_title (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_column_titles_visible #-}

-- | If [code]true[/code], column titles are visible.
bindTree_set_column_titles_visible :: MethodBind
bindTree_set_column_titles_visible
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_column_titles_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], column titles are visible.
set_column_titles_visible ::
                            (Tree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_column_titles_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_column_titles_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_columns #-}

-- | The amount of columns.
bindTree_set_columns :: MethodBind
bindTree_set_columns
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of columns.
set_columns :: (Tree :< cls, Object :< cls) => cls -> Int -> IO ()
set_columns cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_columns (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_drop_mode_flags #-}

-- | The drop mode as an OR combination of flags. See [code]DROP_MODE_*[/code] constants. Once dropping is done, reverts to [constant DROP_MODE_DISABLED]. Setting this during [method Control.can_drop_data] is recommended.
bindTree_set_drop_mode_flags :: MethodBind
bindTree_set_drop_mode_flags
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_drop_mode_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drop mode as an OR combination of flags. See [code]DROP_MODE_*[/code] constants. Once dropping is done, reverts to [constant DROP_MODE_DISABLED]. Setting this during [method Control.can_drop_data] is recommended.
set_drop_mode_flags ::
                      (Tree :< cls, Object :< cls) => cls -> Int -> IO ()
set_drop_mode_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_drop_mode_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_hide_folding #-}

-- | If [code]true[/code], the folding arrow is hidden.
bindTree_set_hide_folding :: MethodBind
bindTree_set_hide_folding
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_hide_folding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the folding arrow is hidden.
set_hide_folding ::
                   (Tree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_folding cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_hide_folding (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_hide_root #-}

-- | If [code]true[/code], the tree's root is hidden.
bindTree_set_hide_root :: MethodBind
bindTree_set_hide_root
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_hide_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the tree's root is hidden.
set_hide_root ::
                (Tree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_root cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_hide_root (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTree_set_select_mode #-}

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
bindTree_set_select_mode :: MethodBind
bindTree_set_select_mode
  = unsafePerformIO $
      withCString "Tree" $
        \ clsNamePtr ->
          withCString "set_select_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
set_select_mode ::
                  (Tree :< cls, Object :< cls) => cls -> Int -> IO ()
set_select_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTree_set_select_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)