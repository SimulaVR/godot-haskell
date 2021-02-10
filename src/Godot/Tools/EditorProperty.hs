{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorProperty
       (Godot.Tools.EditorProperty.sig_multiple_properties_changed,
        Godot.Tools.EditorProperty.sig_object_id_selected,
        Godot.Tools.EditorProperty.sig_property_changed,
        Godot.Tools.EditorProperty.sig_property_checked,
        Godot.Tools.EditorProperty.sig_property_keyed,
        Godot.Tools.EditorProperty.sig_property_keyed_with_value,
        Godot.Tools.EditorProperty.sig_resource_selected,
        Godot.Tools.EditorProperty.sig_selected,
        Godot.Tools.EditorProperty._focusable_focused,
        Godot.Tools.EditorProperty._gui_input,
        Godot.Tools.EditorProperty.add_focusable,
        Godot.Tools.EditorProperty.emit_changed,
        Godot.Tools.EditorProperty.get_edited_object,
        Godot.Tools.EditorProperty.get_edited_property,
        Godot.Tools.EditorProperty.get_label,
        Godot.Tools.EditorProperty.get_tooltip_text,
        Godot.Tools.EditorProperty.is_checkable,
        Godot.Tools.EditorProperty.is_checked,
        Godot.Tools.EditorProperty.is_draw_red,
        Godot.Tools.EditorProperty.is_keying,
        Godot.Tools.EditorProperty.is_read_only,
        Godot.Tools.EditorProperty.set_bottom_editor,
        Godot.Tools.EditorProperty.set_checkable,
        Godot.Tools.EditorProperty.set_checked,
        Godot.Tools.EditorProperty.set_draw_red,
        Godot.Tools.EditorProperty.set_keying,
        Godot.Tools.EditorProperty.set_label,
        Godot.Tools.EditorProperty.set_read_only,
        Godot.Tools.EditorProperty.update_property)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emit it if you want multiple properties modified at the same time. Do not use if added via [method EditorInspectorPlugin.parse_property].
sig_multiple_properties_changed ::
                                Godot.Internal.Dispatch.Signal EditorProperty
sig_multiple_properties_changed
  = Godot.Internal.Dispatch.Signal "multiple_properties_changed"

instance NodeSignal EditorProperty "multiple_properties_changed"
           '[PoolStringArray, Array]

-- | Used by sub-inspectors. Emit it if what was selected was an Object ID.
sig_object_id_selected ::
                       Godot.Internal.Dispatch.Signal EditorProperty
sig_object_id_selected
  = Godot.Internal.Dispatch.Signal "object_id_selected"

instance NodeSignal EditorProperty "object_id_selected"
           '[GodotString, Int]

-- | Do not emit this manually, use the [method emit_changed] method instead.
sig_property_changed ::
                     Godot.Internal.Dispatch.Signal EditorProperty
sig_property_changed
  = Godot.Internal.Dispatch.Signal "property_changed"

instance NodeSignal EditorProperty "property_changed"
           '[GodotString, GodotVariant]

-- | Emitted when a property was checked. Used internally.
sig_property_checked ::
                     Godot.Internal.Dispatch.Signal EditorProperty
sig_property_checked
  = Godot.Internal.Dispatch.Signal "property_checked"

instance NodeSignal EditorProperty "property_checked"
           '[GodotString, GodotString]

-- | Emit it if you want to add this value as an animation key (check for keying being enabled first).
sig_property_keyed :: Godot.Internal.Dispatch.Signal EditorProperty
sig_property_keyed
  = Godot.Internal.Dispatch.Signal "property_keyed"

instance NodeSignal EditorProperty "property_keyed" '[GodotString]

-- | Emit it if you want to key a property with a single value.
sig_property_keyed_with_value ::
                              Godot.Internal.Dispatch.Signal EditorProperty
sig_property_keyed_with_value
  = Godot.Internal.Dispatch.Signal "property_keyed_with_value"

instance NodeSignal EditorProperty "property_keyed_with_value"
           '[GodotString, GodotVariant]

-- | If you want a sub-resource to be edited, emit this signal with the resource.
sig_resource_selected ::
                      Godot.Internal.Dispatch.Signal EditorProperty
sig_resource_selected
  = Godot.Internal.Dispatch.Signal "resource_selected"

instance NodeSignal EditorProperty "resource_selected"
           '[GodotString, Resource]

-- | Emitted when selected. Used internally.
sig_selected :: Godot.Internal.Dispatch.Signal EditorProperty
sig_selected = Godot.Internal.Dispatch.Signal "selected"

instance NodeSignal EditorProperty "selected" '[GodotString, Int]

{-# NOINLINE bindEditorProperty__focusable_focused #-}

bindEditorProperty__focusable_focused :: MethodBind
bindEditorProperty__focusable_focused
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "_focusable_focused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_focusable_focused ::
                     (EditorProperty :< cls, Object :< cls) => cls -> Int -> IO ()
_focusable_focused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty__focusable_focused
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty__gui_input #-}

bindEditorProperty__gui_input :: MethodBind
bindEditorProperty__gui_input
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (EditorProperty :< cls, Object :< cls) =>
             cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_add_focusable #-}

-- | If any of the controls added can gain keyboard focus, add it here. This ensures that focus will be restored if the inspector is refreshed.
bindEditorProperty_add_focusable :: MethodBind
bindEditorProperty_add_focusable
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "add_focusable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If any of the controls added can gain keyboard focus, add it here. This ensures that focus will be restored if the inspector is refreshed.
add_focusable ::
                (EditorProperty :< cls, Object :< cls) => cls -> Control -> IO ()
add_focusable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_add_focusable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_emit_changed #-}

-- | If one or several properties have changed, this must be called. [code]field[/code] is used in case your editor can modify fields separately (as an example, Vector3.x). The [code]changing[/code] argument avoids the editor requesting this property to be refreshed (leave as [code]false[/code] if unsure).
bindEditorProperty_emit_changed :: MethodBind
bindEditorProperty_emit_changed
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "emit_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If one or several properties have changed, this must be called. [code]field[/code] is used in case your editor can modify fields separately (as an example, Vector3.x). The [code]changing[/code] argument avoids the editor requesting this property to be refreshed (leave as [code]false[/code] if unsure).
emit_changed ::
               (EditorProperty :< cls, Object :< cls) =>
               cls -> GodotString -> GodotVariant -> GodotString -> Bool -> IO ()
emit_changed cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_emit_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_get_edited_object #-}

-- | Gets the edited object.
bindEditorProperty_get_edited_object :: MethodBind
bindEditorProperty_get_edited_object
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_edited_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the edited object.
get_edited_object ::
                    (EditorProperty :< cls, Object :< cls) => cls -> IO Object
get_edited_object cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_get_edited_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_get_edited_property #-}

-- | Gets the edited property. If your editor is for a single property (added via [method EditorInspectorPlugin.parse_property]), then this will return the property.
bindEditorProperty_get_edited_property :: MethodBind
bindEditorProperty_get_edited_property
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_edited_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the edited property. If your editor is for a single property (added via [method EditorInspectorPlugin.parse_property]), then this will return the property.
get_edited_property ::
                      (EditorProperty :< cls, Object :< cls) => cls -> IO GodotString
get_edited_property cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_get_edited_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_get_label #-}

-- | Set this property to change the label (if you want to show one).
bindEditorProperty_get_label :: MethodBind
bindEditorProperty_get_label
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set this property to change the label (if you want to show one).
get_label ::
            (EditorProperty :< cls, Object :< cls) => cls -> IO GodotString
get_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_get_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_get_tooltip_text #-}

-- | Override if you want to allow a custom tooltip over your property.
bindEditorProperty_get_tooltip_text :: MethodBind
bindEditorProperty_get_tooltip_text
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_tooltip_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override if you want to allow a custom tooltip over your property.
get_tooltip_text ::
                   (EditorProperty :< cls, Object :< cls) => cls -> IO GodotString
get_tooltip_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_get_tooltip_text
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_is_checkable #-}

-- | Used by the inspector, set to [code]true[/code] when the property is checkable.
bindEditorProperty_is_checkable :: MethodBind
bindEditorProperty_is_checkable
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property is checkable.
is_checkable ::
               (EditorProperty :< cls, Object :< cls) => cls -> IO Bool
is_checkable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_is_checkable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_is_checked #-}

-- | Used by the inspector, set to [code]true[/code] when the property is checked.
bindEditorProperty_is_checked :: MethodBind
bindEditorProperty_is_checked
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property is checked.
is_checked ::
             (EditorProperty :< cls, Object :< cls) => cls -> IO Bool
is_checked cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_is_checked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_is_draw_red #-}

-- | Used by the inspector, set to [code]true[/code] when the property must draw with error color. This is used for editable children's properties.
bindEditorProperty_is_draw_red :: MethodBind
bindEditorProperty_is_draw_red
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_draw_red" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property must draw with error color. This is used for editable children's properties.
is_draw_red ::
              (EditorProperty :< cls, Object :< cls) => cls -> IO Bool
is_draw_red cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_is_draw_red (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_is_keying #-}

-- | Used by the inspector, set to [code]true[/code] when the property can add keys for animation.
bindEditorProperty_is_keying :: MethodBind
bindEditorProperty_is_keying
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_keying" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property can add keys for animation.
is_keying ::
            (EditorProperty :< cls, Object :< cls) => cls -> IO Bool
is_keying cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_is_keying (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_is_read_only #-}

-- | Used by the inspector, set to [code]true[/code] when the property is read-only.
bindEditorProperty_is_read_only :: MethodBind
bindEditorProperty_is_read_only
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_read_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property is read-only.
is_read_only ::
               (EditorProperty :< cls, Object :< cls) => cls -> IO Bool
is_read_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_is_read_only (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_bottom_editor #-}

-- | Adds controls with this function if you want them on the bottom (below the label).
bindEditorProperty_set_bottom_editor :: MethodBind
bindEditorProperty_set_bottom_editor
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_bottom_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds controls with this function if you want them on the bottom (below the label).
set_bottom_editor ::
                    (EditorProperty :< cls, Object :< cls) => cls -> Control -> IO ()
set_bottom_editor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_bottom_editor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_checkable #-}

-- | Used by the inspector, set to [code]true[/code] when the property is checkable.
bindEditorProperty_set_checkable :: MethodBind
bindEditorProperty_set_checkable
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property is checkable.
set_checkable ::
                (EditorProperty :< cls, Object :< cls) => cls -> Bool -> IO ()
set_checkable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_checkable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_checked #-}

-- | Used by the inspector, set to [code]true[/code] when the property is checked.
bindEditorProperty_set_checked :: MethodBind
bindEditorProperty_set_checked
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property is checked.
set_checked ::
              (EditorProperty :< cls, Object :< cls) => cls -> Bool -> IO ()
set_checked cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_checked (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_draw_red #-}

-- | Used by the inspector, set to [code]true[/code] when the property must draw with error color. This is used for editable children's properties.
bindEditorProperty_set_draw_red :: MethodBind
bindEditorProperty_set_draw_red
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_draw_red" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property must draw with error color. This is used for editable children's properties.
set_draw_red ::
               (EditorProperty :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_red cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_draw_red (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_keying #-}

-- | Used by the inspector, set to [code]true[/code] when the property can add keys for animation.
bindEditorProperty_set_keying :: MethodBind
bindEditorProperty_set_keying
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_keying" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property can add keys for animation.
set_keying ::
             (EditorProperty :< cls, Object :< cls) => cls -> Bool -> IO ()
set_keying cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_keying (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_label #-}

-- | Set this property to change the label (if you want to show one).
bindEditorProperty_set_label :: MethodBind
bindEditorProperty_set_label
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set this property to change the label (if you want to show one).
set_label ::
            (EditorProperty :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
set_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_set_read_only #-}

-- | Used by the inspector, set to [code]true[/code] when the property is read-only.
bindEditorProperty_set_read_only :: MethodBind
bindEditorProperty_set_read_only
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_read_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Used by the inspector, set to [code]true[/code] when the property is read-only.
set_read_only ::
                (EditorProperty :< cls, Object :< cls) => cls -> Bool -> IO ()
set_read_only cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_set_read_only
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorProperty_update_property #-}

-- | When this virtual function is called, you must update your editor.
bindEditorProperty_update_property :: MethodBind
bindEditorProperty_update_property
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "update_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When this virtual function is called, you must update your editor.
update_property ::
                  (EditorProperty :< cls, Object :< cls) => cls -> IO ()
update_property cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorProperty_update_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)