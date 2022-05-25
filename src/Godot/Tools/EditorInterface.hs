{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorInterface
       (Godot.Tools.EditorInterface.edit_resource,
        Godot.Tools.EditorInterface.get_base_control,
        Godot.Tools.EditorInterface.get_current_path,
        Godot.Tools.EditorInterface.get_edited_scene_root,
        Godot.Tools.EditorInterface.get_editor_settings,
        Godot.Tools.EditorInterface.get_editor_viewport,
        Godot.Tools.EditorInterface.get_inspector,
        Godot.Tools.EditorInterface.get_open_scenes,
        Godot.Tools.EditorInterface.get_resource_filesystem,
        Godot.Tools.EditorInterface.get_resource_previewer,
        Godot.Tools.EditorInterface.get_script_editor,
        Godot.Tools.EditorInterface.get_selected_path,
        Godot.Tools.EditorInterface.get_selection,
        Godot.Tools.EditorInterface.inspect_object,
        Godot.Tools.EditorInterface.is_plugin_enabled,
        Godot.Tools.EditorInterface.make_mesh_previews,
        Godot.Tools.EditorInterface.open_scene_from_path,
        Godot.Tools.EditorInterface.reload_scene_from_path,
        Godot.Tools.EditorInterface.save_scene,
        Godot.Tools.EditorInterface.save_scene_as,
        Godot.Tools.EditorInterface.select_file,
        Godot.Tools.EditorInterface.set_distraction_free_mode,
        Godot.Tools.EditorInterface.set_main_screen_editor,
        Godot.Tools.EditorInterface.set_plugin_enabled)
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
import Godot.Core.Node()

{-# NOINLINE bindEditorInterface_edit_resource #-}

-- | Edits the given @Resource@.
bindEditorInterface_edit_resource :: MethodBind
bindEditorInterface_edit_resource
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "edit_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Edits the given @Resource@.
edit_resource ::
                (EditorInterface :< cls, Object :< cls) => cls -> Resource -> IO ()
edit_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_edit_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "edit_resource" '[Resource]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.edit_resource

{-# NOINLINE bindEditorInterface_get_base_control #-}

-- | Returns the main container of Godot editor's window. You can use it, for example, to retrieve the size of the container and place your controls accordingly.
bindEditorInterface_get_base_control :: MethodBind
bindEditorInterface_get_base_control
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_base_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the main container of Godot editor's window. You can use it, for example, to retrieve the size of the container and place your controls accordingly.
get_base_control ::
                   (EditorInterface :< cls, Object :< cls) => cls -> IO Control
get_base_control cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_base_control
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_base_control" '[]
           (IO Control)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_base_control

{-# NOINLINE bindEditorInterface_get_current_path #-}

bindEditorInterface_get_current_path :: MethodBind
bindEditorInterface_get_current_path
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_current_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_current_path ::
                   (EditorInterface :< cls, Object :< cls) => cls -> IO GodotString
get_current_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_current_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_current_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_current_path

{-# NOINLINE bindEditorInterface_get_edited_scene_root #-}

-- | Returns the edited (current) scene's root @Node@.
bindEditorInterface_get_edited_scene_root :: MethodBind
bindEditorInterface_get_edited_scene_root
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_edited_scene_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the edited (current) scene's root @Node@.
get_edited_scene_root ::
                        (EditorInterface :< cls, Object :< cls) => cls -> IO Node
get_edited_scene_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_edited_scene_root
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_edited_scene_root" '[]
           (IO Node)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_edited_scene_root

{-# NOINLINE bindEditorInterface_get_editor_settings #-}

-- | Returns the @EditorSettings@.
bindEditorInterface_get_editor_settings :: MethodBind
bindEditorInterface_get_editor_settings
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_editor_settings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @EditorSettings@.
get_editor_settings ::
                      (EditorInterface :< cls, Object :< cls) => cls -> IO EditorSettings
get_editor_settings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_editor_settings
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_editor_settings" '[]
           (IO EditorSettings)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_editor_settings

{-# NOINLINE bindEditorInterface_get_editor_viewport #-}

-- | Returns the editor @Viewport@.
bindEditorInterface_get_editor_viewport :: MethodBind
bindEditorInterface_get_editor_viewport
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_editor_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the editor @Viewport@.
get_editor_viewport ::
                      (EditorInterface :< cls, Object :< cls) => cls -> IO Control
get_editor_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_editor_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_editor_viewport" '[]
           (IO Control)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_editor_viewport

{-# NOINLINE bindEditorInterface_get_inspector #-}

bindEditorInterface_get_inspector :: MethodBind
bindEditorInterface_get_inspector
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_inspector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inspector ::
                (EditorInterface :< cls, Object :< cls) =>
                cls -> IO EditorInspector
get_inspector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_inspector
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_inspector" '[]
           (IO EditorInspector)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_inspector

{-# NOINLINE bindEditorInterface_get_open_scenes #-}

-- | Returns an @Array@ with the file paths of the currently opened scenes.
bindEditorInterface_get_open_scenes :: MethodBind
bindEditorInterface_get_open_scenes
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_open_scenes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ with the file paths of the currently opened scenes.
get_open_scenes ::
                  (EditorInterface :< cls, Object :< cls) => cls -> IO Array
get_open_scenes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_open_scenes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_open_scenes" '[]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_open_scenes

{-# NOINLINE bindEditorInterface_get_resource_filesystem #-}

-- | Returns the @EditorFileSystem@.
bindEditorInterface_get_resource_filesystem :: MethodBind
bindEditorInterface_get_resource_filesystem
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_resource_filesystem" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @EditorFileSystem@.
get_resource_filesystem ::
                          (EditorInterface :< cls, Object :< cls) =>
                          cls -> IO EditorFileSystem
get_resource_filesystem cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_resource_filesystem
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_resource_filesystem" '[]
           (IO EditorFileSystem)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_resource_filesystem

{-# NOINLINE bindEditorInterface_get_resource_previewer #-}

-- | Returns the @EditorResourcePreview@.
bindEditorInterface_get_resource_previewer :: MethodBind
bindEditorInterface_get_resource_previewer
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_resource_previewer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @EditorResourcePreview@.
get_resource_previewer ::
                         (EditorInterface :< cls, Object :< cls) =>
                         cls -> IO EditorResourcePreview
get_resource_previewer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_resource_previewer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_resource_previewer" '[]
           (IO EditorResourcePreview)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_resource_previewer

{-# NOINLINE bindEditorInterface_get_script_editor #-}

-- | Returns the @ScriptEditor@.
bindEditorInterface_get_script_editor :: MethodBind
bindEditorInterface_get_script_editor
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_script_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @ScriptEditor@.
get_script_editor ::
                    (EditorInterface :< cls, Object :< cls) => cls -> IO ScriptEditor
get_script_editor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_script_editor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_script_editor" '[]
           (IO ScriptEditor)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_script_editor

{-# NOINLINE bindEditorInterface_get_selected_path #-}

bindEditorInterface_get_selected_path :: MethodBind
bindEditorInterface_get_selected_path
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_selected_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_selected_path ::
                    (EditorInterface :< cls, Object :< cls) => cls -> IO GodotString
get_selected_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_selected_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_selected_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_selected_path

{-# NOINLINE bindEditorInterface_get_selection #-}

-- | Returns the @EditorSelection@.
bindEditorInterface_get_selection :: MethodBind
bindEditorInterface_get_selection
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "get_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @EditorSelection@.
get_selection ::
                (EditorInterface :< cls, Object :< cls) =>
                cls -> IO EditorSelection
get_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_get_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "get_selection" '[]
           (IO EditorSelection)
         where
        nodeMethod = Godot.Tools.EditorInterface.get_selection

{-# NOINLINE bindEditorInterface_inspect_object #-}

-- | Shows the given property on the given @object@ in the Editor's Inspector dock.
bindEditorInterface_inspect_object :: MethodBind
bindEditorInterface_inspect_object
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "inspect_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the given property on the given @object@ in the Editor's Inspector dock.
inspect_object ::
                 (EditorInterface :< cls, Object :< cls) =>
                 cls -> Object -> Maybe GodotString -> IO ()
inspect_object cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_inspect_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "inspect_object"
           '[Object, Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.inspect_object

{-# NOINLINE bindEditorInterface_is_plugin_enabled #-}

-- | Returns the enabled status of a plugin. The plugin name is the same as its directory name.
bindEditorInterface_is_plugin_enabled :: MethodBind
bindEditorInterface_is_plugin_enabled
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "is_plugin_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the enabled status of a plugin. The plugin name is the same as its directory name.
is_plugin_enabled ::
                    (EditorInterface :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Bool
is_plugin_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_is_plugin_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "is_plugin_enabled"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorInterface.is_plugin_enabled

{-# NOINLINE bindEditorInterface_make_mesh_previews #-}

-- | Returns mesh previews rendered at the given size as an @Array@ of @Texture@s.
bindEditorInterface_make_mesh_previews :: MethodBind
bindEditorInterface_make_mesh_previews
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "make_mesh_previews" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns mesh previews rendered at the given size as an @Array@ of @Texture@s.
make_mesh_previews ::
                     (EditorInterface :< cls, Object :< cls) =>
                     cls -> Array -> Int -> IO Array
make_mesh_previews cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_make_mesh_previews
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "make_mesh_previews"
           '[Array, Int]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorInterface.make_mesh_previews

{-# NOINLINE bindEditorInterface_open_scene_from_path #-}

-- | Opens the scene at the given path.
bindEditorInterface_open_scene_from_path :: MethodBind
bindEditorInterface_open_scene_from_path
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "open_scene_from_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens the scene at the given path.
open_scene_from_path ::
                       (EditorInterface :< cls, Object :< cls) =>
                       cls -> GodotString -> IO ()
open_scene_from_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_open_scene_from_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "open_scene_from_path"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.open_scene_from_path

{-# NOINLINE bindEditorInterface_reload_scene_from_path #-}

-- | Reloads the scene at the given path.
bindEditorInterface_reload_scene_from_path :: MethodBind
bindEditorInterface_reload_scene_from_path
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "reload_scene_from_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reloads the scene at the given path.
reload_scene_from_path ::
                         (EditorInterface :< cls, Object :< cls) =>
                         cls -> GodotString -> IO ()
reload_scene_from_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_reload_scene_from_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "reload_scene_from_path"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.reload_scene_from_path

{-# NOINLINE bindEditorInterface_save_scene #-}

-- | Saves the scene. Returns either @OK@ or @ERR_CANT_CREATE@ (see @@GlobalScope@ constants).
bindEditorInterface_save_scene :: MethodBind
bindEditorInterface_save_scene
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "save_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the scene. Returns either @OK@ or @ERR_CANT_CREATE@ (see @@GlobalScope@ constants).
save_scene ::
             (EditorInterface :< cls, Object :< cls) => cls -> IO Int
save_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_save_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "save_scene" '[] (IO Int) where
        nodeMethod = Godot.Tools.EditorInterface.save_scene

{-# NOINLINE bindEditorInterface_save_scene_as #-}

-- | Saves the scene as a file at @path@.
bindEditorInterface_save_scene_as :: MethodBind
bindEditorInterface_save_scene_as
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "save_scene_as" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the scene as a file at @path@.
save_scene_as ::
                (EditorInterface :< cls, Object :< cls) =>
                cls -> GodotString -> Maybe Bool -> IO ()
save_scene_as cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_save_scene_as
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "save_scene_as"
           '[GodotString, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.save_scene_as

{-# NOINLINE bindEditorInterface_select_file #-}

-- | Selects the file, with the path provided by @file@, in the FileSystem dock.
bindEditorInterface_select_file :: MethodBind
bindEditorInterface_select_file
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "select_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects the file, with the path provided by @file@, in the FileSystem dock.
select_file ::
              (EditorInterface :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
select_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_select_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "select_file" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.select_file

{-# NOINLINE bindEditorInterface_set_distraction_free_mode #-}

bindEditorInterface_set_distraction_free_mode :: MethodBind
bindEditorInterface_set_distraction_free_mode
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "set_distraction_free_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_distraction_free_mode ::
                            (EditorInterface :< cls, Object :< cls) => cls -> Bool -> IO ()
set_distraction_free_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorInterface_set_distraction_free_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "set_distraction_free_mode"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.set_distraction_free_mode

{-# NOINLINE bindEditorInterface_set_main_screen_editor #-}

bindEditorInterface_set_main_screen_editor :: MethodBind
bindEditorInterface_set_main_screen_editor
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "set_main_screen_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_main_screen_editor ::
                         (EditorInterface :< cls, Object :< cls) =>
                         cls -> GodotString -> IO ()
set_main_screen_editor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_set_main_screen_editor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "set_main_screen_editor"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.set_main_screen_editor

{-# NOINLINE bindEditorInterface_set_plugin_enabled #-}

-- | Sets the enabled status of a plugin. The plugin name is the same as its directory name.
bindEditorInterface_set_plugin_enabled :: MethodBind
bindEditorInterface_set_plugin_enabled
  = unsafePerformIO $
      withCString "EditorInterface" $
        \ clsNamePtr ->
          withCString "set_plugin_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the enabled status of a plugin. The plugin name is the same as its directory name.
set_plugin_enabled ::
                     (EditorInterface :< cls, Object :< cls) =>
                     cls -> GodotString -> Bool -> IO ()
set_plugin_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInterface_set_plugin_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorInterface "set_plugin_enabled"
           '[GodotString, Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInterface.set_plugin_enabled