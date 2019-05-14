{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.NavigationMesh
       (Godot.Core.NavigationMesh._SAMPLE_PARTITION_LAYERS,
        Godot.Core.NavigationMesh._SAMPLE_PARTITION_WATERSHED,
        Godot.Core.NavigationMesh._SAMPLE_PARTITION_MONOTONE,
        Godot.Core.NavigationMesh.set_sample_partition_type,
        Godot.Core.NavigationMesh.get_sample_partition_type,
        Godot.Core.NavigationMesh.set_cell_size,
        Godot.Core.NavigationMesh.get_cell_size,
        Godot.Core.NavigationMesh.set_cell_height,
        Godot.Core.NavigationMesh.get_cell_height,
        Godot.Core.NavigationMesh.set_agent_height,
        Godot.Core.NavigationMesh.get_agent_height,
        Godot.Core.NavigationMesh.set_agent_radius,
        Godot.Core.NavigationMesh.get_agent_radius,
        Godot.Core.NavigationMesh.set_agent_max_climb,
        Godot.Core.NavigationMesh.get_agent_max_climb,
        Godot.Core.NavigationMesh.set_agent_max_slope,
        Godot.Core.NavigationMesh.get_agent_max_slope,
        Godot.Core.NavigationMesh.set_region_min_size,
        Godot.Core.NavigationMesh.get_region_min_size,
        Godot.Core.NavigationMesh.set_region_merge_size,
        Godot.Core.NavigationMesh.get_region_merge_size,
        Godot.Core.NavigationMesh.set_edge_max_length,
        Godot.Core.NavigationMesh.get_edge_max_length,
        Godot.Core.NavigationMesh.set_edge_max_error,
        Godot.Core.NavigationMesh.get_edge_max_error,
        Godot.Core.NavigationMesh.set_verts_per_poly,
        Godot.Core.NavigationMesh.get_verts_per_poly,
        Godot.Core.NavigationMesh.set_detail_sample_distance,
        Godot.Core.NavigationMesh.get_detail_sample_distance,
        Godot.Core.NavigationMesh.set_detail_sample_max_error,
        Godot.Core.NavigationMesh.get_detail_sample_max_error,
        Godot.Core.NavigationMesh.set_filter_low_hanging_obstacles,
        Godot.Core.NavigationMesh.get_filter_low_hanging_obstacles,
        Godot.Core.NavigationMesh.set_filter_ledge_spans,
        Godot.Core.NavigationMesh.get_filter_ledge_spans,
        Godot.Core.NavigationMesh.set_filter_walkable_low_height_spans,
        Godot.Core.NavigationMesh.get_filter_walkable_low_height_spans,
        Godot.Core.NavigationMesh.set_vertices,
        Godot.Core.NavigationMesh.get_vertices,
        Godot.Core.NavigationMesh.add_polygon,
        Godot.Core.NavigationMesh.get_polygon_count,
        Godot.Core.NavigationMesh.get_polygon,
        Godot.Core.NavigationMesh.clear_polygons,
        Godot.Core.NavigationMesh.create_from_mesh,
        Godot.Core.NavigationMesh._set_polygons,
        Godot.Core.NavigationMesh._get_polygons)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SAMPLE_PARTITION_LAYERS :: Int
_SAMPLE_PARTITION_LAYERS = 2

_SAMPLE_PARTITION_WATERSHED :: Int
_SAMPLE_PARTITION_WATERSHED = 0

_SAMPLE_PARTITION_MONOTONE :: Int
_SAMPLE_PARTITION_MONOTONE = 1

{-# NOINLINE bindNavigationMesh_set_sample_partition_type #-}

bindNavigationMesh_set_sample_partition_type :: MethodBind
bindNavigationMesh_set_sample_partition_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_sample_partition_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sample_partition_type ::
                            (NavigationMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_sample_partition_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_sample_partition_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_sample_partition_type #-}

bindNavigationMesh_get_sample_partition_type :: MethodBind
bindNavigationMesh_get_sample_partition_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_sample_partition_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sample_partition_type ::
                            (NavigationMesh :< cls, Object :< cls) => cls -> IO Int
get_sample_partition_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_sample_partition_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_cell_size #-}

bindNavigationMesh_set_cell_size :: MethodBind
bindNavigationMesh_set_cell_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_size ::
                (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_cell_size #-}

bindNavigationMesh_get_cell_size :: MethodBind
bindNavigationMesh_get_cell_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_size ::
                (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_cell_height #-}

bindNavigationMesh_set_cell_height :: MethodBind
bindNavigationMesh_set_cell_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_height ::
                  (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_cell_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_cell_height #-}

bindNavigationMesh_get_cell_height :: MethodBind
bindNavigationMesh_get_cell_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_height ::
                  (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_cell_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_cell_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_agent_height #-}

bindNavigationMesh_set_agent_height :: MethodBind
bindNavigationMesh_set_agent_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_agent_height ::
                   (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_agent_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_agent_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_agent_height #-}

bindNavigationMesh_get_agent_height :: MethodBind
bindNavigationMesh_get_agent_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_agent_height ::
                   (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_agent_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_agent_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_agent_radius #-}

bindNavigationMesh_set_agent_radius :: MethodBind
bindNavigationMesh_set_agent_radius
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_agent_radius ::
                   (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_agent_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_agent_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_agent_radius #-}

bindNavigationMesh_get_agent_radius :: MethodBind
bindNavigationMesh_get_agent_radius
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_agent_radius ::
                   (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_agent_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_agent_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_agent_max_climb #-}

bindNavigationMesh_set_agent_max_climb :: MethodBind
bindNavigationMesh_set_agent_max_climb
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_max_climb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_agent_max_climb ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_agent_max_climb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_agent_max_climb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_agent_max_climb #-}

bindNavigationMesh_get_agent_max_climb :: MethodBind
bindNavigationMesh_get_agent_max_climb
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_max_climb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_agent_max_climb ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_agent_max_climb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_agent_max_climb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_agent_max_slope #-}

bindNavigationMesh_set_agent_max_slope :: MethodBind
bindNavigationMesh_set_agent_max_slope
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_max_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_agent_max_slope ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_agent_max_slope cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_agent_max_slope
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_agent_max_slope #-}

bindNavigationMesh_get_agent_max_slope :: MethodBind
bindNavigationMesh_get_agent_max_slope
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_max_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_agent_max_slope ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_agent_max_slope cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_agent_max_slope
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_region_min_size #-}

bindNavigationMesh_set_region_min_size :: MethodBind
bindNavigationMesh_set_region_min_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_region_min_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_region_min_size ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_region_min_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_region_min_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_region_min_size #-}

bindNavigationMesh_get_region_min_size :: MethodBind
bindNavigationMesh_get_region_min_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_region_min_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_region_min_size ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_region_min_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_region_min_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_region_merge_size #-}

bindNavigationMesh_set_region_merge_size :: MethodBind
bindNavigationMesh_set_region_merge_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_region_merge_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_region_merge_size ::
                        (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_region_merge_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_region_merge_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_region_merge_size #-}

bindNavigationMesh_get_region_merge_size :: MethodBind
bindNavigationMesh_get_region_merge_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_region_merge_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_region_merge_size ::
                        (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_region_merge_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_region_merge_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_edge_max_length #-}

bindNavigationMesh_set_edge_max_length :: MethodBind
bindNavigationMesh_set_edge_max_length
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_edge_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_edge_max_length ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_edge_max_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_edge_max_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_edge_max_length #-}

bindNavigationMesh_get_edge_max_length :: MethodBind
bindNavigationMesh_get_edge_max_length
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_edge_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_edge_max_length ::
                      (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_edge_max_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_edge_max_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_edge_max_error #-}

bindNavigationMesh_set_edge_max_error :: MethodBind
bindNavigationMesh_set_edge_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_edge_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_edge_max_error ::
                     (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_edge_max_error cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_edge_max_error
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_edge_max_error #-}

bindNavigationMesh_get_edge_max_error :: MethodBind
bindNavigationMesh_get_edge_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_edge_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_edge_max_error ::
                     (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_edge_max_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_edge_max_error
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_verts_per_poly #-}

bindNavigationMesh_set_verts_per_poly :: MethodBind
bindNavigationMesh_set_verts_per_poly
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_verts_per_poly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_verts_per_poly ::
                     (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_verts_per_poly cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_verts_per_poly
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_verts_per_poly #-}

bindNavigationMesh_get_verts_per_poly :: MethodBind
bindNavigationMesh_get_verts_per_poly
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_verts_per_poly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_verts_per_poly ::
                     (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_verts_per_poly cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_verts_per_poly
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_detail_sample_distance #-}

bindNavigationMesh_set_detail_sample_distance :: MethodBind
bindNavigationMesh_set_detail_sample_distance
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_detail_sample_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_detail_sample_distance ::
                             (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_detail_sample_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_set_detail_sample_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_detail_sample_distance #-}

bindNavigationMesh_get_detail_sample_distance :: MethodBind
bindNavigationMesh_get_detail_sample_distance
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_detail_sample_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_detail_sample_distance ::
                             (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_detail_sample_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_get_detail_sample_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_detail_sample_max_error #-}

bindNavigationMesh_set_detail_sample_max_error :: MethodBind
bindNavigationMesh_set_detail_sample_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_detail_sample_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_detail_sample_max_error ::
                              (NavigationMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_detail_sample_max_error cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_set_detail_sample_max_error
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_detail_sample_max_error #-}

bindNavigationMesh_get_detail_sample_max_error :: MethodBind
bindNavigationMesh_get_detail_sample_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_detail_sample_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_detail_sample_max_error ::
                              (NavigationMesh :< cls, Object :< cls) => cls -> IO Float
get_detail_sample_max_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_get_detail_sample_max_error
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_filter_low_hanging_obstacles
             #-}

bindNavigationMesh_set_filter_low_hanging_obstacles :: MethodBind
bindNavigationMesh_set_filter_low_hanging_obstacles
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_filter_low_hanging_obstacles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_filter_low_hanging_obstacles ::
                                   (NavigationMesh :< cls, Object :< cls) => cls -> Bool -> IO ()
set_filter_low_hanging_obstacles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_set_filter_low_hanging_obstacles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_filter_low_hanging_obstacles
             #-}

bindNavigationMesh_get_filter_low_hanging_obstacles :: MethodBind
bindNavigationMesh_get_filter_low_hanging_obstacles
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_filter_low_hanging_obstacles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_filter_low_hanging_obstacles ::
                                   (NavigationMesh :< cls, Object :< cls) => cls -> IO Bool
get_filter_low_hanging_obstacles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_get_filter_low_hanging_obstacles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_filter_ledge_spans #-}

bindNavigationMesh_set_filter_ledge_spans :: MethodBind
bindNavigationMesh_set_filter_ledge_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_filter_ledge_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_filter_ledge_spans ::
                         (NavigationMesh :< cls, Object :< cls) => cls -> Bool -> IO ()
set_filter_ledge_spans cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_filter_ledge_spans
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_filter_ledge_spans #-}

bindNavigationMesh_get_filter_ledge_spans :: MethodBind
bindNavigationMesh_get_filter_ledge_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_filter_ledge_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_filter_ledge_spans ::
                         (NavigationMesh :< cls, Object :< cls) => cls -> IO Bool
get_filter_ledge_spans cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_filter_ledge_spans
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_filter_walkable_low_height_spans
             #-}

bindNavigationMesh_set_filter_walkable_low_height_spans ::
                                                        MethodBind
bindNavigationMesh_set_filter_walkable_low_height_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_filter_walkable_low_height_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_filter_walkable_low_height_spans ::
                                       (NavigationMesh :< cls, Object :< cls) =>
                                       cls -> Bool -> IO ()
set_filter_walkable_low_height_spans cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_set_filter_walkable_low_height_spans
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_filter_walkable_low_height_spans
             #-}

bindNavigationMesh_get_filter_walkable_low_height_spans ::
                                                        MethodBind
bindNavigationMesh_get_filter_walkable_low_height_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_filter_walkable_low_height_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_filter_walkable_low_height_spans ::
                                       (NavigationMesh :< cls, Object :< cls) => cls -> IO Bool
get_filter_walkable_low_height_spans cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationMesh_get_filter_walkable_low_height_spans
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_set_vertices #-}

bindNavigationMesh_set_vertices :: MethodBind
bindNavigationMesh_set_vertices
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_vertices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_vertices ::
               (NavigationMesh :< cls, Object :< cls) =>
               cls -> PoolVector3Array -> IO ()
set_vertices cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_vertices (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_vertices #-}

bindNavigationMesh_get_vertices :: MethodBind
bindNavigationMesh_get_vertices
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_vertices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_vertices ::
               (NavigationMesh :< cls, Object :< cls) =>
               cls -> IO PoolVector3Array
get_vertices cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_vertices (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_add_polygon #-}

bindNavigationMesh_add_polygon :: MethodBind
bindNavigationMesh_add_polygon
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "add_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_polygon ::
              (NavigationMesh :< cls, Object :< cls) =>
              cls -> PoolIntArray -> IO ()
add_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_add_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_polygon_count #-}

bindNavigationMesh_get_polygon_count :: MethodBind
bindNavigationMesh_get_polygon_count
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_polygon_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_polygon_count ::
                    (NavigationMesh :< cls, Object :< cls) => cls -> IO Int
get_polygon_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_polygon_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_get_polygon #-}

bindNavigationMesh_get_polygon :: MethodBind
bindNavigationMesh_get_polygon
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_polygon ::
              (NavigationMesh :< cls, Object :< cls) =>
              cls -> Int -> IO PoolIntArray
get_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_clear_polygons #-}

bindNavigationMesh_clear_polygons :: MethodBind
bindNavigationMesh_clear_polygons
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "clear_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_polygons ::
                 (NavigationMesh :< cls, Object :< cls) => cls -> IO ()
clear_polygons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_clear_polygons
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh_create_from_mesh #-}

bindNavigationMesh_create_from_mesh :: MethodBind
bindNavigationMesh_create_from_mesh
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "create_from_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_from_mesh ::
                   (NavigationMesh :< cls, Object :< cls) => cls -> Mesh -> IO ()
create_from_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_create_from_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh__set_polygons #-}

bindNavigationMesh__set_polygons :: MethodBind
bindNavigationMesh__set_polygons
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "_set_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_polygons ::
                (NavigationMesh :< cls, Object :< cls) => cls -> Array -> IO ()
_set_polygons cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh__set_polygons
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationMesh__get_polygons #-}

bindNavigationMesh__get_polygons :: MethodBind
bindNavigationMesh__get_polygons
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "_get_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_polygons ::
                (NavigationMesh :< cls, Object :< cls) => cls -> IO Array
_get_polygons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh__get_polygons
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)