{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Texture()

instance NodeProperty MeshTexture "base_texture" Texture 'False
         where
        nodeProperty
          = (get_base_texture, wrapDroppingSetter set_base_texture, Nothing)

instance NodeProperty MeshTexture "image_size" Vector2 'False where
        nodeProperty
          = (get_image_size, wrapDroppingSetter set_image_size, Nothing)

instance NodeProperty MeshTexture "mesh" Mesh 'False where
        nodeProperty = (get_mesh, wrapDroppingSetter set_mesh, Nothing)

{-# NOINLINE bindMeshTexture_get_base_texture #-}

-- | Sets the base texture that the Mesh will use to draw.
bindMeshTexture_get_base_texture :: MethodBind
bindMeshTexture_get_base_texture
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "get_base_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the base texture that the Mesh will use to draw.
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

instance NodeMethod MeshTexture "get_base_texture" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.MeshTexture.get_base_texture

{-# NOINLINE bindMeshTexture_get_image_size #-}

-- | Sets the size of the image, needed for reference.
bindMeshTexture_get_image_size :: MethodBind
bindMeshTexture_get_image_size
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "get_image_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the image, needed for reference.
get_image_size ::
                 (MeshTexture :< cls, Object :< cls) => cls -> IO Vector2
get_image_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_get_image_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshTexture "get_image_size" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.MeshTexture.get_image_size

{-# NOINLINE bindMeshTexture_get_mesh #-}

-- | Sets the mesh used to draw. It must be a mesh using 2D vertices.
bindMeshTexture_get_mesh :: MethodBind
bindMeshTexture_get_mesh
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mesh used to draw. It must be a mesh using 2D vertices.
get_mesh :: (MeshTexture :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_get_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshTexture "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.MeshTexture.get_mesh

{-# NOINLINE bindMeshTexture_set_base_texture #-}

-- | Sets the base texture that the Mesh will use to draw.
bindMeshTexture_set_base_texture :: MethodBind
bindMeshTexture_set_base_texture
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "set_base_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the base texture that the Mesh will use to draw.
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

instance NodeMethod MeshTexture "set_base_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.MeshTexture.set_base_texture

{-# NOINLINE bindMeshTexture_set_image_size #-}

-- | Sets the size of the image, needed for reference.
bindMeshTexture_set_image_size :: MethodBind
bindMeshTexture_set_image_size
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "set_image_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the image, needed for reference.
set_image_size ::
                 (MeshTexture :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_image_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_set_image_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshTexture "set_image_size" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.MeshTexture.set_image_size

{-# NOINLINE bindMeshTexture_set_mesh #-}

-- | Sets the mesh used to draw. It must be a mesh using 2D vertices.
bindMeshTexture_set_mesh :: MethodBind
bindMeshTexture_set_mesh
  = unsafePerformIO $
      withCString "MeshTexture" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mesh used to draw. It must be a mesh using 2D vertices.
set_mesh ::
           (MeshTexture :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshTexture_set_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshTexture "set_mesh" '[Mesh] (IO ()) where
        nodeMethod = Godot.Core.MeshTexture.set_mesh