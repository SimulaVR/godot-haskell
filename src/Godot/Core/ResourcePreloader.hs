{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourcePreloader
       (Godot.Core.ResourcePreloader._get_resources,
        Godot.Core.ResourcePreloader._set_resources,
        Godot.Core.ResourcePreloader.add_resource,
        Godot.Core.ResourcePreloader.get_resource,
        Godot.Core.ResourcePreloader.get_resource_list,
        Godot.Core.ResourcePreloader.has_resource,
        Godot.Core.ResourcePreloader.remove_resource,
        Godot.Core.ResourcePreloader.rename_resource)
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

instance NodeProperty ResourcePreloader "resources" Array 'False
         where
        nodeProperty
          = (_get_resources, wrapDroppingSetter _set_resources, Nothing)

{-# NOINLINE bindResourcePreloader__get_resources #-}

bindResourcePreloader__get_resources :: MethodBind
bindResourcePreloader__get_resources
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "_get_resources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_resources ::
                 (ResourcePreloader :< cls, Object :< cls) => cls -> IO Array
_get_resources cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader__get_resources
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "_get_resources" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.ResourcePreloader._get_resources

{-# NOINLINE bindResourcePreloader__set_resources #-}

bindResourcePreloader__set_resources :: MethodBind
bindResourcePreloader__set_resources
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "_set_resources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_resources ::
                 (ResourcePreloader :< cls, Object :< cls) => cls -> Array -> IO ()
_set_resources cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader__set_resources
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "_set_resources" '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.ResourcePreloader._set_resources

{-# NOINLINE bindResourcePreloader_add_resource #-}

-- | Adds a resource to the preloader with the given @name@. If a resource with the given @name@ already exists, the new resource will be renamed to "@name@ N" where N is an incrementing number starting from 2.
bindResourcePreloader_add_resource :: MethodBind
bindResourcePreloader_add_resource
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "add_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a resource to the preloader with the given @name@. If a resource with the given @name@ already exists, the new resource will be renamed to "@name@ N" where N is an incrementing number starting from 2.
add_resource ::
               (ResourcePreloader :< cls, Object :< cls) =>
               cls -> GodotString -> Resource -> IO ()
add_resource cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader_add_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "add_resource"
           '[GodotString, Resource]
           (IO ())
         where
        nodeMethod = Godot.Core.ResourcePreloader.add_resource

{-# NOINLINE bindResourcePreloader_get_resource #-}

-- | Returns the resource associated to @name@.
bindResourcePreloader_get_resource :: MethodBind
bindResourcePreloader_get_resource
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "get_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the resource associated to @name@.
get_resource ::
               (ResourcePreloader :< cls, Object :< cls) =>
               cls -> GodotString -> IO Resource
get_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader_get_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "get_resource" '[GodotString]
           (IO Resource)
         where
        nodeMethod = Godot.Core.ResourcePreloader.get_resource

{-# NOINLINE bindResourcePreloader_get_resource_list #-}

-- | Returns the list of resources inside the preloader.
bindResourcePreloader_get_resource_list :: MethodBind
bindResourcePreloader_get_resource_list
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "get_resource_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of resources inside the preloader.
get_resource_list ::
                    (ResourcePreloader :< cls, Object :< cls) =>
                    cls -> IO PoolStringArray
get_resource_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader_get_resource_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "get_resource_list" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ResourcePreloader.get_resource_list

{-# NOINLINE bindResourcePreloader_has_resource #-}

-- | Returns @true@ if the preloader contains a resource associated to @name@.
bindResourcePreloader_has_resource :: MethodBind
bindResourcePreloader_has_resource
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "has_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the preloader contains a resource associated to @name@.
has_resource ::
               (ResourcePreloader :< cls, Object :< cls) =>
               cls -> GodotString -> IO Bool
has_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader_has_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "has_resource" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ResourcePreloader.has_resource

{-# NOINLINE bindResourcePreloader_remove_resource #-}

-- | Removes the resource associated to @name@ from the preloader.
bindResourcePreloader_remove_resource :: MethodBind
bindResourcePreloader_remove_resource
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "remove_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the resource associated to @name@ from the preloader.
remove_resource ::
                  (ResourcePreloader :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
remove_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader_remove_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "remove_resource"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ResourcePreloader.remove_resource

{-# NOINLINE bindResourcePreloader_rename_resource #-}

-- | Renames a resource inside the preloader from @name@ to @newname@.
bindResourcePreloader_rename_resource :: MethodBind
bindResourcePreloader_rename_resource
  = unsafePerformIO $
      withCString "ResourcePreloader" $
        \ clsNamePtr ->
          withCString "rename_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames a resource inside the preloader from @name@ to @newname@.
rename_resource ::
                  (ResourcePreloader :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> IO ()
rename_resource cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourcePreloader_rename_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourcePreloader "rename_resource"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ResourcePreloader.rename_resource