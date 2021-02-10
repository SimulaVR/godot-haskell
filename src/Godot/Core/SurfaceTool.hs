{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SurfaceTool
       (Godot.Core.SurfaceTool.add_bones,
        Godot.Core.SurfaceTool.add_color, Godot.Core.SurfaceTool.add_index,
        Godot.Core.SurfaceTool.add_normal,
        Godot.Core.SurfaceTool.add_smooth_group,
        Godot.Core.SurfaceTool.add_tangent,
        Godot.Core.SurfaceTool.add_triangle_fan,
        Godot.Core.SurfaceTool.add_uv, Godot.Core.SurfaceTool.add_uv2,
        Godot.Core.SurfaceTool.add_vertex,
        Godot.Core.SurfaceTool.add_weights,
        Godot.Core.SurfaceTool.append_from, Godot.Core.SurfaceTool.begin,
        Godot.Core.SurfaceTool.clear, Godot.Core.SurfaceTool.commit,
        Godot.Core.SurfaceTool.commit_to_arrays,
        Godot.Core.SurfaceTool.create_from,
        Godot.Core.SurfaceTool.create_from_blend_shape,
        Godot.Core.SurfaceTool.deindex,
        Godot.Core.SurfaceTool.generate_normals,
        Godot.Core.SurfaceTool.generate_tangents,
        Godot.Core.SurfaceTool.index, Godot.Core.SurfaceTool.set_material)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSurfaceTool_add_bones #-}

-- | Adds an array of bones for the next vertex to use. [code]bones[/code] must contain 4 integers.
bindSurfaceTool_add_bones :: MethodBind
bindSurfaceTool_add_bones
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an array of bones for the next vertex to use. [code]bones[/code] must contain 4 integers.
add_bones ::
            (SurfaceTool :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
add_bones cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_bones (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_color #-}

-- | Specifies a [Color] for the next vertex to use.
bindSurfaceTool_add_color :: MethodBind
bindSurfaceTool_add_color
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a [Color] for the next vertex to use.
add_color ::
            (SurfaceTool :< cls, Object :< cls) => cls -> Color -> IO ()
add_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_index #-}

-- | Adds an index to index array if you are using indexed vertices. Does not need to be called before adding vertices.
bindSurfaceTool_add_index :: MethodBind
bindSurfaceTool_add_index
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an index to index array if you are using indexed vertices. Does not need to be called before adding vertices.
add_index ::
            (SurfaceTool :< cls, Object :< cls) => cls -> Int -> IO ()
add_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_normal #-}

-- | Specifies a normal for the next vertex to use.
bindSurfaceTool_add_normal :: MethodBind
bindSurfaceTool_add_normal
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a normal for the next vertex to use.
add_normal ::
             (SurfaceTool :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_smooth_group #-}

-- | Specifies whether the current vertex (if using only vertex arrays) or current index (if also using index arrays) should use smooth normals for normal calculation.
bindSurfaceTool_add_smooth_group :: MethodBind
bindSurfaceTool_add_smooth_group
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_smooth_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies whether the current vertex (if using only vertex arrays) or current index (if also using index arrays) should use smooth normals for normal calculation.
add_smooth_group ::
                   (SurfaceTool :< cls, Object :< cls) => cls -> Bool -> IO ()
add_smooth_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_smooth_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_tangent #-}

-- | Specifies a tangent for the next vertex to use.
bindSurfaceTool_add_tangent :: MethodBind
bindSurfaceTool_add_tangent
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a tangent for the next vertex to use.
add_tangent ::
              (SurfaceTool :< cls, Object :< cls) => cls -> Plane -> IO ()
add_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_tangent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_triangle_fan #-}

-- | Inserts a triangle fan made of array data into [Mesh] being constructed.
--   				Requires the primitive type be set to [constant Mesh.PRIMITIVE_TRIANGLES].
bindSurfaceTool_add_triangle_fan :: MethodBind
bindSurfaceTool_add_triangle_fan
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_triangle_fan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Inserts a triangle fan made of array data into [Mesh] being constructed.
--   				Requires the primitive type be set to [constant Mesh.PRIMITIVE_TRIANGLES].
add_triangle_fan ::
                   (SurfaceTool :< cls, Object :< cls) =>
                   cls ->
                     PoolVector3Array ->
                       PoolVector2Array ->
                         PoolColorArray ->
                           PoolVector2Array -> PoolVector3Array -> Array -> IO ()
add_triangle_fan cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_triangle_fan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_uv #-}

-- | Specifies a set of UV coordinates to use for the next vertex.
bindSurfaceTool_add_uv :: MethodBind
bindSurfaceTool_add_uv
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a set of UV coordinates to use for the next vertex.
add_uv ::
         (SurfaceTool :< cls, Object :< cls) => cls -> Vector2 -> IO ()
add_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_uv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_uv2 #-}

-- | Specifies an optional second set of UV coordinates to use for the next vertex.
bindSurfaceTool_add_uv2 :: MethodBind
bindSurfaceTool_add_uv2
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies an optional second set of UV coordinates to use for the next vertex.
add_uv2 ::
          (SurfaceTool :< cls, Object :< cls) => cls -> Vector2 -> IO ()
add_uv2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_uv2 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_vertex #-}

-- | Specifies the position of current vertex. Should be called after specifying other vertex properties (e.g. Color, UV).
bindSurfaceTool_add_vertex :: MethodBind
bindSurfaceTool_add_vertex
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the position of current vertex. Should be called after specifying other vertex properties (e.g. Color, UV).
add_vertex ::
             (SurfaceTool :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_vertex cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_vertex (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_add_weights #-}

-- | Specifies weight values for next vertex to use. [code]weights[/code] must contain 4 values.
bindSurfaceTool_add_weights :: MethodBind
bindSurfaceTool_add_weights
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies weight values for next vertex to use. [code]weights[/code] must contain 4 values.
add_weights ::
              (SurfaceTool :< cls, Object :< cls) =>
              cls -> PoolRealArray -> IO ()
add_weights cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_weights (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_append_from #-}

-- | Append vertices from a given [Mesh] surface onto the current vertex array with specified [Transform].
bindSurfaceTool_append_from :: MethodBind
bindSurfaceTool_append_from
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "append_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Append vertices from a given [Mesh] surface onto the current vertex array with specified [Transform].
append_from ::
              (SurfaceTool :< cls, Object :< cls) =>
              cls -> Mesh -> Int -> Transform -> IO ()
append_from cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_append_from (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_begin #-}

-- | Called before adding any vertices. Takes the primitive type as an argument (e.g. [constant Mesh.PRIMITIVE_TRIANGLES]).
bindSurfaceTool_begin :: MethodBind
bindSurfaceTool_begin
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called before adding any vertices. Takes the primitive type as an argument (e.g. [constant Mesh.PRIMITIVE_TRIANGLES]).
begin :: (SurfaceTool :< cls, Object :< cls) => cls -> Int -> IO ()
begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_begin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_clear #-}

-- | Clear all information passed into the surface tool so far.
bindSurfaceTool_clear :: MethodBind
bindSurfaceTool_clear
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear all information passed into the surface tool so far.
clear :: (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_commit #-}

-- | Returns a constructed [ArrayMesh] from current information passed in. If an existing [ArrayMesh] is passed in as an argument, will add an extra surface to the existing [ArrayMesh].
--   				Default flag is [constant Mesh.ARRAY_COMPRESS_DEFAULT]. See [code]ARRAY_COMPRESS_*[/code] constants in [enum Mesh.ArrayFormat] for other flags.
bindSurfaceTool_commit :: MethodBind
bindSurfaceTool_commit
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a constructed [ArrayMesh] from current information passed in. If an existing [ArrayMesh] is passed in as an argument, will add an extra surface to the existing [ArrayMesh].
--   				Default flag is [constant Mesh.ARRAY_COMPRESS_DEFAULT]. See [code]ARRAY_COMPRESS_*[/code] constants in [enum Mesh.ArrayFormat] for other flags.
commit ::
         (SurfaceTool :< cls, Object :< cls) =>
         cls -> ArrayMesh -> Int -> IO ArrayMesh
commit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_commit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_commit_to_arrays #-}

-- | Commits the data to the same format used by [method ArrayMesh.add_surface_from_arrays]. This way you can further process the mesh data using the [ArrayMesh] API.
bindSurfaceTool_commit_to_arrays :: MethodBind
bindSurfaceTool_commit_to_arrays
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "commit_to_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Commits the data to the same format used by [method ArrayMesh.add_surface_from_arrays]. This way you can further process the mesh data using the [ArrayMesh] API.
commit_to_arrays ::
                   (SurfaceTool :< cls, Object :< cls) => cls -> IO Array
commit_to_arrays cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_commit_to_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_create_from #-}

-- | Creates a vertex array from an existing [Mesh].
bindSurfaceTool_create_from :: MethodBind
bindSurfaceTool_create_from
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "create_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a vertex array from an existing [Mesh].
create_from ::
              (SurfaceTool :< cls, Object :< cls) => cls -> Mesh -> Int -> IO ()
create_from cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_create_from (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_create_from_blend_shape #-}

-- | Creates a vertex array from the specified blend shape of an existing [Mesh]. This can be used to extract a specific pose from a blend shape.
bindSurfaceTool_create_from_blend_shape :: MethodBind
bindSurfaceTool_create_from_blend_shape
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "create_from_blend_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a vertex array from the specified blend shape of an existing [Mesh]. This can be used to extract a specific pose from a blend shape.
create_from_blend_shape ::
                          (SurfaceTool :< cls, Object :< cls) =>
                          cls -> Mesh -> Int -> GodotString -> IO ()
create_from_blend_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_create_from_blend_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_deindex #-}

-- | Removes the index array by expanding the vertex array.
bindSurfaceTool_deindex :: MethodBind
bindSurfaceTool_deindex
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "deindex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the index array by expanding the vertex array.
deindex :: (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
deindex cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_deindex (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_generate_normals #-}

-- | Generates normals from vertices so you do not have to do it manually. If [code]flip[/code] is [code]true[/code], the resulting normals will be inverted.
--   				Requires the primitive type to be set to [constant Mesh.PRIMITIVE_TRIANGLES].
bindSurfaceTool_generate_normals :: MethodBind
bindSurfaceTool_generate_normals
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "generate_normals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates normals from vertices so you do not have to do it manually. If [code]flip[/code] is [code]true[/code], the resulting normals will be inverted.
--   				Requires the primitive type to be set to [constant Mesh.PRIMITIVE_TRIANGLES].
generate_normals ::
                   (SurfaceTool :< cls, Object :< cls) => cls -> Bool -> IO ()
generate_normals cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_generate_normals
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_generate_tangents #-}

-- | Generates a tangent vector for each vertex. Requires that each vertex have UVs and normals set already.
bindSurfaceTool_generate_tangents :: MethodBind
bindSurfaceTool_generate_tangents
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "generate_tangents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a tangent vector for each vertex. Requires that each vertex have UVs and normals set already.
generate_tangents ::
                    (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
generate_tangents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_generate_tangents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_index #-}

-- | Shrinks the vertex array by creating an index array (avoids reusing vertices).
bindSurfaceTool_index :: MethodBind
bindSurfaceTool_index
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shrinks the vertex array by creating an index array (avoids reusing vertices).
index :: (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_index (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSurfaceTool_set_material #-}

-- | Sets [Material] to be used by the [Mesh] you are constructing.
bindSurfaceTool_set_material :: MethodBind
bindSurfaceTool_set_material
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets [Material] to be used by the [Mesh] you are constructing.
set_material ::
               (SurfaceTool :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)