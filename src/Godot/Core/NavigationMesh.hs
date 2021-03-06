{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationMesh
       (Godot.Core.NavigationMesh._SAMPLE_PARTITION_LAYERS,
        Godot.Core.NavigationMesh._SAMPLE_PARTITION_WATERSHED,
        Godot.Core.NavigationMesh._SAMPLE_PARTITION_MONOTONE,
        Godot.Core.NavigationMesh._PARSED_GEOMETRY_BOTH,
        Godot.Core.NavigationMesh._PARSED_GEOMETRY_MESH_INSTANCES,
        Godot.Core.NavigationMesh._PARSED_GEOMETRY_STATIC_COLLIDERS,
        Godot.Core.NavigationMesh._get_polygons,
        Godot.Core.NavigationMesh._set_polygons,
        Godot.Core.NavigationMesh.add_polygon,
        Godot.Core.NavigationMesh.clear_polygons,
        Godot.Core.NavigationMesh.create_from_mesh,
        Godot.Core.NavigationMesh.get_agent_height,
        Godot.Core.NavigationMesh.get_agent_max_climb,
        Godot.Core.NavigationMesh.get_agent_max_slope,
        Godot.Core.NavigationMesh.get_agent_radius,
        Godot.Core.NavigationMesh.get_cell_height,
        Godot.Core.NavigationMesh.get_cell_size,
        Godot.Core.NavigationMesh.get_collision_mask,
        Godot.Core.NavigationMesh.get_collision_mask_bit,
        Godot.Core.NavigationMesh.get_detail_sample_distance,
        Godot.Core.NavigationMesh.get_detail_sample_max_error,
        Godot.Core.NavigationMesh.get_edge_max_error,
        Godot.Core.NavigationMesh.get_edge_max_length,
        Godot.Core.NavigationMesh.get_filter_ledge_spans,
        Godot.Core.NavigationMesh.get_filter_low_hanging_obstacles,
        Godot.Core.NavigationMesh.get_filter_walkable_low_height_spans,
        Godot.Core.NavigationMesh.get_parsed_geometry_type,
        Godot.Core.NavigationMesh.get_polygon,
        Godot.Core.NavigationMesh.get_polygon_count,
        Godot.Core.NavigationMesh.get_region_merge_size,
        Godot.Core.NavigationMesh.get_region_min_size,
        Godot.Core.NavigationMesh.get_sample_partition_type,
        Godot.Core.NavigationMesh.get_source_geometry_mode,
        Godot.Core.NavigationMesh.get_source_group_name,
        Godot.Core.NavigationMesh.get_vertices,
        Godot.Core.NavigationMesh.get_verts_per_poly,
        Godot.Core.NavigationMesh.set_agent_height,
        Godot.Core.NavigationMesh.set_agent_max_climb,
        Godot.Core.NavigationMesh.set_agent_max_slope,
        Godot.Core.NavigationMesh.set_agent_radius,
        Godot.Core.NavigationMesh.set_cell_height,
        Godot.Core.NavigationMesh.set_cell_size,
        Godot.Core.NavigationMesh.set_collision_mask,
        Godot.Core.NavigationMesh.set_collision_mask_bit,
        Godot.Core.NavigationMesh.set_detail_sample_distance,
        Godot.Core.NavigationMesh.set_detail_sample_max_error,
        Godot.Core.NavigationMesh.set_edge_max_error,
        Godot.Core.NavigationMesh.set_edge_max_length,
        Godot.Core.NavigationMesh.set_filter_ledge_spans,
        Godot.Core.NavigationMesh.set_filter_low_hanging_obstacles,
        Godot.Core.NavigationMesh.set_filter_walkable_low_height_spans,
        Godot.Core.NavigationMesh.set_parsed_geometry_type,
        Godot.Core.NavigationMesh.set_region_merge_size,
        Godot.Core.NavigationMesh.set_region_min_size,
        Godot.Core.NavigationMesh.set_sample_partition_type,
        Godot.Core.NavigationMesh.set_source_geometry_mode,
        Godot.Core.NavigationMesh.set_source_group_name,
        Godot.Core.NavigationMesh.set_vertices,
        Godot.Core.NavigationMesh.set_verts_per_poly)
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
import Godot.Core.Resource()

_SAMPLE_PARTITION_LAYERS :: Int
_SAMPLE_PARTITION_LAYERS = 2

_SAMPLE_PARTITION_WATERSHED :: Int
_SAMPLE_PARTITION_WATERSHED = 0

_SAMPLE_PARTITION_MONOTONE :: Int
_SAMPLE_PARTITION_MONOTONE = 1

_PARSED_GEOMETRY_BOTH :: Int
_PARSED_GEOMETRY_BOTH = 2

_PARSED_GEOMETRY_MESH_INSTANCES :: Int
_PARSED_GEOMETRY_MESH_INSTANCES = 0

_PARSED_GEOMETRY_STATIC_COLLIDERS :: Int
_PARSED_GEOMETRY_STATIC_COLLIDERS = 1

instance NodeProperty NavigationMesh "agent/height" Float 'False
         where
        nodeProperty
          = (get_agent_height, wrapDroppingSetter set_agent_height, Nothing)

instance NodeProperty NavigationMesh "agent/max_climb" Float 'False
         where
        nodeProperty
          = (get_agent_max_climb, wrapDroppingSetter set_agent_max_climb,
             Nothing)

instance NodeProperty NavigationMesh "agent/max_slope" Float 'False
         where
        nodeProperty
          = (get_agent_max_slope, wrapDroppingSetter set_agent_max_slope,
             Nothing)

instance NodeProperty NavigationMesh "agent/radius" Float 'False
         where
        nodeProperty
          = (get_agent_radius, wrapDroppingSetter set_agent_radius, Nothing)

instance NodeProperty NavigationMesh "cell/height" Float 'False
         where
        nodeProperty
          = (get_cell_height, wrapDroppingSetter set_cell_height, Nothing)

instance NodeProperty NavigationMesh "cell/size" Float 'False where
        nodeProperty
          = (get_cell_size, wrapDroppingSetter set_cell_size, Nothing)

instance NodeProperty NavigationMesh "detail/sample_distance" Float
           'False
         where
        nodeProperty
          = (get_detail_sample_distance,
             wrapDroppingSetter set_detail_sample_distance, Nothing)

instance NodeProperty NavigationMesh "detail/sample_max_error"
           Float
           'False
         where
        nodeProperty
          = (get_detail_sample_max_error,
             wrapDroppingSetter set_detail_sample_max_error, Nothing)

instance NodeProperty NavigationMesh "edge/max_error" Float 'False
         where
        nodeProperty
          = (get_edge_max_error, wrapDroppingSetter set_edge_max_error,
             Nothing)

instance NodeProperty NavigationMesh "edge/max_length" Float 'False
         where
        nodeProperty
          = (get_edge_max_length, wrapDroppingSetter set_edge_max_length,
             Nothing)

instance NodeProperty NavigationMesh
           "filter/filter_walkable_low_height_spans"
           Bool
           'False
         where
        nodeProperty
          = (get_filter_walkable_low_height_spans,
             wrapDroppingSetter set_filter_walkable_low_height_spans, Nothing)

instance NodeProperty NavigationMesh "filter/ledge_spans" Bool
           'False
         where
        nodeProperty
          = (get_filter_ledge_spans,
             wrapDroppingSetter set_filter_ledge_spans, Nothing)

instance NodeProperty NavigationMesh "filter/low_hanging_obstacles"
           Bool
           'False
         where
        nodeProperty
          = (get_filter_low_hanging_obstacles,
             wrapDroppingSetter set_filter_low_hanging_obstacles, Nothing)

instance NodeProperty NavigationMesh "geometry/collision_mask" Int
           'False
         where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty NavigationMesh
           "geometry/parsed_geometry_type"
           Int
           'False
         where
        nodeProperty
          = (get_parsed_geometry_type,
             wrapDroppingSetter set_parsed_geometry_type, Nothing)

instance NodeProperty NavigationMesh
           "geometry/source_geometry_mode"
           Int
           'False
         where
        nodeProperty
          = (get_source_geometry_mode,
             wrapDroppingSetter set_source_geometry_mode, Nothing)

instance NodeProperty NavigationMesh "geometry/source_group_name"
           GodotString
           'False
         where
        nodeProperty
          = (get_source_group_name, wrapDroppingSetter set_source_group_name,
             Nothing)

instance NodeProperty NavigationMesh "polygon/verts_per_poly" Float
           'False
         where
        nodeProperty
          = (get_verts_per_poly, wrapDroppingSetter set_verts_per_poly,
             Nothing)

instance NodeProperty NavigationMesh "polygons" Array 'False where
        nodeProperty
          = (_get_polygons, wrapDroppingSetter _set_polygons, Nothing)

instance NodeProperty NavigationMesh "region/merge_size" Float
           'False
         where
        nodeProperty
          = (get_region_merge_size, wrapDroppingSetter set_region_merge_size,
             Nothing)

instance NodeProperty NavigationMesh "region/min_size" Float 'False
         where
        nodeProperty
          = (get_region_min_size, wrapDroppingSetter set_region_min_size,
             Nothing)

instance NodeProperty NavigationMesh
           "sample_partition_type/sample_partition_type"
           Int
           'False
         where
        nodeProperty
          = (get_sample_partition_type,
             wrapDroppingSetter set_sample_partition_type, Nothing)

instance NodeProperty NavigationMesh "vertices" PoolVector3Array
           'False
         where
        nodeProperty
          = (get_vertices, wrapDroppingSetter set_vertices, Nothing)

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

instance NodeMethod NavigationMesh "_get_polygons" '[] (IO Array)
         where
        nodeMethod = Godot.Core.NavigationMesh._get_polygons

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

instance NodeMethod NavigationMesh "_set_polygons" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh._set_polygons

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

instance NodeMethod NavigationMesh "add_polygon" '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.add_polygon

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

instance NodeMethod NavigationMesh "clear_polygons" '[] (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.clear_polygons

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

instance NodeMethod NavigationMesh "create_from_mesh" '[Mesh]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.create_from_mesh

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

instance NodeMethod NavigationMesh "get_agent_height" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_agent_height

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

instance NodeMethod NavigationMesh "get_agent_max_climb" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_agent_max_climb

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

instance NodeMethod NavigationMesh "get_agent_max_slope" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_agent_max_slope

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

instance NodeMethod NavigationMesh "get_agent_radius" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_agent_radius

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

instance NodeMethod NavigationMesh "get_cell_height" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_cell_height

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

instance NodeMethod NavigationMesh "get_cell_size" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_cell_size

{-# NOINLINE bindNavigationMesh_get_collision_mask #-}

bindNavigationMesh_get_collision_mask :: MethodBind
bindNavigationMesh_get_collision_mask
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask ::
                     (NavigationMesh :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "get_collision_mask" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_collision_mask

{-# NOINLINE bindNavigationMesh_get_collision_mask_bit #-}

bindNavigationMesh_get_collision_mask_bit :: MethodBind
bindNavigationMesh_get_collision_mask_bit
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask_bit ::
                         (NavigationMesh :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "get_collision_mask_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_collision_mask_bit

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

instance NodeMethod NavigationMesh "get_detail_sample_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_detail_sample_distance

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

instance NodeMethod NavigationMesh "get_detail_sample_max_error"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_detail_sample_max_error

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

instance NodeMethod NavigationMesh "get_edge_max_error" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_edge_max_error

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

instance NodeMethod NavigationMesh "get_edge_max_length" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_edge_max_length

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

instance NodeMethod NavigationMesh "get_filter_ledge_spans" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_filter_ledge_spans

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

instance NodeMethod NavigationMesh
           "get_filter_low_hanging_obstacles"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.NavigationMesh.get_filter_low_hanging_obstacles

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

instance NodeMethod NavigationMesh
           "get_filter_walkable_low_height_spans"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.NavigationMesh.get_filter_walkable_low_height_spans

{-# NOINLINE bindNavigationMesh_get_parsed_geometry_type #-}

bindNavigationMesh_get_parsed_geometry_type :: MethodBind
bindNavigationMesh_get_parsed_geometry_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_parsed_geometry_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_parsed_geometry_type ::
                           (NavigationMesh :< cls, Object :< cls) => cls -> IO Int
get_parsed_geometry_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_parsed_geometry_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "get_parsed_geometry_type" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_parsed_geometry_type

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

instance NodeMethod NavigationMesh "get_polygon" '[Int]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_polygon

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

instance NodeMethod NavigationMesh "get_polygon_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_polygon_count

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

instance NodeMethod NavigationMesh "get_region_merge_size" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_region_merge_size

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

instance NodeMethod NavigationMesh "get_region_min_size" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_region_min_size

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

instance NodeMethod NavigationMesh "get_sample_partition_type" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_sample_partition_type

{-# NOINLINE bindNavigationMesh_get_source_geometry_mode #-}

bindNavigationMesh_get_source_geometry_mode :: MethodBind
bindNavigationMesh_get_source_geometry_mode
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_source_geometry_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_source_geometry_mode ::
                           (NavigationMesh :< cls, Object :< cls) => cls -> IO Int
get_source_geometry_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_source_geometry_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "get_source_geometry_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_source_geometry_mode

{-# NOINLINE bindNavigationMesh_get_source_group_name #-}

bindNavigationMesh_get_source_group_name :: MethodBind
bindNavigationMesh_get_source_group_name
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_source_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_source_group_name ::
                        (NavigationMesh :< cls, Object :< cls) => cls -> IO GodotString
get_source_group_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_get_source_group_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "get_source_group_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_source_group_name

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

instance NodeMethod NavigationMesh "get_vertices" '[]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_vertices

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

instance NodeMethod NavigationMesh "get_verts_per_poly" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.NavigationMesh.get_verts_per_poly

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

instance NodeMethod NavigationMesh "set_agent_height" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_agent_height

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

instance NodeMethod NavigationMesh "set_agent_max_climb" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_agent_max_climb

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

instance NodeMethod NavigationMesh "set_agent_max_slope" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_agent_max_slope

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

instance NodeMethod NavigationMesh "set_agent_radius" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_agent_radius

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

instance NodeMethod NavigationMesh "set_cell_height" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_cell_height

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

instance NodeMethod NavigationMesh "set_cell_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_cell_size

{-# NOINLINE bindNavigationMesh_set_collision_mask #-}

bindNavigationMesh_set_collision_mask :: MethodBind
bindNavigationMesh_set_collision_mask
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask ::
                     (NavigationMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "set_collision_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_collision_mask

{-# NOINLINE bindNavigationMesh_set_collision_mask_bit #-}

bindNavigationMesh_set_collision_mask_bit :: MethodBind
bindNavigationMesh_set_collision_mask_bit
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask_bit ::
                         (NavigationMesh :< cls, Object :< cls) =>
                         cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "set_collision_mask_bit"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_collision_mask_bit

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

instance NodeMethod NavigationMesh "set_detail_sample_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_detail_sample_distance

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

instance NodeMethod NavigationMesh "set_detail_sample_max_error"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_detail_sample_max_error

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

instance NodeMethod NavigationMesh "set_edge_max_error" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_edge_max_error

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

instance NodeMethod NavigationMesh "set_edge_max_length" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_edge_max_length

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

instance NodeMethod NavigationMesh "set_filter_ledge_spans" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_filter_ledge_spans

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

instance NodeMethod NavigationMesh
           "set_filter_low_hanging_obstacles"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationMesh.set_filter_low_hanging_obstacles

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

instance NodeMethod NavigationMesh
           "set_filter_walkable_low_height_spans"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationMesh.set_filter_walkable_low_height_spans

{-# NOINLINE bindNavigationMesh_set_parsed_geometry_type #-}

bindNavigationMesh_set_parsed_geometry_type :: MethodBind
bindNavigationMesh_set_parsed_geometry_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_parsed_geometry_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_parsed_geometry_type ::
                           (NavigationMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_parsed_geometry_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_parsed_geometry_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "set_parsed_geometry_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_parsed_geometry_type

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

instance NodeMethod NavigationMesh "set_region_merge_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_region_merge_size

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

instance NodeMethod NavigationMesh "set_region_min_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_region_min_size

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

instance NodeMethod NavigationMesh "set_sample_partition_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_sample_partition_type

{-# NOINLINE bindNavigationMesh_set_source_geometry_mode #-}

bindNavigationMesh_set_source_geometry_mode :: MethodBind
bindNavigationMesh_set_source_geometry_mode
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_source_geometry_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_source_geometry_mode ::
                           (NavigationMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_source_geometry_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_source_geometry_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "set_source_geometry_mode"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_source_geometry_mode

{-# NOINLINE bindNavigationMesh_set_source_group_name #-}

bindNavigationMesh_set_source_group_name :: MethodBind
bindNavigationMesh_set_source_group_name
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_source_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_source_group_name ::
                        (NavigationMesh :< cls, Object :< cls) =>
                        cls -> GodotString -> IO ()
set_source_group_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationMesh_set_source_group_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationMesh "set_source_group_name"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_source_group_name

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

instance NodeMethod NavigationMesh "set_vertices"
           '[PoolVector3Array]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_vertices

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

instance NodeMethod NavigationMesh "set_verts_per_poly" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationMesh.set_verts_per_poly