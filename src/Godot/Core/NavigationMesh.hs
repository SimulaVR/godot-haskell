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

-- | Adds a polygon using the indices of the vertices you get when calling @method get_vertices@.
bindNavigationMesh_add_polygon :: MethodBind
bindNavigationMesh_add_polygon
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "add_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a polygon using the indices of the vertices you get when calling @method get_vertices@.
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

-- | Clears the array of polygons, but it doesn't clear the array of vertices.
bindNavigationMesh_clear_polygons :: MethodBind
bindNavigationMesh_clear_polygons
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "clear_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the array of polygons, but it doesn't clear the array of vertices.
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

-- | Initializes the navigation mesh by setting the vertices and indices according to a @Mesh@.
bindNavigationMesh_create_from_mesh :: MethodBind
bindNavigationMesh_create_from_mesh
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "create_from_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the navigation mesh by setting the vertices and indices according to a @Mesh@.
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

-- | The minimum floor to ceiling height that will still allow the floor area to be considered walkable.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/height@.
bindNavigationMesh_get_agent_height :: MethodBind
bindNavigationMesh_get_agent_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum floor to ceiling height that will still allow the floor area to be considered walkable.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/height@.
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

-- | The minimum ledge height that is considered to still be traversable.
--   			__Note:__ While baking, this value will be rounded down to the nearest multiple of @cell/height@.
bindNavigationMesh_get_agent_max_climb :: MethodBind
bindNavigationMesh_get_agent_max_climb
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_max_climb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum ledge height that is considered to still be traversable.
--   			__Note:__ While baking, this value will be rounded down to the nearest multiple of @cell/height@.
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

-- | The maximum slope that is considered walkable, in degrees.
bindNavigationMesh_get_agent_max_slope :: MethodBind
bindNavigationMesh_get_agent_max_slope
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_max_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum slope that is considered walkable, in degrees.
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

-- | The distance to erode/shrink the walkable area of the heightfield away from obstructions.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
bindNavigationMesh_get_agent_radius :: MethodBind
bindNavigationMesh_get_agent_radius
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_agent_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to erode/shrink the walkable area of the heightfield away from obstructions.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
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

-- | The Y axis cell size to use for fields.
bindNavigationMesh_get_cell_height :: MethodBind
bindNavigationMesh_get_cell_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Y axis cell size to use for fields.
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

-- | The XZ plane cell size to use for fields.
bindNavigationMesh_get_cell_size :: MethodBind
bindNavigationMesh_get_cell_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The XZ plane cell size to use for fields.
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

-- | The physics layers to scan for static colliders.
--   			Only used when @geometry/parsed_geometry_type@ is @PARSED_GEOMETRY_STATIC_COLLIDERS@ or @PARSED_GEOMETRY_BOTH@.
bindNavigationMesh_get_collision_mask :: MethodBind
bindNavigationMesh_get_collision_mask
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers to scan for static colliders.
--   			Only used when @geometry/parsed_geometry_type@ is @PARSED_GEOMETRY_STATIC_COLLIDERS@ or @PARSED_GEOMETRY_BOTH@.
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

-- | Returns whether the specified @bit@ of the @geometry/collision_mask@ is set.
bindNavigationMesh_get_collision_mask_bit :: MethodBind
bindNavigationMesh_get_collision_mask_bit
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the specified @bit@ of the @geometry/collision_mask@ is set.
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

-- | The sampling distance to use when generating the detail mesh, in cell unit.
bindNavigationMesh_get_detail_sample_distance :: MethodBind
bindNavigationMesh_get_detail_sample_distance
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_detail_sample_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sampling distance to use when generating the detail mesh, in cell unit.
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

-- | The maximum distance the detail mesh surface should deviate from heightfield, in cell unit.
bindNavigationMesh_get_detail_sample_max_error :: MethodBind
bindNavigationMesh_get_detail_sample_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_detail_sample_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance the detail mesh surface should deviate from heightfield, in cell unit.
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

-- | The maximum distance a simplfied contour's border edges should deviate the original raw contour.
bindNavigationMesh_get_edge_max_error :: MethodBind
bindNavigationMesh_get_edge_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_edge_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance a simplfied contour's border edges should deviate the original raw contour.
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

