{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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

sig_multiple_properties_changed ::
                                Godot.Internal.Dispatch.Signal EditorProperty
sig_multiple_properties_changed
  = Godot.Internal.Dispatch.Signal "multiple_properties_changed"

sig_object_id_selected ::
                       Godot.Internal.Dispatch.Signal EditorProperty
sig_object_id_selected
  = Godot.Internal.Dispatch.Signal "object_id_selected"

sig_property_changed ::
                     Godot.Internal.Dispatch.Signal EditorProperty
sig_property_changed
  = Godot.Internal.Dispatch.Signal "property_changed"

sig_property_checked ::
                     Godot.Internal.Dispatch.Signal EditorProperty
sig_property_checked
  = Godot.Internal.Dispatch.Signal "property_checked"

sig_property_keyed :: Godot.Internal.Dispatch.Signal EditorProperty
sig_property_keyed
  = Godot.Internal.Dispatch.Signal "property_keyed"

sig_property_keyed_with_value ::
                              Godot.Internal.Dispatch.Signal EditorProperty
sig_property_keyed_with_value
  = Godot.Internal.Dispatch.Signal "property_keyed_with_value"

sig_resource_selected ::
                      Godot.Internal.Dispatch.Signal EditorProperty
sig_resource_selected
  = Godot.Internal.Dispatch.Signal "resource_selected"

sig_selected :: Godot.Internal.Dispatch.Signal EditorProperty
sig_selected = Godot.Internal.Dispatch.Signal "selected"

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

bindEditorProperty_add_focusable :: MethodBind
bindEditorProperty_add_focusable
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "add_focusable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_emit_changed :: MethodBind
bindEditorProperty_emit_changed
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "emit_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_get_edited_object :: MethodBind
bindEditorProperty_get_edited_object
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_edited_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_get_edited_property :: MethodBind
bindEditorProperty_get_edited_property
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_edited_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_get_label :: MethodBind
bindEditorProperty_get_label
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_get_tooltip_text :: MethodBind
bindEditorProperty_get_tooltip_text
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "get_tooltip_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_is_checkable :: MethodBind
bindEditorProperty_is_checkable
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_is_checked :: MethodBind
bindEditorProperty_is_checked
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_is_draw_red :: MethodBind
bindEditorProperty_is_draw_red
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_draw_red" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_is_keying :: MethodBind
bindEditorProperty_is_keying
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_keying" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_is_read_only :: MethodBind
bindEditorProperty_is_read_only
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "is_read_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_bottom_editor :: MethodBind
bindEditorProperty_set_bottom_editor
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_bottom_editor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_checkable :: MethodBind
bindEditorProperty_set_checkable
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_checkable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_checked :: MethodBind
bindEditorProperty_set_checked
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_draw_red :: MethodBind
bindEditorProperty_set_draw_red
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_draw_red" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_keying :: MethodBind
bindEditorProperty_set_keying
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_keying" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_label :: MethodBind
bindEditorProperty_set_label
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_set_read_only :: MethodBind
bindEditorProperty_set_read_only
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "set_read_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindEditorProperty_update_property :: MethodBind
bindEditorProperty_update_property
  = unsafePerformIO $
      withCString "EditorProperty" $
        \ clsNamePtr ->
          withCString "update_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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