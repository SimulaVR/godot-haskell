{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ProjectSettings
       (Godot.Core.ProjectSettings.add_property_info,
        Godot.Core.ProjectSettings.clear,
        Godot.Core.ProjectSettings.get_order,
        Godot.Core.ProjectSettings.get_setting,
        Godot.Core.ProjectSettings.globalize_path,
        Godot.Core.ProjectSettings.has_setting,
        Godot.Core.ProjectSettings.load_resource_pack,
        Godot.Core.ProjectSettings.localize_path,
        Godot.Core.ProjectSettings.property_can_revert,
        Godot.Core.ProjectSettings.property_get_revert,
        Godot.Core.ProjectSettings.save,
        Godot.Core.ProjectSettings.save_custom,
        Godot.Core.ProjectSettings.set_initial_value,
        Godot.Core.ProjectSettings.set_order,
        Godot.Core.ProjectSettings.set_setting)
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

{-# NOINLINE bindProjectSettings_add_property_info #-}

-- | Adds a custom property info to a property. The dictionary must contain:
--   				- @name@: @String@ (the property's name)
--   				- @type@: @int@ (see @enum Variant.Type@)
--   				- optionally @hint@: @int@ (see @enum PropertyHint@) and @hint_string@: @String@
--   				__Example:__
--   				
--   @
--   
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
--   				
--   @
bindProjectSettings_add_property_info :: MethodBind
bindProjectSettings_add_property_info
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "add_property_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a custom property info to a property. The dictionary must contain:
--   				- @name@: @String@ (the property's name)
--   				- @type@: @int@ (see @enum Variant.Type@)
--   				- optionally @hint@: @int@ (see @enum PropertyHint@) and @hint_string@: @String@
--   				__Example:__
--   				
--   @
--   
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
--   				
--   @
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

instance NodeMethod ProjectSettings "add_property_info"
           '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.ProjectSettings.add_property_info

{-# NOINLINE bindProjectSettings_clear #-}

-- | Clears the whole configuration (not recommended, may break things).
bindProjectSettings_clear :: MethodBind
bindProjectSettings_clear
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the whole configuration (not recommended, may break things).
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

instance NodeMethod ProjectSettings "clear" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.ProjectSettings.clear

{-# NOINLINE bindProjectSettings_get_order #-}

-- | Returns the order of a configuration value (influences when saved to the config file).
bindProjectSettings_get_order :: MethodBind
bindProjectSettings_get_order
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "get_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the order of a configuration value (influences when saved to the config file).
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

instance NodeMethod ProjectSettings "get_order" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.ProjectSettings.get_order

{-# NOINLINE bindProjectSettings_get_setting #-}

-- | Returns the value of a setting.
--   				__Example:__
--   				
--   @
--   
--   				print(ProjectSettings.get_setting("application/config/name"))
--   				
--   @
bindProjectSettings_get_setting :: MethodBind
bindProjectSettings_get_setting
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "get_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a setting.
--   				__Example:__
--   				
--   @
--   
--   				print(ProjectSettings.get_setting("application/config/name"))
--   				
--   @
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

instance NodeMethod ProjectSettings "get_setting" '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ProjectSettings.get_setting

{-# NOINLINE bindProjectSettings_globalize_path #-}

-- | Returns the absolute, native OS path corresponding to the localized @path@ (starting with @res://@ or @user://@). The returned path will vary depending on the operating system and user preferences. See @url=https://docs.godotengine.org/en/3.4/tutorials/io/data_paths.html@File paths in Godot projects@/url@ to see what those paths convert to. See also @method localize_path@.
--   				__Note:__ @method globalize_path@ with @res://@ will not work in an exported project. Instead, prepend the executable's base directory to the path when running from an exported project:
--   				
--   @
--   
--   				var path = ""
--   				if OS.has_feature("editor"):
--   				    # Running from an editor binary.
--   				    # `path` will contain the absolute path to `hello.txt` located in the project root.
--   				    path = ProjectSettings.globalize_path("res://hello.txt")
--   				else:
--   				    # Running from an exported project.
--   				    # `path` will contain the absolute path to `hello.txt` next to the executable.
--   				    # This is *not* identical to using `ProjectSettings.globalize_path()` with a `res://` path,
--   				    # but is close enough in spirit.
--   				    path = OS.get_executable_path().get_base_dir().plus_file("hello.txt")
--   				
--   @
bindProjectSettings_globalize_path :: MethodBind
bindProjectSettings_globalize_path
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "globalize_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute, native OS path corresponding to the localized @path@ (starting with @res://@ or @user://@). The returned path will vary depending on the operating system and user preferences. See @url=https://docs.godotengine.org/en/3.4/tutorials/io/data_paths.html@File paths in Godot projects@/url@ to see what those paths convert to. See also @method localize_path@.
--   				__Note:__ @method globalize_path@ with @res://@ will not work in an exported project. Instead, prepend the executable's base directory to the path when running from an exported project:
--   				
--   @
--   
--   				var path = ""
--   				if OS.has_feature("editor"):
--   				    # Running from an editor binary.
--   				    # `path` will contain the absolute path to `hello.txt` located in the project root.
--   				    path = ProjectSettings.globalize_path("res://hello.txt")
--   				else:
--   				    # Running from an exported project.
--   				    # `path` will contain the absolute path to `hello.txt` next to the executable.
--   				    # This is *not* identical to using `ProjectSettings.globalize_path()` with a `res://` path,
--   				    # but is close enough in spirit.
--   				    path = OS.get_executable_path().get_base_dir().plus_file("hello.txt")
--   				
--   @
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

instance NodeMethod ProjectSettings "globalize_path" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ProjectSettings.globalize_path

{-# NOINLINE bindProjectSettings_has_setting #-}

-- | Returns @true@ if a configuration value is present.
bindProjectSettings_has_setting :: MethodBind
bindProjectSettings_has_setting
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "has_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a configuration value is present.
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

instance NodeMethod ProjectSettings "has_setting" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ProjectSettings.has_setting

{-# NOINLINE bindProjectSettings_load_resource_pack #-}

-- | Loads the contents of the .pck or .zip file specified by @pack@ into the resource filesystem (@res://@). Returns @true@ on success.
--   				__Note:__ If a file from @pack@ shares the same path as a file already in the resource filesystem, any attempts to load that file will use the file from @pack@ unless @replace_files@ is set to @false@.
--   				__Note:__ The optional @offset@ parameter can be used to specify the offset in bytes to the start of the resource pack. This is only supported for .pck files.
bindProjectSettings_load_resource_pack :: MethodBind
bindProjectSettings_load_resource_pack
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "load_resource_pack" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the contents of the .pck or .zip file specified by @pack@ into the resource filesystem (@res://@). Returns @true@ on success.
--   				__Note:__ If a file from @pack@ shares the same path as a file already in the resource filesystem, any attempts to load that file will use the file from @pack@ unless @replace_files@ is set to @false@.
--   				__Note:__ The optional @offset@ parameter can be used to specify the offset in bytes to the start of the resource pack. This is only supported for .pck files.
load_resource_pack ::
                     (ProjectSettings :< cls, Object :< cls) =>
                     cls -> GodotString -> Maybe Bool -> IO Bool
load_resource_pack cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_load_resource_pack
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ProjectSettings "load_resource_pack"
           '[GodotString, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ProjectSettings.load_resource_pack

{-# NOINLINE bindProjectSettings_localize_path #-}

-- | Returns the localized path (starting with @res://@) corresponding to the absolute, native OS @path@. See also @method globalize_path@.
bindProjectSettings_localize_path :: MethodBind
bindProjectSettings_localize_path
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "localize_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the localized path (starting with @res://@) corresponding to the absolute, native OS @path@. See also @method globalize_path@.
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

instance NodeMethod ProjectSettings "localize_path" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ProjectSettings.localize_path

{-# NOINLINE bindProjectSettings_property_can_revert #-}

-- | Returns @true@ if the specified property exists and its initial value differs from the current value.
bindProjectSettings_property_can_revert :: MethodBind
bindProjectSettings_property_can_revert
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "property_can_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified property exists and its initial value differs from the current value.
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

instance NodeMethod ProjectSettings "property_can_revert"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ProjectSettings.property_can_revert

{-# NOINLINE bindProjectSettings_property_get_revert #-}

-- | Returns the specified property's initial value. Returns @null@ if the property does not exist.
bindProjectSettings_property_get_revert :: MethodBind
bindProjectSettings_property_get_revert
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "property_get_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the specified property's initial value. Returns @null@ if the property does not exist.
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

instance NodeMethod ProjectSettings "property_get_revert"
           '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ProjectSettings.property_get_revert

{-# NOINLINE bindProjectSettings_save #-}

-- | Saves the configuration to the @project.godot@ file.
--   				__Note:__ This method is intended to be used by editor plugins, as modified @ProjectSettings@ can't be loaded back in the running app. If you want to change project settings in exported projects, use @method save_custom@ to save @override.cfg@ file.
bindProjectSettings_save :: MethodBind
bindProjectSettings_save
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the configuration to the @project.godot@ file.
--   				__Note:__ This method is intended to be used by editor plugins, as modified @ProjectSettings@ can't be loaded back in the running app. If you want to change project settings in exported projects, use @method save_custom@ to save @override.cfg@ file.
save :: (ProjectSettings :< cls, Object :< cls) => cls -> IO Int
save cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProjectSettings_save (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ProjectSettings "save" '[] (IO Int) where
        nodeMethod = Godot.Core.ProjectSettings.save

{-# NOINLINE bindProjectSettings_save_custom #-}

-- | Saves the configuration to a custom file. The file extension must be @.godot@ (to save in text-based @ConfigFile@ format) or @.binary@ (to save in binary format). You can also save @override.cfg@ file, which is also text, but can be used in exported projects unlike other formats.
bindProjectSettings_save_custom :: MethodBind
bindProjectSettings_save_custom
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "save_custom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the configuration to a custom file. The file extension must be @.godot@ (to save in text-based @ConfigFile@ format) or @.binary@ (to save in binary format). You can also save @override.cfg@ file, which is also text, but can be used in exported projects unlike other formats.
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

instance NodeMethod ProjectSettings "save_custom" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.ProjectSettings.save_custom

{-# NOINLINE bindProjectSettings_set_initial_value #-}

-- | Sets the specified property's initial value. This is the value the property reverts to.
bindProjectSettings_set_initial_value :: MethodBind
bindProjectSettings_set_initial_value
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "set_initial_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified property's initial value. This is the value the property reverts to.
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

instance NodeMethod ProjectSettings "set_initial_value"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.ProjectSettings.set_initial_value

{-# NOINLINE bindProjectSettings_set_order #-}

-- | Sets the order of a configuration value (influences when saved to the config file).
bindProjectSettings_set_order :: MethodBind
bindProjectSettings_set_order
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "set_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the order of a configuration value (influences when saved to the config file).
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

instance NodeMethod ProjectSettings "set_order" '[GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ProjectSettings.set_order

{-# NOINLINE bindProjectSettings_set_setting #-}

-- | Sets the value of a setting.
--   				__Example:__
--   				
--   @
--   
--   				ProjectSettings.set_setting("application/config/name", "Example")
--   				
--   @
--   
--   				This can also be used to erase custom project settings. To do this change the setting value to @null@.
bindProjectSettings_set_setting :: MethodBind
bindProjectSettings_set_setting
  = unsafePerformIO $
      withCString "ProjectSettings" $
        \ clsNamePtr ->
          withCString "set_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of a setting.
--   				__Example:__
--   				
--   @
--   
--   				ProjectSettings.set_setting("application/config/name", "Example")
--   				
--   @
--   
--   				This can also be used to erase custom project settings. To do this change the setting value to @null@.
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

instance NodeMethod ProjectSettings "set_setting"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.ProjectSettings.set_setting