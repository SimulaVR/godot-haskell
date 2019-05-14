{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TileMap
       (Godot.Core.TileMap._MODE_CUSTOM,
        Godot.Core.TileMap._HALF_OFFSET_Y, Godot.Core.TileMap._MODE_SQUARE,
        Godot.Core.TileMap._TILE_ORIGIN_BOTTOM_LEFT,
        Godot.Core.TileMap._TILE_ORIGIN_CENTER,
        Godot.Core.TileMap._HALF_OFFSET_DISABLED,
        Godot.Core.TileMap._TILE_ORIGIN_TOP_LEFT,
        Godot.Core.TileMap._MODE_ISOMETRIC,
        Godot.Core.TileMap._INVALID_CELL,
        Godot.Core.TileMap._HALF_OFFSET_X,
        Godot.Core.TileMap.sig_settings_changed,
        Godot.Core.TileMap.set_tileset, Godot.Core.TileMap.get_tileset,
        Godot.Core.TileMap.set_mode, Godot.Core.TileMap.get_mode,
        Godot.Core.TileMap.set_half_offset,
        Godot.Core.TileMap.get_half_offset,
        Godot.Core.TileMap.set_custom_transform,
        Godot.Core.TileMap.get_custom_transform,
        Godot.Core.TileMap.set_cell_size, Godot.Core.TileMap.get_cell_size,
        Godot.Core.TileMap._set_old_cell_size,
        Godot.Core.TileMap._get_old_cell_size,
        Godot.Core.TileMap.set_quadrant_size,
        Godot.Core.TileMap.get_quadrant_size,
        Godot.Core.TileMap.set_tile_origin,
        Godot.Core.TileMap.get_tile_origin, Godot.Core.TileMap.set_clip_uv,
        Godot.Core.TileMap.get_clip_uv, Godot.Core.TileMap.set_y_sort_mode,
        Godot.Core.TileMap.is_y_sort_mode_enabled,
        Godot.Core.TileMap.set_collision_use_kinematic,
        Godot.Core.TileMap.get_collision_use_kinematic,
        Godot.Core.TileMap.set_collision_layer,
        Godot.Core.TileMap.get_collision_layer,
        Godot.Core.TileMap.set_collision_mask,
        Godot.Core.TileMap.get_collision_mask,
        Godot.Core.TileMap.set_collision_layer_bit,
        Godot.Core.TileMap.get_collision_layer_bit,
        Godot.Core.TileMap.set_collision_mask_bit,
        Godot.Core.TileMap.get_collision_mask_bit,
        Godot.Core.TileMap.set_collision_friction,
        Godot.Core.TileMap.get_collision_friction,
        Godot.Core.TileMap.set_collision_bounce,
        Godot.Core.TileMap.get_collision_bounce,
        Godot.Core.TileMap.set_occluder_light_mask,
        Godot.Core.TileMap.get_occluder_light_mask,
        Godot.Core.TileMap.set_cell, Godot.Core.TileMap.set_cellv,
        Godot.Core.TileMap._set_celld, Godot.Core.TileMap.get_cell,
        Godot.Core.TileMap.get_cellv, Godot.Core.TileMap.is_cell_x_flipped,
        Godot.Core.TileMap.is_cell_y_flipped,
        Godot.Core.TileMap.is_cell_transposed,
        Godot.Core.TileMap.get_cell_autotile_coord,
        Godot.Core.TileMap.fix_invalid_tiles, Godot.Core.TileMap.clear,
        Godot.Core.TileMap.get_used_cells,
        Godot.Core.TileMap.get_used_cells_by_id,
        Godot.Core.TileMap.get_used_rect, Godot.Core.TileMap.map_to_world,
        Godot.Core.TileMap.world_to_map,
        Godot.Core.TileMap._clear_quadrants,
        Godot.Core.TileMap._recreate_quadrants,
        Godot.Core.TileMap.update_dirty_quadrants,
        Godot.Core.TileMap.update_bitmask_area,
        Godot.Core.TileMap.update_bitmask_region,
        Godot.Core.TileMap._set_tile_data,
        Godot.Core.TileMap._get_tile_data)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_CUSTOM :: Int
_MODE_CUSTOM = 2

_HALF_OFFSET_Y :: Int
_HALF_OFFSET_Y = 1

_MODE_SQUARE :: Int
_MODE_SQUARE = 0

_TILE_ORIGIN_BOTTOM_LEFT :: Int
_TILE_ORIGIN_BOTTOM_LEFT = 2

_TILE_ORIGIN_CENTER :: Int
_TILE_ORIGIN_CENTER = 1

_HALF_OFFSET_DISABLED :: Int
_HALF_OFFSET_DISABLED = 2

_TILE_ORIGIN_TOP_LEFT :: Int
_TILE_ORIGIN_TOP_LEFT = 0

_MODE_ISOMETRIC :: Int
_MODE_ISOMETRIC = 1

_INVALID_CELL :: Int
_INVALID_CELL = -1

_HALF_OFFSET_X :: Int
_HALF_OFFSET_X = 0

-- | Emitted when a tilemap setting has changed.
sig_settings_changed :: Godot.Internal.Dispatch.Signal TileMap
sig_settings_changed
  = Godot.Internal.Dispatch.Signal "settings_changed"

{-# NOINLINE bindTileMap_set_tileset #-}

-- | The assigned [TileSet].
bindTileMap_set_tileset :: MethodBind
bindTileMap_set_tileset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_tileset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The assigned [TileSet].
set_tileset ::
              (TileMap :< cls, Object :< cls) => cls -> TileSet -> IO ()
set_tileset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_tileset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_tileset #-}

-- | The assigned [TileSet].
bindTileMap_get_tileset :: MethodBind
bindTileMap_get_tileset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_tileset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The assigned [TileSet].
get_tileset :: (TileMap :< cls, Object :< cls) => cls -> IO TileSet
get_tileset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_tileset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_mode #-}

-- | The TileMap orientation mode. Uses MODE_* constants. Default value: MODE_SQUARE.
bindTileMap_set_mode :: MethodBind
bindTileMap_set_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap orientation mode. Uses MODE_* constants. Default value: MODE_SQUARE.
set_mode :: (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_mode #-}

-- | The TileMap orientation mode. Uses MODE_* constants. Default value: MODE_SQUARE.
bindTileMap_get_mode :: MethodBind
bindTileMap_get_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap orientation mode. Uses MODE_* constants. Default value: MODE_SQUARE.
get_mode :: (TileMap :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_half_offset #-}

-- | Amount to offset alternating tiles. Uses HALF_OFFSET_* constants. Default value: HALF_OFFSET_DISABLED.
bindTileMap_set_half_offset :: MethodBind
bindTileMap_set_half_offset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_half_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to offset alternating tiles. Uses HALF_OFFSET_* constants. Default value: HALF_OFFSET_DISABLED.
set_half_offset ::
                  (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_half_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_half_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_half_offset #-}

-- | Amount to offset alternating tiles. Uses HALF_OFFSET_* constants. Default value: HALF_OFFSET_DISABLED.
bindTileMap_get_half_offset :: MethodBind
bindTileMap_get_half_offset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_half_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to offset alternating tiles. Uses HALF_OFFSET_* constants. Default value: HALF_OFFSET_DISABLED.
get_half_offset :: (TileMap :< cls, Object :< cls) => cls -> IO Int
get_half_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_half_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_custom_transform #-}

-- | The custom [Transform2D] to be applied to the TileMap's cells.
bindTileMap_set_custom_transform :: MethodBind
bindTileMap_set_custom_transform
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_custom_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [Transform2D] to be applied to the TileMap's cells.
set_custom_transform ::
                       (TileMap :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_custom_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_custom_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_custom_transform #-}

-- | The custom [Transform2D] to be applied to the TileMap's cells.
bindTileMap_get_custom_transform :: MethodBind
bindTileMap_get_custom_transform
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_custom_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [Transform2D] to be applied to the TileMap's cells.
get_custom_transform ::
                       (TileMap :< cls, Object :< cls) => cls -> IO Transform2d
get_custom_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_custom_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_cell_size #-}

-- | The TileMap's cell size.
bindTileMap_set_cell_size :: MethodBind
bindTileMap_set_cell_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap's cell size.
set_cell_size ::
                (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_cell_size #-}

-- | The TileMap's cell size.
bindTileMap_get_cell_size :: MethodBind
bindTileMap_get_cell_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap's cell size.
get_cell_size ::
                (TileMap :< cls, Object :< cls) => cls -> IO Vector2
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__set_old_cell_size #-}

bindTileMap__set_old_cell_size :: MethodBind
bindTileMap__set_old_cell_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_set_old_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_old_cell_size ::
                     (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
_set_old_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__set_old_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__get_old_cell_size #-}

bindTileMap__get_old_cell_size :: MethodBind
bindTileMap__get_old_cell_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_get_old_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_old_cell_size ::
                     (TileMap :< cls, Object :< cls) => cls -> IO Int
_get_old_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__get_old_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_quadrant_size #-}

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size. Default value: 16.
bindTileMap_set_quadrant_size :: MethodBind
bindTileMap_set_quadrant_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_quadrant_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size. Default value: 16.
set_quadrant_size ::
                    (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_quadrant_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_quadrant_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_quadrant_size #-}

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size. Default value: 16.
bindTileMap_get_quadrant_size :: MethodBind
bindTileMap_get_quadrant_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_quadrant_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size. Default value: 16.
get_quadrant_size ::
                    (TileMap :< cls, Object :< cls) => cls -> IO Int
get_quadrant_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_quadrant_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_tile_origin #-}

-- | Position for tile origin. Uses TILE_ORIGIN_* constants. Default value: TILE_ORIGIN_TOP_LEFT.
bindTileMap_set_tile_origin :: MethodBind
bindTileMap_set_tile_origin
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_tile_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position for tile origin. Uses TILE_ORIGIN_* constants. Default value: TILE_ORIGIN_TOP_LEFT.
set_tile_origin ::
                  (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_tile_origin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_tile_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_tile_origin #-}

-- | Position for tile origin. Uses TILE_ORIGIN_* constants. Default value: TILE_ORIGIN_TOP_LEFT.
bindTileMap_get_tile_origin :: MethodBind
bindTileMap_get_tile_origin
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_tile_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position for tile origin. Uses TILE_ORIGIN_* constants. Default value: TILE_ORIGIN_TOP_LEFT.
get_tile_origin :: (TileMap :< cls, Object :< cls) => cls -> IO Int
get_tile_origin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_tile_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_clip_uv #-}

bindTileMap_set_clip_uv :: MethodBind
bindTileMap_set_clip_uv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_clip_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_clip_uv ::
              (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_clip_uv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_clip_uv #-}

bindTileMap_get_clip_uv :: MethodBind
bindTileMap_get_clip_uv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_clip_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_clip_uv :: (TileMap :< cls, Object :< cls) => cls -> IO Bool
get_clip_uv cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_clip_uv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_y_sort_mode #-}

-- | If [code]true[/code], the TileMap's children will be drawn in order of their Y coordinate. Default value: [code]false[/code].
bindTileMap_set_y_sort_mode :: MethodBind
bindTileMap_set_y_sort_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_y_sort_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the TileMap's children will be drawn in order of their Y coordinate. Default value: [code]false[/code].
set_y_sort_mode ::
                  (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_y_sort_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_y_sort_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_is_y_sort_mode_enabled #-}

-- | If [code]true[/code], the TileMap's children will be drawn in order of their Y coordinate. Default value: [code]false[/code].
bindTileMap_is_y_sort_mode_enabled :: MethodBind
bindTileMap_is_y_sort_mode_enabled
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_y_sort_mode_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the TileMap's children will be drawn in order of their Y coordinate. Default value: [code]false[/code].
is_y_sort_mode_enabled ::
                         (TileMap :< cls, Object :< cls) => cls -> IO Bool
is_y_sort_mode_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_y_sort_mode_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_use_kinematic #-}

-- | If [code]true[/code], TileMap collisions will be handled as a kinematic body. If [code]false[/code], collisions will be handled as static body. Default value: [code]false[/code].
bindTileMap_set_collision_use_kinematic :: MethodBind
bindTileMap_set_collision_use_kinematic
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_use_kinematic" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], TileMap collisions will be handled as a kinematic body. If [code]false[/code], collisions will be handled as static body. Default value: [code]false[/code].
set_collision_use_kinematic ::
                              (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collision_use_kinematic cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_use_kinematic
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_use_kinematic #-}

-- | If [code]true[/code], TileMap collisions will be handled as a kinematic body. If [code]false[/code], collisions will be handled as static body. Default value: [code]false[/code].
bindTileMap_get_collision_use_kinematic :: MethodBind
bindTileMap_get_collision_use_kinematic
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_use_kinematic" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], TileMap collisions will be handled as a kinematic body. If [code]false[/code], collisions will be handled as static body. Default value: [code]false[/code].
get_collision_use_kinematic ::
                              (TileMap :< cls, Object :< cls) => cls -> IO Bool
get_collision_use_kinematic cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_use_kinematic
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_layer #-}

-- | The collision layer(s) for all colliders in the TileMap.
bindTileMap_set_collision_layer :: MethodBind
bindTileMap_set_collision_layer
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision layer(s) for all colliders in the TileMap.
set_collision_layer ::
                      (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_layer #-}

-- | The collision layer(s) for all colliders in the TileMap.
bindTileMap_get_collision_layer :: MethodBind
bindTileMap_get_collision_layer
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision layer(s) for all colliders in the TileMap.
get_collision_layer ::
                      (TileMap :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_mask #-}

-- | The collision mask(s) for all colliders in the TileMap.
bindTileMap_set_collision_mask :: MethodBind
bindTileMap_set_collision_mask
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision mask(s) for all colliders in the TileMap.
set_collision_mask ::
                     (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_mask #-}

-- | The collision mask(s) for all colliders in the TileMap.
bindTileMap_get_collision_mask :: MethodBind
bindTileMap_get_collision_mask
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision mask(s) for all colliders in the TileMap.
get_collision_mask ::
                     (TileMap :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_layer_bit #-}

-- | Sets the given collision layer bit.
bindTileMap_set_collision_layer_bit :: MethodBind
bindTileMap_set_collision_layer_bit
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given collision layer bit.
set_collision_layer_bit ::
                          (TileMap :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_layer_bit #-}

-- | Returns [code]true[/code] if the given collision layer bit is set.
bindTileMap_get_collision_layer_bit :: MethodBind
bindTileMap_get_collision_layer_bit
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given collision layer bit is set.
get_collision_layer_bit ::
                          (TileMap :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_mask_bit #-}

-- | Sets the given collision mask bit.
bindTileMap_set_collision_mask_bit :: MethodBind
bindTileMap_set_collision_mask_bit
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given collision mask bit.
set_collision_mask_bit ::
                         (TileMap :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_mask_bit #-}

-- | Returns [code]true[/code] if the given collision mask bit is set.
bindTileMap_get_collision_mask_bit :: MethodBind
bindTileMap_get_collision_mask_bit
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given collision mask bit is set.
get_collision_mask_bit ::
                         (TileMap :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_friction #-}

-- | Friction value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 1.
bindTileMap_set_collision_friction :: MethodBind
bindTileMap_set_collision_friction
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Friction value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 1.
set_collision_friction ::
                         (TileMap :< cls, Object :< cls) => cls -> Float -> IO ()
set_collision_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_friction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_friction #-}

-- | Friction value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 1.
bindTileMap_get_collision_friction :: MethodBind
bindTileMap_get_collision_friction
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Friction value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 1.
get_collision_friction ::
                         (TileMap :< cls, Object :< cls) => cls -> IO Float
get_collision_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_friction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_collision_bounce #-}

-- | Bounce value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 0.
bindTileMap_set_collision_bounce :: MethodBind
bindTileMap_set_collision_bounce
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bounce value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 0.
set_collision_bounce ::
                       (TileMap :< cls, Object :< cls) => cls -> Float -> IO ()
set_collision_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_bounce
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_collision_bounce #-}

-- | Bounce value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 0.
bindTileMap_get_collision_bounce :: MethodBind
bindTileMap_get_collision_bounce
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bounce value for static body collisions (see [code]collision_use_kinematic[/code]). Default value: 0.
get_collision_bounce ::
                       (TileMap :< cls, Object :< cls) => cls -> IO Float
get_collision_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_bounce
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_occluder_light_mask #-}

-- | The light mask assigned to all light occluders in the TileMap. The TileSet's light occluders will cast shadows only from Light2D(s) that have the same light mask(s).
bindTileMap_set_occluder_light_mask :: MethodBind
bindTileMap_set_occluder_light_mask
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_occluder_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask assigned to all light occluders in the TileMap. The TileSet's light occluders will cast shadows only from Light2D(s) that have the same light mask(s).
set_occluder_light_mask ::
                          (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_occluder_light_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_occluder_light_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_occluder_light_mask #-}

-- | The light mask assigned to all light occluders in the TileMap. The TileSet's light occluders will cast shadows only from Light2D(s) that have the same light mask(s).
bindTileMap_get_occluder_light_mask :: MethodBind
bindTileMap_get_occluder_light_mask
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_occluder_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask assigned to all light occluders in the TileMap. The TileSet's light occluders will cast shadows only from Light2D(s) that have the same light mask(s).
get_occluder_light_mask ::
                          (TileMap :< cls, Object :< cls) => cls -> IO Int
get_occluder_light_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_occluder_light_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_cell #-}

-- | Sets the tile index for the cell given by a Vector2.
--   				An index of [code]-1[/code] clears the cell.
--   				Optionally, the tile can also be flipped, transposed, or given autotile coordinates.
--   				Note that data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call [method update_dirty_quadrants].
bindTileMap_set_cell :: MethodBind
bindTileMap_set_cell
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_cell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile index for the cell given by a Vector2.
--   				An index of [code]-1[/code] clears the cell.
--   				Optionally, the tile can also be flipped, transposed, or given autotile coordinates.
--   				Note that data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call [method update_dirty_quadrants].
set_cell ::
           (TileMap :< cls, Object :< cls) =>
           cls ->
             Int -> Int -> Int -> Bool -> Bool -> Bool -> Vector2 -> IO ()
set_cell cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_cell (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_set_cellv #-}

-- | Sets the tile index for the given cell.
--   				An index of [code]-1[/code] clears the cell.
--   				Optionally, the tile can also be flipped or transposed.
--   				Note that data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call [method update_dirty_quadrants].
bindTileMap_set_cellv :: MethodBind
bindTileMap_set_cellv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_cellv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile index for the given cell.
--   				An index of [code]-1[/code] clears the cell.
--   				Optionally, the tile can also be flipped or transposed.
--   				Note that data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call [method update_dirty_quadrants].
set_cellv ::
            (TileMap :< cls, Object :< cls) =>
            cls -> Vector2 -> Int -> Bool -> Bool -> Bool -> IO ()
set_cellv cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_cellv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__set_celld #-}

bindTileMap__set_celld :: MethodBind
bindTileMap__set_celld
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_set_celld" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_celld ::
             (TileMap :< cls, Object :< cls) =>
             cls -> Vector2 -> Dictionary -> IO ()
_set_celld cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__set_celld (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_cell #-}

-- | Returns the tile index of the given cell. If no tile exists in the cell, returns [constant INVALID_CELL].
bindTileMap_get_cell :: MethodBind
bindTileMap_get_cell
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile index of the given cell. If no tile exists in the cell, returns [constant INVALID_CELL].
get_cell ::
           (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Int
get_cell cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_cell (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_cellv #-}

-- | Returns the tile index of the cell given by a Vector2. If no tile exists in the cell, returns [constant INVALID_CELL].
bindTileMap_get_cellv :: MethodBind
bindTileMap_get_cellv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cellv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile index of the cell given by a Vector2. If no tile exists in the cell, returns [constant INVALID_CELL].
get_cellv ::
            (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO Int
get_cellv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_cellv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_is_cell_x_flipped #-}

-- | Returns [code]true[/code] if the given cell is flipped in the x axis.
bindTileMap_is_cell_x_flipped :: MethodBind
bindTileMap_is_cell_x_flipped
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_cell_x_flipped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given cell is flipped in the x axis.
is_cell_x_flipped ::
                    (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_cell_x_flipped cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_cell_x_flipped (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_is_cell_y_flipped #-}

-- | Returns [code]true[/code] if the given cell is flipped in the y axis.
bindTileMap_is_cell_y_flipped :: MethodBind
bindTileMap_is_cell_y_flipped
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_cell_y_flipped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given cell is flipped in the y axis.
is_cell_y_flipped ::
                    (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_cell_y_flipped cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_cell_y_flipped (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_is_cell_transposed #-}

-- | Returns [code]true[/code] if the given cell is transposed, i.e. the x and y axes are swapped.
bindTileMap_is_cell_transposed :: MethodBind
bindTileMap_is_cell_transposed
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_cell_transposed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given cell is transposed, i.e. the x and y axes are swapped.
is_cell_transposed ::
                     (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_cell_transposed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_cell_transposed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_cell_autotile_coord #-}

bindTileMap_get_cell_autotile_coord :: MethodBind
bindTileMap_get_cell_autotile_coord
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cell_autotile_coord" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_autotile_coord ::
                          (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Vector2
get_cell_autotile_coord cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_cell_autotile_coord
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_fix_invalid_tiles #-}

-- | Clears cells that do not exist in the tileset.
bindTileMap_fix_invalid_tiles :: MethodBind
bindTileMap_fix_invalid_tiles
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "fix_invalid_tiles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears cells that do not exist in the tileset.
fix_invalid_tiles ::
                    (TileMap :< cls, Object :< cls) => cls -> IO ()
fix_invalid_tiles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_fix_invalid_tiles (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_clear #-}

-- | Clears all cells.
bindTileMap_clear :: MethodBind
bindTileMap_clear
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all cells.
clear :: (TileMap :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_used_cells #-}

-- | Returns a [Vector2] array with the positions of all cells containing a tile from the tileset (i.e. a tile index different from [code]-1[/code]).
bindTileMap_get_used_cells :: MethodBind
bindTileMap_get_used_cells
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_used_cells" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [Vector2] array with the positions of all cells containing a tile from the tileset (i.e. a tile index different from [code]-1[/code]).
get_used_cells ::
                 (TileMap :< cls, Object :< cls) => cls -> IO Array
get_used_cells cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_used_cells (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_used_cells_by_id #-}

-- | Returns an array of all cells with the given tile id.
bindTileMap_get_used_cells_by_id :: MethodBind
bindTileMap_get_used_cells_by_id
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_used_cells_by_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all cells with the given tile id.
get_used_cells_by_id ::
                       (TileMap :< cls, Object :< cls) => cls -> Int -> IO Array
get_used_cells_by_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_used_cells_by_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_get_used_rect #-}

-- | Returns a rectangle enclosing the used (non-empty) tiles of the map.
bindTileMap_get_used_rect :: MethodBind
bindTileMap_get_used_rect
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_used_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a rectangle enclosing the used (non-empty) tiles of the map.
get_used_rect :: (TileMap :< cls, Object :< cls) => cls -> IO Rect2
get_used_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_used_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_map_to_world #-}

-- | Returns the global position corresponding to the given tilemap (grid-based) coordinates.
--   				Optionally, the tilemap's half offset can be ignored.
bindTileMap_map_to_world :: MethodBind
bindTileMap_map_to_world
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "map_to_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the global position corresponding to the given tilemap (grid-based) coordinates.
--   				Optionally, the tilemap's half offset can be ignored.
map_to_world ::
               (TileMap :< cls, Object :< cls) =>
               cls -> Vector2 -> Bool -> IO Vector2
map_to_world cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_map_to_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_world_to_map #-}

-- | Returns the tilemap (grid-based) coordinates corresponding to the given local position.
bindTileMap_world_to_map :: MethodBind
bindTileMap_world_to_map
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "world_to_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tilemap (grid-based) coordinates corresponding to the given local position.
world_to_map ::
               (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
world_to_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_world_to_map (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__clear_quadrants #-}

bindTileMap__clear_quadrants :: MethodBind
bindTileMap__clear_quadrants
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_clear_quadrants" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_clear_quadrants :: (TileMap :< cls, Object :< cls) => cls -> IO ()
_clear_quadrants cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__clear_quadrants (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__recreate_quadrants #-}

bindTileMap__recreate_quadrants :: MethodBind
bindTileMap__recreate_quadrants
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_recreate_quadrants" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_recreate_quadrants ::
                      (TileMap :< cls, Object :< cls) => cls -> IO ()
_recreate_quadrants cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__recreate_quadrants (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_update_dirty_quadrants #-}

-- | Updates the tile map's quadrants, allowing things such as navigation and collision shapes to be immediately used if modified.
bindTileMap_update_dirty_quadrants :: MethodBind
bindTileMap_update_dirty_quadrants
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "update_dirty_quadrants" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the tile map's quadrants, allowing things such as navigation and collision shapes to be immediately used if modified.
update_dirty_quadrants ::
                         (TileMap :< cls, Object :< cls) => cls -> IO ()
update_dirty_quadrants cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_update_dirty_quadrants
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_update_bitmask_area #-}

-- | Applies autotiling rules to the cell (and its adjacent cells) referenced by its grid-based x and y coordinates.
bindTileMap_update_bitmask_area :: MethodBind
bindTileMap_update_bitmask_area
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "update_bitmask_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies autotiling rules to the cell (and its adjacent cells) referenced by its grid-based x and y coordinates.
update_bitmask_area ::
                      (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO ()
update_bitmask_area cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_update_bitmask_area (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap_update_bitmask_region #-}

-- | Applies autotiling rules to the cells in the given region (specified by grid-based x and y coordinates).
--   				Calling with invalid (or missing) parameters applies autotiling rules for the entire tilemap.
bindTileMap_update_bitmask_region :: MethodBind
bindTileMap_update_bitmask_region
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "update_bitmask_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies autotiling rules to the cells in the given region (specified by grid-based x and y coordinates).
--   				Calling with invalid (or missing) parameters applies autotiling rules for the entire tilemap.
update_bitmask_region ::
                        (TileMap :< cls, Object :< cls) =>
                        cls -> Vector2 -> Vector2 -> IO ()
update_bitmask_region cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_update_bitmask_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__set_tile_data #-}

bindTileMap__set_tile_data :: MethodBind
bindTileMap__set_tile_data
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_set_tile_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_tile_data ::
                 (TileMap :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
_set_tile_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__set_tile_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileMap__get_tile_data #-}

bindTileMap__get_tile_data :: MethodBind
bindTileMap__get_tile_data
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "_get_tile_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_tile_data ::
                 (TileMap :< cls, Object :< cls) => cls -> IO PoolIntArray
_get_tile_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap__get_tile_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)