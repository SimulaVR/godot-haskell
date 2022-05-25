{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorImportPlugin
       (Godot.Tools.EditorImportPlugin.get_import_options,
        Godot.Tools.EditorImportPlugin.get_import_order,
        Godot.Tools.EditorImportPlugin.get_importer_name,
        Godot.Tools.EditorImportPlugin.get_option_visibility,
        Godot.Tools.EditorImportPlugin.get_preset_count,
        Godot.Tools.EditorImportPlugin.get_preset_name,
        Godot.Tools.EditorImportPlugin.get_priority,
        Godot.Tools.EditorImportPlugin.get_recognized_extensions,
        Godot.Tools.EditorImportPlugin.get_resource_type,
        Godot.Tools.EditorImportPlugin.get_save_extension,
        Godot.Tools.EditorImportPlugin.get_visible_name,
        Godot.Tools.EditorImportPlugin.import')
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
import Godot.Core.ResourceImporter()

{-# NOINLINE bindEditorImportPlugin_get_import_options #-}

-- | Gets the options and default values for the preset at this index. Returns an Array of Dictionaries with the following keys: @name@, @default_value@, @property_hint@ (optional), @hint_string@ (optional), @usage@ (optional).
bindEditorImportPlugin_get_import_options :: MethodBind
bindEditorImportPlugin_get_import_options
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_import_options" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the options and default values for the preset at this index. Returns an Array of Dictionaries with the following keys: @name@, @default_value@, @property_hint@ (optional), @hint_string@ (optional), @usage@ (optional).
get_import_options ::
                     (EditorImportPlugin :< cls, Object :< cls) =>
                     cls -> Int -> IO Array
get_import_options cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_import_options
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_import_options" '[Int]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_import_options

{-# NOINLINE bindEditorImportPlugin_get_import_order #-}

-- | Gets the order of this importer to be run when importing resources. Higher values will be called later. Use this to ensure the importer runs after the dependencies are already imported.
bindEditorImportPlugin_get_import_order :: MethodBind
bindEditorImportPlugin_get_import_order
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_import_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the order of this importer to be run when importing resources. Higher values will be called later. Use this to ensure the importer runs after the dependencies are already imported.
get_import_order ::
                   (EditorImportPlugin :< cls, Object :< cls) => cls -> IO Int
get_import_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_import_order
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_import_order" '[]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_import_order

{-# NOINLINE bindEditorImportPlugin_get_importer_name #-}

-- | Gets the unique name of the importer.
bindEditorImportPlugin_get_importer_name :: MethodBind
bindEditorImportPlugin_get_importer_name
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_importer_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the unique name of the importer.
get_importer_name ::
                    (EditorImportPlugin :< cls, Object :< cls) => cls -> IO GodotString
get_importer_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_importer_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_importer_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_importer_name

{-# NOINLINE bindEditorImportPlugin_get_option_visibility #-}

bindEditorImportPlugin_get_option_visibility :: MethodBind
bindEditorImportPlugin_get_option_visibility
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_option_visibility" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_option_visibility ::
                        (EditorImportPlugin :< cls, Object :< cls) =>
                        cls -> GodotString -> Dictionary -> IO Bool
get_option_visibility cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_option_visibility
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_option_visibility"
           '[GodotString, Dictionary]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_option_visibility

{-# NOINLINE bindEditorImportPlugin_get_preset_count #-}

-- | Gets the number of initial presets defined by the plugin. Use @method get_import_options@ to get the default options for the preset and @method get_preset_name@ to get the name of the preset.
bindEditorImportPlugin_get_preset_count :: MethodBind
bindEditorImportPlugin_get_preset_count
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_preset_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the number of initial presets defined by the plugin. Use @method get_import_options@ to get the default options for the preset and @method get_preset_name@ to get the name of the preset.
get_preset_count ::
                   (EditorImportPlugin :< cls, Object :< cls) => cls -> IO Int
get_preset_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_preset_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_preset_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_preset_count

{-# NOINLINE bindEditorImportPlugin_get_preset_name #-}

-- | Gets the name of the options preset at this index.
bindEditorImportPlugin_get_preset_name :: MethodBind
bindEditorImportPlugin_get_preset_name
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_preset_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the name of the options preset at this index.
get_preset_name ::
                  (EditorImportPlugin :< cls, Object :< cls) =>
                  cls -> Int -> IO GodotString
get_preset_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_preset_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_preset_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_preset_name

{-# NOINLINE bindEditorImportPlugin_get_priority #-}

-- | Gets the priority of this plugin for the recognized extension. Higher priority plugins will be preferred. The default priority is @1.0@.
bindEditorImportPlugin_get_priority :: MethodBind
bindEditorImportPlugin_get_priority
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the priority of this plugin for the recognized extension. Higher priority plugins will be preferred. The default priority is @1.0@.
get_priority ::
               (EditorImportPlugin :< cls, Object :< cls) => cls -> IO Float
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_priority" '[]
           (IO Float)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_priority

{-# NOINLINE bindEditorImportPlugin_get_recognized_extensions #-}

-- | Gets the list of file extensions to associate with this loader (case-insensitive). e.g. @@"obj"@@.
bindEditorImportPlugin_get_recognized_extensions :: MethodBind
bindEditorImportPlugin_get_recognized_extensions
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the list of file extensions to associate with this loader (case-insensitive). e.g. @@"obj"@@.
get_recognized_extensions ::
                            (EditorImportPlugin :< cls, Object :< cls) => cls -> IO Array
get_recognized_extensions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorImportPlugin_get_recognized_extensions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_recognized_extensions"
           '[]
           (IO Array)
         where
        nodeMethod
          = Godot.Tools.EditorImportPlugin.get_recognized_extensions

{-# NOINLINE bindEditorImportPlugin_get_resource_type #-}

-- | Gets the Godot resource type associated with this loader. e.g. @"Mesh"@ or @"Animation"@.
bindEditorImportPlugin_get_resource_type :: MethodBind
bindEditorImportPlugin_get_resource_type
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_resource_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the Godot resource type associated with this loader. e.g. @"Mesh"@ or @"Animation"@.
get_resource_type ::
                    (EditorImportPlugin :< cls, Object :< cls) => cls -> IO GodotString
get_resource_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_resource_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_resource_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_resource_type

{-# NOINLINE bindEditorImportPlugin_get_save_extension #-}

-- | Gets the extension used to save this resource in the @.import@ directory.
bindEditorImportPlugin_get_save_extension :: MethodBind
bindEditorImportPlugin_get_save_extension
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_save_extension" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the extension used to save this resource in the @.import@ directory.
get_save_extension ::
                     (EditorImportPlugin :< cls, Object :< cls) => cls -> IO GodotString
get_save_extension cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_save_extension
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_save_extension" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_save_extension

{-# NOINLINE bindEditorImportPlugin_get_visible_name #-}

-- | Gets the name to display in the import window.
bindEditorImportPlugin_get_visible_name :: MethodBind
bindEditorImportPlugin_get_visible_name
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "get_visible_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the name to display in the import window.
get_visible_name ::
                   (EditorImportPlugin :< cls, Object :< cls) => cls -> IO GodotString
get_visible_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_get_visible_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "get_visible_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.get_visible_name

{-# NOINLINE bindEditorImportPlugin_import' #-}

bindEditorImportPlugin_import' :: MethodBind
bindEditorImportPlugin_import'
  = unsafePerformIO $
      withCString "EditorImportPlugin" $
        \ clsNamePtr ->
          withCString "import" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

import' ::
          (EditorImportPlugin :< cls, Object :< cls) =>
          cls ->
            GodotString ->
              GodotString -> Dictionary -> Array -> Array -> IO Int
import' cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorImportPlugin_import' (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorImportPlugin "import"
           '[GodotString, GodotString, Dictionary, Array, Array]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorImportPlugin.import'