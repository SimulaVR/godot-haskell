{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ProjectSettings
       (Godot.Core.ProjectSettings.has_setting,
        Godot.Core.ProjectSettings.set_setting,
        Godot.Core.ProjectSettings.get_setting,
        Godot.Core.ProjectSettings.set_order,
        Godot.Core.ProjectSettings.get_order,
        Godot.Core.ProjectSettings.set_initial_value,
        Godot.Core.ProjectSettings.add_property_info,
        Godot.Core.ProjectSettings.clear,
        Godot.Core.ProjectSettings.localize_path,
        Godot.Core.ProjectSettings.globalize_path,
        Godot.Core.ProjectSettings.save,
        Godot.Core.ProjectSettings.load_resource_pack,
        Godot.Core.ProjectSettings.property_can_revert,
        Godot.Core.ProjectSettings.property_get_revert,
        Godot.Core.ProjectSettings.save_custom)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindProjectSettings_has_setting #-}

-- | Return true if a configuration value is present.
bindProjectSettings_has_setting :: MethodBind
bindProjectSettings_has_setting
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "has_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return true if a configuration value is present.
has_setting ::
              (ProjectSettings :< cls, Object :< cls) =>
              cls -> GodotString -> IO Bool
has_setting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_has_setting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_set_setting #-}

bindProjectSettings_set_setting :: MethodBind
bindProjectSettings_set_setting
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "set_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_setting ::
              (ProjectSettings :< cls, Object :< cls) =>
              cls -> GodotString -> GodotVariant -> IO ()
set_setting cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_set_setting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_get_setting #-}

bindProjectSettings_get_setting :: MethodBind
bindProjectSettings_get_setting
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "get_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_setting ::
              (ProjectSettings :< cls, Object :< cls) =>
              cls -> GodotString -> IO GodotVariant
get_setting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_get_setting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_set_order #-}

-- | Set the order of a configuration value (influences when saved to the config file).
bindProjectSettings_set_order :: MethodBind
bindProjectSettings_set_order
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "set_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the order of a configuration value (influences when saved to the config file).
set_order ::
            (ProjectSettings :< cls, Object :< cls) =>
            cls -> GodotString -> Int -> IO ()
set_order cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_set_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_get_order #-}

-- | Return the order of a configuration value (influences when saved to the config file).
bindProjectSettings_get_order :: MethodBind
bindProjectSettings_get_order
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "get_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the order of a configuration value (influences when saved to the config file).
get_order ::
            (ProjectSettings :< cls, Object :< cls) =>
            cls -> GodotString -> IO Int
get_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_get_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_set_initial_value #-}

bindProjectSettings_set_initial_value :: MethodBind
bindProjectSettings_set_initial_value
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "set_initial_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_initial_value ::
                    (ProjectSettings :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotVariant -> IO ()
set_initial_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_set_initial_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_add_property_info #-}

-- | Add a custom property info to a property. The dictionary must contain: name:[String](the name of the property) and type:[int](see TYPE_* in [@GlobalScope]), and optionally hint:[int](see PROPERTY_HINT_* in [@GlobalScope]), hint_string:[String].
--   				Example:
--   				[codeblock]
--   				ProjectSettings.set("category/property_name", 0)
--   
--   				var property_info = {
--   				    "name": "category/property_name",
--   				    "type": TYPE_INT,
--   				    "hint": PROPERTY_HINT_ENUM,
--   				    "hint_string": "one,two,three"
--   				}
--   
--   				ProjectSettings.add_property_info(property_info)
--   				[/codeblock]
bindProjectSettings_add_property_info :: MethodBind
bindProjectSettings_add_property_info
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "add_property_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a custom property info to a property. The dictionary must contain: name:[String](the name of the property) and type:[int](see TYPE_* in [@GlobalScope]), and optionally hint:[int](see PROPERTY_HINT_* in [@GlobalScope]), hint_string:[String].
--   				Example:
--   				[codeblock]
--   				ProjectSettings.set("category/property_name", 0)
--   
--   				var property_info = {
--   				    "name": "category/property_name",
--   				    "type": TYPE_INT,
--   				    "hint": PROPERTY_HINT_ENUM,
--   				    "hint_string": "one,two,three"
--   				}
--   
--   				ProjectSettings.add_property_info(property_info)
--   				[/codeblock]
add_property_info ::
                    (ProjectSettings :< cls, Object :< cls) =>
                    cls -> Dictionary -> IO ()
add_property_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_add_property_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_clear #-}

-- | Clear the whole configuration (not recommended, may break things).
bindProjectSettings_clear :: MethodBind
bindProjectSettings_clear
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the whole configuration (not recommended, may break things).
clear ::
        (ProjectSettings :< cls, Object :< cls) =>
        cls -> GodotString -> IO ()
clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_localize_path #-}

-- | Convert a path to a localized path (res:// path).
bindProjectSettings_localize_path :: MethodBind
bindProjectSettings_localize_path
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "localize_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Convert a path to a localized path (res:// path).
localize_path ::
                (ProjectSettings :< cls, Object :< cls) =>
                cls -> GodotString -> IO GodotString
localize_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_localize_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_globalize_path #-}

-- | Convert a localized path (res://) to a full native OS path.
bindProjectSettings_globalize_path :: MethodBind
bindProjectSettings_globalize_path
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "globalize_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Convert a localized path (res://) to a full native OS path.
globalize_path ::
                 (ProjectSettings :< cls, Object :< cls) =>
                 cls -> GodotString -> IO GodotString
globalize_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_globalize_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_save #-}

-- | Saves the configuration to the project.godot file.
bindProjectSettings_save :: MethodBind
bindProjectSettings_save
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the configuration to the project.godot file.
save :: (ProjectSettings :< cls, Object :< cls) => cls -> IO Int
save cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_save (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_load_resource_pack #-}

-- | Loads the contents of the .pck or .zip file specified by [code]pack[/code] into the resource filesystem (res://). Returns true on success.
--   				Note: If a file from [code]pack[/code] shares the same path as a file already in the resource filesystem, any attempts to load that file will use the file from [code]pack[/code].
bindProjectSettings_load_resource_pack :: MethodBind
bindProjectSettings_load_resource_pack
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "load_resource_pack" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the contents of the .pck or .zip file specified by [code]pack[/code] into the resource filesystem (res://). Returns true on success.
--   				Note: If a file from [code]pack[/code] shares the same path as a file already in the resource filesystem, any attempts to load that file will use the file from [code]pack[/code].
load_resource_pack ::
                     (ProjectSettings :< cls, Object :< cls) =>
                     cls -> GodotString -> IO Bool
load_resource_pack cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_load_resource_pack
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_property_can_revert #-}

-- | Returns true if the specified property exists and its initial value differs from the current value.
bindProjectSettings_property_can_revert :: MethodBind
bindProjectSettings_property_can_revert
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "property_can_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns true if the specified property exists and its initial value differs from the current value.
property_can_revert ::
                      (ProjectSettings :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Bool
property_can_revert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_property_can_revert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_property_get_revert #-}

-- | Returns the initial value of the specified property. Returns null if the property does not exist.
bindProjectSettings_property_get_revert :: MethodBind
bindProjectSettings_property_get_revert
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "property_get_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the initial value of the specified property. Returns null if the property does not exist.
property_get_revert ::
                      (ProjectSettings :< cls, Object :< cls) =>
                      cls -> GodotString -> IO GodotVariant
property_get_revert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_property_get_revert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProjectSettings_save_custom #-}

-- | Saves the configuration to a custom file.
bindProjectSettings_save_custom :: MethodBind
bindProjectSettings_save_custom
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "save_custom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the configuration to a custom file.
save_custom ::
              (ProjectSettings :< cls, Object :< cls) =>
              cls -> GodotString -> IO Int
save_custom cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_save_custom (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)