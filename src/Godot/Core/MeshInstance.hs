{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MeshInstance
       (Godot.Core.MeshInstance._mesh_changed,
        Godot.Core.MeshInstance.create_convex_collision,
        Godot.Core.MeshInstance.create_debug_tangents,
        Godot.Core.MeshInstance.create_trimesh_collision,
        Godot.Core.MeshInstance.get_mesh,
        Godot.Core.MeshInstance.get_skeleton_path,
        Godot.Core.MeshInstance.get_skin,
        Godot.Core.MeshInstance.get_surface_material,
        Godot.Core.MeshInstance.get_surface_material_count,
        Godot.Core.MeshInstance.set_mesh,
        Godot.Core.MeshInstance.set_skeleton_path,
        Godot.Core.MeshInstance.set_skin,
        Godot.Core.MeshInstance.set_surface_material)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMeshInstance__mesh_changed #-}

bindMeshInstance__mesh_changed :: MethodBind
bindMeshInstance__mesh_changed
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "_mesh_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_mesh_changed ::
                (MeshInstance :< cls, Object :< cls) => cls -> IO ()
_mesh_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance__mesh_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_create_convex_collision #-}

-- | This helper creates a [StaticBody] child node with a [ConvexPolygonShape] collision shape calculated from the mesh geometry. It's mainly used for testing.
bindMeshInstance_create_convex_collision :: MethodBind
bindMeshInstance_create_convex_collision
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "create_convex_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This helper creates a [StaticBody] child node with a [ConvexPolygonShape] collision shape calculated from the mesh geometry. It's mainly used for testing.
create_convex_collision ::
                          (MeshInstance :< cls, Object :< cls) => cls -> IO ()
create_convex_collision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_create_convex_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_create_debug_tangents #-}

-- | This helper creates a [MeshInstance] child node with gizmos at every vertex calculated from the mesh geometry. It's mainly used for testing.
bindMeshInstance_create_debug_tangents :: MethodBind
bindMeshInstance_create_debug_tangents
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "create_debug_tangents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This helper creates a [MeshInstance] child node with gizmos at every vertex calculated from the mesh geometry. It's mainly used for testing.
create_debug_tangents ::
                        (MeshInstance :< cls, Object :< cls) => cls -> IO ()
create_debug_tangents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_create_debug_tangents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_create_trimesh_collision #-}

-- | This helper creates a [StaticBody] child node with a [ConcavePolygonShape] collision shape calculated from the mesh geometry. It's mainly used for testing.
bindMeshInstance_create_trimesh_collision :: MethodBind
bindMeshInstance_create_trimesh_collision
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "create_trimesh_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This helper creates a [StaticBody] child node with a [ConcavePolygonShape] collision shape calculated from the mesh geometry. It's mainly used for testing.
create_trimesh_collision ::
                           (MeshInstance :< cls, Object :< cls) => cls -> IO ()
create_trimesh_collision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_create_trimesh_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_get_mesh #-}

-- | The [Mesh] resource for the instance.
bindMeshInstance_get_mesh :: MethodBind
bindMeshInstance_get_mesh
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Mesh] resource for the instance.
get_mesh :: (MeshInstance :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_get_skeleton_path #-}

-- | [NodePath] to the [Skeleton] associated with the instance.
bindMeshInstance_get_skeleton_path :: MethodBind
bindMeshInstance_get_skeleton_path
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "get_skeleton_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [NodePath] to the [Skeleton] associated with the instance.
get_skeleton_path ::
                    (MeshInstance :< cls, Object :< cls) => cls -> IO NodePath
get_skeleton_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_get_skeleton_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_get_skin #-}

-- | Sets the skin to be used by this instance.
bindMeshInstance_get_skin :: MethodBind
bindMeshInstance_get_skin
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "get_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the skin to be used by this instance.
get_skin :: (MeshInstance :< cls, Object :< cls) => cls -> IO Skin
get_skin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_get_skin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_get_surface_material #-}

-- | Returns the [Material] for a surface of the [Mesh] resource.
bindMeshInstance_get_surface_material :: MethodBind
bindMeshInstance_get_surface_material
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "get_surface_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Material] for a surface of the [Mesh] resource.
get_surface_material ::
                       (MeshInstance :< cls, Object :< cls) => cls -> Int -> IO Material
get_surface_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_get_surface_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_get_surface_material_count #-}

-- | Returns the number of surface materials.
bindMeshInstance_get_surface_material_count :: MethodBind
bindMeshInstance_get_surface_material_count
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "get_surface_material_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of surface materials.
get_surface_material_count ::
                             (MeshInstance :< cls, Object :< cls) => cls -> IO Int
get_surface_material_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_get_surface_material_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_set_mesh #-}

-- | The [Mesh] resource for the instance.
bindMeshInstance_set_mesh :: MethodBind
bindMeshInstance_set_mesh
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Mesh] resource for the instance.
set_mesh ::
           (MeshInstance :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_set_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_set_skeleton_path #-}

-- | [NodePath] to the [Skeleton] associated with the instance.
bindMeshInstance_set_skeleton_path :: MethodBind
bindMeshInstance_set_skeleton_path
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "set_skeleton_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [NodePath] to the [Skeleton] associated with the instance.
set_skeleton_path ::
                    (MeshInstance :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_skeleton_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_set_skeleton_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_set_skin #-}

-- | Sets the skin to be used by this instance.
bindMeshInstance_set_skin :: MethodBind
bindMeshInstance_set_skin
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "set_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the skin to be used by this instance.
set_skin ::
           (MeshInstance :< cls, Object :< cls) => cls -> Skin -> IO ()
set_skin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_set_skin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance_set_surface_material #-}

-- | Sets the [Material] for a surface of the [Mesh] resource.
bindMeshInstance_set_surface_material :: MethodBind
bindMeshInstance_set_surface_material
  = unsafePerformIO $
      withCString "MeshInstance" $
        \ clsNamePtr ->
          withCString "set_surface_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [Material] for a surface of the [Mesh] resource.
set_surface_material ::
                       (MeshInstance :< cls, Object :< cls) =>
                       cls -> Int -> Material -> IO ()
set_surface_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance_set_surface_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)