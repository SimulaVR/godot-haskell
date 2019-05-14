{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.FileDialog
       (Godot.Core.FileDialog._ACCESS_RESOURCES,
        Godot.Core.FileDialog._MODE_OPEN_FILES,
        Godot.Core.FileDialog._MODE_OPEN_FILE,
        Godot.Core.FileDialog._MODE_SAVE_FILE,
        Godot.Core.FileDialog._ACCESS_USERDATA,
        Godot.Core.FileDialog._ACCESS_FILESYSTEM,
        Godot.Core.FileDialog._MODE_OPEN_DIR,
        Godot.Core.FileDialog._MODE_OPEN_ANY,
        Godot.Core.FileDialog.sig_files_selected,
        Godot.Core.FileDialog.sig_dir_selected,
        Godot.Core.FileDialog.sig_file_selected,
        Godot.Core.FileDialog._unhandled_input,
        Godot.Core.FileDialog._tree_multi_selected,
        Godot.Core.FileDialog._tree_selected,
        Godot.Core.FileDialog._tree_item_activated,
        Godot.Core.FileDialog._dir_entered,
        Godot.Core.FileDialog._file_entered,
        Godot.Core.FileDialog._action_pressed,
        Godot.Core.FileDialog._cancel_pressed,
        Godot.Core.FileDialog._filter_selected,
        Godot.Core.FileDialog._save_confirm_pressed,
        Godot.Core.FileDialog.clear_filters,
        Godot.Core.FileDialog.add_filter,
        Godot.Core.FileDialog.set_filters,
        Godot.Core.FileDialog.get_filters,
        Godot.Core.FileDialog.get_current_dir,
        Godot.Core.FileDialog.get_current_file,
        Godot.Core.FileDialog.get_current_path,
        Godot.Core.FileDialog.set_current_dir,
        Godot.Core.FileDialog.set_current_file,
        Godot.Core.FileDialog.set_current_path,
        Godot.Core.FileDialog.set_mode_overrides_title,
        Godot.Core.FileDialog.is_mode_overriding_title,
        Godot.Core.FileDialog.set_mode, Godot.Core.FileDialog.get_mode,
        Godot.Core.FileDialog.get_vbox,
        Godot.Core.FileDialog.get_line_edit,
        Godot.Core.FileDialog.set_access, Godot.Core.FileDialog.get_access,
        Godot.Core.FileDialog.set_show_hidden_files,
        Godot.Core.FileDialog.is_showing_hidden_files,
        Godot.Core.FileDialog._select_drive,
        Godot.Core.FileDialog._make_dir,
        Godot.Core.FileDialog._make_dir_confirm,
        Godot.Core.FileDialog._update_file_list,
        Godot.Core.FileDialog._update_dir, Godot.Core.FileDialog._go_up,
        Godot.Core.FileDialog.deselect_items,
        Godot.Core.FileDialog.invalidate)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

-- | Event emitted when the user selects multiple files.
sig_files_selected :: Godot.Internal.Dispatch.Signal FileDialog
sig_files_selected
  = Godot.Internal.Dispatch.Signal "files_selected"

-- | Event emitted when the user selects a directory.
sig_dir_selected :: Godot.Internal.Dispatch.Signal FileDialog
sig_dir_selected = Godot.Internal.Dispatch.Signal "dir_selected"

-- | Event emitted when the user selects a file (double clicks it or presses the OK button).
sig_file_selected :: Godot.Internal.Dispatch.Signal FileDialog
sig_file_selected = Godot.Internal.Dispatch.Signal "file_selected"

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

{-# NOINLINE bindFileDialog_add_filter #-}

-- | Add a custom filter. Example: [code]add_filter("*.png ; PNG Images")[/code]
bindFileDialog_add_filter :: MethodBind
bindFileDialog_add_filter
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "add_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a custom filter. Example: [code]add_filter("*.png ; PNG Images")[/code]
add_filter ::
             (FileDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_add_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFileDialog_set_filters #-}

-- | Set file type filters. This example shows only .png and .gd files [code]set_filters(PoolStringArray(["*.png ; PNG Images","*.gd ; GD Script"]))[/code].
bindFileDialog_set_filters :: MethodBind
bindFileDialog_set_filters
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set file type filters. This example shows only .png and .gd files [code]set_filters(PoolStringArray(["*.png ; PNG Images","*.gd ; GD Script"]))[/code].
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

{-# NOINLINE bindFileDialog_get_filters #-}

-- | Set file type filters. This example shows only .png and .gd files [code]set_filters(PoolStringArray(["*.png ; PNG Images","*.gd ; GD Script"]))[/code].
bindFileDialog_get_filters :: MethodBind
bindFileDialog_get_filters
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set file type filters. This example shows only .png and .gd files [code]set_filters(PoolStringArray(["*.png ; PNG Images","*.gd ; GD Script"]))[/code].
get_filters ::
              (FileDialog :< cls, Object :< cls) => cls -> IO PoolStringArray
get_filters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_filters (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindFileDialog_set_mode_overrides_title #-}

-- | If [code]true[/code], changing the [code]Mode[/code] property will set the window title accordingly (e.g. setting mode to [code]MODE_OPEN_FILE[/code] will change the window title to "Open a File").
bindFileDialog_set_mode_overrides_title :: MethodBind
bindFileDialog_set_mode_overrides_title
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_mode_overrides_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], changing the [code]Mode[/code] property will set the window title accordingly (e.g. setting mode to [code]MODE_OPEN_FILE[/code] will change the window title to "Open a File").
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

{-# NOINLINE bindFileDialog_is_mode_overriding_title #-}

-- | If [code]true[/code], changing the [code]Mode[/code] property will set the window title accordingly (e.g. setting mode to [code]MODE_OPEN_FILE[/code] will change the window title to "Open a File").
bindFileDialog_is_mode_overriding_title :: MethodBind
bindFileDialog_is_mode_overriding_title
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "is_mode_overriding_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], changing the [code]Mode[/code] property will set the window title accordingly (e.g. setting mode to [code]MODE_OPEN_FILE[/code] will change the window title to "Open a File").
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

{-# NOINLINE bindFileDialog_set_mode #-}

-- | Set dialog to open or save mode, changes selection behavior. See enum [code]Mode[/code] constants.
bindFileDialog_set_mode :: MethodBind
bindFileDialog_set_mode
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set dialog to open or save mode, changes selection behavior. See enum [code]Mode[/code] constants.
set_mode ::
           (FileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFileDialog_get_mode #-}

-- | Set dialog to open or save mode, changes selection behavior. See enum [code]Mode[/code] constants.
bindFileDialog_get_mode :: MethodBind
bindFileDialog_get_mode
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set dialog to open or save mode, changes selection behavior. See enum [code]Mode[/code] constants.
get_mode :: (FileDialog :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFileDialog_get_vbox #-}

-- | Return the vertical box container of the dialog, custom controls can be added to it.
bindFileDialog_get_vbox :: MethodBind
bindFileDialog_get_vbox
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_vbox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the vertical box container of the dialog, custom controls can be added to it.
get_vbox ::
           (FileDialog :< cls, Object :< cls) => cls -> IO VBoxContainer
get_vbox cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_vbox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindFileDialog_set_access #-}

-- | The file system access scope. See enum [code]Access[/code] constants.
bindFileDialog_set_access :: MethodBind
bindFileDialog_set_access
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_access" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file system access scope. See enum [code]Access[/code] constants.
set_access ::
             (FileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_access cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_set_access (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFileDialog_get_access #-}

-- | The file system access scope. See enum [code]Access[/code] constants.
bindFileDialog_get_access :: MethodBind
bindFileDialog_get_access
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "get_access" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file system access scope. See enum [code]Access[/code] constants.
get_access :: (FileDialog :< cls, Object :< cls) => cls -> IO Int
get_access cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFileDialog_get_access (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFileDialog_set_show_hidden_files #-}

-- | If [code]true[/code], the dialog will show hidden files.
bindFileDialog_set_show_hidden_files :: MethodBind
bindFileDialog_set_show_hidden_files
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "set_show_hidden_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the dialog will show hidden files.
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

{-# NOINLINE bindFileDialog_is_showing_hidden_files #-}

-- | If [code]true[/code], the dialog will show hidden files.
bindFileDialog_is_showing_hidden_files :: MethodBind
bindFileDialog_is_showing_hidden_files
  = unsafePerformIO $
      withCString "FileDialog" $
        \ clsNamePtr ->
          withCString "is_showing_hidden_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the dialog will show hidden files.
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