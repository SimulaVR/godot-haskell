{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Mesh
       (Godot.Core.Mesh._ARRAY_COMPRESS_WEIGHTS,
        Godot.Core.Mesh._ARRAY_FLAG_USE_16_BIT_BONES,
        Godot.Core.Mesh._ARRAY_FORMAT_INDEX,
        Godot.Core.Mesh._ARRAY_COMPRESS_TANGENT,
        Godot.Core.Mesh._ARRAY_COMPRESS_NORMAL,
        Godot.Core.Mesh._ARRAY_FORMAT_COLOR,
        Godot.Core.Mesh._ARRAY_FORMAT_TEX_UV,
        Godot.Core.Mesh._ARRAY_COMPRESS_VERTEX,
        Godot.Core.Mesh._ARRAY_FORMAT_VERTEX,
        Godot.Core.Mesh._ARRAY_COMPRESS_TEX_UV,
        Godot.Core.Mesh._ARRAY_COMPRESS_BASE,
        Godot.Core.Mesh._ARRAY_COMPRESS_BONES, Godot.Core.Mesh._ARRAY_MAX,
        Godot.Core.Mesh._ARRAY_NORMAL,
        Godot.Core.Mesh._ARRAY_FORMAT_TEX_UV2,
        Godot.Core.Mesh._ARRAY_INDEX, Godot.Core.Mesh._ARRAY_COLOR,
        Godot.Core.Mesh._PRIMITIVE_TRIANGLE_STRIP,
        Godot.Core.Mesh._PRIMITIVE_TRIANGLES,
        Godot.Core.Mesh._ARRAY_TEX_UV,
        Godot.Core.Mesh._BLEND_SHAPE_MODE_NORMALIZED,
        Godot.Core.Mesh._PRIMITIVE_LINE_LOOP,
        Godot.Core.Mesh._PRIMITIVE_TRIANGLE_FAN,
        Godot.Core.Mesh._ARRAY_FORMAT_NORMAL,
        Godot.Core.Mesh._ARRAY_TEX_UV2,
        Godot.Core.Mesh._ARRAY_COMPRESS_DEFAULT,
        Godot.Core.Mesh._ARRAY_FORMAT_BONES,
        Godot.Core.Mesh._ARRAY_COMPRESS_COLOR,
        Godot.Core.Mesh._ARRAY_WEIGHTS, Godot.Core.Mesh._ARRAY_TANGENT,
        Godot.Core.Mesh._ARRAY_COMPRESS_TEX_UV2,
        Godot.Core.Mesh._PRIMITIVE_LINE_STRIP,
        Godot.Core.Mesh._PRIMITIVE_LINES, Godot.Core.Mesh._ARRAY_BONES,
        Godot.Core.Mesh._BLEND_SHAPE_MODE_RELATIVE,
        Godot.Core.Mesh._ARRAY_VERTEX,
        Godot.Core.Mesh._ARRAY_FLAG_USE_2D_VERTICES,
        Godot.Core.Mesh._ARRAY_COMPRESS_INDEX,
        Godot.Core.Mesh._ARRAY_FORMAT_WEIGHTS,
        Godot.Core.Mesh._ARRAY_FORMAT_TANGENT,
        Godot.Core.Mesh._PRIMITIVE_POINTS,
        Godot.Core.Mesh.create_convex_shape,
        Godot.Core.Mesh.create_outline,
        Godot.Core.Mesh.create_trimesh_shape,
        Godot.Core.Mesh.generate_triangle_mesh, Godot.Core.Mesh.get_aabb,
        Godot.Core.Mesh.get_faces, Godot.Core.Mesh.get_lightmap_size_hint,
        Godot.Core.Mesh.get_surface_count,
        Godot.Core.Mesh.set_lightmap_size_hint,
        Godot.Core.Mesh.surface_get_arrays,
        Godot.Core.Mesh.surface_get_blend_shape_arrays,
        Godot.Core.Mesh.surface_get_material,
        Godot.Core.Mesh.surface_set_material)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ARRAY_COMPRESS_WEIGHTS :: Int
_ARRAY_COMPRESS_WEIGHTS = 65536

_ARRAY_FLAG_USE_16_BIT_BONES :: Int
_ARRAY_FLAG_USE_16_BIT_BONES = 524288

_ARRAY_FORMAT_INDEX :: Int
_ARRAY_FORMAT_INDEX = 256

_ARRAY_COMPRESS_TANGENT :: Int
_ARRAY_COMPRESS_TANGENT = 2048

_ARRAY_COMPRESS_NORMAL :: Int
_ARRAY_COMPRESS_NORMAL = 1024

_ARRAY_FORMAT_COLOR :: Int
_ARRAY_FORMAT_COLOR = 8

_ARRAY_FORMAT_TEX_UV :: Int
_ARRAY_FORMAT_TEX_UV = 16

_ARRAY_COMPRESS_VERTEX :: Int
_ARRAY_COMPRESS_VERTEX = 512

_ARRAY_FORMAT_VERTEX :: Int
_ARRAY_FORMAT_VERTEX = 1

_ARRAY_COMPRESS_TEX_UV :: Int
_ARRAY_COMPRESS_TEX_UV = 8192

_ARRAY_COMPRESS_BASE :: Int
_ARRAY_COMPRESS_BASE = 9

_ARRAY_COMPRESS_BONES :: Int
_ARRAY_COMPRESS_BONES = 32768

_ARRAY_MAX :: Int
_ARRAY_MAX = 9

_ARRAY_NORMAL :: Int
_ARRAY_NORMAL = 1

_ARRAY_FORMAT_TEX_UV2 :: Int
_ARRAY_FORMAT_TEX_UV2 = 32

_ARRAY_INDEX :: Int
_ARRAY_INDEX = 8

_ARRAY_COLOR :: Int
_ARRAY_COLOR = 3

_PRIMITIVE_TRIANGLE_STRIP :: Int
_PRIMITIVE_TRIANGLE_STRIP = 5

_PRIMITIVE_TRIANGLES :: Int
_PRIMITIVE_TRIANGLES = 4

_ARRAY_TEX_UV :: Int
_ARRAY_TEX_UV = 4

_BLEND_SHAPE_MODE_NORMALIZED :: Int
_BLEND_SHAPE_MODE_NORMALIZED = 0

_PRIMITIVE_LINE_LOOP :: Int
_PRIMITIVE_LINE_LOOP = 3

_PRIMITIVE_TRIANGLE_FAN :: Int
_PRIMITIVE_TRIANGLE_FAN = 6

_ARRAY_FORMAT_NORMAL :: Int
_ARRAY_FORMAT_NORMAL = 2

_ARRAY_TEX_UV2 :: Int
_ARRAY_TEX_UV2 = 5

_ARRAY_COMPRESS_DEFAULT :: Int
_ARRAY_COMPRESS_DEFAULT = 97280

_ARRAY_FORMAT_BONES :: Int
_ARRAY_FORMAT_BONES = 64

_ARRAY_COMPRESS_COLOR :: Int
_ARRAY_COMPRESS_COLOR = 4096

_ARRAY_WEIGHTS :: Int
_ARRAY_WEIGHTS = 7

_ARRAY_TANGENT :: Int
_ARRAY_TANGENT = 2

_ARRAY_COMPRESS_TEX_UV2 :: Int
_ARRAY_COMPRESS_TEX_UV2 = 16384

_PRIMITIVE_LINE_STRIP :: Int
_PRIMITIVE_LINE_STRIP = 2

_PRIMITIVE_LINES :: Int
_PRIMITIVE_LINES = 1

_ARRAY_BONES :: Int
_ARRAY_BONES = 6

_BLEND_SHAPE_MODE_RELATIVE :: Int
_BLEND_SHAPE_MODE_RELATIVE = 1

_ARRAY_VERTEX :: Int
_ARRAY_VERTEX = 0

_ARRAY_FLAG_USE_2D_VERTICES :: Int
_ARRAY_FLAG_USE_2D_VERTICES = 262144

_ARRAY_COMPRESS_INDEX :: Int
_ARRAY_COMPRESS_INDEX = 131072

_ARRAY_FORMAT_WEIGHTS :: Int
_ARRAY_FORMAT_WEIGHTS = 128

_ARRAY_FORMAT_TANGENT :: Int
_ARRAY_FORMAT_TANGENT = 4

_PRIMITIVE_POINTS :: Int
_PRIMITIVE_POINTS = 0

{-# NOINLINE bindMesh_create_convex_shape #-}

-- | Calculate a [ConvexPolygonShape] from the mesh.
bindMesh_create_convex_shape :: MethodBind
bindMesh_create_convex_shape
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "create_convex_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calculate a [ConvexPolygonShape] from the mesh.
create_convex_shape ::
                      (Mesh :< cls, Object :< cls) => cls -> IO Shape
create_convex_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_create_convex_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_create_outline #-}

-- | Calculate an outline mesh at a defined offset (margin) from the original mesh.
--   				[b]Note:[/b] This method typically returns the vertices in reverse order (e.g. clockwise to counterclockwise).
bindMesh_create_outline :: MethodBind
bindMesh_create_outline
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "create_outline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calculate an outline mesh at a defined offset (margin) from the original mesh.
--   				[b]Note:[/b] This method typically returns the vertices in reverse order (e.g. clockwise to counterclockwise).
create_outline ::
                 (Mesh :< cls, Object :< cls) => cls -> Float -> IO Mesh
create_outline cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_create_outline (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_create_trimesh_shape #-}

-- | Calculate a [ConcavePolygonShape] from the mesh.
bindMesh_create_trimesh_shape :: MethodBind
bindMesh_create_trimesh_shape
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "create_trimesh_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calculate a [ConcavePolygonShape] from the mesh.
create_trimesh_shape ::
                       (Mesh :< cls, Object :< cls) => cls -> IO Shape
create_trimesh_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_create_trimesh_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_generate_triangle_mesh #-}

-- | Generate a [TriangleMesh] from the mesh.
bindMesh_generate_triangle_mesh :: MethodBind
bindMesh_generate_triangle_mesh
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "generate_triangle_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generate a [TriangleMesh] from the mesh.
generate_triangle_mesh ::
                         (Mesh :< cls, Object :< cls) => cls -> IO TriangleMesh
generate_triangle_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_generate_triangle_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_get_aabb #-}

-- | Returns the smallest [AABB] enclosing this mesh in local space. Not affected by [code]custom_aabb[/code]. See also [method VisualInstance.get_transformed_aabb].
--   				[b]Note:[/b] This is only implemented for [ArrayMesh] and [PrimitiveMesh].
bindMesh_get_aabb :: MethodBind
bindMesh_get_aabb
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the smallest [AABB] enclosing this mesh in local space. Not affected by [code]custom_aabb[/code]. See also [method VisualInstance.get_transformed_aabb].
--   				[b]Note:[/b] This is only implemented for [ArrayMesh] and [PrimitiveMesh].
get_aabb :: (Mesh :< cls, Object :< cls) => cls -> IO Aabb
get_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_get_aabb (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_get_faces #-}

-- | Returns all the vertices that make up the faces of the mesh. Each three vertices represent one triangle.
bindMesh_get_faces :: MethodBind
bindMesh_get_faces
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "get_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the vertices that make up the faces of the mesh. Each three vertices represent one triangle.
get_faces ::
            (Mesh :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_get_faces (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_get_lightmap_size_hint #-}

-- | Sets a hint to be used for lightmap resolution in [BakedLightmap]. Overrides [member BakedLightmap.bake_default_texels_per_unit].
bindMesh_get_lightmap_size_hint :: MethodBind
bindMesh_get_lightmap_size_hint
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "get_lightmap_size_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a hint to be used for lightmap resolution in [BakedLightmap]. Overrides [member BakedLightmap.bake_default_texels_per_unit].
get_lightmap_size_hint ::
                         (Mesh :< cls, Object :< cls) => cls -> IO Vector2
get_lightmap_size_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_get_lightmap_size_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_get_surface_count #-}

-- | Returns the amount of surfaces that the [Mesh] holds.
bindMesh_get_surface_count :: MethodBind
bindMesh_get_surface_count
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "get_surface_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of surfaces that the [Mesh] holds.
get_surface_count :: (Mesh :< cls, Object :< cls) => cls -> IO Int
get_surface_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_get_surface_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_set_lightmap_size_hint #-}

-- | Sets a hint to be used for lightmap resolution in [BakedLightmap]. Overrides [member BakedLightmap.bake_default_texels_per_unit].
bindMesh_set_lightmap_size_hint :: MethodBind
bindMesh_set_lightmap_size_hint
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "set_lightmap_size_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a hint to be used for lightmap resolution in [BakedLightmap]. Overrides [member BakedLightmap.bake_default_texels_per_unit].
set_lightmap_size_hint ::
                         (Mesh :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_lightmap_size_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_set_lightmap_size_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_surface_get_arrays #-}

-- | Returns the arrays for the vertices, normals, uvs, etc. that make up the requested surface (see [method ArrayMesh.add_surface_from_arrays]).
bindMesh_surface_get_arrays :: MethodBind
bindMesh_surface_get_arrays
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "surface_get_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the arrays for the vertices, normals, uvs, etc. that make up the requested surface (see [method ArrayMesh.add_surface_from_arrays]).
surface_get_arrays ::
                     (Mesh :< cls, Object :< cls) => cls -> Int -> IO Array
surface_get_arrays cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_surface_get_arrays (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_surface_get_blend_shape_arrays #-}

-- | Returns the blend shape arrays for the requested surface.
bindMesh_surface_get_blend_shape_arrays :: MethodBind
bindMesh_surface_get_blend_shape_arrays
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "surface_get_blend_shape_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the blend shape arrays for the requested surface.
surface_get_blend_shape_arrays ::
                                 (Mesh :< cls, Object :< cls) => cls -> Int -> IO Array
surface_get_blend_shape_arrays cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_surface_get_blend_shape_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_surface_get_material #-}

-- | Returns a [Material] in a given surface. Surface is rendered using this material.
bindMesh_surface_get_material :: MethodBind
bindMesh_surface_get_material
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "surface_get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [Material] in a given surface. Surface is rendered using this material.
surface_get_material ::
                       (Mesh :< cls, Object :< cls) => cls -> Int -> IO Material
surface_get_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_surface_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMesh_surface_set_material #-}

-- | Sets a [Material] for a given surface. Surface will be rendered using this material.
bindMesh_surface_set_material :: MethodBind
bindMesh_surface_set_material
  = unsafePerformIO $
      withCString "Mesh" $
        \ clsNamePtr ->
          withCString "surface_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a [Material] for a given surface. Surface will be rendered using this material.
surface_set_material ::
                       (Mesh :< cls, Object :< cls) => cls -> Int -> Material -> IO ()
surface_set_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMesh_surface_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)