{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorFileSystem
       (Godot.Tools.EditorFileSystem.sig_filesystem_changed,
        Godot.Tools.EditorFileSystem.sig_resources_reimported,
        Godot.Tools.EditorFileSystem.sig_resources_reload,
        Godot.Tools.EditorFileSystem.sig_sources_changed,
        Godot.Tools.EditorFileSystem.get_file_type,
        Godot.Tools.EditorFileSystem.get_filesystem,
        Godot.Tools.EditorFileSystem.get_filesystem_path,
        Godot.Tools.EditorFileSystem.get_scanning_progress,
        Godot.Tools.EditorFileSystem.is_scanning,
        Godot.Tools.EditorFileSystem.scan,
        Godot.Tools.EditorFileSystem.scan_sources,
        Godot.Tools.EditorFileSystem.update_file,
        Godot.Tools.EditorFileSystem.update_script_classes)
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
import Godot.Core.Node()

-- | Emitted if the filesystem changed.
sig_filesystem_changed ::
                       Godot.Internal.Dispatch.Signal EditorFileSystem
sig_filesystem_changed
  = Godot.Internal.Dispatch.Signal "filesystem_changed"

instance NodeSignal EditorFileSystem "filesystem_changed" '[]

-- | Emitted if a resource is reimported.
sig_resources_reimported ::
                         Godot.Internal.Dispatch.Signal EditorFileSystem
sig_resources_reimported
  = Godot.Internal.Dispatch.Signal "resources_reimported"

instance NodeSignal EditorFileSystem "resources_reimported"
           '[PoolStringArray]

-- | Emitted if at least one resource is reloaded when the filesystem is scanned.
sig_resources_reload ::
                     Godot.Internal.Dispatch.Signal EditorFileSystem
sig_resources_reload
  = Godot.Internal.Dispatch.Signal "resources_reload"

instance NodeSignal EditorFileSystem "resources_reload"
           '[PoolStringArray]

-- | Emitted if the source of any imported file changed.
sig_sources_changed ::
                    Godot.Internal.Dispatch.Signal EditorFileSystem
sig_sources_changed
  = Godot.Internal.Dispatch.Signal "sources_changed"

instance NodeSignal EditorFileSystem "sources_changed" '[Bool]

{-# NOINLINE bindEditorFileSystem_get_file_type #-}

-- | Returns the resource type of the file, given the full path. This returns a string such as @"Resource"@ or @"GDScript"@, @i@not@/i@ a file extension such as @".gd"@.
bindEditorFileSystem_get_file_type :: MethodBind
bindEditorFileSystem_get_file_type
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "get_file_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the resource type of the file, given the full path. This returns a string such as @"Resource"@ or @"GDScript"@, @i@not@/i@ a file extension such as @".gd"@.
get_file_type ::
                (EditorFileSystem :< cls, Object :< cls) =>
                cls -> GodotString -> IO GodotString
get_file_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_get_file_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "get_file_type" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorFileSystem.get_file_type

{-# NOINLINE bindEditorFileSystem_get_filesystem #-}

-- | Gets the root directory object.
bindEditorFileSystem_get_filesystem :: MethodBind
bindEditorFileSystem_get_filesystem
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "get_filesystem" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the root directory object.
get_filesystem ::
                 (EditorFileSystem :< cls, Object :< cls) =>
                 cls -> IO EditorFileSystemDirectory
get_filesystem cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_get_filesystem
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "get_filesystem" '[]
           (IO EditorFileSystemDirectory)
         where
        nodeMethod = Godot.Tools.EditorFileSystem.get_filesystem

{-# NOINLINE bindEditorFileSystem_get_filesystem_path #-}

-- | Returns a view into the filesystem at @path@.
bindEditorFileSystem_get_filesystem_path :: MethodBind
bindEditorFileSystem_get_filesystem_path
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "get_filesystem_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a view into the filesystem at @path@.
get_filesystem_path ::
                      (EditorFileSystem :< cls, Object :< cls) =>
                      cls -> GodotString -> IO EditorFileSystemDirectory
get_filesystem_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_get_filesystem_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "get_filesystem_path"
           '[GodotString]
           (IO EditorFileSystemDirectory)
         where
        nodeMethod = Godot.Tools.EditorFileSystem.get_filesystem_path

{-# NOINLINE bindEditorFileSystem_get_scanning_progress #-}

-- | Returns the scan progress for 0 to 1 if the FS is being scanned.
bindEditorFileSystem_get_scanning_progress :: MethodBind
bindEditorFileSystem_get_scanning_progress
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "get_scanning_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the scan progress for 0 to 1 if the FS is being scanned.
get_scanning_progress ::
                        (EditorFileSystem :< cls, Object :< cls) => cls -> IO Float
get_scanning_progress cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_get_scanning_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "get_scanning_progress" '[]
           (IO Float)
         where
        nodeMethod = Godot.Tools.EditorFileSystem.get_scanning_progress

{-# NOINLINE bindEditorFileSystem_is_scanning #-}

-- | Returns @true@ of the filesystem is being scanned.
bindEditorFileSystem_is_scanning :: MethodBind
bindEditorFileSystem_is_scanning
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "is_scanning" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ of the filesystem is being scanned.
is_scanning ::
              (EditorFileSystem :< cls, Object :< cls) => cls -> IO Bool
is_scanning cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_is_scanning
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "is_scanning" '[] (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorFileSystem.is_scanning

{-# NOINLINE bindEditorFileSystem_scan #-}

-- | Scan the filesystem for changes.
bindEditorFileSystem_scan :: MethodBind
bindEditorFileSystem_scan
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "scan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scan the filesystem for changes.
scan :: (EditorFileSystem :< cls, Object :< cls) => cls -> IO ()
scan cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_scan (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "scan" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorFileSystem.scan

{-# NOINLINE bindEditorFileSystem_scan_sources #-}

-- | Check if the source of any imported resource changed.
bindEditorFileSystem_scan_sources :: MethodBind
bindEditorFileSystem_scan_sources
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "scan_sources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Check if the source of any imported resource changed.
scan_sources ::
               (EditorFileSystem :< cls, Object :< cls) => cls -> IO ()
scan_sources cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_scan_sources
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "scan_sources" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileSystem.scan_sources

{-# NOINLINE bindEditorFileSystem_update_file #-}

-- | Update a file information. Call this if an external program (not Godot) modified the file.
bindEditorFileSystem_update_file :: MethodBind
bindEditorFileSystem_update_file
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "update_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Update a file information. Call this if an external program (not Godot) modified the file.
update_file ::
              (EditorFileSystem :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
update_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_update_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "update_file" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileSystem.update_file

{-# NOINLINE bindEditorFileSystem_update_script_classes #-}

-- | Scans the script files and updates the list of custom class names.
bindEditorFileSystem_update_script_classes :: MethodBind
bindEditorFileSystem_update_script_classes
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "update_script_classes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scans the script files and updates the list of custom class names.
update_script_classes ::
                        (EditorFileSystem :< cls, Object :< cls) => cls -> IO ()
update_script_classes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorFileSystem_update_script_classes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorFileSystem "update_script_classes" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorFileSystem.update_script_classes