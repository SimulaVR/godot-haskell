{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorSettings
       (Godot.Tools.EditorSettings._NOTIFICATION_EDITOR_SETTINGS_CHANGED,
        Godot.Tools.EditorSettings.sig_settings_changed,
        Godot.Tools.EditorSettings.add_property_info,
        Godot.Tools.EditorSettings.erase,
        Godot.Tools.EditorSettings.get_favorites,
        Godot.Tools.EditorSettings.get_project_metadata,
        Godot.Tools.EditorSettings.get_project_settings_dir,
        Godot.Tools.EditorSettings.get_recent_dirs,
        Godot.Tools.EditorSettings.get_setting,
        Godot.Tools.EditorSettings.get_settings_dir,
        Godot.Tools.EditorSettings.has_setting,
        Godot.Tools.EditorSettings.property_can_revert,
        Godot.Tools.EditorSettings.property_get_revert,
        Godot.Tools.EditorSettings.set_favorites,
        Godot.Tools.EditorSettings.set_initial_value,
        Godot.Tools.EditorSettings.set_project_metadata,
        Godot.Tools.EditorSettings.set_recent_dirs,
        Godot.Tools.EditorSettings.set_setting)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_EDITOR_SETTINGS_CHANGED :: Int
_NOTIFICATION_EDITOR_SETTINGS_CHANGED = 10000

-- | Emitted after any editor setting has changed.
sig_settings_changed ::
                     Godot.Internal.Dispatch.Signal EditorSettings
sig_settings_changed
  = Godot.Internal.Dispatch.Signal "settings_changed"

instance NodeSignal EditorSettings "settings_changed" '[]

{-# NOINLINE bindEditorSettings_add_property_info #-}

-- | Adds a custom property info to a property. The dictionary must contain:
--   				- [code]name[/code]: [String] (the name of the property)
--   				- [code]type[/code]: [int] (see [enum Variant.Type])
--   				- optionally [code]hint[/code]: [int] (see [enum PropertyHint]) and [code]hint_string[/code]: [String]
--   				[b]Example:[/b]
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

-- | Adds a custom property info to a property. The dictionary must contain:
--   				- [code]name[/code]: [String] (the name of the property)
--   				- [code]type[/code]: [int] (see [enum Variant.Type])
--   				- optionally [code]hint[/code]: [int] (see [enum PropertyHint]) and [code]hint_string[/code]: [String]
--   				[b]Example:[/b]
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

{-# NOINLINE bindEditorSettings_erase #-}

-- | Erases the setting whose name is specified by [code]property[/code].
bindEditorSettings_erase :: MethodBind
bindEditorSettings_erase
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "erase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Erases the setting whose name is specified by [code]property[/code].
erase ::
        (EditorSettings :< cls, Object :< cls) =>
        cls -> GodotString -> IO ()
erase cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSettings_erase (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSettings_get_favorites #-}

-- | Returns the list of favorite files and directories for this project.
bindEditorSettings_get_favorites :: MethodBind
bindEditorSettings_get_favorites
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_favorites" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of favorite files and directories for this project.
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

{-# NOINLINE bindEditorSettings_get_project_metadata #-}

-- | Returns project-specific metadata for the [code]section[/code] and [code]key[/code] specified. If the metadata doesn't exist, [code]default[/code] will be returned instead. See also [method set_project_metadata].
bindEditorSettings_get_project_metadata :: MethodBind
bindEditorSettings_get_project_metadata
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_project_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns project-specific metadata for the [code]section[/code] and [code]key[/code] specified. If the metadata doesn't exist, [code]default[/code] will be returned instead. See also [method set_project_metadata].
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

{-# NOINLINE bindEditorSettings_get_project_settings_dir #-}

-- | Returns the project-specific settings path. Projects all have a unique subdirectory inside the settings path where project-specific settings are saved.
bindEditorSettings_get_project_settings_dir :: MethodBind
bindEditorSettings_get_project_settings_dir
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_project_settings_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the project-specific settings path. Projects all have a unique subdirectory inside the settings path where project-specific settings are saved.
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

{-# NOINLINE bindEditorSettings_get_recent_dirs #-}

-- | Returns the list of recently visited folders in the file dialog for this project.
bindEditorSettings_get_recent_dirs :: MethodBind
bindEditorSettings_get_recent_dirs
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_recent_dirs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of recently visited folders in the file dialog for this project.
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

{-# NOINLINE bindEditorSettings_get_setting #-}

-- | Returns the value of the setting specified by [code]name[/code]. This is equivalent to using [method Object.get] on the EditorSettings instance.
bindEditorSettings_get_setting :: MethodBind
bindEditorSettings_get_setting
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the setting specified by [code]name[/code]. This is equivalent to using [method Object.get] on the EditorSettings instance.
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

{-# NOINLINE bindEditorSettings_get_settings_dir #-}

-- | Gets the global settings path for the engine. Inside this path, you can find some standard paths such as:
--   				[code]settings/tmp[/code] - Used for temporary storage of files
--   				[code]settings/templates[/code] - Where export templates are located
bindEditorSettings_get_settings_dir :: MethodBind
bindEditorSettings_get_settings_dir
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "get_settings_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the global settings path for the engine. Inside this path, you can find some standard paths such as:
--   				[code]settings/tmp[/code] - Used for temporary storage of files
--   				[code]settings/templates[/code] - Where export templates are located
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

{-# NOINLINE bindEditorSettings_has_setting #-}

-- | Returns [code]true[/code] if the setting specified by [code]name[/code] exists, [code]false[/code] otherwise.
bindEditorSettings_has_setting :: MethodBind
bindEditorSettings_has_setting
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "has_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the setting specified by [code]name[/code] exists, [code]false[/code] otherwise.
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

{-# NOINLINE bindEditorSettings_property_can_revert #-}

-- | Returns [code]true[/code] if the setting specified by [code]name[/code] can have its value reverted to the default value, [code]false[/code] otherwise. When this method returns [code]true[/code], a Revert button will display next to the setting in the Editor Settings.
bindEditorSettings_property_can_revert :: MethodBind
bindEditorSettings_property_can_revert
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "property_can_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the setting specified by [code]name[/code] can have its value reverted to the default value, [code]false[/code] otherwise. When this method returns [code]true[/code], a Revert button will display next to the setting in the Editor Settings.
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

-- | Returns the default value of the setting specified by [code]name[/code]. This is the value that would be applied when clicking the Revert button in the Editor Settings.
bindEditorSettings_property_get_revert :: MethodBind
bindEditorSettings_property_get_revert
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "property_get_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the default value of the setting specified by [code]name[/code]. This is the value that would be applied when clicking the Revert button in the Editor Settings.
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

{-# NOINLINE bindEditorSettings_set_favorites #-}

-- | Sets the list of favorite files and directories for this project.
bindEditorSettings_set_favorites :: MethodBind
bindEditorSettings_set_favorites
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_favorites" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the list of favorite files and directories for this project.
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

{-# NOINLINE bindEditorSettings_set_initial_value #-}

-- | Sets the initial value of the setting specified by [code]name[/code] to [code]value[/code]. This is used to provide a value for the Revert button in the Editor Settings. If [code]update_current[/code] is true, the current value of the setting will be set to [code]value[/code] as well.
bindEditorSettings_set_initial_value :: MethodBind
bindEditorSettings_set_initial_value
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_initial_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the initial value of the setting specified by [code]name[/code] to [code]value[/code]. This is used to provide a value for the Revert button in the Editor Settings. If [code]update_current[/code] is true, the current value of the setting will be set to [code]value[/code] as well.
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

{-# NOINLINE bindEditorSettings_set_project_metadata #-}

-- | Sets project-specific metadata with the [code]section[/code], [code]key[/code] and [code]data[/code] specified. This metadata is stored outside the project folder and therefore won't be checked into version control. See also [method get_project_metadata].
bindEditorSettings_set_project_metadata :: MethodBind
bindEditorSettings_set_project_metadata
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_project_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets project-specific metadata with the [code]section[/code], [code]key[/code] and [code]data[/code] specified. This metadata is stored outside the project folder and therefore won't be checked into version control. See also [method get_project_metadata].
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

{-# NOINLINE bindEditorSettings_set_recent_dirs #-}

-- | Sets the list of recently visited folders in the file dialog for this project.
bindEditorSettings_set_recent_dirs :: MethodBind
bindEditorSettings_set_recent_dirs
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_recent_dirs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the list of recently visited folders in the file dialog for this project.
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

{-# NOINLINE bindEditorSettings_set_setting #-}

-- | Sets the [code]value[/code] of the setting specified by [code]name[/code]. This is equivalent to using [method Object.set] on the EditorSettings instance.
bindEditorSettings_set_setting :: MethodBind
bindEditorSettings_set_setting
  = unsafePerformIO $
      withCString "EditorSettings" $
        \ clsNamePtr ->
          withCString "set_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [code]value[/code] of the setting specified by [code]name[/code]. This is equivalent to using [method Object.set] on the EditorSettings instance.
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