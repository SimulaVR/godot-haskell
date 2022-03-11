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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

{-# NOINLINE bindEditorInspectorPlugin_add_custom_control #-}

-- | Adds a custom control, which is not necessarily a property editor.
bindEditorInspectorPlugin_add_custom_control :: MethodBind
bindEditorInspectorPlugin_add_custom_control
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_custom_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a custom control, which is not necessarily a property editor.
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

instance NodeMethod EditorInspectorPlugin "add_custom_control"
           '[Control]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.add_custom_control

{-# NOINLINE bindEditorInspectorPlugin_add_property_editor #-}

-- | Adds a property editor for an individual property. The @editor@ control must extend @EditorProperty@.
bindEditorInspectorPlugin_add_property_editor :: MethodBind
bindEditorInspectorPlugin_add_property_editor
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_property_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a property editor for an individual property. The @editor@ control must extend @EditorProperty@.
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

instance NodeMethod EditorInspectorPlugin "add_property_editor"
           '[GodotString, Control]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.add_property_editor

{-# NOINLINE bindEditorInspectorPlugin_add_property_editor_for_multiple_properties
             #-}

-- | Adds an editor that allows modifying multiple properties. The @editor@ control must extend @EditorProperty@.
bindEditorInspectorPlugin_add_property_editor_for_multiple_properties ::
                                                                      MethodBind
bindEditorInspectorPlugin_add_property_editor_for_multiple_properties
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "add_property_editor_for_multiple_properties" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an editor that allows modifying multiple properties. The @editor@ control must extend @EditorProperty@.
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

instance NodeMethod EditorInspectorPlugin
           "add_property_editor_for_multiple_properties"
           '[GodotString, PoolStringArray, Control]
           (IO ())
         where
        nodeMethod
          = Godot.Tools.EditorInspectorPlugin.add_property_editor_for_multiple_properties

{-# NOINLINE bindEditorInspectorPlugin_can_handle #-}

-- | Returns @true@ if this object can be handled by this plugin.
bindEditorInspectorPlugin_can_handle :: MethodBind
bindEditorInspectorPlugin_can_handle
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "can_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this object can be handled by this plugin.
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

instance NodeMethod EditorInspectorPlugin "can_handle" '[Object]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.can_handle

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

instance NodeMethod EditorInspectorPlugin "parse_begin" '[Object]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.parse_begin

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

instance NodeMethod EditorInspectorPlugin "parse_category"
           '[Object, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.parse_category

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

instance NodeMethod EditorInspectorPlugin "parse_end" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.parse_end

{-# NOINLINE bindEditorInspectorPlugin_parse_property #-}

-- | Called to allow adding property specific editors to the inspector. Usually these inherit @EditorProperty@. Returning @true@ removes the built-in editor for this property, otherwise allows to insert a custom editor before the built-in one.
bindEditorInspectorPlugin_parse_property :: MethodBind
bindEditorInspectorPlugin_parse_property
  = unsafePerformIO $
      withCString "EditorInspectorPlugin" $
        \ clsNamePtr ->
          withCString "parse_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called to allow adding property specific editors to the inspector. Usually these inherit @EditorProperty@. Returning @true@ removes the built-in editor for this property, otherwise allows to insert a custom editor before the built-in one.
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

instance NodeMethod EditorInspectorPlugin "parse_property"
           '[Object, Int, GodotString, Int, GodotString, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorInspectorPlugin.parse_property