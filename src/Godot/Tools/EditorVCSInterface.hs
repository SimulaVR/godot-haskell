{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorVCSInterface
       (Godot.Tools.EditorVCSInterface._commit,
        Godot.Tools.EditorVCSInterface._get_file_diff,
        Godot.Tools.EditorVCSInterface._get_modified_files_data,
        Godot.Tools.EditorVCSInterface._get_project_name,
        Godot.Tools.EditorVCSInterface._get_vcs_name,
        Godot.Tools.EditorVCSInterface._initialize,
        Godot.Tools.EditorVCSInterface._is_vcs_initialized,
        Godot.Tools.EditorVCSInterface._shut_down,
        Godot.Tools.EditorVCSInterface._stage_file,
        Godot.Tools.EditorVCSInterface._unstage_file,
        Godot.Tools.EditorVCSInterface.commit,
        Godot.Tools.EditorVCSInterface.get_file_diff,
        Godot.Tools.EditorVCSInterface.get_modified_files_data,
        Godot.Tools.EditorVCSInterface.get_project_name,
        Godot.Tools.EditorVCSInterface.get_vcs_name,
        Godot.Tools.EditorVCSInterface.initialize,
        Godot.Tools.EditorVCSInterface.is_addon_ready,
        Godot.Tools.EditorVCSInterface.is_vcs_initialized,
        Godot.Tools.EditorVCSInterface.shut_down,
        Godot.Tools.EditorVCSInterface.stage_file,
        Godot.Tools.EditorVCSInterface.unstage_file)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorVCSInterface__commit #-}

bindEditorVCSInterface__commit :: MethodBind
bindEditorVCSInterface__commit
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_commit ::
          (EditorVCSInterface :< cls, Object :< cls) =>
          cls -> GodotString -> IO ()
_commit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__commit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__get_file_diff #-}

bindEditorVCSInterface__get_file_diff :: MethodBind
bindEditorVCSInterface__get_file_diff
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_file_diff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_file_diff ::
                 (EditorVCSInterface :< cls, Object :< cls) =>
                 cls -> GodotString -> IO Array
_get_file_diff cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_file_diff
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__get_modified_files_data #-}

bindEditorVCSInterface__get_modified_files_data :: MethodBind
bindEditorVCSInterface__get_modified_files_data
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_modified_files_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_modified_files_data ::
                           (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Dictionary
_get_modified_files_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorVCSInterface__get_modified_files_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__get_project_name #-}

bindEditorVCSInterface__get_project_name :: MethodBind
bindEditorVCSInterface__get_project_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_project_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_project_name ::
                    (EditorVCSInterface :< cls, Object :< cls) => cls -> IO GodotString
_get_project_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_project_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__get_vcs_name #-}

bindEditorVCSInterface__get_vcs_name :: MethodBind
bindEditorVCSInterface__get_vcs_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_get_vcs_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_vcs_name ::
                (EditorVCSInterface :< cls, Object :< cls) => cls -> IO GodotString
_get_vcs_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__get_vcs_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__initialize #-}

bindEditorVCSInterface__initialize :: MethodBind
bindEditorVCSInterface__initialize
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_initialize ::
              (EditorVCSInterface :< cls, Object :< cls) =>
              cls -> GodotString -> IO Bool
_initialize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__initialize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__is_vcs_initialized #-}

bindEditorVCSInterface__is_vcs_initialized :: MethodBind
bindEditorVCSInterface__is_vcs_initialized
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_is_vcs_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_vcs_initialized ::
                      (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Bool
_is_vcs_initialized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__is_vcs_initialized
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__shut_down #-}

bindEditorVCSInterface__shut_down :: MethodBind
bindEditorVCSInterface__shut_down
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_shut_down" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_shut_down ::
             (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Bool
_shut_down cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__shut_down
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__stage_file #-}

bindEditorVCSInterface__stage_file :: MethodBind
bindEditorVCSInterface__stage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_stage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_stage_file ::
              (EditorVCSInterface :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
_stage_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__stage_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface__unstage_file #-}

bindEditorVCSInterface__unstage_file :: MethodBind
bindEditorVCSInterface__unstage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "_unstage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unstage_file ::
                (EditorVCSInterface :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_unstage_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface__unstage_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_commit #-}

bindEditorVCSInterface_commit :: MethodBind
bindEditorVCSInterface_commit
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

commit ::
         (EditorVCSInterface :< cls, Object :< cls) =>
         cls -> GodotString -> IO ()
commit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_commit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_get_file_diff #-}

bindEditorVCSInterface_get_file_diff :: MethodBind
bindEditorVCSInterface_get_file_diff
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_file_diff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_file_diff ::
                (EditorVCSInterface :< cls, Object :< cls) =>
                cls -> GodotString -> IO Array
get_file_diff cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_get_file_diff
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_get_modified_files_data #-}

bindEditorVCSInterface_get_modified_files_data :: MethodBind
bindEditorVCSInterface_get_modified_files_data
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_modified_files_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_modified_files_data ::
                          (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Dictionary
get_modified_files_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorVCSInterface_get_modified_files_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_get_project_name #-}

bindEditorVCSInterface_get_project_name :: MethodBind
bindEditorVCSInterface_get_project_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_project_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_project_name ::
                   (EditorVCSInterface :< cls, Object :< cls) => cls -> IO GodotString
get_project_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_get_project_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_get_vcs_name #-}

bindEditorVCSInterface_get_vcs_name :: MethodBind
bindEditorVCSInterface_get_vcs_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_vcs_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_vcs_name ::
               (EditorVCSInterface :< cls, Object :< cls) => cls -> IO GodotString
get_vcs_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_get_vcs_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_initialize #-}

bindEditorVCSInterface_initialize :: MethodBind
bindEditorVCSInterface_initialize
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

initialize ::
             (EditorVCSInterface :< cls, Object :< cls) =>
             cls -> GodotString -> IO Bool
initialize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_initialize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_is_addon_ready #-}

bindEditorVCSInterface_is_addon_ready :: MethodBind
bindEditorVCSInterface_is_addon_ready
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "is_addon_ready" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_addon_ready ::
                 (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Bool
is_addon_ready cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_is_addon_ready
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_is_vcs_initialized #-}

bindEditorVCSInterface_is_vcs_initialized :: MethodBind
bindEditorVCSInterface_is_vcs_initialized
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "is_vcs_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_vcs_initialized ::
                     (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Bool
is_vcs_initialized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_is_vcs_initialized
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_shut_down #-}

bindEditorVCSInterface_shut_down :: MethodBind
bindEditorVCSInterface_shut_down
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "shut_down" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

shut_down ::
            (EditorVCSInterface :< cls, Object :< cls) => cls -> IO Bool
shut_down cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_shut_down
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_stage_file #-}

bindEditorVCSInterface_stage_file :: MethodBind
bindEditorVCSInterface_stage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "stage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

stage_file ::
             (EditorVCSInterface :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
stage_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_stage_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorVCSInterface_unstage_file #-}

bindEditorVCSInterface_unstage_file :: MethodBind
bindEditorVCSInterface_unstage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "unstage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

unstage_file ::
               (EditorVCSInterface :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
unstage_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorVCSInterface_unstage_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)