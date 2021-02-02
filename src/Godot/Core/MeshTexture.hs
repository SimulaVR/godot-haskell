{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MeshTexture
       (Godot.Core.MeshTexture.get_base_texture,
        Godot.Core.MeshTexture.get_image_size,
        Godot.Core.MeshTexture.get_mesh,
        Godot.Core.MeshTexture.set_base_texture,
        Godot.Core.MeshTexture.set_image_size,
        Godot.Core.MeshTexture.set_mesh)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMeshTexture_get_base_texture #-}

bindMeshTexture_get_base_texture :: MethodBind
bindMeshTexture_get_base_texture
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "get_base_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_texture ::
                   (MeshTexture :< cls, Object :< cls) => cls -> IO Texture
get_base_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_get_base_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshTexture_get_image_size #-}

bindMeshTexture_get_image_size :: MethodBind
bindMeshTexture_get_image_size
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "get_image_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_image_size ::
                 (MeshTexture :< cls, Object :< cls) => cls -> IO Vector2
get_image_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_get_image_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshTexture_get_mesh #-}

bindMeshTexture_get_mesh :: MethodBind
bindMeshTexture_get_mesh
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh :: (MeshTexture :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_get_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshTexture_set_base_texture #-}

bindMeshTexture_set_base_texture :: MethodBind
bindMeshTexture_set_base_texture
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "set_base_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_texture ::
                   (MeshTexture :< cls, Object :< cls) => cls -> Texture -> IO ()
set_base_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_set_base_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshTexture_set_image_size #-}

bindMeshTexture_set_image_size :: MethodBind
bindMeshTexture_set_image_size
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "set_image_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_image_size ::
                 (MeshTexture :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_image_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_set_image_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshTexture_set_mesh #-}

bindMeshTexture_set_mesh :: MethodBind
bindMeshTexture_set_mesh
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh ::
           (MeshTexture :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_set_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)