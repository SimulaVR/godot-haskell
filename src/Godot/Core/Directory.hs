{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Directory
       (Godot.Core.Directory.open, Godot.Core.Directory.list_dir_begin,
        Godot.Core.Directory.get_next, Godot.Core.Directory.current_is_dir,
        Godot.Core.Directory.list_dir_end,
        Godot.Core.Directory.get_drive_count,
        Godot.Core.Directory.get_drive,
        Godot.Core.Directory.get_current_drive,
        Godot.Core.Directory.change_dir,
        Godot.Core.Directory.get_current_dir,
        Godot.Core.Directory.make_dir,
        Godot.Core.Directory.make_dir_recursive,
        Godot.Core.Directory.file_exists, Godot.Core.Directory.dir_exists,
        Godot.Core.Directory.get_space_left, Godot.Core.Directory.copy,
        Godot.Core.Directory.rename, Godot.Core.Directory.remove)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindDirectory_open #-}

-- | Open an existing directory of the filesystem. The [i]path[/i] argument can be within the project tree ([code]res://folder[/code]), the user directory ([code]user://folder[/code]) or an absolute path of the user filesystem (e.g. [code]/tmp/folder[/code] or [code]C:\tmp\folder[/code]).
--   				The method returns one of the error code constants defined in [@GlobalScope] (OK or ERR_*).
bindDirectory_open :: MethodBind
bindDirectory_open
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Open an existing directory of the filesystem. The [i]path[/i] argument can be within the project tree ([code]res://folder[/code]), the user directory ([code]user://folder[/code]) or an absolute path of the user filesystem (e.g. [code]/tmp/folder[/code] or [code]C:\tmp\folder[/code]).
--   				The method returns one of the error code constants defined in [@GlobalScope] (OK or ERR_*).
open ::
       (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
open cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_open (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_list_dir_begin #-}

-- | Initialise the stream used to list all files and directories using the [method get_next] function, closing the current opened stream if needed. Once the stream has been processed, it should typically be closed with [method list_dir_end].
--   				If you pass [code]skip_navigational[/code], then [code].[/code] and [code]..[/code] would be filtered out.
--   				If you pass [code]skip_hidden[/code], then hidden files would be filtered out.
bindDirectory_list_dir_begin :: MethodBind
bindDirectory_list_dir_begin
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "list_dir_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initialise the stream used to list all files and directories using the [method get_next] function, closing the current opened stream if needed. Once the stream has been processed, it should typically be closed with [method list_dir_end].
--   				If you pass [code]skip_navigational[/code], then [code].[/code] and [code]..[/code] would be filtered out.
--   				If you pass [code]skip_hidden[/code], then hidden files would be filtered out.
list_dir_begin ::
                 (Directory :< cls, Object :< cls) => cls -> Bool -> Bool -> IO Int
list_dir_begin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_list_dir_begin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_get_next #-}

-- | Return the next element (file or directory) in the current directory (including [code].[/code] and [code]..[/code], unless [code]skip_navigational[/code] was given to [method list_dir_begin]).
--   				The name of the file or directory is returned (and not its full path). Once the stream has been fully processed, the method returns an empty String and closes the stream automatically (i.e. [method list_dir_end] would not be mandatory in such a case).
bindDirectory_get_next :: MethodBind
bindDirectory_get_next
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the next element (file or directory) in the current directory (including [code].[/code] and [code]..[/code], unless [code]skip_navigational[/code] was given to [method list_dir_begin]).
--   				The name of the file or directory is returned (and not its full path). Once the stream has been fully processed, the method returns an empty String and closes the stream automatically (i.e. [method list_dir_end] would not be mandatory in such a case).
get_next ::
           (Directory :< cls, Object :< cls) => cls -> IO GodotString
get_next cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_next (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_current_is_dir #-}

-- | Return whether the current item processed with the last [method get_next] call is a directory ([code].[/code] and [code]..[/code] are considered directories).
bindDirectory_current_is_dir :: MethodBind
bindDirectory_current_is_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "current_is_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the current item processed with the last [method get_next] call is a directory ([code].[/code] and [code]..[/code] are considered directories).
current_is_dir ::
                 (Directory :< cls, Object :< cls) => cls -> IO Bool
current_is_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_current_is_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_list_dir_end #-}

-- | Close the current stream opened with [method list_dir_begin] (whether it has been fully processed with [method get_next] or not does not matter).
bindDirectory_list_dir_end :: MethodBind
bindDirectory_list_dir_end
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "list_dir_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Close the current stream opened with [method list_dir_begin] (whether it has been fully processed with [method get_next] or not does not matter).
list_dir_end :: (Directory :< cls, Object :< cls) => cls -> IO ()
list_dir_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_list_dir_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_get_drive_count #-}

-- | On Windows, return the number of drives (partitions) mounted on the current filesystem. On other platforms, the method returns 0.
bindDirectory_get_drive_count :: MethodBind
bindDirectory_get_drive_count
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_drive_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On Windows, return the number of drives (partitions) mounted on the current filesystem. On other platforms, the method returns 0.
get_drive_count ::
                  (Directory :< cls, Object :< cls) => cls -> IO Int
get_drive_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_drive_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_get_drive #-}

-- | On Windows, return the name of the drive (partition) passed as an argument (e.g. [code]C:[/code]). On other platforms, or if the requested drive does not existed, the method returns an empty String.
bindDirectory_get_drive :: MethodBind
bindDirectory_get_drive
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On Windows, return the name of the drive (partition) passed as an argument (e.g. [code]C:[/code]). On other platforms, or if the requested drive does not existed, the method returns an empty String.
get_drive ::
            (Directory :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_drive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_drive (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_get_current_drive #-}

-- | Returns the currently opened directory's drive index. See [method get_drive] to convert returned index to the name of the drive.
bindDirectory_get_current_drive :: MethodBind
bindDirectory_get_current_drive
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_current_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently opened directory's drive index. See [method get_drive] to convert returned index to the name of the drive.
get_current_drive ::
                    (Directory :< cls, Object :< cls) => cls -> IO Int
get_current_drive cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_current_drive (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_change_dir #-}

-- | Change the currently opened directory to the one passed as an argument. The argument can be relative to the current directory (e.g. [code]newdir[/code] or [code]../newdir[/code]), or an absolute path (e.g. [code]/tmp/newdir[/code] or [code]res://somedir/newdir[/code]).
--   				The method returns one of the error code constants defined in [@GlobalScope] (OK or ERR_*).
bindDirectory_change_dir :: MethodBind
bindDirectory_change_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "change_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Change the currently opened directory to the one passed as an argument. The argument can be relative to the current directory (e.g. [code]newdir[/code] or [code]../newdir[/code]), or an absolute path (e.g. [code]/tmp/newdir[/code] or [code]res://somedir/newdir[/code]).
--   				The method returns one of the error code constants defined in [@GlobalScope] (OK or ERR_*).
change_dir ::
             (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
change_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_change_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_get_current_dir #-}

-- | Return the absolute path to the currently opened directory (e.g. [code]res://folder[/code] or [code]C:\tmp\folder[/code]).
bindDirectory_get_current_dir :: MethodBind
bindDirectory_get_current_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_current_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the absolute path to the currently opened directory (e.g. [code]res://folder[/code] or [code]C:\tmp\folder[/code]).
get_current_dir ::
                  (Directory :< cls, Object :< cls) => cls -> IO GodotString
get_current_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_current_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_make_dir #-}

-- | Create a directory. The argument can be relative to the current directory, or an absolute path. The target directory should be placed in an already existing directory (to create the full path recursively, see [method make_dir_recursive]).
--   				The method returns one of the error code constants defined in [@GlobalScope] (OK, FAILED or ERR_*).
bindDirectory_make_dir :: MethodBind
bindDirectory_make_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "make_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a directory. The argument can be relative to the current directory, or an absolute path. The target directory should be placed in an already existing directory (to create the full path recursively, see [method make_dir_recursive]).
--   				The method returns one of the error code constants defined in [@GlobalScope] (OK, FAILED or ERR_*).
make_dir ::
           (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
make_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_make_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_make_dir_recursive #-}

-- | Create a target directory and all necessary intermediate directories in its path, by calling [method make_dir] recursively. The argument can be relative to the current directory, or an absolute path.
--   				Return one of the error code constants defined in [@GlobalScope] (OK, FAILED or ERR_*).
bindDirectory_make_dir_recursive :: MethodBind
bindDirectory_make_dir_recursive
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "make_dir_recursive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a target directory and all necessary intermediate directories in its path, by calling [method make_dir] recursively. The argument can be relative to the current directory, or an absolute path.
--   				Return one of the error code constants defined in [@GlobalScope] (OK, FAILED or ERR_*).
make_dir_recursive ::
                     (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
make_dir_recursive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_make_dir_recursive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_file_exists #-}

-- | Return whether the target file exists. The argument can be relative to the current directory, or an absolute path.
bindDirectory_file_exists :: MethodBind
bindDirectory_file_exists
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "file_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the target file exists. The argument can be relative to the current directory, or an absolute path.
file_exists ::
              (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Bool
file_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_file_exists (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_dir_exists #-}

-- | Return whether the target directory exists. The argument can be relative to the current directory, or an absolute path.
bindDirectory_dir_exists :: MethodBind
bindDirectory_dir_exists
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "dir_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether the target directory exists. The argument can be relative to the current directory, or an absolute path.
dir_exists ::
             (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Bool
dir_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_dir_exists (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_get_space_left #-}

-- | On Unix desktop systems, return the available space on the current directory's disk. On other platforms, this information is not available and the method returns 0 or -1.
bindDirectory_get_space_left :: MethodBind
bindDirectory_get_space_left
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_space_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On Unix desktop systems, return the available space on the current directory's disk. On other platforms, this information is not available and the method returns 0 or -1.
get_space_left ::
                 (Directory :< cls, Object :< cls) => cls -> IO Int
get_space_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_space_left (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_copy #-}

-- | Copy the [i]from[/i] file to the [i]to[/i] destination. Both arguments should be paths to files, either relative or absolute. If the destination file exists and is not access-protected, it will be overwritten.
--   				Returns one of the error code constants defined in [@GlobalScope] (OK, FAILED or ERR_*).
bindDirectory_copy :: MethodBind
bindDirectory_copy
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "copy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Copy the [i]from[/i] file to the [i]to[/i] destination. Both arguments should be paths to files, either relative or absolute. If the destination file exists and is not access-protected, it will be overwritten.
--   				Returns one of the error code constants defined in [@GlobalScope] (OK, FAILED or ERR_*).
copy ::
       (Directory :< cls, Object :< cls) =>
       cls -> GodotString -> GodotString -> IO Int
copy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_copy (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_rename #-}

-- | Rename (move) the [i]from[/i] file to the [i]to[/i] destination. Both arguments should be paths to files, either relative or absolute. If the destination file exists and is not access-protected, it will be overwritten.
--   				Return one of the error code constants defined in [@GlobalScope] (OK or FAILED).
bindDirectory_rename :: MethodBind
bindDirectory_rename
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "rename" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rename (move) the [i]from[/i] file to the [i]to[/i] destination. Both arguments should be paths to files, either relative or absolute. If the destination file exists and is not access-protected, it will be overwritten.
--   				Return one of the error code constants defined in [@GlobalScope] (OK or FAILED).
rename ::
         (Directory :< cls, Object :< cls) =>
         cls -> GodotString -> GodotString -> IO Int
rename cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_rename (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDirectory_remove #-}

-- | Delete the target file or an empty directory. The argument can be relative to the current directory, or an absolute path. If the target directory is not empty, the operation will fail.
--   				Return one of the error code constants defined in [@GlobalScope] (OK or FAILED).
bindDirectory_remove :: MethodBind
bindDirectory_remove
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Delete the target file or an empty directory. The argument can be relative to the current directory, or an absolute path. If the target directory is not empty, the operation will fail.
--   				Return one of the error code constants defined in [@GlobalScope] (OK or FAILED).
remove ::
         (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_remove (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)