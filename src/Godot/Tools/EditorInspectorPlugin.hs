{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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

bindEditorInspectorPlugin_add_custom_control :: MethodBind
bindEditorInspectorPlugin_add_custom_control
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_custom_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_add_property_editor :: MethodBind
bindEditorInspectorPlugin_add_property_editor
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_property_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_add_property_editor_for_multiple_properties ::
                                                                      MethodBind
bindEditorInspectorPlugin_add_property_editor_for_multiple_properties
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_property_editor_for_multiple_properties" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_can_handle :: MethodBind
bindEditorInspectorPlugin_can_handle
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "can_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_parse_begin :: MethodBind
bindEditorInspectorPlugin_parse_begin
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_parse_category :: MethodBind
bindEditorInspectorPlugin_parse_category
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_category" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_parse_end :: MethodBind
bindEditorInspectorPlugin_parse_end
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorInspectorPlugin_parse_property :: MethodBind
bindEditorInspectorPlugin_parse_property
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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