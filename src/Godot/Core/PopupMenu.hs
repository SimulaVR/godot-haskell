{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PopupMenu
       (Godot.Core.PopupMenu.sig_index_pressed,
        Godot.Core.PopupMenu.sig_id_focused,
        Godot.Core.PopupMenu.sig_id_pressed,
        Godot.Core.PopupMenu._gui_input,
        Godot.Core.PopupMenu.add_icon_item, Godot.Core.PopupMenu.add_item,
        Godot.Core.PopupMenu.add_icon_check_item,
        Godot.Core.PopupMenu.add_check_item,
        Godot.Core.PopupMenu.add_radio_check_item,
        Godot.Core.PopupMenu.add_submenu_item,
        Godot.Core.PopupMenu.add_icon_shortcut,
        Godot.Core.PopupMenu.add_shortcut,
        Godot.Core.PopupMenu.add_icon_check_shortcut,
        Godot.Core.PopupMenu.add_check_shortcut,
        Godot.Core.PopupMenu.add_radio_check_shortcut,
        Godot.Core.PopupMenu.set_item_text,
        Godot.Core.PopupMenu.set_item_icon,
        Godot.Core.PopupMenu.set_item_checked,
        Godot.Core.PopupMenu.set_item_id,
        Godot.Core.PopupMenu.set_item_accelerator,
        Godot.Core.PopupMenu.set_item_metadata,
        Godot.Core.PopupMenu.set_item_disabled,
        Godot.Core.PopupMenu.set_item_submenu,
        Godot.Core.PopupMenu.set_item_as_separator,
        Godot.Core.PopupMenu.set_item_as_checkable,
        Godot.Core.PopupMenu.set_item_as_radio_checkable,
        Godot.Core.PopupMenu.set_item_tooltip,
        Godot.Core.PopupMenu.set_item_shortcut,
        Godot.Core.PopupMenu.set_item_multistate,
        Godot.Core.PopupMenu.set_item_shortcut_disabled,
        Godot.Core.PopupMenu.toggle_item_checked,
        Godot.Core.PopupMenu.toggle_item_multistate,
        Godot.Core.PopupMenu.get_item_text,
        Godot.Core.PopupMenu.get_item_icon,
        Godot.Core.PopupMenu.is_item_checked,
        Godot.Core.PopupMenu.get_item_id,
        Godot.Core.PopupMenu.get_item_index,
        Godot.Core.PopupMenu.get_item_accelerator,
        Godot.Core.PopupMenu.get_item_metadata,
        Godot.Core.PopupMenu.is_item_disabled,
        Godot.Core.PopupMenu.get_item_submenu,
        Godot.Core.PopupMenu.is_item_separator,
        Godot.Core.PopupMenu.is_item_checkable,
        Godot.Core.PopupMenu.is_item_radio_checkable,
        Godot.Core.PopupMenu.is_item_shortcut_disabled,
        Godot.Core.PopupMenu.get_item_tooltip,
        Godot.Core.PopupMenu.get_item_shortcut,
        Godot.Core.PopupMenu.get_item_count,
        Godot.Core.PopupMenu.remove_item,
        Godot.Core.PopupMenu.add_separator, Godot.Core.PopupMenu.clear,
        Godot.Core.PopupMenu._set_items, Godot.Core.PopupMenu._get_items,
        Godot.Core.PopupMenu.set_hide_on_item_selection,
        Godot.Core.PopupMenu.is_hide_on_item_selection,
        Godot.Core.PopupMenu.set_hide_on_checkable_item_selection,
        Godot.Core.PopupMenu.is_hide_on_checkable_item_selection,
        Godot.Core.PopupMenu.set_hide_on_state_item_selection,
        Godot.Core.PopupMenu.is_hide_on_state_item_selection,
        Godot.Core.PopupMenu.set_submenu_popup_delay,
        Godot.Core.PopupMenu.get_submenu_popup_delay,
        Godot.Core.PopupMenu.set_hide_on_window_lose_focus,
        Godot.Core.PopupMenu.is_hide_on_window_lose_focus,
        Godot.Core.PopupMenu._submenu_timeout)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | This event is emitted when an item of some index is pressed or its accelerator is activated.
sig_index_pressed :: Godot.Internal.Dispatch.Signal PopupMenu
sig_index_pressed = Godot.Internal.Dispatch.Signal "index_pressed"

-- | This event is emitted when user navigated to an item of some id using [code]ui_up[/code] or [code]ui_down[/code] action.
sig_id_focused :: Godot.Internal.Dispatch.Signal PopupMenu
sig_id_focused = Godot.Internal.Dispatch.Signal "id_focused"

-- | This event is emitted when an item of some id is pressed or its accelerator is activated.
sig_id_pressed :: Godot.Internal.Dispatch.Signal PopupMenu
sig_id_pressed = Godot.Internal.Dispatch.Signal "id_pressed"

{-# NOINLINE bindPopupMenu__gui_input #-}

bindPopupMenu__gui_input :: MethodBind
bindPopupMenu__gui_input
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (PopupMenu :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_icon_item #-}

-- | Add a new item with text "label" and icon "texture". An id can optionally be provided, as well as an accelerator keybinding. If no id is provided, one will be created from the index.
bindPopupMenu_add_icon_item :: MethodBind
bindPopupMenu_add_icon_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a new item with text "label" and icon "texture". An id can optionally be provided, as well as an accelerator keybinding. If no id is provided, one will be created from the index.
add_icon_item ::
                (PopupMenu :< cls, Object :< cls) =>
                cls -> Texture -> GodotString -> Int -> Int -> IO ()
add_icon_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_item #-}

-- | Add a new item with text "label". An id can optionally be provided, as well as an accelerator keybinding. If no id is provided, one will be created from the index.
bindPopupMenu_add_item :: MethodBind
bindPopupMenu_add_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a new item with text "label". An id can optionally be provided, as well as an accelerator keybinding. If no id is provided, one will be created from the index.
add_item ::
           (PopupMenu :< cls, Object :< cls) =>
           cls -> GodotString -> Int -> Int -> IO ()
add_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_icon_check_item #-}

-- | Add a new checkable item with text "label" and icon "texture". An id can optionally be provided, as well as an accelerator. If no id is provided, one will be
--   				created from the index. Note that checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
bindPopupMenu_add_icon_check_item :: MethodBind
bindPopupMenu_add_icon_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a new checkable item with text "label" and icon "texture". An id can optionally be provided, as well as an accelerator. If no id is provided, one will be
--   				created from the index. Note that checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
add_icon_check_item ::
                      (PopupMenu :< cls, Object :< cls) =>
                      cls -> Texture -> GodotString -> Int -> Int -> IO ()
add_icon_check_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_check_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_check_item #-}

-- | Add a new checkable item with text "label". An id can optionally be provided, as well as an accelerator. If no id is provided, one will be created from the index. Note that checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
bindPopupMenu_add_check_item :: MethodBind
bindPopupMenu_add_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a new checkable item with text "label". An id can optionally be provided, as well as an accelerator. If no id is provided, one will be created from the index. Note that checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
add_check_item ::
                 (PopupMenu :< cls, Object :< cls) =>
                 cls -> GodotString -> Int -> Int -> IO ()
add_check_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_check_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_radio_check_item #-}

-- | The same as [method add_check_item] but the inserted item will look as a radio button. Remember this is just cosmetic and you have to add the logic for checking/unchecking items in radio groups.
bindPopupMenu_add_radio_check_item :: MethodBind
bindPopupMenu_add_radio_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_radio_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The same as [method add_check_item] but the inserted item will look as a radio button. Remember this is just cosmetic and you have to add the logic for checking/unchecking items in radio groups.
add_radio_check_item ::
                       (PopupMenu :< cls, Object :< cls) =>
                       cls -> GodotString -> Int -> Int -> IO ()
add_radio_check_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_radio_check_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_submenu_item #-}

-- | Adds an item with a submenu. The submenu is the name of a child PopupMenu node that would be shown when the item is clicked. An id can optionally be provided, but if is isn't provided, one will be created from the index.
bindPopupMenu_add_submenu_item :: MethodBind
bindPopupMenu_add_submenu_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_submenu_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item with a submenu. The submenu is the name of a child PopupMenu node that would be shown when the item is clicked. An id can optionally be provided, but if is isn't provided, one will be created from the index.
add_submenu_item ::
                   (PopupMenu :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> Int -> IO ()
add_submenu_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_submenu_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_icon_shortcut #-}

bindPopupMenu_add_icon_shortcut :: MethodBind
bindPopupMenu_add_icon_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_icon_shortcut ::
                    (PopupMenu :< cls, Object :< cls) =>
                    cls -> Texture -> ShortCut -> Int -> Bool -> IO ()
add_icon_shortcut cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_shortcut #-}

bindPopupMenu_add_shortcut :: MethodBind
bindPopupMenu_add_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_shortcut ::
               (PopupMenu :< cls, Object :< cls) =>
               cls -> ShortCut -> Int -> Bool -> IO ()
add_shortcut cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_icon_check_shortcut #-}

bindPopupMenu_add_icon_check_shortcut :: MethodBind
bindPopupMenu_add_icon_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_icon_check_shortcut ::
                          (PopupMenu :< cls, Object :< cls) =>
                          cls -> Texture -> ShortCut -> Int -> Bool -> IO ()
add_icon_check_shortcut cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_check_shortcut #-}

bindPopupMenu_add_check_shortcut :: MethodBind
bindPopupMenu_add_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_check_shortcut ::
                     (PopupMenu :< cls, Object :< cls) =>
                     cls -> ShortCut -> Int -> Bool -> IO ()
add_check_shortcut cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_radio_check_shortcut #-}

bindPopupMenu_add_radio_check_shortcut :: MethodBind
bindPopupMenu_add_radio_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_radio_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_radio_check_shortcut ::
                           (PopupMenu :< cls, Object :< cls) =>
                           cls -> ShortCut -> Int -> Bool -> IO ()
add_radio_check_shortcut cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_radio_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_text #-}

-- | Set the text of the item at index "idx".
bindPopupMenu_set_item_text :: MethodBind
bindPopupMenu_set_item_text
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the text of the item at index "idx".
set_item_text ::
                (PopupMenu :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
set_item_text cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_icon #-}

bindPopupMenu_set_item_icon :: MethodBind
bindPopupMenu_set_item_icon
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_icon ::
                (PopupMenu :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_item_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_checked #-}

-- | Set the checkstate status of the item at index "idx".
bindPopupMenu_set_item_checked :: MethodBind
bindPopupMenu_set_item_checked
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the checkstate status of the item at index "idx".
set_item_checked ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_checked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_checked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_id #-}

-- | Set the id of the item at index "idx".
bindPopupMenu_set_item_id :: MethodBind
bindPopupMenu_set_item_id
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the id of the item at index "idx".
set_item_id ::
              (PopupMenu :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_item_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_accelerator #-}

-- | Set the accelerator of the item at index "idx". Accelerators are special combinations of keys that activate the item, no matter which control is focused.
bindPopupMenu_set_item_accelerator :: MethodBind
bindPopupMenu_set_item_accelerator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_accelerator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the accelerator of the item at index "idx". Accelerators are special combinations of keys that activate the item, no matter which control is focused.
set_item_accelerator ::
                       (PopupMenu :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_item_accelerator cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_accelerator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_metadata #-}

-- | Sets the metadata of an item, which might be of any type. You can later get it with [method get_item_metadata], which provides a simple way of assigning context data to items.
bindPopupMenu_set_item_metadata :: MethodBind
bindPopupMenu_set_item_metadata
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the metadata of an item, which might be of any type. You can later get it with [method get_item_metadata], which provides a simple way of assigning context data to items.
set_item_metadata ::
                    (PopupMenu :< cls, Object :< cls) =>
                    cls -> Int -> GodotVariant -> IO ()
set_item_metadata cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_disabled #-}

-- | Sets whether the item at index "idx" is disabled or not. When it is disabled it can't be selected, or its action invoked.
bindPopupMenu_set_item_disabled :: MethodBind
bindPopupMenu_set_item_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the item at index "idx" is disabled or not. When it is disabled it can't be selected, or its action invoked.
set_item_disabled ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_submenu #-}

-- | Sets the submenu of the item at index "idx". The submenu is the name of a child PopupMenu node that would be shown when the item is clicked.
bindPopupMenu_set_item_submenu :: MethodBind
bindPopupMenu_set_item_submenu
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_submenu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the submenu of the item at index "idx". The submenu is the name of a child PopupMenu node that would be shown when the item is clicked.
set_item_submenu ::
                   (PopupMenu :< cls, Object :< cls) =>
                   cls -> Int -> GodotString -> IO ()
set_item_submenu cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_submenu (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_as_separator #-}

-- | Mark the item at index "idx" as a separator, which means that it would be displayed as a line.
bindPopupMenu_set_item_as_separator :: MethodBind
bindPopupMenu_set_item_as_separator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_as_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mark the item at index "idx" as a separator, which means that it would be displayed as a line.
set_item_as_separator ::
                        (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_as_separator cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_as_separator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_as_checkable #-}

-- | Set whether the item at index "idx" has a checkbox. Note that checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
bindPopupMenu_set_item_as_checkable :: MethodBind
bindPopupMenu_set_item_as_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_as_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set whether the item at index "idx" has a checkbox. Note that checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
set_item_as_checkable ::
                        (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_as_checkable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_as_checkable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_as_radio_checkable #-}

-- | The same as [method set_item_as_checkable] but placing a radio button in case of enabling. If used for disabling, it's the same.
--   				Remember this is just cosmetic and you have to add the logic for checking/unchecking items in radio groups.
bindPopupMenu_set_item_as_radio_checkable :: MethodBind
bindPopupMenu_set_item_as_radio_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_as_radio_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The same as [method set_item_as_checkable] but placing a radio button in case of enabling. If used for disabling, it's the same.
--   				Remember this is just cosmetic and you have to add the logic for checking/unchecking items in radio groups.
set_item_as_radio_checkable ::
                              (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_as_radio_checkable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_as_radio_checkable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_tooltip #-}

bindPopupMenu_set_item_tooltip :: MethodBind
bindPopupMenu_set_item_tooltip
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_tooltip ::
                   (PopupMenu :< cls, Object :< cls) =>
                   cls -> Int -> GodotString -> IO ()
set_item_tooltip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_shortcut #-}

bindPopupMenu_set_item_shortcut :: MethodBind
bindPopupMenu_set_item_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_shortcut ::
                    (PopupMenu :< cls, Object :< cls) =>
                    cls -> Int -> ShortCut -> Bool -> IO ()
set_item_shortcut cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_multistate #-}

bindPopupMenu_set_item_multistate :: MethodBind
bindPopupMenu_set_item_multistate
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_multistate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_multistate ::
                      (PopupMenu :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_item_multistate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_multistate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_item_shortcut_disabled #-}

bindPopupMenu_set_item_shortcut_disabled :: MethodBind
bindPopupMenu_set_item_shortcut_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_shortcut_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_shortcut_disabled ::
                             (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_shortcut_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_shortcut_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_toggle_item_checked #-}

bindPopupMenu_toggle_item_checked :: MethodBind
bindPopupMenu_toggle_item_checked
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "toggle_item_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

toggle_item_checked ::
                      (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO ()
toggle_item_checked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_toggle_item_checked
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_toggle_item_multistate #-}

bindPopupMenu_toggle_item_multistate :: MethodBind
bindPopupMenu_toggle_item_multistate
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "toggle_item_multistate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

toggle_item_multistate ::
                         (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO ()
toggle_item_multistate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_toggle_item_multistate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_text #-}

-- | Return the text of the item at index "idx".
bindPopupMenu_get_item_text :: MethodBind
bindPopupMenu_get_item_text
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the text of the item at index "idx".
get_item_text ::
                (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_icon #-}

-- | Return the icon of the item at index "idx".
bindPopupMenu_get_item_icon :: MethodBind
bindPopupMenu_get_item_icon
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the icon of the item at index "idx".
get_item_icon ::
                (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_item_checked #-}

-- | Return whether the item at index "idx" is checked.
bindPopupMenu_is_item_checked :: MethodBind
bindPopupMenu_is_item_checked
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the item at index "idx" is checked.
is_item_checked ::
                  (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_checked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_checked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_id #-}

-- | Return the id of the item at index "idx".
bindPopupMenu_get_item_id :: MethodBind
bindPopupMenu_get_item_id
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the id of the item at index "idx".
get_item_id ::
              (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_index #-}

-- | Find and return the index of the item containing a given id.
bindPopupMenu_get_item_index :: MethodBind
bindPopupMenu_get_item_index
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Find and return the index of the item containing a given id.
get_item_index ::
                 (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_accelerator #-}

-- | Return the accelerator of the item at index "idx". Accelerators are special combinations of keys that activate the item, no matter which control is focused.
bindPopupMenu_get_item_accelerator :: MethodBind
bindPopupMenu_get_item_accelerator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_accelerator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the accelerator of the item at index "idx". Accelerators are special combinations of keys that activate the item, no matter which control is focused.
get_item_accelerator ::
                       (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_accelerator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_accelerator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_metadata #-}

-- | Return the metadata of an item, which might be of any type. You can set it with [method set_item_metadata], which provides a simple way of assigning context data to items.
bindPopupMenu_get_item_metadata :: MethodBind
bindPopupMenu_get_item_metadata
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the metadata of an item, which might be of any type. You can set it with [method set_item_metadata], which provides a simple way of assigning context data to items.
get_item_metadata ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotVariant
get_item_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_item_disabled #-}

-- | Return whether the item at index "idx" is disabled. When it is disabled it can't be selected, or its action invoked.
bindPopupMenu_is_item_disabled :: MethodBind
bindPopupMenu_is_item_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the item at index "idx" is disabled. When it is disabled it can't be selected, or its action invoked.
is_item_disabled ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_submenu #-}

-- | Return the submenu name of the item at index "idx".
bindPopupMenu_get_item_submenu :: MethodBind
bindPopupMenu_get_item_submenu
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_submenu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the submenu name of the item at index "idx".
get_item_submenu ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_submenu cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_submenu (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_item_separator #-}

-- | Return whether the item is a separator. If it is, it would be displayed as a line.
bindPopupMenu_is_item_separator :: MethodBind
bindPopupMenu_is_item_separator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the item is a separator. If it is, it would be displayed as a line.
is_item_separator ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_separator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_separator (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_item_checkable #-}

-- | Return whether the item at index "idx" is checkable in some way, i.e., whether has a checkbox or radio button. Note that checkable items just display a checkmark or radio button, but don't have any built-in checking behavior and must be checked/unchecked manually.
bindPopupMenu_is_item_checkable :: MethodBind
bindPopupMenu_is_item_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the item at index "idx" is checkable in some way, i.e., whether has a checkbox or radio button. Note that checkable items just display a checkmark or radio button, but don't have any built-in checking behavior and must be checked/unchecked manually.
is_item_checkable ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_checkable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_checkable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_item_radio_checkable #-}

-- | Return whether the item at index "idx" has radio-button-style checkability. Remember this is just cosmetic and you have to add the logic for checking/unchecking items in radio groups.
bindPopupMenu_is_item_radio_checkable :: MethodBind
bindPopupMenu_is_item_radio_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_radio_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the item at index "idx" has radio-button-style checkability. Remember this is just cosmetic and you have to add the logic for checking/unchecking items in radio groups.
is_item_radio_checkable ::
                          (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_radio_checkable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_radio_checkable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_item_shortcut_disabled #-}

bindPopupMenu_is_item_shortcut_disabled :: MethodBind
bindPopupMenu_is_item_shortcut_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_shortcut_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_item_shortcut_disabled ::
                            (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_shortcut_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_shortcut_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_tooltip #-}

bindPopupMenu_get_item_tooltip :: MethodBind
bindPopupMenu_get_item_tooltip
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_item_tooltip ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_shortcut #-}

bindPopupMenu_get_item_shortcut :: MethodBind
bindPopupMenu_get_item_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_item_shortcut ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO ShortCut
get_item_shortcut cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_item_count #-}

-- | Return the amount of items.
bindPopupMenu_get_item_count :: MethodBind
bindPopupMenu_get_item_count
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the amount of items.
get_item_count ::
                 (PopupMenu :< cls, Object :< cls) => cls -> IO Int
get_item_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_remove_item #-}

-- | Removes the item at index "idx" from the menu. Note that the indexes of items after the removed item are going to be shifted by one.
bindPopupMenu_remove_item :: MethodBind
bindPopupMenu_remove_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the item at index "idx" from the menu. Note that the indexes of items after the removed item are going to be shifted by one.
remove_item ::
              (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_remove_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_add_separator #-}

-- | Add a separator between items. Separators also occupy an index.
bindPopupMenu_add_separator :: MethodBind
bindPopupMenu_add_separator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a separator between items. Separators also occupy an index.
add_separator ::
                (PopupMenu :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_separator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_separator (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_clear #-}

-- | Clear the popup menu, in effect removing all items.
bindPopupMenu_clear :: MethodBind
bindPopupMenu_clear
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the popup menu, in effect removing all items.
clear :: (PopupMenu :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu__set_items #-}

bindPopupMenu__set_items :: MethodBind
bindPopupMenu__set_items
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "_set_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_items ::
             (PopupMenu :< cls, Object :< cls) => cls -> Array -> IO ()
_set_items cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu__set_items (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu__get_items #-}

bindPopupMenu__get_items :: MethodBind
bindPopupMenu__get_items
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "_get_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_items :: (PopupMenu :< cls, Object :< cls) => cls -> IO Array
_get_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu__get_items (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_hide_on_item_selection #-}

bindPopupMenu_set_hide_on_item_selection :: MethodBind
bindPopupMenu_set_hide_on_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_hide_on_item_selection ::
                             (PopupMenu :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_on_item_selection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_hide_on_item_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_hide_on_item_selection #-}

bindPopupMenu_is_hide_on_item_selection :: MethodBind
bindPopupMenu_is_hide_on_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_hide_on_item_selection ::
                            (PopupMenu :< cls, Object :< cls) => cls -> IO Bool
is_hide_on_item_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_hide_on_item_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_hide_on_checkable_item_selection #-}

bindPopupMenu_set_hide_on_checkable_item_selection :: MethodBind
bindPopupMenu_set_hide_on_checkable_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_checkable_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_hide_on_checkable_item_selection ::
                                       (PopupMenu :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_on_checkable_item_selection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPopupMenu_set_hide_on_checkable_item_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_hide_on_checkable_item_selection #-}

bindPopupMenu_is_hide_on_checkable_item_selection :: MethodBind
bindPopupMenu_is_hide_on_checkable_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_checkable_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_hide_on_checkable_item_selection ::
                                      (PopupMenu :< cls, Object :< cls) => cls -> IO Bool
is_hide_on_checkable_item_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPopupMenu_is_hide_on_checkable_item_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_hide_on_state_item_selection #-}

bindPopupMenu_set_hide_on_state_item_selection :: MethodBind
bindPopupMenu_set_hide_on_state_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_state_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_hide_on_state_item_selection ::
                                   (PopupMenu :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_on_state_item_selection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPopupMenu_set_hide_on_state_item_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_hide_on_state_item_selection #-}

bindPopupMenu_is_hide_on_state_item_selection :: MethodBind
bindPopupMenu_is_hide_on_state_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_state_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_hide_on_state_item_selection ::
                                  (PopupMenu :< cls, Object :< cls) => cls -> IO Bool
is_hide_on_state_item_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPopupMenu_is_hide_on_state_item_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_submenu_popup_delay #-}

-- | Sets the delay time for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item. Default value: [code]0.3[/code] seconds.
bindPopupMenu_set_submenu_popup_delay :: MethodBind
bindPopupMenu_set_submenu_popup_delay
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_submenu_popup_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the delay time for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item. Default value: [code]0.3[/code] seconds.
set_submenu_popup_delay ::
                          (PopupMenu :< cls, Object :< cls) => cls -> Float -> IO ()
set_submenu_popup_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_submenu_popup_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_get_submenu_popup_delay #-}

-- | Sets the delay time for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item. Default value: [code]0.3[/code] seconds.
bindPopupMenu_get_submenu_popup_delay :: MethodBind
bindPopupMenu_get_submenu_popup_delay
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_submenu_popup_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the delay time for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item. Default value: [code]0.3[/code] seconds.
get_submenu_popup_delay ::
                          (PopupMenu :< cls, Object :< cls) => cls -> IO Float
get_submenu_popup_delay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_submenu_popup_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_set_hide_on_window_lose_focus #-}

bindPopupMenu_set_hide_on_window_lose_focus :: MethodBind
bindPopupMenu_set_hide_on_window_lose_focus
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_window_lose_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_hide_on_window_lose_focus ::
                                (PopupMenu :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_on_window_lose_focus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_hide_on_window_lose_focus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu_is_hide_on_window_lose_focus #-}

bindPopupMenu_is_hide_on_window_lose_focus :: MethodBind
bindPopupMenu_is_hide_on_window_lose_focus
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_window_lose_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_hide_on_window_lose_focus ::
                               (PopupMenu :< cls, Object :< cls) => cls -> IO Bool
is_hide_on_window_lose_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_hide_on_window_lose_focus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopupMenu__submenu_timeout #-}

bindPopupMenu__submenu_timeout :: MethodBind
bindPopupMenu__submenu_timeout
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "_submenu_timeout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_submenu_timeout ::
                   (PopupMenu :< cls, Object :< cls) => cls -> IO ()
_submenu_timeout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu__submenu_timeout (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)