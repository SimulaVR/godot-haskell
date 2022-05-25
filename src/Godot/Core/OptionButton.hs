{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Button()

-- | Emitted the when user navigates to an item using the @ui_up@ or @ui_down@ actions. The index of the item selected is passed as argument.
sig_item_focused :: Godot.Internal.Dispatch.Signal OptionButton
sig_item_focused = Godot.Internal.Dispatch.Signal "item_focused"

instance NodeSignal OptionButton "item_focused" '[Int]

-- | Emitted when the current item has been changed by the user. The index of the item selected is passed as argument.
sig_item_selected :: Godot.Internal.Dispatch.Signal OptionButton
sig_item_selected = Godot.Internal.Dispatch.Signal "item_selected"

instance NodeSignal OptionButton "item_selected" '[Int]

instance NodeProperty OptionButton "items" Array 'False where
        nodeProperty = (_get_items, wrapDroppingSetter _set_items, Nothing)

instance NodeProperty OptionButton "selected" Int 'False where
        nodeProperty
          = (get_selected, wrapDroppingSetter _select_int, Nothing)

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

instance NodeMethod OptionButton "_focused" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OptionButton._focused

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

instance NodeMethod OptionButton "_get_items" '[] (IO Array) where
        nodeMethod = Godot.Core.OptionButton._get_items

{-# NOINLINE bindOptionButton__select_int #-}

-- | The index of the currently selected item, or @-1@ if no item is selected.
bindOptionButton__select_int :: MethodBind
bindOptionButton__select_int
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "_select_int" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The index of the currently selected item, or @-1@ if no item is selected.
_select_int ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
_select_int cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton__select_int (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "_select_int" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OptionButton._select_int

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

instance NodeMethod OptionButton "_selected" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OptionButton._selected

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

instance NodeMethod OptionButton "_set_items" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.OptionButton._set_items

{-# NOINLINE bindOptionButton_add_icon_item #-}

-- | Adds an item, with a @texture@ icon, text @label@ and (optionally) @id@. If no @id@ is passed, the item index will be used as the item's ID. New items are appended at the end.
bindOptionButton_add_icon_item :: MethodBind
bindOptionButton_add_icon_item
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "add_icon_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item, with a @texture@ icon, text @label@ and (optionally) @id@. If no @id@ is passed, the item index will be used as the item's ID. New items are appended at the end.
add_icon_item ::
                (OptionButton :< cls, Object :< cls) =>
                cls -> Texture -> GodotString -> Maybe Int -> IO ()
add_icon_item cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_add_icon_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "add_icon_item"
           '[Texture, GodotString, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.add_icon_item

{-# NOINLINE bindOptionButton_add_item #-}

-- | Adds an item, with text @label@ and (optionally) @id@. If no @id@ is passed, the item index will be used as the item's ID. New items are appended at the end.
bindOptionButton_add_item :: MethodBind
bindOptionButton_add_item
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item, with text @label@ and (optionally) @id@. If no @id@ is passed, the item index will be used as the item's ID. New items are appended at the end.
add_item ::
           (OptionButton :< cls, Object :< cls) =>
           cls -> GodotString -> Maybe Int -> IO ()
add_item cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_add_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "add_item"
           '[GodotString, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.add_item

{-# NOINLINE bindOptionButton_add_separator #-}

-- | Adds a separator to the list of items. Separators help to group items. Separator also takes up an index and is appended at the end.
bindOptionButton_add_separator :: MethodBind
bindOptionButton_add_separator
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "add_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a separator to the list of items. Separators help to group items. Separator also takes up an index and is appended at the end.
add_separator ::
                (OptionButton :< cls, Object :< cls) => cls -> IO ()
add_separator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_add_separator (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "add_separator" '[] (IO ()) where
        nodeMethod = Godot.Core.OptionButton.add_separator

{-# NOINLINE bindOptionButton_clear #-}

-- | Clears all the items in the @OptionButton@.
bindOptionButton_clear :: MethodBind
bindOptionButton_clear
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all the items in the @OptionButton@.
clear :: (OptionButton :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.OptionButton.clear

{-# NOINLINE bindOptionButton_get_item_count #-}

-- | Returns the amount of items in the OptionButton, including separators.
bindOptionButton_get_item_count :: MethodBind
bindOptionButton_get_item_count
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of items in the OptionButton, including separators.
get_item_count ::
                 (OptionButton :< cls, Object :< cls) => cls -> IO Int
get_item_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "get_item_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OptionButton.get_item_count

{-# NOINLINE bindOptionButton_get_item_icon #-}

-- | Returns the icon of the item at index @idx@.
bindOptionButton_get_item_icon :: MethodBind
bindOptionButton_get_item_icon
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon of the item at index @idx@.
get_item_icon ::
                (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "get_item_icon" '[Int]
           (IO Texture)
         where
        nodeMethod = Godot.Core.OptionButton.get_item_icon

{-# NOINLINE bindOptionButton_get_item_id #-}

-- | Returns the ID of the item at index @idx@.
bindOptionButton_get_item_id :: MethodBind
bindOptionButton_get_item_id
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID of the item at index @idx@.
get_item_id ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "get_item_id" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.OptionButton.get_item_id

{-# NOINLINE bindOptionButton_get_item_index #-}

-- | Returns the index of the item with the given @id@.
bindOptionButton_get_item_index :: MethodBind
bindOptionButton_get_item_index
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the item with the given @id@.
get_item_index ::
                 (OptionButton :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_item_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "get_item_index" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.OptionButton.get_item_index

{-# NOINLINE bindOptionButton_get_item_metadata #-}

-- | Retrieves the metadata of an item. Metadata may be any type and can be used to store extra information about an item, such as an external string ID.
bindOptionButton_get_item_metadata :: MethodBind
bindOptionButton_get_item_metadata
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Retrieves the metadata of an item. Metadata may be any type and can be used to store extra information about an item, such as an external string ID.
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

instance NodeMethod OptionButton "get_item_metadata" '[Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.OptionButton.get_item_metadata

{-# NOINLINE bindOptionButton_get_item_text #-}

-- | Returns the text of the item at index @idx@.
bindOptionButton_get_item_text :: MethodBind
bindOptionButton_get_item_text
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the text of the item at index @idx@.
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

instance NodeMethod OptionButton "get_item_text" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.OptionButton.get_item_text

{-# NOINLINE bindOptionButton_get_popup #-}

-- | Returns the @PopupMenu@ contained in this button.
bindOptionButton_get_popup :: MethodBind
bindOptionButton_get_popup
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @PopupMenu@ contained in this button.
get_popup ::
            (OptionButton :< cls, Object :< cls) => cls -> IO PopupMenu
get_popup cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_popup (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "get_popup" '[] (IO PopupMenu)
         where
        nodeMethod = Godot.Core.OptionButton.get_popup

{-# NOINLINE bindOptionButton_get_selected #-}

-- | The index of the currently selected item, or @-1@ if no item is selected.
bindOptionButton_get_selected :: MethodBind
bindOptionButton_get_selected
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The index of the currently selected item, or @-1@ if no item is selected.
get_selected ::
               (OptionButton :< cls, Object :< cls) => cls -> IO Int
get_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_get_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "get_selected" '[] (IO Int) where
        nodeMethod = Godot.Core.OptionButton.get_selected

{-# NOINLINE bindOptionButton_get_selected_id #-}

-- | Returns the ID of the selected item, or @0@ if no item is selected.
bindOptionButton_get_selected_id :: MethodBind
bindOptionButton_get_selected_id
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_selected_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID of the selected item, or @0@ if no item is selected.
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

instance NodeMethod OptionButton "get_selected_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OptionButton.get_selected_id

{-# NOINLINE bindOptionButton_get_selected_metadata #-}

-- | Gets the metadata of the selected item. Metadata for items can be set using @method set_item_metadata@.
bindOptionButton_get_selected_metadata :: MethodBind
bindOptionButton_get_selected_metadata
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "get_selected_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the metadata of the selected item. Metadata for items can be set using @method set_item_metadata@.
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

instance NodeMethod OptionButton "get_selected_metadata" '[]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.OptionButton.get_selected_metadata

{-# NOINLINE bindOptionButton_is_item_disabled #-}

-- | Returns @true@ if the item at index @idx@ is disabled.
bindOptionButton_is_item_disabled :: MethodBind
bindOptionButton_is_item_disabled
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "is_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the item at index @idx@ is disabled.
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

instance NodeMethod OptionButton "is_item_disabled" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.OptionButton.is_item_disabled

{-# NOINLINE bindOptionButton_remove_item #-}

-- | Removes the item at index @idx@.
bindOptionButton_remove_item :: MethodBind
bindOptionButton_remove_item
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the item at index @idx@.
remove_item ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_remove_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "remove_item" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OptionButton.remove_item

{-# NOINLINE bindOptionButton_select #-}

-- | Selects an item by index and makes it the current item. This will work even if the item is disabled.
bindOptionButton_select :: MethodBind
bindOptionButton_select
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects an item by index and makes it the current item. This will work even if the item is disabled.
select ::
         (OptionButton :< cls, Object :< cls) => cls -> Int -> IO ()
select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_select (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "select" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OptionButton.select

{-# NOINLINE bindOptionButton_set_item_disabled #-}

-- | Sets whether the item at index @idx@ is disabled.
--   				Disabled items are drawn differently in the dropdown and are not selectable by the user. If the current selected item is set as disabled, it will remain selected.
bindOptionButton_set_item_disabled :: MethodBind
bindOptionButton_set_item_disabled
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the item at index @idx@ is disabled.
--   				Disabled items are drawn differently in the dropdown and are not selectable by the user. If the current selected item is set as disabled, it will remain selected.
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

instance NodeMethod OptionButton "set_item_disabled" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.set_item_disabled

{-# NOINLINE bindOptionButton_set_item_icon #-}

-- | Sets the icon of the item at index @idx@.
bindOptionButton_set_item_icon :: MethodBind
bindOptionButton_set_item_icon
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the icon of the item at index @idx@.
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

instance NodeMethod OptionButton "set_item_icon" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.set_item_icon

{-# NOINLINE bindOptionButton_set_item_id #-}

-- | Sets the ID of the item at index @idx@.
bindOptionButton_set_item_id :: MethodBind
bindOptionButton_set_item_id
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the ID of the item at index @idx@.
set_item_id ::
              (OptionButton :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_item_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOptionButton_set_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OptionButton "set_item_id" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.set_item_id

{-# NOINLINE bindOptionButton_set_item_metadata #-}

-- | Sets the metadata of an item. Metadata may be of any type and can be used to store extra information about an item, such as an external string ID.
bindOptionButton_set_item_metadata :: MethodBind
bindOptionButton_set_item_metadata
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the metadata of an item. Metadata may be of any type and can be used to store extra information about an item, such as an external string ID.
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

instance NodeMethod OptionButton "set_item_metadata"
           '[Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.set_item_metadata

{-# NOINLINE bindOptionButton_set_item_text #-}

-- | Sets the text of the item at index @idx@.
bindOptionButton_set_item_text :: MethodBind
bindOptionButton_set_item_text
  = unsafePerformIO $
      withCString "OptionButton" $
        \ clsNamePtr ->
          withCString "set_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the text of the item at index @idx@.
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

instance NodeMethod OptionButton "set_item_text"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.OptionButton.set_item_text