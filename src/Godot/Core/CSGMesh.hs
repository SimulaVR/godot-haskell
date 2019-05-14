{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CSGMesh
       (Godot.Core.CSGMesh.set_mesh, Godot.Core.CSGMesh.get_mesh,
        Godot.Core.CSGMesh._mesh_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCSGMesh_set_mesh #-}

bindCSGMesh_set_mesh :: MethodBind
bindCSGMesh_set_mesh
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh :: (CSGMesh :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh_set_mesh (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGMesh_get_mesh #-}

bindCSGMesh_get_mesh :: MethodBind
bindCSGMesh_get_mesh
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh :: (CSGMesh :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh_get_mesh (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGMesh__mesh_changed #-}

bindCSGMesh__mesh_changed :: MethodBind
bindCSGMesh__mesh_changed
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "_mesh_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_mesh_changed :: (CSGMesh :< cls, Object :< cls) => cls -> IO ()
_mesh_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh__mesh_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)