{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Directory
       (Godot.Core.Directory.change_dir, Godot.Core.Directory.copy,
        Godot.Core.Directory.current_is_dir,
        Godot.Core.Directory.dir_exists, Godot.Core.Directory.file_exists,
        Godot.Core.Directory.get_current_dir,
        Godot.Core.Directory.get_current_drive,
        Godot.Core.Directory.get_drive,
        Godot.Core.Directory.get_drive_count,
        Godot.Core.Directory.get_next, Godot.Core.Directory.get_space_left,
        Godot.Core.Directory.list_dir_begin,
        Godot.Core.Directory.list_dir_end, Godot.Core.Directory.make_dir,
        Godot.Core.Directory.make_dir_recursive, Godot.Core.Directory.open,
        Godot.Core.Directory.remove, Godot.Core.Directory.rename)
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

{-# NOINLINE bindDirectory_change_dir #-}

-- | Changes the currently opened directory to the one passed as an argument. The argument can be relative to the current directory (e.g. @newdir@ or @../newdir@), or an absolute path (e.g. @/tmp/newdir@ or @res://somedir/newdir@).
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_change_dir :: MethodBind
bindDirectory_change_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "change_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the currently opened directory to the one passed as an argument. The argument can be relative to the current directory (e.g. @newdir@ or @../newdir@), or an absolute path (e.g. @/tmp/newdir@ or @res://somedir/newdir@).
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
change_dir ::
             (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
change_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_change_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "change_dir" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.Directory.change_dir

{-# NOINLINE bindDirectory_copy #-}

-- | Copies the @from@ file to the @to@ destination. Both arguments should be paths to files, either relative or absolute. If the destination file exists and is not access-protected, it will be overwritten.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_copy :: MethodBind
bindDirectory_copy
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "copy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Copies the @from@ file to the @to@ destination. Both arguments should be paths to files, either relative or absolute. If the destination file exists and is not access-protected, it will be overwritten.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
copy ::
       (Directory :< cls, Object :< cls) =>
       cls -> GodotString -> GodotString -> IO Int
copy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_copy (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "copy" '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Directory.copy

{-# NOINLINE bindDirectory_current_is_dir #-}

-- | Returns whether the current item processed with the last @method get_next@ call is a directory (@.@ and @..@ are considered directories).
bindDirectory_current_is_dir :: MethodBind
bindDirectory_current_is_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "current_is_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the current item processed with the last @method get_next@ call is a directory (@.@ and @..@ are considered directories).
current_is_dir ::
                 (Directory :< cls, Object :< cls) => cls -> IO Bool
current_is_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_current_is_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "current_is_dir" '[] (IO Bool) where
        nodeMethod = Godot.Core.Directory.current_is_dir

{-# NOINLINE bindDirectory_dir_exists #-}

-- | Returns whether the target directory exists. The argument can be relative to the current directory, or an absolute path.
bindDirectory_dir_exists :: MethodBind
bindDirectory_dir_exists
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "dir_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the target directory exists. The argument can be relative to the current directory, or an absolute path.
dir_exists ::
             (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Bool
dir_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_dir_exists (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "dir_exists" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.Directory.dir_exists

{-# NOINLINE bindDirectory_file_exists #-}

-- | Returns whether the target file exists. The argument can be relative to the current directory, or an absolute path.
bindDirectory_file_exists :: MethodBind
bindDirectory_file_exists
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "file_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the target file exists. The argument can be relative to the current directory, or an absolute path.
file_exists ::
              (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Bool
file_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_file_exists (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "file_exists" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Directory.file_exists

{-# NOINLINE bindDirectory_get_current_dir #-}

-- | Returns the absolute path to the currently opened directory (e.g. @res://folder@ or @C:\tmp\folder@).
bindDirectory_get_current_dir :: MethodBind
bindDirectory_get_current_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_current_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute path to the currently opened directory (e.g. @res://folder@ or @C:\tmp\folder@).
get_current_dir ::
                  (Directory :< cls, Object :< cls) => cls -> IO GodotString
get_current_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_current_dir (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "get_current_dir" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Directory.get_current_dir

{-# NOINLINE bindDirectory_get_current_drive #-}

-- | Returns the currently opened directory's drive index. See @method get_drive@ to convert returned index to the name of the drive.
bindDirectory_get_current_drive :: MethodBind
bindDirectory_get_current_drive
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_current_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently opened directory's drive index. See @method get_drive@ to convert returned index to the name of the drive.
get_current_drive ::
                    (Directory :< cls, Object :< cls) => cls -> IO Int
get_current_drive cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_current_drive (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "get_current_drive" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Directory.get_current_drive

{-# NOINLINE bindDirectory_get_drive #-}

-- | On Windows, returns the name of the drive (partition) passed as an argument (e.g. @C:@). On other platforms, or if the requested drive does not exist, the method returns an empty String.
bindDirectory_get_drive :: MethodBind
bindDirectory_get_drive
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_drive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On Windows, returns the name of the drive (partition) passed as an argument (e.g. @C:@). On other platforms, or if the requested drive does not exist, the method returns an empty String.
get_drive ::
            (Directory :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_drive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_drive (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "get_drive" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.Directory.get_drive

{-# NOINLINE bindDirectory_get_drive_count #-}

-- | On Windows, returns the number of drives (partitions) mounted on the current filesystem. On other platforms, the method returns 0.
bindDirectory_get_drive_count :: MethodBind
bindDirectory_get_drive_count
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_drive_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On Windows, returns the number of drives (partitions) mounted on the current filesystem. On other platforms, the method returns 0.
get_drive_count ::
                  (Directory :< cls, Object :< cls) => cls -> IO Int
get_drive_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_drive_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "get_drive_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Directory.get_drive_count

{-# NOINLINE bindDirectory_get_next #-}

-- | Returns the next element (file or directory) in the current directory (including @.@ and @..@, unless @skip_navigational@ was given to @method list_dir_begin@).
--   				The name of the file or directory is returned (and not its full path). Once the stream has been fully processed, the method returns an empty String and closes the stream automatically (i.e. @method list_dir_end@ would not be mandatory in such a case).
bindDirectory_get_next :: MethodBind
bindDirectory_get_next
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next element (file or directory) in the current directory (including @.@ and @..@, unless @skip_navigational@ was given to @method list_dir_begin@).
--   				The name of the file or directory is returned (and not its full path). Once the stream has been fully processed, the method returns an empty String and closes the stream automatically (i.e. @method list_dir_end@ would not be mandatory in such a case).
get_next ::
           (Directory :< cls, Object :< cls) => cls -> IO GodotString
get_next cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_next (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "get_next" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Directory.get_next

{-# NOINLINE bindDirectory_get_space_left #-}

-- | On UNIX desktop systems, returns the available space on the current directory's disk. On other platforms, this information is not available and the method returns 0 or -1.
bindDirectory_get_space_left :: MethodBind
bindDirectory_get_space_left
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "get_space_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On UNIX desktop systems, returns the available space on the current directory's disk. On other platforms, this information is not available and the method returns 0 or -1.
get_space_left ::
                 (Directory :< cls, Object :< cls) => cls -> IO Int
get_space_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_get_space_left (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "get_space_left" '[] (IO Int) where
        nodeMethod = Godot.Core.Directory.get_space_left

{-# NOINLINE bindDirectory_list_dir_begin #-}

-- | Initializes the stream used to list all files and directories using the @method get_next@ function, closing the currently opened stream if needed. Once the stream has been processed, it should typically be closed with @method list_dir_end@.
--   				If @skip_navigational@ is @true@, @.@ and @..@ are filtered out.
--   				If @skip_hidden@ is @true@, hidden files are filtered out.
bindDirectory_list_dir_begin :: MethodBind
bindDirectory_list_dir_begin
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "list_dir_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the stream used to list all files and directories using the @method get_next@ function, closing the currently opened stream if needed. Once the stream has been processed, it should typically be closed with @method list_dir_end@.
--   				If @skip_navigational@ is @true@, @.@ and @..@ are filtered out.
--   				If @skip_hidden@ is @true@, hidden files are filtered out.
list_dir_begin ::
                 (Directory :< cls, Object :< cls) =>
                 cls -> Maybe Bool -> Maybe Bool -> IO Int
list_dir_begin cls arg1 arg2
  = withVariantArray
      [maybe (VariantBool False) toVariant arg1,
       maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_list_dir_begin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "list_dir_begin"
           '[Maybe Bool, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.Directory.list_dir_begin

{-# NOINLINE bindDirectory_list_dir_end #-}

-- | Closes the current stream opened with @method list_dir_begin@ (whether it has been fully processed with @method get_next@ does not matter).
bindDirectory_list_dir_end :: MethodBind
bindDirectory_list_dir_end
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "list_dir_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Closes the current stream opened with @method list_dir_begin@ (whether it has been fully processed with @method get_next@ does not matter).
list_dir_end :: (Directory :< cls, Object :< cls) => cls -> IO ()
list_dir_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_list_dir_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "list_dir_end" '[] (IO ()) where
        nodeMethod = Godot.Core.Directory.list_dir_end

{-# NOINLINE bindDirectory_make_dir #-}

-- | Creates a directory. The argument can be relative to the current directory, or an absolute path. The target directory should be placed in an already existing directory (to create the full path recursively, see @method make_dir_recursive@).
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_make_dir :: MethodBind
bindDirectory_make_dir
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "make_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a directory. The argument can be relative to the current directory, or an absolute path. The target directory should be placed in an already existing directory (to create the full path recursively, see @method make_dir_recursive@).
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
make_dir ::
           (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
make_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_make_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "make_dir" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.Directory.make_dir

{-# NOINLINE bindDirectory_make_dir_recursive #-}

-- | Creates a target directory and all necessary intermediate directories in its path, by calling @method make_dir@ recursively. The argument can be relative to the current directory, or an absolute path.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_make_dir_recursive :: MethodBind
bindDirectory_make_dir_recursive
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "make_dir_recursive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a target directory and all necessary intermediate directories in its path, by calling @method make_dir@ recursively. The argument can be relative to the current directory, or an absolute path.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
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

instance NodeMethod Directory "make_dir_recursive" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Directory.make_dir_recursive

{-# NOINLINE bindDirectory_open #-}

-- | Opens an existing directory of the filesystem. The @path@ argument can be within the project tree (@res://folder@), the user directory (@user://folder@) or an absolute path of the user filesystem (e.g. @/tmp/folder@ or @C:\tmp\folder@).
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_open :: MethodBind
bindDirectory_open
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens an existing directory of the filesystem. The @path@ argument can be within the project tree (@res://folder@), the user directory (@user://folder@) or an absolute path of the user filesystem (e.g. @/tmp/folder@ or @C:\tmp\folder@).
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
open ::
       (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
open cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_open (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "open" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.Directory.open

{-# NOINLINE bindDirectory_remove #-}

-- | Deletes the target file or an empty directory. The argument can be relative to the current directory, or an absolute path. If the target directory is not empty, the operation will fail.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_remove :: MethodBind
bindDirectory_remove
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the target file or an empty directory. The argument can be relative to the current directory, or an absolute path. If the target directory is not empty, the operation will fail.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
remove ::
         (Directory :< cls, Object :< cls) => cls -> GodotString -> IO Int
remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_remove (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "remove" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.Directory.remove

{-# NOINLINE bindDirectory_rename #-}

-- | Renames (move) the @from@ file or directory to the @to@ destination. Both arguments should be paths to files or directories, either relative or absolute. If the destination file or directory exists and is not access-protected, it will be overwritten.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindDirectory_rename :: MethodBind
bindDirectory_rename
  = unsafePerformIO $
      withCString "_Directory" $
        \ clsNamePtr ->
          withCString "rename" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames (move) the @from@ file or directory to the @to@ destination. Both arguments should be paths to files or directories, either relative or absolute. If the destination file or directory exists and is not access-protected, it will be overwritten.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
rename ::
         (Directory :< cls, Object :< cls) =>
         cls -> GodotString -> GodotString -> IO Int
rename cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectory_rename (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Directory "rename" '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.Directory.rename