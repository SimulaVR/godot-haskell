{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorFeatureProfile
       (Godot.Tools.EditorFeatureProfile._FEATURE_FILESYSTEM_DOCK,
        Godot.Tools.EditorFeatureProfile._FEATURE_3D,
        Godot.Tools.EditorFeatureProfile._FEATURE_MAX,
        Godot.Tools.EditorFeatureProfile._FEATURE_SCRIPT,
        Godot.Tools.EditorFeatureProfile._FEATURE_SCENE_TREE,
        Godot.Tools.EditorFeatureProfile._FEATURE_NODE_DOCK,
        Godot.Tools.EditorFeatureProfile._FEATURE_IMPORT_DOCK,
        Godot.Tools.EditorFeatureProfile._FEATURE_ASSET_LIB,
        Godot.Tools.EditorFeatureProfile.get_feature_name,
        Godot.Tools.EditorFeatureProfile.is_class_disabled,
        Godot.Tools.EditorFeatureProfile.is_class_editor_disabled,
        Godot.Tools.EditorFeatureProfile.is_class_property_disabled,
        Godot.Tools.EditorFeatureProfile.is_feature_disabled,
        Godot.Tools.EditorFeatureProfile.load_from_file,
        Godot.Tools.EditorFeatureProfile.save_to_file,
        Godot.Tools.EditorFeatureProfile.set_disable_class,
        Godot.Tools.EditorFeatureProfile.set_disable_class_editor,
        Godot.Tools.EditorFeatureProfile.set_disable_class_property,
        Godot.Tools.EditorFeatureProfile.set_disable_feature)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FEATURE_FILESYSTEM_DOCK :: Int
_FEATURE_FILESYSTEM_DOCK = 6

_FEATURE_3D :: Int
_FEATURE_3D = 0

_FEATURE_MAX :: Int
_FEATURE_MAX = 7

_FEATURE_SCRIPT :: Int
_FEATURE_SCRIPT = 1

_FEATURE_SCENE_TREE :: Int
_FEATURE_SCENE_TREE = 3

_FEATURE_NODE_DOCK :: Int
_FEATURE_NODE_DOCK = 5

_FEATURE_IMPORT_DOCK :: Int
_FEATURE_IMPORT_DOCK = 4

_FEATURE_ASSET_LIB :: Int
_FEATURE_ASSET_LIB = 2

{-# NOINLINE bindEditorFeatureProfile_get_feature_name #-}

-- | Returns the specified [code]feature[/code]'s human-readable name.
bindEditorFeatureProfile_get_feature_name :: MethodBind
bindEditorFeatureProfile_get_feature_name
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "get_feature_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the specified [code]feature[/code]'s human-readable name.
get_feature_name ::
                   (EditorFeatureProfile :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotString
get_feature_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_get_feature_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_is_class_disabled #-}

-- | Returns [code]true[/code] if the class specified by [code]class_name[/code] is disabled. When disabled, the class won't appear in the Create New Node dialog.
bindEditorFeatureProfile_is_class_disabled :: MethodBind
bindEditorFeatureProfile_is_class_disabled
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "is_class_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the class specified by [code]class_name[/code] is disabled. When disabled, the class won't appear in the Create New Node dialog.
is_class_disabled ::
                    (EditorFeatureProfile :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Bool
is_class_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_is_class_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_is_class_editor_disabled #-}

-- | Returns [code]true[/code] if editing for the class specified by [code]class_name[/code] is disabled. When disabled, the class will still appear in the Create New Node dialog but the inspector will be read-only when selecting a node that extends the class.
bindEditorFeatureProfile_is_class_editor_disabled :: MethodBind
bindEditorFeatureProfile_is_class_editor_disabled
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "is_class_editor_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if editing for the class specified by [code]class_name[/code] is disabled. When disabled, the class will still appear in the Create New Node dialog but the inspector will be read-only when selecting a node that extends the class.
is_class_editor_disabled ::
                           (EditorFeatureProfile :< cls, Object :< cls) =>
                           cls -> GodotString -> IO Bool
is_class_editor_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFeatureProfile_is_class_editor_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_is_class_property_disabled
             #-}

-- | Returns [code]true[/code] if [code]property[/code] is disabled in the class specified by [code]class_name[/code]. When a property is disabled, it won't appear in the inspector when selecting a node that extends the class specified by [code]class_name[/code].
bindEditorFeatureProfile_is_class_property_disabled :: MethodBind
bindEditorFeatureProfile_is_class_property_disabled
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "is_class_property_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [code]property[/code] is disabled in the class specified by [code]class_name[/code]. When a property is disabled, it won't appear in the inspector when selecting a node that extends the class specified by [code]class_name[/code].
is_class_property_disabled ::
                             (EditorFeatureProfile :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotString -> IO Bool
is_class_property_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFeatureProfile_is_class_property_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_is_feature_disabled #-}

-- | Returns [code]true[/code] if the [code]feature[/code] is disabled. When a feature is disabled, it will disappear from the editor entirely.
bindEditorFeatureProfile_is_feature_disabled :: MethodBind
bindEditorFeatureProfile_is_feature_disabled
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "is_feature_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the [code]feature[/code] is disabled. When a feature is disabled, it will disappear from the editor entirely.
is_feature_disabled ::
                      (EditorFeatureProfile :< cls, Object :< cls) =>
                      cls -> Int -> IO Bool
is_feature_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_is_feature_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_load_from_file #-}

-- | Loads an editor feature profile from a file. The file must follow the JSON format obtained by using the feature profile manager's [b]Export[/b] button or the [method save_to_file] method.
bindEditorFeatureProfile_load_from_file :: MethodBind
bindEditorFeatureProfile_load_from_file
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "load_from_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads an editor feature profile from a file. The file must follow the JSON format obtained by using the feature profile manager's [b]Export[/b] button or the [method save_to_file] method.
load_from_file ::
                 (EditorFeatureProfile :< cls, Object :< cls) =>
                 cls -> GodotString -> IO Int
load_from_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_load_from_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_save_to_file #-}

-- | Saves the editor feature profile to a file in JSON format. It can then be imported using the feature profile manager's [b]Import[/b] button or the [method load_from_file] button.
bindEditorFeatureProfile_save_to_file :: MethodBind
bindEditorFeatureProfile_save_to_file
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "save_to_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the editor feature profile to a file in JSON format. It can then be imported using the feature profile manager's [b]Import[/b] button or the [method load_from_file] button.
save_to_file ::
               (EditorFeatureProfile :< cls, Object :< cls) =>
               cls -> GodotString -> IO Int
save_to_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_save_to_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_set_disable_class #-}

-- | If [code]disable[/code] is [code]true[/code], disables the class specified by [code]class_name[/code]. When disabled, the class won't appear in the Create New Node dialog.
bindEditorFeatureProfile_set_disable_class :: MethodBind
bindEditorFeatureProfile_set_disable_class
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "set_disable_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]disable[/code] is [code]true[/code], disables the class specified by [code]class_name[/code]. When disabled, the class won't appear in the Create New Node dialog.
set_disable_class ::
                    (EditorFeatureProfile :< cls, Object :< cls) =>
                    cls -> GodotString -> Bool -> IO ()
set_disable_class cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_set_disable_class
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_set_disable_class_editor #-}

-- | If [code]disable[/code] is [code]true[/code], disables editing for the class specified by [code]class_name[/code]. When disabled, the class will still appear in the Create New Node dialog but the inspector will be read-only when selecting a node that extends the class.
bindEditorFeatureProfile_set_disable_class_editor :: MethodBind
bindEditorFeatureProfile_set_disable_class_editor
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "set_disable_class_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]disable[/code] is [code]true[/code], disables editing for the class specified by [code]class_name[/code]. When disabled, the class will still appear in the Create New Node dialog but the inspector will be read-only when selecting a node that extends the class.
set_disable_class_editor ::
                           (EditorFeatureProfile :< cls, Object :< cls) =>
                           cls -> GodotString -> Bool -> IO ()
set_disable_class_editor cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFeatureProfile_set_disable_class_editor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_set_disable_class_property
             #-}

-- | If [code]disable[/code] is [code]true[/code], disables editing for [code]property[/code] in the class specified by [code]class_name[/code]. When a property is disabled, it won't appear in the inspector when selecting a node that extends the class specified by [code]class_name[/code].
bindEditorFeatureProfile_set_disable_class_property :: MethodBind
bindEditorFeatureProfile_set_disable_class_property
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "set_disable_class_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]disable[/code] is [code]true[/code], disables editing for [code]property[/code] in the class specified by [code]class_name[/code]. When a property is disabled, it won't appear in the inspector when selecting a node that extends the class specified by [code]class_name[/code].
set_disable_class_property ::
                             (EditorFeatureProfile :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotString -> Bool -> IO ()
set_disable_class_property cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFeatureProfile_set_disable_class_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFeatureProfile_set_disable_feature #-}

-- | If [code]disable[/code] is [code]true[/code], disables the editor feature specified in [code]feature[/code]. When a feature is disabled, it will disappear from the editor entirely.
bindEditorFeatureProfile_set_disable_feature :: MethodBind
bindEditorFeatureProfile_set_disable_feature
  = unsafePerformIO $
      withCString "EditorFeatureProfile" $
        \ clsNamePtr ->
          withCString "set_disable_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]disable[/code] is [code]true[/code], disables the editor feature specified in [code]feature[/code]. When a feature is disabled, it will disappear from the editor entirely.
set_disable_feature ::
                      (EditorFeatureProfile :< cls, Object :< cls) =>
                      cls -> Int -> Bool -> IO ()
set_disable_feature cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFeatureProfile_set_disable_feature
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)