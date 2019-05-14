{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MeshDataTool
       (Godot.Core.MeshDataTool.clear,
        Godot.Core.MeshDataTool.create_from_surface,
        Godot.Core.MeshDataTool.commit_to_surface,
        Godot.Core.MeshDataTool.get_format,
        Godot.Core.MeshDataTool.get_vertex_count,
        Godot.Core.MeshDataTool.get_edge_count,
        Godot.Core.MeshDataTool.get_face_count,
        Godot.Core.MeshDataTool.set_vertex,
        Godot.Core.MeshDataTool.get_vertex,
        Godot.Core.MeshDataTool.set_vertex_normal,
        Godot.Core.MeshDataTool.get_vertex_normal,
        Godot.Core.MeshDataTool.set_vertex_tangent,
        Godot.Core.MeshDataTool.get_vertex_tangent,
        Godot.Core.MeshDataTool.set_vertex_uv,
        Godot.Core.MeshDataTool.get_vertex_uv,
        Godot.Core.MeshDataTool.set_vertex_uv2,
        Godot.Core.MeshDataTool.get_vertex_uv2,
        Godot.Core.MeshDataTool.set_vertex_color,
        Godot.Core.MeshDataTool.get_vertex_color,
        Godot.Core.MeshDataTool.set_vertex_bones,
        Godot.Core.MeshDataTool.get_vertex_bones,
        Godot.Core.MeshDataTool.set_vertex_weights,
        Godot.Core.MeshDataTool.get_vertex_weights,
        Godot.Core.MeshDataTool.set_vertex_meta,
        Godot.Core.MeshDataTool.get_vertex_meta,
        Godot.Core.MeshDataTool.get_vertex_edges,
        Godot.Core.MeshDataTool.get_vertex_faces,
        Godot.Core.MeshDataTool.get_edge_vertex,
        Godot.Core.MeshDataTool.get_edge_faces,
        Godot.Core.MeshDataTool.set_edge_meta,
        Godot.Core.MeshDataTool.get_edge_meta,
        Godot.Core.MeshDataTool.get_face_vertex,
        Godot.Core.MeshDataTool.get_face_edge,
        Godot.Core.MeshDataTool.set_face_meta,
        Godot.Core.MeshDataTool.get_face_meta,
        Godot.Core.MeshDataTool.get_face_normal,
        Godot.Core.MeshDataTool.set_material,
        Godot.Core.MeshDataTool.get_material)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMeshDataTool_clear #-}

-- | Clears all data currently in MeshDataTool.
bindMeshDataTool_clear :: MethodBind
bindMeshDataTool_clear
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all data currently in MeshDataTool.
clear :: (MeshDataTool :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_create_from_surface #-}

-- | Uses specified surface of given [Mesh] to populate data for MeshDataTool.
--   				Requires [Mesh] with primitive type [code]PRIMITIVE_TRIANGLES[/code].
bindMeshDataTool_create_from_surface :: MethodBind
bindMeshDataTool_create_from_surface
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "create_from_surface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Uses specified surface of given [Mesh] to populate data for MeshDataTool.
--   				Requires [Mesh] with primitive type [code]PRIMITIVE_TRIANGLES[/code].
create_from_surface ::
                      (MeshDataTool :< cls, Object :< cls) =>
                      cls -> ArrayMesh -> Int -> IO Int
create_from_surface cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_create_from_surface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_commit_to_surface #-}

-- | Adds a new surface to specified [Mesh] with edited data.
bindMeshDataTool_commit_to_surface :: MethodBind
bindMeshDataTool_commit_to_surface
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "commit_to_surface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new surface to specified [Mesh] with edited data.
commit_to_surface ::
                    (MeshDataTool :< cls, Object :< cls) => cls -> ArrayMesh -> IO Int
commit_to_surface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_commit_to_surface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_format #-}

-- | Returns format of [Mesh]. Format is an integer made up of [Mesh] format flags combined together. For example, a mesh containing both vertices and normals would return a format of [code]3[/code] because [code]ARRAY_FORMAT_VERTEX[/code] is [code]1[/code] and [code]ARRAY_FORMAT_NORMAL[/code] is [code]2[/code].
--   				For list of format flags see [ArrayMesh].
bindMeshDataTool_get_format :: MethodBind
bindMeshDataTool_get_format
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns format of [Mesh]. Format is an integer made up of [Mesh] format flags combined together. For example, a mesh containing both vertices and normals would return a format of [code]3[/code] because [code]ARRAY_FORMAT_VERTEX[/code] is [code]1[/code] and [code]ARRAY_FORMAT_NORMAL[/code] is [code]2[/code].
--   				For list of format flags see [ArrayMesh].
get_format :: (MeshDataTool :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_count #-}

-- | Returns the total number of vertices in [Mesh].
bindMeshDataTool_get_vertex_count :: MethodBind
bindMeshDataTool_get_vertex_count
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of vertices in [Mesh].
get_vertex_count ::
                   (MeshDataTool :< cls, Object :< cls) => cls -> IO Int
get_vertex_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_edge_count #-}

-- | Returns the number of edges in this [Mesh].
bindMeshDataTool_get_edge_count :: MethodBind
bindMeshDataTool_get_edge_count
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_edge_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of edges in this [Mesh].
get_edge_count ::
                 (MeshDataTool :< cls, Object :< cls) => cls -> IO Int
get_edge_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_edge_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_face_count #-}

-- | Returns the number of faces in this [Mesh].
bindMeshDataTool_get_face_count :: MethodBind
bindMeshDataTool_get_face_count
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_face_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of faces in this [Mesh].
get_face_count ::
                 (MeshDataTool :< cls, Object :< cls) => cls -> IO Int
get_face_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_face_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex #-}

-- | Sets the position of given vertex.
bindMeshDataTool_set_vertex :: MethodBind
bindMeshDataTool_set_vertex
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of given vertex.
set_vertex ::
             (MeshDataTool :< cls, Object :< cls) =>
             cls -> Int -> Vector3 -> IO ()
set_vertex cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex #-}

-- | Returns the vertex at given index.
bindMeshDataTool_get_vertex :: MethodBind
bindMeshDataTool_get_vertex
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the vertex at given index.
get_vertex ::
             (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_vertex cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_normal #-}

-- | Sets the normal of given vertex.
bindMeshDataTool_set_vertex_normal :: MethodBind
bindMeshDataTool_set_vertex_normal
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the normal of given vertex.
set_vertex_normal ::
                    (MeshDataTool :< cls, Object :< cls) =>
                    cls -> Int -> Vector3 -> IO ()
set_vertex_normal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_normal #-}

-- | Returns normal of given vertex.
bindMeshDataTool_get_vertex_normal :: MethodBind
bindMeshDataTool_get_vertex_normal
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns normal of given vertex.
get_vertex_normal ::
                    (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_vertex_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_tangent #-}

-- | Sets the tangent of given vertex.
bindMeshDataTool_set_vertex_tangent :: MethodBind
bindMeshDataTool_set_vertex_tangent
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tangent of given vertex.
set_vertex_tangent ::
                     (MeshDataTool :< cls, Object :< cls) =>
                     cls -> Int -> Plane -> IO ()
set_vertex_tangent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_tangent #-}

-- | Returns tangent of given vertex.
bindMeshDataTool_get_vertex_tangent :: MethodBind
bindMeshDataTool_get_vertex_tangent
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns tangent of given vertex.
get_vertex_tangent ::
                     (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Plane
get_vertex_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_uv #-}

-- | Sets the UV of given vertex.
bindMeshDataTool_set_vertex_uv :: MethodBind
bindMeshDataTool_set_vertex_uv
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the UV of given vertex.
set_vertex_uv ::
                (MeshDataTool :< cls, Object :< cls) =>
                cls -> Int -> Vector2 -> IO ()
set_vertex_uv cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_uv (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_uv #-}

-- | Returns UV of given vertex.
bindMeshDataTool_get_vertex_uv :: MethodBind
bindMeshDataTool_get_vertex_uv
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns UV of given vertex.
get_vertex_uv ::
                (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_vertex_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_uv (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_uv2 #-}

-- | Sets the UV2 of given vertex.
bindMeshDataTool_set_vertex_uv2 :: MethodBind
bindMeshDataTool_set_vertex_uv2
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the UV2 of given vertex.
set_vertex_uv2 ::
                 (MeshDataTool :< cls, Object :< cls) =>
                 cls -> Int -> Vector2 -> IO ()
set_vertex_uv2 cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_uv2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_uv2 #-}

-- | Returns UV2 of given vertex.
bindMeshDataTool_get_vertex_uv2 :: MethodBind
bindMeshDataTool_get_vertex_uv2
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns UV2 of given vertex.
get_vertex_uv2 ::
                 (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_vertex_uv2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_uv2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_color #-}

-- | Sets the color of given vertex.
bindMeshDataTool_set_vertex_color :: MethodBind
bindMeshDataTool_set_vertex_color
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of given vertex.
set_vertex_color ::
                   (MeshDataTool :< cls, Object :< cls) =>
                   cls -> Int -> Color -> IO ()
set_vertex_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_color #-}

-- | Returns the color of the given vertex.
bindMeshDataTool_get_vertex_color :: MethodBind
bindMeshDataTool_get_vertex_color
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color of the given vertex.
get_vertex_color ::
                   (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Color
get_vertex_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_bones #-}

-- | Sets the bones of given vertex.
bindMeshDataTool_set_vertex_bones :: MethodBind
bindMeshDataTool_set_vertex_bones
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bones of given vertex.
set_vertex_bones ::
                   (MeshDataTool :< cls, Object :< cls) =>
                   cls -> Int -> PoolIntArray -> IO ()
set_vertex_bones cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_bones
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_bones #-}

-- | Returns the bones of the given vertex.
bindMeshDataTool_get_vertex_bones :: MethodBind
bindMeshDataTool_get_vertex_bones
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bones of the given vertex.
get_vertex_bones ::
                   (MeshDataTool :< cls, Object :< cls) =>
                   cls -> Int -> IO PoolIntArray
get_vertex_bones cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_bones
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_weights #-}

-- | Sets the bone weights of given vertex.
bindMeshDataTool_set_vertex_weights :: MethodBind
bindMeshDataTool_set_vertex_weights
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bone weights of given vertex.
set_vertex_weights ::
                     (MeshDataTool :< cls, Object :< cls) =>
                     cls -> Int -> PoolRealArray -> IO ()
set_vertex_weights cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_weights
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_weights #-}

-- | Returns bone weights of given vertex.
bindMeshDataTool_get_vertex_weights :: MethodBind
bindMeshDataTool_get_vertex_weights
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns bone weights of given vertex.
get_vertex_weights ::
                     (MeshDataTool :< cls, Object :< cls) =>
                     cls -> Int -> IO PoolRealArray
get_vertex_weights cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_weights
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_vertex_meta #-}

-- | Sets the meta data associated with given vertex.
bindMeshDataTool_set_vertex_meta :: MethodBind
bindMeshDataTool_set_vertex_meta
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_vertex_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the meta data associated with given vertex.
set_vertex_meta ::
                  (MeshDataTool :< cls, Object :< cls) =>
                  cls -> Int -> GodotVariant -> IO ()
set_vertex_meta cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_vertex_meta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_meta #-}

-- | Returns meta data associated with given vertex.
bindMeshDataTool_get_vertex_meta :: MethodBind
bindMeshDataTool_get_vertex_meta
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns meta data associated with given vertex.
get_vertex_meta ::
                  (MeshDataTool :< cls, Object :< cls) =>
                  cls -> Int -> IO GodotVariant
get_vertex_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_meta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_edges #-}

-- | Returns array of edges that share given vertex.
bindMeshDataTool_get_vertex_edges :: MethodBind
bindMeshDataTool_get_vertex_edges
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_edges" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns array of edges that share given vertex.
get_vertex_edges ::
                   (MeshDataTool :< cls, Object :< cls) =>
                   cls -> Int -> IO PoolIntArray
get_vertex_edges cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_edges
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_vertex_faces #-}

-- | Returns array of faces that share given vertex.
bindMeshDataTool_get_vertex_faces :: MethodBind
bindMeshDataTool_get_vertex_faces
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_vertex_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns array of faces that share given vertex.
get_vertex_faces ::
                   (MeshDataTool :< cls, Object :< cls) =>
                   cls -> Int -> IO PoolIntArray
get_vertex_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_vertex_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_edge_vertex #-}

-- | Returns index of specified vertex connected to given edge.
--   				Vertex argument can only be 0 or 1 because edges are comprised of two vertices.
bindMeshDataTool_get_edge_vertex :: MethodBind
bindMeshDataTool_get_edge_vertex
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_edge_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns index of specified vertex connected to given edge.
--   				Vertex argument can only be 0 or 1 because edges are comprised of two vertices.
get_edge_vertex ::
                  (MeshDataTool :< cls, Object :< cls) => cls -> Int -> Int -> IO Int
get_edge_vertex cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_edge_vertex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_edge_faces #-}

-- | Returns array of faces that touch given edge.
bindMeshDataTool_get_edge_faces :: MethodBind
bindMeshDataTool_get_edge_faces
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_edge_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns array of faces that touch given edge.
get_edge_faces ::
                 (MeshDataTool :< cls, Object :< cls) =>
                 cls -> Int -> IO PoolIntArray
get_edge_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_edge_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_edge_meta #-}

-- | Sets the meta data of given edge.
bindMeshDataTool_set_edge_meta :: MethodBind
bindMeshDataTool_set_edge_meta
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_edge_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the meta data of given edge.
set_edge_meta ::
                (MeshDataTool :< cls, Object :< cls) =>
                cls -> Int -> GodotVariant -> IO ()
set_edge_meta cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_edge_meta (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_edge_meta #-}

-- | Returns meta information assigned to given edge.
bindMeshDataTool_get_edge_meta :: MethodBind
bindMeshDataTool_get_edge_meta
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_edge_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns meta information assigned to given edge.
get_edge_meta ::
                (MeshDataTool :< cls, Object :< cls) =>
                cls -> Int -> IO GodotVariant
get_edge_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_edge_meta (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_face_vertex #-}

-- | Returns specified vertex of given face.
--   				Vertex argument must be 2 or less because faces contain three vertices.
bindMeshDataTool_get_face_vertex :: MethodBind
bindMeshDataTool_get_face_vertex
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_face_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns specified vertex of given face.
--   				Vertex argument must be 2 or less because faces contain three vertices.
get_face_vertex ::
                  (MeshDataTool :< cls, Object :< cls) => cls -> Int -> Int -> IO Int
get_face_vertex cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_face_vertex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_face_edge #-}

-- | Returns specified edge associated with given face.
--   				Edge argument must 2 or less because a face only has three edges.
bindMeshDataTool_get_face_edge :: MethodBind
bindMeshDataTool_get_face_edge
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_face_edge" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns specified edge associated with given face.
--   				Edge argument must 2 or less because a face only has three edges.
get_face_edge ::
                (MeshDataTool :< cls, Object :< cls) => cls -> Int -> Int -> IO Int
get_face_edge cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_face_edge (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_face_meta #-}

-- | Sets the meta data of given face.
bindMeshDataTool_set_face_meta :: MethodBind
bindMeshDataTool_set_face_meta
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_face_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the meta data of given face.
set_face_meta ::
                (MeshDataTool :< cls, Object :< cls) =>
                cls -> Int -> GodotVariant -> IO ()
set_face_meta cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_face_meta (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_face_meta #-}

-- | Returns meta data associated with given face.
bindMeshDataTool_get_face_meta :: MethodBind
bindMeshDataTool_get_face_meta
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_face_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns meta data associated with given face.
get_face_meta ::
                (MeshDataTool :< cls, Object :< cls) =>
                cls -> Int -> IO GodotVariant
get_face_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_face_meta (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_face_normal #-}

-- | Calculates and returns face normal of given face.
bindMeshDataTool_get_face_normal :: MethodBind
bindMeshDataTool_get_face_normal
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_face_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calculates and returns face normal of given face.
get_face_normal ::
                  (MeshDataTool :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_face_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_face_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_set_material #-}

-- | Sets the material to be used by newly constructed [Mesh].
bindMeshDataTool_set_material :: MethodBind
bindMeshDataTool_set_material
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the material to be used by newly constructed [Mesh].
set_material ::
               (MeshDataTool :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshDataTool_get_material #-}

-- | Returns material assigned to the [Mesh].
bindMeshDataTool_get_material :: MethodBind
bindMeshDataTool_get_material
  = unsafePerformIO $
      withCString "MeshDataTool" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns material assigned to the [Mesh].
get_material ::
               (MeshDataTool :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshDataTool_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)