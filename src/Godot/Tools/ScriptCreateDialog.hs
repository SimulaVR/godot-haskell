{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.ScriptCreateDialog
       (Godot.Tools.ScriptCreateDialog.sig_script_created,
        Godot.Tools.ScriptCreateDialog._browse_class_in_tree,
        Godot.Tools.ScriptCreateDialog._browse_path,
        Godot.Tools.ScriptCreateDialog._built_in_pressed,
        Godot.Tools.ScriptCreateDialog._class_name_changed,
        Godot.Tools.ScriptCreateDialog._create,
        Godot.Tools.ScriptCreateDialog._file_selected,
        Godot.Tools.ScriptCreateDialog._lang_changed,
        Godot.Tools.ScriptCreateDialog._parent_name_changed,
        Godot.Tools.ScriptCreateDialog._path_changed,
        Godot.Tools.ScriptCreateDialog._path_entered,
        Godot.Tools.ScriptCreateDialog._path_hbox_sorted,
        Godot.Tools.ScriptCreateDialog._template_changed,
        Godot.Tools.ScriptCreateDialog.config)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when the user clicks the OK button.
sig_script_created ::
                   Godot.Internal.Dispatch.Signal ScriptCreateDialog
sig_script_created
  = Godot.Internal.Dispatch.Signal "script_created"

instance NodeSignal ScriptCreateDialog "script_created" '[Script]

{-# NOINLINE bindScriptCreateDialog__browse_class_in_tree #-}

bindScriptCreateDialog__browse_class_in_tree :: MethodBind
bindScriptCreateDialog__browse_class_in_tree
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_browse_class_in_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_browse_class_in_tree ::
                        (ScriptCreateDialog :< cls, Object :< cls) => cls -> IO ()
_browse_class_in_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__browse_class_in_tree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__browse_path #-}

bindScriptCreateDialog__browse_path :: MethodBind
bindScriptCreateDialog__browse_path
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_browse_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_browse_path ::
               (ScriptCreateDialog :< cls, Object :< cls) =>
               cls -> Bool -> Bool -> IO ()
_browse_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__browse_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__built_in_pressed #-}

bindScriptCreateDialog__built_in_pressed :: MethodBind
bindScriptCreateDialog__built_in_pressed
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_built_in_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_built_in_pressed ::
                    (ScriptCreateDialog :< cls, Object :< cls) => cls -> IO ()
_built_in_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__built_in_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__class_name_changed #-}

bindScriptCreateDialog__class_name_changed :: MethodBind
bindScriptCreateDialog__class_name_changed
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_class_name_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_class_name_changed ::
                      (ScriptCreateDialog :< cls, Object :< cls) =>
                      cls -> GodotString -> IO ()
_class_name_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__class_name_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__create #-}

bindScriptCreateDialog__create :: MethodBind
bindScriptCreateDialog__create
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_create ::
          (ScriptCreateDialog :< cls, Object :< cls) => cls -> IO ()
_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__file_selected #-}

bindScriptCreateDialog__file_selected :: MethodBind
bindScriptCreateDialog__file_selected
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_file_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_file_selected ::
                 (ScriptCreateDialog :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
_file_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__file_selected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__lang_changed #-}

bindScriptCreateDialog__lang_changed :: MethodBind
bindScriptCreateDialog__lang_changed
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_lang_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_lang_changed ::
                (ScriptCreateDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_lang_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__lang_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__parent_name_changed #-}

bindScriptCreateDialog__parent_name_changed :: MethodBind
bindScriptCreateDialog__parent_name_changed
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_parent_name_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_parent_name_changed ::
                       (ScriptCreateDialog :< cls, Object :< cls) =>
                       cls -> GodotString -> IO ()
_parent_name_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__parent_name_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__path_changed #-}

bindScriptCreateDialog__path_changed :: MethodBind
bindScriptCreateDialog__path_changed
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_path_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_path_changed ::
                (ScriptCreateDialog :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_path_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__path_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__path_entered #-}

bindScriptCreateDialog__path_entered :: MethodBind
bindScriptCreateDialog__path_entered
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_path_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_path_entered ::
                (ScriptCreateDialog :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_path_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__path_entered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__path_hbox_sorted #-}

bindScriptCreateDialog__path_hbox_sorted :: MethodBind
bindScriptCreateDialog__path_hbox_sorted
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_path_hbox_sorted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_path_hbox_sorted ::
                    (ScriptCreateDialog :< cls, Object :< cls) => cls -> IO ()
_path_hbox_sorted cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__path_hbox_sorted
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog__template_changed #-}

bindScriptCreateDialog__template_changed :: MethodBind
bindScriptCreateDialog__template_changed
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "_template_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_template_changed ::
                    (ScriptCreateDialog :< cls, Object :< cls) => cls -> Int -> IO ()
_template_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog__template_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScriptCreateDialog_config #-}

-- | Prefills required fields to configure the ScriptCreateDialog for use.
bindScriptCreateDialog_config :: MethodBind
bindScriptCreateDialog_config
  = unsafePerformIO $
      withCString "ScriptCreateDialog" $
        \ clsNamePtr ->
          withCString "config" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Prefills required fields to configure the ScriptCreateDialog for use.
config ::
         (ScriptCreateDialog :< cls, Object :< cls) =>
         cls -> GodotString -> GodotString -> Bool -> Bool -> IO ()
config cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScriptCreateDialog_config (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)