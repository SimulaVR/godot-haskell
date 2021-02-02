{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindPrimitiveMesh_get_custom_aabb #-}

-- | Overrides the [AABB] with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
bindPrimitiveMesh_get_custom_aabb :: MethodBind
bindPrimitiveMesh_get_custom_aabb
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the [AABB] with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
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

{-# NOINLINE bindPrimitiveMesh_get_flip_faces #-}

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn. Result is the same as using *CULL_BACK* in [SpatialMaterial]. Default is false.
bindPrimitiveMesh_get_flip_faces :: MethodBind
bindPrimitiveMesh_get_flip_faces
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_flip_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn. Result is the same as using *CULL_BACK* in [SpatialMaterial]. Default is false.
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

{-# NOINLINE bindPrimitiveMesh_get_material #-}

-- | The current [Material] of the primitive mesh.
bindPrimitiveMesh_get_material :: MethodBind
bindPrimitiveMesh_get_material
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current [Material] of the primitive mesh.
get_material ::
               (PrimitiveMesh :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPrimitiveMesh_get_mesh_arrays #-}

-- | Returns mesh arrays used to constitute surface of [Mesh]. Mesh array can be used with [ArrayMesh] to create new surface.
bindPrimitiveMesh_get_mesh_arrays :: MethodBind
bindPrimitiveMesh_get_mesh_arrays
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "get_mesh_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns mesh arrays used to constitute surface of [Mesh]. Mesh array can be used with [ArrayMesh] to create new surface.
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

{-# NOINLINE bindPrimitiveMesh_set_custom_aabb #-}

-- | Overrides the [AABB] with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
bindPrimitiveMesh_set_custom_aabb :: MethodBind
bindPrimitiveMesh_set_custom_aabb
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the [AABB] with one defined by user for use with frustum culling. Especially useful to avoid unnexpected culling when  using a shader to offset vertices.
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

{-# NOINLINE bindPrimitiveMesh_set_flip_faces #-}

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn. Result is the same as using *CULL_BACK* in [SpatialMaterial]. Default is false.
bindPrimitiveMesh_set_flip_faces :: MethodBind
bindPrimitiveMesh_set_flip_faces
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "set_flip_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set, the order of the vertices in each triangle are reversed resulting in the backside of the mesh being drawn. Result is the same as using *CULL_BACK* in [SpatialMaterial]. Default is false.
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

{-# NOINLINE bindPrimitiveMesh_set_material #-}

-- | The current [Material] of the primitive mesh.
bindPrimitiveMesh_set_material :: MethodBind
bindPrimitiveMesh_set_material
  = unsafePerformIO $
      withCString "PrimitiveMesh" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current [Material] of the primitive mesh.
set_material ::
               (PrimitiveMesh :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrimitiveMesh_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)