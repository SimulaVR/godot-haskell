{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TileSet
       (Godot.Core.TileSet._BITMASK_2X2, Godot.Core.TileSet._BITMASK_3X3,
        Godot.Core.TileSet._BIND_BOTTOMLEFT,
        Godot.Core.TileSet._BIND_CENTER, Godot.Core.TileSet._BIND_LEFT,
        Godot.Core.TileSet._ATLAS_TILE,
        Godot.Core.TileSet._BITMASK_3X3_MINIMAL,
        Godot.Core.TileSet._BIND_RIGHT, Godot.Core.TileSet._BIND_TOPLEFT,
        Godot.Core.TileSet._BIND_BOTTOM,
        Godot.Core.TileSet._BIND_BOTTOMRIGHT,
        Godot.Core.TileSet._AUTO_TILE, Godot.Core.TileSet._BIND_TOP,
        Godot.Core.TileSet._BIND_TOPRIGHT, Godot.Core.TileSet._SINGLE_TILE,
        Godot.Core.TileSet._forward_atlas_subtile_selection,
        Godot.Core.TileSet._forward_subtile_selection,
        Godot.Core.TileSet._is_tile_bound,
        Godot.Core.TileSet.autotile_clear_bitmask_map,
        Godot.Core.TileSet.autotile_get_bitmask,
        Godot.Core.TileSet.autotile_get_bitmask_mode,
        Godot.Core.TileSet.autotile_get_icon_coordinate,
        Godot.Core.TileSet.autotile_get_light_occluder,
        Godot.Core.TileSet.autotile_get_navigation_polygon,
        Godot.Core.TileSet.autotile_get_size,
        Godot.Core.TileSet.autotile_get_spacing,
        Godot.Core.TileSet.autotile_get_subtile_priority,
        Godot.Core.TileSet.autotile_get_z_index,
        Godot.Core.TileSet.autotile_set_bitmask,
        Godot.Core.TileSet.autotile_set_bitmask_mode,
        Godot.Core.TileSet.autotile_set_icon_coordinate,
        Godot.Core.TileSet.autotile_set_light_occluder,
        Godot.Core.TileSet.autotile_set_navigation_polygon,
        Godot.Core.TileSet.autotile_set_size,
        Godot.Core.TileSet.autotile_set_spacing,
        Godot.Core.TileSet.autotile_set_subtile_priority,
        Godot.Core.TileSet.autotile_set_z_index, Godot.Core.TileSet.clear,
        Godot.Core.TileSet.create_tile,
        Godot.Core.TileSet.find_tile_by_name,
        Godot.Core.TileSet.get_last_unused_tile_id,
        Godot.Core.TileSet.get_tiles_ids, Godot.Core.TileSet.remove_tile,
        Godot.Core.TileSet.tile_add_shape,
        Godot.Core.TileSet.tile_get_light_occluder,
        Godot.Core.TileSet.tile_get_material,
        Godot.Core.TileSet.tile_get_modulate,
        Godot.Core.TileSet.tile_get_name,
        Godot.Core.TileSet.tile_get_navigation_polygon,
        Godot.Core.TileSet.tile_get_navigation_polygon_offset,
        Godot.Core.TileSet.tile_get_normal_map,
        Godot.Core.TileSet.tile_get_occluder_offset,
        Godot.Core.TileSet.tile_get_region,
        Godot.Core.TileSet.tile_get_shape,
        Godot.Core.TileSet.tile_get_shape_count,
        Godot.Core.TileSet.tile_get_shape_offset,
        Godot.Core.TileSet.tile_get_shape_one_way,
        Godot.Core.TileSet.tile_get_shape_one_way_margin,
        Godot.Core.TileSet.tile_get_shape_transform,
        Godot.Core.TileSet.tile_get_shapes,
        Godot.Core.TileSet.tile_get_texture,
        Godot.Core.TileSet.tile_get_texture_offset,
        Godot.Core.TileSet.tile_get_tile_mode,
        Godot.Core.TileSet.tile_get_z_index,
        Godot.Core.TileSet.tile_set_light_occluder,
        Godot.Core.TileSet.tile_set_material,
        Godot.Core.TileSet.tile_set_modulate,
        Godot.Core.TileSet.tile_set_name,
        Godot.Core.TileSet.tile_set_navigation_polygon,
        Godot.Core.TileSet.tile_set_navigation_polygon_offset,
        Godot.Core.TileSet.tile_set_normal_map,
        Godot.Core.TileSet.tile_set_occluder_offset,
        Godot.Core.TileSet.tile_set_region,
        Godot.Core.TileSet.tile_set_shape,
        Godot.Core.TileSet.tile_set_shape_offset,
        Godot.Core.TileSet.tile_set_shape_one_way,
        Godot.Core.TileSet.tile_set_shape_one_way_margin,
        Godot.Core.TileSet.tile_set_shape_transform,
        Godot.Core.TileSet.tile_set_shapes,
        Godot.Core.TileSet.tile_set_texture,
        Godot.Core.TileSet.tile_set_texture_offset,
        Godot.Core.TileSet.tile_set_tile_mode,
        Godot.Core.TileSet.tile_set_z_index)
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

_BITMASK_2X2 :: Int
_BITMASK_2X2 = 0

_BITMASK_3X3 :: Int
_BITMASK_3X3 = 2

_BIND_BOTTOMLEFT :: Int
_BIND_BOTTOMLEFT = 64

_BIND_CENTER :: Int
_BIND_CENTER = 16

_BIND_LEFT :: Int
_BIND_LEFT = 8

_ATLAS_TILE :: Int
_ATLAS_TILE = 2

_BITMASK_3X3_MINIMAL :: Int
_BITMASK_3X3_MINIMAL = 1

_BIND_RIGHT :: Int
_BIND_RIGHT = 32

_BIND_TOPLEFT :: Int
_BIND_TOPLEFT = 1

_BIND_BOTTOM :: Int
_BIND_BOTTOM = 128

_BIND_BOTTOMRIGHT :: Int
_BIND_BOTTOMRIGHT = 256

_AUTO_TILE :: Int
_AUTO_TILE = 1

_BIND_TOP :: Int
_BIND_TOP = 2

_BIND_TOPRIGHT :: Int
_BIND_TOPRIGHT = 4

_SINGLE_TILE :: Int
_SINGLE_TILE = 0

{-# NOINLINE bindTileSet__forward_atlas_subtile_selection #-}

bindTileSet__forward_atlas_subtile_selection :: MethodBind
bindTileSet__forward_atlas_subtile_selection
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_forward_atlas_subtile_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_forward_atlas_subtile_selection ::
                                   (TileSet :< cls, Object :< cls) =>
                                   cls -> Int -> Object -> Vector2 -> IO Vector2
_forward_atlas_subtile_selection cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__forward_atlas_subtile_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "_forward_atlas_subtile_selection"
           '[Int, Object, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet._forward_atlas_subtile_selection

{-# NOINLINE bindTileSet__forward_subtile_selection #-}

bindTileSet__forward_subtile_selection :: MethodBind
bindTileSet__forward_subtile_selection
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_forward_subtile_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_forward_subtile_selection ::
                             (TileSet :< cls, Object :< cls) =>
                             cls -> Int -> Int -> Object -> Vector2 -> IO Vector2
_forward_subtile_selection cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__forward_subtile_selection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "_forward_subtile_selection"
           '[Int, Int, Object, Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet._forward_subtile_selection

{-# NOINLINE bindTileSet__is_tile_bound #-}

-- | Determines when the auto-tiler should consider two different auto-tile IDs to be bound together.
--   				__Note:__ @neighbor_id@ will be @-1@ (@TileMap.INVALID_CELL@) when checking a tile against an empty neighbor tile.
bindTileSet__is_tile_bound :: MethodBind
bindTileSet__is_tile_bound
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_is_tile_bound" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when the auto-tiler should consider two different auto-tile IDs to be bound together.
--   				__Note:__ @neighbor_id@ will be @-1@ (@TileMap.INVALID_CELL@) when checking a tile against an empty neighbor tile.
_is_tile_bound ::
                 (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
_is_tile_bound cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__is_tile_bound (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "_is_tile_bound" '[Int, Int] (IO Bool)
         where
        nodeMethod = Godot.Core.TileSet._is_tile_bound

{-# NOINLINE bindTileSet_autotile_clear_bitmask_map #-}

-- | Clears all bitmask information of the autotile.
bindTileSet_autotile_clear_bitmask_map :: MethodBind
bindTileSet_autotile_clear_bitmask_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_clear_bitmask_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all bitmask information of the autotile.
autotile_clear_bitmask_map ::
                             (TileSet :< cls, Object :< cls) => cls -> Int -> IO ()
autotile_clear_bitmask_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_clear_bitmask_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_clear_bitmask_map" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_clear_bitmask_map

{-# NOINLINE bindTileSet_autotile_get_bitmask #-}

-- | Returns the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in @enum AutotileBindings@ present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
bindTileSet_autotile_get_bitmask :: MethodBind
bindTileSet_autotile_get_bitmask
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in @enum AutotileBindings@ present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
autotile_get_bitmask ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO Int
autotile_get_bitmask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_bitmask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_bitmask" '[Int, Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_bitmask

{-# NOINLINE bindTileSet_autotile_get_bitmask_mode #-}

-- | Returns the @enum BitmaskMode@ of the autotile.
bindTileSet_autotile_get_bitmask_mode :: MethodBind
bindTileSet_autotile_get_bitmask_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_bitmask_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @enum BitmaskMode@ of the autotile.
autotile_get_bitmask_mode ::
                            (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
autotile_get_bitmask_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_bitmask_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_bitmask_mode" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_bitmask_mode

{-# NOINLINE bindTileSet_autotile_get_icon_coordinate #-}

-- | Returns the subtile that's being used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask information is incomplete. It will also be used to represent it in the TileSet editor.
bindTileSet_autotile_get_icon_coordinate :: MethodBind
bindTileSet_autotile_get_icon_coordinate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_icon_coordinate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the subtile that's being used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask information is incomplete. It will also be used to represent it in the TileSet editor.
autotile_get_icon_coordinate ::
                               (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
autotile_get_icon_coordinate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_icon_coordinate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_icon_coordinate" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_icon_coordinate

{-# NOINLINE bindTileSet_autotile_get_light_occluder #-}

-- | Returns the light occluder of the subtile from an atlas/autotile given its coordinates.
bindTileSet_autotile_get_light_occluder :: MethodBind
bindTileSet_autotile_get_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the light occluder of the subtile from an atlas/autotile given its coordinates.
autotile_get_light_occluder ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> Vector2 -> IO OccluderPolygon2D
autotile_get_light_occluder cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_light_occluder"
           '[Int, Vector2]
           (IO OccluderPolygon2D)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_light_occluder

{-# NOINLINE bindTileSet_autotile_get_navigation_polygon #-}

-- | Returns the navigation polygon of the subtile from an atlas/autotile given its coordinates.
bindTileSet_autotile_get_navigation_polygon :: MethodBind
bindTileSet_autotile_get_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation polygon of the subtile from an atlas/autotile given its coordinates.
autotile_get_navigation_polygon ::
                                  (TileSet :< cls, Object :< cls) =>
                                  cls -> Int -> Vector2 -> IO NavigationPolygon
autotile_get_navigation_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_navigation_polygon"
           '[Int, Vector2]
           (IO NavigationPolygon)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_navigation_polygon

{-# NOINLINE bindTileSet_autotile_get_size #-}

-- | Returns the size of the subtiles in an atlas/autotile.
bindTileSet_autotile_get_size :: MethodBind
bindTileSet_autotile_get_size
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of the subtiles in an atlas/autotile.
autotile_get_size ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
autotile_get_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_size" '[Int] (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_size

{-# NOINLINE bindTileSet_autotile_get_spacing #-}

-- | Returns the spacing between subtiles of the atlas/autotile.
bindTileSet_autotile_get_spacing :: MethodBind
bindTileSet_autotile_get_spacing
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the spacing between subtiles of the atlas/autotile.
autotile_get_spacing ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
autotile_get_spacing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_spacing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_spacing" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_spacing

{-# NOINLINE bindTileSet_autotile_get_subtile_priority #-}

-- | Returns the priority of the subtile from an autotile given its coordinates.
--   				When more than one subtile has the same bitmask value, one of them will be picked randomly for drawing. Its priority will define how often it will be picked.
bindTileSet_autotile_get_subtile_priority :: MethodBind
bindTileSet_autotile_get_subtile_priority
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_subtile_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the priority of the subtile from an autotile given its coordinates.
--   				When more than one subtile has the same bitmask value, one of them will be picked randomly for drawing. Its priority will define how often it will be picked.
autotile_get_subtile_priority ::
                                (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO Int
autotile_get_subtile_priority cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_subtile_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_subtile_priority"
           '[Int, Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_subtile_priority

{-# NOINLINE bindTileSet_autotile_get_z_index #-}

-- | Returns the drawing index of the subtile from an atlas/autotile given its coordinates.
bindTileSet_autotile_get_z_index :: MethodBind
bindTileSet_autotile_get_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the drawing index of the subtile from an atlas/autotile given its coordinates.
autotile_get_z_index ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO Int
autotile_get_z_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_get_z_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_get_z_index" '[Int, Vector2]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.autotile_get_z_index

{-# NOINLINE bindTileSet_autotile_set_bitmask #-}

-- | Sets the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in @enum AutotileBindings@ present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
bindTileSet_autotile_set_bitmask :: MethodBind
bindTileSet_autotile_set_bitmask
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in @enum AutotileBindings@ present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
autotile_set_bitmask ::
                       (TileSet :< cls, Object :< cls) =>
                       cls -> Int -> Vector2 -> Int -> IO ()
autotile_set_bitmask cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_bitmask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_bitmask"
           '[Int, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_bitmask

{-# NOINLINE bindTileSet_autotile_set_bitmask_mode #-}

-- | Sets the @enum BitmaskMode@ of the autotile.
bindTileSet_autotile_set_bitmask_mode :: MethodBind
bindTileSet_autotile_set_bitmask_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_bitmask_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @enum BitmaskMode@ of the autotile.
autotile_set_bitmask_mode ::
                            (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
autotile_set_bitmask_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_bitmask_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_bitmask_mode" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_bitmask_mode

{-# NOINLINE bindTileSet_autotile_set_icon_coordinate #-}

-- | Sets the subtile that will be used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask information is incomplete. It will also be used to represent it in the TileSet editor.
bindTileSet_autotile_set_icon_coordinate :: MethodBind
bindTileSet_autotile_set_icon_coordinate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_icon_coordinate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the subtile that will be used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask information is incomplete. It will also be used to represent it in the TileSet editor.
autotile_set_icon_coordinate ::
                               (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
autotile_set_icon_coordinate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_icon_coordinate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_icon_coordinate"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_icon_coordinate

{-# NOINLINE bindTileSet_autotile_set_light_occluder #-}

-- | Sets the light occluder of the subtile from an atlas/autotile given its coordinates.
bindTileSet_autotile_set_light_occluder :: MethodBind
bindTileSet_autotile_set_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the light occluder of the subtile from an atlas/autotile given its coordinates.
autotile_set_light_occluder ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> OccluderPolygon2D -> Vector2 -> IO ()
autotile_set_light_occluder cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_light_occluder"
           '[Int, OccluderPolygon2D, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_light_occluder

{-# NOINLINE bindTileSet_autotile_set_navigation_polygon #-}

-- | Sets the navigation polygon of the subtile from an atlas/autotile given its coordinates.
bindTileSet_autotile_set_navigation_polygon :: MethodBind
bindTileSet_autotile_set_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the navigation polygon of the subtile from an atlas/autotile given its coordinates.
autotile_set_navigation_polygon ::
                                  (TileSet :< cls, Object :< cls) =>
                                  cls -> Int -> NavigationPolygon -> Vector2 -> IO ()
autotile_set_navigation_polygon cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_navigation_polygon"
           '[Int, NavigationPolygon, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_navigation_polygon

{-# NOINLINE bindTileSet_autotile_set_size #-}

-- | Sets the size of the subtiles in an atlas/autotile.
bindTileSet_autotile_set_size :: MethodBind
bindTileSet_autotile_set_size
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the subtiles in an atlas/autotile.
autotile_set_size ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
autotile_set_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_size" '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_size

{-# NOINLINE bindTileSet_autotile_set_spacing #-}

-- | Sets the spacing between subtiles of the atlas/autotile.
bindTileSet_autotile_set_spacing :: MethodBind
bindTileSet_autotile_set_spacing
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_spacing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the spacing between subtiles of the atlas/autotile.
autotile_set_spacing ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
autotile_set_spacing cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_spacing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_spacing" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_spacing

{-# NOINLINE bindTileSet_autotile_set_subtile_priority #-}

-- | Sets the priority of the subtile from an autotile given its coordinates.
--   				When more than one subtile has the same bitmask value, one of them will be picked randomly for drawing. Its priority will define how often it will be picked.
bindTileSet_autotile_set_subtile_priority :: MethodBind
bindTileSet_autotile_set_subtile_priority
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_subtile_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the priority of the subtile from an autotile given its coordinates.
--   				When more than one subtile has the same bitmask value, one of them will be picked randomly for drawing. Its priority will define how often it will be picked.
autotile_set_subtile_priority ::
                                (TileSet :< cls, Object :< cls) =>
                                cls -> Int -> Vector2 -> Int -> IO ()
autotile_set_subtile_priority cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_subtile_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_subtile_priority"
           '[Int, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_subtile_priority

{-# NOINLINE bindTileSet_autotile_set_z_index #-}

-- | Sets the drawing index of the subtile from an atlas/autotile given its coordinates.
bindTileSet_autotile_set_z_index :: MethodBind
bindTileSet_autotile_set_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the drawing index of the subtile from an atlas/autotile given its coordinates.
autotile_set_z_index ::
                       (TileSet :< cls, Object :< cls) =>
                       cls -> Int -> Vector2 -> Int -> IO ()
autotile_set_z_index cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_autotile_set_z_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "autotile_set_z_index"
           '[Int, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.autotile_set_z_index

{-# NOINLINE bindTileSet_clear #-}

-- | Clears all tiles.
bindTileSet_clear :: MethodBind
bindTileSet_clear
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all tiles.
clear :: (TileSet :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.TileSet.clear

{-# NOINLINE bindTileSet_create_tile #-}

-- | Creates a new tile with the given ID.
bindTileSet_create_tile :: MethodBind
bindTileSet_create_tile
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "create_tile" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new tile with the given ID.
create_tile ::
              (TileSet :< cls, Object :< cls) => cls -> Int -> IO ()
create_tile cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_create_tile (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "create_tile" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileSet.create_tile

{-# NOINLINE bindTileSet_find_tile_by_name #-}

-- | Returns the first tile matching the given name.
bindTileSet_find_tile_by_name :: MethodBind
bindTileSet_find_tile_by_name
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "find_tile_by_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the first tile matching the given name.
find_tile_by_name ::
                    (TileSet :< cls, Object :< cls) => cls -> GodotString -> IO Int
find_tile_by_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_find_tile_by_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "find_tile_by_name" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.find_tile_by_name

{-# NOINLINE bindTileSet_get_last_unused_tile_id #-}

-- | Returns the ID following the last currently used ID, useful when creating a new tile.
bindTileSet_get_last_unused_tile_id :: MethodBind
bindTileSet_get_last_unused_tile_id
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "get_last_unused_tile_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID following the last currently used ID, useful when creating a new tile.
get_last_unused_tile_id ::
                          (TileSet :< cls, Object :< cls) => cls -> IO Int
get_last_unused_tile_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_get_last_unused_tile_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "get_last_unused_tile_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.get_last_unused_tile_id

{-# NOINLINE bindTileSet_get_tiles_ids #-}

-- | Returns an array of all currently used tile IDs.
bindTileSet_get_tiles_ids :: MethodBind
bindTileSet_get_tiles_ids
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "get_tiles_ids" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all currently used tile IDs.
get_tiles_ids :: (TileSet :< cls, Object :< cls) => cls -> IO Array
get_tiles_ids cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_get_tiles_ids (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "get_tiles_ids" '[] (IO Array) where
        nodeMethod = Godot.Core.TileSet.get_tiles_ids

{-# NOINLINE bindTileSet_remove_tile #-}

-- | Removes the given tile ID.
bindTileSet_remove_tile :: MethodBind
bindTileSet_remove_tile
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "remove_tile" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given tile ID.
remove_tile ::
              (TileSet :< cls, Object :< cls) => cls -> Int -> IO ()
remove_tile cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_remove_tile (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "remove_tile" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TileSet.remove_tile

{-# NOINLINE bindTileSet_tile_add_shape #-}

-- | Adds a shape to the tile.
bindTileSet_tile_add_shape :: MethodBind
bindTileSet_tile_add_shape
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a shape to the tile.
tile_add_shape ::
                 (TileSet :< cls, Object :< cls) =>
                 cls ->
                   Int ->
                     Shape2D -> Transform2d -> Maybe Bool -> Maybe Vector2 -> IO ()
tile_add_shape cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       defaultedVariant VariantVector2 (V2 0 0) arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_add_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_add_shape"
           '[Int, Shape2D, Transform2d, Maybe Bool, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_add_shape

{-# NOINLINE bindTileSet_tile_get_light_occluder #-}

-- | Returns the tile's light occluder.
bindTileSet_tile_get_light_occluder :: MethodBind
bindTileSet_tile_get_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's light occluder.
tile_get_light_occluder ::
                          (TileSet :< cls, Object :< cls) =>
                          cls -> Int -> IO OccluderPolygon2D
tile_get_light_occluder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_light_occluder" '[Int]
           (IO OccluderPolygon2D)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_light_occluder

{-# NOINLINE bindTileSet_tile_get_material #-}

-- | Returns the tile's material.
bindTileSet_tile_get_material :: MethodBind
bindTileSet_tile_get_material
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's material.
tile_get_material ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> IO ShaderMaterial
tile_get_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_material" '[Int]
           (IO ShaderMaterial)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_material

{-# NOINLINE bindTileSet_tile_get_modulate #-}

-- | Returns the tile's modulation color.
bindTileSet_tile_get_modulate :: MethodBind
bindTileSet_tile_get_modulate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's modulation color.
tile_get_modulate ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> IO Color
tile_get_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_modulate" '[Int] (IO Color)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_modulate

{-# NOINLINE bindTileSet_tile_get_name #-}

-- | Returns the tile's name.
bindTileSet_tile_get_name :: MethodBind
bindTileSet_tile_get_name
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's name.
tile_get_name ::
                (TileSet :< cls, Object :< cls) => cls -> Int -> IO GodotString
tile_get_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_name" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_name

{-# NOINLINE bindTileSet_tile_get_navigation_polygon #-}

-- | Returns the navigation polygon of the tile.
bindTileSet_tile_get_navigation_polygon :: MethodBind
bindTileSet_tile_get_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation polygon of the tile.
tile_get_navigation_polygon ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> IO NavigationPolygon
tile_get_navigation_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_navigation_polygon" '[Int]
           (IO NavigationPolygon)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_navigation_polygon

{-# NOINLINE bindTileSet_tile_get_navigation_polygon_offset #-}

-- | Returns the offset of the tile's navigation polygon.
bindTileSet_tile_get_navigation_polygon_offset :: MethodBind
bindTileSet_tile_get_navigation_polygon_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_navigation_polygon_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the offset of the tile's navigation polygon.
tile_get_navigation_polygon_offset ::
                                     (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
tile_get_navigation_polygon_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTileSet_tile_get_navigation_polygon_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_navigation_polygon_offset"
           '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_navigation_polygon_offset

{-# NOINLINE bindTileSet_tile_get_normal_map #-}

-- | Returns the tile's normal map texture.
bindTileSet_tile_get_normal_map :: MethodBind
bindTileSet_tile_get_normal_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's normal map texture.
tile_get_normal_map ::
                      (TileSet :< cls, Object :< cls) => cls -> Int -> IO Texture
tile_get_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_normal_map" '[Int]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_normal_map

{-# NOINLINE bindTileSet_tile_get_occluder_offset #-}

-- | Returns the offset of the tile's light occluder.
bindTileSet_tile_get_occluder_offset :: MethodBind
bindTileSet_tile_get_occluder_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_occluder_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the offset of the tile's light occluder.
tile_get_occluder_offset ::
                           (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
tile_get_occluder_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_occluder_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_occluder_offset" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_occluder_offset

{-# NOINLINE bindTileSet_tile_get_region #-}

-- | Returns the tile sub-region in the texture.
bindTileSet_tile_get_region :: MethodBind
bindTileSet_tile_get_region
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile sub-region in the texture.
tile_get_region ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> IO Rect2
tile_get_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_region" '[Int] (IO Rect2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_region

{-# NOINLINE bindTileSet_tile_get_shape #-}

-- | Returns a tile's given shape.
bindTileSet_tile_get_shape :: MethodBind
bindTileSet_tile_get_shape
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a tile's given shape.
tile_get_shape ::
                 (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Shape2D
tile_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape" '[Int, Int]
           (IO Shape2D)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape

{-# NOINLINE bindTileSet_tile_get_shape_count #-}

-- | Returns the number of shapes assigned to a tile.
bindTileSet_tile_get_shape_count :: MethodBind
bindTileSet_tile_get_shape_count
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes assigned to a tile.
tile_get_shape_count ::
                       (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_count" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_count

{-# NOINLINE bindTileSet_tile_get_shape_offset #-}

-- | Returns the offset of a tile's shape.
bindTileSet_tile_get_shape_offset :: MethodBind
bindTileSet_tile_get_shape_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the offset of a tile's shape.
tile_get_shape_offset ::
                        (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Vector2
tile_get_shape_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_offset" '[Int, Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_offset

{-# NOINLINE bindTileSet_tile_get_shape_one_way #-}

-- | Returns the one-way collision value of a tile's shape.
bindTileSet_tile_get_shape_one_way :: MethodBind
bindTileSet_tile_get_shape_one_way
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_one_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the one-way collision value of a tile's shape.
tile_get_shape_one_way ::
                         (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
tile_get_shape_one_way cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_one_way
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_one_way" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_one_way

{-# NOINLINE bindTileSet_tile_get_shape_one_way_margin #-}

bindTileSet_tile_get_shape_one_way_margin :: MethodBind
bindTileSet_tile_get_shape_one_way_margin
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_one_way_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_get_shape_one_way_margin ::
                                (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
tile_get_shape_one_way_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_one_way_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_one_way_margin"
           '[Int, Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_one_way_margin

{-# NOINLINE bindTileSet_tile_get_shape_transform #-}

-- | Returns the @Transform2D@ of a tile's shape.
bindTileSet_tile_get_shape_transform :: MethodBind
bindTileSet_tile_get_shape_transform
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform2D@ of a tile's shape.
tile_get_shape_transform ::
                           (TileSet :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO Transform2d
tile_get_shape_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shape_transform" '[Int, Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shape_transform

{-# NOINLINE bindTileSet_tile_get_shapes #-}

-- | Returns an array of dictionaries describing the tile's shapes.
--   				__Dictionary structure in the array returned by this method:__
--   				
--   @
--   
--   				{
--   				    "autotile_coord": Vector2,
--   				    "one_way": bool,
--   				    "one_way_margin": int,
--   				    "shape": CollisionShape2D,
--   				    "shape_transform": Transform2D,
--   				}
--   				
--   @
bindTileSet_tile_get_shapes :: MethodBind
bindTileSet_tile_get_shapes
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of dictionaries describing the tile's shapes.
--   				__Dictionary structure in the array returned by this method:__
--   				
--   @
--   
--   				{
--   				    "autotile_coord": Vector2,
--   				    "one_way": bool,
--   				    "one_way_margin": int,
--   				    "shape": CollisionShape2D,
--   				    "shape_transform": Transform2D,
--   				}
--   				
--   @
tile_get_shapes ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> IO Array
tile_get_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_shapes" '[Int] (IO Array)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_shapes

{-# NOINLINE bindTileSet_tile_get_texture #-}

-- | Returns the tile's texture.
bindTileSet_tile_get_texture :: MethodBind
bindTileSet_tile_get_texture
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's texture.
tile_get_texture ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> IO Texture
tile_get_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_texture" '[Int] (IO Texture)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_texture

{-# NOINLINE bindTileSet_tile_get_texture_offset #-}

-- | Returns the texture offset of the tile.
bindTileSet_tile_get_texture_offset :: MethodBind
bindTileSet_tile_get_texture_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the texture offset of the tile.
tile_get_texture_offset ::
                          (TileSet :< cls, Object :< cls) => cls -> Int -> IO Vector2
tile_get_texture_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_texture_offset" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_texture_offset

{-# NOINLINE bindTileSet_tile_get_tile_mode #-}

-- | Returns the tile's @enum TileMode@.
bindTileSet_tile_get_tile_mode :: MethodBind
bindTileSet_tile_get_tile_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_tile_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's @enum TileMode@.
tile_get_tile_mode ::
                     (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_tile_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_tile_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_tile_mode" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_tile_mode

{-# NOINLINE bindTileSet_tile_get_z_index #-}

-- | Returns the tile's Z index (drawing layer).
bindTileSet_tile_get_z_index :: MethodBind
bindTileSet_tile_get_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's Z index (drawing layer).
tile_get_z_index ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_z_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_z_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_get_z_index" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.TileSet.tile_get_z_index

{-# NOINLINE bindTileSet_tile_set_light_occluder #-}

-- | Sets a light occluder for the tile.
bindTileSet_tile_set_light_occluder :: MethodBind
bindTileSet_tile_set_light_occluder
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_light_occluder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a light occluder for the tile.
tile_set_light_occluder ::
                          (TileSet :< cls, Object :< cls) =>
                          cls -> Int -> OccluderPolygon2D -> IO ()
tile_set_light_occluder cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_light_occluder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_light_occluder"
           '[Int, OccluderPolygon2D]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_light_occluder

{-# NOINLINE bindTileSet_tile_set_material #-}

-- | Sets the tile's material.
bindTileSet_tile_set_material :: MethodBind
bindTileSet_tile_set_material
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's material.
tile_set_material ::
                    (TileSet :< cls, Object :< cls) =>
                    cls -> Int -> ShaderMaterial -> IO ()
tile_set_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_material"
           '[Int, ShaderMaterial]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_material

{-# NOINLINE bindTileSet_tile_set_modulate #-}

-- | Sets the tile's modulation color.
--   				__Note:__ Modulation is performed by setting the tile's vertex color. To access this in a shader, use @COLOR@ rather than @MODULATE@ (which instead accesses the @TileMap@'s @CanvasItem.modulate@ property).
bindTileSet_tile_set_modulate :: MethodBind
bindTileSet_tile_set_modulate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's modulation color.
--   				__Note:__ Modulation is performed by setting the tile's vertex color. To access this in a shader, use @COLOR@ rather than @MODULATE@ (which instead accesses the @TileMap@'s @CanvasItem.modulate@ property).
tile_set_modulate ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
tile_set_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_modulate" '[Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_modulate

{-# NOINLINE bindTileSet_tile_set_name #-}

-- | Sets the tile's name.
bindTileSet_tile_set_name :: MethodBind
bindTileSet_tile_set_name
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's name.
tile_set_name ::
                (TileSet :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
tile_set_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_name" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_name

{-# NOINLINE bindTileSet_tile_set_navigation_polygon #-}

-- | Sets the tile's navigation polygon.
bindTileSet_tile_set_navigation_polygon :: MethodBind
bindTileSet_tile_set_navigation_polygon
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's navigation polygon.
tile_set_navigation_polygon ::
                              (TileSet :< cls, Object :< cls) =>
                              cls -> Int -> NavigationPolygon -> IO ()
tile_set_navigation_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_navigation_polygon"
           '[Int, NavigationPolygon]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_navigation_polygon

{-# NOINLINE bindTileSet_tile_set_navigation_polygon_offset #-}

-- | Sets an offset for the tile's navigation polygon.
bindTileSet_tile_set_navigation_polygon_offset :: MethodBind
bindTileSet_tile_set_navigation_polygon_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_navigation_polygon_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an offset for the tile's navigation polygon.
tile_set_navigation_polygon_offset ::
                                     (TileSet :< cls, Object :< cls) =>
                                     cls -> Int -> Vector2 -> IO ()
tile_set_navigation_polygon_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTileSet_tile_set_navigation_polygon_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_navigation_polygon_offset"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_navigation_polygon_offset

{-# NOINLINE bindTileSet_tile_set_normal_map #-}

-- | Sets the tile's normal map texture.
--   				__Note:__ Godot expects the normal map to use X+, Y-, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
bindTileSet_tile_set_normal_map :: MethodBind
bindTileSet_tile_set_normal_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's normal map texture.
--   				__Note:__ Godot expects the normal map to use X+, Y-, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
tile_set_normal_map ::
                      (TileSet :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
tile_set_normal_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_normal_map" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_normal_map

{-# NOINLINE bindTileSet_tile_set_occluder_offset #-}

-- | Sets an offset for the tile's light occluder.
bindTileSet_tile_set_occluder_offset :: MethodBind
bindTileSet_tile_set_occluder_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_occluder_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an offset for the tile's light occluder.
tile_set_occluder_offset ::
                           (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
tile_set_occluder_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_occluder_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_occluder_offset"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_occluder_offset

{-# NOINLINE bindTileSet_tile_set_region #-}

-- | Sets the tile's sub-region in the texture. This is common in texture atlases.
bindTileSet_tile_set_region :: MethodBind
bindTileSet_tile_set_region
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's sub-region in the texture. This is common in texture atlases.
tile_set_region ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> Rect2 -> IO ()
tile_set_region cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_region" '[Int, Rect2] (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_region

{-# NOINLINE bindTileSet_tile_set_shape #-}

-- | Sets a shape for the tile, enabling collision.
bindTileSet_tile_set_shape :: MethodBind
bindTileSet_tile_set_shape
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a shape for the tile, enabling collision.
tile_set_shape ::
                 (TileSet :< cls, Object :< cls) =>
                 cls -> Int -> Int -> Shape2D -> IO ()
tile_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape" '[Int, Int, Shape2D]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape

{-# NOINLINE bindTileSet_tile_set_shape_offset #-}

-- | Sets the offset of a tile's shape.
bindTileSet_tile_set_shape_offset :: MethodBind
bindTileSet_tile_set_shape_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the offset of a tile's shape.
tile_set_shape_offset ::
                        (TileSet :< cls, Object :< cls) =>
                        cls -> Int -> Int -> Vector2 -> IO ()
tile_set_shape_offset cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_offset"
           '[Int, Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_offset

{-# NOINLINE bindTileSet_tile_set_shape_one_way #-}

-- | Enables one-way collision on a tile's shape.
bindTileSet_tile_set_shape_one_way :: MethodBind
bindTileSet_tile_set_shape_one_way
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_one_way" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables one-way collision on a tile's shape.
tile_set_shape_one_way ::
                         (TileSet :< cls, Object :< cls) =>
                         cls -> Int -> Int -> Bool -> IO ()
tile_set_shape_one_way cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_one_way
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_one_way"
           '[Int, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_one_way

{-# NOINLINE bindTileSet_tile_set_shape_one_way_margin #-}

bindTileSet_tile_set_shape_one_way_margin :: MethodBind
bindTileSet_tile_set_shape_one_way_margin
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_one_way_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

tile_set_shape_one_way_margin ::
                                (TileSet :< cls, Object :< cls) =>
                                cls -> Int -> Int -> Float -> IO ()
tile_set_shape_one_way_margin cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_one_way_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_one_way_margin"
           '[Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_one_way_margin

{-# NOINLINE bindTileSet_tile_set_shape_transform #-}

-- | Sets a @Transform2D@ on a tile's shape.
bindTileSet_tile_set_shape_transform :: MethodBind
bindTileSet_tile_set_shape_transform
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a @Transform2D@ on a tile's shape.
tile_set_shape_transform ::
                           (TileSet :< cls, Object :< cls) =>
                           cls -> Int -> Int -> Transform2d -> IO ()
tile_set_shape_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shape_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shape_transform"
           '[Int, Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shape_transform

{-# NOINLINE bindTileSet_tile_set_shapes #-}

-- | Sets an array of shapes for the tile, enabling collision.
bindTileSet_tile_set_shapes :: MethodBind
bindTileSet_tile_set_shapes
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an array of shapes for the tile, enabling collision.
tile_set_shapes ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> Array -> IO ()
tile_set_shapes cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_shapes" '[Int, Array] (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_shapes

{-# NOINLINE bindTileSet_tile_set_texture #-}

-- | Sets the tile's texture.
bindTileSet_tile_set_texture :: MethodBind
bindTileSet_tile_set_texture
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's texture.
tile_set_texture ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
tile_set_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_texture" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_texture

{-# NOINLINE bindTileSet_tile_set_texture_offset #-}

-- | Sets the tile's texture offset.
bindTileSet_tile_set_texture_offset :: MethodBind
bindTileSet_tile_set_texture_offset
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's texture offset.
tile_set_texture_offset ::
                          (TileSet :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
tile_set_texture_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_texture_offset"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_texture_offset

{-# NOINLINE bindTileSet_tile_set_tile_mode #-}

-- | Sets the tile's @enum TileMode@.
bindTileSet_tile_set_tile_mode :: MethodBind
bindTileSet_tile_set_tile_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_tile_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's @enum TileMode@.
tile_set_tile_mode ::
                     (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
tile_set_tile_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_tile_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_tile_mode" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_tile_mode

{-# NOINLINE bindTileSet_tile_set_z_index #-}

-- | Sets the tile's drawing index.
bindTileSet_tile_set_z_index :: MethodBind
bindTileSet_tile_set_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's drawing index.
tile_set_z_index ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
tile_set_z_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_z_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TileSet "tile_set_z_index" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.TileSet.tile_set_z_index