-- | The maximum allowed length for contour edges along the border of the mesh.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
bindNavigationMesh_get_edge_max_length :: MethodBind
bindNavigationMesh_get_edge_max_length
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_edge_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum allowed length for contour edges along the border of the mesh.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
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

-- | If @true@, marks spans that are ledges as non-walkable.
bindNavigationMesh_get_filter_ledge_spans :: MethodBind
bindNavigationMesh_get_filter_ledge_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_filter_ledge_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, marks spans that are ledges as non-walkable.
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

-- | If @true@, marks non-walkable spans as walkable if their maximum is within @agent/max_climb@ of a walkable neighbor.
bindNavigationMesh_get_filter_low_hanging_obstacles :: MethodBind
bindNavigationMesh_get_filter_low_hanging_obstacles
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_filter_low_hanging_obstacles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, marks non-walkable spans as walkable if their maximum is within @agent/max_climb@ of a walkable neighbor.
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

-- | If @true@, marks walkable spans as not walkable if the clearance above the span is less than @agent/height@.
bindNavigationMesh_get_filter_walkable_low_height_spans ::
                                                        MethodBind
bindNavigationMesh_get_filter_walkable_low_height_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_filter_walkable_low_height_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, marks walkable spans as not walkable if the clearance above the span is less than @agent/height@.
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

-- | Determines which type of nodes will be parsed as geometry. See @enum ParsedGeometryType@ for possible values.
bindNavigationMesh_get_parsed_geometry_type :: MethodBind
bindNavigationMesh_get_parsed_geometry_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_parsed_geometry_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines which type of nodes will be parsed as geometry. See @enum ParsedGeometryType@ for possible values.
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

-- | Returns a @PoolIntArray@ containing the indices of the vertices of a created polygon.
bindNavigationMesh_get_polygon :: MethodBind
bindNavigationMesh_get_polygon
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @PoolIntArray@ containing the indices of the vertices of a created polygon.
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

-- | Returns the number of polygons in the navigation mesh.
bindNavigationMesh_get_polygon_count :: MethodBind
bindNavigationMesh_get_polygon_count
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_polygon_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of polygons in the navigation mesh.
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

-- | Any regions with a size smaller than this will be merged with larger regions if possible.
--   			__Note:__ This value will be squared to calculate the number of cells. For example, a value of 20 will set the number of cells to 400.
bindNavigationMesh_get_region_merge_size :: MethodBind
bindNavigationMesh_get_region_merge_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_region_merge_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Any regions with a size smaller than this will be merged with larger regions if possible.
--   			__Note:__ This value will be squared to calculate the number of cells. For example, a value of 20 will set the number of cells to 400.
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

-- | The minimum size of a region for it to be created.
--   			__Note:__ This value will be squared to calculate the minimum number of cells allowed to form isolated island areas. For example, a value of 8 will set the number of cells to 64.
bindNavigationMesh_get_region_min_size :: MethodBind
bindNavigationMesh_get_region_min_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_region_min_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum size of a region for it to be created.
--   			__Note:__ This value will be squared to calculate the minimum number of cells allowed to form isolated island areas. For example, a value of 8 will set the number of cells to 64.
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

-- | Partitioning algorithm for creating the navigation mesh polys. See @enum SamplePartitionType@ for possible values.
bindNavigationMesh_get_sample_partition_type :: MethodBind
bindNavigationMesh_get_sample_partition_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_sample_partition_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Partitioning algorithm for creating the navigation mesh polys. See @enum SamplePartitionType@ for possible values.
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

-- | The source of the geometry used when baking. See @enum SourceGeometryMode@ for possible values.
bindNavigationMesh_get_source_geometry_mode :: MethodBind
bindNavigationMesh_get_source_geometry_mode
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_source_geometry_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The source of the geometry used when baking. See @enum SourceGeometryMode@ for possible values.
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

-- | The name of the group to scan for geometry.
--   			Only used when @geometry/source_geometry_mode@ is @SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN@ or @SOURCE_GEOMETRY_GROUPS_EXPLICIT@.
bindNavigationMesh_get_source_group_name :: MethodBind
bindNavigationMesh_get_source_group_name
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_source_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the group to scan for geometry.
--   			Only used when @geometry/source_geometry_mode@ is @SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN@ or @SOURCE_GEOMETRY_GROUPS_EXPLICIT@.
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

