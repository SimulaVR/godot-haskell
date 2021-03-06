{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Resource
       (Godot.Core.Resource.sig_changed,
        Godot.Core.Resource._setup_local_to_scene,
        Godot.Core.Resource.duplicate, Godot.Core.Resource.get_local_scene,
        Godot.Core.Resource.get_name, Godot.Core.Resource.get_path,
        Godot.Core.Resource.get_rid, Godot.Core.Resource.is_local_to_scene,
        Godot.Core.Resource.set_local_to_scene,
        Godot.Core.Resource.set_name, Godot.Core.Resource.set_path,
        Godot.Core.Resource.setup_local_to_scene,
        Godot.Core.Resource.take_over_path)
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

-- | Emitted whenever the resource changes.
sig_changed :: Godot.Internal.Dispatch.Signal Resource
sig_changed = Godot.Internal.Dispatch.Signal "changed"

instance NodeSignal Resource "changed" '[]

instance NodeProperty Resource "resource_local_to_scene" Bool
           'False
         where
        nodeProperty
          = (is_local_to_scene, wrapDroppingSetter set_local_to_scene,
             Nothing)

instance NodeProperty Resource "resource_name" GodotString 'False
         where
        nodeProperty = (get_name, wrapDroppingSetter set_name, Nothing)

instance NodeProperty Resource "resource_path" GodotString 'False
         where
        nodeProperty = (get_path, wrapDroppingSetter set_path, Nothing)

{-# NOINLINE bindResource__setup_local_to_scene #-}

-- | Virtual function which can be overridden to customize the behavior value of @method setup_local_to_scene@.
bindResource__setup_local_to_scene :: MethodBind
bindResource__setup_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "_setup_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual function which can be overridden to customize the behavior value of @method setup_local_to_scene@.
_setup_local_to_scene ::
                        (Resource :< cls, Object :< cls) => cls -> IO ()
_setup_local_to_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource__setup_local_to_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "_setup_local_to_scene" '[] (IO ())
         where
        nodeMethod = Godot.Core.Resource._setup_local_to_scene

{-# NOINLINE bindResource_duplicate #-}

-- | Duplicates the resource, returning a new resource. By default, sub-resources are shared between resource copies for efficiency. This can be changed by passing @true@ to the @subresources@ argument which will copy the subresources.
--   				__Note:__ If @subresources@ is @true@, this method will only perform a shallow copy. Nested resources within subresources will not be duplicated and will still be shared.
bindResource_duplicate :: MethodBind
bindResource_duplicate
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "duplicate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duplicates the resource, returning a new resource. By default, sub-resources are shared between resource copies for efficiency. This can be changed by passing @true@ to the @subresources@ argument which will copy the subresources.
--   				__Note:__ If @subresources@ is @true@, this method will only perform a shallow copy. Nested resources within subresources will not be duplicated and will still be shared.
duplicate ::
            (Resource :< cls, Object :< cls) =>
            cls -> Maybe Bool -> IO Resource
duplicate cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_duplicate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "duplicate" '[Maybe Bool]
           (IO Resource)
         where
        nodeMethod = Godot.Core.Resource.duplicate

{-# NOINLINE bindResource_get_local_scene #-}

-- | If @resource_local_to_scene@ is enabled and the resource was loaded from a @PackedScene@ instantiation, returns the local scene where this resource's unique copy is in use. Otherwise, returns @null@.
bindResource_get_local_scene :: MethodBind
bindResource_get_local_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_local_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @resource_local_to_scene@ is enabled and the resource was loaded from a @PackedScene@ instantiation, returns the local scene where this resource's unique copy is in use. Otherwise, returns @null@.
get_local_scene ::
                  (Resource :< cls, Object :< cls) => cls -> IO Node
get_local_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_local_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "get_local_scene" '[] (IO Node) where
        nodeMethod = Godot.Core.Resource.get_local_scene

{-# NOINLINE bindResource_get_name #-}

-- | The name of the resource. This is an optional identifier.
bindResource_get_name :: MethodBind
bindResource_get_name
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the resource. This is an optional identifier.
get_name ::
           (Resource :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "get_name" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Resource.get_name

{-# NOINLINE bindResource_get_path #-}

-- | The path to the resource. In case it has its own file, it will return its filepath. If it's tied to the scene, it will return the scene's path, followed by the resource's index.
bindResource_get_path :: MethodBind
bindResource_get_path
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the resource. In case it has its own file, it will return its filepath. If it's tied to the scene, it will return the scene's path, followed by the resource's index.
get_path ::
           (Resource :< cls, Object :< cls) => cls -> IO GodotString
get_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "get_path" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Resource.get_path

{-# NOINLINE bindResource_get_rid #-}

-- | Returns the RID of the resource (or an empty RID). Many resources (such as @Texture@, @Mesh@, etc) are high-level abstractions of resources stored in a server, so this function will return the original RID.
bindResource_get_rid :: MethodBind
bindResource_get_rid
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the RID of the resource (or an empty RID). Many resources (such as @Texture@, @Mesh@, etc) are high-level abstractions of resources stored in a server, so this function will return the original RID.
get_rid :: (Resource :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_get_rid (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Resource.get_rid

{-# NOINLINE bindResource_is_local_to_scene #-}

-- | If @true@, the resource will be made unique in each instance of its local scene. It can thus be modified in a scene instance without impacting other instances of that same scene.
bindResource_is_local_to_scene :: MethodBind
bindResource_is_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "is_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the resource will be made unique in each instance of its local scene. It can thus be modified in a scene instance without impacting other instances of that same scene.
is_local_to_scene ::
                    (Resource :< cls, Object :< cls) => cls -> IO Bool
is_local_to_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_is_local_to_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "is_local_to_scene" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Resource.is_local_to_scene

{-# NOINLINE bindResource_set_local_to_scene #-}

-- | If @true@, the resource will be made unique in each instance of its local scene. It can thus be modified in a scene instance without impacting other instances of that same scene.
bindResource_set_local_to_scene :: MethodBind
bindResource_set_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "set_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the resource will be made unique in each instance of its local scene. It can thus be modified in a scene instance without impacting other instances of that same scene.
set_local_to_scene ::
                     (Resource :< cls, Object :< cls) => cls -> Bool -> IO ()
set_local_to_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_set_local_to_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "set_local_to_scene" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Resource.set_local_to_scene

{-# NOINLINE bindResource_set_name #-}

-- | The name of the resource. This is an optional identifier.
bindResource_set_name :: MethodBind
bindResource_set_name
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the resource. This is an optional identifier.
set_name ::
           (Resource :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_set_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "set_name" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Resource.set_name

{-# NOINLINE bindResource_set_path #-}

-- | The path to the resource. In case it has its own file, it will return its filepath. If it's tied to the scene, it will return the scene's path, followed by the resource's index.
bindResource_set_path :: MethodBind
bindResource_set_path
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "set_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the resource. In case it has its own file, it will return its filepath. If it's tied to the scene, it will return the scene's path, followed by the resource's index.
set_path ::
           (Resource :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_set_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "set_path" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Resource.set_path

{-# NOINLINE bindResource_setup_local_to_scene #-}

-- | This method is called when a resource with @resource_local_to_scene@ enabled is loaded from a @PackedScene@ instantiation. Its behavior can be customized by overriding @method _setup_local_to_scene@ from script.
--   				For most resources, this method performs no base logic. @ViewportTexture@ performs custom logic to properly set the proxy texture and flags in the local viewport.
bindResource_setup_local_to_scene :: MethodBind
bindResource_setup_local_to_scene
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "setup_local_to_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method is called when a resource with @resource_local_to_scene@ enabled is loaded from a @PackedScene@ instantiation. Its behavior can be customized by overriding @method _setup_local_to_scene@ from script.
--   				For most resources, this method performs no base logic. @ViewportTexture@ performs custom logic to properly set the proxy texture and flags in the local viewport.
setup_local_to_scene ::
                       (Resource :< cls, Object :< cls) => cls -> IO ()
setup_local_to_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_setup_local_to_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "setup_local_to_scene" '[] (IO ())
         where
        nodeMethod = Godot.Core.Resource.setup_local_to_scene

{-# NOINLINE bindResource_take_over_path #-}

-- | Sets the path of the resource, potentially overriding an existing cache entry for this path. This differs from setting @resource_path@, as the latter would error out if another resource was already cached for the given path.
bindResource_take_over_path :: MethodBind
bindResource_take_over_path
  = unsafePerformIO $
      withCString "Resource" $
        \ clsNamePtr ->
          withCString "take_over_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the path of the resource, potentially overriding an existing cache entry for this path. This differs from setting @resource_path@, as the latter would error out if another resource was already cached for the given path.
take_over_path ::
                 (Resource :< cls, Object :< cls) => cls -> GodotString -> IO ()
take_over_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResource_take_over_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Resource "take_over_path" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Resource.take_over_path