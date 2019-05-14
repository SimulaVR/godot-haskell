{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorPlugin
       (Godot.Tools.EditorPlugin._CONTAINER_SPATIAL_EDITOR_SIDE_LEFT,
        Godot.Tools.EditorPlugin._CONTAINER_SPATIAL_EDITOR_BOTTOM,
        Godot.Tools.EditorPlugin._DOCK_SLOT_LEFT_UR,
        Godot.Tools.EditorPlugin._CONTAINER_SPATIAL_EDITOR_SIDE_RIGHT,
        Godot.Tools.EditorPlugin._DOCK_SLOT_LEFT_BL,
        Godot.Tools.EditorPlugin._CONTAINER_SPATIAL_EDITOR_MENU,
        Godot.Tools.EditorPlugin._DOCK_SLOT_RIGHT_BR,
        Godot.Tools.EditorPlugin._DOCK_SLOT_RIGHT_BL,
        Godot.Tools.EditorPlugin._CONTAINER_CANVAS_EDITOR_BOTTOM,
        Godot.Tools.EditorPlugin._CONTAINER_CANVAS_EDITOR_SIDE_LEFT,
        Godot.Tools.EditorPlugin._CONTAINER_PROPERTY_EDITOR_BOTTOM,
        Godot.Tools.EditorPlugin._CONTAINER_TOOLBAR,
        Godot.Tools.EditorPlugin._DOCK_SLOT_RIGHT_UL,
        Godot.Tools.EditorPlugin._DOCK_SLOT_RIGHT_UR,
        Godot.Tools.EditorPlugin._DOCK_SLOT_LEFT_UL,
        Godot.Tools.EditorPlugin._CONTAINER_CANVAS_EDITOR_MENU,
        Godot.Tools.EditorPlugin._CONTAINER_CANVAS_EDITOR_SIDE_RIGHT,
        Godot.Tools.EditorPlugin._DOCK_SLOT_LEFT_BR,
        Godot.Tools.EditorPlugin._DOCK_SLOT_MAX,
        Godot.Tools.EditorPlugin.sig_main_screen_changed,
        Godot.Tools.EditorPlugin.sig_scene_closed,
        Godot.Tools.EditorPlugin.sig_scene_changed,
        Godot.Tools.EditorPlugin.sig_resource_saved,
        Godot.Tools.EditorPlugin.forward_canvas_gui_input,
        Godot.Tools.EditorPlugin.forward_canvas_draw_over_viewport,
        Godot.Tools.EditorPlugin.forward_canvas_force_draw_over_viewport,
        Godot.Tools.EditorPlugin.forward_spatial_gui_input,
        Godot.Tools.EditorPlugin.get_plugin_name,
        Godot.Tools.EditorPlugin.get_plugin_icon,
        Godot.Tools.EditorPlugin.has_main_screen,
        Godot.Tools.EditorPlugin.make_visible,
        Godot.Tools.EditorPlugin.edit, Godot.Tools.EditorPlugin.handles,
        Godot.Tools.EditorPlugin.get_state,
        Godot.Tools.EditorPlugin.set_state, Godot.Tools.EditorPlugin.clear,
        Godot.Tools.EditorPlugin.save_external_data,
        Godot.Tools.EditorPlugin.apply_changes,
        Godot.Tools.EditorPlugin.get_breakpoints,
        Godot.Tools.EditorPlugin.set_window_layout,
        Godot.Tools.EditorPlugin.get_window_layout,
        Godot.Tools.EditorPlugin.build,
        Godot.Tools.EditorPlugin.enable_plugin,
        Godot.Tools.EditorPlugin.disable_plugin,
        Godot.Tools.EditorPlugin.add_control_to_container,
        Godot.Tools.EditorPlugin.add_control_to_bottom_panel,
        Godot.Tools.EditorPlugin.add_control_to_dock,
        Godot.Tools.EditorPlugin.remove_control_from_docks,
        Godot.Tools.EditorPlugin.remove_control_from_bottom_panel,
        Godot.Tools.EditorPlugin.remove_control_from_container,
        Godot.Tools.EditorPlugin.add_tool_menu_item,
        Godot.Tools.EditorPlugin.add_tool_submenu_item,
        Godot.Tools.EditorPlugin.remove_tool_menu_item,
        Godot.Tools.EditorPlugin.add_custom_type,
        Godot.Tools.EditorPlugin.remove_custom_type,
        Godot.Tools.EditorPlugin.add_autoload_singleton,
        Godot.Tools.EditorPlugin.remove_autoload_singleton,
        Godot.Tools.EditorPlugin.update_overlays,
        Godot.Tools.EditorPlugin.make_bottom_panel_item_visible,
        Godot.Tools.EditorPlugin.hide_bottom_panel,
        Godot.Tools.EditorPlugin.get_undo_redo,
        Godot.Tools.EditorPlugin.queue_save_layout,
        Godot.Tools.EditorPlugin.add_import_plugin,
        Godot.Tools.EditorPlugin.remove_import_plugin,
        Godot.Tools.EditorPlugin.add_scene_import_plugin,
        Godot.Tools.EditorPlugin.remove_scene_import_plugin,
        Godot.Tools.EditorPlugin.add_export_plugin,
        Godot.Tools.EditorPlugin.remove_export_plugin,
        Godot.Tools.EditorPlugin.add_spatial_gizmo_plugin,
        Godot.Tools.EditorPlugin.remove_spatial_gizmo_plugin,
        Godot.Tools.EditorPlugin.add_inspector_plugin,
        Godot.Tools.EditorPlugin.remove_inspector_plugin,
        Godot.Tools.EditorPlugin.set_input_event_forwarding_always_enabled,
        Godot.Tools.EditorPlugin.set_force_draw_over_forwarding_enabled,
        Godot.Tools.EditorPlugin.get_editor_interface,
        Godot.Tools.EditorPlugin.get_script_create_dialog)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CONTAINER_SPATIAL_EDITOR_SIDE_LEFT :: Int
_CONTAINER_SPATIAL_EDITOR_SIDE_LEFT = 2

_CONTAINER_SPATIAL_EDITOR_BOTTOM :: Int
_CONTAINER_SPATIAL_EDITOR_BOTTOM = 4

_DOCK_SLOT_LEFT_UR :: Int
_DOCK_SLOT_LEFT_UR = 2

_CONTAINER_SPATIAL_EDITOR_SIDE_RIGHT :: Int
_CONTAINER_SPATIAL_EDITOR_SIDE_RIGHT = 3

_DOCK_SLOT_LEFT_BL :: Int
_DOCK_SLOT_LEFT_BL = 1

_CONTAINER_SPATIAL_EDITOR_MENU :: Int
_CONTAINER_SPATIAL_EDITOR_MENU = 1

_DOCK_SLOT_RIGHT_BR :: Int
_DOCK_SLOT_RIGHT_BR = 7

_DOCK_SLOT_RIGHT_BL :: Int
_DOCK_SLOT_RIGHT_BL = 5

_CONTAINER_CANVAS_EDITOR_BOTTOM :: Int
_CONTAINER_CANVAS_EDITOR_BOTTOM = 8

_CONTAINER_CANVAS_EDITOR_SIDE_LEFT :: Int
_CONTAINER_CANVAS_EDITOR_SIDE_LEFT = 6

_CONTAINER_PROPERTY_EDITOR_BOTTOM :: Int
_CONTAINER_PROPERTY_EDITOR_BOTTOM = 9

_CONTAINER_TOOLBAR :: Int
_CONTAINER_TOOLBAR = 0

_DOCK_SLOT_RIGHT_UL :: Int
_DOCK_SLOT_RIGHT_UL = 4

_DOCK_SLOT_RIGHT_UR :: Int
_DOCK_SLOT_RIGHT_UR = 6

_DOCK_SLOT_LEFT_UL :: Int
_DOCK_SLOT_LEFT_UL = 0

_CONTAINER_CANVAS_EDITOR_MENU :: Int
_CONTAINER_CANVAS_EDITOR_MENU = 5

_CONTAINER_CANVAS_EDITOR_SIDE_RIGHT :: Int
_CONTAINER_CANVAS_EDITOR_SIDE_RIGHT = 7

_DOCK_SLOT_LEFT_BR :: Int
_DOCK_SLOT_LEFT_BR = 3

_DOCK_SLOT_MAX :: Int
_DOCK_SLOT_MAX = 8

-- | Emitted when user changes the workspace (2D, 3D, Script, AssetLib). Also works with custom screens defined by plugins.
sig_main_screen_changed ::
                        Godot.Internal.Dispatch.Signal EditorPlugin
sig_main_screen_changed
  = Godot.Internal.Dispatch.Signal "main_screen_changed"

-- | Emitted when user closes a scene. The argument is file path to a closed scene.
sig_scene_closed :: Godot.Internal.Dispatch.Signal EditorPlugin
sig_scene_closed = Godot.Internal.Dispatch.Signal "scene_closed"

-- | Emitted when the scene is changed in the editor. The argument will return the root node of the scene that has just become active. If this scene is new and empty, the argument will be null.
sig_scene_changed :: Godot.Internal.Dispatch.Signal EditorPlugin
sig_scene_changed = Godot.Internal.Dispatch.Signal "scene_changed"

sig_resource_saved :: Godot.Internal.Dispatch.Signal EditorPlugin
sig_resource_saved
  = Godot.Internal.Dispatch.Signal "resource_saved"

{-# NOINLINE bindEditorPlugin_forward_canvas_gui_input #-}

bindEditorPlugin_forward_canvas_gui_input :: MethodBind
bindEditorPlugin_forward_canvas_gui_input
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "forward_canvas_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

forward_canvas_gui_input ::
                           (EditorPlugin :< cls, Object :< cls) =>
                           cls -> InputEvent -> IO Bool
forward_canvas_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_forward_canvas_gui_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_forward_canvas_draw_over_viewport #-}

-- | This method is called when there is an input event in the 2D viewport, e.g. the user clicks with the mouse in the 2D space (canvas GUI). Keep in mind that for this method to be called you have to first declare the virtual method [method handles] so the editor knows that you want to work with the workspace:
--   				[codeblock]
--   				func handles(object):
--   				    return true
--   				[/codeblock]
--   				Also note that the edited scene must have a root node.
bindEditorPlugin_forward_canvas_draw_over_viewport :: MethodBind
bindEditorPlugin_forward_canvas_draw_over_viewport
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "forward_canvas_draw_over_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method is called when there is an input event in the 2D viewport, e.g. the user clicks with the mouse in the 2D space (canvas GUI). Keep in mind that for this method to be called you have to first declare the virtual method [method handles] so the editor knows that you want to work with the workspace:
--   				[codeblock]
--   				func handles(object):
--   				    return true
--   				[/codeblock]
--   				Also note that the edited scene must have a root node.
forward_canvas_draw_over_viewport ::
                                    (EditorPlugin :< cls, Object :< cls) => cls -> Control -> IO ()
forward_canvas_draw_over_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_forward_canvas_draw_over_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_forward_canvas_force_draw_over_viewport
             #-}

bindEditorPlugin_forward_canvas_force_draw_over_viewport ::
                                                         MethodBind
bindEditorPlugin_forward_canvas_force_draw_over_viewport
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "forward_canvas_force_draw_over_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

forward_canvas_force_draw_over_viewport ::
                                          (EditorPlugin :< cls, Object :< cls) =>
                                          cls -> Control -> IO ()
forward_canvas_force_draw_over_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_forward_canvas_force_draw_over_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_forward_spatial_gui_input #-}

-- | This method is called when there is an input event in the 3D viewport, e.g. the user clicks with the mouse in the 3D space (spatial GUI). Keep in mind that for this method to be called you have to first declare the virtual method [method handles] so the editor knows that you want to work with the workspace:
--   				[codeblock]
--   				func handles(object):
--   				    return true
--   				[/codeblock]
--   				Also note that the edited scene must have a root node.
bindEditorPlugin_forward_spatial_gui_input :: MethodBind
bindEditorPlugin_forward_spatial_gui_input
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "forward_spatial_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method is called when there is an input event in the 3D viewport, e.g. the user clicks with the mouse in the 3D space (spatial GUI). Keep in mind that for this method to be called you have to first declare the virtual method [method handles] so the editor knows that you want to work with the workspace:
--   				[codeblock]
--   				func handles(object):
--   				    return true
--   				[/codeblock]
--   				Also note that the edited scene must have a root node.
forward_spatial_gui_input ::
                            (EditorPlugin :< cls, Object :< cls) =>
                            cls -> Camera -> InputEvent -> IO Bool
forward_spatial_gui_input cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_forward_spatial_gui_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_plugin_name #-}

bindEditorPlugin_get_plugin_name :: MethodBind
bindEditorPlugin_get_plugin_name
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_plugin_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_plugin_name ::
                  (EditorPlugin :< cls, Object :< cls) => cls -> IO GodotString
get_plugin_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_plugin_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_plugin_icon #-}

bindEditorPlugin_get_plugin_icon :: MethodBind
bindEditorPlugin_get_plugin_icon
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_plugin_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_plugin_icon ::
                  (EditorPlugin :< cls, Object :< cls) => cls -> IO Object
get_plugin_icon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_plugin_icon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_has_main_screen #-}

-- | Return true if this is a main screen editor plugin (it goes in the workspaces selector together with '2D', '3D', and 'Script').
bindEditorPlugin_has_main_screen :: MethodBind
bindEditorPlugin_has_main_screen
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "has_main_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return true if this is a main screen editor plugin (it goes in the workspaces selector together with '2D', '3D', and 'Script').
has_main_screen ::
                  (EditorPlugin :< cls, Object :< cls) => cls -> IO Bool
has_main_screen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_has_main_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_make_visible #-}

-- | This function will be called when the editor is requested to become visible. It is used for plugins that edit a specific object type.
--   				Remember that you have to manage the visibility of all your editor controls manually.
bindEditorPlugin_make_visible :: MethodBind
bindEditorPlugin_make_visible
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "make_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function will be called when the editor is requested to become visible. It is used for plugins that edit a specific object type.
--   				Remember that you have to manage the visibility of all your editor controls manually.
make_visible ::
               (EditorPlugin :< cls, Object :< cls) => cls -> Bool -> IO ()
make_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_make_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_edit #-}

-- | This function is used for plugins that edit specific object types (nodes or resources). It requests the editor to edit the given object.
bindEditorPlugin_edit :: MethodBind
bindEditorPlugin_edit
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "edit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function is used for plugins that edit specific object types (nodes or resources). It requests the editor to edit the given object.
edit ::
       (EditorPlugin :< cls, Object :< cls) => cls -> Object -> IO ()
edit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_edit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_handles #-}

-- | Implement this function if your plugin edits a specific type of object (Resource or Node). If you return true, then you will get the functions [method EditorPlugin.edit] and [method EditorPlugin.make_visible] called when the editor requests them. If you have declared the methods [method forward_canvas_gui_input] and [method forward_spatial_gui_input] these will be called too.
bindEditorPlugin_handles :: MethodBind
bindEditorPlugin_handles
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "handles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Implement this function if your plugin edits a specific type of object (Resource or Node). If you return true, then you will get the functions [method EditorPlugin.edit] and [method EditorPlugin.make_visible] called when the editor requests them. If you have declared the methods [method forward_canvas_gui_input] and [method forward_spatial_gui_input] these will be called too.
handles ::
          (EditorPlugin :< cls, Object :< cls) => cls -> Object -> IO Bool
handles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_handles (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_state #-}

-- | Get the state of your plugin editor. This is used when saving the scene (so state is kept when opening it again) and for switching tabs (so state can be restored when the tab returns).
bindEditorPlugin_get_state :: MethodBind
bindEditorPlugin_get_state
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the state of your plugin editor. This is used when saving the scene (so state is kept when opening it again) and for switching tabs (so state can be restored when the tab returns).
get_state ::
            (EditorPlugin :< cls, Object :< cls) => cls -> IO Dictionary
get_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_state (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_set_state #-}

-- | Restore the state saved by [method EditorPlugin.get_state].
bindEditorPlugin_set_state :: MethodBind
bindEditorPlugin_set_state
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "set_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restore the state saved by [method EditorPlugin.get_state].
set_state ::
            (EditorPlugin :< cls, Object :< cls) => cls -> Dictionary -> IO ()
set_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_set_state (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_clear #-}

-- | Clear all the state and reset the object being edited to zero. This ensures your plugin does not keep editing a currently existing node, or a node from the wrong scene.
bindEditorPlugin_clear :: MethodBind
bindEditorPlugin_clear
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear all the state and reset the object being edited to zero. This ensures your plugin does not keep editing a currently existing node, or a node from the wrong scene.
clear :: (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_save_external_data #-}

-- | This method is called after the editor saves the project or when it's closed. It asks the plugin to save edited external scenes/resources.
bindEditorPlugin_save_external_data :: MethodBind
bindEditorPlugin_save_external_data
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "save_external_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method is called after the editor saves the project or when it's closed. It asks the plugin to save edited external scenes/resources.
save_external_data ::
                     (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
save_external_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_save_external_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_apply_changes #-}

-- | This method is called when the editor is about to save the project, switch to another tab, etc. It asks the plugin to apply any pending state changes to ensure consistency.
--   				This is used, for example, in shader editors to let the plugin know that it must apply the shader code being written by the user to the object.
bindEditorPlugin_apply_changes :: MethodBind
bindEditorPlugin_apply_changes
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "apply_changes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method is called when the editor is about to save the project, switch to another tab, etc. It asks the plugin to apply any pending state changes to ensure consistency.
--   				This is used, for example, in shader editors to let the plugin know that it must apply the shader code being written by the user to the object.
apply_changes ::
                (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
apply_changes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_apply_changes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_breakpoints #-}

-- | This is for editors that edit script based objects. You can return a list of breakpoints in the format (script:line), for example: res://path_to_script.gd:25
bindEditorPlugin_get_breakpoints :: MethodBind
bindEditorPlugin_get_breakpoints
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_breakpoints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is for editors that edit script based objects. You can return a list of breakpoints in the format (script:line), for example: res://path_to_script.gd:25
get_breakpoints ::
                  (EditorPlugin :< cls, Object :< cls) => cls -> IO PoolStringArray
get_breakpoints cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_breakpoints
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_set_window_layout #-}

-- | Restore the plugin GUI layout saved by [method EditorPlugin.get_window_layout].
bindEditorPlugin_set_window_layout :: MethodBind
bindEditorPlugin_set_window_layout
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "set_window_layout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restore the plugin GUI layout saved by [method EditorPlugin.get_window_layout].
set_window_layout ::
                    (EditorPlugin :< cls, Object :< cls) => cls -> ConfigFile -> IO ()
set_window_layout cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_set_window_layout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_window_layout #-}

-- | Get the GUI layout of the plugin. This is used to save the project's editor layout when [method queue_save_layout] is called or the editor layout was changed(For example changing the position of a dock).
bindEditorPlugin_get_window_layout :: MethodBind
bindEditorPlugin_get_window_layout
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_window_layout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the GUI layout of the plugin. This is used to save the project's editor layout when [method queue_save_layout] is called or the editor layout was changed(For example changing the position of a dock).
get_window_layout ::
                    (EditorPlugin :< cls, Object :< cls) => cls -> ConfigFile -> IO ()
get_window_layout cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_window_layout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_build #-}

bindEditorPlugin_build :: MethodBind
bindEditorPlugin_build
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "build" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

build :: (EditorPlugin :< cls, Object :< cls) => cls -> IO Bool
build cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_build (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_enable_plugin #-}

bindEditorPlugin_enable_plugin :: MethodBind
bindEditorPlugin_enable_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "enable_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

enable_plugin ::
                (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
enable_plugin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_enable_plugin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_disable_plugin #-}

bindEditorPlugin_disable_plugin :: MethodBind
bindEditorPlugin_disable_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "disable_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

disable_plugin ::
                 (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
disable_plugin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_disable_plugin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_control_to_container #-}

-- | Add a custom control to a container (see CONTAINER_* enum). There are many locations where custom controls can be added in the editor UI.
--   				Please remember that you have to manage the visibility of your custom controls yourself (and likely hide it after adding it).
--   				When your plugin is deactivated, make sure to remove your custom control with [method remove_control_from_container] and free it with [code]queue_free()[/code].
bindEditorPlugin_add_control_to_container :: MethodBind
bindEditorPlugin_add_control_to_container
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_control_to_container" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a custom control to a container (see CONTAINER_* enum). There are many locations where custom controls can be added in the editor UI.
--   				Please remember that you have to manage the visibility of your custom controls yourself (and likely hide it after adding it).
--   				When your plugin is deactivated, make sure to remove your custom control with [method remove_control_from_container] and free it with [code]queue_free()[/code].
add_control_to_container ::
                           (EditorPlugin :< cls, Object :< cls) =>
                           cls -> Int -> Control -> IO ()
add_control_to_container cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_control_to_container
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_control_to_bottom_panel #-}

-- | Add a control to the bottom panel (together with Output, Debug, Animation, etc). Returns a reference to the button added. It's up to you to hide/show the button when needed. When your plugin is deactivated, make sure to remove your custom control with [method remove_control_from_bottom_panel] and free it with [code]queue_free()[/code].
bindEditorPlugin_add_control_to_bottom_panel :: MethodBind
bindEditorPlugin_add_control_to_bottom_panel
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_control_to_bottom_panel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a control to the bottom panel (together with Output, Debug, Animation, etc). Returns a reference to the button added. It's up to you to hide/show the button when needed. When your plugin is deactivated, make sure to remove your custom control with [method remove_control_from_bottom_panel] and free it with [code]queue_free()[/code].
add_control_to_bottom_panel ::
                              (EditorPlugin :< cls, Object :< cls) =>
                              cls -> Control -> GodotString -> IO ToolButton
add_control_to_bottom_panel cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_control_to_bottom_panel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_control_to_dock #-}

-- | Add the control to a specific dock slot (see DOCK_* enum for options).
--   				If the dock is repositioned and as long as the plugin is active, the editor will save the dock position on further sessions.
--   				When your plugin is deactivated, make sure to remove your custom control with [method remove_control_from_docks] and free it with [code]queue_free()[/code].
bindEditorPlugin_add_control_to_dock :: MethodBind
bindEditorPlugin_add_control_to_dock
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_control_to_dock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add the control to a specific dock slot (see DOCK_* enum for options).
--   				If the dock is repositioned and as long as the plugin is active, the editor will save the dock position on further sessions.
--   				When your plugin is deactivated, make sure to remove your custom control with [method remove_control_from_docks] and free it with [code]queue_free()[/code].
add_control_to_dock ::
                      (EditorPlugin :< cls, Object :< cls) =>
                      cls -> Int -> Control -> IO ()
add_control_to_dock cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_control_to_dock
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_control_from_docks #-}

-- | Remove the control from the dock. You have to manually [code]queue_free()[/code] the control.
bindEditorPlugin_remove_control_from_docks :: MethodBind
bindEditorPlugin_remove_control_from_docks
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_control_from_docks" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove the control from the dock. You have to manually [code]queue_free()[/code] the control.
remove_control_from_docks ::
                            (EditorPlugin :< cls, Object :< cls) => cls -> Control -> IO ()
remove_control_from_docks cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_control_from_docks
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_control_from_bottom_panel #-}

-- | Remove the control from the bottom panel. You have to manually [code]queue_free()[/code] the control.
bindEditorPlugin_remove_control_from_bottom_panel :: MethodBind
bindEditorPlugin_remove_control_from_bottom_panel
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_control_from_bottom_panel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove the control from the bottom panel. You have to manually [code]queue_free()[/code] the control.
remove_control_from_bottom_panel ::
                                   (EditorPlugin :< cls, Object :< cls) => cls -> Control -> IO ()
remove_control_from_bottom_panel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_remove_control_from_bottom_panel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_control_from_container #-}

-- | Remove the control from the specified container. You have to manually [code]queue_free()[/code] the control.
bindEditorPlugin_remove_control_from_container :: MethodBind
bindEditorPlugin_remove_control_from_container
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_control_from_container" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove the control from the specified container. You have to manually [code]queue_free()[/code] the control.
remove_control_from_container ::
                                (EditorPlugin :< cls, Object :< cls) =>
                                cls -> Int -> Control -> IO ()
remove_control_from_container cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_remove_control_from_container
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_tool_menu_item #-}

-- | Add a custom menu to 'Project > Tools' as [code]name[/code] that calls [code]callback[/code] on an instance of [code]handler[/code] with a parameter [code]ud[/code] when user activates it.
bindEditorPlugin_add_tool_menu_item :: MethodBind
bindEditorPlugin_add_tool_menu_item
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_tool_menu_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a custom menu to 'Project > Tools' as [code]name[/code] that calls [code]callback[/code] on an instance of [code]handler[/code] with a parameter [code]ud[/code] when user activates it.
add_tool_menu_item ::
                     (EditorPlugin :< cls, Object :< cls) =>
                     cls ->
                       GodotString -> Object -> GodotString -> GodotVariant -> IO ()
add_tool_menu_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_tool_menu_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_tool_submenu_item #-}

-- | Like [method add_tool_menu_item] but adds the [code]submenu[/code] item inside the [code]name[/code] menu.
bindEditorPlugin_add_tool_submenu_item :: MethodBind
bindEditorPlugin_add_tool_submenu_item
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_tool_submenu_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Like [method add_tool_menu_item] but adds the [code]submenu[/code] item inside the [code]name[/code] menu.
add_tool_submenu_item ::
                        (EditorPlugin :< cls, Object :< cls) =>
                        cls -> GodotString -> Object -> IO ()
add_tool_submenu_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_tool_submenu_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_tool_menu_item #-}

-- | Removes a menu [code]name[/code] from 'Project > Tools'.
bindEditorPlugin_remove_tool_menu_item :: MethodBind
bindEditorPlugin_remove_tool_menu_item
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_tool_menu_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a menu [code]name[/code] from 'Project > Tools'.
remove_tool_menu_item ::
                        (EditorPlugin :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_tool_menu_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_tool_menu_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_custom_type #-}

-- | Add a custom type, which will appear in the list of nodes or resources. An icon can be optionally passed.
--   				When given node or resource is selected, the base type will be instanced (ie, "Spatial", "Control", "Resource"), then the script will be loaded and set to this object.
--   				You can use the virtual method [method handles] to check if your custom object is being edited by checking the script or using 'is' keyword.
--   				During run-time, this will be a simple object with a script so this function does not need to be called then.
bindEditorPlugin_add_custom_type :: MethodBind
bindEditorPlugin_add_custom_type
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_custom_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a custom type, which will appear in the list of nodes or resources. An icon can be optionally passed.
--   				When given node or resource is selected, the base type will be instanced (ie, "Spatial", "Control", "Resource"), then the script will be loaded and set to this object.
--   				You can use the virtual method [method handles] to check if your custom object is being edited by checking the script or using 'is' keyword.
--   				During run-time, this will be a simple object with a script so this function does not need to be called then.
add_custom_type ::
                  (EditorPlugin :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> Script -> Texture -> IO ()
add_custom_type cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_custom_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_custom_type #-}

-- | Remove a custom type added by [method add_custom_type]
bindEditorPlugin_remove_custom_type :: MethodBind
bindEditorPlugin_remove_custom_type
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_custom_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove a custom type added by [method add_custom_type]
remove_custom_type ::
                     (EditorPlugin :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_custom_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_custom_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_autoload_singleton #-}

-- | Add a script at [code]path[/code] to the Autoload list as [code]name[/code].
bindEditorPlugin_add_autoload_singleton :: MethodBind
bindEditorPlugin_add_autoload_singleton
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_autoload_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a script at [code]path[/code] to the Autoload list as [code]name[/code].
add_autoload_singleton ::
                         (EditorPlugin :< cls, Object :< cls) =>
                         cls -> GodotString -> GodotString -> IO ()
add_autoload_singleton cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_autoload_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_autoload_singleton #-}

-- | Remove an Autoload [code]name[/code] from the list.
bindEditorPlugin_remove_autoload_singleton :: MethodBind
bindEditorPlugin_remove_autoload_singleton
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_autoload_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove an Autoload [code]name[/code] from the list.
remove_autoload_singleton ::
                            (EditorPlugin :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_autoload_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_autoload_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_update_overlays #-}

bindEditorPlugin_update_overlays :: MethodBind
bindEditorPlugin_update_overlays
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "update_overlays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

update_overlays ::
                  (EditorPlugin :< cls, Object :< cls) => cls -> IO Int
update_overlays cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_update_overlays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_make_bottom_panel_item_visible #-}

bindEditorPlugin_make_bottom_panel_item_visible :: MethodBind
bindEditorPlugin_make_bottom_panel_item_visible
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "make_bottom_panel_item_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_bottom_panel_item_visible ::
                                 (EditorPlugin :< cls, Object :< cls) => cls -> Control -> IO ()
make_bottom_panel_item_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_make_bottom_panel_item_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_hide_bottom_panel #-}

bindEditorPlugin_hide_bottom_panel :: MethodBind
bindEditorPlugin_hide_bottom_panel
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "hide_bottom_panel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

hide_bottom_panel ::
                    (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
hide_bottom_panel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_hide_bottom_panel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_undo_redo #-}

-- | Get the undo/redo object. Most actions in the editor can be undoable, so use this object to make sure this happens when it's worth it.
bindEditorPlugin_get_undo_redo :: MethodBind
bindEditorPlugin_get_undo_redo
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_undo_redo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the undo/redo object. Most actions in the editor can be undoable, so use this object to make sure this happens when it's worth it.
get_undo_redo ::
                (EditorPlugin :< cls, Object :< cls) => cls -> IO UndoRedo
get_undo_redo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_undo_redo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_queue_save_layout #-}

-- | Queue save the project's editor layout.
bindEditorPlugin_queue_save_layout :: MethodBind
bindEditorPlugin_queue_save_layout
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "queue_save_layout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue save the project's editor layout.
queue_save_layout ::
                    (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
queue_save_layout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_queue_save_layout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_import_plugin #-}

bindEditorPlugin_add_import_plugin :: MethodBind
bindEditorPlugin_add_import_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_import_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_import_plugin ::
                    (EditorPlugin :< cls, Object :< cls) =>
                    cls -> EditorImportPlugin -> IO ()
add_import_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_import_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_import_plugin #-}

bindEditorPlugin_remove_import_plugin :: MethodBind
bindEditorPlugin_remove_import_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_import_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_import_plugin ::
                       (EditorPlugin :< cls, Object :< cls) =>
                       cls -> EditorImportPlugin -> IO ()
remove_import_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_import_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_scene_import_plugin #-}

bindEditorPlugin_add_scene_import_plugin :: MethodBind
bindEditorPlugin_add_scene_import_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_scene_import_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_scene_import_plugin ::
                          (EditorPlugin :< cls, Object :< cls) =>
                          cls -> EditorSceneImporter -> IO ()
add_scene_import_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_scene_import_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_scene_import_plugin #-}

bindEditorPlugin_remove_scene_import_plugin :: MethodBind
bindEditorPlugin_remove_scene_import_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_scene_import_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_scene_import_plugin ::
                             (EditorPlugin :< cls, Object :< cls) =>
                             cls -> EditorSceneImporter -> IO ()
remove_scene_import_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_scene_import_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_export_plugin #-}

bindEditorPlugin_add_export_plugin :: MethodBind
bindEditorPlugin_add_export_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_export_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_export_plugin ::
                    (EditorPlugin :< cls, Object :< cls) =>
                    cls -> EditorExportPlugin -> IO ()
add_export_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_export_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_export_plugin #-}

bindEditorPlugin_remove_export_plugin :: MethodBind
bindEditorPlugin_remove_export_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_export_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_export_plugin ::
                       (EditorPlugin :< cls, Object :< cls) =>
                       cls -> EditorExportPlugin -> IO ()
remove_export_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_export_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_spatial_gizmo_plugin #-}

bindEditorPlugin_add_spatial_gizmo_plugin :: MethodBind
bindEditorPlugin_add_spatial_gizmo_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_spatial_gizmo_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_spatial_gizmo_plugin ::
                           (EditorPlugin :< cls, Object :< cls) =>
                           cls -> EditorSpatialGizmoPlugin -> IO ()
add_spatial_gizmo_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_spatial_gizmo_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_spatial_gizmo_plugin #-}

bindEditorPlugin_remove_spatial_gizmo_plugin :: MethodBind
bindEditorPlugin_remove_spatial_gizmo_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_spatial_gizmo_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_spatial_gizmo_plugin ::
                              (EditorPlugin :< cls, Object :< cls) =>
                              cls -> EditorSpatialGizmoPlugin -> IO ()
remove_spatial_gizmo_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_spatial_gizmo_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_add_inspector_plugin #-}

bindEditorPlugin_add_inspector_plugin :: MethodBind
bindEditorPlugin_add_inspector_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "add_inspector_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_inspector_plugin ::
                       (EditorPlugin :< cls, Object :< cls) =>
                       cls -> EditorInspectorPlugin -> IO ()
add_inspector_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_add_inspector_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_remove_inspector_plugin #-}

bindEditorPlugin_remove_inspector_plugin :: MethodBind
bindEditorPlugin_remove_inspector_plugin
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "remove_inspector_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_inspector_plugin ::
                          (EditorPlugin :< cls, Object :< cls) =>
                          cls -> EditorInspectorPlugin -> IO ()
remove_inspector_plugin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_remove_inspector_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_set_input_event_forwarding_always_enabled
             #-}

-- | Use this method if you always want to receive inputs from 3D view screen inside [method forward_spatial_gui_input]. It might be especially usable if your plugin will want to use raycast in the scene.
bindEditorPlugin_set_input_event_forwarding_always_enabled ::
                                                           MethodBind
bindEditorPlugin_set_input_event_forwarding_always_enabled
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "set_input_event_forwarding_always_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Use this method if you always want to receive inputs from 3D view screen inside [method forward_spatial_gui_input]. It might be especially usable if your plugin will want to use raycast in the scene.
set_input_event_forwarding_always_enabled ::
                                            (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
set_input_event_forwarding_always_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_set_input_event_forwarding_always_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_set_force_draw_over_forwarding_enabled
             #-}

bindEditorPlugin_set_force_draw_over_forwarding_enabled ::
                                                        MethodBind
bindEditorPlugin_set_force_draw_over_forwarding_enabled
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "set_force_draw_over_forwarding_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_force_draw_over_forwarding_enabled ::
                                         (EditorPlugin :< cls, Object :< cls) => cls -> IO ()
set_force_draw_over_forwarding_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorPlugin_set_force_draw_over_forwarding_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_editor_interface #-}

-- | Return the [EditorInterface] object that gives you control over Godot editor's window and its functionalities.
bindEditorPlugin_get_editor_interface :: MethodBind
bindEditorPlugin_get_editor_interface
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_editor_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the [EditorInterface] object that gives you control over Godot editor's window and its functionalities.
get_editor_interface ::
                       (EditorPlugin :< cls, Object :< cls) => cls -> IO EditorInterface
get_editor_interface cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_editor_interface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorPlugin_get_script_create_dialog #-}

-- | Gets the Editor's dialogue used for making scripts. Note that users can configure it before use.
bindEditorPlugin_get_script_create_dialog :: MethodBind
bindEditorPlugin_get_script_create_dialog
  = unsafePerformIO $
      withCString "EditorPlugin" $
        \ clsNamePtr ->
          withCString "get_script_create_dialog" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the Editor's dialogue used for making scripts. Note that users can configure it before use.
get_script_create_dialog ::
                           (EditorPlugin :< cls, Object :< cls) =>
                           cls -> IO ScriptCreateDialog
get_script_create_dialog cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorPlugin_get_script_create_dialog
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)