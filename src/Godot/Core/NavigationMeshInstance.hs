{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationMeshInstance
       (Godot.Core.NavigationMeshInstance.get_navigation_mesh,
        Godot.Core.NavigationMeshInstance.is_enabled,
        Godot.Core.NavigationMeshInstance.set_enabled,
        Godot.Core.NavigationMeshInstance.set_navigation_mesh)
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
import Godot.Core.Spatial()

instance NodeProperty NavigationMeshInstance "enabled" Bool 'False
         where
        nodeProperty
          = (is_enabled, wrapDroppingSetter set_enabled, Nothing)

instance NodeProperty NavigationMeshInstance "navmesh"
           NavigationMesh
           'False
         where
        nodeProperty
          = (get_navigation_mesh, wrapDroppingSetter set_navigation_mesh,
             Nothing)

{-# NOINLINE bindNavigationMeshInstance_get_navigation_mesh #-}

-- | The @NavigationMesh@ resource for the instance.
bindNavigationMeshInstance_get_navigation_mesh :: MethodBind
bindNavigationMeshInstance_get_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NavigationMesh@ resource for the instance.
get_navigation_mesh ::
                      (NavigationMeshInstance :< cls, Object :< cls) =>
                      cls -> IO NavigationMesh
get_navigation_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_get_navigation_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMeshInstance "get_navigation_mesh"
           '[]
           (IO NavigationMesh)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.get_navigation_mesh

{-# NOINLINE bindNavigationMeshInstance_is_enabled #-}

-- | If @true@, the navigation mesh will be used by @Navigation@.
bindNavigationMeshInstance_is_enabled :: MethodBind
bindNavigationMeshInstance_is_enabled
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the navigation mesh will be used by @Navigation@.
is_enabled ::
             (NavigationMeshInstance :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_is_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMeshInstance "is_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.is_enabled

{-# NOINLINE bindNavigationMeshInstance_set_enabled #-}

-- | If @true@, the navigation mesh will be used by @Navigation@.
bindNavigationMeshInstance_set_enabled :: MethodBind
bindNavigationMeshInstance_set_enabled
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the navigation mesh will be used by @Navigation@.
set_enabled ::
              (NavigationMeshInstance :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMeshInstance_set_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMeshInstance "set_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.set_enabled

{-# NOINLINE bindNavigationMeshInstance_set_navigation_mesh #-}

-- | The @NavigationMesh@ resource for the instance.
bindNavigationMeshInstance_set_navigation_mesh :: MethodBind
bindNavigationMeshInstance_set_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NavigationMesh@ resource for the instance.
set_navigation_mesh ::
                      (NavigationMeshInstance :< cls, Object :< cls) =>
                      cls -> NavigationMesh -> IO ()
set_navigation_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMeshInstance_set_navigation_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMeshInstance "set_navigation_mesh"
           '[NavigationMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMeshInstance.set_navigation_mesh