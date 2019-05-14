{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.ScriptEditor
       (Godot.Tools.ScriptEditor.sig_editor_script_changed,
        Godot.Tools.ScriptEditor.sig_script_close,
        Godot.Tools.ScriptEditor._file_dialog_action,
        Godot.Tools.ScriptEditor._tab_changed,
        Godot.Tools.ScriptEditor._menu_option,
        Godot.Tools.ScriptEditor._close_current_tab,
        Godot.Tools.ScriptEditor._close_discard_current_tab,
        Godot.Tools.ScriptEditor._close_docs_tab,
        Godot.Tools.ScriptEditor._close_all_tabs,
        Godot.Tools.ScriptEditor._close_other_tabs,
        Godot.Tools.ScriptEditor._open_recent_script,
        Godot.Tools.ScriptEditor._theme_option,
        Godot.Tools.ScriptEditor._editor_play,
        Godot.Tools.ScriptEditor._editor_pause,
        Godot.Tools.ScriptEditor._editor_stop,
        Godot.Tools.ScriptEditor._add_callback,
        Godot.Tools.ScriptEditor._reload_scripts,
        Godot.Tools.ScriptEditor._resave_scripts,
        Godot.Tools.ScriptEditor._res_saved_callback,
        Godot.Tools.ScriptEditor._goto_script_line,
        Godot.Tools.ScriptEditor._goto_script_line2,
        Godot.Tools.ScriptEditor._help_search,
        Godot.Tools.ScriptEditor._save_history,
        Godot.Tools.ScriptEditor._copy_script_path,
        Godot.Tools.ScriptEditor._breaked,
        Godot.Tools.ScriptEditor._show_debugger,
        Godot.Tools.ScriptEditor._get_debug_tooltip,
        Godot.Tools.ScriptEditor._autosave_scripts,
        Godot.Tools.ScriptEditor._editor_settings_changed,
        Godot.Tools.ScriptEditor._update_script_names,
        Godot.Tools.ScriptEditor._tree_changed,
        Godot.Tools.ScriptEditor._members_overview_selected,
        Godot.Tools.ScriptEditor._help_overview_selected,
        Godot.Tools.ScriptEditor._script_selected,
        Godot.Tools.ScriptEditor._script_created,
        Godot.Tools.ScriptEditor._script_split_dragged,
        Godot.Tools.ScriptEditor._help_class_open,
        Godot.Tools.ScriptEditor._help_class_goto,
        Godot.Tools.ScriptEditor._request_help,
        Godot.Tools.ScriptEditor._history_forward,
        Godot.Tools.ScriptEditor._history_back,
        Godot.Tools.ScriptEditor._live_auto_reload_running_scripts,
        Godot.Tools.ScriptEditor._unhandled_input,
        Godot.Tools.ScriptEditor._script_list_gui_input,
        Godot.Tools.ScriptEditor._toggle_members_overview_alpha_sort,
        Godot.Tools.ScriptEditor._update_members_overview,
        Godot.Tools.ScriptEditor._script_changed,
        Godot.Tools.ScriptEditor._update_recent_scripts,
        Godot.Tools.ScriptEditor._on_find_in_files_requested,
        Godot.Tools.ScriptEditor._start_find_in_files,
        Godot.Tools.ScriptEditor._on_find_in_files_result_selected,
        Godot.Tools.ScriptEditor._on_find_in_files_modified_files,
        Godot.Tools.ScriptEditor.get_drag_data_fw,
        Godot.Tools.ScriptEditor.can_drop_data_fw,
        Godot.Tools.ScriptEditor.drop_data_fw,
        Godot.Tools.ScriptEditor.get_current_script,
        Godot.Tools.ScriptEditor.get_open_scripts,
        Godot.Tools.ScriptEditor.open_script_create_dialog)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when user changed active script. Argument is a freshly activated [Script].
sig_editor_script_changed ::
                          Godot.Internal.Dispatch.Signal ScriptEditor
sig_editor_script_changed
  = Godot.Internal.Dispatch.Signal "editor_script_changed"

-- | Emitted when editor is about to close the active script. Argument is a [Script] that is going to be closed.
sig_script_close :: Godot.Internal.Dispatch.Signal ScriptEditor
sig_script_close = Godot.Internal.Dispatch.Signal "script_close"

{-# NOINLINE bindScriptEditor__file_dialog_action #-}

bindScriptEditor__file_dialog_action :: MethodBind
bindScriptEditor__file_dialog_action
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_file_dialog_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_file_dialog_action ::
                      (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_file_dialog_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__file_dialog_action
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__tab_changed #-}

bindScriptEditor__tab_changed :: MethodBind
bindScriptEditor__tab_changed
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_tab_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tab_changed ::
               (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_tab_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__tab_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__menu_option #-}

bindScriptEditor__menu_option :: MethodBind
bindScriptEditor__menu_option
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_menu_option" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_menu_option ::
               (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_menu_option cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__menu_option (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__close_current_tab #-}

bindScriptEditor__close_current_tab :: MethodBind
bindScriptEditor__close_current_tab
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_close_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_close_current_tab ::
                     (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_close_current_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__close_current_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__close_discard_current_tab #-}

bindScriptEditor__close_discard_current_tab :: MethodBind
bindScriptEditor__close_discard_current_tab
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_close_discard_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_close_discard_current_tab ::
                             (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_close_discard_current_tab cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__close_discard_current_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__close_docs_tab #-}

bindScriptEditor__close_docs_tab :: MethodBind
bindScriptEditor__close_docs_tab
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_close_docs_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_close_docs_tab ::
                  (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_close_docs_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__close_docs_tab
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__close_all_tabs #-}

bindScriptEditor__close_all_tabs :: MethodBind
bindScriptEditor__close_all_tabs
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_close_all_tabs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_close_all_tabs ::
                  (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_close_all_tabs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__close_all_tabs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__close_other_tabs #-}

bindScriptEditor__close_other_tabs :: MethodBind
bindScriptEditor__close_other_tabs
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_close_other_tabs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_close_other_tabs ::
                    (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_close_other_tabs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__close_other_tabs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__open_recent_script #-}

bindScriptEditor__open_recent_script :: MethodBind
bindScriptEditor__open_recent_script
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_open_recent_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_open_recent_script ::
                      (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_open_recent_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__open_recent_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__theme_option #-}

bindScriptEditor__theme_option :: MethodBind
bindScriptEditor__theme_option
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_theme_option" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_theme_option ::
                (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_theme_option cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__theme_option (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__editor_play #-}

bindScriptEditor__editor_play :: MethodBind
bindScriptEditor__editor_play
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_editor_play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_editor_play ::
               (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_editor_play cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__editor_play (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__editor_pause #-}

bindScriptEditor__editor_pause :: MethodBind
bindScriptEditor__editor_pause
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_editor_pause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_editor_pause ::
                (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_editor_pause cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__editor_pause (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__editor_stop #-}

bindScriptEditor__editor_stop :: MethodBind
bindScriptEditor__editor_stop
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_editor_stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_editor_stop ::
               (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_editor_stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__editor_stop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__add_callback #-}

bindScriptEditor__add_callback :: MethodBind
bindScriptEditor__add_callback
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_add_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_add_callback ::
                (ScriptEditor :< cls, Object :< cls) =>
                cls -> Object -> GodotString -> PoolStringArray -> IO ()
_add_callback cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__add_callback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__reload_scripts #-}

bindScriptEditor__reload_scripts :: MethodBind
bindScriptEditor__reload_scripts
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_reload_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_scripts ::
                  (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_reload_scripts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__reload_scripts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__resave_scripts #-}

bindScriptEditor__resave_scripts :: MethodBind
bindScriptEditor__resave_scripts
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_resave_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_resave_scripts ::
                  (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_resave_scripts cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__resave_scripts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__res_saved_callback #-}

bindScriptEditor__res_saved_callback :: MethodBind
bindScriptEditor__res_saved_callback
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_res_saved_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_res_saved_callback ::
                      (ScriptEditor :< cls, Object :< cls) => cls -> Resource -> IO ()
_res_saved_callback cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__res_saved_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__goto_script_line #-}

bindScriptEditor__goto_script_line :: MethodBind
bindScriptEditor__goto_script_line
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_goto_script_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_goto_script_line ::
                    (ScriptEditor :< cls, Object :< cls) =>
                    cls -> Reference -> Int -> IO ()
_goto_script_line cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__goto_script_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__goto_script_line2 #-}

bindScriptEditor__goto_script_line2 :: MethodBind
bindScriptEditor__goto_script_line2
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_goto_script_line2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_goto_script_line2 ::
                     (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_goto_script_line2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__goto_script_line2
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__help_search #-}

bindScriptEditor__help_search :: MethodBind
bindScriptEditor__help_search
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_help_search" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_help_search ::
               (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_help_search cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__help_search (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__save_history #-}

bindScriptEditor__save_history :: MethodBind
bindScriptEditor__save_history
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_save_history" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_save_history ::
                (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_save_history cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__save_history (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__copy_script_path #-}

bindScriptEditor__copy_script_path :: MethodBind
bindScriptEditor__copy_script_path
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_copy_script_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_copy_script_path ::
                    (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_copy_script_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__copy_script_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__breaked #-}

bindScriptEditor__breaked :: MethodBind
bindScriptEditor__breaked
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_breaked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_breaked ::
           (ScriptEditor :< cls, Object :< cls) =>
           cls -> Bool -> Bool -> IO ()
_breaked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__breaked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__show_debugger #-}

bindScriptEditor__show_debugger :: MethodBind
bindScriptEditor__show_debugger
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_show_debugger" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_show_debugger ::
                 (ScriptEditor :< cls, Object :< cls) => cls -> Bool -> IO ()
_show_debugger cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__show_debugger (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__get_debug_tooltip #-}

bindScriptEditor__get_debug_tooltip :: MethodBind
bindScriptEditor__get_debug_tooltip
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_get_debug_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_debug_tooltip ::
                     (ScriptEditor :< cls, Object :< cls) =>
                     cls -> GodotString -> Node -> IO GodotString
_get_debug_tooltip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__get_debug_tooltip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__autosave_scripts #-}

bindScriptEditor__autosave_scripts :: MethodBind
bindScriptEditor__autosave_scripts
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_autosave_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_autosave_scripts ::
                    (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_autosave_scripts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__autosave_scripts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__editor_settings_changed #-}

bindScriptEditor__editor_settings_changed :: MethodBind
bindScriptEditor__editor_settings_changed
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_editor_settings_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_editor_settings_changed ::
                           (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_editor_settings_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__editor_settings_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__update_script_names #-}

bindScriptEditor__update_script_names :: MethodBind
bindScriptEditor__update_script_names
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_update_script_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_script_names ::
                       (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_update_script_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__update_script_names
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__tree_changed #-}

bindScriptEditor__tree_changed :: MethodBind
bindScriptEditor__tree_changed
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__tree_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__members_overview_selected #-}

bindScriptEditor__members_overview_selected :: MethodBind
bindScriptEditor__members_overview_selected
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_members_overview_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_members_overview_selected ::
                             (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_members_overview_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__members_overview_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__help_overview_selected #-}

bindScriptEditor__help_overview_selected :: MethodBind
bindScriptEditor__help_overview_selected
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_help_overview_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_help_overview_selected ::
                          (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_help_overview_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__help_overview_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__script_selected #-}

bindScriptEditor__script_selected :: MethodBind
bindScriptEditor__script_selected
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_script_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_script_selected ::
                   (ScriptEditor :< cls, Object :< cls) => cls -> Int -> IO ()
_script_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__script_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__script_created #-}

bindScriptEditor__script_created :: MethodBind
bindScriptEditor__script_created
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_script_created" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_script_created ::
                  (ScriptEditor :< cls, Object :< cls) => cls -> Script -> IO ()
_script_created cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__script_created
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__script_split_dragged #-}

bindScriptEditor__script_split_dragged :: MethodBind
bindScriptEditor__script_split_dragged
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_script_split_dragged" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_script_split_dragged ::
                        (ScriptEditor :< cls, Object :< cls) => cls -> Float -> IO ()
_script_split_dragged cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__script_split_dragged
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__help_class_open #-}

bindScriptEditor__help_class_open :: MethodBind
bindScriptEditor__help_class_open
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_help_class_open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_help_class_open ::
                   (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_help_class_open cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__help_class_open
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__help_class_goto #-}

bindScriptEditor__help_class_goto :: MethodBind
bindScriptEditor__help_class_goto
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_help_class_goto" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_help_class_goto ::
                   (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_help_class_goto cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__help_class_goto
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__request_help #-}

bindScriptEditor__request_help :: MethodBind
bindScriptEditor__request_help
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_request_help" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_request_help ::
                (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_request_help cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__request_help (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__history_forward #-}

bindScriptEditor__history_forward :: MethodBind
bindScriptEditor__history_forward
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_history_forward" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_history_forward ::
                   (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_history_forward cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__history_forward
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__history_back #-}

bindScriptEditor__history_back :: MethodBind
bindScriptEditor__history_back
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_history_back" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_history_back ::
                (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_history_back cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__history_back (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__live_auto_reload_running_scripts #-}

bindScriptEditor__live_auto_reload_running_scripts :: MethodBind
bindScriptEditor__live_auto_reload_running_scripts
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_live_auto_reload_running_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_live_auto_reload_running_scripts ::
                                    (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_live_auto_reload_running_scripts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindScriptEditor__live_auto_reload_running_scripts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__unhandled_input #-}

bindScriptEditor__unhandled_input :: MethodBind
bindScriptEditor__unhandled_input
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unhandled_input ::
                   (ScriptEditor :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__unhandled_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__script_list_gui_input #-}

bindScriptEditor__script_list_gui_input :: MethodBind
bindScriptEditor__script_list_gui_input
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_script_list_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_script_list_gui_input ::
                         (ScriptEditor :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_script_list_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__script_list_gui_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__toggle_members_overview_alpha_sort
             #-}

bindScriptEditor__toggle_members_overview_alpha_sort :: MethodBind
bindScriptEditor__toggle_members_overview_alpha_sort
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_toggle_members_overview_alpha_sort" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_toggle_members_overview_alpha_sort ::
                                      (ScriptEditor :< cls, Object :< cls) => cls -> Bool -> IO ()
_toggle_members_overview_alpha_sort cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindScriptEditor__toggle_members_overview_alpha_sort
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__update_members_overview #-}

bindScriptEditor__update_members_overview :: MethodBind
bindScriptEditor__update_members_overview
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_update_members_overview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_members_overview ::
                           (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_update_members_overview cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__update_members_overview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__script_changed #-}

bindScriptEditor__script_changed :: MethodBind
bindScriptEditor__script_changed
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_script_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_script_changed ::
                  (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_script_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__script_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__update_recent_scripts #-}

bindScriptEditor__update_recent_scripts :: MethodBind
bindScriptEditor__update_recent_scripts
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_update_recent_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_recent_scripts ::
                         (ScriptEditor :< cls, Object :< cls) => cls -> IO ()
_update_recent_scripts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__update_recent_scripts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__on_find_in_files_requested #-}

bindScriptEditor__on_find_in_files_requested :: MethodBind
bindScriptEditor__on_find_in_files_requested
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_on_find_in_files_requested" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_on_find_in_files_requested ::
                              (ScriptEditor :< cls, Object :< cls) => cls -> GodotString -> IO ()
_on_find_in_files_requested cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__on_find_in_files_requested
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__start_find_in_files #-}

bindScriptEditor__start_find_in_files :: MethodBind
bindScriptEditor__start_find_in_files
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_start_find_in_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_start_find_in_files ::
                       (ScriptEditor :< cls, Object :< cls) => cls -> Bool -> IO ()
_start_find_in_files cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor__start_find_in_files
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__on_find_in_files_result_selected #-}

bindScriptEditor__on_find_in_files_result_selected :: MethodBind
bindScriptEditor__on_find_in_files_result_selected
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_on_find_in_files_result_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_on_find_in_files_result_selected ::
                                    (ScriptEditor :< cls, Object :< cls) =>
                                    cls -> GodotString -> Int -> Int -> Int -> IO ()
_on_find_in_files_result_selected cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindScriptEditor__on_find_in_files_result_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor__on_find_in_files_modified_files #-}

bindScriptEditor__on_find_in_files_modified_files :: MethodBind
bindScriptEditor__on_find_in_files_modified_files
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "_on_find_in_files_modified_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_on_find_in_files_modified_files ::
                                   (ScriptEditor :< cls, Object :< cls) =>
                                   cls -> PoolStringArray -> IO ()
_on_find_in_files_modified_files cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindScriptEditor__on_find_in_files_modified_files
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor_get_drag_data_fw #-}

bindScriptEditor_get_drag_data_fw :: MethodBind
bindScriptEditor_get_drag_data_fw
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "get_drag_data_fw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_drag_data_fw ::
                   (ScriptEditor :< cls, Object :< cls) =>
                   cls -> Vector2 -> Control -> IO GodotVariant
get_drag_data_fw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor_get_drag_data_fw
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor_can_drop_data_fw #-}

bindScriptEditor_can_drop_data_fw :: MethodBind
bindScriptEditor_can_drop_data_fw
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "can_drop_data_fw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

can_drop_data_fw ::
                   (ScriptEditor :< cls, Object :< cls) =>
                   cls -> Vector2 -> GodotVariant -> Control -> IO Bool
can_drop_data_fw cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor_can_drop_data_fw
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor_drop_data_fw #-}

bindScriptEditor_drop_data_fw :: MethodBind
bindScriptEditor_drop_data_fw
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "drop_data_fw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

drop_data_fw ::
               (ScriptEditor :< cls, Object :< cls) =>
               cls -> Vector2 -> GodotVariant -> Control -> IO ()
drop_data_fw cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor_drop_data_fw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor_get_current_script #-}

-- | Returns a [Script] that is currently active in editor.
bindScriptEditor_get_current_script :: MethodBind
bindScriptEditor_get_current_script
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "get_current_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [Script] that is currently active in editor.
get_current_script ::
                     (ScriptEditor :< cls, Object :< cls) => cls -> IO Script
get_current_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor_get_current_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor_get_open_scripts #-}

-- | Returns an array with all [Script] objects which are currently open in editor.
bindScriptEditor_get_open_scripts :: MethodBind
bindScriptEditor_get_open_scripts
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "get_open_scripts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all [Script] objects which are currently open in editor.
get_open_scripts ::
                   (ScriptEditor :< cls, Object :< cls) => cls -> IO Array
get_open_scripts cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor_get_open_scripts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptEditor_open_script_create_dialog #-}

bindScriptEditor_open_script_create_dialog :: MethodBind
bindScriptEditor_open_script_create_dialog
  = unsafePerformIO $
      withCString "ScriptEditor" $
        \ clsNamePtr ->
          withCString "open_script_create_dialog" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

open_script_create_dialog ::
                            (ScriptEditor :< cls, Object :< cls) =>
                            cls -> GodotString -> GodotString -> IO ()
open_script_create_dialog cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptEditor_open_script_create_dialog
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)