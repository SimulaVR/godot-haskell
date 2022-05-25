{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PrimitiveMesh
       (Godot.Core.PrimitiveMesh._update,
        Godot.Core.PrimitiveMesh.get_custom_aabb,
        Godot.Core.PrimitiveMesh.get_flip_faces,
        Godot.Core.PrimitiveMesh.get_material,
        Godot.Core.PrimitiveMesh.get_mesh_arrays,
        Godot.Core.PrimitiveMesh.set_custom_aabb,
        Godot.Core.PrimitiveMesh.set_flip_faces,
        Godot.Core.PrimitiveMesh.set_material)
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
import Godot.Core.Mesh()

instance NodeProperty PrimitiveMesh "custom_aabb" Aabb 'False where
        nodeProperty
          = (get_custom_aabb, wrapDroppingSetter set_custom_aabb, Nothing)

instance NodeProperty PrimitiveMesh "flip_faces" Bool 'False where
        nodeProperty
          = (get_flip_faces, wrapDroppingSetter set_flip_faces, Nothing)

instance NodeProperty PrimitiveMesh "material" Material 'False
         where
        nodeProperty
          = (get_material, wrapDroppingSetter set_material, Nothing)

{-# NOINLINE bindPrimitiveMesh__update #-}

bindPrimitiveMesh__update :: MethodBind
bindPrimitiveMesh__update
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update :: (PrimitiveMesh :< cls, Object :< cls) => cls -> IO ()
_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh__update (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "_update" '[] (IO ()) where
        nodeMethod = Godot.Core.PrimitiveMesh._update

{-# NOINLINE bindPrimitiveMesh_get_custom_aabb #-}

-- | Overrides the @AABB@ with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
bindPrimitiveMesh_get_custom_aabb :: MethodBind
bindPrimitiveMesh_get_custom_aabb
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the @AABB@ with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
get_custom_aabb ::
                  (PrimitiveMesh :< cls, Object :< cls) => cls -> IO Aabb
get_custom_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_get_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "get_custom_aabb" '[] (IO Aabb)
         where
        nodeMethod = Godot.Core.PrimitiveMesh.get_custom_aabb

{-# NOINLINE bindPrimitiveMesh_get_flip_faces #-}

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn.
--   			This gives the same result as using @SpatialMaterial.CULL_BACK@ in @SpatialMaterial.params_cull_mode@.
bindPrimitiveMesh_get_flip_faces :: MethodBind
bindPrimitiveMesh_get_flip_faces
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_flip_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn.
--   			This gives the same result as using @SpatialMaterial.CULL_BACK@ in @SpatialMaterial.params_cull_mode@.
get_flip_faces ::
                 (PrimitiveMesh :< cls, Object :< cls) => cls -> IO Bool
get_flip_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_get_flip_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "get_flip_faces" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.PrimitiveMesh.get_flip_faces

{-# NOINLINE bindPrimitiveMesh_get_material #-}

-- | The current @Material@ of the primitive mesh.
bindPrimitiveMesh_get_material :: MethodBind
bindPrimitiveMesh_get_material
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current @Material@ of the primitive mesh.
get_material ::
               (PrimitiveMesh :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "get_material" '[] (IO Material)
         where
        nodeMethod = Godot.Core.PrimitiveMesh.get_material

{-# NOINLINE bindPrimitiveMesh_get_mesh_arrays #-}

-- | Returns mesh arrays used to constitute surface of @Mesh@. Mesh arrays can be used with @ArrayMesh@ to create new surfaces.
bindPrimitiveMesh_get_mesh_arrays :: MethodBind
bindPrimitiveMesh_get_mesh_arrays
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_mesh_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns mesh arrays used to constitute surface of @Mesh@. Mesh arrays can be used with @ArrayMesh@ to create new surfaces.
get_mesh_arrays ::
                  (PrimitiveMesh :< cls, Object :< cls) => cls -> IO Array
get_mesh_arrays cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_get_mesh_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "get_mesh_arrays" '[] (IO Array)
         where
        nodeMethod = Godot.Core.PrimitiveMesh.get_mesh_arrays

{-# NOINLINE bindPrimitiveMesh_set_custom_aabb #-}

-- | Overrides the @AABB@ with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
bindPrimitiveMesh_set_custom_aabb :: MethodBind
bindPrimitiveMesh_set_custom_aabb
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the @AABB@ with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
set_custom_aabb ::
                  (PrimitiveMesh :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_custom_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_set_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "set_custom_aabb" '[Aabb] (IO ())
         where
        nodeMethod = Godot.Core.PrimitiveMesh.set_custom_aabb

{-# NOINLINE bindPrimitiveMesh_set_flip_faces #-}

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn.
--   			This gives the same result as using @SpatialMaterial.CULL_BACK@ in @SpatialMaterial.params_cull_mode@.
bindPrimitiveMesh_set_flip_faces :: MethodBind
bindPrimitiveMesh_set_flip_faces
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "set_flip_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn.
--   			This gives the same result as using @SpatialMaterial.CULL_BACK@ in @SpatialMaterial.params_cull_mode@.
set_flip_faces ::
                 (PrimitiveMesh :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_set_flip_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "set_flip_faces" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.PrimitiveMesh.set_flip_faces

{-# NOINLINE bindPrimitiveMesh_set_material #-}

-- | The current @Material@ of the primitive mesh.
bindPrimitiveMesh_set_material :: MethodBind
bindPrimitiveMesh_set_material
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current @Material@ of the primitive mesh.
set_material ::
               (PrimitiveMesh :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrimitiveMesh "set_material" '[Material]
           (IO ())
         where
        nodeMethod = Godot.Core.PrimitiveMesh.set_material