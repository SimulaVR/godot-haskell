{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ResourceFormatLoader
       (Godot.Core.ResourceFormatLoader.load,
        Godot.Core.ResourceFormatLoader.get_recognized_extensions,
        Godot.Core.ResourceFormatLoader.handles_type,
        Godot.Core.ResourceFormatLoader.get_resource_type,
        Godot.Core.ResourceFormatLoader.get_dependencies,
        Godot.Core.ResourceFormatLoader.rename_dependencies)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindResourceFormatLoader_load #-}

-- | Loads a resource when the engine finds this loader to be compatible. If the loaded resource is the result of an import, [code]original_path[/code] will target the source file. Returns a resource object if succeeded, or an [code]ERR_*[/code] constant listed in [@GlobalScope] if it failed.
bindResourceFormatLoader_load :: MethodBind
bindResourceFormatLoader_load
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a resource when the engine finds this loader to be compatible. If the loaded resource is the result of an import, [code]original_path[/code] will target the source file. Returns a resource object if succeeded, or an [code]ERR_*[/code] constant listed in [@GlobalScope] if it failed.
load ::
       (ResourceFormatLoader :< cls, Object :< cls) =>
       cls -> GodotString -> GodotString -> IO GodotVariant
load cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_load (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceFormatLoader_get_recognized_extensions #-}

-- | Gets the list of extensions for files this loader is able to read.
bindResourceFormatLoader_get_recognized_extensions :: MethodBind
bindResourceFormatLoader_get_recognized_extensions
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the list of extensions for files this loader is able to read.
get_recognized_extensions ::
                            (ResourceFormatLoader :< cls, Object :< cls) =>
                            cls -> IO PoolStringArray
get_recognized_extensions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceFormatLoader_get_recognized_extensions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceFormatLoader_handles_type #-}

-- | Tells which resource class this loader can load. Note that custom resource types defined by scripts aren't known by the [ClassDB], so you might just handle [code]"Resource"[/code] for them.
bindResourceFormatLoader_handles_type :: MethodBind
bindResourceFormatLoader_handles_type
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "handles_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tells which resource class this loader can load. Note that custom resource types defined by scripts aren't known by the [ClassDB], so you might just handle [code]"Resource"[/code] for them.
handles_type ::
               (ResourceFormatLoader :< cls, Object :< cls) =>
               cls -> GodotString -> IO Bool
handles_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_handles_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceFormatLoader_get_resource_type #-}

-- | Gets the class name of the resource associated with the given path. If the loader cannot handle it, it should return [code]""[/code]. Note that custom resource types defined by scripts aren't known by the [ClassDB], so you might just return [code]"Resource"[/code] for them.
bindResourceFormatLoader_get_resource_type :: MethodBind
bindResourceFormatLoader_get_resource_type
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "get_resource_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the class name of the resource associated with the given path. If the loader cannot handle it, it should return [code]""[/code]. Note that custom resource types defined by scripts aren't known by the [ClassDB], so you might just return [code]"Resource"[/code] for them.
get_resource_type ::
                    (ResourceFormatLoader :< cls, Object :< cls) =>
                    cls -> GodotString -> IO GodotString
get_resource_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_get_resource_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceFormatLoader_get_dependencies #-}

-- | If implemented, gets the dependencies of a given resource. If [code]add_types[/code] is [code]true[/code], paths should be appended [code]::TypeName[/code], where [code]TypeName[/code] is the class name of the dependency. Note that custom resource types defined by scripts aren't known by the [ClassDB], so you might just return [code]Resource[/code] for them.
bindResourceFormatLoader_get_dependencies :: MethodBind
bindResourceFormatLoader_get_dependencies
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "get_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If implemented, gets the dependencies of a given resource. If [code]add_types[/code] is [code]true[/code], paths should be appended [code]::TypeName[/code], where [code]TypeName[/code] is the class name of the dependency. Note that custom resource types defined by scripts aren't known by the [ClassDB], so you might just return [code]Resource[/code] for them.
get_dependencies ::
                   (ResourceFormatLoader :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO ()
get_dependencies cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_get_dependencies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceFormatLoader_rename_dependencies #-}

-- | If implemented, renames dependencies within the given resource and saves it. [code]renames[/code] is a dictionary [code]{ String => String }[/code] mapping old dependency paths to new paths. Returns [code]OK[/code] on success, or an [code]ERR_*[/code] constant listed in [@GlobalScope] in case of failure.
bindResourceFormatLoader_rename_dependencies :: MethodBind
bindResourceFormatLoader_rename_dependencies
  = unsafePerformIO $
      withCString "ResourceFormatLoader" $
        \ clsNamePtr ->
          withCString "rename_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If implemented, renames dependencies within the given resource and saves it. [code]renames[/code] is a dictionary [code]{ String => String }[/code] mapping old dependency paths to new paths. Returns [code]OK[/code] on success, or an [code]ERR_*[/code] constant listed in [@GlobalScope] in case of failure.
rename_dependencies ::
                      (ResourceFormatLoader :< cls, Object :< cls) =>
                      cls -> GodotString -> GodotString -> IO Int
rename_dependencies cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatLoader_rename_dependencies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)