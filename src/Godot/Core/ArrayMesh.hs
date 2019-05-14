{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ArrayMesh
       (Godot.Core.ArrayMesh._ARRAY_FORMAT_INDEX,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_COLOR,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_TEX_UV,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_VERTEX,
        Godot.Core.ArrayMesh._ARRAY_MAX,
        Godot.Core.ArrayMesh._ARRAY_NORMAL,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_TEX_UV2,
        Godot.Core.ArrayMesh._ARRAY_INDEX,
        Godot.Core.ArrayMesh._ARRAY_COLOR,
        Godot.Core.ArrayMesh._ARRAY_TEX_UV,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_NORMAL,
        Godot.Core.ArrayMesh._ARRAY_TEX_UV2,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_BONES,
        Godot.Core.ArrayMesh._ARRAY_WEIGHTS_SIZE,
        Godot.Core.ArrayMesh._ARRAY_WEIGHTS,
        Godot.Core.ArrayMesh._ARRAY_TANGENT,
        Godot.Core.ArrayMesh._ARRAY_BONES,
        Godot.Core.ArrayMesh._NO_INDEX_ARRAY,
        Godot.Core.ArrayMesh._ARRAY_VERTEX,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_WEIGHTS,
        Godot.Core.ArrayMesh._ARRAY_FORMAT_TANGENT,
        Godot.Core.ArrayMesh.add_blend_shape,
        Godot.Core.ArrayMesh.get_blend_shape_count,
        Godot.Core.ArrayMesh.get_blend_shape_name,
        Godot.Core.ArrayMesh.clear_blend_shapes,
        Godot.Core.ArrayMesh.set_blend_shape_mode,
        Godot.Core.ArrayMesh.get_blend_shape_mode,
        Godot.Core.ArrayMesh.add_surface_from_arrays,
        Godot.Core.ArrayMesh.surface_remove,
        Godot.Core.ArrayMesh.surface_update_region,
        Godot.Core.ArrayMesh.surface_get_array_len,
        Godot.Core.ArrayMesh.surface_get_array_index_len,
        Godot.Core.ArrayMesh.surface_get_format,
        Godot.Core.ArrayMesh.surface_get_primitive_type,
        Godot.Core.ArrayMesh.surface_set_material,
        Godot.Core.ArrayMesh.surface_find_by_name,
        Godot.Core.ArrayMesh.surface_set_name,
        Godot.Core.ArrayMesh.surface_get_name,
        Godot.Core.ArrayMesh.regen_normalmaps,
        Godot.Core.ArrayMesh.lightmap_unwrap,
        Godot.Core.ArrayMesh.set_custom_aabb,
        Godot.Core.ArrayMesh.get_custom_aabb)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ARRAY_FORMAT_INDEX :: Int
_ARRAY_FORMAT_INDEX = 256

_ARRAY_FORMAT_COLOR :: Int
_ARRAY_FORMAT_COLOR = 8

_ARRAY_FORMAT_TEX_UV :: Int
_ARRAY_FORMAT_TEX_UV = 16

_ARRAY_FORMAT_VERTEX :: Int
_ARRAY_FORMAT_VERTEX = 1

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

_ARRAY_TEX_UV :: Int
_ARRAY_TEX_UV = 4

_ARRAY_FORMAT_NORMAL :: Int
_ARRAY_FORMAT_NORMAL = 2

_ARRAY_TEX_UV2 :: Int
_ARRAY_TEX_UV2 = 5

_ARRAY_FORMAT_BONES :: Int
_ARRAY_FORMAT_BONES = 64

_ARRAY_WEIGHTS_SIZE :: Int
_ARRAY_WEIGHTS_SIZE = 4

_ARRAY_WEIGHTS :: Int
_ARRAY_WEIGHTS = 7

_ARRAY_TANGENT :: Int
_ARRAY_TANGENT = 2

_ARRAY_BONES :: Int
_ARRAY_BONES = 6

_NO_INDEX_ARRAY :: Int
_NO_INDEX_ARRAY = -1

_ARRAY_VERTEX :: Int
_ARRAY_VERTEX = 0

_ARRAY_FORMAT_WEIGHTS :: Int
_ARRAY_FORMAT_WEIGHTS = 128

_ARRAY_FORMAT_TANGENT :: Int
_ARRAY_FORMAT_TANGENT = 4

{-# NOINLINE bindArrayMesh_add_blend_shape #-}

bindArrayMesh_add_blend_shape :: MethodBind
bindArrayMesh_add_blend_shape
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "add_blend_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_blend_shape ::
                  (ArrayMesh :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_blend_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_add_blend_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_get_blend_shape_count #-}

-- | Returns the number of blend shapes that the [code]ArrayMesh[/code] holds.
bindArrayMesh_get_blend_shape_count :: MethodBind
bindArrayMesh_get_blend_shape_count
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "get_blend_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of blend shapes that the [code]ArrayMesh[/code] holds.
get_blend_shape_count ::
                        (ArrayMesh :< cls, Object :< cls) => cls -> IO Int
get_blend_shape_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_get_blend_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_get_blend_shape_name #-}

-- | Returns the name of the blend shape at this index.
bindArrayMesh_get_blend_shape_name :: MethodBind
bindArrayMesh_get_blend_shape_name
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "get_blend_shape_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the blend shape at this index.
get_blend_shape_name ::
                       (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_blend_shape_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_get_blend_shape_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_clear_blend_shapes #-}

-- | Remove all blend shapes from this [code]ArrayMesh[/code].
bindArrayMesh_clear_blend_shapes :: MethodBind
bindArrayMesh_clear_blend_shapes
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "clear_blend_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove all blend shapes from this [code]ArrayMesh[/code].
clear_blend_shapes ::
                     (ArrayMesh :< cls, Object :< cls) => cls -> IO ()
clear_blend_shapes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_clear_blend_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_set_blend_shape_mode #-}

bindArrayMesh_set_blend_shape_mode :: MethodBind
bindArrayMesh_set_blend_shape_mode
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "set_blend_shape_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_shape_mode ::
                       (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_blend_shape_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_set_blend_shape_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_get_blend_shape_mode #-}

bindArrayMesh_get_blend_shape_mode :: MethodBind
bindArrayMesh_get_blend_shape_mode
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "get_blend_shape_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_shape_mode ::
                       (ArrayMesh :< cls, Object :< cls) => cls -> IO Int
get_blend_shape_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_get_blend_shape_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_add_surface_from_arrays #-}

-- | Creates a new surface.
--   				Surfaces are created to be rendered using a "primitive", which may be PRIMITIVE_POINTS, PRIMITIVE_LINES, PRIMITIVE_LINE_STRIP, PRIMITIVE_LINE_LOOP, PRIMITIVE_TRIANGLES, PRIMITIVE_TRIANGLE_STRIP, PRIMITIVE_TRIANGLE_FAN. See [Mesh] for details. (As a note, when using indices, it is recommended to only use points, lines or triangles). [method Mesh.get_surface_count] will become the [code]surf_idx[/code] for this new surface.
--   				The [code]arrays[/code] argument is an array of arrays. See [enum ArrayType] for the values used in this array. For example, [code]arrays[0][/code] is the array of vertices. That first vertex sub-array is always required; the others are optional. Adding an index array puts this function into "index mode" where the vertex and other arrays become the sources of data and the index array defines the vertex order. All sub-arrays must have the same length as the vertex array or be empty, except for [code]ARRAY_INDEX[/code] if it is used.
--   				Adding an index array puts this function into "index mode" where the vertex and other arrays become the sources of data, and the index array defines the order of the vertices.
--   				Godot uses clockwise winding order for front faces of triangle primitive modes.
bindArrayMesh_add_surface_from_arrays :: MethodBind
bindArrayMesh_add_surface_from_arrays
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "add_surface_from_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new surface.
--   				Surfaces are created to be rendered using a "primitive", which may be PRIMITIVE_POINTS, PRIMITIVE_LINES, PRIMITIVE_LINE_STRIP, PRIMITIVE_LINE_LOOP, PRIMITIVE_TRIANGLES, PRIMITIVE_TRIANGLE_STRIP, PRIMITIVE_TRIANGLE_FAN. See [Mesh] for details. (As a note, when using indices, it is recommended to only use points, lines or triangles). [method Mesh.get_surface_count] will become the [code]surf_idx[/code] for this new surface.
--   				The [code]arrays[/code] argument is an array of arrays. See [enum ArrayType] for the values used in this array. For example, [code]arrays[0][/code] is the array of vertices. That first vertex sub-array is always required; the others are optional. Adding an index array puts this function into "index mode" where the vertex and other arrays become the sources of data and the index array defines the vertex order. All sub-arrays must have the same length as the vertex array or be empty, except for [code]ARRAY_INDEX[/code] if it is used.
--   				Adding an index array puts this function into "index mode" where the vertex and other arrays become the sources of data, and the index array defines the order of the vertices.
--   				Godot uses clockwise winding order for front faces of triangle primitive modes.
add_surface_from_arrays ::
                          (ArrayMesh :< cls, Object :< cls) =>
                          cls -> Int -> Array -> Array -> Int -> IO ()
add_surface_from_arrays cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_add_surface_from_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_remove #-}

-- | Remove a surface at position surf_idx, shifting greater surfaces one surf_idx slot down.
bindArrayMesh_surface_remove :: MethodBind
bindArrayMesh_surface_remove
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove a surface at position surf_idx, shifting greater surfaces one surf_idx slot down.
surface_remove ::
                 (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO ()
surface_remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_remove (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_update_region #-}

bindArrayMesh_surface_update_region :: MethodBind
bindArrayMesh_surface_update_region
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_update_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

surface_update_region ::
                        (ArrayMesh :< cls, Object :< cls) =>
                        cls -> Int -> Int -> PoolByteArray -> IO ()
surface_update_region cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_update_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_get_array_len #-}

-- | Return the length in vertices of the vertex array in the requested surface (see [method add_surface_from_arrays]).
bindArrayMesh_surface_get_array_len :: MethodBind
bindArrayMesh_surface_get_array_len
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_get_array_len" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the length in vertices of the vertex array in the requested surface (see [method add_surface_from_arrays]).
surface_get_array_len ::
                        (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO Int
surface_get_array_len cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_get_array_len
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_get_array_index_len #-}

-- | Return the length in indices of the index array in the requested surface (see [method add_surface_from_arrays]).
bindArrayMesh_surface_get_array_index_len :: MethodBind
bindArrayMesh_surface_get_array_index_len
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_get_array_index_len" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the length in indices of the index array in the requested surface (see [method add_surface_from_arrays]).
surface_get_array_index_len ::
                              (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO Int
surface_get_array_index_len cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_get_array_index_len
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_get_format #-}

-- | Return the format mask of the requested surface (see [method add_surface_from_arrays]).
bindArrayMesh_surface_get_format :: MethodBind
bindArrayMesh_surface_get_format
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the format mask of the requested surface (see [method add_surface_from_arrays]).
surface_get_format ::
                     (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO Int
surface_get_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_get_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_get_primitive_type #-}

-- | Return the primitive type of the requested surface (see [method add_surface_from_arrays]).
bindArrayMesh_surface_get_primitive_type :: MethodBind
bindArrayMesh_surface_get_primitive_type
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_get_primitive_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the primitive type of the requested surface (see [method add_surface_from_arrays]).
surface_get_primitive_type ::
                             (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO Int
surface_get_primitive_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_get_primitive_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_set_material #-}

-- | Set a [Material] for a given surface. Surface will be rendered using this material.
bindArrayMesh_surface_set_material :: MethodBind
bindArrayMesh_surface_set_material
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set a [Material] for a given surface. Surface will be rendered using this material.
surface_set_material ::
                       (ArrayMesh :< cls, Object :< cls) =>
                       cls -> Int -> Material -> IO ()
surface_set_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_set_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_find_by_name #-}

-- | Return the index of the first surface with this name held within this [code]ArrayMesh[/code]. If none are found -1 is returned.
bindArrayMesh_surface_find_by_name :: MethodBind
bindArrayMesh_surface_find_by_name
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_find_by_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the index of the first surface with this name held within this [code]ArrayMesh[/code]. If none are found -1 is returned.
surface_find_by_name ::
                       (ArrayMesh :< cls, Object :< cls) => cls -> GodotString -> IO Int
surface_find_by_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_find_by_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_set_name #-}

-- | Set a name for a given surface.
bindArrayMesh_surface_set_name :: MethodBind
bindArrayMesh_surface_set_name
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set a name for a given surface.
surface_set_name ::
                   (ArrayMesh :< cls, Object :< cls) =>
                   cls -> Int -> GodotString -> IO ()
surface_set_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_set_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_surface_get_name #-}

-- | Get the name assigned to this surface.
bindArrayMesh_surface_get_name :: MethodBind
bindArrayMesh_surface_get_name
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "surface_get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the name assigned to this surface.
surface_get_name ::
                   (ArrayMesh :< cls, Object :< cls) => cls -> Int -> IO GodotString
surface_get_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_surface_get_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_regen_normalmaps #-}

-- | Will regenerate normal maps for the [code]ArrayMesh[/code].
bindArrayMesh_regen_normalmaps :: MethodBind
bindArrayMesh_regen_normalmaps
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "regen_normalmaps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Will regenerate normal maps for the [code]ArrayMesh[/code].
regen_normalmaps ::
                   (ArrayMesh :< cls, Object :< cls) => cls -> IO ()
regen_normalmaps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_regen_normalmaps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_lightmap_unwrap #-}

-- | Will perform a UV unwrap on the [code]ArrayMesh[/code] to prepare the mesh for lightmapping.
bindArrayMesh_lightmap_unwrap :: MethodBind
bindArrayMesh_lightmap_unwrap
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "lightmap_unwrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Will perform a UV unwrap on the [code]ArrayMesh[/code] to prepare the mesh for lightmapping.
lightmap_unwrap ::
                  (ArrayMesh :< cls, Object :< cls) =>
                  cls -> Transform -> Float -> IO Int
lightmap_unwrap cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_lightmap_unwrap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_set_custom_aabb #-}

-- | An overriding bounding box for this mesh.
bindArrayMesh_set_custom_aabb :: MethodBind
bindArrayMesh_set_custom_aabb
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An overriding bounding box for this mesh.
set_custom_aabb ::
                  (ArrayMesh :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_custom_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_set_custom_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArrayMesh_get_custom_aabb #-}

-- | An overriding bounding box for this mesh.
bindArrayMesh_get_custom_aabb :: MethodBind
bindArrayMesh_get_custom_aabb
  = unsafePerformIO $
      withCString "ArrayMesh" $
        \ clsNamePtr ->
          withCString "get_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An overriding bounding box for this mesh.
get_custom_aabb ::
                  (ArrayMesh :< cls, Object :< cls) => cls -> IO Aabb
get_custom_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArrayMesh_get_custom_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)