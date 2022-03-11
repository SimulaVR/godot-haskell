{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourceLoader
       (Godot.Core.ResourceLoader.exists,
        Godot.Core.ResourceLoader.get_dependencies,
        Godot.Core.ResourceLoader.get_recognized_extensions_for_type,
        Godot.Core.ResourceLoader.has,
        Godot.Core.ResourceLoader.has_cached,
        Godot.Core.ResourceLoader.load,
        Godot.Core.ResourceLoader.load_interactive,
        Godot.Core.ResourceLoader.set_abort_on_missing_resources)
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

{-# NOINLINE bindResourceLoader_exists #-}

-- | Returns whether a recognized resource exists for the given @path@.
--   				An optional @type_hint@ can be used to further specify the @Resource@ type that should be handled by the @ResourceFormatLoader@.
bindResourceLoader_exists :: MethodBind
bindResourceLoader_exists
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a recognized resource exists for the given @path@.
--   				An optional @type_hint@ can be used to further specify the @Resource@ type that should be handled by the @ResourceFormatLoader@.
exists ::
         (ResourceLoader :< cls, Object :< cls) =>
         cls -> GodotString -> Maybe GodotString -> IO Bool
exists cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_exists (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceLoader "exists"
           '[GodotString, Maybe GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ResourceLoader.exists

{-# NOINLINE bindResourceLoader_get_dependencies #-}

-- | Returns the dependencies for the resource at the given @path@.
bindResourceLoader_get_dependencies :: MethodBind
bindResourceLoader_get_dependencies
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "get_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the dependencies for the resource at the given @path@.
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

instance NodeMethod ResourceLoader "get_dependencies"
           '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ResourceLoader.get_dependencies

{-# NOINLINE bindResourceLoader_get_recognized_extensions_for_type
             #-}

-- | Returns the list of recognized extensions for a resource type.
bindResourceLoader_get_recognized_extensions_for_type :: MethodBind
bindResourceLoader_get_recognized_extensions_for_type
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions_for_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of recognized extensions for a resource type.
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

instance NodeMethod ResourceLoader
           "get_recognized_extensions_for_type"
           '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod
          = Godot.Core.ResourceLoader.get_recognized_extensions_for_type

{-# NOINLINE bindResourceLoader_has #-}

-- | @i@Deprecated method.@/i@ Use @method has_cached@ or @method exists@ instead.
bindResourceLoader_has :: MethodBind
bindResourceLoader_has
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "has" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @i@Deprecated method.@/i@ Use @method has_cached@ or @method exists@ instead.
has ::
      (ResourceLoader :< cls, Object :< cls) =>
      cls -> GodotString -> IO Bool
has cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_has (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceLoader "has" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.ResourceLoader.has

{-# NOINLINE bindResourceLoader_has_cached #-}

-- | Returns whether a cached resource is available for the given @path@.
--   				Once a resource has been loaded by the engine, it is cached in memory for faster access, and future calls to the @method load@ or @method load_interactive@ methods will use the cached version. The cached resource can be overridden by using @method Resource.take_over_path@ on a new resource for that same path.
bindResourceLoader_has_cached :: MethodBind
bindResourceLoader_has_cached
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "has_cached" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a cached resource is available for the given @path@.
--   				Once a resource has been loaded by the engine, it is cached in memory for faster access, and future calls to the @method load@ or @method load_interactive@ methods will use the cached version. The cached resource can be overridden by using @method Resource.take_over_path@ on a new resource for that same path.
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

instance NodeMethod ResourceLoader "has_cached" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ResourceLoader.has_cached

{-# NOINLINE bindResourceLoader_load #-}

-- | Loads a resource at the given @path@, caching the result for further access.
--   				The registered @ResourceFormatLoader@s are queried sequentially to find the first one which can handle the file's extension, and then attempt loading. If loading fails, the remaining ResourceFormatLoaders are also attempted.
--   				An optional @type_hint@ can be used to further specify the @Resource@ type that should be handled by the @ResourceFormatLoader@. Anything that inherits from @Resource@ can be used as a type hint, for example @Image@.
--   				If @no_cache@ is @true@, the resource cache will be bypassed and the resource will be loaded anew. Otherwise, the cached resource will be returned if it exists.
--   				Returns an empty resource if no @ResourceFormatLoader@ could handle the file.
--   				GDScript has a simplified @method @GDScript.load@ built-in method which can be used in most situations, leaving the use of @ResourceLoader@ for more advanced scenarios.
bindResourceLoader_load :: MethodBind
bindResourceLoader_load
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a resource at the given @path@, caching the result for further access.
--   				The registered @ResourceFormatLoader@s are queried sequentially to find the first one which can handle the file's extension, and then attempt loading. If loading fails, the remaining ResourceFormatLoaders are also attempted.
--   				An optional @type_hint@ can be used to further specify the @Resource@ type that should be handled by the @ResourceFormatLoader@. Anything that inherits from @Resource@ can be used as a type hint, for example @Image@.
--   				If @no_cache@ is @true@, the resource cache will be bypassed and the resource will be loaded anew. Otherwise, the cached resource will be returned if it exists.
--   				Returns an empty resource if no @ResourceFormatLoader@ could handle the file.
--   				GDScript has a simplified @method @GDScript.load@ built-in method which can be used in most situations, leaving the use of @ResourceLoader@ for more advanced scenarios.
load ::
       (ResourceLoader :< cls, Object :< cls) =>
       cls ->
         GodotString -> Maybe GodotString -> Maybe Bool -> IO Resource
load cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceLoader "load"
           '[GodotString, Maybe GodotString, Maybe Bool]
           (IO Resource)
         where
        nodeMethod = Godot.Core.ResourceLoader.load

{-# NOINLINE bindResourceLoader_load_interactive #-}

-- | Starts loading a resource interactively. The returned @ResourceInteractiveLoader@ object allows to load with high granularity, calling its @method ResourceInteractiveLoader.poll@ method successively to load chunks.
--   				An optional @type_hint@ can be used to further specify the @Resource@ type that should be handled by the @ResourceFormatLoader@. Anything that inherits from @Resource@ can be used as a type hint, for example @Image@.
bindResourceLoader_load_interactive :: MethodBind
bindResourceLoader_load_interactive
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "load_interactive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts loading a resource interactively. The returned @ResourceInteractiveLoader@ object allows to load with high granularity, calling its @method ResourceInteractiveLoader.poll@ method successively to load chunks.
--   				An optional @type_hint@ can be used to further specify the @Resource@ type that should be handled by the @ResourceFormatLoader@. Anything that inherits from @Resource@ can be used as a type hint, for example @Image@.
load_interactive ::
                   (ResourceLoader :< cls, Object :< cls) =>
                   cls ->
                     GodotString -> Maybe GodotString -> IO ResourceInteractiveLoader
load_interactive cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceLoader_load_interactive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceLoader "load_interactive"
           '[GodotString, Maybe GodotString]
           (IO ResourceInteractiveLoader)
         where
        nodeMethod = Godot.Core.ResourceLoader.load_interactive

{-# NOINLINE bindResourceLoader_set_abort_on_missing_resources #-}

-- | Changes the behavior on missing sub-resources. The default behavior is to abort loading.
bindResourceLoader_set_abort_on_missing_resources :: MethodBind
bindResourceLoader_set_abort_on_missing_resources
  = unsafePerformIO $
      withCString "_ResourceLoader" $
        \ clsNamePtr ->
          withCString "set_abort_on_missing_resources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the behavior on missing sub-resources. The default behavior is to abort loading.
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

instance NodeMethod ResourceLoader "set_abort_on_missing_resources"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.ResourceLoader.set_abort_on_missing_resources