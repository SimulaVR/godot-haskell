{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ItemList
       (Godot.Core.ItemList._ICON_MODE_LEFT,
        Godot.Core.ItemList._SELECT_MULTI,
        Godot.Core.ItemList._SELECT_SINGLE,
        Godot.Core.ItemList._ICON_MODE_TOP,
        Godot.Core.ItemList.sig_item_activated,
        Godot.Core.ItemList.sig_multi_selected,
        Godot.Core.ItemList.sig_nothing_selected,
        Godot.Core.ItemList.sig_rmb_clicked,
        Godot.Core.ItemList.sig_item_rmb_selected,
        Godot.Core.ItemList.sig_item_selected,
        Godot.Core.ItemList.add_item, Godot.Core.ItemList.add_icon_item,
        Godot.Core.ItemList.set_item_text,
        Godot.Core.ItemList.get_item_text,
        Godot.Core.ItemList.set_item_icon,
        Godot.Core.ItemList.get_item_icon,
        Godot.Core.ItemList.set_item_icon_transposed,
        Godot.Core.ItemList.is_item_icon_transposed,
        Godot.Core.ItemList.set_item_icon_region,
        Godot.Core.ItemList.get_item_icon_region,
        Godot.Core.ItemList.set_item_icon_modulate,
        Godot.Core.ItemList.get_item_icon_modulate,
        Godot.Core.ItemList.set_item_selectable,
        Godot.Core.ItemList.is_item_selectable,
        Godot.Core.ItemList.set_item_disabled,
        Godot.Core.ItemList.is_item_disabled,
        Godot.Core.ItemList.set_item_metadata,
        Godot.Core.ItemList.get_item_metadata,
        Godot.Core.ItemList.set_item_custom_bg_color,
        Godot.Core.ItemList.get_item_custom_bg_color,
        Godot.Core.ItemList.set_item_custom_fg_color,
        Godot.Core.ItemList.get_item_custom_fg_color,
        Godot.Core.ItemList.set_item_tooltip_enabled,
        Godot.Core.ItemList.is_item_tooltip_enabled,
        Godot.Core.ItemList.set_item_tooltip,
        Godot.Core.ItemList.get_item_tooltip, Godot.Core.ItemList.select,
        Godot.Core.ItemList.unselect, Godot.Core.ItemList.unselect_all,
        Godot.Core.ItemList.is_selected,
        Godot.Core.ItemList.get_selected_items,
        Godot.Core.ItemList.move_item, Godot.Core.ItemList.get_item_count,
        Godot.Core.ItemList.remove_item, Godot.Core.ItemList.clear,
        Godot.Core.ItemList.sort_items_by_text,
        Godot.Core.ItemList.set_fixed_column_width,
        Godot.Core.ItemList.get_fixed_column_width,
        Godot.Core.ItemList.set_same_column_width,
        Godot.Core.ItemList.is_same_column_width,
        Godot.Core.ItemList.set_max_text_lines,
        Godot.Core.ItemList.get_max_text_lines,
        Godot.Core.ItemList.set_max_columns,
        Godot.Core.ItemList.get_max_columns,
        Godot.Core.ItemList.set_select_mode,
        Godot.Core.ItemList.get_select_mode,
        Godot.Core.ItemList.set_icon_mode,
        Godot.Core.ItemList.get_icon_mode,
        Godot.Core.ItemList.set_fixed_icon_size,
        Godot.Core.ItemList.get_fixed_icon_size,
        Godot.Core.ItemList.set_icon_scale,
        Godot.Core.ItemList.get_icon_scale,
        Godot.Core.ItemList.set_allow_rmb_select,
        Godot.Core.ItemList.get_allow_rmb_select,
        Godot.Core.ItemList.set_allow_reselect,
        Godot.Core.ItemList.get_allow_reselect,
        Godot.Core.ItemList.set_auto_height,
        Godot.Core.ItemList.has_auto_height,
        Godot.Core.ItemList.is_anything_selected,
        Godot.Core.ItemList.get_item_at_position,
        Godot.Core.ItemList.ensure_current_is_visible,
        Godot.Core.ItemList.get_v_scroll,
        Godot.Core.ItemList._scroll_changed,
        Godot.Core.ItemList._gui_input, Godot.Core.ItemList._set_items,
        Godot.Core.ItemList._get_items)
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

-- | Fired when specified list item is activated via double click or Enter.
sig_item_activated :: Godot.Internal.Dispatch.Signal ItemList
sig_item_activated
  = Godot.Internal.Dispatch.Signal "item_activated"

-- | Fired when a multiple selection is altered on a list allowing multiple selection.
sig_multi_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_multi_selected
  = Godot.Internal.Dispatch.Signal "multi_selected"

sig_nothing_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_nothing_selected
  = Godot.Internal.Dispatch.Signal "nothing_selected"

sig_rmb_clicked :: Godot.Internal.Dispatch.Signal ItemList
sig_rmb_clicked = Godot.Internal.Dispatch.Signal "rmb_clicked"

-- | Fired when specified list item has been selected via right mouse clicking.
--   				The click position is also provided to allow appropriate popup of context menus
--   				at the correct location.
--   				[member allow_rmb_select] must be enabled.
sig_item_rmb_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_item_rmb_selected
  = Godot.Internal.Dispatch.Signal "item_rmb_selected"

-- | Fired when specified item has been selected.
--   				[member allow_reselect] must be enabled to reselect an item.
sig_item_selected :: Godot.Internal.Dispatch.Signal ItemList
sig_item_selected = Godot.Internal.Dispatch.Signal "item_selected"

{-# NOINLINE bindItemList_add_item #-}

-- | Adds an item to the item list with specified text. Specify an icon of null for a list item with no icon.
--   				If selectable is true the list item will be selectable.
bindItemList_add_item :: MethodBind
bindItemList_add_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item to the item list with specified text. Specify an icon of null for a list item with no icon.
--   				If selectable is true the list item will be selectable.
add_item ::
           (ItemList :< cls, Object :< cls) =>
           cls -> GodotString -> Texture -> Bool -> IO ()
add_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_add_item (upcast cls) arrPtr
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

{-# NOINLINE bindItemList_set_item_text #-}

-- | Sets text of item at specified index.
bindItemList_set_item_text :: MethodBind
bindItemList_set_item_text
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets text of item at specified index.
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

{-# NOINLINE bindItemList_get_item_text #-}

-- | Return the text for specified item index.
bindItemList_get_item_text :: MethodBind
bindItemList_get_item_text
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the text for specified item index.
get_item_text ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_icon #-}

-- | Set (or replace) icon of the item at the specified index.
bindItemList_set_item_icon :: MethodBind
bindItemList_set_item_icon
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set (or replace) icon of the item at the specified index.
set_item_icon ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_item_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_icon #-}

bindItemList_get_item_icon :: MethodBind
bindItemList_get_item_icon
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_item_icon ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_icon_transposed #-}

bindItemList_set_item_icon_transposed :: MethodBind
bindItemList_set_item_icon_transposed
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon_transposed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_is_item_icon_transposed #-}

bindItemList_is_item_icon_transposed :: MethodBind
bindItemList_is_item_icon_transposed
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_icon_transposed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_item_icon_region #-}

bindItemList_set_item_icon_region :: MethodBind
bindItemList_set_item_icon_region
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_get_item_icon_region #-}

bindItemList_get_item_icon_region :: MethodBind
bindItemList_get_item_icon_region
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_item_icon_modulate #-}

-- | Sets a modulating [Color] for item's icon at the specified index.
bindItemList_set_item_icon_modulate :: MethodBind
bindItemList_set_item_icon_modulate
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_icon_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a modulating [Color] for item's icon at the specified index.
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

{-# NOINLINE bindItemList_set_item_selectable #-}

-- | Allow or disallow selection of the item at the specified index.
bindItemList_set_item_selectable :: MethodBind
bindItemList_set_item_selectable
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allow or disallow selection of the item at the specified index.
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

{-# NOINLINE bindItemList_is_item_selectable #-}

-- | Returns whether or not the item at the specified index is selectable.
bindItemList_is_item_selectable :: MethodBind
bindItemList_is_item_selectable
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether or not the item at the specified index is selectable.
is_item_selectable ::
                     (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_selectable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_item_selectable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_disabled #-}

-- | Disable (or enable) item at specified index.
--   				Disabled items are not be selectable and do not fire activation (Enter or double-click) signals.
bindItemList_set_item_disabled :: MethodBind
bindItemList_set_item_disabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disable (or enable) item at specified index.
--   				Disabled items are not be selectable and do not fire activation (Enter or double-click) signals.
set_item_disabled ::
                    (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_item_disabled #-}

-- | Returns whether or not the item at the specified index is disabled
bindItemList_is_item_disabled :: MethodBind
bindItemList_is_item_disabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether or not the item at the specified index is disabled
is_item_disabled ::
                   (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_metadata #-}

-- | Sets a value (of any type) to be stored with the item at the specified index.
bindItemList_set_item_metadata :: MethodBind
bindItemList_set_item_metadata
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a value (of any type) to be stored with the item at the specified index.
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

{-# NOINLINE bindItemList_get_item_metadata #-}

bindItemList_get_item_metadata :: MethodBind
bindItemList_get_item_metadata
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_item_metadata ::
                    (ItemList :< cls, Object :< cls) => cls -> Int -> IO GodotVariant
get_item_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_item_custom_bg_color #-}

bindItemList_set_item_custom_bg_color :: MethodBind
bindItemList_set_item_custom_bg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_get_item_custom_bg_color #-}

bindItemList_get_item_custom_bg_color :: MethodBind
bindItemList_get_item_custom_bg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_item_custom_fg_color #-}

bindItemList_set_item_custom_fg_color :: MethodBind
bindItemList_set_item_custom_fg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_custom_fg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_get_item_custom_fg_color #-}

bindItemList_get_item_custom_fg_color :: MethodBind
bindItemList_get_item_custom_fg_color
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_custom_fg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_item_tooltip_enabled #-}

-- | Sets whether the tooltip is enabled for specified item index.
bindItemList_set_item_tooltip_enabled :: MethodBind
bindItemList_set_item_tooltip_enabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_tooltip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the tooltip is enabled for specified item index.
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

{-# NOINLINE bindItemList_is_item_tooltip_enabled #-}

-- | Returns whether the tooltip is enabled for specified item index.
bindItemList_is_item_tooltip_enabled :: MethodBind
bindItemList_is_item_tooltip_enabled
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_item_tooltip_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the tooltip is enabled for specified item index.
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

{-# NOINLINE bindItemList_set_item_tooltip #-}

-- | Sets tooltip hint for item at specified index.
bindItemList_set_item_tooltip :: MethodBind
bindItemList_set_item_tooltip
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets tooltip hint for item at specified index.
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

{-# NOINLINE bindItemList_get_item_tooltip #-}

-- | Return tooltip hint for specified item index.
bindItemList_get_item_tooltip :: MethodBind
bindItemList_get_item_tooltip
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return tooltip hint for specified item index.
get_item_tooltip ::
                   (ItemList :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_select #-}

-- | Select the item at the specified index.
--   				Note: This method does not trigger the item selection signal.
bindItemList_select :: MethodBind
bindItemList_select
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select the item at the specified index.
--   				Note: This method does not trigger the item selection signal.
select ::
         (ItemList :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
select cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_unselect #-}

-- | Ensure item at specified index is not selected.
bindItemList_unselect :: MethodBind
bindItemList_unselect
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "unselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ensure item at specified index is not selected.
unselect :: (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
unselect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_unselect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_unselect_all #-}

-- | Ensure there are no items selected.
bindItemList_unselect_all :: MethodBind
bindItemList_unselect_all
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "unselect_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ensure there are no items selected.
unselect_all :: (ItemList :< cls, Object :< cls) => cls -> IO ()
unselect_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_unselect_all (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_is_selected #-}

-- | Returns whether or not item at the specified index is currently selected.
bindItemList_is_selected :: MethodBind
bindItemList_is_selected
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether or not item at the specified index is currently selected.
is_selected ::
              (ItemList :< cls, Object :< cls) => cls -> Int -> IO Bool
is_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_is_selected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_selected_items #-}

-- | Returns the list of selected indexes.
bindItemList_get_selected_items :: MethodBind
bindItemList_get_selected_items
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_selected_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of selected indexes.
get_selected_items ::
                     (ItemList :< cls, Object :< cls) => cls -> IO PoolIntArray
get_selected_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_selected_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_move_item #-}

-- | Moves item at index [code]from_idx[/code] to [code]to_idx[/code].
bindItemList_move_item :: MethodBind
bindItemList_move_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "move_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves item at index [code]from_idx[/code] to [code]to_idx[/code].
move_item ::
            (ItemList :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
move_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_move_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_item_count #-}

-- | Return count of items currently in the item list.
bindItemList_get_item_count :: MethodBind
bindItemList_get_item_count
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return count of items currently in the item list.
get_item_count :: (ItemList :< cls, Object :< cls) => cls -> IO Int
get_item_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_item_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_remove_item #-}

-- | Remove item at specified index from the list.
bindItemList_remove_item :: MethodBind
bindItemList_remove_item
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove item at specified index from the list.
remove_item ::
              (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_remove_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_clear #-}

-- | Remove all items from the list.
bindItemList_clear :: MethodBind
bindItemList_clear
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove all items from the list.
clear :: (ItemList :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_clear (upcast cls) arrPtr len
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

{-# NOINLINE bindItemList_set_fixed_column_width #-}

bindItemList_set_fixed_column_width :: MethodBind
bindItemList_set_fixed_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_fixed_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_get_fixed_column_width #-}

bindItemList_get_fixed_column_width :: MethodBind
bindItemList_get_fixed_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_fixed_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_same_column_width #-}

bindItemList_set_same_column_width :: MethodBind
bindItemList_set_same_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_same_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_is_same_column_width #-}

bindItemList_is_same_column_width :: MethodBind
bindItemList_is_same_column_width
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "is_same_column_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_max_text_lines #-}

bindItemList_set_max_text_lines :: MethodBind
bindItemList_set_max_text_lines
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_max_text_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max_text_lines ::
                     (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_text_lines cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_max_text_lines (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_max_text_lines #-}

bindItemList_get_max_text_lines :: MethodBind
bindItemList_get_max_text_lines
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_max_text_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_text_lines ::
                     (ItemList :< cls, Object :< cls) => cls -> IO Int
get_max_text_lines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_max_text_lines (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_max_columns #-}

bindItemList_set_max_columns :: MethodBind
bindItemList_set_max_columns
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_max_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max_columns ::
                  (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_columns cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_max_columns (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_max_columns #-}

bindItemList_get_max_columns :: MethodBind
bindItemList_get_max_columns
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_max_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_columns ::
                  (ItemList :< cls, Object :< cls) => cls -> IO Int
get_max_columns cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_max_columns (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_select_mode #-}

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
bindItemList_set_select_mode :: MethodBind
bindItemList_set_select_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_select_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
set_select_mode ::
                  (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_select_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_select_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_select_mode #-}

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
bindItemList_get_select_mode :: MethodBind
bindItemList_get_select_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_select_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allow single or multiple selection. See the [code]SELECT_*[/code] constants.
get_select_mode ::
                  (ItemList :< cls, Object :< cls) => cls -> IO Int
get_select_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_select_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_icon_mode #-}

bindItemList_set_icon_mode :: MethodBind
bindItemList_set_icon_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_icon_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_icon_mode ::
                (ItemList :< cls, Object :< cls) => cls -> Int -> IO ()
set_icon_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_icon_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_icon_mode #-}

bindItemList_get_icon_mode :: MethodBind
bindItemList_get_icon_mode
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_icon_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_icon_mode :: (ItemList :< cls, Object :< cls) => cls -> IO Int
get_icon_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_icon_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_fixed_icon_size #-}

bindItemList_set_fixed_icon_size :: MethodBind
bindItemList_set_fixed_icon_size
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_fixed_icon_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_get_fixed_icon_size #-}

bindItemList_get_fixed_icon_size :: MethodBind
bindItemList_get_fixed_icon_size
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_fixed_icon_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_set_icon_scale #-}

bindItemList_set_icon_scale :: MethodBind
bindItemList_set_icon_scale
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_icon_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_icon_scale ::
                 (ItemList :< cls, Object :< cls) => cls -> Float -> IO ()
set_icon_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_icon_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_icon_scale #-}

bindItemList_get_icon_scale :: MethodBind
bindItemList_get_icon_scale
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_icon_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_icon_scale ::
                 (ItemList :< cls, Object :< cls) => cls -> IO Float
get_icon_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_icon_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_allow_rmb_select #-}

-- | If [code]true[/code], a right mouse button click can select items.
bindItemList_set_allow_rmb_select :: MethodBind
bindItemList_set_allow_rmb_select
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_allow_rmb_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right mouse button click can select items.
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

{-# NOINLINE bindItemList_get_allow_rmb_select #-}

-- | If [code]true[/code], a right mouse button click can select items.
bindItemList_get_allow_rmb_select :: MethodBind
bindItemList_get_allow_rmb_select
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_allow_rmb_select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right mouse button click can select items.
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

{-# NOINLINE bindItemList_set_allow_reselect #-}

-- | If [code]true[/code], the currently selected item may be selected again.
bindItemList_set_allow_reselect :: MethodBind
bindItemList_set_allow_reselect
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_allow_reselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the currently selected item may be selected again.
set_allow_reselect ::
                     (ItemList :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_reselect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_allow_reselect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_get_allow_reselect #-}

-- | If [code]true[/code], the currently selected item may be selected again.
bindItemList_get_allow_reselect :: MethodBind
bindItemList_get_allow_reselect
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_allow_reselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the currently selected item may be selected again.
get_allow_reselect ::
                     (ItemList :< cls, Object :< cls) => cls -> IO Bool
get_allow_reselect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_allow_reselect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_set_auto_height #-}

bindItemList_set_auto_height :: MethodBind
bindItemList_set_auto_height
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "set_auto_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_auto_height ::
                  (ItemList :< cls, Object :< cls) => cls -> Bool -> IO ()
set_auto_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_set_auto_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindItemList_has_auto_height #-}

bindItemList_has_auto_height :: MethodBind
bindItemList_has_auto_height
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "has_auto_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindItemList_get_item_at_position #-}

-- | Given a position within the control return the item (if any) at that point.
bindItemList_get_item_at_position :: MethodBind
bindItemList_get_item_at_position
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_item_at_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given a position within the control return the item (if any) at that point.
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

{-# NOINLINE bindItemList_ensure_current_is_visible #-}

-- | Ensure selection is visible, adjusting the scroll position as necessary.
bindItemList_ensure_current_is_visible :: MethodBind
bindItemList_ensure_current_is_visible
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "ensure_current_is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ensure selection is visible, adjusting the scroll position as necessary.
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

{-# NOINLINE bindItemList_get_v_scroll #-}

-- | Returns the current vertical scroll bar for the List.
bindItemList_get_v_scroll :: MethodBind
bindItemList_get_v_scroll
  = unsafePerformIO $
      withCString "ItemList" $
        \ clsNamePtr ->
          withCString "get_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current vertical scroll bar for the List.
get_v_scroll ::
               (ItemList :< cls, Object :< cls) => cls -> IO VScrollBar
get_v_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindItemList_get_v_scroll (upcast cls)
           arrPtr
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