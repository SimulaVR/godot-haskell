{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PopupMenu
       (Godot.Core.PopupMenu.sig_id_focused,
        Godot.Core.PopupMenu.sig_id_pressed,
        Godot.Core.PopupMenu.sig_index_pressed,
        Godot.Core.PopupMenu._get_items, Godot.Core.PopupMenu._gui_input,
        Godot.Core.PopupMenu._set_items,
        Godot.Core.PopupMenu._submenu_timeout,
        Godot.Core.PopupMenu.add_check_item,
        Godot.Core.PopupMenu.add_check_shortcut,
        Godot.Core.PopupMenu.add_icon_check_item,
        Godot.Core.PopupMenu.add_icon_check_shortcut,
        Godot.Core.PopupMenu.add_icon_item,
        Godot.Core.PopupMenu.add_icon_radio_check_item,
        Godot.Core.PopupMenu.add_icon_radio_check_shortcut,
        Godot.Core.PopupMenu.add_icon_shortcut,
        Godot.Core.PopupMenu.add_item,
        Godot.Core.PopupMenu.add_multistate_item,
        Godot.Core.PopupMenu.add_radio_check_item,
        Godot.Core.PopupMenu.add_radio_check_shortcut,
        Godot.Core.PopupMenu.add_separator,
        Godot.Core.PopupMenu.add_shortcut,
        Godot.Core.PopupMenu.add_submenu_item, Godot.Core.PopupMenu.clear,
        Godot.Core.PopupMenu.get_allow_search,
        Godot.Core.PopupMenu.get_item_accelerator,
        Godot.Core.PopupMenu.get_item_count,
        Godot.Core.PopupMenu.get_item_icon,
        Godot.Core.PopupMenu.get_item_id,
        Godot.Core.PopupMenu.get_item_index,
        Godot.Core.PopupMenu.get_item_metadata,
        Godot.Core.PopupMenu.get_item_shortcut,
        Godot.Core.PopupMenu.get_item_submenu,
        Godot.Core.PopupMenu.get_item_text,
        Godot.Core.PopupMenu.get_item_tooltip,
        Godot.Core.PopupMenu.get_submenu_popup_delay,
        Godot.Core.PopupMenu.is_hide_on_checkable_item_selection,
        Godot.Core.PopupMenu.is_hide_on_item_selection,
        Godot.Core.PopupMenu.is_hide_on_state_item_selection,
        Godot.Core.PopupMenu.is_hide_on_window_lose_focus,
        Godot.Core.PopupMenu.is_item_checkable,
        Godot.Core.PopupMenu.is_item_checked,
        Godot.Core.PopupMenu.is_item_disabled,
        Godot.Core.PopupMenu.is_item_radio_checkable,
        Godot.Core.PopupMenu.is_item_separator,
        Godot.Core.PopupMenu.is_item_shortcut_disabled,
        Godot.Core.PopupMenu.remove_item,
        Godot.Core.PopupMenu.set_allow_search,
        Godot.Core.PopupMenu.set_hide_on_checkable_item_selection,
        Godot.Core.PopupMenu.set_hide_on_item_selection,
        Godot.Core.PopupMenu.set_hide_on_state_item_selection,
        Godot.Core.PopupMenu.set_hide_on_window_lose_focus,
        Godot.Core.PopupMenu.set_item_accelerator,
        Godot.Core.PopupMenu.set_item_as_checkable,
        Godot.Core.PopupMenu.set_item_as_radio_checkable,
        Godot.Core.PopupMenu.set_item_as_separator,
        Godot.Core.PopupMenu.set_item_checked,
        Godot.Core.PopupMenu.set_item_disabled,
        Godot.Core.PopupMenu.set_item_icon,
        Godot.Core.PopupMenu.set_item_id,
        Godot.Core.PopupMenu.set_item_metadata,
        Godot.Core.PopupMenu.set_item_multistate,
        Godot.Core.PopupMenu.set_item_shortcut,
        Godot.Core.PopupMenu.set_item_shortcut_disabled,
        Godot.Core.PopupMenu.set_item_submenu,
        Godot.Core.PopupMenu.set_item_text,
        Godot.Core.PopupMenu.set_item_tooltip,
        Godot.Core.PopupMenu.set_submenu_popup_delay,
        Godot.Core.PopupMenu.toggle_item_checked,
        Godot.Core.PopupMenu.toggle_item_multistate)
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
import Godot.Core.Popup()

-- | Emitted when user navigated to an item of some @id@ using @ui_up@ or @ui_down@ action.
sig_id_focused :: Godot.Internal.Dispatch.Signal PopupMenu
sig_id_focused = Godot.Internal.Dispatch.Signal "id_focused"

instance NodeSignal PopupMenu "id_focused" '[Int]

-- | Emitted when an item of some @id@ is pressed or its accelerator is activated.
sig_id_pressed :: Godot.Internal.Dispatch.Signal PopupMenu
sig_id_pressed = Godot.Internal.Dispatch.Signal "id_pressed"

instance NodeSignal PopupMenu "id_pressed" '[Int]

-- | Emitted when an item of some @index@ is pressed or its accelerator is activated.
sig_index_pressed :: Godot.Internal.Dispatch.Signal PopupMenu
sig_index_pressed = Godot.Internal.Dispatch.Signal "index_pressed"

instance NodeSignal PopupMenu "index_pressed" '[Int]

instance NodeProperty PopupMenu "allow_search" Bool 'False where
        nodeProperty
          = (get_allow_search, wrapDroppingSetter set_allow_search, Nothing)

instance NodeProperty PopupMenu "hide_on_checkable_item_selection"
           Bool
           'False
         where
        nodeProperty
          = (is_hide_on_checkable_item_selection,
             wrapDroppingSetter set_hide_on_checkable_item_selection, Nothing)

instance NodeProperty PopupMenu "hide_on_item_selection" Bool
           'False
         where
        nodeProperty
          = (is_hide_on_item_selection,
             wrapDroppingSetter set_hide_on_item_selection, Nothing)

instance NodeProperty PopupMenu "hide_on_state_item_selection" Bool
           'False
         where
        nodeProperty
          = (is_hide_on_state_item_selection,
             wrapDroppingSetter set_hide_on_state_item_selection, Nothing)

instance NodeProperty PopupMenu "items" Array 'False where
        nodeProperty = (_get_items, wrapDroppingSetter _set_items, Nothing)

instance NodeProperty PopupMenu "submenu_popup_delay" Float 'False
         where
        nodeProperty
          = (get_submenu_popup_delay,
             wrapDroppingSetter set_submenu_popup_delay, Nothing)

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

instance NodeMethod PopupMenu "_get_items" '[] (IO Array) where
        nodeMethod = Godot.Core.PopupMenu._get_items

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

instance NodeMethod PopupMenu "_gui_input" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu._gui_input

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

instance NodeMethod PopupMenu "_set_items" '[Array] (IO ()) where
        nodeMethod = Godot.Core.PopupMenu._set_items

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

instance NodeMethod PopupMenu "_submenu_timeout" '[] (IO ()) where
        nodeMethod = Godot.Core.PopupMenu._submenu_timeout

{-# NOINLINE bindPopupMenu_add_check_item #-}

-- | Adds a new checkable item with text @label@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
bindPopupMenu_add_check_item :: MethodBind
bindPopupMenu_add_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new checkable item with text @label@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
add_check_item ::
                 (PopupMenu :< cls, Object :< cls) =>
                 cls -> GodotString -> Maybe Int -> Maybe Int -> IO ()
add_check_item cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_check_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_check_item"
           '[GodotString, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_check_item

{-# NOINLINE bindPopupMenu_add_check_shortcut #-}

-- | Adds a new checkable item and assigns the specified @ShortCut@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
bindPopupMenu_add_check_shortcut :: MethodBind
bindPopupMenu_add_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new checkable item and assigns the specified @ShortCut@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
add_check_shortcut ::
                     (PopupMenu :< cls, Object :< cls) =>
                     cls -> ShortCut -> Maybe Int -> Maybe Bool -> IO ()
add_check_shortcut cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_check_shortcut"
           '[ShortCut, Maybe Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_check_shortcut

{-# NOINLINE bindPopupMenu_add_icon_check_item #-}

-- | Adds a new checkable item with text @label@ and icon @texture@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
bindPopupMenu_add_icon_check_item :: MethodBind
bindPopupMenu_add_icon_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new checkable item with text @label@ and icon @texture@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
add_icon_check_item ::
                      (PopupMenu :< cls, Object :< cls) =>
                      cls -> Texture -> GodotString -> Maybe Int -> Maybe Int -> IO ()
add_icon_check_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantInt (0)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_check_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_icon_check_item"
           '[Texture, GodotString, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_icon_check_item

{-# NOINLINE bindPopupMenu_add_icon_check_shortcut #-}

-- | Adds a new checkable item and assigns the specified @ShortCut@ and icon @texture@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
bindPopupMenu_add_icon_check_shortcut :: MethodBind
bindPopupMenu_add_icon_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new checkable item and assigns the specified @ShortCut@ and icon @texture@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
add_icon_check_shortcut ::
                          (PopupMenu :< cls, Object :< cls) =>
                          cls -> Texture -> ShortCut -> Maybe Int -> Maybe Bool -> IO ()
add_icon_check_shortcut cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_icon_check_shortcut"
           '[Texture, ShortCut, Maybe Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_icon_check_shortcut

{-# NOINLINE bindPopupMenu_add_icon_item #-}

-- | Adds a new item with text @label@ and icon @texture@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
bindPopupMenu_add_icon_item :: MethodBind
bindPopupMenu_add_icon_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new item with text @label@ and icon @texture@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
add_icon_item ::
                (PopupMenu :< cls, Object :< cls) =>
                cls -> Texture -> GodotString -> Maybe Int -> Maybe Int -> IO ()
add_icon_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantInt (0)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_icon_item"
           '[Texture, GodotString, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_icon_item

{-# NOINLINE bindPopupMenu_add_icon_radio_check_item #-}

-- | Same as @method add_icon_check_item@, but uses a radio check button.
bindPopupMenu_add_icon_radio_check_item :: MethodBind
bindPopupMenu_add_icon_radio_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_radio_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Same as @method add_icon_check_item@, but uses a radio check button.
add_icon_radio_check_item ::
                            (PopupMenu :< cls, Object :< cls) =>
                            cls -> Texture -> GodotString -> Maybe Int -> Maybe Int -> IO ()
add_icon_radio_check_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantInt (0)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_radio_check_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_icon_radio_check_item"
           '[Texture, GodotString, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_icon_radio_check_item

{-# NOINLINE bindPopupMenu_add_icon_radio_check_shortcut #-}

-- | Same as @method add_icon_check_shortcut@, but uses a radio check button.
bindPopupMenu_add_icon_radio_check_shortcut :: MethodBind
bindPopupMenu_add_icon_radio_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_radio_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Same as @method add_icon_check_shortcut@, but uses a radio check button.
add_icon_radio_check_shortcut ::
                                (PopupMenu :< cls, Object :< cls) =>
                                cls -> Texture -> ShortCut -> Maybe Int -> Maybe Bool -> IO ()
add_icon_radio_check_shortcut cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_radio_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_icon_radio_check_shortcut"
           '[Texture, ShortCut, Maybe Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_icon_radio_check_shortcut

{-# NOINLINE bindPopupMenu_add_icon_shortcut #-}

-- | Adds a new item and assigns the specified @ShortCut@ and icon @texture@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
bindPopupMenu_add_icon_shortcut :: MethodBind
bindPopupMenu_add_icon_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_icon_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new item and assigns the specified @ShortCut@ and icon @texture@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
add_icon_shortcut ::
                    (PopupMenu :< cls, Object :< cls) =>
                    cls -> Texture -> ShortCut -> Maybe Int -> Maybe Bool -> IO ()
add_icon_shortcut cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_icon_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_icon_shortcut"
           '[Texture, ShortCut, Maybe Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_icon_shortcut

{-# NOINLINE bindPopupMenu_add_item #-}

-- | Adds a new item with text @label@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
bindPopupMenu_add_item :: MethodBind
bindPopupMenu_add_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new item with text @label@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
add_item ::
           (PopupMenu :< cls, Object :< cls) =>
           cls -> GodotString -> Maybe Int -> Maybe Int -> IO ()
add_item cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_item (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_item"
           '[GodotString, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_item

{-# NOINLINE bindPopupMenu_add_multistate_item #-}

-- | Adds a new multistate item with text @label@.
--   				Contrarily to normal binary items, multistate items can have more than two states, as defined by @max_states@. Each press or activate of the item will increase the state by one. The default value is defined by @default_state@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
bindPopupMenu_add_multistate_item :: MethodBind
bindPopupMenu_add_multistate_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_multistate_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new multistate item with text @label@.
--   				Contrarily to normal binary items, multistate items can have more than two states, as defined by @max_states@. Each press or activate of the item will increase the state by one. The default value is defined by @default_state@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
add_multistate_item ::
                      (PopupMenu :< cls, Object :< cls) =>
                      cls ->
                        GodotString -> Int -> Maybe Int -> Maybe Int -> Maybe Int -> IO ()
add_multistate_item cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3,
       maybe (VariantInt (-1)) toVariant arg4,
       maybe (VariantInt (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_multistate_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_multistate_item"
           '[GodotString, Int, Maybe Int, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_multistate_item

{-# NOINLINE bindPopupMenu_add_radio_check_item #-}

-- | Adds a new radio check button with text @label@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
bindPopupMenu_add_radio_check_item :: MethodBind
bindPopupMenu_add_radio_check_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_radio_check_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new radio check button with text @label@.
--   				An @id@ can optionally be provided, as well as an accelerator (@accel@). If no @id@ is provided, one will be created from the index. If no @accel@ is provided then the default @0@ will be assigned to it. See @method get_item_accelerator@ for more info on accelerators.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
add_radio_check_item ::
                       (PopupMenu :< cls, Object :< cls) =>
                       cls -> GodotString -> Maybe Int -> Maybe Int -> IO ()
add_radio_check_item cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_radio_check_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_radio_check_item"
           '[GodotString, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_radio_check_item

{-# NOINLINE bindPopupMenu_add_radio_check_shortcut #-}

-- | Adds a new radio check button and assigns a @ShortCut@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
bindPopupMenu_add_radio_check_shortcut :: MethodBind
bindPopupMenu_add_radio_check_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_radio_check_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new radio check button and assigns a @ShortCut@ to it. Sets the label of the checkbox to the @ShortCut@'s name.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually. See @method set_item_checked@ for more info on how to control it.
add_radio_check_shortcut ::
                           (PopupMenu :< cls, Object :< cls) =>
                           cls -> ShortCut -> Maybe Int -> Maybe Bool -> IO ()
add_radio_check_shortcut cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_radio_check_shortcut
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_radio_check_shortcut"
           '[ShortCut, Maybe Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_radio_check_shortcut

{-# NOINLINE bindPopupMenu_add_separator #-}

-- | Adds a separator between items. Separators also occupy an index, which you can set by using the @id@ parameter.
--   				A @label@ can optionally be provided, which will appear at the center of the separator.
bindPopupMenu_add_separator :: MethodBind
bindPopupMenu_add_separator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a separator between items. Separators also occupy an index, which you can set by using the @id@ parameter.
--   				A @label@ can optionally be provided, which will appear at the center of the separator.
add_separator ::
                (PopupMenu :< cls, Object :< cls) =>
                cls -> Maybe GodotString -> IO ()
add_separator cls arg1
  = withVariantArray [defaultedVariant VariantString "" arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_separator (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_separator" '[Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_separator

{-# NOINLINE bindPopupMenu_add_shortcut #-}

-- | Adds a @ShortCut@.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
bindPopupMenu_add_shortcut :: MethodBind
bindPopupMenu_add_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @ShortCut@.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
add_shortcut ::
               (PopupMenu :< cls, Object :< cls) =>
               cls -> ShortCut -> Maybe Int -> Maybe Bool -> IO ()
add_shortcut cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_shortcut"
           '[ShortCut, Maybe Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_shortcut

{-# NOINLINE bindPopupMenu_add_submenu_item #-}

-- | Adds an item that will act as a submenu of the parent @PopupMenu@ node when clicked. The @submenu@ argument is the name of the child @PopupMenu@ node that will be shown when the item is clicked.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
bindPopupMenu_add_submenu_item :: MethodBind
bindPopupMenu_add_submenu_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "add_submenu_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an item that will act as a submenu of the parent @PopupMenu@ node when clicked. The @submenu@ argument is the name of the child @PopupMenu@ node that will be shown when the item is clicked.
--   				An @id@ can optionally be provided. If no @id@ is provided, one will be created from the index.
add_submenu_item ::
                   (PopupMenu :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> Maybe Int -> IO ()
add_submenu_item cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_add_submenu_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "add_submenu_item"
           '[GodotString, GodotString, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.add_submenu_item

{-# NOINLINE bindPopupMenu_clear #-}

-- | Removes all items from the @PopupMenu@.
bindPopupMenu_clear :: MethodBind
bindPopupMenu_clear
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all items from the @PopupMenu@.
clear :: (PopupMenu :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.PopupMenu.clear

{-# NOINLINE bindPopupMenu_get_allow_search #-}

-- | If @true@, allows navigating @PopupMenu@ with letter keys.
bindPopupMenu_get_allow_search :: MethodBind
bindPopupMenu_get_allow_search
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_allow_search" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, allows navigating @PopupMenu@ with letter keys.
get_allow_search ::
                   (PopupMenu :< cls, Object :< cls) => cls -> IO Bool
get_allow_search cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_allow_search (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_allow_search" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.get_allow_search

{-# NOINLINE bindPopupMenu_get_item_accelerator #-}

-- | Returns the accelerator of the item at index @idx@. Accelerators are special combinations of keys that activate the item, no matter which control is focused.
bindPopupMenu_get_item_accelerator :: MethodBind
bindPopupMenu_get_item_accelerator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_accelerator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the accelerator of the item at index @idx@. Accelerators are special combinations of keys that activate the item, no matter which control is focused.
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

instance NodeMethod PopupMenu "get_item_accelerator" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_accelerator

{-# NOINLINE bindPopupMenu_get_item_count #-}

-- | Returns the number of items in the @PopupMenu@.
bindPopupMenu_get_item_count :: MethodBind
bindPopupMenu_get_item_count
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of items in the @PopupMenu@.
get_item_count ::
                 (PopupMenu :< cls, Object :< cls) => cls -> IO Int
get_item_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_count" '[] (IO Int) where
        nodeMethod = Godot.Core.PopupMenu.get_item_count

{-# NOINLINE bindPopupMenu_get_item_icon #-}

-- | Returns the icon of the item at index @idx@.
bindPopupMenu_get_item_icon :: MethodBind
bindPopupMenu_get_item_icon
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon of the item at index @idx@.
get_item_icon ::
                (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_icon" '[Int] (IO Texture)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_icon

{-# NOINLINE bindPopupMenu_get_item_id #-}

-- | Returns the id of the item at index @idx@. @id@ can be manually assigned, while index can not.
bindPopupMenu_get_item_id :: MethodBind
bindPopupMenu_get_item_id
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the id of the item at index @idx@. @id@ can be manually assigned, while index can not.
get_item_id ::
              (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_id" '[Int] (IO Int) where
        nodeMethod = Godot.Core.PopupMenu.get_item_id

{-# NOINLINE bindPopupMenu_get_item_index #-}

-- | Returns the index of the item containing the specified @id@. Index is automatically assigned to each item by the engine. Index can not be set manually.
bindPopupMenu_get_item_index :: MethodBind
bindPopupMenu_get_item_index
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the item containing the specified @id@. Index is automatically assigned to each item by the engine. Index can not be set manually.
get_item_index ::
                 (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Int
get_item_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_index" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_index

{-# NOINLINE bindPopupMenu_get_item_metadata #-}

-- | Returns the metadata of the specified item, which might be of any type. You can set it with @method set_item_metadata@, which provides a simple way of assigning context data to items.
bindPopupMenu_get_item_metadata :: MethodBind
bindPopupMenu_get_item_metadata
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the metadata of the specified item, which might be of any type. You can set it with @method set_item_metadata@, which provides a simple way of assigning context data to items.
get_item_metadata ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotVariant
get_item_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_metadata" '[Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_metadata

{-# NOINLINE bindPopupMenu_get_item_shortcut #-}

-- | Returns the @ShortCut@ associated with the specified @idx@ item.
bindPopupMenu_get_item_shortcut :: MethodBind
bindPopupMenu_get_item_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @ShortCut@ associated with the specified @idx@ item.
get_item_shortcut ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO ShortCut
get_item_shortcut cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_shortcut" '[Int]
           (IO ShortCut)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_shortcut

{-# NOINLINE bindPopupMenu_get_item_submenu #-}

-- | Returns the submenu name of the item at index @idx@. See @method add_submenu_item@ for more info on how to add a submenu.
bindPopupMenu_get_item_submenu :: MethodBind
bindPopupMenu_get_item_submenu
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_submenu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the submenu name of the item at index @idx@. See @method add_submenu_item@ for more info on how to add a submenu.
get_item_submenu ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_submenu cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_submenu (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_submenu" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_submenu

{-# NOINLINE bindPopupMenu_get_item_text #-}

-- | Returns the text of the item at index @idx@.
bindPopupMenu_get_item_text :: MethodBind
bindPopupMenu_get_item_text
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the text of the item at index @idx@.
get_item_text ::
                (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_text" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_text

{-# NOINLINE bindPopupMenu_get_item_tooltip #-}

-- | Returns the tooltip associated with the specified index index @idx@.
bindPopupMenu_get_item_tooltip :: MethodBind
bindPopupMenu_get_item_tooltip
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tooltip associated with the specified index index @idx@.
get_item_tooltip ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_get_item_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "get_item_tooltip" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.PopupMenu.get_item_tooltip

{-# NOINLINE bindPopupMenu_get_submenu_popup_delay #-}

-- | Sets the delay time in seconds for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item.
bindPopupMenu_get_submenu_popup_delay :: MethodBind
bindPopupMenu_get_submenu_popup_delay
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "get_submenu_popup_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the delay time in seconds for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item.
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

instance NodeMethod PopupMenu "get_submenu_popup_delay" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.PopupMenu.get_submenu_popup_delay

{-# NOINLINE bindPopupMenu_is_hide_on_checkable_item_selection #-}

-- | If @true@, hides the @PopupMenu@ when a checkbox or radio button is selected.
bindPopupMenu_is_hide_on_checkable_item_selection :: MethodBind
bindPopupMenu_is_hide_on_checkable_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_checkable_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hides the @PopupMenu@ when a checkbox or radio button is selected.
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

instance NodeMethod PopupMenu "is_hide_on_checkable_item_selection"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.PopupMenu.is_hide_on_checkable_item_selection

{-# NOINLINE bindPopupMenu_is_hide_on_item_selection #-}

-- | If @true@, hides the @PopupMenu@ when an item is selected.
bindPopupMenu_is_hide_on_item_selection :: MethodBind
bindPopupMenu_is_hide_on_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hides the @PopupMenu@ when an item is selected.
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

instance NodeMethod PopupMenu "is_hide_on_item_selection" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_hide_on_item_selection

{-# NOINLINE bindPopupMenu_is_hide_on_state_item_selection #-}

-- | If @true@, hides the @PopupMenu@ when a state item is selected.
bindPopupMenu_is_hide_on_state_item_selection :: MethodBind
bindPopupMenu_is_hide_on_state_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_state_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hides the @PopupMenu@ when a state item is selected.
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

instance NodeMethod PopupMenu "is_hide_on_state_item_selection" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_hide_on_state_item_selection

{-# NOINLINE bindPopupMenu_is_hide_on_window_lose_focus #-}

-- | Returns @true@ if the popup will be hidden when the window loses focus or not.
bindPopupMenu_is_hide_on_window_lose_focus :: MethodBind
bindPopupMenu_is_hide_on_window_lose_focus
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_hide_on_window_lose_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the popup will be hidden when the window loses focus or not.
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

instance NodeMethod PopupMenu "is_hide_on_window_lose_focus" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_hide_on_window_lose_focus

{-# NOINLINE bindPopupMenu_is_item_checkable #-}

-- | Returns @true@ if the item at index @idx@ is checkable in some way, i.e. if it has a checkbox or radio button.
--   				__Note:__ Checkable items just display a checkmark or radio button, but don't have any built-in checking behavior and must be checked/unchecked manually.
bindPopupMenu_is_item_checkable :: MethodBind
bindPopupMenu_is_item_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the item at index @idx@ is checkable in some way, i.e. if it has a checkbox or radio button.
--   				__Note:__ Checkable items just display a checkmark or radio button, but don't have any built-in checking behavior and must be checked/unchecked manually.
is_item_checkable ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_checkable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_checkable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "is_item_checkable" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_item_checkable

{-# NOINLINE bindPopupMenu_is_item_checked #-}

-- | Returns @true@ if the item at index @idx@ is checked.
bindPopupMenu_is_item_checked :: MethodBind
bindPopupMenu_is_item_checked
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the item at index @idx@ is checked.
is_item_checked ::
                  (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_checked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_checked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "is_item_checked" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_item_checked

{-# NOINLINE bindPopupMenu_is_item_disabled #-}

-- | Returns @true@ if the item at index @idx@ is disabled. When it is disabled it can't be selected, or its action invoked.
--   				See @method set_item_disabled@ for more info on how to disable an item.
bindPopupMenu_is_item_disabled :: MethodBind
bindPopupMenu_is_item_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the item at index @idx@ is disabled. When it is disabled it can't be selected, or its action invoked.
--   				See @method set_item_disabled@ for more info on how to disable an item.
is_item_disabled ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "is_item_disabled" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_item_disabled

{-# NOINLINE bindPopupMenu_is_item_radio_checkable #-}

-- | Returns @true@ if the item at index @idx@ has radio button-style checkability.
--   				__Note:__ This is purely cosmetic; you must add the logic for checking/unchecking items in radio groups.
bindPopupMenu_is_item_radio_checkable :: MethodBind
bindPopupMenu_is_item_radio_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_radio_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the item at index @idx@ has radio button-style checkability.
--   				__Note:__ This is purely cosmetic; you must add the logic for checking/unchecking items in radio groups.
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

instance NodeMethod PopupMenu "is_item_radio_checkable" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_item_radio_checkable

{-# NOINLINE bindPopupMenu_is_item_separator #-}

-- | Returns @true@ if the item is a separator. If it is, it will be displayed as a line. See @method add_separator@ for more info on how to add a separator.
bindPopupMenu_is_item_separator :: MethodBind
bindPopupMenu_is_item_separator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the item is a separator. If it is, it will be displayed as a line. See @method add_separator@ for more info on how to add a separator.
is_item_separator ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO Bool
is_item_separator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_is_item_separator (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "is_item_separator" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_item_separator

{-# NOINLINE bindPopupMenu_is_item_shortcut_disabled #-}

-- | Returns @true@ if the specified item's shortcut is disabled.
bindPopupMenu_is_item_shortcut_disabled :: MethodBind
bindPopupMenu_is_item_shortcut_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "is_item_shortcut_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified item's shortcut is disabled.
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

instance NodeMethod PopupMenu "is_item_shortcut_disabled" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PopupMenu.is_item_shortcut_disabled

{-# NOINLINE bindPopupMenu_remove_item #-}

-- | Removes the item at index @idx@ from the menu.
--   				__Note:__ The indices of items after the removed item will be shifted by one.
bindPopupMenu_remove_item :: MethodBind
bindPopupMenu_remove_item
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the item at index @idx@ from the menu.
--   				__Note:__ The indices of items after the removed item will be shifted by one.
remove_item ::
              (PopupMenu :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_remove_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "remove_item" '[Int] (IO ()) where
        nodeMethod = Godot.Core.PopupMenu.remove_item

{-# NOINLINE bindPopupMenu_set_allow_search #-}

-- | If @true@, allows navigating @PopupMenu@ with letter keys.
bindPopupMenu_set_allow_search :: MethodBind
bindPopupMenu_set_allow_search
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_allow_search" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, allows navigating @PopupMenu@ with letter keys.
set_allow_search ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_search cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_allow_search (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "set_allow_search" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_allow_search

{-# NOINLINE bindPopupMenu_set_hide_on_checkable_item_selection #-}

-- | If @true@, hides the @PopupMenu@ when a checkbox or radio button is selected.
bindPopupMenu_set_hide_on_checkable_item_selection :: MethodBind
bindPopupMenu_set_hide_on_checkable_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_checkable_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hides the @PopupMenu@ when a checkbox or radio button is selected.
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

instance NodeMethod PopupMenu
           "set_hide_on_checkable_item_selection"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PopupMenu.set_hide_on_checkable_item_selection

{-# NOINLINE bindPopupMenu_set_hide_on_item_selection #-}

-- | If @true@, hides the @PopupMenu@ when an item is selected.
bindPopupMenu_set_hide_on_item_selection :: MethodBind
bindPopupMenu_set_hide_on_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hides the @PopupMenu@ when an item is selected.
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

instance NodeMethod PopupMenu "set_hide_on_item_selection" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_hide_on_item_selection

{-# NOINLINE bindPopupMenu_set_hide_on_state_item_selection #-}

-- | If @true@, hides the @PopupMenu@ when a state item is selected.
bindPopupMenu_set_hide_on_state_item_selection :: MethodBind
bindPopupMenu_set_hide_on_state_item_selection
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_state_item_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hides the @PopupMenu@ when a state item is selected.
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

instance NodeMethod PopupMenu "set_hide_on_state_item_selection"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_hide_on_state_item_selection

{-# NOINLINE bindPopupMenu_set_hide_on_window_lose_focus #-}

-- | Hides the @PopupMenu@ when the window loses focus.
bindPopupMenu_set_hide_on_window_lose_focus :: MethodBind
bindPopupMenu_set_hide_on_window_lose_focus
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_hide_on_window_lose_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Hides the @PopupMenu@ when the window loses focus.
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

instance NodeMethod PopupMenu "set_hide_on_window_lose_focus"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_hide_on_window_lose_focus

{-# NOINLINE bindPopupMenu_set_item_accelerator #-}

-- | Sets the accelerator of the item at index @idx@. Accelerators are special combinations of keys that activate the item, no matter which control is focused.
bindPopupMenu_set_item_accelerator :: MethodBind
bindPopupMenu_set_item_accelerator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_accelerator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the accelerator of the item at index @idx@. Accelerators are special combinations of keys that activate the item, no matter which control is focused.
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

instance NodeMethod PopupMenu "set_item_accelerator" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_accelerator

{-# NOINLINE bindPopupMenu_set_item_as_checkable #-}

-- | Sets whether the item at index @idx@ has a checkbox. If @false@, sets the type of the item to plain text.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
bindPopupMenu_set_item_as_checkable :: MethodBind
bindPopupMenu_set_item_as_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_as_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the item at index @idx@ has a checkbox. If @false@, sets the type of the item to plain text.
--   				__Note:__ Checkable items just display a checkmark, but don't have any built-in checking behavior and must be checked/unchecked manually.
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

instance NodeMethod PopupMenu "set_item_as_checkable" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_as_checkable

{-# NOINLINE bindPopupMenu_set_item_as_radio_checkable #-}

-- | Sets the type of the item at the specified index @idx@ to radio button. If @false@, sets the type of the item to plain text.
bindPopupMenu_set_item_as_radio_checkable :: MethodBind
bindPopupMenu_set_item_as_radio_checkable
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_as_radio_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the type of the item at the specified index @idx@ to radio button. If @false@, sets the type of the item to plain text.
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

instance NodeMethod PopupMenu "set_item_as_radio_checkable"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_as_radio_checkable

{-# NOINLINE bindPopupMenu_set_item_as_separator #-}

-- | Mark the item at index @idx@ as a separator, which means that it would be displayed as a line. If @false@, sets the type of the item to plain text.
bindPopupMenu_set_item_as_separator :: MethodBind
bindPopupMenu_set_item_as_separator
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_as_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mark the item at index @idx@ as a separator, which means that it would be displayed as a line. If @false@, sets the type of the item to plain text.
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

instance NodeMethod PopupMenu "set_item_as_separator" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_as_separator

{-# NOINLINE bindPopupMenu_set_item_checked #-}

-- | Sets the checkstate status of the item at index @idx@.
bindPopupMenu_set_item_checked :: MethodBind
bindPopupMenu_set_item_checked
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the checkstate status of the item at index @idx@.
set_item_checked ::
                   (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_checked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_checked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "set_item_checked" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_checked

{-# NOINLINE bindPopupMenu_set_item_disabled #-}

-- | Enables/disables the item at index @idx@. When it is disabled, it can't be selected and its action can't be invoked.
bindPopupMenu_set_item_disabled :: MethodBind
bindPopupMenu_set_item_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables/disables the item at index @idx@. When it is disabled, it can't be selected and its action can't be invoked.
set_item_disabled ::
                    (PopupMenu :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_item_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "set_item_disabled" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_disabled

{-# NOINLINE bindPopupMenu_set_item_icon #-}

-- | Replaces the @Texture@ icon of the specified @idx@.
bindPopupMenu_set_item_icon :: MethodBind
bindPopupMenu_set_item_icon
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Replaces the @Texture@ icon of the specified @idx@.
set_item_icon ::
                (PopupMenu :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_item_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "set_item_icon" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_icon

{-# NOINLINE bindPopupMenu_set_item_id #-}

-- | Sets the @id@ of the item at index @idx@.
bindPopupMenu_set_item_id :: MethodBind
bindPopupMenu_set_item_id
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @id@ of the item at index @idx@.
set_item_id ::
              (PopupMenu :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_item_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "set_item_id" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_id

{-# NOINLINE bindPopupMenu_set_item_metadata #-}

-- | Sets the metadata of an item, which may be of any type. You can later get it with @method get_item_metadata@, which provides a simple way of assigning context data to items.
bindPopupMenu_set_item_metadata :: MethodBind
bindPopupMenu_set_item_metadata
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the metadata of an item, which may be of any type. You can later get it with @method get_item_metadata@, which provides a simple way of assigning context data to items.
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

instance NodeMethod PopupMenu "set_item_metadata"
           '[Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_metadata

{-# NOINLINE bindPopupMenu_set_item_multistate #-}

-- | Sets the state of a multistate item. See @method add_multistate_item@ for details.
bindPopupMenu_set_item_multistate :: MethodBind
bindPopupMenu_set_item_multistate
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_multistate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the state of a multistate item. See @method add_multistate_item@ for details.
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

instance NodeMethod PopupMenu "set_item_multistate" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_multistate

{-# NOINLINE bindPopupMenu_set_item_shortcut #-}

-- | Sets a @ShortCut@ for the specified item @idx@.
bindPopupMenu_set_item_shortcut :: MethodBind
bindPopupMenu_set_item_shortcut
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a @ShortCut@ for the specified item @idx@.
set_item_shortcut ::
                    (PopupMenu :< cls, Object :< cls) =>
                    cls -> Int -> ShortCut -> Maybe Bool -> IO ()
set_item_shortcut cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopupMenu_set_item_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PopupMenu "set_item_shortcut"
           '[Int, ShortCut, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_shortcut

{-# NOINLINE bindPopupMenu_set_item_shortcut_disabled #-}

-- | Disables the @ShortCut@ of the specified index @idx@.
bindPopupMenu_set_item_shortcut_disabled :: MethodBind
bindPopupMenu_set_item_shortcut_disabled
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_shortcut_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables the @ShortCut@ of the specified index @idx@.
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

instance NodeMethod PopupMenu "set_item_shortcut_disabled"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_shortcut_disabled

{-# NOINLINE bindPopupMenu_set_item_submenu #-}

-- | Sets the submenu of the item at index @idx@. The submenu is the name of a child @PopupMenu@ node that would be shown when the item is clicked.
bindPopupMenu_set_item_submenu :: MethodBind
bindPopupMenu_set_item_submenu
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_submenu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the submenu of the item at index @idx@. The submenu is the name of a child @PopupMenu@ node that would be shown when the item is clicked.
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

instance NodeMethod PopupMenu "set_item_submenu"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_submenu

{-# NOINLINE bindPopupMenu_set_item_text #-}

-- | Sets the text of the item at index @idx@.
bindPopupMenu_set_item_text :: MethodBind
bindPopupMenu_set_item_text
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the text of the item at index @idx@.
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

instance NodeMethod PopupMenu "set_item_text" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_text

{-# NOINLINE bindPopupMenu_set_item_tooltip #-}

-- | Sets the @String@ tooltip of the item at the specified index @idx@.
bindPopupMenu_set_item_tooltip :: MethodBind
bindPopupMenu_set_item_tooltip
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_item_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @String@ tooltip of the item at the specified index @idx@.
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

instance NodeMethod PopupMenu "set_item_tooltip"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_item_tooltip

{-# NOINLINE bindPopupMenu_set_submenu_popup_delay #-}

-- | Sets the delay time in seconds for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item.
bindPopupMenu_set_submenu_popup_delay :: MethodBind
bindPopupMenu_set_submenu_popup_delay
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "set_submenu_popup_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the delay time in seconds for the submenu item to popup on mouse hovering. If the popup menu is added as a child of another (acting as a submenu), it will inherit the delay time of the parent menu item.
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

instance NodeMethod PopupMenu "set_submenu_popup_delay" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.set_submenu_popup_delay

{-# NOINLINE bindPopupMenu_toggle_item_checked #-}

-- | Toggles the check state of the item of the specified index @idx@.
bindPopupMenu_toggle_item_checked :: MethodBind
bindPopupMenu_toggle_item_checked
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "toggle_item_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Toggles the check state of the item of the specified index @idx@.
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

instance NodeMethod PopupMenu "toggle_item_checked" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.toggle_item_checked

{-# NOINLINE bindPopupMenu_toggle_item_multistate #-}

-- | Cycle to the next state of a multistate item. See @method add_multistate_item@ for details.
bindPopupMenu_toggle_item_multistate :: MethodBind
bindPopupMenu_toggle_item_multistate
  = unsafePerformIO $
      withCString "PopupMenu" $
        \ clsNamePtr ->
          withCString "toggle_item_multistate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Cycle to the next state of a multistate item. See @method add_multistate_item@ for details.
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

instance NodeMethod PopupMenu "toggle_item_multistate" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PopupMenu.toggle_item_multistate