-- | Returns a @PoolVector3Array@ containing all the vertices being used to create the polygons.
bindNavigationMesh_get_vertices :: MethodBind
bindNavigationMesh_get_vertices
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_vertices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @PoolVector3Array@ containing all the vertices being used to create the polygons.
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

-- | The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process.
bindNavigationMesh_get_verts_per_poly :: MethodBind
bindNavigationMesh_get_verts_per_poly
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "get_verts_per_poly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process.
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

-- | The minimum floor to ceiling height that will still allow the floor area to be considered walkable.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/height@.
bindNavigationMesh_set_agent_height :: MethodBind
bindNavigationMesh_set_agent_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum floor to ceiling height that will still allow the floor area to be considered walkable.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/height@.
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

-- | The minimum ledge height that is considered to still be traversable.
--   			__Note:__ While baking, this value will be rounded down to the nearest multiple of @cell/height@.
bindNavigationMesh_set_agent_max_climb :: MethodBind
bindNavigationMesh_set_agent_max_climb
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_max_climb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum ledge height that is considered to still be traversable.
--   			__Note:__ While baking, this value will be rounded down to the nearest multiple of @cell/height@.
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

-- | The maximum slope that is considered walkable, in degrees.
bindNavigationMesh_set_agent_max_slope :: MethodBind
bindNavigationMesh_set_agent_max_slope
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_max_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum slope that is considered walkable, in degrees.
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

-- | The distance to erode/shrink the walkable area of the heightfield away from obstructions.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
bindNavigationMesh_set_agent_radius :: MethodBind
bindNavigationMesh_set_agent_radius
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_agent_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to erode/shrink the walkable area of the heightfield away from obstructions.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
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

-- | The Y axis cell size to use for fields.
bindNavigationMesh_set_cell_height :: MethodBind
bindNavigationMesh_set_cell_height
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_cell_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Y axis cell size to use for fields.
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

-- | The XZ plane cell size to use for fields.
bindNavigationMesh_set_cell_size :: MethodBind
bindNavigationMesh_set_cell_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The XZ plane cell size to use for fields.
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

-- | The physics layers to scan for static colliders.
--   			Only used when @geometry/parsed_geometry_type@ is @PARSED_GEOMETRY_STATIC_COLLIDERS@ or @PARSED_GEOMETRY_BOTH@.
bindNavigationMesh_set_collision_mask :: MethodBind
bindNavigationMesh_set_collision_mask
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers to scan for static colliders.
--   			Only used when @geometry/parsed_geometry_type@ is @PARSED_GEOMETRY_STATIC_COLLIDERS@ or @PARSED_GEOMETRY_BOTH@.
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

-- | If @value@ is @true@, sets the specified @bit@ in the @geometry/collision_mask@.
--   				If @value@ is @false@, clears the specified @bit@ in the @geometry/collision_mask@.
bindNavigationMesh_set_collision_mask_bit :: MethodBind
bindNavigationMesh_set_collision_mask_bit
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @value@ is @true@, sets the specified @bit@ in the @geometry/collision_mask@.
--   				If @value@ is @false@, clears the specified @bit@ in the @geometry/collision_mask@.
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

-- | The sampling distance to use when generating the detail mesh, in cell unit.
bindNavigationMesh_set_detail_sample_distance :: MethodBind
bindNavigationMesh_set_detail_sample_distance
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_detail_sample_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sampling distance to use when generating the detail mesh, in cell unit.
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

-- | The maximum distance the detail mesh surface should deviate from heightfield, in cell unit.
bindNavigationMesh_set_detail_sample_max_error :: MethodBind
bindNavigationMesh_set_detail_sample_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_detail_sample_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance the detail mesh surface should deviate from heightfield, in cell unit.
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

-- | The maximum distance a simplfied contour's border edges should deviate the original raw contour.
bindNavigationMesh_set_edge_max_error :: MethodBind
bindNavigationMesh_set_edge_max_error
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_edge_max_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum distance a simplfied contour's border edges should deviate the original raw contour.
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

-- | The maximum allowed length for contour edges along the border of the mesh.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
bindNavigationMesh_set_edge_max_length :: MethodBind
bindNavigationMesh_set_edge_max_length
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_edge_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum allowed length for contour edges along the border of the mesh.
--   			__Note:__ While baking, this value will be rounded up to the nearest multiple of @cell/size@.
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

