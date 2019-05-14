{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TreeItem
       (Godot.Core.TreeItem._ALIGN_RIGHT,
        Godot.Core.TreeItem._CELL_MODE_CUSTOM,
        Godot.Core.TreeItem._CELL_MODE_ICON,
        Godot.Core.TreeItem._CELL_MODE_RANGE,
        Godot.Core.TreeItem._CELL_MODE_STRING,
        Godot.Core.TreeItem._CELL_MODE_CHECK,
        Godot.Core.TreeItem._ALIGN_LEFT, Godot.Core.TreeItem._ALIGN_CENTER,
        Godot.Core.TreeItem.set_cell_mode,
        Godot.Core.TreeItem.get_cell_mode, Godot.Core.TreeItem.set_checked,
        Godot.Core.TreeItem.is_checked, Godot.Core.TreeItem.set_text,
        Godot.Core.TreeItem.get_text, Godot.Core.TreeItem.set_icon,
        Godot.Core.TreeItem.get_icon, Godot.Core.TreeItem.set_icon_region,
        Godot.Core.TreeItem.get_icon_region,
        Godot.Core.TreeItem.set_icon_max_width,
        Godot.Core.TreeItem.get_icon_max_width,
        Godot.Core.TreeItem.set_range, Godot.Core.TreeItem.get_range,
        Godot.Core.TreeItem.set_range_config,
        Godot.Core.TreeItem.get_range_config,
        Godot.Core.TreeItem.set_metadata, Godot.Core.TreeItem.get_metadata,
        Godot.Core.TreeItem.set_custom_draw,
        Godot.Core.TreeItem.set_collapsed,
        Godot.Core.TreeItem.is_collapsed,
        Godot.Core.TreeItem.set_custom_minimum_height,
        Godot.Core.TreeItem.get_custom_minimum_height,
        Godot.Core.TreeItem.get_next, Godot.Core.TreeItem.get_prev,
        Godot.Core.TreeItem.get_parent, Godot.Core.TreeItem.get_children,
        Godot.Core.TreeItem.get_next_visible,
        Godot.Core.TreeItem.get_prev_visible,
        Godot.Core.TreeItem.remove_child,
        Godot.Core.TreeItem.set_selectable,
        Godot.Core.TreeItem.is_selectable, Godot.Core.TreeItem.is_selected,
        Godot.Core.TreeItem.select, Godot.Core.TreeItem.deselect,
        Godot.Core.TreeItem.set_editable, Godot.Core.TreeItem.is_editable,
        Godot.Core.TreeItem.set_custom_color,
        Godot.Core.TreeItem.clear_custom_color,
        Godot.Core.TreeItem.set_custom_bg_color,
        Godot.Core.TreeItem.clear_custom_bg_color,
        Godot.Core.TreeItem.get_custom_bg_color,
        Godot.Core.TreeItem.set_custom_as_button,
        Godot.Core.TreeItem.is_custom_set_as_button,
        Godot.Core.TreeItem.add_button,
        Godot.Core.TreeItem.get_button_count,
        Godot.Core.TreeItem.get_button, Godot.Core.TreeItem.set_button,
        Godot.Core.TreeItem.erase_button,
        Godot.Core.TreeItem.is_button_disabled,
        Godot.Core.TreeItem.set_expand_right,
        Godot.Core.TreeItem.get_expand_right,
        Godot.Core.TreeItem.set_tooltip, Godot.Core.TreeItem.get_tooltip,
        Godot.Core.TreeItem.set_text_align,
        Godot.Core.TreeItem.get_text_align,
        Godot.Core.TreeItem.move_to_top,
        Godot.Core.TreeItem.move_to_bottom,
        Godot.Core.TreeItem.set_disable_folding,
        Godot.Core.TreeItem.is_folding_disabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_CELL_MODE_CUSTOM :: Int
_CELL_MODE_CUSTOM = 4

_CELL_MODE_ICON :: Int
_CELL_MODE_ICON = 3

_CELL_MODE_RANGE :: Int
_CELL_MODE_RANGE = 2

_CELL_MODE_STRING :: Int
_CELL_MODE_STRING = 0

_CELL_MODE_CHECK :: Int
_CELL_MODE_CHECK = 1

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

{-# NOINLINE bindTreeItem_set_cell_mode #-}

-- | Sets the given column's cell mode to [code]mode[/code]. See [code]CELL_MODE_*[/code] constants.
bindTreeItem_set_cell_mode :: MethodBind
bindTreeItem_set_cell_mode
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_cell_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's cell mode to [code]mode[/code]. See [code]CELL_MODE_*[/code] constants.
set_cell_mode ::
                (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_cell_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_cell_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_cell_mode #-}

-- | Returns the column's cell mode. See [code]CELL_MODE_*[/code] constants.
bindTreeItem_get_cell_mode :: MethodBind
bindTreeItem_get_cell_mode
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_cell_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column's cell mode. See [code]CELL_MODE_*[/code] constants.
get_cell_mode ::
                (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Int
get_cell_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_cell_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_checked #-}

-- | If [code]true[/code], the column [code]column[/code] is checked.
bindTreeItem_set_checked :: MethodBind
bindTreeItem_set_checked
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the column [code]column[/code] is checked.
set_checked ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_checked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_checked (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_checked #-}

-- | Returns [code]true[/code] if the given column is checked.
bindTreeItem_is_checked :: MethodBind
bindTreeItem_is_checked
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given column is checked.
is_checked ::
             (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_checked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_checked (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_text #-}

bindTreeItem_set_text :: MethodBind
bindTreeItem_set_text
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_text ::
           (TreeItem :< cls, Object :< cls) =>
           cls -> Int -> GodotString -> IO ()
set_text cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_text #-}

-- | Returns the given column's text.
bindTreeItem_get_text :: MethodBind
bindTreeItem_get_text
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given column's text.
get_text ::
           (TreeItem :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_icon #-}

-- | Sets the given column's icon [Texture].
bindTreeItem_set_icon :: MethodBind
bindTreeItem_set_icon
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's icon [Texture].
set_icon ::
           (TreeItem :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_icon #-}

-- | Returns the given column's icon [Texture]. Error if no icon is set.
bindTreeItem_get_icon :: MethodBind
bindTreeItem_get_icon
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given column's icon [Texture]. Error if no icon is set.
get_icon ::
           (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Texture
get_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_icon_region #-}

-- | Sets the given column's icon's texture region.
bindTreeItem_set_icon_region :: MethodBind
bindTreeItem_set_icon_region
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's icon's texture region.
set_icon_region ::
                  (TreeItem :< cls, Object :< cls) => cls -> Int -> Rect2 -> IO ()
set_icon_region cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_icon_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_icon_region #-}

-- | Returns the icon [Texture] region as [Rect2].
bindTreeItem_get_icon_region :: MethodBind
bindTreeItem_get_icon_region
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon [Texture] region as [Rect2].
get_icon_region ::
                  (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Rect2
get_icon_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_icon_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_icon_max_width #-}

-- | Sets the given column's icon's maximum width.
bindTreeItem_set_icon_max_width :: MethodBind
bindTreeItem_set_icon_max_width
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_icon_max_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's icon's maximum width.
set_icon_max_width ::
                     (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_icon_max_width cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_icon_max_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_icon_max_width #-}

-- | Returns the column's icon's maximum width.
bindTreeItem_get_icon_max_width :: MethodBind
bindTreeItem_get_icon_max_width
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_icon_max_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column's icon's maximum width.
get_icon_max_width ::
                     (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Int
get_icon_max_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_icon_max_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_range #-}

bindTreeItem_set_range :: MethodBind
bindTreeItem_set_range
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_range ::
            (TreeItem :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_range cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_range (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_range #-}

bindTreeItem_get_range :: MethodBind
bindTreeItem_get_range
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_range ::
            (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Float
get_range cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_range (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_range_config #-}

bindTreeItem_set_range_config :: MethodBind
bindTreeItem_set_range_config
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_range_config" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_range_config ::
                   (TreeItem :< cls, Object :< cls) =>
                   cls -> Int -> Float -> Float -> Float -> Bool -> IO ()
set_range_config cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_range_config (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_range_config #-}

bindTreeItem_get_range_config :: MethodBind
bindTreeItem_get_range_config
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_range_config" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_range_config ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Dictionary
get_range_config cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_range_config (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_metadata #-}

bindTreeItem_set_metadata :: MethodBind
bindTreeItem_set_metadata
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_metadata ::
               (TreeItem :< cls, Object :< cls) =>
               cls -> Int -> GodotVariant -> IO ()
set_metadata cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_metadata #-}

bindTreeItem_get_metadata :: MethodBind
bindTreeItem_get_metadata
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_metadata ::
               (TreeItem :< cls, Object :< cls) => cls -> Int -> IO GodotVariant
get_metadata cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_metadata (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_custom_draw #-}

-- | Sets the given column's custom draw callback to [code]callback[/code] method on [code]object[/code].
--   				The [code]callback[/code] should accept two arguments: the [TreeItem] that is drawn and its position and size as a [Rect2].
bindTreeItem_set_custom_draw :: MethodBind
bindTreeItem_set_custom_draw
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_custom_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's custom draw callback to [code]callback[/code] method on [code]object[/code].
--   				The [code]callback[/code] should accept two arguments: the [TreeItem] that is drawn and its position and size as a [Rect2].
set_custom_draw ::
                  (TreeItem :< cls, Object :< cls) =>
                  cls -> Int -> Object -> GodotString -> IO ()
set_custom_draw cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_custom_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_collapsed #-}

-- | If [code]true[/code], the TreeItem is collapsed.
bindTreeItem_set_collapsed :: MethodBind
bindTreeItem_set_collapsed
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_collapsed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the TreeItem is collapsed.
set_collapsed ::
                (TreeItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collapsed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_collapsed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_collapsed #-}

-- | If [code]true[/code], the TreeItem is collapsed.
bindTreeItem_is_collapsed :: MethodBind
bindTreeItem_is_collapsed
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_collapsed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the TreeItem is collapsed.
is_collapsed :: (TreeItem :< cls, Object :< cls) => cls -> IO Bool
is_collapsed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_collapsed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_custom_minimum_height #-}

-- | The custom minimum height.
bindTreeItem_set_custom_minimum_height :: MethodBind
bindTreeItem_set_custom_minimum_height
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_custom_minimum_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom minimum height.
set_custom_minimum_height ::
                            (TreeItem :< cls, Object :< cls) => cls -> Int -> IO ()
set_custom_minimum_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_custom_minimum_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_custom_minimum_height #-}

-- | The custom minimum height.
bindTreeItem_get_custom_minimum_height :: MethodBind
bindTreeItem_get_custom_minimum_height
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_custom_minimum_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom minimum height.
get_custom_minimum_height ::
                            (TreeItem :< cls, Object :< cls) => cls -> IO Int
get_custom_minimum_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_custom_minimum_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_next #-}

-- | Returns the next TreeItem in the tree.
bindTreeItem_get_next :: MethodBind
bindTreeItem_get_next
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next TreeItem in the tree.
get_next :: (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_next cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_next (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_prev #-}

-- | Returns the previous TreeItem in the tree.
bindTreeItem_get_prev :: MethodBind
bindTreeItem_get_prev
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_prev" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the previous TreeItem in the tree.
get_prev :: (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_prev cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_prev (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_parent #-}

-- | Returns the parent TreeItem.
bindTreeItem_get_parent :: MethodBind
bindTreeItem_get_parent
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent TreeItem.
get_parent ::
             (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_parent (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_children #-}

-- | Returns the TreeItem's child items.
bindTreeItem_get_children :: MethodBind
bindTreeItem_get_children
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_children" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the TreeItem's child items.
get_children ::
               (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_children cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_children (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_next_visible #-}

-- | Returns the next visible TreeItem in the tree.
bindTreeItem_get_next_visible :: MethodBind
bindTreeItem_get_next_visible
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_next_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next visible TreeItem in the tree.
get_next_visible ::
                   (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_next_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_next_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_prev_visible #-}

-- | Returns the previous visible TreeItem in the tree.
bindTreeItem_get_prev_visible :: MethodBind
bindTreeItem_get_prev_visible
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_prev_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the previous visible TreeItem in the tree.
get_prev_visible ::
                   (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_prev_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_prev_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_remove_child #-}

-- | Removes the given child TreeItem.
bindTreeItem_remove_child :: MethodBind
bindTreeItem_remove_child
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "remove_child" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given child TreeItem.
remove_child ::
               (TreeItem :< cls, Object :< cls) => cls -> Object -> IO ()
remove_child cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_remove_child (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_selectable #-}

-- | If [code]true[/code], the given column is selectable.
bindTreeItem_set_selectable :: MethodBind
bindTreeItem_set_selectable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the given column is selectable.
set_selectable ::
                 (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_selectable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_selectable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_selectable #-}

-- | Returns [code]true[/code] if column [code]column[/code] is selectable.
bindTreeItem_is_selectable :: MethodBind
bindTreeItem_is_selectable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if column [code]column[/code] is selectable.
is_selectable ::
                (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_selectable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_selectable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_selected #-}

-- | Returns [code]true[/code] if column [code]column[/code] is selected.
bindTreeItem_is_selected :: MethodBind
bindTreeItem_is_selected
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if column [code]column[/code] is selected.
is_selected ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_selected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_select #-}

-- | Selects the column [code]column[/code].
bindTreeItem_select :: MethodBind
bindTreeItem_select
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects the column [code]column[/code].
select :: (TreeItem :< cls, Object :< cls) => cls -> Int -> IO ()
select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_deselect #-}

-- | Deselects the given column.
bindTreeItem_deselect :: MethodBind
bindTreeItem_deselect
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "deselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deselects the given column.
deselect :: (TreeItem :< cls, Object :< cls) => cls -> Int -> IO ()
deselect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_deselect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_editable #-}

-- | If [code]true[/code], column [code]column[/code] is editable.
bindTreeItem_set_editable :: MethodBind
bindTreeItem_set_editable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], column [code]column[/code] is editable.
set_editable ::
               (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_editable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_editable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_editable #-}

-- | Returns [code]true[/code] if column [code]column[/code] is editable.
bindTreeItem_is_editable :: MethodBind
bindTreeItem_is_editable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if column [code]column[/code] is editable.
is_editable ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_custom_color #-}

-- | Sets the given column's custom color.
bindTreeItem_set_custom_color :: MethodBind
bindTreeItem_set_custom_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_custom_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's custom color.
set_custom_color ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_custom_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_custom_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_clear_custom_color #-}

-- | Resets the color for the given column to default.
bindTreeItem_clear_custom_color :: MethodBind
bindTreeItem_clear_custom_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "clear_custom_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets the color for the given column to default.
clear_custom_color ::
                     (TreeItem :< cls, Object :< cls) => cls -> Int -> IO ()
clear_custom_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_clear_custom_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_custom_bg_color #-}

-- | Sets the given column's custom background color and whether to just use it as an outline.
bindTreeItem_set_custom_bg_color :: MethodBind
bindTreeItem_set_custom_bg_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's custom background color and whether to just use it as an outline.
set_custom_bg_color ::
                      (TreeItem :< cls, Object :< cls) =>
                      cls -> Int -> Color -> Bool -> IO ()
set_custom_bg_color cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_custom_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_clear_custom_bg_color #-}

-- | Resets the background color for the given column to default.
bindTreeItem_clear_custom_bg_color :: MethodBind
bindTreeItem_clear_custom_bg_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "clear_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets the background color for the given column to default.
clear_custom_bg_color ::
                        (TreeItem :< cls, Object :< cls) => cls -> Int -> IO ()
clear_custom_bg_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_clear_custom_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_custom_bg_color #-}

-- | Returns the custom background color of column [code]column[/code].
bindTreeItem_get_custom_bg_color :: MethodBind
bindTreeItem_get_custom_bg_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom background color of column [code]column[/code].
get_custom_bg_color ::
                      (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Color
get_custom_bg_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_custom_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_custom_as_button #-}

bindTreeItem_set_custom_as_button :: MethodBind
bindTreeItem_set_custom_as_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_custom_as_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_custom_as_button ::
                       (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_custom_as_button cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_custom_as_button
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_custom_set_as_button #-}

bindTreeItem_is_custom_set_as_button :: MethodBind
bindTreeItem_is_custom_set_as_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_custom_set_as_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_custom_set_as_button ::
                          (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_custom_set_as_button cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_custom_set_as_button
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_add_button #-}

-- | Adds a button with [Texture] [code]button[/code] at column [code]column[/code]. The [code]button_idx[/code] index is used to identify the button when calling other methods. If not specified, the next available index is used, which may be retrieved by calling [method get_button_count] immediately after this method. Optionally, the button can be [code]disabled[/code] and have a [code]tooltip[/code].
bindTreeItem_add_button :: MethodBind
bindTreeItem_add_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "add_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a button with [Texture] [code]button[/code] at column [code]column[/code]. The [code]button_idx[/code] index is used to identify the button when calling other methods. If not specified, the next available index is used, which may be retrieved by calling [method get_button_count] immediately after this method. Optionally, the button can be [code]disabled[/code] and have a [code]tooltip[/code].
add_button ::
             (TreeItem :< cls, Object :< cls) =>
             cls -> Int -> Texture -> Int -> Bool -> GodotString -> IO ()
add_button cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_add_button (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_button_count #-}

-- | Returns the number of buttons in column [code]column[/code]. May be used to get the most recently added button's index, if no index was specified.
bindTreeItem_get_button_count :: MethodBind
bindTreeItem_get_button_count
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_button_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of buttons in column [code]column[/code]. May be used to get the most recently added button's index, if no index was specified.
get_button_count ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Int
get_button_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_button_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_button #-}

-- | Returns the [Texture] of the button at index [code]button_idx[/code] in column [code]column[/code].
bindTreeItem_get_button :: MethodBind
bindTreeItem_get_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Texture] of the button at index [code]button_idx[/code] in column [code]column[/code].
get_button ::
             (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO Texture
get_button cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_button (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_button #-}

-- | Sets the given column's button [Texture] at index [code]button_idx[/code] to [code]button[/code].
bindTreeItem_set_button :: MethodBind
bindTreeItem_set_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's button [Texture] at index [code]button_idx[/code] to [code]button[/code].
set_button ::
             (TreeItem :< cls, Object :< cls) =>
             cls -> Int -> Int -> Texture -> IO ()
set_button cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_button (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_erase_button #-}

-- | Removes the button at index [code]button_idx[/code] in column [code]column[/code].
bindTreeItem_erase_button :: MethodBind
bindTreeItem_erase_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "erase_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the button at index [code]button_idx[/code] in column [code]column[/code].
erase_button ::
               (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
erase_button cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_erase_button (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_button_disabled #-}

-- | Returns [code]true[/code] if the button at index [code]button_idx[/code] for the given column is disabled.
bindTreeItem_is_button_disabled :: MethodBind
bindTreeItem_is_button_disabled
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_button_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the button at index [code]button_idx[/code] for the given column is disabled.
is_button_disabled ::
                     (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_button_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_button_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_expand_right #-}

-- | If [code]true[/code], column [code]column[/code] is expanded to the right.
bindTreeItem_set_expand_right :: MethodBind
bindTreeItem_set_expand_right
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_expand_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], column [code]column[/code] is expanded to the right.
set_expand_right ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_expand_right cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_expand_right (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_expand_right #-}

-- | Returns [code]true[/code] if [code]expand_right[/code] is set.
bindTreeItem_get_expand_right :: MethodBind
bindTreeItem_get_expand_right
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_expand_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [code]expand_right[/code] is set.
get_expand_right ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
get_expand_right cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_expand_right (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_tooltip #-}

-- | Sets the given column's tooltip text.
bindTreeItem_set_tooltip :: MethodBind
bindTreeItem_set_tooltip
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's tooltip text.
set_tooltip ::
              (TreeItem :< cls, Object :< cls) =>
              cls -> Int -> GodotString -> IO ()
set_tooltip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_tooltip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_tooltip #-}

-- | Returns the given column's tooltip.
bindTreeItem_get_tooltip :: MethodBind
bindTreeItem_get_tooltip
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given column's tooltip.
get_tooltip ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_tooltip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_tooltip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_text_align #-}

-- | Sets the given column's text alignment. See [code]ALIGN_*[/code] constants.
bindTreeItem_set_text_align :: MethodBind
bindTreeItem_set_text_align
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_text_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's text alignment. See [code]ALIGN_*[/code] constants.
set_text_align ::
                 (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_text_align cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_text_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_get_text_align #-}

-- | Returns the given column's text alignment.
bindTreeItem_get_text_align :: MethodBind
bindTreeItem_get_text_align
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_text_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given column's text alignment.
get_text_align ::
                 (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Int
get_text_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_text_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_move_to_top #-}

-- | Moves this TreeItem to the top in the [Tree] hierarchy.
bindTreeItem_move_to_top :: MethodBind
bindTreeItem_move_to_top
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "move_to_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves this TreeItem to the top in the [Tree] hierarchy.
move_to_top :: (TreeItem :< cls, Object :< cls) => cls -> IO ()
move_to_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_move_to_top (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_move_to_bottom #-}

-- | Moves this TreeItem to the bottom in the [Tree] hierarchy.
bindTreeItem_move_to_bottom :: MethodBind
bindTreeItem_move_to_bottom
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "move_to_bottom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves this TreeItem to the bottom in the [Tree] hierarchy.
move_to_bottom :: (TreeItem :< cls, Object :< cls) => cls -> IO ()
move_to_bottom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_move_to_bottom (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_set_disable_folding #-}

-- | If [code]true[/code], folding is disabled for this TreeItem.
bindTreeItem_set_disable_folding :: MethodBind
bindTreeItem_set_disable_folding
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_disable_folding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], folding is disabled for this TreeItem.
set_disable_folding ::
                      (TreeItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_folding cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_disable_folding
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTreeItem_is_folding_disabled #-}

-- | If [code]true[/code], folding is disabled for this TreeItem.
bindTreeItem_is_folding_disabled :: MethodBind
bindTreeItem_is_folding_disabled
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_folding_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], folding is disabled for this TreeItem.
is_folding_disabled ::
                      (TreeItem :< cls, Object :< cls) => cls -> IO Bool
is_folding_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_folding_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)