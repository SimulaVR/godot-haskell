{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ResourceLoader
       (Godot.Core.ResourceLoader.load_interactive,
        Godot.Core.ResourceLoader.load,
        Godot.Core.ResourceLoader.get_recognized_extensions_for_type,
        Godot.Core.ResourceLoader.set_abort_on_missing_resources,
        Godot.Core.ResourceLoader.get_dependencies,
        Godot.Core.ResourceLoader.has_cached,
        Godot.Core.ResourceLoader.exists, Godot.Core.ResourceLoader.has)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindResourceLoader_load_interactive #-}

-- | Load a resource interactively, the returned object allows to load with high granularity.
bindResourceLoader_load_interactive :: MethodBind
bindResourceLoader_load_interactive
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "load_interactive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Load a resource interactively, the returned object allows to load with high granularity.
load_interactive ::
                   (ResourceLoader :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO ResourceInteractiveLoader
load_interactive cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_load_interactive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_load #-}

bindResourceLoader_load :: MethodBind
bindResourceLoader_load
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

load ::
       (ResourceLoader :< cls, Object :< cls) =>
       cls -> GodotString -> GodotString -> Bool -> IO Resource
load cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_get_recognized_extensions_for_type
             #-}

-- | Return the list of recognized extensions for a resource type.
bindResourceLoader_get_recognized_extensions_for_type :: MethodBind
bindResourceLoader_get_recognized_extensions_for_type
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions_for_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the list of recognized extensions for a resource type.
get_recognized_extensions_for_type ::
                                     (ResourceLoader :< cls, Object :< cls) =>
                                     cls -> GodotString -> IO PoolStringArray
get_recognized_extensions_for_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceLoader_get_recognized_extensions_for_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_set_abort_on_missing_resources #-}

-- | Change the behavior on missing sub-resources. Default is to abort load.
bindResourceLoader_set_abort_on_missing_resources :: MethodBind
bindResourceLoader_set_abort_on_missing_resources
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "set_abort_on_missing_resources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Change the behavior on missing sub-resources. Default is to abort load.
set_abort_on_missing_resources ::
                                 (ResourceLoader :< cls, Object :< cls) => cls -> Bool -> IO ()
set_abort_on_missing_resources cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceLoader_set_abort_on_missing_resources
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_get_dependencies #-}

bindResourceLoader_get_dependencies :: MethodBind
bindResourceLoader_get_dependencies
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "get_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_dependencies ::
                   (ResourceLoader :< cls, Object :< cls) =>
                   cls -> GodotString -> IO PoolStringArray
get_dependencies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_get_dependencies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_has_cached #-}

bindResourceLoader_has_cached :: MethodBind
bindResourceLoader_has_cached
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "has_cached" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_cached ::
             (ResourceLoader :< cls, Object :< cls) =>
             cls -> GodotString -> IO Bool
has_cached cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_has_cached (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_exists #-}

bindResourceLoader_exists :: MethodBind
bindResourceLoader_exists
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

exists ::
         (ResourceLoader :< cls, Object :< cls) =>
         cls -> GodotString -> GodotString -> IO Bool
exists cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_exists (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceLoader_has #-}

bindResourceLoader_has :: MethodBind
bindResourceLoader_has
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "has" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has ::
      (ResourceLoader :< cls, Object :< cls) =>
      cls -> GodotString -> IO Bool
has cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_has (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)