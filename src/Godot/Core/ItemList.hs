{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ItemList
       (Godot.Core.ItemList._ICON_MODE_LEFT,
        Godot.Core.ItemList._SELECT_MULTI,
        Godot.Core.ItemList._SELECT_SINGLE,
        Godot.Core.ItemList._ICON_MODE_TOP,
        Godot.Core.ItemList.sig_item_activated,
        Godot.Core.ItemList.sig_item_rmb_selected,
        Godot.Core.ItemList.sig_item_selected,
        Godot.Core.ItemList.sig_multi_selected,
        Godot.Core.ItemList.sig_nothing_selected,
        Godot.Core.ItemList.sig_rmb_clicked,
        Godot.Core.ItemList._get_items, Godot.Core.ItemList._gui_input,
        Godot.Core.ItemList._scroll_changed,
        Godot.Core.ItemList._set_items, Godot.Core.ItemList.add_icon_item,
        Godot.Core.ItemList.add_item, Godot.Core.ItemList.clear,
        Godot.Core.ItemList.ensure_current_is_visible,
        Godot.Core.ItemList.get_allow_reselect,
        Godot.Core.ItemList.get_allow_rmb_select,
        Godot.Core.ItemList.get_fixed_column_width,
        Godot.Core.ItemList.get_fixed_icon_size,
        Godot.Core.ItemList.get_icon_mode,
        Godot.Core.ItemList.get_icon_scale,
        Godot.Core.ItemList.get_item_at_position,
        Godot.Core.ItemList.get_item_count,
        Godot.Core.ItemList.get_item_custom_bg_color,
        Godot.Core.ItemList.get_item_custom_fg_color,
        Godot.Core.ItemList.get_item_icon,
        Godot.Core.ItemList.get_item_icon_modulate,
        Godot.Core.ItemList.get_item_icon_region,
        Godot.Core.ItemList.get_item_metadata,
        Godot.Core.ItemList.get_item_text,
        Godot.Core.ItemList.get_item_tooltip,
        Godot.Core.ItemList.get_max_columns,
        Godot.Core.ItemList.get_max_text_lines,
        Godot.Core.ItemList.get_select_mode,
        Godot.Core.ItemList.get_selected_items,
        Godot.Core.ItemList.get_v_scroll,
        Godot.Core.ItemList.has_auto_height,
        Godot.Core.ItemList.is_anything_selected,
        Godot.Core.ItemList.is_item_disabled,
        Godot.Core.ItemList.is_item_icon_transposed,
        Godot.Core.ItemList.is_item_selectable,
        Godot.Core.ItemList.is_item_tooltip_enabled,
        Godot.Core.ItemList.is_same_column_width,
        Godot.Core.ItemList.is_selected, Godot.Core.ItemList.move_item,
        Godot.Core.ItemList.remove_item, Godot.Core.ItemList.select,
        Godot.Core.ItemList.set_allow_reselect,
        Godot.Core.ItemList.set_allow_rmb_select,
        Godot.Core.ItemList.set_auto_height,
        Godot.Core.ItemList.set_fixed_column_width,
        Godot.Core.ItemList.set_fixed_icon_size,
        Godot.Core.ItemList.set_icon_mode,
        Godot.Core.ItemList.set_icon_scale,
        Godot.Core.ItemList.set_item_custom_bg_color,
        Godot.Core.ItemList.set_item_custom_fg_color,
        Godot.Core.ItemList.set_item_disabled,
        Godot.Core.ItemList.set_item_icon,
        Godot.Core.ItemList.set_item_icon_modulate,
        Godot.Core.ItemList.set_item_icon_region,
        Godot.Core.ItemList.set_item_icon_transposed,
        Godot.Core.ItemList.set_item_metadata,
        Godot.Core.ItemList.set_item_selectable,
        Godot.Core.ItemList.set_item_text,
        Godot.Core.ItemList.set_item_tooltip,
        Godot.Core.ItemList.set_item_tooltip_enabled,
        Godot.Core.ItemList.set_max_columns,
        Godot.Core.ItemList.set_max_text_lines,
        Godot.Core.ItemList.set_same_column_width,
        Godot.Core.ItemList.set_select_mode,
        Godot.Core.ItemList.sort_items_by_text,
        Godot.Core.ItemList.unselect, Godot.Core.ItemList.unselect_all)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ICON_MODE_LEFT :: Int
_ICON_MODE_LEFT = 1

_SELECT_MULTI :: Int
_SELECT_MULTI = 1

_SELECT_SINGLE :: Int
_SELECT_SINGLE = 0

_ICON_MODE_TOP :: Int
_ICON_MODE_TOP = 0

-- | Triggered when specified list item is activated via double-clicking or by pressing Enter.
sig_item_activated :: Godot.Internal.Dispatch.Signal ItemList
sig_item_activated
  = Godot.Internal.Dispatch.Signal "item_activated"

instance NodeSignal ItemList "item_activated" '[Int]

-- | Triggered when specified list item has been selected via right mouse clicking.
--   				The click position is also provided to allow appropriate popup of context menus at the correct location.
--   				[member allow_rmb_select] must be enabled.
sig_item_rmb_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_item_rmb_selected
  = Godot.Internal.Dispatch.Signal "item_rmb_selected"

instance NodeSignal ItemList "item_rmb_selected" '[Int, Vector2]

-- | Triggered when specified item has been selected.
--   				[member allow_reselect] must be enabled to reselect an item.
sig_item_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_item_selected = Godot.Internal.Dispatch.Signal "item_selected"

instance NodeSignal ItemList "item_selected" '[Int]

-- | Triggered when a multiple selection is altered on a list allowing multiple selection.
sig_multi_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_multi_selected
  = Godot.Internal.Dispatch.Signal "multi_selected"

instance NodeSignal ItemList "multi_selected" '[Int, Bool]

-- | Triggered when a left mouse click is issued within the rect of the list but on empty space.
sig_nothing_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_nothing_selected
  = Godot.Internal.Dispatch.Signal "nothing_selected"

instance NodeSignal ItemList "nothing_selected" '[]

-- | Triggered when a right mouse click is issued within the rect of the list but on empty space.
--   				[member allow_rmb_select] must be enabled.
sig_rmb_clicked :: Godot.Internal.Dispatch.Signal ItemList
sig_rmb_clicked = Godot.Internal.Dispatch.Signal "rmb_clicked"

instance NodeSignal ItemList "rmb_clicked" '[Vector2]

{-# NOINLINE bindItemList__get_items #-}

bindItemList__get_items :: MethodBind
bindItemList__get_items
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "_get_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_items :: (ItemList :< cls, Object :< cls) => cls -> IO Array
_get_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList__get_items (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList__gui_input #-}

bindItemList__gui_input :: MethodBind
bindItemList__gui_input
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (ItemList :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList__scroll_changed #-}

bindItemList__scroll_changed :: MethodBind
bindItemList__scroll_changed
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "_scroll_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_scroll_changed ::
                  (ItemList :< cls, Object :< cls) => cls -> Float -> IO ()
_scroll_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList__scroll_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList__set_items #-}

bindItemList__set_items :: MethodBind
bindItemList__set_items
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "_set_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_items ::
             (ItemList :< cls, Object :< cls) => cls -> Array -> IO ()
_set_items cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList__set_items (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_add_icon_item #-}

-- | Adds an item to the item list with no text, only an icon.
bindItemList_add_icon_item :: MethodBind
bindItemList_add_icon_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "add_icon_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item to the item list with no text, only an icon.
add_icon_item ::
                (ItemList :< cls, Object :< cls) => cls -> Texture -> Bool -> IO ()
add_icon_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_add_icon_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_add_item #-}

-- | Adds an item to the item list with specified text. Specify an [code]icon[/code], or use [code]null[/code] as the [code]icon[/code] for a list item with no icon.
--   				If selectable is [code]true[/code], the list item will be selectable.
bindItemList_add_item :: MethodBind
bindItemList_add_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item to the item list with specified text. Specify an [code]icon[/code], or use [code]null[/code] as the [code]icon[/code] for a list item with no icon.
--   				If selectable is [code]true[/code], the list item will be selectable.
add_item ::
           (ItemList :< cls, Object :< cls) =>
           cls -> GodotString -> Texture -> Bool -> IO ()
add_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_add_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_clear #-}

-- | Removes all items from the list.
bindItemList_clear :: MethodBind
bindItemList_clear
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all items from the list.
clear :: (ItemList :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_ensure_current_is_visible #-}

-- | Ensure current selection is visible, adjusting the scroll position as necessary.
bindItemList_ensure_current_is_visible :: MethodBind
bindItemList_ensure_current_is_visible
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "ensure_current_is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ensure current selection is visible, adjusting the scroll position as necessary.
ensure_current_is_visible ::
                            (ItemList :< cls, Object :< cls) => cls -> IO ()
ensure_current_is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_ensure_current_is_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_allow_reselect #-}

-- | If [code]true[/code], the currently selected item can be selected again.
bindItemList_get_allow_reselect :: MethodBind
bindItemList_get_allow_reselect
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_allow_reselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the currently selected item can be selected again.
get_allow_reselect ::
                     (ItemList :< cls, Object :< cls) => cls -> IO Bool
get_allow_reselect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_allow_reselect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_allow_rmb_select #-}

-- | If [code]true[/code], right mouse button click can select items.
bindItemList_get_allow_rmb_select :: MethodBind
bindItemList_get_allow_rmb_select
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_allow_rmb_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], right mouse button click can select items.
get_allow_rmb_select ::
                       (ItemList :< cls, Object :< cls) => cls -> IO Bool
get_allow_rmb_select cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_allow_rmb_select
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_fixed_column_width #-}

-- | The width all columns will be adjusted to.
--   			A value of zero disables the adjustment, each item will have a width equal to the width of its content and the columns will have an uneven width.
bindItemList_get_fixed_column_width :: MethodBind
bindItemList_get_fixed_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_fixed_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width all columns will be adjusted to.
--   			A value of zero disables the adjustment, each item will have a width equal to the width of its content and the columns will have an uneven width.
get_fixed_column_width ::
                         (ItemList :< cls, Object :< cls) => cls -> IO Int
get_fixed_column_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_fixed_column_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_fixed_icon_size #-}

-- | The size all icons will be adjusted to.
--   			If either X or Y component is not greater than zero, icon size won't be affected.
bindItemList_get_fixed_icon_size :: MethodBind
bindItemList_get_fixed_icon_size
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_fixed_icon_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size all icons will be adjusted to.
--   			If either X or Y component is not greater than zero, icon size won't be affected.
get_fixed_icon_size ::
                      (ItemList :< cls, Object :< cls) => cls -> IO Vector2
get_fixed_icon_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_fixed_icon_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_icon_mode #-}

-- | The icon position, whether above or to the left of the text. See the [enum IconMode] constants.
bindItemList_get_icon_mode :: MethodBind
bindItemList_get_icon_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_icon_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The icon position, whether above or to the left of the text. See the [enum IconMode] constants.
get_icon_mode :: (ItemList :< cls, Object :< cls) => cls -> IO Int
get_icon_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_icon_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_icon_scale #-}

-- | The scale of icon applied after [member fixed_icon_size] and transposing takes effect.
bindItemList_get_icon_scale :: MethodBind
bindItemList_get_icon_scale
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_icon_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The scale of icon applied after [member fixed_icon_size] and transposing takes effect.
get_icon_scale ::
                 (ItemList :< cls, Object :< cls) => cls -> IO Float
get_icon_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_icon_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_at_position #-}

-- | Returns the item index at the given [code]position[/code].
--   				When there is no item at that point, -1 will be returned if [code]exact[/code] is [code]true[/code], and the closest item index will be returned otherwise.
bindItemList_get_item_at_position :: MethodBind
bindItemList_get_item_at_position
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the item index at the given [code]position[/code].
--   				When there is no item at that point, -1 will be returned if [code]exact[/code] is [code]true[/code], and the closest item index will be returned otherwise.
get_item_at_position ::
                       (ItemList :< cls, Object :< cls) =>
                       cls -> Vector2 -> Bool -> IO Int
get_item_at_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_at_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_count #-}

-- | Returns the number of items currently in the list.
bindItemList_get_item_count :: MethodBind
bindItemList_get_item_count
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of items currently in the list.
get_item_count :: (ItemList :< cls, Object :< cls) => cls -> IO Int
get_item_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_custom_bg_color #-}

-- | Returns the custom background color of the item specified by [code]idx[/code] index.
bindItemList_get_item_custom_bg_color :: MethodBind
bindItemList_get_item_custom_bg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom background color of the item specified by [code]idx[/code] index.
get_item_custom_bg_color ::
                           (ItemList :< cls, Object :< cls) => cls -> Int -> IO Color
get_item_custom_bg_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_custom_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_custom_fg_color #-}

-- | Returns the custom foreground color of the item specified by [code]idx[/code] index.
bindItemList_get_item_custom_fg_color :: MethodBind
bindItemList_get_item_custom_fg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_custom_fg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom foreground color of the item specified by [code]idx[/code] index.
get_item_custom_fg_color ::
                           (ItemList :< cls, Object :< cls) => cls -> Int -> IO Color
get_item_custom_fg_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_custom_fg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_icon #-}

-- | Returns the icon associated with the specified index.
bindItemList_get_item_icon :: MethodBind
bindItemList_get_item_icon
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon associated with the specified index.
get_item_icon ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_icon_modulate #-}

-- | Returns a [Color] modulating item's icon at the specified index.
bindItemList_get_item_icon_modulate :: MethodBind
bindItemList_get_item_icon_modulate
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_icon_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [Color] modulating item's icon at the specified index.
get_item_icon_modulate ::
                         (ItemList :< cls, Object :< cls) => cls -> Int -> IO Color
get_item_icon_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_icon_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_icon_region #-}

-- | Returns the region of item's icon used. The whole icon will be used if the region has no area.
bindItemList_get_item_icon_region :: MethodBind
bindItemList_get_item_icon_region
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the region of item's icon used. The whole icon will be used if the region has no area.
get_item_icon_region ::
                       (ItemList :< cls, Object :< cls) => cls -> Int -> IO Rect2
get_item_icon_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_icon_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_metadata #-}

-- | Returns the metadata value of the specified index.
bindItemList_get_item_metadata :: MethodBind
bindItemList_get_item_metadata
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the metadata value of the specified index.
get_item_metadata ::
                    (ItemList :< cls, Object :< cls) => cls -> Int -> IO GodotVariant
get_item_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_text #-}

-- | Returns the text associated with the specified index.
bindItemList_get_item_text :: MethodBind
bindItemList_get_item_text
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the text associated with the specified index.
get_item_text ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_tooltip #-}

-- | Returns the tooltip hint associated with the specified index.
bindItemList_get_item_tooltip :: MethodBind
bindItemList_get_item_tooltip
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tooltip hint associated with the specified index.
get_item_tooltip ::
                   (ItemList :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_max_columns #-}

-- | Maximum columns the list will have.
--   			If greater than zero, the content will be split among the specified columns.
--   			A value of zero means unlimited columns, i.e. all items will be put in the same row.
bindItemList_get_max_columns :: MethodBind
bindItemList_get_max_columns
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_max_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum columns the list will have.
--   			If greater than zero, the content will be split among the specified columns.
--   			A value of zero means unlimited columns, i.e. all items will be put in the same row.
get_max_columns ::
                  (ItemList :< cls, Object :< cls) => cls -> IO Int
get_max_columns cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_max_columns (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_max_text_lines #-}

-- | Maximum lines of text allowed in each item. Space will be reserved even when there is not enough lines of text to display.
--   			[b]Note:[/b] This property takes effect only when [member icon_mode] is [constant ICON_MODE_TOP]. To make the text wrap, [member fixed_column_width] should be greater than zero.
bindItemList_get_max_text_lines :: MethodBind
bindItemList_get_max_text_lines
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_max_text_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum lines of text allowed in each item. Space will be reserved even when there is not enough lines of text to display.
--   			[b]Note:[/b] This property takes effect only when [member icon_mode] is [constant ICON_MODE_TOP]. To make the text wrap, [member fixed_column_width] should be greater than zero.
get_max_text_lines ::
                     (ItemList :< cls, Object :< cls) => cls -> IO Int
get_max_text_lines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_max_text_lines (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_select_mode #-}

-- | Allows single or multiple item selection. See the [enum SelectMode] constants.
bindItemList_get_select_mode :: MethodBind
bindItemList_get_select_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_select_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows single or multiple item selection. See the [enum SelectMode] constants.
get_select_mode ::
                  (ItemList :< cls, Object :< cls) => cls -> IO Int
get_select_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_select_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_selected_items #-}

-- | Returns an array with the indexes of the selected items.
bindItemList_get_selected_items :: MethodBind
bindItemList_get_selected_items
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_selected_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the indexes of the selected items.
get_selected_items ::
                     (ItemList :< cls, Object :< cls) => cls -> IO PoolIntArray
get_selected_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_selected_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_v_scroll #-}

-- | Returns the [Object] ID associated with the list.
bindItemList_get_v_scroll :: MethodBind
bindItemList_get_v_scroll
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Object] ID associated with the list.
get_v_scroll ::
               (ItemList :< cls, Object :< cls) => cls -> IO VScrollBar
get_v_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_v_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_has_auto_height #-}

-- | If [code]true[/code], the control will automatically resize the height to fit its content.
bindItemList_has_auto_height :: MethodBind
bindItemList_has_auto_height
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "has_auto_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the control will automatically resize the height to fit its content.
has_auto_height ::
                  (ItemList :< cls, Object :< cls) => cls -> IO Bool
has_auto_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_has_auto_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_anything_selected #-}

-- | Returns [code]true[/code] if one or more items are selected.
bindItemList_is_anything_selected :: MethodBind
bindItemList_is_anything_selected
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_anything_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if one or more items are selected.
is_anything_selected ::
                       (ItemList :< cls, Object :< cls) => cls -> IO Bool
is_anything_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_anything_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_item_disabled #-}

-- | Returns [code]true[/code] if the item at the specified index is disabled.
bindItemList_is_item_disabled :: MethodBind
bindItemList_is_item_disabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the item at the specified index is disabled.
is_item_disabled ::
                   (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_item_icon_transposed #-}

-- | Returns [code]true[/code] if the item icon will be drawn transposed, i.e. the X and Y axes are swapped.
bindItemList_is_item_icon_transposed :: MethodBind
bindItemList_is_item_icon_transposed
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_icon_transposed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the item icon will be drawn transposed, i.e. the X and Y axes are swapped.
is_item_icon_transposed ::
                          (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_icon_transposed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_item_icon_transposed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_item_selectable #-}

-- | Returns [code]true[/code] if the item at the specified index is selectable.
bindItemList_is_item_selectable :: MethodBind
bindItemList_is_item_selectable
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the item at the specified index is selectable.
is_item_selectable ::
                     (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_selectable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_item_selectable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_item_tooltip_enabled #-}

-- | Returns [code]true[/code] if the tooltip is enabled for specified item index.
bindItemList_is_item_tooltip_enabled :: MethodBind
bindItemList_is_item_tooltip_enabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_tooltip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the tooltip is enabled for specified item index.
is_item_tooltip_enabled ::
                          (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_tooltip_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_item_tooltip_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_same_column_width #-}

-- | Whether all columns will have the same width.
--   			If [code]true[/code], the width is equal to the largest column width of all columns.
bindItemList_is_same_column_width :: MethodBind
bindItemList_is_same_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_same_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Whether all columns will have the same width.
--   			If [code]true[/code], the width is equal to the largest column width of all columns.
is_same_column_width ::
                       (ItemList :< cls, Object :< cls) => cls -> IO Bool
is_same_column_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_same_column_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_selected #-}

-- | Returns [code]true[/code] if the item at the specified index is currently selected.
bindItemList_is_selected :: MethodBind
bindItemList_is_selected
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the item at the specified index is currently selected.
is_selected ::
              (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_selected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_move_item #-}

-- | Moves item from index [code]from_idx[/code] to [code]to_idx[/code].
bindItemList_move_item :: MethodBind
bindItemList_move_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "move_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves item from index [code]from_idx[/code] to [code]to_idx[/code].
move_item ::
            (ItemList :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
move_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_move_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_remove_item #-}

-- | Removes the item specified by [code]idx[/code] index from the list.
bindItemList_remove_item :: MethodBind
bindItemList_remove_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the item specified by [code]idx[/code] index from the list.
remove_item ::
              (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_remove_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_select #-}

-- | Select the item at the specified index.
--   				[b]Note:[/b] This method does not trigger the item selection signal.
bindItemList_select :: MethodBind
bindItemList_select
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select the item at the specified index.
--   				[b]Note:[/b] This method does not trigger the item selection signal.
select ::
         (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
select cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_allow_reselect #-}

-- | If [code]true[/code], the currently selected item can be selected again.
bindItemList_set_allow_reselect :: MethodBind
bindItemList_set_allow_reselect
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_allow_reselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the currently selected item can be selected again.
set_allow_reselect ::
                     (ItemList :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_reselect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_allow_reselect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_allow_rmb_select #-}

-- | If [code]true[/code], right mouse button click can select items.
bindItemList_set_allow_rmb_select :: MethodBind
bindItemList_set_allow_rmb_select
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_allow_rmb_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], right mouse button click can select items.
set_allow_rmb_select ::
                       (ItemList :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_rmb_select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_allow_rmb_select
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_auto_height #-}

-- | If [code]true[/code], the control will automatically resize the height to fit its content.
bindItemList_set_auto_height :: MethodBind
bindItemList_set_auto_height
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_auto_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the control will automatically resize the height to fit its content.
set_auto_height ::
                  (ItemList :< cls, Object :< cls) => cls -> Bool -> IO ()
set_auto_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_auto_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_fixed_column_width #-}

-- | The width all columns will be adjusted to.
--   			A value of zero disables the adjustment, each item will have a width equal to the width of its content and the columns will have an uneven width.
bindItemList_set_fixed_column_width :: MethodBind
bindItemList_set_fixed_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_fixed_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width all columns will be adjusted to.
--   			A value of zero disables the adjustment, each item will have a width equal to the width of its content and the columns will have an uneven width.
set_fixed_column_width ::
                         (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_fixed_column_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_fixed_column_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_fixed_icon_size #-}

-- | The size all icons will be adjusted to.
--   			If either X or Y component is not greater than zero, icon size won't be affected.
bindItemList_set_fixed_icon_size :: MethodBind
bindItemList_set_fixed_icon_size
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_fixed_icon_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size all icons will be adjusted to.
--   			If either X or Y component is not greater than zero, icon size won't be affected.
set_fixed_icon_size ::
                      (ItemList :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_fixed_icon_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_fixed_icon_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_icon_mode #-}

-- | The icon position, whether above or to the left of the text. See the [enum IconMode] constants.
bindItemList_set_icon_mode :: MethodBind
bindItemList_set_icon_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_icon_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The icon position, whether above or to the left of the text. See the [enum IconMode] constants.
set_icon_mode ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_icon_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_icon_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_icon_scale #-}

-- | The scale of icon applied after [member fixed_icon_size] and transposing takes effect.
bindItemList_set_icon_scale :: MethodBind
bindItemList_set_icon_scale
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_icon_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The scale of icon applied after [member fixed_icon_size] and transposing takes effect.
set_icon_scale ::
                 (ItemList :< cls, Object :< cls) => cls -> Float -> IO ()
set_icon_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_icon_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_custom_bg_color #-}

-- | Sets the background color of the item specified by [code]idx[/code] index to the specified [Color].
--   				[codeblock]
--   				var some_string = "Some text"
--   				some_string.set_item_custom_bg_color(0,Color(1, 0, 0, 1) # This will set the background color of the first item of the control to red.
--   				[/codeblock]
bindItemList_set_item_custom_bg_color :: MethodBind
bindItemList_set_item_custom_bg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the background color of the item specified by [code]idx[/code] index to the specified [Color].
--   				[codeblock]
--   				var some_string = "Some text"
--   				some_string.set_item_custom_bg_color(0,Color(1, 0, 0, 1) # This will set the background color of the first item of the control to red.
--   				[/codeblock]
set_item_custom_bg_color ::
                           (ItemList :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_item_custom_bg_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_custom_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_custom_fg_color #-}

-- | Sets the foreground color of the item specified by [code]idx[/code] index to the specified [Color].
--   				[codeblock]
--   				var some_string = "Some text"
--   				some_string.set_item_custom_fg_color(0,Color(1, 0, 0, 1) # This will set the foreground color of the first item of the control to red.
--   				[/codeblock]
bindItemList_set_item_custom_fg_color :: MethodBind
bindItemList_set_item_custom_fg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_custom_fg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the foreground color of the item specified by [code]idx[/code] index to the specified [Color].
--   				[codeblock]
--   				var some_string = "Some text"
--   				some_string.set_item_custom_fg_color(0,Color(1, 0, 0, 1) # This will set the foreground color of the first item of the control to red.
--   				[/codeblock]
set_item_custom_fg_color ::
                           (ItemList :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_item_custom_fg_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_custom_fg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_disabled #-}

-- | Disables (or enables) the item at the specified index.
--   				Disabled items cannot be selected and do not trigger activation signals (when double-clicking or pressing Enter).
bindItemList_set_item_disabled :: MethodBind
bindItemList_set_item_disabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables (or enables) the item at the specified index.
--   				Disabled items cannot be selected and do not trigger activation signals (when double-clicking or pressing Enter).
set_item_disabled ::
                    (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_icon #-}

-- | Sets (or replaces) the icon's [Texture] associated with the specified index.
bindItemList_set_item_icon :: MethodBind
bindItemList_set_item_icon
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets (or replaces) the icon's [Texture] associated with the specified index.
set_item_icon ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_item_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_icon_modulate #-}

-- | Sets a modulating [Color] of the item associated with the specified index.
bindItemList_set_item_icon_modulate :: MethodBind
bindItemList_set_item_icon_modulate
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a modulating [Color] of the item associated with the specified index.
set_item_icon_modulate ::
                         (ItemList :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_item_icon_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_icon_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_icon_region #-}

-- | Sets the region of item's icon used. The whole icon will be used if the region has no area.
bindItemList_set_item_icon_region :: MethodBind
bindItemList_set_item_icon_region
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the region of item's icon used. The whole icon will be used if the region has no area.
set_item_icon_region ::
                       (ItemList :< cls, Object :< cls) => cls -> Int -> Rect2 -> IO ()
set_item_icon_region cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_icon_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_icon_transposed #-}

-- | Sets whether the item icon will be drawn transposed.
bindItemList_set_item_icon_transposed :: MethodBind
bindItemList_set_item_icon_transposed
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon_transposed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the item icon will be drawn transposed.
set_item_icon_transposed ::
                           (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_icon_transposed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_icon_transposed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_metadata #-}

-- | Sets a value (of any type) to be stored with the item associated with the specified index.
bindItemList_set_item_metadata :: MethodBind
bindItemList_set_item_metadata
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a value (of any type) to be stored with the item associated with the specified index.
set_item_metadata ::
                    (ItemList :< cls, Object :< cls) =>
                    cls -> Int -> GodotVariant -> IO ()
set_item_metadata cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_selectable #-}

-- | Allows or disallows selection of the item associated with the specified index.
bindItemList_set_item_selectable :: MethodBind
bindItemList_set_item_selectable
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows or disallows selection of the item associated with the specified index.
set_item_selectable ::
                      (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_selectable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_selectable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_text #-}

-- | Sets text of the item associated with the specified index.
bindItemList_set_item_text :: MethodBind
bindItemList_set_item_text
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets text of the item associated with the specified index.
set_item_text ::
                (ItemList :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
set_item_text cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_tooltip #-}

-- | Sets the tooltip hint for the item associated with the specified index.
bindItemList_set_item_tooltip :: MethodBind
bindItemList_set_item_tooltip
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tooltip hint for the item associated with the specified index.
set_item_tooltip ::
                   (ItemList :< cls, Object :< cls) =>
                   cls -> Int -> GodotString -> IO ()
set_item_tooltip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_tooltip_enabled #-}

-- | Sets whether the tooltip hint is enabled for specified item index.
bindItemList_set_item_tooltip_enabled :: MethodBind
bindItemList_set_item_tooltip_enabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_tooltip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the tooltip hint is enabled for specified item index.
set_item_tooltip_enabled ::
                           (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_tooltip_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_tooltip_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_max_columns #-}

-- | Maximum columns the list will have.
--   			If greater than zero, the content will be split among the specified columns.
--   			A value of zero means unlimited columns, i.e. all items will be put in the same row.
bindItemList_set_max_columns :: MethodBind
bindItemList_set_max_columns
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_max_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum columns the list will have.
--   			If greater than zero, the content will be split among the specified columns.
--   			A value of zero means unlimited columns, i.e. all items will be put in the same row.
set_max_columns ::
                  (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_columns cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_max_columns (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_max_text_lines #-}

-- | Maximum lines of text allowed in each item. Space will be reserved even when there is not enough lines of text to display.
--   			[b]Note:[/b] This property takes effect only when [member icon_mode] is [constant ICON_MODE_TOP]. To make the text wrap, [member fixed_column_width] should be greater than zero.
bindItemList_set_max_text_lines :: MethodBind
bindItemList_set_max_text_lines
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_max_text_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum lines of text allowed in each item. Space will be reserved even when there is not enough lines of text to display.
--   			[b]Note:[/b] This property takes effect only when [member icon_mode] is [constant ICON_MODE_TOP]. To make the text wrap, [member fixed_column_width] should be greater than zero.
set_max_text_lines ::
                     (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_text_lines cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_max_text_lines (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_same_column_width #-}

-- | Whether all columns will have the same width.
--   			If [code]true[/code], the width is equal to the largest column width of all columns.
bindItemList_set_same_column_width :: MethodBind
bindItemList_set_same_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_same_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Whether all columns will have the same width.
--   			If [code]true[/code], the width is equal to the largest column width of all columns.
set_same_column_width ::
                        (ItemList :< cls, Object :< cls) => cls -> Bool -> IO ()
set_same_column_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_same_column_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_select_mode #-}

-- | Allows single or multiple item selection. See the [enum SelectMode] constants.
bindItemList_set_select_mode :: MethodBind
bindItemList_set_select_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_select_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows single or multiple item selection. See the [enum SelectMode] constants.
set_select_mode ::
                  (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_select_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_select_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_sort_items_by_text #-}

-- | Sorts items in the list by their text.
bindItemList_sort_items_by_text :: MethodBind
bindItemList_sort_items_by_text
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "sort_items_by_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sorts items in the list by their text.
sort_items_by_text ::
                     (ItemList :< cls, Object :< cls) => cls -> IO ()
sort_items_by_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_sort_items_by_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_unselect #-}

-- | Ensures the item associated with the specified index is not selected.
bindItemList_unselect :: MethodBind
bindItemList_unselect
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "unselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ensures the item associated with the specified index is not selected.
unselect :: (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
unselect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_unselect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_unselect_all #-}

-- | Ensures there are no items selected.
bindItemList_unselect_all :: MethodBind
bindItemList_unselect_all
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "unselect_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ensures there are no items selected.
unselect_all :: (ItemList :< cls, Object :< cls) => cls -> IO ()
unselect_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_unselect_all (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)