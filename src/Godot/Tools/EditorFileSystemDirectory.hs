{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorFileSystemDirectory
       (Godot.Tools.EditorFileSystemDirectory.find_dir_index,
        Godot.Tools.EditorFileSystemDirectory.find_file_index,
        Godot.Tools.EditorFileSystemDirectory.get_file,
        Godot.Tools.EditorFileSystemDirectory.get_file_count,
        Godot.Tools.EditorFileSystemDirectory.get_file_import_is_valid,
        Godot.Tools.EditorFileSystemDirectory.get_file_path,
        Godot.Tools.EditorFileSystemDirectory.get_file_script_class_extends,
        Godot.Tools.EditorFileSystemDirectory.get_file_script_class_name,
        Godot.Tools.EditorFileSystemDirectory.get_file_type,
        Godot.Tools.EditorFileSystemDirectory.get_name,
        Godot.Tools.EditorFileSystemDirectory.get_parent,
        Godot.Tools.EditorFileSystemDirectory.get_path,
        Godot.Tools.EditorFileSystemDirectory.get_subdir,
        Godot.Tools.EditorFileSystemDirectory.get_subdir_count)
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
import Godot.Core.Object()

{-# NOINLINE bindEditorFileSystemDirectory_find_dir_index #-}

-- | Returns the index of the directory with name @name@ or @-1@ if not found.
bindEditorFileSystemDirectory_find_dir_index :: MethodBind
bindEditorFileSystemDirectory_find_dir_index
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "find_dir_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the directory with name @name@ or @-1@ if not found.
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

instance NodeMethod EditorFileSystemDirectory "find_dir_index"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.find_dir_index

{-# NOINLINE bindEditorFileSystemDirectory_find_file_index #-}

-- | Returns the index of the file with name @name@ or @-1@ if not found.
bindEditorFileSystemDirectory_find_file_index :: MethodBind
bindEditorFileSystemDirectory_find_file_index
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "find_file_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the file with name @name@ or @-1@ if not found.
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

instance NodeMethod EditorFileSystemDirectory "find_file_index"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.find_file_index

{-# NOINLINE bindEditorFileSystemDirectory_get_file #-}

-- | Returns the name of the file at index @idx@.
bindEditorFileSystemDirectory_get_file :: MethodBind
bindEditorFileSystemDirectory_get_file
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the file at index @idx@.
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

instance NodeMethod EditorFileSystemDirectory "get_file" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_file

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

instance NodeMethod EditorFileSystemDirectory "get_file_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_file_count

{-# NOINLINE bindEditorFileSystemDirectory_get_file_import_is_valid
             #-}

-- | Returns @true@ if the file at index @idx@ imported properly.
bindEditorFileSystemDirectory_get_file_import_is_valid ::
                                                       MethodBind
bindEditorFileSystemDirectory_get_file_import_is_valid
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_import_is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the file at index @idx@ imported properly.
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

instance NodeMethod EditorFileSystemDirectory
           "get_file_import_is_valid"
           '[Int]
           (IO Bool)
         where
        nodeMethod
          = Godot.Tools.EditorFileSystemDirectory.get_file_import_is_valid

{-# NOINLINE bindEditorFileSystemDirectory_get_file_path #-}

-- | Returns the path to the file at index @idx@.
bindEditorFileSystemDirectory_get_file_path :: MethodBind
bindEditorFileSystemDirectory_get_file_path
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the file at index @idx@.
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

instance NodeMethod EditorFileSystemDirectory "get_file_path"
           '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_file_path

{-# NOINLINE bindEditorFileSystemDirectory_get_file_script_class_extends
             #-}

-- | Returns the base class of the script class defined in the file at index @idx@. If the file doesn't define a script class using the @class_name@ syntax, this will return an empty string.
bindEditorFileSystemDirectory_get_file_script_class_extends ::
                                                            MethodBind
bindEditorFileSystemDirectory_get_file_script_class_extends
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_script_class_extends" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the base class of the script class defined in the file at index @idx@. If the file doesn't define a script class using the @class_name@ syntax, this will return an empty string.
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

instance NodeMethod EditorFileSystemDirectory
           "get_file_script_class_extends"
           '[Int]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Tools.EditorFileSystemDirectory.get_file_script_class_extends

{-# NOINLINE bindEditorFileSystemDirectory_get_file_script_class_name
             #-}

-- | Returns the name of the script class defined in the file at index @idx@. If the file doesn't define a script class using the @class_name@ syntax, this will return an empty string.
bindEditorFileSystemDirectory_get_file_script_class_name ::
                                                         MethodBind
bindEditorFileSystemDirectory_get_file_script_class_name
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_script_class_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the script class defined in the file at index @idx@. If the file doesn't define a script class using the @class_name@ syntax, this will return an empty string.
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

instance NodeMethod EditorFileSystemDirectory
           "get_file_script_class_name"
           '[Int]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Tools.EditorFileSystemDirectory.get_file_script_class_name

{-# NOINLINE bindEditorFileSystemDirectory_get_file_type #-}

-- | Returns the resource type of the file at index @idx@. This returns a string such as @"Resource"@ or @"GDScript"@, @i@not@/i@ a file extension such as @".gd"@.
bindEditorFileSystemDirectory_get_file_type :: MethodBind
bindEditorFileSystemDirectory_get_file_type
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_file_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the resource type of the file at index @idx@. This returns a string such as @"Resource"@ or @"GDScript"@, @i@not@/i@ a file extension such as @".gd"@.
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

instance NodeMethod EditorFileSystemDirectory "get_file_type"
           '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_file_type

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

instance NodeMethod EditorFileSystemDirectory "get_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_name

{-# NOINLINE bindEditorFileSystemDirectory_get_parent #-}

-- | Returns the parent directory for this directory or @null@ if called on a directory at @res://@ or @user://@.
bindEditorFileSystemDirectory_get_parent :: MethodBind
bindEditorFileSystemDirectory_get_parent
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent directory for this directory or @null@ if called on a directory at @res://@ or @user://@.
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

instance NodeMethod EditorFileSystemDirectory "get_parent" '[]
           (IO EditorFileSystemDirectory)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_parent

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

instance NodeMethod EditorFileSystemDirectory "get_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_path

{-# NOINLINE bindEditorFileSystemDirectory_get_subdir #-}

-- | Returns the subdirectory at index @idx@.
bindEditorFileSystemDirectory_get_subdir :: MethodBind
bindEditorFileSystemDirectory_get_subdir
  = unsafePerformIO $
      withCString "EditorFileSystemDirectory" $
        \ clsNamePtr ->
          withCString "get_subdir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the subdirectory at index @idx@.
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

instance NodeMethod EditorFileSystemDirectory "get_subdir" '[Int]
           (IO EditorFileSystemDirectory)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_subdir

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

instance NodeMethod EditorFileSystemDirectory "get_subdir_count"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorFileSystemDirectory.get_subdir_count