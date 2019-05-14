{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorSettings
       (Godot.Tools.EditorSettings.sig_settings_changed,
        Godot.Tools.EditorSettings.has_setting,
        Godot.Tools.EditorSettings.set_setting,
        Godot.Tools.EditorSettings.get_setting,
        Godot.Tools.EditorSettings.erase,
        Godot.Tools.EditorSettings.set_initial_value,
        Godot.Tools.EditorSettings.property_can_revert,
        Godot.Tools.EditorSettings.property_get_revert,
        Godot.Tools.EditorSettings.add_property_info,
        Godot.Tools.EditorSettings.get_settings_dir,
        Godot.Tools.EditorSettings.get_project_settings_dir,
        Godot.Tools.EditorSettings.set_project_metadata,
        Godot.Tools.EditorSettings.get_project_metadata,
        Godot.Tools.EditorSettings.set_favorites,
        Godot.Tools.EditorSettings.get_favorites,
        Godot.Tools.EditorSettings.set_recent_dirs,
        Godot.Tools.EditorSettings.get_recent_dirs)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_settings_changed ::
                     Godot.Internal.Dispatch.Signal EditorSettings
sig_settings_changed
  = Godot.Internal.Dispatch.Signal "settings_changed"

{-# NOINLINE bindEditorSettings_has_setting #-}

bindEditorSettings_has_setting :: MethodBind
bindEditorSettings_has_setting
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "has_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_setting ::
              (EditorSettings :< cls, Object :< cls) =>
              cls -> GodotString -> IO Bool
has_setting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_has_setting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_set_setting #-}

bindEditorSettings_set_setting :: MethodBind
bindEditorSettings_set_setting
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_setting ::
              (EditorSettings :< cls, Object :< cls) =>
              cls -> GodotString -> GodotVariant -> IO ()
set_setting cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_set_setting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_setting #-}

bindEditorSettings_get_setting :: MethodBind
bindEditorSettings_get_setting
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_setting ::
              (EditorSettings :< cls, Object :< cls) =>
              cls -> GodotString -> IO GodotVariant
get_setting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_get_setting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_erase #-}

-- | Erase a given setting (pass full property path).
bindEditorSettings_erase :: MethodBind
bindEditorSettings_erase
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "erase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Erase a given setting (pass full property path).
erase ::
        (EditorSettings :< cls, Object :< cls) =>
        cls -> GodotString -> IO ()
erase cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_erase (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_set_initial_value #-}

bindEditorSettings_set_initial_value :: MethodBind
bindEditorSettings_set_initial_value
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_initial_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_initial_value ::
                    (EditorSettings :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotVariant -> Bool -> IO ()
set_initial_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_set_initial_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_property_can_revert #-}

bindEditorSettings_property_can_revert :: MethodBind
bindEditorSettings_property_can_revert
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "property_can_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

property_can_revert ::
                      (EditorSettings :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Bool
property_can_revert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_property_can_revert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_property_get_revert #-}

bindEditorSettings_property_get_revert :: MethodBind
bindEditorSettings_property_get_revert
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "property_get_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

property_get_revert ::
                      (EditorSettings :< cls, Object :< cls) =>
                      cls -> GodotString -> IO GodotVariant
property_get_revert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_property_get_revert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_add_property_info #-}

-- | Add a custom property info to a property. The dictionary must contain: name:[String](the name of the property) and type:[int](see TYPE_* in [@GlobalScope]), and optionally hint:[int](see PROPERTY_HINT_* in [@GlobalScope]), hint_string:[String].
--   				Example:
--   				[codeblock]
--   				editor_settings.set("category/property_name", 0)
--   
--   				var property_info = {
--   				    "name": "category/property_name",
--   				    "type": TYPE_INT,
--   				    "hint": PROPERTY_HINT_ENUM,
--   				    "hint_string": "one,two,three"
--   				}
--   
--   				editor_settings.add_property_info(property_info)
--   				[/codeblock]
bindEditorSettings_add_property_info :: MethodBind
bindEditorSettings_add_property_info
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "add_property_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a custom property info to a property. The dictionary must contain: name:[String](the name of the property) and type:[int](see TYPE_* in [@GlobalScope]), and optionally hint:[int](see PROPERTY_HINT_* in [@GlobalScope]), hint_string:[String].
--   				Example:
--   				[codeblock]
--   				editor_settings.set("category/property_name", 0)
--   
--   				var property_info = {
--   				    "name": "category/property_name",
--   				    "type": TYPE_INT,
--   				    "hint": PROPERTY_HINT_ENUM,
--   				    "hint_string": "one,two,three"
--   				}
--   
--   				editor_settings.add_property_info(property_info)
--   				[/codeblock]
add_property_info ::
                    (EditorSettings :< cls, Object :< cls) =>
                    cls -> Dictionary -> IO ()
add_property_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_add_property_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_settings_dir #-}

-- | Get the global settings path for the engine. Inside this path you can find some standard paths such as:
--   				settings/tmp - used for temporary storage of files
--   				settings/templates - where export templates are located
bindEditorSettings_get_settings_dir :: MethodBind
bindEditorSettings_get_settings_dir
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_settings_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the global settings path for the engine. Inside this path you can find some standard paths such as:
--   				settings/tmp - used for temporary storage of files
--   				settings/templates - where export templates are located
get_settings_dir ::
                   (EditorSettings :< cls, Object :< cls) => cls -> IO GodotString
get_settings_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_get_settings_dir
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_project_settings_dir #-}

-- | Get the specific project settings path. Projects all have a unique sub-directory inside the settings path where project specific settings are saved.
bindEditorSettings_get_project_settings_dir :: MethodBind
bindEditorSettings_get_project_settings_dir
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_project_settings_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the specific project settings path. Projects all have a unique sub-directory inside the settings path where project specific settings are saved.
get_project_settings_dir ::
                           (EditorSettings :< cls, Object :< cls) => cls -> IO GodotString
get_project_settings_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_get_project_settings_dir
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_set_project_metadata #-}

bindEditorSettings_set_project_metadata :: MethodBind
bindEditorSettings_set_project_metadata
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_project_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_project_metadata ::
                       (EditorSettings :< cls, Object :< cls) =>
                       cls -> GodotString -> GodotString -> GodotVariant -> IO ()
set_project_metadata cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_set_project_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_project_metadata #-}

bindEditorSettings_get_project_metadata :: MethodBind
bindEditorSettings_get_project_metadata
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_project_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_project_metadata ::
                       (EditorSettings :< cls, Object :< cls) =>
                       cls ->
                         GodotString -> GodotString -> GodotVariant -> IO GodotVariant
get_project_metadata cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_get_project_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_set_favorites #-}

-- | Set the list of favorite files and directories for this project.
bindEditorSettings_set_favorites :: MethodBind
bindEditorSettings_set_favorites
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_favorites" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the list of favorite files and directories for this project.
set_favorites ::
                (EditorSettings :< cls, Object :< cls) =>
                cls -> PoolStringArray -> IO ()
set_favorites cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_set_favorites
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_favorites #-}

-- | Get the list of favorite files and directories for this project.
bindEditorSettings_get_favorites :: MethodBind
bindEditorSettings_get_favorites
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_favorites" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the list of favorite files and directories for this project.
get_favorites ::
                (EditorSettings :< cls, Object :< cls) => cls -> IO PoolStringArray
get_favorites cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_get_favorites
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_set_recent_dirs #-}

-- | Set the list of recently visited folders in the file dialog for this project.
bindEditorSettings_set_recent_dirs :: MethodBind
bindEditorSettings_set_recent_dirs
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_recent_dirs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the list of recently visited folders in the file dialog for this project.
set_recent_dirs ::
                  (EditorSettings :< cls, Object :< cls) =>
                  cls -> PoolStringArray -> IO ()
set_recent_dirs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_set_recent_dirs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_recent_dirs #-}

-- | Get the list of recently visited folders in the file dialog for this project.
bindEditorSettings_get_recent_dirs :: MethodBind
bindEditorSettings_get_recent_dirs
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_recent_dirs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the list of recently visited folders in the file dialog for this project.
get_recent_dirs ::
                  (EditorSettings :< cls, Object :< cls) => cls -> IO PoolStringArray
get_recent_dirs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_get_recent_dirs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)