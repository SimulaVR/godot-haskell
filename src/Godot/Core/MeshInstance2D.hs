{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MeshInstance2D
       (Godot.Core.MeshInstance2D.sig_texture_changed,
        Godot.Core.MeshInstance2D.get_mesh,
        Godot.Core.MeshInstance2D.get_normal_map,
        Godot.Core.MeshInstance2D.get_texture,
        Godot.Core.MeshInstance2D.set_mesh,
        Godot.Core.MeshInstance2D.set_normal_map,
        Godot.Core.MeshInstance2D.set_texture)
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
import Godot.Core.Node2D()

-- | Emitted when the @texture@ is changed.
sig_texture_changed ::
                    Godot.Internal.Dispatch.Signal MeshInstance2D
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

instance NodeSignal MeshInstance2D "texture_changed" '[]

instance NodeProperty MeshInstance2D "mesh" Mesh 'False where
        nodeProperty = (get_mesh, wrapDroppingSetter set_mesh, Nothing)

instance NodeProperty MeshInstance2D "normal_map" Texture 'False
         where
        nodeProperty
          = (get_normal_map, wrapDroppingSetter set_normal_map, Nothing)

instance NodeProperty MeshInstance2D "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

{-# NOINLINE bindMeshInstance2D_get_mesh #-}

-- | The @Mesh@ that will be drawn by the @MeshInstance2D@.
bindMeshInstance2D_get_mesh :: MethodBind
bindMeshInstance2D_get_mesh
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Mesh@ that will be drawn by the @MeshInstance2D@.
get_mesh ::
           (MeshInstance2D :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshInstance2D "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.MeshInstance2D.get_mesh

{-# NOINLINE bindMeshInstance2D_get_normal_map #-}

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
bindMeshInstance2D_get_normal_map :: MethodBind
bindMeshInstance2D_get_normal_map
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
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

instance NodeMethod MeshInstance2D "get_normal_map" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.MeshInstance2D.get_normal_map

{-# NOINLINE bindMeshInstance2D_get_texture #-}

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
bindMeshInstance2D_get_texture :: MethodBind
bindMeshInstance2D_get_texture
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
get_texture ::
              (MeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshInstance2D "get_texture" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.MeshInstance2D.get_texture

{-# NOINLINE bindMeshInstance2D_set_mesh #-}

-- | The @Mesh@ that will be drawn by the @MeshInstance2D@.
bindMeshInstance2D_set_mesh :: MethodBind
bindMeshInstance2D_set_mesh
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Mesh@ that will be drawn by the @MeshInstance2D@.
set_mesh ::
           (MeshInstance2D :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshInstance2D "set_mesh" '[Mesh] (IO ()) where
        nodeMethod = Godot.Core.MeshInstance2D.set_mesh

{-# NOINLINE bindMeshInstance2D_set_normal_map #-}

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
bindMeshInstance2D_set_normal_map :: MethodBind
bindMeshInstance2D_set_normal_map
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
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

instance NodeMethod MeshInstance2D "set_normal_map" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.MeshInstance2D.set_normal_map

{-# NOINLINE bindMeshInstance2D_set_texture #-}

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
bindMeshInstance2D_set_texture :: MethodBind
bindMeshInstance2D_set_texture
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
set_texture ::
              (MeshInstance2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MeshInstance2D "set_texture" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.MeshInstance2D.set_texture