{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Creates a version commit if the addon is initialized, else returns without doing anything. Uses the files which have been staged previously, with the commit message set to a value as provided as in the argument.
bindEditorVCSInterface_commit :: MethodBind
bindEditorVCSInterface_commit
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a version commit if the addon is initialized, else returns without doing anything. Uses the files which have been staged previously, with the commit message set to a value as provided as in the argument.
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

-- | Returns an [Array] of [Dictionary] objects containing the diff output from the VCS in use, if a VCS addon is initialized, else returns an empty [Array] object. The diff contents also consist of some contextual lines which provide context to the observed line change in the file.
--   				Each [Dictionary] object has the line diff contents under the keys:
--   				- [code]"content"[/code] to store a [String] containing the line contents
--   				- [code]"status"[/code] to store a [String] which contains [code]"+"[/code] in case the content is a line addition but it stores a [code]"-"[/code] in case of deletion and an empty string in the case the line content is neither an addition nor a deletion.
--   				- [code]"new_line_number"[/code] to store an integer containing the new line number of the line content.
--   				- [code]"line_count"[/code] to store an integer containing the number of lines in the line content.
--   				- [code]"old_line_number"[/code] to store an integer containing the old line number of the line content.
--   				- [code]"offset"[/code] to store the offset of the line change since the first contextual line content.
bindEditorVCSInterface_get_file_diff :: MethodBind
bindEditorVCSInterface_get_file_diff
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_file_diff" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Array] of [Dictionary] objects containing the diff output from the VCS in use, if a VCS addon is initialized, else returns an empty [Array] object. The diff contents also consist of some contextual lines which provide context to the observed line change in the file.
--   				Each [Dictionary] object has the line diff contents under the keys:
--   				- [code]"content"[/code] to store a [String] containing the line contents
--   				- [code]"status"[/code] to store a [String] which contains [code]"+"[/code] in case the content is a line addition but it stores a [code]"-"[/code] in case of deletion and an empty string in the case the line content is neither an addition nor a deletion.
--   				- [code]"new_line_number"[/code] to store an integer containing the new line number of the line content.
--   				- [code]"line_count"[/code] to store an integer containing the number of lines in the line content.
--   				- [code]"old_line_number"[/code] to store an integer containing the old line number of the line content.
--   				- [code]"offset"[/code] to store the offset of the line change since the first contextual line content.
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

-- | Returns a [Dictionary] containing the path of the detected file change mapped to an integer signifying what kind of a change the corresponding file has experienced.
--   				The following integer values are being used to signify that the detected file is:
--   				- [code]0[/code]: New to the VCS working directory
--   				- [code]1[/code]: Modified
--   				- [code]2[/code]: Renamed
--   				- [code]3[/code]: Deleted
--   				- [code]4[/code]: Typechanged
bindEditorVCSInterface_get_modified_files_data :: MethodBind
bindEditorVCSInterface_get_modified_files_data
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_modified_files_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [Dictionary] containing the path of the detected file change mapped to an integer signifying what kind of a change the corresponding file has experienced.
--   				The following integer values are being used to signify that the detected file is:
--   				- [code]0[/code]: New to the VCS working directory
--   				- [code]1[/code]: Modified
--   				- [code]2[/code]: Renamed
--   				- [code]3[/code]: Deleted
--   				- [code]4[/code]: Typechanged
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

-- | Returns the project name of the VCS working directory.
bindEditorVCSInterface_get_project_name :: MethodBind
bindEditorVCSInterface_get_project_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_project_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the project name of the VCS working directory.
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

-- | Returns the name of the VCS if the VCS has been initialized, else return an empty string.
bindEditorVCSInterface_get_vcs_name :: MethodBind
bindEditorVCSInterface_get_vcs_name
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "get_vcs_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the VCS if the VCS has been initialized, else return an empty string.
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

-- | Initializes the VCS addon if not already. Uses the argument value as the path to the working directory of the project. Creates the initial commit if required. Returns [code]true[/code] if no failure occurs, else returns [code]false[/code].
bindEditorVCSInterface_initialize :: MethodBind
bindEditorVCSInterface_initialize
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the VCS addon if not already. Uses the argument value as the path to the working directory of the project. Creates the initial commit if required. Returns [code]true[/code] if no failure occurs, else returns [code]false[/code].
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

-- | Returns [code]true[/code] if the addon is ready to respond to function calls, else returns [code]false[/code].
bindEditorVCSInterface_is_addon_ready :: MethodBind
bindEditorVCSInterface_is_addon_ready
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "is_addon_ready" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the addon is ready to respond to function calls, else returns [code]false[/code].
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

-- | Returns [code]true[/code] if the VCS addon has been initialized, else returns [code]false[/code].
bindEditorVCSInterface_is_vcs_initialized :: MethodBind
bindEditorVCSInterface_is_vcs_initialized
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "is_vcs_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the VCS addon has been initialized, else returns [code]false[/code].
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

-- | Shuts down the VCS addon to allow cleanup code to run on call. Returns [code]true[/code] is no failure occurs, else returns [code]false[/code].
bindEditorVCSInterface_shut_down :: MethodBind
bindEditorVCSInterface_shut_down
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "shut_down" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shuts down the VCS addon to allow cleanup code to run on call. Returns [code]true[/code] is no failure occurs, else returns [code]false[/code].
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

-- | Stages the file which should be committed when [method EditorVCSInterface.commit] is called. Argument should contain the absolute path.
bindEditorVCSInterface_stage_file :: MethodBind
bindEditorVCSInterface_stage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "stage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stages the file which should be committed when [method EditorVCSInterface.commit] is called. Argument should contain the absolute path.
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

-- | Unstages the file which was staged previously to be committed, so that it is no longer committed when [method EditorVCSInterface.commit] is called. Argument should contain the absolute path.
bindEditorVCSInterface_unstage_file :: MethodBind
bindEditorVCSInterface_unstage_file
  = unsafePerformIO $
      withCString "EditorVCSInterface" $
        \ clsNamePtr ->
          withCString "unstage_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unstages the file which was staged previously to be committed, so that it is no longer committed when [method EditorVCSInterface.commit] is called. Argument should contain the absolute path.
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