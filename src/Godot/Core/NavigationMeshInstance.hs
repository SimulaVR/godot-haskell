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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindNavigationMeshInstance_get_navigation_mesh #-}

bindNavigationMeshInstance_get_navigation_mesh :: MethodBind
bindNavigationMeshInstance_get_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindNavigationMeshInstance_is_enabled #-}

bindNavigationMeshInstance_is_enabled :: MethodBind
bindNavigationMeshInstance_is_enabled
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindNavigationMeshInstance_set_enabled #-}

bindNavigationMeshInstance_set_enabled :: MethodBind
bindNavigationMeshInstance_set_enabled
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindNavigationMeshInstance_set_navigation_mesh #-}

bindNavigationMeshInstance_set_navigation_mesh :: MethodBind
bindNavigationMeshInstance_set_navigation_mesh
  = unsafePerformIO $
      withCString "NavigationMeshInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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