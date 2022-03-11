{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorFileDialog
       (Godot.Tools.EditorFileDialog._ACCESS_RESOURCES,
        Godot.Tools.EditorFileDialog._DISPLAY_THUMBNAILS,
        Godot.Tools.EditorFileDialog._MODE_OPEN_FILES,
        Godot.Tools.EditorFileDialog._MODE_OPEN_FILE,
        Godot.Tools.EditorFileDialog._MODE_SAVE_FILE,
        Godot.Tools.EditorFileDialog._DISPLAY_LIST,
        Godot.Tools.EditorFileDialog._ACCESS_USERDATA,
        Godot.Tools.EditorFileDialog._ACCESS_FILESYSTEM,
        Godot.Tools.EditorFileDialog._MODE_OPEN_DIR,
        Godot.Tools.EditorFileDialog._MODE_OPEN_ANY,
        Godot.Tools.EditorFileDialog.sig_dir_selected,
        Godot.Tools.EditorFileDialog.sig_file_selected,
        Godot.Tools.EditorFileDialog.sig_files_selected,
        Godot.Tools.EditorFileDialog._action_pressed,
        Godot.Tools.EditorFileDialog._cancel_pressed,
        Godot.Tools.EditorFileDialog._dir_entered,
        Godot.Tools.EditorFileDialog._favorite_move_down,
        Godot.Tools.EditorFileDialog._favorite_move_up,
        Godot.Tools.EditorFileDialog._favorite_pressed,
        Godot.Tools.EditorFileDialog._favorite_selected,
        Godot.Tools.EditorFileDialog._file_entered,
        Godot.Tools.EditorFileDialog._filter_selected,
        Godot.Tools.EditorFileDialog._go_back,
        Godot.Tools.EditorFileDialog._go_forward,
        Godot.Tools.EditorFileDialog._go_up,
        Godot.Tools.EditorFileDialog._item_db_selected,
        Godot.Tools.EditorFileDialog._item_list_item_rmb_selected,
        Godot.Tools.EditorFileDialog._item_list_rmb_clicked,
        Godot.Tools.EditorFileDialog._item_menu_id_pressed,
        Godot.Tools.EditorFileDialog._item_selected,
        Godot.Tools.EditorFileDialog._items_clear_selection,
        Godot.Tools.EditorFileDialog._make_dir,
        Godot.Tools.EditorFileDialog._make_dir_confirm,
        Godot.Tools.EditorFileDialog._multi_selected,
        Godot.Tools.EditorFileDialog._recent_selected,
        Godot.Tools.EditorFileDialog._save_confirm_pressed,
        Godot.Tools.EditorFileDialog._select_drive,
        Godot.Tools.EditorFileDialog._thumbnail_done,
        Godot.Tools.EditorFileDialog._thumbnail_result,
        Godot.Tools.EditorFileDialog._unhandled_input,
        Godot.Tools.EditorFileDialog._update_dir,
        Godot.Tools.EditorFileDialog._update_file_list,
        Godot.Tools.EditorFileDialog._update_file_name,
        Godot.Tools.EditorFileDialog.add_filter,
        Godot.Tools.EditorFileDialog.clear_filters,
        Godot.Tools.EditorFileDialog.get_access,
        Godot.Tools.EditorFileDialog.get_current_dir,
        Godot.Tools.EditorFileDialog.get_current_file,
        Godot.Tools.EditorFileDialog.get_current_path,
        Godot.Tools.EditorFileDialog.get_display_mode,
        Godot.Tools.EditorFileDialog.get_mode,
        Godot.Tools.EditorFileDialog.get_vbox,
        Godot.Tools.EditorFileDialog.invalidate,
        Godot.Tools.EditorFileDialog.is_overwrite_warning_disabled,
        Godot.Tools.EditorFileDialog.is_showing_hidden_files,
        Godot.Tools.EditorFileDialog.set_access,
        Godot.Tools.EditorFileDialog.set_current_dir,
        Godot.Tools.EditorFileDialog.set_current_file,
        Godot.Tools.EditorFileDialog.set_current_path,
        Godot.Tools.EditorFileDialog.set_disable_overwrite_warning,
        Godot.Tools.EditorFileDialog.set_display_mode,
        Godot.Tools.EditorFileDialog.set_mode,
        Godot.Tools.EditorFileDialog.set_show_hidden_files)
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

_DISPLAY_THUMBNAILS :: Int
_DISPLAY_THUMBNAILS = 0

_MODE_OPEN_FILES :: Int
_MODE_OPEN_FILES = 1

_MODE_OPEN_FILE :: Int
_MODE_OPEN_FILE = 0

_MODE_SAVE_FILE :: Int
_MODE_SAVE_FILE = 4

_DISPLAY_LIST :: Int
_DISPLAY_LIST = 1

_ACCESS_USERDATA :: Int
_ACCESS_USERDATA = 1

_ACCESS_FILESYSTEM :: Int
_ACCESS_FILESYSTEM = 2

_MODE_OPEN_DIR :: Int
_MODE_OPEN_DIR = 2

_MODE_OPEN_ANY :: Int
_MODE_OPEN_ANY = 3

-- | Emitted when a directory is selected.
sig_dir_selected :: Godot.Internal.Dispatch.Signal EditorFileDialog
sig_dir_selected = Godot.Internal.Dispatch.Signal "dir_selected"

instance NodeSignal EditorFileDialog "dir_selected" '[GodotString]

-- | Emitted when a file is selected.
sig_file_selected ::
                  Godot.Internal.Dispatch.Signal EditorFileDialog
sig_file_selected = Godot.Internal.Dispatch.Signal "file_selected"

instance NodeSignal EditorFileDialog "file_selected" '[GodotString]

-- | Emitted when multiple files are selected.
sig_files_selected ::
                   Godot.Internal.Dispatch.Signal EditorFileDialog
sig_files_selected
  = Godot.Internal.Dispatch.Signal "files_selected"

instance NodeSignal EditorFileDialog "files_selected"
           '[PoolStringArray]

instance NodeProperty EditorFileDialog "access" Int 'False where
        nodeProperty = (get_access, wrapDroppingSetter set_access, Nothing)

instance NodeProperty EditorFileDialog "current_dir" GodotString
           'False
         where
        nodeProperty
          = (get_current_dir, wrapDroppingSetter set_current_dir, Nothing)

instance NodeProperty EditorFileDialog "current_file" GodotString
           'False
         where
        nodeProperty
          = (get_current_file, wrapDroppingSetter set_current_file, Nothing)

instance NodeProperty EditorFileDialog "current_path" GodotString
           'False
         where
        nodeProperty
          = (get_current_path, wrapDroppingSetter set_current_path, Nothing)

instance NodeProperty EditorFileDialog "disable_overwrite_warning"
           Bool
           'False
         where
        nodeProperty
          = (is_overwrite_warning_disabled,
             wrapDroppingSetter set_disable_overwrite_warning, Nothing)

instance NodeProperty EditorFileDialog "display_mode" Int 'False
         where
        nodeProperty
          = (get_display_mode, wrapDroppingSetter set_display_mode, Nothing)

instance NodeProperty EditorFileDialog "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty EditorFileDialog "show_hidden_files" Bool
           'False
         where
        nodeProperty
          = (is_showing_hidden_files,
             wrapDroppingSetter set_show_hidden_files, Nothing)

{-# NOINLINE bindEditorFileDialog__action_pressed #-}

bindEditorFileDialog__action_pressed :: MethodBind
bindEditorFileDialog__action_pressed
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_action_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_action_pressed ::
                  (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_action_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__action_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_action_pressed" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._action_pressed

{-# NOINLINE bindEditorFileDialog__cancel_pressed #-}

bindEditorFileDialog__cancel_pressed :: MethodBind
bindEditorFileDialog__cancel_pressed
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_cancel_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_cancel_pressed ::
                  (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_cancel_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__cancel_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_cancel_pressed" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._cancel_pressed

{-# NOINLINE bindEditorFileDialog__dir_entered #-}

bindEditorFileDialog__dir_entered :: MethodBind
bindEditorFileDialog__dir_entered
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_dir_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_dir_entered ::
               (EditorFileDialog :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
_dir_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__dir_entered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_dir_entered" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._dir_entered

{-# NOINLINE bindEditorFileDialog__favorite_move_down #-}

bindEditorFileDialog__favorite_move_down :: MethodBind
bindEditorFileDialog__favorite_move_down
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_favorite_move_down" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_favorite_move_down ::
                      (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_favorite_move_down cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__favorite_move_down
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_favorite_move_down" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._favorite_move_down

{-# NOINLINE bindEditorFileDialog__favorite_move_up #-}

bindEditorFileDialog__favorite_move_up :: MethodBind
bindEditorFileDialog__favorite_move_up
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_favorite_move_up" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_favorite_move_up ::
                    (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_favorite_move_up cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__favorite_move_up
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_favorite_move_up" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._favorite_move_up

{-# NOINLINE bindEditorFileDialog__favorite_pressed #-}

bindEditorFileDialog__favorite_pressed :: MethodBind
bindEditorFileDialog__favorite_pressed
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_favorite_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_favorite_pressed ::
                    (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_favorite_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__favorite_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_favorite_pressed" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._favorite_pressed

{-# NOINLINE bindEditorFileDialog__favorite_selected #-}

bindEditorFileDialog__favorite_selected :: MethodBind
bindEditorFileDialog__favorite_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_favorite_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_favorite_selected ::
                     (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_favorite_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__favorite_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_favorite_selected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._favorite_selected

{-# NOINLINE bindEditorFileDialog__file_entered #-}

bindEditorFileDialog__file_entered :: MethodBind
bindEditorFileDialog__file_entered
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_file_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_file_entered ::
                (EditorFileDialog :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_file_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__file_entered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_file_entered" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._file_entered

{-# NOINLINE bindEditorFileDialog__filter_selected #-}

bindEditorFileDialog__filter_selected :: MethodBind
bindEditorFileDialog__filter_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_filter_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_filter_selected ::
                   (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_filter_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__filter_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_filter_selected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._filter_selected

{-# NOINLINE bindEditorFileDialog__go_back #-}

bindEditorFileDialog__go_back :: MethodBind
bindEditorFileDialog__go_back
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_go_back" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_go_back ::
           (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_go_back cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__go_back (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_go_back" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorFileDialog._go_back

{-# NOINLINE bindEditorFileDialog__go_forward #-}

bindEditorFileDialog__go_forward :: MethodBind
bindEditorFileDialog__go_forward
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_go_forward" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_go_forward ::
              (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_go_forward cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__go_forward
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_go_forward" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._go_forward

{-# NOINLINE bindEditorFileDialog__go_up #-}

bindEditorFileDialog__go_up :: MethodBind
bindEditorFileDialog__go_up
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_go_up" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_go_up :: (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_go_up cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__go_up (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_go_up" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorFileDialog._go_up

{-# NOINLINE bindEditorFileDialog__item_db_selected #-}

bindEditorFileDialog__item_db_selected :: MethodBind
bindEditorFileDialog__item_db_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_item_db_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_item_db_selected ::
                    (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_item_db_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__item_db_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_item_db_selected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._item_db_selected

{-# NOINLINE bindEditorFileDialog__item_list_item_rmb_selected #-}

bindEditorFileDialog__item_list_item_rmb_selected :: MethodBind
bindEditorFileDialog__item_list_item_rmb_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_item_list_item_rmb_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_item_list_item_rmb_selected ::
                               (EditorFileDialog :< cls, Object :< cls) =>
                               cls -> Int -> Vector2 -> IO ()
_item_list_item_rmb_selected cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileDialog__item_list_item_rmb_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_item_list_item_rmb_selected"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod
          = Godot.Tools.EditorFileDialog._item_list_item_rmb_selected

{-# NOINLINE bindEditorFileDialog__item_list_rmb_clicked #-}

bindEditorFileDialog__item_list_rmb_clicked :: MethodBind
bindEditorFileDialog__item_list_rmb_clicked
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_item_list_rmb_clicked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_item_list_rmb_clicked ::
                         (EditorFileDialog :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_item_list_rmb_clicked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__item_list_rmb_clicked
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_item_list_rmb_clicked"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._item_list_rmb_clicked

{-# NOINLINE bindEditorFileDialog__item_menu_id_pressed #-}

bindEditorFileDialog__item_menu_id_pressed :: MethodBind
bindEditorFileDialog__item_menu_id_pressed
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_item_menu_id_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_item_menu_id_pressed ::
                        (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_item_menu_id_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__item_menu_id_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_item_menu_id_pressed" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._item_menu_id_pressed

{-# NOINLINE bindEditorFileDialog__item_selected #-}

bindEditorFileDialog__item_selected :: MethodBind
bindEditorFileDialog__item_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_item_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_item_selected ::
                 (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_item_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__item_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_item_selected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._item_selected

{-# NOINLINE bindEditorFileDialog__items_clear_selection #-}

bindEditorFileDialog__items_clear_selection :: MethodBind
bindEditorFileDialog__items_clear_selection
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_items_clear_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_items_clear_selection ::
                         (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_items_clear_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__items_clear_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_items_clear_selection" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._items_clear_selection

{-# NOINLINE bindEditorFileDialog__make_dir #-}

bindEditorFileDialog__make_dir :: MethodBind
bindEditorFileDialog__make_dir
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_make_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_make_dir ::
            (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_make_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__make_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_make_dir" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorFileDialog._make_dir

{-# NOINLINE bindEditorFileDialog__make_dir_confirm #-}

bindEditorFileDialog__make_dir_confirm :: MethodBind
bindEditorFileDialog__make_dir_confirm
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_make_dir_confirm" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_make_dir_confirm ::
                    (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_make_dir_confirm cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__make_dir_confirm
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_make_dir_confirm" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._make_dir_confirm

{-# NOINLINE bindEditorFileDialog__multi_selected #-}

bindEditorFileDialog__multi_selected :: MethodBind
bindEditorFileDialog__multi_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_multi_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_multi_selected ::
                  (EditorFileDialog :< cls, Object :< cls) =>
                  cls -> Int -> Bool -> IO ()
_multi_selected cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__multi_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_multi_selected" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._multi_selected

{-# NOINLINE bindEditorFileDialog__recent_selected #-}

bindEditorFileDialog__recent_selected :: MethodBind
bindEditorFileDialog__recent_selected
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_recent_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_recent_selected ::
                   (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_recent_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__recent_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_recent_selected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._recent_selected

{-# NOINLINE bindEditorFileDialog__save_confirm_pressed #-}

bindEditorFileDialog__save_confirm_pressed :: MethodBind
bindEditorFileDialog__save_confirm_pressed
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_save_confirm_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_save_confirm_pressed ::
                        (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_save_confirm_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__save_confirm_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_save_confirm_pressed" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._save_confirm_pressed

{-# NOINLINE bindEditorFileDialog__select_drive #-}

bindEditorFileDialog__select_drive :: MethodBind
bindEditorFileDialog__select_drive
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_select_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_select_drive ::
                (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_select_drive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__select_drive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_select_drive" '[Int] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._select_drive

{-# NOINLINE bindEditorFileDialog__thumbnail_done #-}

bindEditorFileDialog__thumbnail_done :: MethodBind
bindEditorFileDialog__thumbnail_done
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_thumbnail_done" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_thumbnail_done ::
                  (EditorFileDialog :< cls, Object :< cls) =>
                  cls -> GodotString -> Texture -> Texture -> GodotVariant -> IO ()
_thumbnail_done cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__thumbnail_done
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_thumbnail_done"
           '[GodotString, Texture, Texture, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._thumbnail_done

{-# NOINLINE bindEditorFileDialog__thumbnail_result #-}

bindEditorFileDialog__thumbnail_result :: MethodBind
bindEditorFileDialog__thumbnail_result
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_thumbnail_result" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_thumbnail_result ::
                    (EditorFileDialog :< cls, Object :< cls) =>
                    cls -> GodotString -> Texture -> Texture -> GodotVariant -> IO ()
_thumbnail_result cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__thumbnail_result
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_thumbnail_result"
           '[GodotString, Texture, Texture, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._thumbnail_result

{-# NOINLINE bindEditorFileDialog__unhandled_input #-}

bindEditorFileDialog__unhandled_input :: MethodBind
bindEditorFileDialog__unhandled_input
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unhandled_input ::
                   (EditorFileDialog :< cls, Object :< cls) =>
                   cls -> InputEvent -> IO ()
_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__unhandled_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_unhandled_input"
           '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._unhandled_input

{-# NOINLINE bindEditorFileDialog__update_dir #-}

bindEditorFileDialog__update_dir :: MethodBind
bindEditorFileDialog__update_dir
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_update_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_dir ::
              (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_update_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__update_dir
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_update_dir" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._update_dir

{-# NOINLINE bindEditorFileDialog__update_file_list #-}

bindEditorFileDialog__update_file_list :: MethodBind
bindEditorFileDialog__update_file_list
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_update_file_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_file_list ::
                    (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_update_file_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__update_file_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_update_file_list" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._update_file_list

{-# NOINLINE bindEditorFileDialog__update_file_name #-}

bindEditorFileDialog__update_file_name :: MethodBind
bindEditorFileDialog__update_file_name
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "_update_file_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_file_name ::
                    (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
_update_file_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog__update_file_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "_update_file_name" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog._update_file_name

{-# NOINLINE bindEditorFileDialog_add_filter #-}

-- | Adds a comma-delimited file extension filter option to the @EditorFileDialog@ with an optional semi-colon-delimited label.
--   				For example, @"*.tscn, *.scn; Scenes"@ results in filter text "Scenes (*.tscn, *.scn)".
bindEditorFileDialog_add_filter :: MethodBind
bindEditorFileDialog_add_filter
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "add_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a comma-delimited file extension filter option to the @EditorFileDialog@ with an optional semi-colon-delimited label.
--   				For example, @"*.tscn, *.scn; Scenes"@ results in filter text "Scenes (*.tscn, *.scn)".
add_filter ::
             (EditorFileDialog :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
add_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_add_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "add_filter" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.add_filter

{-# NOINLINE bindEditorFileDialog_clear_filters #-}

-- | Removes all filters except for "All Files (*)".
bindEditorFileDialog_clear_filters :: MethodBind
bindEditorFileDialog_clear_filters
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "clear_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all filters except for "All Files (*)".
clear_filters ::
                (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
clear_filters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_clear_filters
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "clear_filters" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.clear_filters

{-# NOINLINE bindEditorFileDialog_get_access #-}

-- | The location from which the user may select a file, including @res://@, @user://@, and the local file system.
bindEditorFileDialog_get_access :: MethodBind
bindEditorFileDialog_get_access
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_access" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The location from which the user may select a file, including @res://@, @user://@, and the local file system.
get_access ::
             (EditorFileDialog :< cls, Object :< cls) => cls -> IO Int
get_access cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_access (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_access" '[] (IO Int)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.get_access

{-# NOINLINE bindEditorFileDialog_get_current_dir #-}

-- | The currently occupied directory.
bindEditorFileDialog_get_current_dir :: MethodBind
bindEditorFileDialog_get_current_dir
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_current_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently occupied directory.
get_current_dir ::
                  (EditorFileDialog :< cls, Object :< cls) => cls -> IO GodotString
get_current_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_current_dir
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_current_dir" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.get_current_dir

{-# NOINLINE bindEditorFileDialog_get_current_file #-}

-- | The currently selected file.
bindEditorFileDialog_get_current_file :: MethodBind
bindEditorFileDialog_get_current_file
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_current_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected file.
get_current_file ::
                   (EditorFileDialog :< cls, Object :< cls) => cls -> IO GodotString
get_current_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_current_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_current_file" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.get_current_file

{-# NOINLINE bindEditorFileDialog_get_current_path #-}

-- | The file system path in the address bar.
bindEditorFileDialog_get_current_path :: MethodBind
bindEditorFileDialog_get_current_path
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_current_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file system path in the address bar.
get_current_path ::
                   (EditorFileDialog :< cls, Object :< cls) => cls -> IO GodotString
get_current_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_current_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_current_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.get_current_path

{-# NOINLINE bindEditorFileDialog_get_display_mode #-}

-- | The view format in which the @EditorFileDialog@ displays resources to the user.
bindEditorFileDialog_get_display_mode :: MethodBind
bindEditorFileDialog_get_display_mode
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_display_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The view format in which the @EditorFileDialog@ displays resources to the user.
get_display_mode ::
                   (EditorFileDialog :< cls, Object :< cls) => cls -> IO Int
get_display_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_display_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_display_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.get_display_mode

{-# NOINLINE bindEditorFileDialog_get_mode #-}

-- | The purpose of the @EditorFileDialog@, which defines the allowed behaviors.
bindEditorFileDialog_get_mode :: MethodBind
bindEditorFileDialog_get_mode
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The purpose of the @EditorFileDialog@, which defines the allowed behaviors.
get_mode ::
           (EditorFileDialog :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Tools.EditorFileDialog.get_mode

{-# NOINLINE bindEditorFileDialog_get_vbox #-}

-- | Returns the @VBoxContainer@ used to display the file system.
--   				__Warning:__ This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their @CanvasItem.visible@ property.
bindEditorFileDialog_get_vbox :: MethodBind
bindEditorFileDialog_get_vbox
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "get_vbox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @VBoxContainer@ used to display the file system.
--   				__Warning:__ This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their @CanvasItem.visible@ property.
get_vbox ::
           (EditorFileDialog :< cls, Object :< cls) => cls -> IO VBoxContainer
get_vbox cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_get_vbox (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "get_vbox" '[]
           (IO VBoxContainer)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.get_vbox

{-# NOINLINE bindEditorFileDialog_invalidate #-}

-- | Notify the @EditorFileDialog@ that its view of the data is no longer accurate. Updates the view contents on next view update.
bindEditorFileDialog_invalidate :: MethodBind
bindEditorFileDialog_invalidate
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "invalidate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Notify the @EditorFileDialog@ that its view of the data is no longer accurate. Updates the view contents on next view update.
invalidate ::
             (EditorFileDialog :< cls, Object :< cls) => cls -> IO ()
invalidate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_invalidate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "invalidate" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorFileDialog.invalidate

{-# NOINLINE bindEditorFileDialog_is_overwrite_warning_disabled #-}

-- | If @true@, the @EditorFileDialog@ will not warn the user before overwriting files.
bindEditorFileDialog_is_overwrite_warning_disabled :: MethodBind
bindEditorFileDialog_is_overwrite_warning_disabled
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "is_overwrite_warning_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @EditorFileDialog@ will not warn the user before overwriting files.
is_overwrite_warning_disabled ::
                                (EditorFileDialog :< cls, Object :< cls) => cls -> IO Bool
is_overwrite_warning_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileDialog_is_overwrite_warning_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog
           "is_overwrite_warning_disabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Tools.EditorFileDialog.is_overwrite_warning_disabled

{-# NOINLINE bindEditorFileDialog_is_showing_hidden_files #-}

-- | If @true@, hidden files and directories will be visible in the @EditorFileDialog@.
bindEditorFileDialog_is_showing_hidden_files :: MethodBind
bindEditorFileDialog_is_showing_hidden_files
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "is_showing_hidden_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hidden files and directories will be visible in the @EditorFileDialog@.
is_showing_hidden_files ::
                          (EditorFileDialog :< cls, Object :< cls) => cls -> IO Bool
is_showing_hidden_files cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_is_showing_hidden_files
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "is_showing_hidden_files" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorFileDialog.is_showing_hidden_files

{-# NOINLINE bindEditorFileDialog_set_access #-}

-- | The location from which the user may select a file, including @res://@, @user://@, and the local file system.
bindEditorFileDialog_set_access :: MethodBind
bindEditorFileDialog_set_access
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_access" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The location from which the user may select a file, including @res://@, @user://@, and the local file system.
set_access ::
             (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_access cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_access (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_access" '[Int] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_access

{-# NOINLINE bindEditorFileDialog_set_current_dir #-}

-- | The currently occupied directory.
bindEditorFileDialog_set_current_dir :: MethodBind
bindEditorFileDialog_set_current_dir
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_current_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently occupied directory.
set_current_dir ::
                  (EditorFileDialog :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_current_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_current_dir
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_current_dir"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_current_dir

{-# NOINLINE bindEditorFileDialog_set_current_file #-}

-- | The currently selected file.
bindEditorFileDialog_set_current_file :: MethodBind
bindEditorFileDialog_set_current_file
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_current_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently selected file.
set_current_file ::
                   (EditorFileDialog :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
set_current_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_current_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_current_file"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_current_file

{-# NOINLINE bindEditorFileDialog_set_current_path #-}

-- | The file system path in the address bar.
bindEditorFileDialog_set_current_path :: MethodBind
bindEditorFileDialog_set_current_path
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_current_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file system path in the address bar.
set_current_path ::
                   (EditorFileDialog :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
set_current_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_current_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_current_path"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_current_path

{-# NOINLINE bindEditorFileDialog_set_disable_overwrite_warning #-}

-- | If @true@, the @EditorFileDialog@ will not warn the user before overwriting files.
bindEditorFileDialog_set_disable_overwrite_warning :: MethodBind
bindEditorFileDialog_set_disable_overwrite_warning
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_disable_overwrite_warning" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @EditorFileDialog@ will not warn the user before overwriting files.
set_disable_overwrite_warning ::
                                (EditorFileDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_overwrite_warning cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileDialog_set_disable_overwrite_warning
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog
           "set_disable_overwrite_warning"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Tools.EditorFileDialog.set_disable_overwrite_warning

{-# NOINLINE bindEditorFileDialog_set_display_mode #-}

-- | The view format in which the @EditorFileDialog@ displays resources to the user.
bindEditorFileDialog_set_display_mode :: MethodBind
bindEditorFileDialog_set_display_mode
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_display_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The view format in which the @EditorFileDialog@ displays resources to the user.
set_display_mode ::
                   (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_display_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_display_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_display_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_display_mode

{-# NOINLINE bindEditorFileDialog_set_mode #-}

-- | The purpose of the @EditorFileDialog@, which defines the allowed behaviors.
bindEditorFileDialog_set_mode :: MethodBind
bindEditorFileDialog_set_mode
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The purpose of the @EditorFileDialog@, which defines the allowed behaviors.
set_mode ::
           (EditorFileDialog :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_mode

{-# NOINLINE bindEditorFileDialog_set_show_hidden_files #-}

-- | If @true@, hidden files and directories will be visible in the @EditorFileDialog@.
bindEditorFileDialog_set_show_hidden_files :: MethodBind
bindEditorFileDialog_set_show_hidden_files
  = unsafePerformIO $
      withCString "EditorFileDialog" $
        \ clsNamePtr ->
          withCString "set_show_hidden_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, hidden files and directories will be visible in the @EditorFileDialog@.
set_show_hidden_files ::
                        (EditorFileDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_show_hidden_files cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileDialog_set_show_hidden_files
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileDialog "set_show_hidden_files"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileDialog.set_show_hidden_files