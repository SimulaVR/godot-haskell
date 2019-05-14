{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorFileSystemDirectory
       (Godot.Tools.EditorFileSystemDirectory.get_subdir_count,
        Godot.Tools.EditorFileSystemDirectory.get_subdir,
        Godot.Tools.EditorFileSystemDirectory.get_file_count,
        Godot.Tools.EditorFileSystemDirectory.get_file,
        Godot.Tools.EditorFileSystemDirectory.get_file_path,
        Godot.Tools.EditorFileSystemDirectory.get_file_type,
        Godot.Tools.EditorFileSystemDirectory.get_file_script_class_name,
        Godot.Tools.EditorFileSystemDirectory.get_file_script_class_extends,
        Godot.Tools.EditorFileSystemDirectory.get_file_import_is_valid,
        Godot.Tools.EditorFileSystemDirectory.get_name,
        Godot.Tools.EditorFileSystemDirectory.get_path,
        Godot.Tools.EditorFileSystemDirectory.get_parent,
        Godot.Tools.EditorFileSystemDirectory.find_file_index,
        Godot.Tools.EditorFileSystemDirectory.find_dir_index)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorFileSystemDirectory_get_subdir_count #-}

-- | Returns the number of subdirectories in this directory.
bindEditorFileSystemDirectory_get_subdir_count :: MethodBind
bindEditorFileSystemDirectory_get_subdir_count
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_subdir_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of subdirectories in this directory.
get_subdir_count ::
                   (EditorFileSystemDirectory :< cls, Object :< cls) => cls -> IO Int
get_subdir_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileSystemDirectory_get_subdir_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_subdir #-}

-- | Returns the subdirectory at index [code]idx[/code].
bindEditorFileSystemDirectory_get_subdir :: MethodBind
bindEditorFileSystemDirectory_get_subdir
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_subdir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the subdirectory at index [code]idx[/code].
get_subdir ::
             (EditorFileSystemDirectory :< cls, Object :< cls) =>
             cls -> Int -> IO EditorFileSystemDirectory
get_subdir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_subdir
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file_count #-}

-- | Returns the number of files in this directory.
bindEditorFileSystemDirectory_get_file_count :: MethodBind
bindEditorFileSystemDirectory_get_file_count
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of files in this directory.
get_file_count ::
                 (EditorFileSystemDirectory :< cls, Object :< cls) => cls -> IO Int
get_file_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_file_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file #-}

-- | Returns the name of the file at index [code]idx[/code].
bindEditorFileSystemDirectory_get_file :: MethodBind
bindEditorFileSystemDirectory_get_file
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the file at index [code]idx[/code].
get_file ::
           (EditorFileSystemDirectory :< cls, Object :< cls) =>
           cls -> Int -> IO GodotString
get_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file_path #-}

-- | Returns the path to the file at index [code]idx[/code].
bindEditorFileSystemDirectory_get_file_path :: MethodBind
bindEditorFileSystemDirectory_get_file_path
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the file at index [code]idx[/code].
get_file_path ::
                (EditorFileSystemDirectory :< cls, Object :< cls) =>
                cls -> Int -> IO GodotString
get_file_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_file_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file_type #-}

-- | Returns the file extension of the file at index [code]idx[/code].
bindEditorFileSystemDirectory_get_file_type :: MethodBind
bindEditorFileSystemDirectory_get_file_type
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the file extension of the file at index [code]idx[/code].
get_file_type ::
                (EditorFileSystemDirectory :< cls, Object :< cls) =>
                cls -> Int -> IO GodotString
get_file_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_file_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file_script_class_name
             #-}

bindEditorFileSystemDirectory_get_file_script_class_name ::
                                                         MethodBind
bindEditorFileSystemDirectory_get_file_script_class_name
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_script_class_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_file_script_class_name ::
                             (EditorFileSystemDirectory :< cls, Object :< cls) =>
                             cls -> Int -> IO GodotString
get_file_script_class_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileSystemDirectory_get_file_script_class_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file_script_class_extends
             #-}

bindEditorFileSystemDirectory_get_file_script_class_extends ::
                                                            MethodBind
bindEditorFileSystemDirectory_get_file_script_class_extends
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_script_class_extends" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_file_script_class_extends ::
                                (EditorFileSystemDirectory :< cls, Object :< cls) =>
                                cls -> Int -> IO GodotString
get_file_script_class_extends cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileSystemDirectory_get_file_script_class_extends
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_file_import_is_valid
             #-}

-- | Returns [code]true[/code] if the file at index [code]idx[/code] imported properly.
bindEditorFileSystemDirectory_get_file_import_is_valid ::
                                                       MethodBind
bindEditorFileSystemDirectory_get_file_import_is_valid
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_import_is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the file at index [code]idx[/code] imported properly.
get_file_import_is_valid ::
                           (EditorFileSystemDirectory :< cls, Object :< cls) =>
                           cls -> Int -> IO Bool
get_file_import_is_valid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileSystemDirectory_get_file_import_is_valid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_name #-}

-- | Returns the name of this directory.
bindEditorFileSystemDirectory_get_name :: MethodBind
bindEditorFileSystemDirectory_get_name
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of this directory.
get_name ::
           (EditorFileSystemDirectory :< cls, Object :< cls) =>
           cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_path #-}

-- | Returns the path to this directory.
bindEditorFileSystemDirectory_get_path :: MethodBind
bindEditorFileSystemDirectory_get_path
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to this directory.
get_path ::
           (EditorFileSystemDirectory :< cls, Object :< cls) =>
           cls -> IO GodotString
get_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_get_parent #-}

-- | Returns the parent directory for this directory or null if called on a directory at [code]res://[/code] or [code]user://[/code].
bindEditorFileSystemDirectory_get_parent :: MethodBind
bindEditorFileSystemDirectory_get_parent
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent directory for this directory or null if called on a directory at [code]res://[/code] or [code]user://[/code].
get_parent ::
             (EditorFileSystemDirectory :< cls, Object :< cls) =>
             cls -> IO EditorFileSystemDirectory
get_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_get_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_find_file_index #-}

-- | Returns the index of the file with name [code]name[/code] or [code]-1[/code] if not found.
bindEditorFileSystemDirectory_find_file_index :: MethodBind
bindEditorFileSystemDirectory_find_file_index
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "find_file_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the file with name [code]name[/code] or [code]-1[/code] if not found.
find_file_index ::
                  (EditorFileSystemDirectory :< cls, Object :< cls) =>
                  cls -> GodotString -> IO Int
find_file_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorFileSystemDirectory_find_file_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorFileSystemDirectory_find_dir_index #-}

-- | Returns the index of the directory with name [code]name[/code] or [code]-1[/code] if not found.
bindEditorFileSystemDirectory_find_dir_index :: MethodBind
bindEditorFileSystemDirectory_find_dir_index
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "find_dir_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the directory with name [code]name[/code] or [code]-1[/code] if not found.
find_dir_index ::
                 (EditorFileSystemDirectory :< cls, Object :< cls) =>
                 cls -> GodotString -> IO Int
find_dir_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystemDirectory_find_dir_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)