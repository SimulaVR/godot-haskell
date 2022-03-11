{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TileMap
       (Godot.Core.TileMap._MODE_CUSTOM,
        Godot.Core.TileMap._HALF_OFFSET_Y,
        Godot.Core.TileMap._HALF_OFFSET_NEGATIVE_X,
        Godot.Core.TileMap._MODE_SQUARE,
        Godot.Core.TileMap._HALF_OFFSET_NEGATIVE_Y,
        Godot.Core.TileMap._TILE_ORIGIN_BOTTOM_LEFT,
        Godot.Core.TileMap._TILE_ORIGIN_CENTER,
        Godot.Core.TileMap._HALF_OFFSET_DISABLED,
        Godot.Core.TileMap._TILE_ORIGIN_TOP_LEFT,
        Godot.Core.TileMap._MODE_ISOMETRIC,
        Godot.Core.TileMap._INVALID_CELL,
        Godot.Core.TileMap._HALF_OFFSET_X,
        Godot.Core.TileMap.sig_settings_changed,
        Godot.Core.TileMap._clear_quadrants,
        Godot.Core.TileMap._get_old_cell_size,
        Godot.Core.TileMap._get_tile_data,
        Godot.Core.TileMap._recreate_quadrants,
        Godot.Core.TileMap._set_celld,
        Godot.Core.TileMap._set_old_cell_size,
        Godot.Core.TileMap._set_tile_data, Godot.Core.TileMap.clear,
        Godot.Core.TileMap.fix_invalid_tiles, Godot.Core.TileMap.get_cell,
        Godot.Core.TileMap.get_cell_autotile_coord,
        Godot.Core.TileMap.get_cell_size, Godot.Core.TileMap.get_cellv,
        Godot.Core.TileMap.get_clip_uv,
        Godot.Core.TileMap.get_collision_bounce,
        Godot.Core.TileMap.get_collision_friction,
        Godot.Core.TileMap.get_collision_layer,
        Godot.Core.TileMap.get_collision_layer_bit,
        Godot.Core.TileMap.get_collision_mask,
        Godot.Core.TileMap.get_collision_mask_bit,
        Godot.Core.TileMap.get_collision_use_kinematic,
        Godot.Core.TileMap.get_collision_use_parent,
        Godot.Core.TileMap.get_custom_transform,
        Godot.Core.TileMap.get_half_offset, Godot.Core.TileMap.get_mode,
        Godot.Core.TileMap.get_occluder_light_mask,
        Godot.Core.TileMap.get_quadrant_size,
        Godot.Core.TileMap.get_tile_origin, Godot.Core.TileMap.get_tileset,
        Godot.Core.TileMap.get_used_cells,
        Godot.Core.TileMap.get_used_cells_by_id,
        Godot.Core.TileMap.get_used_rect,
        Godot.Core.TileMap.is_cell_transposed,
        Godot.Core.TileMap.is_cell_x_flipped,
        Godot.Core.TileMap.is_cell_y_flipped,
        Godot.Core.TileMap.is_centered_textures_enabled,
        Godot.Core.TileMap.is_compatibility_mode_enabled,
        Godot.Core.TileMap.is_y_sort_mode_enabled,
        Godot.Core.TileMap.map_to_world, Godot.Core.TileMap.set_cell,
        Godot.Core.TileMap.set_cell_size, Godot.Core.TileMap.set_cellv,
        Godot.Core.TileMap.set_centered_textures,
        Godot.Core.TileMap.set_clip_uv,
        Godot.Core.TileMap.set_collision_bounce,
        Godot.Core.TileMap.set_collision_friction,
        Godot.Core.TileMap.set_collision_layer,
        Godot.Core.TileMap.set_collision_layer_bit,
        Godot.Core.TileMap.set_collision_mask,
        Godot.Core.TileMap.set_collision_mask_bit,
        Godot.Core.TileMap.set_collision_use_kinematic,
        Godot.Core.TileMap.set_collision_use_parent,
        Godot.Core.TileMap.set_compatibility_mode,
        Godot.Core.TileMap.set_custom_transform,
        Godot.Core.TileMap.set_half_offset, Godot.Core.TileMap.set_mode,
        Godot.Core.TileMap.set_occluder_light_mask,
        Godot.Core.TileMap.set_quadrant_size,
        Godot.Core.TileMap.set_tile_origin, Godot.Core.TileMap.set_tileset,
        Godot.Core.TileMap.set_y_sort_mode,
        Godot.Core.TileMap.update_bitmask_area,
        Godot.Core.TileMap.update_bitmask_region,
        Godot.Core.TileMap.update_dirty_quadrants,
        Godot.Core.TileMap.world_to_map)
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
import Godot.Core.Node2D()

_MODE_CUSTOM :: Int
_MODE_CUSTOM = 2

_HALF_OFFSET_Y :: Int
_HALF_OFFSET_Y = 1

_HALF_OFFSET_NEGATIVE_X :: Int
_HALF_OFFSET_NEGATIVE_X = 3

_MODE_SQUARE :: Int
_MODE_SQUARE = 0

_HALF_OFFSET_NEGATIVE_Y :: Int
_HALF_OFFSET_NEGATIVE_Y = 4

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

instance NodeSignal TileMap "settings_changed" '[]

instance NodeProperty TileMap "cell_clip_uv" Bool 'False where
        nodeProperty
          = (get_clip_uv, wrapDroppingSetter set_clip_uv, Nothing)

instance NodeProperty TileMap "cell_custom_transform" Transform2d
           'False
         where
        nodeProperty
          = (get_custom_transform, wrapDroppingSetter set_custom_transform,
             Nothing)

instance NodeProperty TileMap "cell_half_offset" Int 'False where
        nodeProperty
          = (get_half_offset, wrapDroppingSetter set_half_offset, Nothing)

instance NodeProperty TileMap "cell_quadrant_size" Int 'False where
        nodeProperty
          = (get_quadrant_size, wrapDroppingSetter set_quadrant_size,
             Nothing)

instance NodeProperty TileMap "cell_size" Vector2 'False where
        nodeProperty
          = (get_cell_size, wrapDroppingSetter set_cell_size, Nothing)

instance NodeProperty TileMap "cell_tile_origin" Int 'False where
        nodeProperty
          = (get_tile_origin, wrapDroppingSetter set_tile_origin, Nothing)

instance NodeProperty TileMap "cell_y_sort" Bool 'False where
        nodeProperty
          = (is_y_sort_mode_enabled, wrapDroppingSetter set_y_sort_mode,
             Nothing)

instance NodeProperty TileMap "centered_textures" Bool 'False where
        nodeProperty
          = (is_centered_textures_enabled,
             wrapDroppingSetter set_centered_textures, Nothing)

instance NodeProperty TileMap "collision_bounce" Float 'False where
        nodeProperty
          = (get_collision_bounce, wrapDroppingSetter set_collision_bounce,
             Nothing)

instance NodeProperty TileMap "collision_friction" Float 'False
         where
        nodeProperty
          = (get_collision_friction,
             wrapDroppingSetter set_collision_friction, Nothing)

instance NodeProperty TileMap "collision_layer" Int 'False where
        nodeProperty
          = (get_collision_layer, wrapDroppingSetter set_collision_layer,
             Nothing)

instance NodeProperty TileMap "collision_mask" Int 'False where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty TileMap "collision_use_kinematic" Bool 'False
         where
        nodeProperty
          = (get_collision_use_kinematic,
             wrapDroppingSetter set_collision_use_kinematic, Nothing)

instance NodeProperty TileMap "collision_use_parent" Bool 'False
         where
        nodeProperty
          = (get_collision_use_parent,
             wrapDroppingSetter set_collision_use_parent, Nothing)

instance NodeProperty TileMap "compatibility_mode" Bool 'False
         where
        nodeProperty
          = (is_compatibility_mode_enabled,
             wrapDroppingSetter set_compatibility_mode, Nothing)

instance NodeProperty TileMap "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty TileMap "occluder_light_mask" Int 'False
         where
        nodeProperty
          = (get_occluder_light_mask,
             wrapDroppingSetter set_occluder_light_mask, Nothing)

instance NodeProperty TileMap "tile_set" TileSet 'False where
        nodeProperty
          = (get_tileset, wrapDroppingSetter set_tileset, Nothing)

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

instance NodeMethod TileMap "_clear_quadrants" '[] (IO ()) where
        nodeMethod = Godot.Core.TileMap._clear_quadrants

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

instance NodeMethod TileMap "_get_old_cell_size" '[] (IO Int) where
        nodeMethod = Godot.Core.TileMap._get_old_cell_size

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

instance NodeMethod TileMap "_get_tile_data" '[] (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.TileMap._get_tile_data

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

instance NodeMethod TileMap "_recreate_quadrants" '[] (IO ()) where
        nodeMethod = Godot.Core.TileMap._recreate_quadrants

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

instance NodeMethod TileMap "_set_celld" '[Vector2, Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap._set_celld

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

instance NodeMethod TileMap "_set_old_cell_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TileMap._set_old_cell_size

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

instance NodeMethod TileMap "_set_tile_data" '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap._set_tile_data

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

instance NodeMethod TileMap "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.TileMap.clear

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

instance NodeMethod TileMap "fix_invalid_tiles" '[] (IO ()) where
        nodeMethod = Godot.Core.TileMap.fix_invalid_tiles

{-# NOINLINE bindTileMap_get_cell #-}

-- | Returns the tile index of the given cell. If no tile exists in the cell, returns @INVALID_CELL@.
bindTileMap_get_cell :: MethodBind
bindTileMap_get_cell
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile index of the given cell. If no tile exists in the cell, returns @INVALID_CELL@.
get_cell ::
           (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Int
get_cell cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_cell (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_cell" '[Int, Int] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_cell

{-# NOINLINE bindTileMap_get_cell_autotile_coord #-}

-- | Returns the coordinate (subtile column and row) of the autotile variation in the tileset. Returns a zero vector if the cell doesn't have autotiling.
bindTileMap_get_cell_autotile_coord :: MethodBind
bindTileMap_get_cell_autotile_coord
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cell_autotile_coord" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the coordinate (subtile column and row) of the autotile variation in the tileset. Returns a zero vector if the cell doesn't have autotiling.
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

instance NodeMethod TileMap "get_cell_autotile_coord" '[Int, Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileMap.get_cell_autotile_coord

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

instance NodeMethod TileMap "get_cell_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.TileMap.get_cell_size

{-# NOINLINE bindTileMap_get_cellv #-}

-- | Returns the tile index of the cell given by a Vector2. If no tile exists in the cell, returns @INVALID_CELL@.
bindTileMap_get_cellv :: MethodBind
bindTileMap_get_cellv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_cellv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile index of the cell given by a Vector2. If no tile exists in the cell, returns @INVALID_CELL@.
get_cellv ::
            (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO Int
get_cellv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_cellv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_cellv" '[Vector2] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_cellv

{-# NOINLINE bindTileMap_get_clip_uv #-}

-- | If @true@, the cell's UVs will be clipped.
bindTileMap_get_clip_uv :: MethodBind
bindTileMap_get_clip_uv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_clip_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the cell's UVs will be clipped.
get_clip_uv :: (TileMap :< cls, Object :< cls) => cls -> IO Bool
get_clip_uv cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_clip_uv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_clip_uv" '[] (IO Bool) where
        nodeMethod = Godot.Core.TileMap.get_clip_uv

{-# NOINLINE bindTileMap_get_collision_bounce #-}

-- | Bounce value for static body collisions (see @collision_use_kinematic@).
bindTileMap_get_collision_bounce :: MethodBind
bindTileMap_get_collision_bounce
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bounce value for static body collisions (see @collision_use_kinematic@).
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

instance NodeMethod TileMap "get_collision_bounce" '[] (IO Float)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_bounce

{-# NOINLINE bindTileMap_get_collision_friction #-}

-- | Friction value for static body collisions (see @collision_use_kinematic@).
bindTileMap_get_collision_friction :: MethodBind
bindTileMap_get_collision_friction
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Friction value for static body collisions (see @collision_use_kinematic@).
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

instance NodeMethod TileMap "get_collision_friction" '[] (IO Float)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_friction

{-# NOINLINE bindTileMap_get_collision_layer #-}

-- | The collision layer(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindTileMap_get_collision_layer :: MethodBind
bindTileMap_get_collision_layer
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision layer(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_layer ::
                      (TileMap :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_collision_layer" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_layer

{-# NOINLINE bindTileMap_get_collision_layer_bit #-}

-- | Returns @true@ if the given collision layer bit is set.
bindTileMap_get_collision_layer_bit :: MethodBind
bindTileMap_get_collision_layer_bit
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given collision layer bit is set.
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

instance NodeMethod TileMap "get_collision_layer_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_layer_bit

{-# NOINLINE bindTileMap_get_collision_mask #-}

-- | The collision mask(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindTileMap_get_collision_mask :: MethodBind
bindTileMap_get_collision_mask
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision mask(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_mask ::
                     (TileMap :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_collision_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_collision_mask

{-# NOINLINE bindTileMap_get_collision_mask_bit #-}

-- | Returns @true@ if the given collision mask bit is set.
bindTileMap_get_collision_mask_bit :: MethodBind
bindTileMap_get_collision_mask_bit
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given collision mask bit is set.
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

instance NodeMethod TileMap "get_collision_mask_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_mask_bit

{-# NOINLINE bindTileMap_get_collision_use_kinematic #-}

-- | If @true@, TileMap collisions will be handled as a kinematic body. If @false@, collisions will be handled as static body.
bindTileMap_get_collision_use_kinematic :: MethodBind
bindTileMap_get_collision_use_kinematic
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_use_kinematic" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, TileMap collisions will be handled as a kinematic body. If @false@, collisions will be handled as static body.
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

instance NodeMethod TileMap "get_collision_use_kinematic" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_use_kinematic

{-# NOINLINE bindTileMap_get_collision_use_parent #-}

-- | If @true@, this tilemap's collision shape will be added to the collision shape of the parent. The parent has to be a @CollisionObject2D@.
bindTileMap_get_collision_use_parent :: MethodBind
bindTileMap_get_collision_use_parent
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_collision_use_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this tilemap's collision shape will be added to the collision shape of the parent. The parent has to be a @CollisionObject2D@.
get_collision_use_parent ::
                           (TileMap :< cls, Object :< cls) => cls -> IO Bool
get_collision_use_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_collision_use_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_collision_use_parent" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.get_collision_use_parent

{-# NOINLINE bindTileMap_get_custom_transform #-}

-- | The custom @Transform2D@ to be applied to the TileMap's cells.
bindTileMap_get_custom_transform :: MethodBind
bindTileMap_get_custom_transform
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_custom_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @Transform2D@ to be applied to the TileMap's cells.
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

instance NodeMethod TileMap "get_custom_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.TileMap.get_custom_transform

{-# NOINLINE bindTileMap_get_half_offset #-}

-- | Amount to offset alternating tiles. See @enum HalfOffset@ for possible values.
bindTileMap_get_half_offset :: MethodBind
bindTileMap_get_half_offset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_half_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to offset alternating tiles. See @enum HalfOffset@ for possible values.
get_half_offset :: (TileMap :< cls, Object :< cls) => cls -> IO Int
get_half_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_half_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_half_offset" '[] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_half_offset

{-# NOINLINE bindTileMap_get_mode #-}

-- | The TileMap orientation mode. See @enum Mode@ for possible values.
bindTileMap_get_mode :: MethodBind
bindTileMap_get_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap orientation mode. See @enum Mode@ for possible values.
get_mode :: (TileMap :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_mode

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

instance NodeMethod TileMap "get_occluder_light_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TileMap.get_occluder_light_mask

{-# NOINLINE bindTileMap_get_quadrant_size #-}

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size.
bindTileMap_get_quadrant_size :: MethodBind
bindTileMap_get_quadrant_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_quadrant_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size.
get_quadrant_size ::
                    (TileMap :< cls, Object :< cls) => cls -> IO Int
get_quadrant_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_quadrant_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_quadrant_size" '[] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_quadrant_size

{-# NOINLINE bindTileMap_get_tile_origin #-}

-- | Position for tile origin. See @enum TileOrigin@ for possible values.
bindTileMap_get_tile_origin :: MethodBind
bindTileMap_get_tile_origin
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_tile_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position for tile origin. See @enum TileOrigin@ for possible values.
get_tile_origin :: (TileMap :< cls, Object :< cls) => cls -> IO Int
get_tile_origin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_tile_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_tile_origin" '[] (IO Int) where
        nodeMethod = Godot.Core.TileMap.get_tile_origin

{-# NOINLINE bindTileMap_get_tileset #-}

-- | The assigned @TileSet@.
bindTileMap_get_tileset :: MethodBind
bindTileMap_get_tileset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_tileset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The assigned @TileSet@.
get_tileset :: (TileMap :< cls, Object :< cls) => cls -> IO TileSet
get_tileset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_tileset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_tileset" '[] (IO TileSet) where
        nodeMethod = Godot.Core.TileMap.get_tileset

{-# NOINLINE bindTileMap_get_used_cells #-}

-- | Returns a @Vector2@ array with the positions of all cells containing a tile from the tileset (i.e. a tile index different from @-1@).
bindTileMap_get_used_cells :: MethodBind
bindTileMap_get_used_cells
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_used_cells" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @Vector2@ array with the positions of all cells containing a tile from the tileset (i.e. a tile index different from @-1@).
get_used_cells ::
                 (TileMap :< cls, Object :< cls) => cls -> IO Array
get_used_cells cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_get_used_cells (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "get_used_cells" '[] (IO Array) where
        nodeMethod = Godot.Core.TileMap.get_used_cells

{-# NOINLINE bindTileMap_get_used_cells_by_id #-}

-- | Returns an array of all cells with the given tile index specified in @id@.
bindTileMap_get_used_cells_by_id :: MethodBind
bindTileMap_get_used_cells_by_id
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "get_used_cells_by_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all cells with the given tile index specified in @id@.
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

instance NodeMethod TileMap "get_used_cells_by_id" '[Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.TileMap.get_used_cells_by_id

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

instance NodeMethod TileMap "get_used_rect" '[] (IO Rect2) where
        nodeMethod = Godot.Core.TileMap.get_used_rect

{-# NOINLINE bindTileMap_is_cell_transposed #-}

-- | Returns @true@ if the given cell is transposed, i.e. the X and Y axes are swapped.
bindTileMap_is_cell_transposed :: MethodBind
bindTileMap_is_cell_transposed
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_cell_transposed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given cell is transposed, i.e. the X and Y axes are swapped.
is_cell_transposed ::
                     (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_cell_transposed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_cell_transposed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "is_cell_transposed" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.is_cell_transposed

{-# NOINLINE bindTileMap_is_cell_x_flipped #-}

-- | Returns @true@ if the given cell is flipped in the X axis.
bindTileMap_is_cell_x_flipped :: MethodBind
bindTileMap_is_cell_x_flipped
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_cell_x_flipped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given cell is flipped in the X axis.
is_cell_x_flipped ::
                    (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_cell_x_flipped cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_cell_x_flipped (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "is_cell_x_flipped" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.is_cell_x_flipped

{-# NOINLINE bindTileMap_is_cell_y_flipped #-}

-- | Returns @true@ if the given cell is flipped in the Y axis.
bindTileMap_is_cell_y_flipped :: MethodBind
bindTileMap_is_cell_y_flipped
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_cell_y_flipped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given cell is flipped in the Y axis.
is_cell_y_flipped ::
                    (TileMap :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_cell_y_flipped cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_cell_y_flipped (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "is_cell_y_flipped" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.is_cell_y_flipped

{-# NOINLINE bindTileMap_is_centered_textures_enabled #-}

-- | If @true@, the textures will be centered in the middle of each tile. This is useful for certain isometric or top-down modes when textures are made larger or smaller than the tiles (e.g. to avoid flickering on tile edges). The offset is still applied, but from the center of the tile. If used, @compatibility_mode@ is ignored.
--   			If @false@, the texture position start in the top-left corner unless @compatibility_mode@ is enabled.
bindTileMap_is_centered_textures_enabled :: MethodBind
bindTileMap_is_centered_textures_enabled
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_centered_textures_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the textures will be centered in the middle of each tile. This is useful for certain isometric or top-down modes when textures are made larger or smaller than the tiles (e.g. to avoid flickering on tile edges). The offset is still applied, but from the center of the tile. If used, @compatibility_mode@ is ignored.
--   			If @false@, the texture position start in the top-left corner unless @compatibility_mode@ is enabled.
is_centered_textures_enabled ::
                               (TileMap :< cls, Object :< cls) => cls -> IO Bool
is_centered_textures_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_centered_textures_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "is_centered_textures_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.is_centered_textures_enabled

{-# NOINLINE bindTileMap_is_compatibility_mode_enabled #-}

-- | If @true@, the compatibility with the tilemaps made in Godot 3.1 or earlier is maintained (textures move when the tile origin changes and rotate if the texture size is not homogeneous). This mode presents problems when doing @flip_h@, @flip_v@ and @transpose@ tile operations on non-homogeneous isometric tiles (e.g. 2:1), in which the texture could not coincide with the collision, thus it is not recommended for isometric or non-square tiles.
--   			If @false@, the textures do not move when doing @flip_h@, @flip_v@ operations if no offset is used, nor when changing the tile origin.
--   			The compatibility mode doesn't work with the @centered_textures@ option, because displacing textures with the @cell_tile_origin@ option or in irregular tiles is not relevant when centering those textures.
bindTileMap_is_compatibility_mode_enabled :: MethodBind
bindTileMap_is_compatibility_mode_enabled
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_compatibility_mode_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the compatibility with the tilemaps made in Godot 3.1 or earlier is maintained (textures move when the tile origin changes and rotate if the texture size is not homogeneous). This mode presents problems when doing @flip_h@, @flip_v@ and @transpose@ tile operations on non-homogeneous isometric tiles (e.g. 2:1), in which the texture could not coincide with the collision, thus it is not recommended for isometric or non-square tiles.
--   			If @false@, the textures do not move when doing @flip_h@, @flip_v@ operations if no offset is used, nor when changing the tile origin.
--   			The compatibility mode doesn't work with the @centered_textures@ option, because displacing textures with the @cell_tile_origin@ option or in irregular tiles is not relevant when centering those textures.
is_compatibility_mode_enabled ::
                                (TileMap :< cls, Object :< cls) => cls -> IO Bool
is_compatibility_mode_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_is_compatibility_mode_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "is_compatibility_mode_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.is_compatibility_mode_enabled

{-# NOINLINE bindTileMap_is_y_sort_mode_enabled #-}

-- | If @true@, the TileMap's direct children will be drawn in order of their Y coordinate.
bindTileMap_is_y_sort_mode_enabled :: MethodBind
bindTileMap_is_y_sort_mode_enabled
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "is_y_sort_mode_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the TileMap's direct children will be drawn in order of their Y coordinate.
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

instance NodeMethod TileMap "is_y_sort_mode_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.TileMap.is_y_sort_mode_enabled

{-# NOINLINE bindTileMap_map_to_world #-}

-- | Returns the local position of the top left corner of the cell corresponding to the given tilemap (grid-based) coordinates.
--   				To get the global position, use @method Node2D.to_global@:
--   				
--   @
--   
--   				var local_position = my_tilemap.map_to_world(map_position)
--   				var global_position = my_tilemap.to_global(local_position)
--   				
--   @
--   
--   				Optionally, the tilemap's half offset can be ignored.
bindTileMap_map_to_world :: MethodBind
bindTileMap_map_to_world
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "map_to_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the local position of the top left corner of the cell corresponding to the given tilemap (grid-based) coordinates.
--   				To get the global position, use @method Node2D.to_global@:
--   				
--   @
--   
--   				var local_position = my_tilemap.map_to_world(map_position)
--   				var global_position = my_tilemap.to_global(local_position)
--   				
--   @
--   
--   				Optionally, the tilemap's half offset can be ignored.
map_to_world ::
               (TileMap :< cls, Object :< cls) =>
               cls -> Vector2 -> Maybe Bool -> IO Vector2
map_to_world cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_map_to_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "map_to_world" '[Vector2, Maybe Bool]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileMap.map_to_world

{-# NOINLINE bindTileMap_set_cell #-}

-- | Sets the tile index for the given cell.
--   				An index of @-1@ clears the cell.
--   				Optionally, the tile can also be flipped, transposed, or given autotile coordinates. The autotile coordinate refers to the column and row of the subtile.
--   				__Note:__ Data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call @method update_dirty_quadrants@.
--   				Overriding this method also overrides it internally, allowing custom logic to be implemented when tiles are placed/removed:
--   				
--   @
--   
--   				func set_cell(x, y, tile, flip_x=false, flip_y=false, transpose=false, autotile_coord=Vector2()):
--   				    # Write your custom logic here.
--   				    # To call the default method:
--   				    .set_cell(x, y, tile, flip_x, flip_y, transpose, autotile_coord)
--   				
--   @
bindTileMap_set_cell :: MethodBind
bindTileMap_set_cell
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_cell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile index for the given cell.
--   				An index of @-1@ clears the cell.
--   				Optionally, the tile can also be flipped, transposed, or given autotile coordinates. The autotile coordinate refers to the column and row of the subtile.
--   				__Note:__ Data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call @method update_dirty_quadrants@.
--   				Overriding this method also overrides it internally, allowing custom logic to be implemented when tiles are placed/removed:
--   				
--   @
--   
--   				func set_cell(x, y, tile, flip_x=false, flip_y=false, transpose=false, autotile_coord=Vector2()):
--   				    # Write your custom logic here.
--   				    # To call the default method:
--   				    .set_cell(x, y, tile, flip_x, flip_y, transpose, autotile_coord)
--   				
--   @
set_cell ::
           (TileMap :< cls, Object :< cls) =>
           cls ->
             Int ->
               Int ->
                 Int ->
                   Maybe Bool -> Maybe Bool -> Maybe Bool -> Maybe Vector2 -> IO ()
set_cell cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       maybe (VariantBool False) toVariant arg5,
       maybe (VariantBool False) toVariant arg6,
       defaultedVariant VariantVector2 (V2 0 0) arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_cell (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_cell"
           '[Int, Int, Int, Maybe Bool, Maybe Bool, Maybe Bool, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_cell

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

instance NodeMethod TileMap "set_cell_size" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_cell_size

{-# NOINLINE bindTileMap_set_cellv #-}

-- | Sets the tile index for the cell given by a Vector2.
--   				An index of @-1@ clears the cell.
--   				Optionally, the tile can also be flipped, transposed, or given autotile coordinates. The autotile coordinate refers to the column and row of the subtile.
--   				__Note:__ Data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call @method update_dirty_quadrants@.
bindTileMap_set_cellv :: MethodBind
bindTileMap_set_cellv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_cellv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile index for the cell given by a Vector2.
--   				An index of @-1@ clears the cell.
--   				Optionally, the tile can also be flipped, transposed, or given autotile coordinates. The autotile coordinate refers to the column and row of the subtile.
--   				__Note:__ Data such as navigation polygons and collision shapes are not immediately updated for performance reasons.
--   				If you need these to be immediately updated, you can call @method update_dirty_quadrants@.
set_cellv ::
            (TileMap :< cls, Object :< cls) =>
            cls ->
              Vector2 -> Int -> Maybe Bool -> Maybe Bool -> Maybe Bool -> IO ()
set_cellv cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_cellv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_cellv"
           '[Vector2, Int, Maybe Bool, Maybe Bool, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_cellv

{-# NOINLINE bindTileMap_set_centered_textures #-}

-- | If @true@, the textures will be centered in the middle of each tile. This is useful for certain isometric or top-down modes when textures are made larger or smaller than the tiles (e.g. to avoid flickering on tile edges). The offset is still applied, but from the center of the tile. If used, @compatibility_mode@ is ignored.
--   			If @false@, the texture position start in the top-left corner unless @compatibility_mode@ is enabled.
bindTileMap_set_centered_textures :: MethodBind
bindTileMap_set_centered_textures
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_centered_textures" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the textures will be centered in the middle of each tile. This is useful for certain isometric or top-down modes when textures are made larger or smaller than the tiles (e.g. to avoid flickering on tile edges). The offset is still applied, but from the center of the tile. If used, @compatibility_mode@ is ignored.
--   			If @false@, the texture position start in the top-left corner unless @compatibility_mode@ is enabled.
set_centered_textures ::
                        (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_centered_textures cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_centered_textures
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_centered_textures" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_centered_textures

{-# NOINLINE bindTileMap_set_clip_uv #-}

-- | If @true@, the cell's UVs will be clipped.
bindTileMap_set_clip_uv :: MethodBind
bindTileMap_set_clip_uv
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_clip_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the cell's UVs will be clipped.
set_clip_uv ::
              (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_clip_uv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_clip_uv" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TileMap.set_clip_uv

{-# NOINLINE bindTileMap_set_collision_bounce #-}

-- | Bounce value for static body collisions (see @collision_use_kinematic@).
bindTileMap_set_collision_bounce :: MethodBind
bindTileMap_set_collision_bounce
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bounce value for static body collisions (see @collision_use_kinematic@).
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

instance NodeMethod TileMap "set_collision_bounce" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_bounce

{-# NOINLINE bindTileMap_set_collision_friction #-}

-- | Friction value for static body collisions (see @collision_use_kinematic@).
bindTileMap_set_collision_friction :: MethodBind
bindTileMap_set_collision_friction
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Friction value for static body collisions (see @collision_use_kinematic@).
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

instance NodeMethod TileMap "set_collision_friction" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_friction

{-# NOINLINE bindTileMap_set_collision_layer #-}

-- | The collision layer(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindTileMap_set_collision_layer :: MethodBind
bindTileMap_set_collision_layer
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision layer(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_layer ::
                      (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_collision_layer" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_layer

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

instance NodeMethod TileMap "set_collision_layer_bit" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_layer_bit

{-# NOINLINE bindTileMap_set_collision_mask #-}

-- | The collision mask(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindTileMap_set_collision_mask :: MethodBind
bindTileMap_set_collision_mask
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision mask(s) for all colliders in the TileMap. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_mask ::
                     (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_collision_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_mask

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

instance NodeMethod TileMap "set_collision_mask_bit" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_mask_bit

{-# NOINLINE bindTileMap_set_collision_use_kinematic #-}

-- | If @true@, TileMap collisions will be handled as a kinematic body. If @false@, collisions will be handled as static body.
bindTileMap_set_collision_use_kinematic :: MethodBind
bindTileMap_set_collision_use_kinematic
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_use_kinematic" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, TileMap collisions will be handled as a kinematic body. If @false@, collisions will be handled as static body.
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

instance NodeMethod TileMap "set_collision_use_kinematic" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_use_kinematic

{-# NOINLINE bindTileMap_set_collision_use_parent #-}

-- | If @true@, this tilemap's collision shape will be added to the collision shape of the parent. The parent has to be a @CollisionObject2D@.
bindTileMap_set_collision_use_parent :: MethodBind
bindTileMap_set_collision_use_parent
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_collision_use_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this tilemap's collision shape will be added to the collision shape of the parent. The parent has to be a @CollisionObject2D@.
set_collision_use_parent ::
                           (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collision_use_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_collision_use_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_collision_use_parent" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_collision_use_parent

{-# NOINLINE bindTileMap_set_compatibility_mode #-}

-- | If @true@, the compatibility with the tilemaps made in Godot 3.1 or earlier is maintained (textures move when the tile origin changes and rotate if the texture size is not homogeneous). This mode presents problems when doing @flip_h@, @flip_v@ and @transpose@ tile operations on non-homogeneous isometric tiles (e.g. 2:1), in which the texture could not coincide with the collision, thus it is not recommended for isometric or non-square tiles.
--   			If @false@, the textures do not move when doing @flip_h@, @flip_v@ operations if no offset is used, nor when changing the tile origin.
--   			The compatibility mode doesn't work with the @centered_textures@ option, because displacing textures with the @cell_tile_origin@ option or in irregular tiles is not relevant when centering those textures.
bindTileMap_set_compatibility_mode :: MethodBind
bindTileMap_set_compatibility_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_compatibility_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the compatibility with the tilemaps made in Godot 3.1 or earlier is maintained (textures move when the tile origin changes and rotate if the texture size is not homogeneous). This mode presents problems when doing @flip_h@, @flip_v@ and @transpose@ tile operations on non-homogeneous isometric tiles (e.g. 2:1), in which the texture could not coincide with the collision, thus it is not recommended for isometric or non-square tiles.
--   			If @false@, the textures do not move when doing @flip_h@, @flip_v@ operations if no offset is used, nor when changing the tile origin.
--   			The compatibility mode doesn't work with the @centered_textures@ option, because displacing textures with the @cell_tile_origin@ option or in irregular tiles is not relevant when centering those textures.
set_compatibility_mode ::
                         (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_compatibility_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_compatibility_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_compatibility_mode" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_compatibility_mode

{-# NOINLINE bindTileMap_set_custom_transform #-}

-- | The custom @Transform2D@ to be applied to the TileMap's cells.
bindTileMap_set_custom_transform :: MethodBind
bindTileMap_set_custom_transform
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_custom_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @Transform2D@ to be applied to the TileMap's cells.
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

instance NodeMethod TileMap "set_custom_transform" '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_custom_transform

{-# NOINLINE bindTileMap_set_half_offset #-}

-- | Amount to offset alternating tiles. See @enum HalfOffset@ for possible values.
bindTileMap_set_half_offset :: MethodBind
bindTileMap_set_half_offset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_half_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to offset alternating tiles. See @enum HalfOffset@ for possible values.
set_half_offset ::
                  (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_half_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_half_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_half_offset" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileMap.set_half_offset

{-# NOINLINE bindTileMap_set_mode #-}

-- | The TileMap orientation mode. See @enum Mode@ for possible values.
bindTileMap_set_mode :: MethodBind
bindTileMap_set_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap orientation mode. See @enum Mode@ for possible values.
set_mode :: (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileMap.set_mode

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

instance NodeMethod TileMap "set_occluder_light_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_occluder_light_mask

{-# NOINLINE bindTileMap_set_quadrant_size #-}

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size.
bindTileMap_set_quadrant_size :: MethodBind
bindTileMap_set_quadrant_size
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_quadrant_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The TileMap's quadrant size. Optimizes drawing by batching, using chunks of this size.
set_quadrant_size ::
                    (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_quadrant_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_quadrant_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_quadrant_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.set_quadrant_size

{-# NOINLINE bindTileMap_set_tile_origin #-}

-- | Position for tile origin. See @enum TileOrigin@ for possible values.
bindTileMap_set_tile_origin :: MethodBind
bindTileMap_set_tile_origin
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_tile_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position for tile origin. See @enum TileOrigin@ for possible values.
set_tile_origin ::
                  (TileMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_tile_origin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_tile_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_tile_origin" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileMap.set_tile_origin

{-# NOINLINE bindTileMap_set_tileset #-}

-- | The assigned @TileSet@.
bindTileMap_set_tileset :: MethodBind
bindTileMap_set_tileset
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_tileset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The assigned @TileSet@.
set_tileset ::
              (TileMap :< cls, Object :< cls) => cls -> TileSet -> IO ()
set_tileset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_tileset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_tileset" '[TileSet] (IO ()) where
        nodeMethod = Godot.Core.TileMap.set_tileset

{-# NOINLINE bindTileMap_set_y_sort_mode #-}

-- | If @true@, the TileMap's direct children will be drawn in order of their Y coordinate.
bindTileMap_set_y_sort_mode :: MethodBind
bindTileMap_set_y_sort_mode
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "set_y_sort_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the TileMap's direct children will be drawn in order of their Y coordinate.
set_y_sort_mode ::
                  (TileMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_y_sort_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_set_y_sort_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "set_y_sort_mode" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TileMap.set_y_sort_mode

{-# NOINLINE bindTileMap_update_bitmask_area #-}

-- | Applies autotiling rules to the cell (and its adjacent cells) referenced by its grid-based X and Y coordinates.
bindTileMap_update_bitmask_area :: MethodBind
bindTileMap_update_bitmask_area
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "update_bitmask_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies autotiling rules to the cell (and its adjacent cells) referenced by its grid-based X and Y coordinates.
update_bitmask_area ::
                      (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO ()
update_bitmask_area cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_update_bitmask_area (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "update_bitmask_area" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.update_bitmask_area

{-# NOINLINE bindTileMap_update_bitmask_region #-}

-- | Applies autotiling rules to the cells in the given region (specified by grid-based X and Y coordinates).
--   				Calling with invalid (or missing) parameters applies autotiling rules for the entire tilemap.
bindTileMap_update_bitmask_region :: MethodBind
bindTileMap_update_bitmask_region
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "update_bitmask_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies autotiling rules to the cells in the given region (specified by grid-based X and Y coordinates).
--   				Calling with invalid (or missing) parameters applies autotiling rules for the entire tilemap.
update_bitmask_region ::
                        (TileMap :< cls, Object :< cls) =>
                        cls -> Maybe Vector2 -> Maybe Vector2 -> IO ()
update_bitmask_region cls arg1 arg2
  = withVariantArray
      [defaultedVariant VariantVector2 (V2 0 0) arg1,
       defaultedVariant VariantVector2 (V2 0 0) arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_update_bitmask_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "update_bitmask_region"
           '[Maybe Vector2, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileMap.update_bitmask_region

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

instance NodeMethod TileMap "update_dirty_quadrants" '[] (IO ())
         where
        nodeMethod = Godot.Core.TileMap.update_dirty_quadrants

{-# NOINLINE bindTileMap_world_to_map #-}

-- | Returns the tilemap (grid-based) coordinates corresponding to the given local position.
--   				To use this with a global position, first determine the local position with @method Node2D.to_local@:
--   				
--   @
--   
--   				var local_position = my_tilemap.to_local(global_position)
--   				var map_position = my_tilemap.world_to_map(local_position)
--   				
--   @
bindTileMap_world_to_map :: MethodBind
bindTileMap_world_to_map
  = unsafePerformIO $
      withCString "TileMap" $
        \ clsNamePtr ->
          withCString "world_to_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tilemap (grid-based) coordinates corresponding to the given local position.
--   				To use this with a global position, first determine the local position with @method Node2D.to_local@:
--   				
--   @
--   
--   				var local_position = my_tilemap.to_local(global_position)
--   				var map_position = my_tilemap.world_to_map(local_position)
--   				
--   @
world_to_map ::
               (TileMap :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
world_to_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileMap_world_to_map (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileMap "world_to_map" '[Vector2] (IO Vector2)
         where
        nodeMethod = Godot.Core.TileMap.world_to_map