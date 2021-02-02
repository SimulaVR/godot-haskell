{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.OptionButton
       (Godot.Core.OptionButton.sig_item_focused,
        Godot.Core.OptionButton.sig_item_selected,
        Godot.Core.OptionButton._focused,
        Godot.Core.OptionButton._get_items,
        Godot.Core.OptionButton._select_int,
        Godot.Core.OptionButton._selected,
        Godot.Core.OptionButton._set_items,
        Godot.Core.OptionButton.add_icon_item,
        Godot.Core.OptionButton.add_item,
        Godot.Core.OptionButton.add_separator,
        Godot.Core.OptionButton.clear,
        Godot.Core.OptionButton.get_item_count,
        Godot.Core.OptionButton.get_item_icon,
        Godot.Core.OptionButton.get_item_id,
        Godot.Core.OptionButton.get_item_index,
        Godot.Core.OptionButton.get_item_metadata,
        Godot.Core.OptionButton.get_item_text,
        Godot.Core.OptionButton.get_popup,
        Godot.Core.OptionButton.get_selected,
        Godot.Core.OptionButton.get_selected_id,
        Godot.Core.OptionButton.get_selected_metadata,
        Godot.Core.OptionButton.is_item_disabled,
        Godot.Core.OptionButton.remove_item,
        Godot.Core.OptionButton.select,
        Godot.Core.OptionButton.set_item_disabled,
        Godot.Core.OptionButton.set_item_icon,
        Godot.Core.OptionButton.set_item_id,
        Godot.Core.OptionButton.set_item_metadata,
        Godot.Core.OptionButton.set_item_text)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | This signal is emitted when user navigated to an item using [code]ui_up[/code] or [code]ui_down[/code] action. ID of the item selected is passed as argument.
sig_item_focused :: Godot.Internal.Dispatch.Signal OptionButton
sig_item_focused = Godot.Internal.Dispatch.Signal "item_focused"

-- | This signal is emitted when the current item was changed by the user. Index of the item selected is passed as argument.
sig_item_selected :: Godot.Internal.Dispatch.Signal OptionButton
sig_item_selected = Godot.Internal.Dispatch.Signal "item_selected"

{-# NOINLINE bindOptionButton__focused #-}

bindOptionButton__focused :: MethodBind
bindOptionButton__focused
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "_focused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_focused ::
           (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
_focused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton__focused (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton__get_items #-}

bindOptionButton__get_items :: MethodBind
bindOptionButton__get_items
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "_get_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_items ::
             (OptionButton :< cls, Object :< cls) => cls -> IO Array
_get_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton__get_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton__select_int #-}

bindOptionButton__select_int :: MethodBind
bindOptionButton__select_int
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "_select_int" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_select_int ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
_select_int cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton__select_int (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton__selected #-}

bindOptionButton__selected :: MethodBind
bindOptionButton__selected
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_selected ::
            (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton__selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton__set_items #-}

bindOptionButton__set_items :: MethodBind
bindOptionButton__set_items
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "_set_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_items ::
             (OptionButton :< cls, Object :< cls) => cls -> Array -> IO ()
_set_items cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton__set_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_add_icon_item #-}

-- | Add an item, with a "texture" icon, text "label" and (optionally) id. If no "id" is passed, "id" becomes the item index. New items are appended at the end.
bindOptionButton_add_icon_item :: MethodBind
bindOptionButton_add_icon_item
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "add_icon_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add an item, with a "texture" icon, text "label" and (optionally) id. If no "id" is passed, "id" becomes the item index. New items are appended at the end.
add_icon_item ::
                (OptionButton :< cls, Object :< cls) =>
                cls -> Texture -> GodotString -> Int -> IO ()
add_icon_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_add_icon_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_add_item #-}

-- | Add an item, with text "label" and (optionally) id. If no "id" is passed, "id" becomes the item index. New items are appended at the end.
bindOptionButton_add_item :: MethodBind
bindOptionButton_add_item
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add an item, with text "label" and (optionally) id. If no "id" is passed, "id" becomes the item index. New items are appended at the end.
add_item ::
           (OptionButton :< cls, Object :< cls) =>
           cls -> GodotString -> Int -> IO ()
add_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_add_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_add_separator #-}

-- | Add a separator to the list of items. Separators help to group items. Separator also takes up an index and is appended at the end.
bindOptionButton_add_separator :: MethodBind
bindOptionButton_add_separator
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "add_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a separator to the list of items. Separators help to group items. Separator also takes up an index and is appended at the end.
add_separator ::
                (OptionButton :< cls, Object :< cls) => cls -> IO ()
add_separator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_add_separator (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_clear #-}

-- | Clear all the items in the [code]OptionButton[/code].
bindOptionButton_clear :: MethodBind
bindOptionButton_clear
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear all the items in the [code]OptionButton[/code].
clear :: (OptionButton :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_item_count #-}

-- | Returns the amount of items in the OptionButton.
bindOptionButton_get_item_count :: MethodBind
bindOptionButton_get_item_count
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of items in the OptionButton.
get_item_count ::
                 (OptionButton :< cls, Object :< cls) => cls -> IO Int
get_item_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_item_icon #-}

-- | Returns the icon of the item at index "idx".
bindOptionButton_get_item_icon :: MethodBind
bindOptionButton_get_item_icon
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon of the item at index "idx".
get_item_icon ::
                (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_item_id #-}

-- | Returns the ID of the item at index [code]idx[/code].
bindOptionButton_get_item_id :: MethodBind
bindOptionButton_get_item_id
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID of the item at index [code]idx[/code].
get_item_id ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_item_index #-}

-- | Returns the index of the item with the given [code]id[/code].
bindOptionButton_get_item_index :: MethodBind
bindOptionButton_get_item_index
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the item with the given [code]id[/code].
get_item_index ::
                 (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_item_metadata #-}

bindOptionButton_get_item_metadata :: MethodBind
bindOptionButton_get_item_metadata
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_item_metadata ::
                    (OptionButton :< cls, Object :< cls) =>
                    cls -> Int -> IO GodotVariant
get_item_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_item_text #-}

-- | Returns the text of the item at index "idx".
bindOptionButton_get_item_text :: MethodBind
bindOptionButton_get_item_text
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the text of the item at index "idx".
get_item_text ::
                (OptionButton :< cls, Object :< cls) =>
                cls -> Int -> IO GodotString
get_item_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_popup #-}

-- | Returns the [PopupMenu] contained in this button.
bindOptionButton_get_popup :: MethodBind
bindOptionButton_get_popup
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [PopupMenu] contained in this button.
get_popup ::
            (OptionButton :< cls, Object :< cls) => cls -> IO PopupMenu
get_popup cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_popup (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_selected #-}

bindOptionButton_get_selected :: MethodBind
bindOptionButton_get_selected
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_selected ::
               (OptionButton :< cls, Object :< cls) => cls -> IO Int
get_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_selected_id #-}

bindOptionButton_get_selected_id :: MethodBind
bindOptionButton_get_selected_id
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_selected_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_selected_id ::
                  (OptionButton :< cls, Object :< cls) => cls -> IO Int
get_selected_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_selected_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_get_selected_metadata #-}

bindOptionButton_get_selected_metadata :: MethodBind
bindOptionButton_get_selected_metadata
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_selected_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_selected_metadata ::
                        (OptionButton :< cls, Object :< cls) => cls -> IO GodotVariant
get_selected_metadata cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_selected_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_is_item_disabled #-}

bindOptionButton_is_item_disabled :: MethodBind
bindOptionButton_is_item_disabled
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "is_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_item_disabled ::
                   (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_is_item_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_remove_item #-}

bindOptionButton_remove_item :: MethodBind
bindOptionButton_remove_item
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_item ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_remove_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_select #-}

-- | Select an item by index and make it the current item.
bindOptionButton_select :: MethodBind
bindOptionButton_select
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select an item by index and make it the current item.
select ::
         (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_select (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_set_item_disabled #-}

bindOptionButton_set_item_disabled :: MethodBind
bindOptionButton_set_item_disabled
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_disabled ::
                    (OptionButton :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_set_item_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_set_item_icon #-}

-- | Set the icon of an item at index "idx".
bindOptionButton_set_item_icon :: MethodBind
bindOptionButton_set_item_icon
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the icon of an item at index "idx".
set_item_icon ::
                (OptionButton :< cls, Object :< cls) =>
                cls -> Int -> Texture -> IO ()
set_item_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_set_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_set_item_id #-}

-- | Set the ID of an item at index "idx".
bindOptionButton_set_item_id :: MethodBind
bindOptionButton_set_item_id
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the ID of an item at index "idx".
set_item_id ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_item_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_set_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_set_item_metadata #-}

bindOptionButton_set_item_metadata :: MethodBind
bindOptionButton_set_item_metadata
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_item_metadata ::
                    (OptionButton :< cls, Object :< cls) =>
                    cls -> Int -> GodotVariant -> IO ()
set_item_metadata cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_set_item_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOptionButton_set_item_text #-}

-- | Set the text of an item at index "idx".
bindOptionButton_set_item_text :: MethodBind
bindOptionButton_set_item_text
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the text of an item at index "idx".
set_item_text ::
                (OptionButton :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
set_item_text cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_set_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)