{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.FileDialog
       (Godot.Core.FileDialog._ACCESS_RESOURCES,
        Godot.Core.FileDialog._MODE_OPEN_FILES,
        Godot.Core.FileDialog._MODE_OPEN_FILE,
        Godot.Core.FileDialog._MODE_SAVE_FILE,
        Godot.Core.FileDialog._ACCESS_USERDATA,
        Godot.Core.FileDialog._ACCESS_FILESYSTEM,
        Godot.Core.FileDialog._MODE_OPEN_DIR,
        Godot.Core.FileDialog._MODE_OPEN_ANY,
        Godot.Core.FileDialog.sig_dir_selected,
        Godot.Core.FileDialog.sig_file_selected,
        Godot.Core.FileDialog.sig_files_selected,
        Godot.Core.FileDialog._action_pressed,
        Godot.Core.FileDialog._cancel_pressed,
        Godot.Core.FileDialog._dir_entered,
        Godot.Core.FileDialog._file_entered,
        Godot.Core.FileDialog._filter_selected,
        Godot.Core.FileDialog._go_up, Godot.Core.FileDialog._make_dir,
        Godot.Core.FileDialog._make_dir_confirm,
        Godot.Core.FileDialog._save_confirm_pressed,
        Godot.Core.FileDialog._select_drive,
        Godot.Core.FileDialog._tree_item_activated,
        Godot.Core.FileDialog._tree_multi_selected,
        Godot.Core.FileDialog._tree_selected,
        Godot.Core.FileDialog._unhandled_input,
        Godot.Core.FileDialog._update_dir,
        Godot.Core.FileDialog._update_file_list,
        Godot.Core.FileDialog._update_file_name,
        Godot.Core.FileDialog.add_filter,
        Godot.Core.FileDialog.clear_filters,
        Godot.Core.FileDialog.deselect_items,
        Godot.Core.FileDialog.get_access,
        Godot.Core.FileDialog.get_current_dir,
        Godot.Core.FileDialog.get_current_file,
        Godot.Core.FileDialog.get_current_path,
        Godot.Core.FileDialog.get_filters,
        Godot.Core.FileDialog.get_line_edit,
        Godot.Core.FileDialog.get_mode, Godot.Core.FileDialog.get_vbox,
        Godot.Core.FileDialog.invalidate,
        Godot.Core.FileDialog.is_mode_overriding_title,
        Godot.Core.FileDialog.is_showing_hidden_files,
        Godot.Core.FileDialog.set_access,
        Godot.Core.FileDialog.set_current_dir,
        Godot.Core.FileDialog.set_current_file,
        Godot.Core.FileDialog.set_current_path,
        Godot.Core.FileDialog.set_filters, Godot.Core.FileDialog.set_mode,
        Godot.Core.FileDialog.set_mode_overrides_title,
        Godot.Core.FileDialog.set_show_hidden_files)
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
import Godot.Core.ConfirmationDialog()

_ACCESS_RESOURCES :: Int
_ACCESS_RESOURCES = 0

_MODE_OPEN_FILES :: Int
_MODE_OPEN_FILES = 1

_MODE_OPEN_FILE :: Int
_MODE_OPEN_FILE = 0

_MODE_SAVE_FILE :: Int
_MODE_SAVE_FILE = 4

_ACCESS_USERDATA :: Int
_ACCESS_USERDATA = 1

_ACCESS_FILESYSTEM :: Int
_ACCESS_FILESYSTEM = 2

_MODE_OPEN_DIR :: Int
_MODE_OPEN_DIR = 2

_MODE_OPEN_ANY :: Int
_MODE_OPEN_ANY = 3

-- | Emitted when the user selects a directory.
sig_dir_selected :: Godot.Internal.Dispatch.Signal FileDialog
sig_dir_selected = Godot.Internal.Dispatch.Signal "dir_selected"

instance NodeSignal FileDialog "dir_selected" '[GodotString]

-- | Emitted when the user selects a file by double-clicking it or pressing the __OK__ button.
sig_file_selected :: Godot.Internal.Dispatch.Signal FileDialog
sig_file_selected = Godot.Internal.Dispatch.Signal "file_selected"

instance NodeSignal FileDialog "file_selected" '[GodotString]

-- | Emitted when the user selects multiple files.
sig_files_selected :: Godot.Internal.Dispatch.Signal FileDialog
sig_files_selected
  = Godot.Internal.Dispatch.Signal "files_selected"

instance NodeSignal FileDialog "files_selected" '[PoolStringArray]

instance NodeProperty FileDialog "access" Int 'False where
        nodeProperty = (get_access, wrapDroppingSetter set_access, Nothing)

instance NodeProperty FileDialog "current_dir" GodotString 'False
         where
        nodeProperty
          = (get_current_dir, wrapDroppingSetter set_current_dir, Nothing)

instance NodeProperty FileDialog "current_file" GodotString 'False
         where
        nodeProperty
          = (get_current_file, wrapDroppingSetter set_current_file, Nothing)

instance NodeProperty FileDialog "current_path" GodotString 'False
         where
        nodeProperty
          = (get_current_path, wrapDroppingSetter set_current_path, Nothing)

instance NodeProperty FileDialog "filters" PoolStringArray 'False
         where
        nodeProperty
          = (get_filters, wrapDroppingSetter set_filters, Nothing)

instance NodeProperty FileDialog "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty FileDialog "mode_overrides_title" Bool 'False
         where
        nodeProperty
          = (is_mode_overriding_title,
             wrapDroppingSetter set_mode_overrides_title, Nothing)

instance NodeProperty FileDialog "show_hidden_files" Bool 'False
         where
        nodeProperty
          = (is_showing_hidden_files,
             wrapDroppingSetter set_show_hidden_files, Nothing)

{-# NOINLINE bindFileDialog__action_pressed #-}

bindFileDialog__action_pressed :: MethodBind
bindFileDialog__action_pressed
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_action_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_action_pressed ::
                  (FileDialog :< cls, Object :< cls) => cls -> IO ()
_action_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__action_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_action_pressed" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._action_pressed

{-# NOINLINE bindFileDialog__cancel_pressed #-}

bindFileDialog__cancel_pressed :: MethodBind
bindFileDialog__cancel_pressed
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_cancel_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_cancel_pressed ::
                  (FileDialog :< cls, Object :< cls) => cls -> IO ()
_cancel_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__cancel_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_cancel_pressed" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._cancel_pressed

{-# NOINLINE bindFileDialog__dir_entered #-}

bindFileDialog__dir_entered :: MethodBind
bindFileDialog__dir_entered
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_dir_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_dir_entered ::
               (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
_dir_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__dir_entered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_dir_entered" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._dir_entered

{-# NOINLINE bindFileDialog__file_entered #-}

bindFileDialog__file_entered :: MethodBind
bindFileDialog__file_entered
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_file_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_file_entered ::
                (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
_file_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__file_entered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_file_entered" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._file_entered

{-# NOINLINE bindFileDialog__filter_selected #-}

bindFileDialog__filter_selected :: MethodBind
bindFileDialog__filter_selected
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_filter_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_filter_selected ::
                   (FileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_filter_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__filter_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_filter_selected" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._filter_selected

{-# NOINLINE bindFileDialog__go_up #-}

bindFileDialog__go_up :: MethodBind
bindFileDialog__go_up
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_go_up" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_go_up :: (FileDialog :< cls, Object :< cls) => cls -> IO ()
_go_up cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__go_up (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_go_up" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._go_up

{-# NOINLINE bindFileDialog__make_dir #-}

bindFileDialog__make_dir :: MethodBind
bindFileDialog__make_dir
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_make_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_make_dir :: (FileDialog :< cls, Object :< cls) => cls -> IO ()
_make_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__make_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_make_dir" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._make_dir

{-# NOINLINE bindFileDialog__make_dir_confirm #-}

bindFileDialog__make_dir_confirm :: MethodBind
bindFileDialog__make_dir_confirm
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_make_dir_confirm" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_make_dir_confirm ::
                    (FileDialog :< cls, Object :< cls) => cls -> IO ()
_make_dir_confirm cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__make_dir_confirm
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_make_dir_confirm" '[] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._make_dir_confirm

{-# NOINLINE bindFileDialog__save_confirm_pressed #-}

bindFileDialog__save_confirm_pressed :: MethodBind
bindFileDialog__save_confirm_pressed
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_save_confirm_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_save_confirm_pressed ::
                        (FileDialog :< cls, Object :< cls) => cls -> IO ()
_save_confirm_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__save_confirm_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_save_confirm_pressed" '[] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._save_confirm_pressed

{-# NOINLINE bindFileDialog__select_drive #-}

bindFileDialog__select_drive :: MethodBind
bindFileDialog__select_drive
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_select_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_select_drive ::
                (FileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_select_drive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__select_drive (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_select_drive" '[Int] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._select_drive

{-# NOINLINE bindFileDialog__tree_item_activated #-}

bindFileDialog__tree_item_activated :: MethodBind
bindFileDialog__tree_item_activated
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_tree_item_activated" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_item_activated ::
                       (FileDialog :< cls, Object :< cls) => cls -> IO ()
_tree_item_activated cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__tree_item_activated
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_tree_item_activated" '[] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._tree_item_activated

{-# NOINLINE bindFileDialog__tree_multi_selected #-}

bindFileDialog__tree_multi_selected :: MethodBind
bindFileDialog__tree_multi_selected
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_tree_multi_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_multi_selected ::
                       (FileDialog :< cls, Object :< cls) =>
                       cls -> Object -> Int -> Bool -> IO ()
_tree_multi_selected cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__tree_multi_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_tree_multi_selected"
           '[Object, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._tree_multi_selected

{-# NOINLINE bindFileDialog__tree_selected #-}

bindFileDialog__tree_selected :: MethodBind
bindFileDialog__tree_selected
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_tree_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_selected ::
                 (FileDialog :< cls, Object :< cls) => cls -> IO ()
_tree_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__tree_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_tree_selected" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._tree_selected

{-# NOINLINE bindFileDialog__unhandled_input #-}

bindFileDialog__unhandled_input :: MethodBind
bindFileDialog__unhandled_input
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unhandled_input ::
                   (FileDialog :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__unhandled_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_unhandled_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._unhandled_input

{-# NOINLINE bindFileDialog__update_dir #-}

bindFileDialog__update_dir :: MethodBind
bindFileDialog__update_dir
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_update_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_dir :: (FileDialog :< cls, Object :< cls) => cls -> IO ()
_update_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__update_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_update_dir" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog._update_dir

{-# NOINLINE bindFileDialog__update_file_list #-}

bindFileDialog__update_file_list :: MethodBind
bindFileDialog__update_file_list
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_update_file_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_file_list ::
                    (FileDialog :< cls, Object :< cls) => cls -> IO ()
_update_file_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__update_file_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_update_file_list" '[] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._update_file_list

{-# NOINLINE bindFileDialog__update_file_name #-}

bindFileDialog__update_file_name :: MethodBind
bindFileDialog__update_file_name
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "_update_file_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_file_name ::
                    (FileDialog :< cls, Object :< cls) => cls -> IO ()
_update_file_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog__update_file_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "_update_file_name" '[] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog._update_file_name

{-# NOINLINE bindFileDialog_add_filter #-}

-- | Adds @filter@ as a custom filter; @filter@ should be of the form @"filename.extension ; Description"@. For example, @"*.png ; PNG Images"@.
bindFileDialog_add_filter :: MethodBind
bindFileDialog_add_filter
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "add_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds @filter@ as a custom filter; @filter@ should be of the form @"filename.extension ; Description"@. For example, @"*.png ; PNG Images"@.
add_filter ::
             (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_add_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "add_filter" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.add_filter

{-# NOINLINE bindFileDialog_clear_filters #-}

-- | Clear all the added filters in the dialog.
bindFileDialog_clear_filters :: MethodBind
bindFileDialog_clear_filters
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "clear_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear all the added filters in the dialog.
clear_filters :: (FileDialog :< cls, Object :< cls) => cls -> IO ()
clear_filters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_clear_filters (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "clear_filters" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog.clear_filters

{-# NOINLINE bindFileDialog_deselect_items #-}

-- | Clear currently selected items in the dialog.
bindFileDialog_deselect_items :: MethodBind
bindFileDialog_deselect_items
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "deselect_items" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear currently selected items in the dialog.
deselect_items ::
                 (FileDialog :< cls, Object :< cls) => cls -> IO ()
deselect_items cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_deselect_items (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "deselect_items" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog.deselect_items

{-# NOINLINE bindFileDialog_get_access #-}

-- | The file system access scope. See enum @Access@ constants.
--   			__Warning:__ Currently, in sandboxed environments such as HTML5 builds or sandboxed macOS apps, FileDialog cannot access the host file system. See @url=https://github.com/godotengine/godot-proposals/issues/1123@godot-proposals#1123@/url@.
bindFileDialog_get_access :: MethodBind
bindFileDialog_get_access
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_access" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file system access scope. See enum @Access@ constants.
--   			__Warning:__ Currently, in sandboxed environments such as HTML5 builds or sandboxed macOS apps, FileDialog cannot access the host file system. See @url=https://github.com/godotengine/godot-proposals/issues/1123@godot-proposals#1123@/url@.
get_access :: (FileDialog :< cls, Object :< cls) => cls -> IO Int
get_access cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_access (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_access" '[] (IO Int) where
        nodeMethod = Godot.Core.FileDialog.get_access

{-# NOINLINE bindFileDialog_get_current_dir #-}

-- | The current working directory of the file dialog.
bindFileDialog_get_current_dir :: MethodBind
bindFileDialog_get_current_dir
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_current_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current working directory of the file dialog.
get_current_dir ::
                  (FileDialog :< cls, Object :< cls) => cls -> IO GodotString
get_current_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_current_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_current_dir" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.FileDialog.get_current_dir

{-# NOINLINE bindFileDialog_get_current_file #-}

-- | The currently selected file of the file dialog.
bindFileDialog_get_current_file :: MethodBind
bindFileDialog_get_current_file
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_current_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected file of the file dialog.
get_current_file ::
                   (FileDialog :< cls, Object :< cls) => cls -> IO GodotString
get_current_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_current_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_current_file" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.FileDialog.get_current_file

{-# NOINLINE bindFileDialog_get_current_path #-}

-- | The currently selected file path of the file dialog.
bindFileDialog_get_current_path :: MethodBind
bindFileDialog_get_current_path
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_current_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected file path of the file dialog.
get_current_path ::
                   (FileDialog :< cls, Object :< cls) => cls -> IO GodotString
get_current_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_current_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_current_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.FileDialog.get_current_path

{-# NOINLINE bindFileDialog_get_filters #-}

-- | The available file type filters. For example, this shows only @.png@ and @.gd@ files: @set_filters(PoolStringArray(@"*.png ; PNG Images","*.gd ; GDScript Files"@))@.
bindFileDialog_get_filters :: MethodBind
bindFileDialog_get_filters
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The available file type filters. For example, this shows only @.png@ and @.gd@ files: @set_filters(PoolStringArray(@"*.png ; PNG Images","*.gd ; GDScript Files"@))@.
get_filters ::
              (FileDialog :< cls, Object :< cls) => cls -> IO PoolStringArray
get_filters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_filters (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_filters" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.FileDialog.get_filters

{-# NOINLINE bindFileDialog_get_line_edit #-}

-- | Returns the LineEdit for the selected file.
bindFileDialog_get_line_edit :: MethodBind
bindFileDialog_get_line_edit
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_line_edit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the LineEdit for the selected file.
get_line_edit ::
                (FileDialog :< cls, Object :< cls) => cls -> IO LineEdit
get_line_edit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_line_edit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_line_edit" '[] (IO LineEdit)
         where
        nodeMethod = Godot.Core.FileDialog.get_line_edit

{-# NOINLINE bindFileDialog_get_mode #-}

-- | The dialog's open or save mode, which affects the selection behavior. See enum @Mode@ constants.
bindFileDialog_get_mode :: MethodBind
bindFileDialog_get_mode
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The dialog's open or save mode, which affects the selection behavior. See enum @Mode@ constants.
get_mode :: (FileDialog :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.FileDialog.get_mode

{-# NOINLINE bindFileDialog_get_vbox #-}

-- | Returns the vertical box container of the dialog, custom controls can be added to it.
bindFileDialog_get_vbox :: MethodBind
bindFileDialog_get_vbox
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_vbox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the vertical box container of the dialog, custom controls can be added to it.
get_vbox ::
           (FileDialog :< cls, Object :< cls) => cls -> IO VBoxContainer
get_vbox cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_vbox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "get_vbox" '[] (IO VBoxContainer)
         where
        nodeMethod = Godot.Core.FileDialog.get_vbox

{-# NOINLINE bindFileDialog_invalidate #-}

-- | Invalidate and update the current dialog content list.
bindFileDialog_invalidate :: MethodBind
bindFileDialog_invalidate
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "invalidate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Invalidate and update the current dialog content list.
invalidate :: (FileDialog :< cls, Object :< cls) => cls -> IO ()
invalidate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_invalidate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "invalidate" '[] (IO ()) where
        nodeMethod = Godot.Core.FileDialog.invalidate

{-# NOINLINE bindFileDialog_is_mode_overriding_title #-}

-- | If @true@, changing the @Mode@ property will set the window title accordingly (e.g. setting mode to @MODE_OPEN_FILE@ will change the window title to "Open a File").
bindFileDialog_is_mode_overriding_title :: MethodBind
bindFileDialog_is_mode_overriding_title
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "is_mode_overriding_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, changing the @Mode@ property will set the window title accordingly (e.g. setting mode to @MODE_OPEN_FILE@ will change the window title to "Open a File").
is_mode_overriding_title ::
                           (FileDialog :< cls, Object :< cls) => cls -> IO Bool
is_mode_overriding_title cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_is_mode_overriding_title
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "is_mode_overriding_title" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.FileDialog.is_mode_overriding_title

{-# NOINLINE bindFileDialog_is_showing_hidden_files #-}

-- | If @true@, the dialog will show hidden files.
bindFileDialog_is_showing_hidden_files :: MethodBind
bindFileDialog_is_showing_hidden_files
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "is_showing_hidden_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the dialog will show hidden files.
is_showing_hidden_files ::
                          (FileDialog :< cls, Object :< cls) => cls -> IO Bool
is_showing_hidden_files cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_is_showing_hidden_files
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "is_showing_hidden_files" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.FileDialog.is_showing_hidden_files

{-# NOINLINE bindFileDialog_set_access #-}

-- | The file system access scope. See enum @Access@ constants.
--   			__Warning:__ Currently, in sandboxed environments such as HTML5 builds or sandboxed macOS apps, FileDialog cannot access the host file system. See @url=https://github.com/godotengine/godot-proposals/issues/1123@godot-proposals#1123@/url@.
bindFileDialog_set_access :: MethodBind
bindFileDialog_set_access
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_access" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file system access scope. See enum @Access@ constants.
--   			__Warning:__ Currently, in sandboxed environments such as HTML5 builds or sandboxed macOS apps, FileDialog cannot access the host file system. See @url=https://github.com/godotengine/godot-proposals/issues/1123@godot-proposals#1123@/url@.
set_access ::
             (FileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_access cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_access (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_access" '[Int] (IO ()) where
        nodeMethod = Godot.Core.FileDialog.set_access

{-# NOINLINE bindFileDialog_set_current_dir #-}

-- | The current working directory of the file dialog.
bindFileDialog_set_current_dir :: MethodBind
bindFileDialog_set_current_dir
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_current_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current working directory of the file dialog.
set_current_dir ::
                  (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_current_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_current_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_current_dir" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.set_current_dir

{-# NOINLINE bindFileDialog_set_current_file #-}

-- | The currently selected file of the file dialog.
bindFileDialog_set_current_file :: MethodBind
bindFileDialog_set_current_file
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_current_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected file of the file dialog.
set_current_file ::
                   (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_current_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_current_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_current_file" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.set_current_file

{-# NOINLINE bindFileDialog_set_current_path #-}

-- | The currently selected file path of the file dialog.
bindFileDialog_set_current_path :: MethodBind
bindFileDialog_set_current_path
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_current_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected file path of the file dialog.
set_current_path ::
                   (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_current_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_current_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_current_path" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.set_current_path

{-# NOINLINE bindFileDialog_set_filters #-}

-- | The available file type filters. For example, this shows only @.png@ and @.gd@ files: @set_filters(PoolStringArray(@"*.png ; PNG Images","*.gd ; GDScript Files"@))@.
bindFileDialog_set_filters :: MethodBind
bindFileDialog_set_filters
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The available file type filters. For example, this shows only @.png@ and @.gd@ files: @set_filters(PoolStringArray(@"*.png ; PNG Images","*.gd ; GDScript Files"@))@.
set_filters ::
              (FileDialog :< cls, Object :< cls) =>
              cls -> PoolStringArray -> IO ()
set_filters cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_filters (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_filters" '[PoolStringArray]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.set_filters

{-# NOINLINE bindFileDialog_set_mode #-}

-- | The dialog's open or save mode, which affects the selection behavior. See enum @Mode@ constants.
bindFileDialog_set_mode :: MethodBind
bindFileDialog_set_mode
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The dialog's open or save mode, which affects the selection behavior. See enum @Mode@ constants.
set_mode ::
           (FileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.FileDialog.set_mode

{-# NOINLINE bindFileDialog_set_mode_overrides_title #-}

-- | If @true@, changing the @Mode@ property will set the window title accordingly (e.g. setting mode to @MODE_OPEN_FILE@ will change the window title to "Open a File").
bindFileDialog_set_mode_overrides_title :: MethodBind
bindFileDialog_set_mode_overrides_title
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_mode_overrides_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, changing the @Mode@ property will set the window title accordingly (e.g. setting mode to @MODE_OPEN_FILE@ will change the window title to "Open a File").
set_mode_overrides_title ::
                           (FileDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_mode_overrides_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_mode_overrides_title
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_mode_overrides_title" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.set_mode_overrides_title

{-# NOINLINE bindFileDialog_set_show_hidden_files #-}

-- | If @true@, the dialog will show hidden files.
bindFileDialog_set_show_hidden_files :: MethodBind
bindFileDialog_set_show_hidden_files
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_show_hidden_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the dialog will show hidden files.
set_show_hidden_files ::
                        (FileDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_show_hidden_files cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_show_hidden_files
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FileDialog "set_show_hidden_files" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.FileDialog.set_show_hidden_files