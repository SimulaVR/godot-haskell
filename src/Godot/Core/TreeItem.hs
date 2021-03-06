{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TreeItem
       (Godot.Core.TreeItem._ALIGN_RIGHT,
        Godot.Core.TreeItem._CELL_MODE_CUSTOM,
        Godot.Core.TreeItem._CELL_MODE_ICON,
        Godot.Core.TreeItem._CELL_MODE_RANGE,
        Godot.Core.TreeItem._CELL_MODE_STRING,
        Godot.Core.TreeItem._CELL_MODE_CHECK,
        Godot.Core.TreeItem._ALIGN_LEFT, Godot.Core.TreeItem._ALIGN_CENTER,
        Godot.Core.TreeItem.add_button, Godot.Core.TreeItem.call_recursive,
        Godot.Core.TreeItem.clear_custom_bg_color,
        Godot.Core.TreeItem.clear_custom_color,
        Godot.Core.TreeItem.deselect, Godot.Core.TreeItem.erase_button,
        Godot.Core.TreeItem.get_button,
        Godot.Core.TreeItem.get_button_count,
        Godot.Core.TreeItem.get_button_tooltip,
        Godot.Core.TreeItem.get_cell_mode,
        Godot.Core.TreeItem.get_children,
        Godot.Core.TreeItem.get_custom_bg_color,
        Godot.Core.TreeItem.get_custom_color,
        Godot.Core.TreeItem.get_custom_minimum_height,
        Godot.Core.TreeItem.get_expand_right, Godot.Core.TreeItem.get_icon,
        Godot.Core.TreeItem.get_icon_max_width,
        Godot.Core.TreeItem.get_icon_modulate,
        Godot.Core.TreeItem.get_icon_region,
        Godot.Core.TreeItem.get_metadata, Godot.Core.TreeItem.get_next,
        Godot.Core.TreeItem.get_next_visible,
        Godot.Core.TreeItem.get_parent, Godot.Core.TreeItem.get_prev,
        Godot.Core.TreeItem.get_prev_visible,
        Godot.Core.TreeItem.get_range,
        Godot.Core.TreeItem.get_range_config, Godot.Core.TreeItem.get_text,
        Godot.Core.TreeItem.get_text_align,
        Godot.Core.TreeItem.get_tooltip,
        Godot.Core.TreeItem.is_button_disabled,
        Godot.Core.TreeItem.is_checked, Godot.Core.TreeItem.is_collapsed,
        Godot.Core.TreeItem.is_custom_set_as_button,
        Godot.Core.TreeItem.is_editable,
        Godot.Core.TreeItem.is_folding_disabled,
        Godot.Core.TreeItem.is_selectable, Godot.Core.TreeItem.is_selected,
        Godot.Core.TreeItem.move_to_bottom,
        Godot.Core.TreeItem.move_to_top, Godot.Core.TreeItem.remove_child,
        Godot.Core.TreeItem.select, Godot.Core.TreeItem.set_button,
        Godot.Core.TreeItem.set_button_disabled,
        Godot.Core.TreeItem.set_cell_mode, Godot.Core.TreeItem.set_checked,
        Godot.Core.TreeItem.set_collapsed,
        Godot.Core.TreeItem.set_custom_as_button,
        Godot.Core.TreeItem.set_custom_bg_color,
        Godot.Core.TreeItem.set_custom_color,
        Godot.Core.TreeItem.set_custom_draw,
        Godot.Core.TreeItem.set_custom_minimum_height,
        Godot.Core.TreeItem.set_disable_folding,
        Godot.Core.TreeItem.set_editable,
        Godot.Core.TreeItem.set_expand_right, Godot.Core.TreeItem.set_icon,
        Godot.Core.TreeItem.set_icon_max_width,
        Godot.Core.TreeItem.set_icon_modulate,
        Godot.Core.TreeItem.set_icon_region,
        Godot.Core.TreeItem.set_metadata, Godot.Core.TreeItem.set_range,
        Godot.Core.TreeItem.set_range_config,
        Godot.Core.TreeItem.set_selectable, Godot.Core.TreeItem.set_text,
        Godot.Core.TreeItem.set_text_align,
        Godot.Core.TreeItem.set_tooltip)
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
import Godot.Core.Object()

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

instance NodeProperty TreeItem "collapsed" Bool 'False where
        nodeProperty
          = (is_collapsed, wrapDroppingSetter set_collapsed, Nothing)

instance NodeProperty TreeItem "custom_minimum_height" Int 'False
         where
        nodeProperty
          = (get_custom_minimum_height,
             wrapDroppingSetter set_custom_minimum_height, Nothing)

instance NodeProperty TreeItem "disable_folding" Bool 'False where
        nodeProperty
          = (is_folding_disabled, wrapDroppingSetter set_disable_folding,
             Nothing)

{-# NOINLINE bindTreeItem_add_button #-}

-- | Adds a button with @Texture@ @button@ at column @column@. The @button_idx@ index is used to identify the button when calling other methods. If not specified, the next available index is used, which may be retrieved by calling @method get_button_count@ immediately after this method. Optionally, the button can be @disabled@ and have a @tooltip@.
bindTreeItem_add_button :: MethodBind
bindTreeItem_add_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "add_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a button with @Texture@ @button@ at column @column@. The @button_idx@ index is used to identify the button when calling other methods. If not specified, the next available index is used, which may be retrieved by calling @method get_button_count@ immediately after this method. Optionally, the button can be @disabled@ and have a @tooltip@.
add_button ::
             (TreeItem :< cls, Object :< cls) =>
             cls ->
               Int ->
                 Texture -> Maybe Int -> Maybe Bool -> Maybe GodotString -> IO ()
add_button cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       defaultedVariant VariantString "" arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_add_button (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "add_button"
           '[Int, Texture, Maybe Int, Maybe Bool, Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.add_button

{-# NOINLINE bindTreeItem_call_recursive #-}

-- | Calls the @method@ on the actual TreeItem and its children recursively. Pass parameters as a comma separated list.
bindTreeItem_call_recursive :: MethodBind
bindTreeItem_call_recursive
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "call_recursive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the @method@ on the actual TreeItem and its children recursively. Pass parameters as a comma separated list.
call_recursive ::
                 (TreeItem :< cls, Object :< cls) =>
                 cls -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
call_recursive cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_call_recursive (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "call_recursive"
           '[GodotString, [Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.TreeItem.call_recursive

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

instance NodeMethod TreeItem "clear_custom_bg_color" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.clear_custom_bg_color

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

instance NodeMethod TreeItem "clear_custom_color" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.clear_custom_color

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

instance NodeMethod TreeItem "deselect" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TreeItem.deselect

{-# NOINLINE bindTreeItem_erase_button #-}

-- | Removes the button at index @button_idx@ in column @column@.
bindTreeItem_erase_button :: MethodBind
bindTreeItem_erase_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "erase_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the button at index @button_idx@ in column @column@.
erase_button ::
               (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
erase_button cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_erase_button (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "erase_button" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.erase_button

{-# NOINLINE bindTreeItem_get_button #-}

-- | Returns the @Texture@ of the button at index @button_idx@ in column @column@.
bindTreeItem_get_button :: MethodBind
bindTreeItem_get_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Texture@ of the button at index @button_idx@ in column @column@.
get_button ::
             (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO Texture
get_button cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_button (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_button" '[Int, Int] (IO Texture)
         where
        nodeMethod = Godot.Core.TreeItem.get_button

{-# NOINLINE bindTreeItem_get_button_count #-}

-- | Returns the number of buttons in column @column@. May be used to get the most recently added button's index, if no index was specified.
bindTreeItem_get_button_count :: MethodBind
bindTreeItem_get_button_count
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_button_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of buttons in column @column@. May be used to get the most recently added button's index, if no index was specified.
get_button_count ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Int
get_button_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_button_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_button_count" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TreeItem.get_button_count

{-# NOINLINE bindTreeItem_get_button_tooltip #-}

-- | Returns the tooltip string for the button at index @button_idx@ in column @column@.
bindTreeItem_get_button_tooltip :: MethodBind
bindTreeItem_get_button_tooltip
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_button_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tooltip string for the button at index @button_idx@ in column @column@.
get_button_tooltip ::
                     (TreeItem :< cls, Object :< cls) =>
                     cls -> Int -> Int -> IO GodotString
get_button_tooltip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_button_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_button_tooltip" '[Int, Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.TreeItem.get_button_tooltip

{-# NOINLINE bindTreeItem_get_cell_mode #-}

-- | Returns the column's cell mode.
bindTreeItem_get_cell_mode :: MethodBind
bindTreeItem_get_cell_mode
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_cell_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column's cell mode.
get_cell_mode ::
                (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Int
get_cell_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_cell_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_cell_mode" '[Int] (IO Int) where
        nodeMethod = Godot.Core.TreeItem.get_cell_mode

{-# NOINLINE bindTreeItem_get_children #-}

-- | Returns the TreeItem's first child item or a null object if there is none.
bindTreeItem_get_children :: MethodBind
bindTreeItem_get_children
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_children" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the TreeItem's first child item or a null object if there is none.
get_children ::
               (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_children cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_children (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_children" '[] (IO TreeItem) where
        nodeMethod = Godot.Core.TreeItem.get_children

{-# NOINLINE bindTreeItem_get_custom_bg_color #-}

-- | Returns the custom background color of column @column@.
bindTreeItem_get_custom_bg_color :: MethodBind
bindTreeItem_get_custom_bg_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_custom_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom background color of column @column@.
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

instance NodeMethod TreeItem "get_custom_bg_color" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.TreeItem.get_custom_bg_color

{-# NOINLINE bindTreeItem_get_custom_color #-}

-- | Returns the custom color of column @column@.
bindTreeItem_get_custom_color :: MethodBind
bindTreeItem_get_custom_color
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_custom_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom color of column @column@.
get_custom_color ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Color
get_custom_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_custom_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_custom_color" '[Int] (IO Color)
         where
        nodeMethod = Godot.Core.TreeItem.get_custom_color

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

instance NodeMethod TreeItem "get_custom_minimum_height" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.TreeItem.get_custom_minimum_height

{-# NOINLINE bindTreeItem_get_expand_right #-}

-- | Returns @true@ if @expand_right@ is set.
bindTreeItem_get_expand_right :: MethodBind
bindTreeItem_get_expand_right
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_expand_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @expand_right@ is set.
get_expand_right ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
get_expand_right cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_expand_right (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_expand_right" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.TreeItem.get_expand_right

{-# NOINLINE bindTreeItem_get_icon #-}

-- | Returns the given column's icon @Texture@. Error if no icon is set.
bindTreeItem_get_icon :: MethodBind
bindTreeItem_get_icon
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given column's icon @Texture@. Error if no icon is set.
get_icon ::
           (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Texture
get_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_icon" '[Int] (IO Texture) where
        nodeMethod = Godot.Core.TreeItem.get_icon

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

instance NodeMethod TreeItem "get_icon_max_width" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TreeItem.get_icon_max_width

{-# NOINLINE bindTreeItem_get_icon_modulate #-}

-- | Returns the @Color@ modulating the column's icon.
bindTreeItem_get_icon_modulate :: MethodBind
bindTreeItem_get_icon_modulate
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_icon_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Color@ modulating the column's icon.
get_icon_modulate ::
                    (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Color
get_icon_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_icon_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_icon_modulate" '[Int] (IO Color)
         where
        nodeMethod = Godot.Core.TreeItem.get_icon_modulate

{-# NOINLINE bindTreeItem_get_icon_region #-}

-- | Returns the icon @Texture@ region as @Rect2@.
bindTreeItem_get_icon_region :: MethodBind
bindTreeItem_get_icon_region
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_icon_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon @Texture@ region as @Rect2@.
get_icon_region ::
                  (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Rect2
get_icon_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_icon_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_icon_region" '[Int] (IO Rect2)
         where
        nodeMethod = Godot.Core.TreeItem.get_icon_region

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

instance NodeMethod TreeItem "get_metadata" '[Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.TreeItem.get_metadata

{-# NOINLINE bindTreeItem_get_next #-}

-- | Returns the next TreeItem in the tree or a null object if there is none.
bindTreeItem_get_next :: MethodBind
bindTreeItem_get_next
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next TreeItem in the tree or a null object if there is none.
get_next :: (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_next cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_next (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_next" '[] (IO TreeItem) where
        nodeMethod = Godot.Core.TreeItem.get_next

{-# NOINLINE bindTreeItem_get_next_visible #-}

-- | Returns the next visible TreeItem in the tree or a null object if there is none.
--   				If @wrap@ is enabled, the method will wrap around to the first visible element in the tree when called on the last visible element, otherwise it returns @null@.
bindTreeItem_get_next_visible :: MethodBind
bindTreeItem_get_next_visible
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_next_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next visible TreeItem in the tree or a null object if there is none.
--   				If @wrap@ is enabled, the method will wrap around to the first visible element in the tree when called on the last visible element, otherwise it returns @null@.
get_next_visible ::
                   (TreeItem :< cls, Object :< cls) =>
                   cls -> Maybe Bool -> IO TreeItem
get_next_visible cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_next_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_next_visible" '[Maybe Bool]
           (IO TreeItem)
         where
        nodeMethod = Godot.Core.TreeItem.get_next_visible

{-# NOINLINE bindTreeItem_get_parent #-}

-- | Returns the parent TreeItem or a null object if there is none.
bindTreeItem_get_parent :: MethodBind
bindTreeItem_get_parent
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent TreeItem or a null object if there is none.
get_parent ::
             (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_parent (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_parent" '[] (IO TreeItem) where
        nodeMethod = Godot.Core.TreeItem.get_parent

{-# NOINLINE bindTreeItem_get_prev #-}

-- | Returns the previous TreeItem in the tree or a null object if there is none.
bindTreeItem_get_prev :: MethodBind
bindTreeItem_get_prev
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_prev" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the previous TreeItem in the tree or a null object if there is none.
get_prev :: (TreeItem :< cls, Object :< cls) => cls -> IO TreeItem
get_prev cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_prev (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_prev" '[] (IO TreeItem) where
        nodeMethod = Godot.Core.TreeItem.get_prev

{-# NOINLINE bindTreeItem_get_prev_visible #-}

-- | Returns the previous visible TreeItem in the tree or a null object if there is none.
--   				If @wrap@ is enabled, the method will wrap around to the last visible element in the tree when called on the first visible element, otherwise it returns @null@.
bindTreeItem_get_prev_visible :: MethodBind
bindTreeItem_get_prev_visible
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "get_prev_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the previous visible TreeItem in the tree or a null object if there is none.
--   				If @wrap@ is enabled, the method will wrap around to the last visible element in the tree when called on the first visible element, otherwise it returns @null@.
get_prev_visible ::
                   (TreeItem :< cls, Object :< cls) =>
                   cls -> Maybe Bool -> IO TreeItem
get_prev_visible cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_get_prev_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "get_prev_visible" '[Maybe Bool]
           (IO TreeItem)
         where
        nodeMethod = Godot.Core.TreeItem.get_prev_visible

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

instance NodeMethod TreeItem "get_range" '[Int] (IO Float) where
        nodeMethod = Godot.Core.TreeItem.get_range

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

instance NodeMethod TreeItem "get_range_config" '[Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.TreeItem.get_range_config

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

instance NodeMethod TreeItem "get_text" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.TreeItem.get_text

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

instance NodeMethod TreeItem "get_text_align" '[Int] (IO Int) where
        nodeMethod = Godot.Core.TreeItem.get_text_align

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

instance NodeMethod TreeItem "get_tooltip" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.TreeItem.get_tooltip

{-# NOINLINE bindTreeItem_is_button_disabled #-}

-- | Returns @true@ if the button at index @button_idx@ for the given column is disabled.
bindTreeItem_is_button_disabled :: MethodBind
bindTreeItem_is_button_disabled
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_button_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the button at index @button_idx@ for the given column is disabled.
is_button_disabled ::
                     (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_button_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_button_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "is_button_disabled" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TreeItem.is_button_disabled

{-# NOINLINE bindTreeItem_is_checked #-}

-- | Returns @true@ if the given column is checked.
bindTreeItem_is_checked :: MethodBind
bindTreeItem_is_checked
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given column is checked.
is_checked ::
             (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_checked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_checked (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "is_checked" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.TreeItem.is_checked

{-# NOINLINE bindTreeItem_is_collapsed #-}

-- | If @true@, the TreeItem is collapsed.
bindTreeItem_is_collapsed :: MethodBind
bindTreeItem_is_collapsed
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_collapsed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the TreeItem is collapsed.
is_collapsed :: (TreeItem :< cls, Object :< cls) => cls -> IO Bool
is_collapsed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_collapsed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "is_collapsed" '[] (IO Bool) where
        nodeMethod = Godot.Core.TreeItem.is_collapsed

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

instance NodeMethod TreeItem "is_custom_set_as_button" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TreeItem.is_custom_set_as_button

{-# NOINLINE bindTreeItem_is_editable #-}

-- | Returns @true@ if column @column@ is editable.
bindTreeItem_is_editable :: MethodBind
bindTreeItem_is_editable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if column @column@ is editable.
is_editable ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "is_editable" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.TreeItem.is_editable

{-# NOINLINE bindTreeItem_is_folding_disabled #-}

-- | If @true@, folding is disabled for this TreeItem.
bindTreeItem_is_folding_disabled :: MethodBind
bindTreeItem_is_folding_disabled
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_folding_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, folding is disabled for this TreeItem.
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

instance NodeMethod TreeItem "is_folding_disabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.TreeItem.is_folding_disabled

{-# NOINLINE bindTreeItem_is_selectable #-}

-- | Returns @true@ if column @column@ is selectable.
bindTreeItem_is_selectable :: MethodBind
bindTreeItem_is_selectable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if column @column@ is selectable.
is_selectable ::
                (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_selectable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_selectable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "is_selectable" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.TreeItem.is_selectable

{-# NOINLINE bindTreeItem_is_selected #-}

-- | Returns @true@ if column @column@ is selected.
bindTreeItem_is_selected :: MethodBind
bindTreeItem_is_selected
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "is_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if column @column@ is selected.
is_selected ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> IO Bool
is_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_is_selected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "is_selected" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.TreeItem.is_selected

{-# NOINLINE bindTreeItem_move_to_bottom #-}

-- | Moves this TreeItem to the bottom in the @Tree@ hierarchy.
bindTreeItem_move_to_bottom :: MethodBind
bindTreeItem_move_to_bottom
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "move_to_bottom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves this TreeItem to the bottom in the @Tree@ hierarchy.
move_to_bottom :: (TreeItem :< cls, Object :< cls) => cls -> IO ()
move_to_bottom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_move_to_bottom (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "move_to_bottom" '[] (IO ()) where
        nodeMethod = Godot.Core.TreeItem.move_to_bottom

{-# NOINLINE bindTreeItem_move_to_top #-}

-- | Moves this TreeItem to the top in the @Tree@ hierarchy.
bindTreeItem_move_to_top :: MethodBind
bindTreeItem_move_to_top
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "move_to_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves this TreeItem to the top in the @Tree@ hierarchy.
move_to_top :: (TreeItem :< cls, Object :< cls) => cls -> IO ()
move_to_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_move_to_top (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "move_to_top" '[] (IO ()) where
        nodeMethod = Godot.Core.TreeItem.move_to_top

{-# NOINLINE bindTreeItem_remove_child #-}

-- | Removes the given child @TreeItem@ and all its children from the @Tree@. Note that it doesn't free the item from memory, so it can be reused later. To completely remove a @TreeItem@ use @method Object.free@.
bindTreeItem_remove_child :: MethodBind
bindTreeItem_remove_child
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "remove_child" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given child @TreeItem@ and all its children from the @Tree@. Note that it doesn't free the item from memory, so it can be reused later. To completely remove a @TreeItem@ use @method Object.free@.
remove_child ::
               (TreeItem :< cls, Object :< cls) => cls -> Object -> IO ()
remove_child cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_remove_child (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "remove_child" '[Object] (IO ()) where
        nodeMethod = Godot.Core.TreeItem.remove_child

{-# NOINLINE bindTreeItem_select #-}

-- | Selects the column @column@.
bindTreeItem_select :: MethodBind
bindTreeItem_select
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects the column @column@.
select :: (TreeItem :< cls, Object :< cls) => cls -> Int -> IO ()
select cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "select" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TreeItem.select

{-# NOINLINE bindTreeItem_set_button #-}

-- | Sets the given column's button @Texture@ at index @button_idx@ to @button@.
bindTreeItem_set_button :: MethodBind
bindTreeItem_set_button
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's button @Texture@ at index @button_idx@ to @button@.
set_button ::
             (TreeItem :< cls, Object :< cls) =>
             cls -> Int -> Int -> Texture -> IO ()
set_button cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_button (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_button" '[Int, Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_button

{-# NOINLINE bindTreeItem_set_button_disabled #-}

-- | If @true@, disables the button at index @button_idx@ in column @column@.
bindTreeItem_set_button_disabled :: MethodBind
bindTreeItem_set_button_disabled
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_button_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, disables the button at index @button_idx@ in column @column@.
set_button_disabled ::
                      (TreeItem :< cls, Object :< cls) =>
                      cls -> Int -> Int -> Bool -> IO ()
set_button_disabled cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_button_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_button_disabled"
           '[Int, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_button_disabled

{-# NOINLINE bindTreeItem_set_cell_mode #-}

-- | Sets the given column's cell mode to @mode@. See @enum TreeCellMode@ constants.
bindTreeItem_set_cell_mode :: MethodBind
bindTreeItem_set_cell_mode
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_cell_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's cell mode to @mode@. See @enum TreeCellMode@ constants.
set_cell_mode ::
                (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_cell_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_cell_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_cell_mode" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_cell_mode

{-# NOINLINE bindTreeItem_set_checked #-}

-- | If @true@, the column @column@ is checked.
bindTreeItem_set_checked :: MethodBind
bindTreeItem_set_checked
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the column @column@ is checked.
set_checked ::
              (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_checked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_checked (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_checked" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_checked

{-# NOINLINE bindTreeItem_set_collapsed #-}

-- | If @true@, the TreeItem is collapsed.
bindTreeItem_set_collapsed :: MethodBind
bindTreeItem_set_collapsed
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_collapsed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the TreeItem is collapsed.
set_collapsed ::
                (TreeItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collapsed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_collapsed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_collapsed" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TreeItem.set_collapsed

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

instance NodeMethod TreeItem "set_custom_as_button" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_custom_as_button

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
                      cls -> Int -> Color -> Maybe Bool -> IO ()
set_custom_bg_color cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_custom_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_custom_bg_color"
           '[Int, Color, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_custom_bg_color

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

instance NodeMethod TreeItem "set_custom_color" '[Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_custom_color

{-# NOINLINE bindTreeItem_set_custom_draw #-}

-- | Sets the given column's custom draw callback to @callback@ method on @object@.
--   				The @callback@ should accept two arguments: the @TreeItem@ that is drawn and its position and size as a @Rect2@.
bindTreeItem_set_custom_draw :: MethodBind
bindTreeItem_set_custom_draw
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_custom_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's custom draw callback to @callback@ method on @object@.
--   				The @callback@ should accept two arguments: the @TreeItem@ that is drawn and its position and size as a @Rect2@.
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

instance NodeMethod TreeItem "set_custom_draw"
           '[Int, Object, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_custom_draw

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

instance NodeMethod TreeItem "set_custom_minimum_height" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_custom_minimum_height

{-# NOINLINE bindTreeItem_set_disable_folding #-}

-- | If @true@, folding is disabled for this TreeItem.
bindTreeItem_set_disable_folding :: MethodBind
bindTreeItem_set_disable_folding
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_disable_folding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, folding is disabled for this TreeItem.
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

instance NodeMethod TreeItem "set_disable_folding" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_disable_folding

{-# NOINLINE bindTreeItem_set_editable #-}

-- | If @true@, column @column@ is editable.
bindTreeItem_set_editable :: MethodBind
bindTreeItem_set_editable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, column @column@ is editable.
set_editable ::
               (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_editable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_editable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_editable" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_editable

{-# NOINLINE bindTreeItem_set_expand_right #-}

-- | If @true@, column @column@ is expanded to the right.
bindTreeItem_set_expand_right :: MethodBind
bindTreeItem_set_expand_right
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_expand_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, column @column@ is expanded to the right.
set_expand_right ::
                   (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_expand_right cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_expand_right (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_expand_right" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_expand_right

{-# NOINLINE bindTreeItem_set_icon #-}

-- | Sets the given column's icon @Texture@.
bindTreeItem_set_icon :: MethodBind
bindTreeItem_set_icon
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's icon @Texture@.
set_icon ::
           (TreeItem :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_icon" '[Int, Texture] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_icon

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

instance NodeMethod TreeItem "set_icon_max_width" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_icon_max_width

{-# NOINLINE bindTreeItem_set_icon_modulate #-}

-- | Modulates the given column's icon with @modulate@.
bindTreeItem_set_icon_modulate :: MethodBind
bindTreeItem_set_icon_modulate
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_icon_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Modulates the given column's icon with @modulate@.
set_icon_modulate ::
                    (TreeItem :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_icon_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_icon_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_icon_modulate" '[Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_icon_modulate

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

instance NodeMethod TreeItem "set_icon_region" '[Int, Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_icon_region

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

instance NodeMethod TreeItem "set_metadata" '[Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_metadata

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

instance NodeMethod TreeItem "set_range" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_range

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
                   cls -> Int -> Float -> Float -> Float -> Maybe Bool -> IO ()
set_range_config cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_range_config (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_range_config"
           '[Int, Float, Float, Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_range_config

{-# NOINLINE bindTreeItem_set_selectable #-}

-- | If @true@, the given column is selectable.
bindTreeItem_set_selectable :: MethodBind
bindTreeItem_set_selectable
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_selectable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the given column is selectable.
set_selectable ::
                 (TreeItem :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_selectable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_selectable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_selectable" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_selectable

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

instance NodeMethod TreeItem "set_text" '[Int, GodotString] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_text

{-# NOINLINE bindTreeItem_set_text_align #-}

-- | Sets the given column's text alignment. See @enum TextAlign@ for possible values.
bindTreeItem_set_text_align :: MethodBind
bindTreeItem_set_text_align
  = unsafePerformIO $
      withCString "TreeItem" $
        \ clsNamePtr ->
          withCString "set_text_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given column's text alignment. See @enum TextAlign@ for possible values.
set_text_align ::
                 (TreeItem :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_text_align cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTreeItem_set_text_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TreeItem "set_text_align" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_text_align

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

instance NodeMethod TreeItem "set_tooltip" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TreeItem.set_tooltip