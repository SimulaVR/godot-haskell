{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorInspector
       (Godot.Tools.EditorInspector.sig_object_id_selected,
        Godot.Tools.EditorInspector.sig_property_edited,
        Godot.Tools.EditorInspector.sig_property_keyed,
        Godot.Tools.EditorInspector.sig_property_selected,
        Godot.Tools.EditorInspector.sig_property_toggled,
        Godot.Tools.EditorInspector.sig_resource_selected,
        Godot.Tools.EditorInspector.sig_restart_requested,
        Godot.Tools.EditorInspector._edit_request_change,
        Godot.Tools.EditorInspector._feature_profile_changed,
        Godot.Tools.EditorInspector._filter_changed,
        Godot.Tools.EditorInspector._multiple_properties_changed,
        Godot.Tools.EditorInspector._node_removed,
        Godot.Tools.EditorInspector._object_id_selected,
        Godot.Tools.EditorInspector._property_changed,
        Godot.Tools.EditorInspector._property_changed_update_all,
        Godot.Tools.EditorInspector._property_checked,
        Godot.Tools.EditorInspector._property_keyed,
        Godot.Tools.EditorInspector._property_keyed_with_value,
        Godot.Tools.EditorInspector._property_selected,
        Godot.Tools.EditorInspector._resource_selected,
        Godot.Tools.EditorInspector._vscroll_changed,
        Godot.Tools.EditorInspector.refresh)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_object_id_selected ::
                       Godot.Internal.Dispatch.Signal EditorInspector
sig_object_id_selected
  = Godot.Internal.Dispatch.Signal "object_id_selected"

sig_property_edited ::
                    Godot.Internal.Dispatch.Signal EditorInspector
sig_property_edited
  = Godot.Internal.Dispatch.Signal "property_edited"

sig_property_keyed ::
                   Godot.Internal.Dispatch.Signal EditorInspector
sig_property_keyed
  = Godot.Internal.Dispatch.Signal "property_keyed"

sig_property_selected ::
                      Godot.Internal.Dispatch.Signal EditorInspector
sig_property_selected
  = Godot.Internal.Dispatch.Signal "property_selected"

sig_property_toggled ::
                     Godot.Internal.Dispatch.Signal EditorInspector
sig_property_toggled
  = Godot.Internal.Dispatch.Signal "property_toggled"

sig_resource_selected ::
                      Godot.Internal.Dispatch.Signal EditorInspector
sig_resource_selected
  = Godot.Internal.Dispatch.Signal "resource_selected"

sig_restart_requested ::
                      Godot.Internal.Dispatch.Signal EditorInspector
sig_restart_requested
  = Godot.Internal.Dispatch.Signal "restart_requested"

{-# NOINLINE bindEditorInspector__edit_request_change #-}

bindEditorInspector__edit_request_change :: MethodBind
bindEditorInspector__edit_request_change
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_edit_request_change" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_request_change ::
                       (EditorInspector :< cls, Object :< cls) =>
                       cls -> Object -> GodotString -> IO ()
_edit_request_change cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__edit_request_change
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__feature_profile_changed #-}

bindEditorInspector__feature_profile_changed :: MethodBind
bindEditorInspector__feature_profile_changed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_feature_profile_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_feature_profile_changed ::
                           (EditorInspector :< cls, Object :< cls) => cls -> IO ()
_feature_profile_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__feature_profile_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__filter_changed #-}

bindEditorInspector__filter_changed :: MethodBind
bindEditorInspector__filter_changed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_filter_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_filter_changed ::
                  (EditorInspector :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
_filter_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__filter_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__multiple_properties_changed #-}

bindEditorInspector__multiple_properties_changed :: MethodBind
bindEditorInspector__multiple_properties_changed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_multiple_properties_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_multiple_properties_changed ::
                               (EditorInspector :< cls, Object :< cls) =>
                               cls -> PoolStringArray -> Array -> IO ()
_multiple_properties_changed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorInspector__multiple_properties_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__node_removed #-}

bindEditorInspector__node_removed :: MethodBind
bindEditorInspector__node_removed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (EditorInspector :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__node_removed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__object_id_selected #-}

bindEditorInspector__object_id_selected :: MethodBind
bindEditorInspector__object_id_selected
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_object_id_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_object_id_selected ::
                      (EditorInspector :< cls, Object :< cls) =>
                      cls -> GodotString -> Int -> IO ()
_object_id_selected cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__object_id_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__property_changed #-}

bindEditorInspector__property_changed :: MethodBind
bindEditorInspector__property_changed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_property_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_property_changed ::
                    (EditorInspector :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotVariant -> GodotString -> Bool -> IO ()
_property_changed cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__property_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__property_changed_update_all #-}

bindEditorInspector__property_changed_update_all :: MethodBind
bindEditorInspector__property_changed_update_all
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_property_changed_update_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_property_changed_update_all ::
                               (EditorInspector :< cls, Object :< cls) =>
                               cls -> GodotString -> GodotVariant -> GodotString -> Bool -> IO ()
_property_changed_update_all cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorInspector__property_changed_update_all
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__property_checked #-}

bindEditorInspector__property_checked :: MethodBind
bindEditorInspector__property_checked
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_property_checked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_property_checked ::
                    (EditorInspector :< cls, Object :< cls) =>
                    cls -> GodotString -> Bool -> IO ()
_property_checked cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__property_checked
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__property_keyed #-}

bindEditorInspector__property_keyed :: MethodBind
bindEditorInspector__property_keyed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_property_keyed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_property_keyed ::
                  (EditorInspector :< cls, Object :< cls) =>
                  cls -> GodotString -> Bool -> IO ()
_property_keyed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__property_keyed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__property_keyed_with_value #-}

bindEditorInspector__property_keyed_with_value :: MethodBind
bindEditorInspector__property_keyed_with_value
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_property_keyed_with_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_property_keyed_with_value ::
                             (EditorInspector :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotVariant -> Bool -> IO ()
_property_keyed_with_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorInspector__property_keyed_with_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__property_selected #-}

bindEditorInspector__property_selected :: MethodBind
bindEditorInspector__property_selected
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_property_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_property_selected ::
                     (EditorInspector :< cls, Object :< cls) =>
                     cls -> GodotString -> Int -> IO ()
_property_selected cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__property_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__resource_selected #-}

bindEditorInspector__resource_selected :: MethodBind
bindEditorInspector__resource_selected
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_resource_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_resource_selected ::
                     (EditorInspector :< cls, Object :< cls) =>
                     cls -> GodotString -> Resource -> IO ()
_resource_selected cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__resource_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector__vscroll_changed #-}

bindEditorInspector__vscroll_changed :: MethodBind
bindEditorInspector__vscroll_changed
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "_vscroll_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_vscroll_changed ::
                   (EditorInspector :< cls, Object :< cls) => cls -> Float -> IO ()
_vscroll_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector__vscroll_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorInspector_refresh #-}

bindEditorInspector_refresh :: MethodBind
bindEditorInspector_refresh
  = unsafePerformIO $
      withCString "EditorInspector" $
        \ clsNamePtr ->
          withCString "refresh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

refresh :: (EditorInspector :< cls, Object :< cls) => cls -> IO ()
refresh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorInspector_refresh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)