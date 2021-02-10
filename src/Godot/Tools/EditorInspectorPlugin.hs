{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorInspectorPlugin
       (Godot.Tools.EditorInspectorPlugin.add_custom_control,
        Godot.Tools.EditorInspectorPlugin.add_property_editor,
        Godot.Tools.EditorInspectorPlugin.add_property_editor_for_multiple_properties,
        Godot.Tools.EditorInspectorPlugin.can_handle,
        Godot.Tools.EditorInspectorPlugin.parse_begin,
        Godot.Tools.EditorInspectorPlugin.parse_category,
        Godot.Tools.EditorInspectorPlugin.parse_end,
        Godot.Tools.EditorInspectorPlugin.parse_property)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorInspectorPlugin_add_custom_control #-}

-- | Adds a custom control, not necessarily a property editor.
bindEditorInspectorPlugin_add_custom_control :: MethodBind
bindEditorInspectorPlugin_add_custom_control
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_custom_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a custom control, not necessarily a property editor.
add_custom_control ::
                     (EditorInspectorPlugin :< cls, Object :< cls) =>
                     cls -> Control -> IO ()
add_custom_control cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspectorPlugin_add_custom_control
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_add_property_editor #-}

-- | Adds a property editor, this must inherit [EditorProperty].
bindEditorInspectorPlugin_add_property_editor :: MethodBind
bindEditorInspectorPlugin_add_property_editor
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_property_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a property editor, this must inherit [EditorProperty].
add_property_editor ::
                      (EditorInspectorPlugin :< cls, Object :< cls) =>
                      cls -> GodotString -> Control -> IO ()
add_property_editor cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorInspectorPlugin_add_property_editor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_add_property_editor_for_multiple_properties
             #-}

-- | Adds an editor that allows modifying multiple properties, this must inherit [EditorProperty].
bindEditorInspectorPlugin_add_property_editor_for_multiple_properties ::
                                                                      MethodBind
bindEditorInspectorPlugin_add_property_editor_for_multiple_properties
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_property_editor_for_multiple_properties" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an editor that allows modifying multiple properties, this must inherit [EditorProperty].
add_property_editor_for_multiple_properties ::
                                              (EditorInspectorPlugin :< cls, Object :< cls) =>
                                              cls ->
                                                GodotString -> PoolStringArray -> Control -> IO ()
add_property_editor_for_multiple_properties cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorInspectorPlugin_add_property_editor_for_multiple_properties
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_can_handle #-}

-- | Returns [code]true[/code] if this object can be handled by this plugin.
bindEditorInspectorPlugin_can_handle :: MethodBind
bindEditorInspectorPlugin_can_handle
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "can_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this object can be handled by this plugin.
can_handle ::
             (EditorInspectorPlugin :< cls, Object :< cls) =>
             cls -> Object -> IO Bool
can_handle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspectorPlugin_can_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_parse_begin #-}

-- | Called to allow adding controls at the beginning of the list.
bindEditorInspectorPlugin_parse_begin :: MethodBind
bindEditorInspectorPlugin_parse_begin
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called to allow adding controls at the beginning of the list.
parse_begin ::
              (EditorInspectorPlugin :< cls, Object :< cls) =>
              cls -> Object -> IO ()
parse_begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspectorPlugin_parse_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_parse_category #-}

-- | Called to allow adding controls at the beginning of the category.
bindEditorInspectorPlugin_parse_category :: MethodBind
bindEditorInspectorPlugin_parse_category
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_category" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called to allow adding controls at the beginning of the category.
parse_category ::
                 (EditorInspectorPlugin :< cls, Object :< cls) =>
                 cls -> Object -> GodotString -> IO ()
parse_category cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspectorPlugin_parse_category
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_parse_end #-}

-- | Called to allow adding controls at the end of the list.
bindEditorInspectorPlugin_parse_end :: MethodBind
bindEditorInspectorPlugin_parse_end
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called to allow adding controls at the end of the list.
parse_end ::
            (EditorInspectorPlugin :< cls, Object :< cls) => cls -> IO ()
parse_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspectorPlugin_parse_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspectorPlugin_parse_property #-}

-- | Called to allow adding property specific editors to the inspector. Usually these inherit [EditorProperty]. Returning [code]true[/code] removes the built-in editor for this property, otherwise allows to insert a custom editor before the built-in one.
bindEditorInspectorPlugin_parse_property :: MethodBind
bindEditorInspectorPlugin_parse_property
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called to allow adding property specific editors to the inspector. Usually these inherit [EditorProperty]. Returning [code]true[/code] removes the built-in editor for this property, otherwise allows to insert a custom editor before the built-in one.
parse_property ::
                 (EditorInspectorPlugin :< cls, Object :< cls) =>
                 cls ->
                   Object ->
                     Int -> GodotString -> Int -> GodotString -> Int -> IO Bool
parse_property cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspectorPlugin_parse_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)