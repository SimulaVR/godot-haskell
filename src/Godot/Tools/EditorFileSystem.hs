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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted if the filesystem changed.
sig_filesystem_changed ::
                       Godot.Internal.Dispatch.Signal EditorFileSystem
sig_filesystem_changed
  = Godot.Internal.Dispatch.Signal "filesystem_changed"

instance NodeSignal EditorFileSystem "filesystem_changed" '[]

-- | Remitted if a resource is reimported.
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

-- | Gets the type of the file, given the full path.
bindEditorFileSystem_get_file_type :: MethodBind
bindEditorFileSystem_get_file_type
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "get_file_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the type of the file, given the full path.
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

{-# NOINLINE bindEditorFileSystem_get_filesystem_path #-}

-- | Returns a view into the filesystem at [code]path[/code].
bindEditorFileSystem_get_filesystem_path :: MethodBind
bindEditorFileSystem_get_filesystem_path
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "get_filesystem_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a view into the filesystem at [code]path[/code].
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

{-# NOINLINE bindEditorFileSystem_is_scanning #-}

-- | Returns [code]true[/code] of the filesystem is being scanned.
bindEditorFileSystem_is_scanning :: MethodBind
bindEditorFileSystem_is_scanning
  = unsafePerformIO $
      withCString "EditorFileSystem" $
        \ clsNamePtr ->
          withCString "is_scanning" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] of the filesystem is being scanned.
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