-- | If @true@, marks spans that are ledges as non-walkable.
bindNavigationMesh_set_filter_ledge_spans :: MethodBind
bindNavigationMesh_set_filter_ledge_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_filter_ledge_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, marks spans that are ledges as non-walkable.
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

-- | If @true@, marks non-walkable spans as walkable if their maximum is within @agent/max_climb@ of a walkable neighbor.
bindNavigationMesh_set_filter_low_hanging_obstacles :: MethodBind
bindNavigationMesh_set_filter_low_hanging_obstacles
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_filter_low_hanging_obstacles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, marks non-walkable spans as walkable if their maximum is within @agent/max_climb@ of a walkable neighbor.
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

-- | If @true@, marks walkable spans as not walkable if the clearance above the span is less than @agent/height@.
bindNavigationMesh_set_filter_walkable_low_height_spans ::
                                                        MethodBind
bindNavigationMesh_set_filter_walkable_low_height_spans
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_filter_walkable_low_height_spans" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, marks walkable spans as not walkable if the clearance above the span is less than @agent/height@.
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

-- | Determines which type of nodes will be parsed as geometry. See @enum ParsedGeometryType@ for possible values.
bindNavigationMesh_set_parsed_geometry_type :: MethodBind
bindNavigationMesh_set_parsed_geometry_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_parsed_geometry_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines which type of nodes will be parsed as geometry. See @enum ParsedGeometryType@ for possible values.
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

-- | Any regions with a size smaller than this will be merged with larger regions if possible.
--   			__Note:__ This value will be squared to calculate the number of cells. For example, a value of 20 will set the number of cells to 400.
bindNavigationMesh_set_region_merge_size :: MethodBind
bindNavigationMesh_set_region_merge_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_region_merge_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Any regions with a size smaller than this will be merged with larger regions if possible.
--   			__Note:__ This value will be squared to calculate the number of cells. For example, a value of 20 will set the number of cells to 400.
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

-- | The minimum size of a region for it to be created.
--   			__Note:__ This value will be squared to calculate the minimum number of cells allowed to form isolated island areas. For example, a value of 8 will set the number of cells to 64.
bindNavigationMesh_set_region_min_size :: MethodBind
bindNavigationMesh_set_region_min_size
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_region_min_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum size of a region for it to be created.
--   			__Note:__ This value will be squared to calculate the minimum number of cells allowed to form isolated island areas. For example, a value of 8 will set the number of cells to 64.
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

-- | Partitioning algorithm for creating the navigation mesh polys. See @enum SamplePartitionType@ for possible values.
bindNavigationMesh_set_sample_partition_type :: MethodBind
bindNavigationMesh_set_sample_partition_type
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_sample_partition_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Partitioning algorithm for creating the navigation mesh polys. See @enum SamplePartitionType@ for possible values.
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

-- | The source of the geometry used when baking. See @enum SourceGeometryMode@ for possible values.
bindNavigationMesh_set_source_geometry_mode :: MethodBind
bindNavigationMesh_set_source_geometry_mode
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_source_geometry_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The source of the geometry used when baking. See @enum SourceGeometryMode@ for possible values.
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

-- | The name of the group to scan for geometry.
--   			Only used when @geometry/source_geometry_mode@ is @SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN@ or @SOURCE_GEOMETRY_GROUPS_EXPLICIT@.
bindNavigationMesh_set_source_group_name :: MethodBind
bindNavigationMesh_set_source_group_name
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_source_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the group to scan for geometry.
--   			Only used when @geometry/source_geometry_mode@ is @SOURCE_GEOMETRY_GROUPS_WITH_CHILDREN@ or @SOURCE_GEOMETRY_GROUPS_EXPLICIT@.
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

-- | Sets the vertices that can be then indexed to create polygons with the @method add_polygon@ method.
bindNavigationMesh_set_vertices :: MethodBind
bindNavigationMesh_set_vertices
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_vertices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the vertices that can be then indexed to create polygons with the @method add_polygon@ method.
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

-- | The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process.
bindNavigationMesh_set_verts_per_poly :: MethodBind
bindNavigationMesh_set_verts_per_poly
  = unsafePerformIO $
      withCString "NavigationMesh" $
        \ clsNamePtr ->
          withCString "set_verts_per_poly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of vertices allowed for polygons generated during the contour to polygon conversion process.
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