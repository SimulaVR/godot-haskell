{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MeshInstance2D
       (Godot.Core.MeshInstance2D.set_mesh,
        Godot.Core.MeshInstance2D.get_mesh,
        Godot.Core.MeshInstance2D.set_texture,
        Godot.Core.MeshInstance2D.get_texture,
        Godot.Core.MeshInstance2D.set_normal_map,
        Godot.Core.MeshInstance2D.get_normal_map)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMeshInstance2D_set_mesh #-}

bindMeshInstance2D_set_mesh :: MethodBind
bindMeshInstance2D_set_mesh
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh ::
           (MeshInstance2D :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_get_mesh #-}

bindMeshInstance2D_get_mesh :: MethodBind
bindMeshInstance2D_get_mesh
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh ::
           (MeshInstance2D :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_set_texture #-}

bindMeshInstance2D_set_texture :: MethodBind
bindMeshInstance2D_set_texture
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture ::
              (MeshInstance2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_get_texture #-}

bindMeshInstance2D_get_texture :: MethodBind
bindMeshInstance2D_get_texture
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture ::
              (MeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_set_normal_map #-}

bindMeshInstance2D_set_normal_map :: MethodBind
bindMeshInstance2D_set_normal_map
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_normal_map ::
                 (MeshInstance2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_get_normal_map #-}

bindMeshInstance2D_get_normal_map :: MethodBind
bindMeshInstance2D_get_normal_map
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_normal_map ::
                 (MeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)