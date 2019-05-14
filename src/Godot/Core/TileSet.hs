{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TileSet
       (Godot.Core.TileSet._BITMASK_2X2, Godot.Core.TileSet._BITMASK_3X3,
        Godot.Core.TileSet._BIND_BOTTOMLEFT, Godot.Core.TileSet._BIND_LEFT,
        Godot.Core.TileSet._ATLAS_TILE,
        Godot.Core.TileSet._BITMASK_3X3_MINIMAL,
        Godot.Core.TileSet._BIND_RIGHT, Godot.Core.TileSet._BIND_TOPLEFT,
        Godot.Core.TileSet._BIND_BOTTOM,
        Godot.Core.TileSet._BIND_BOTTOMRIGHT,
        Godot.Core.TileSet._AUTO_TILE, Godot.Core.TileSet._BIND_TOP,
        Godot.Core.TileSet._BIND_TOPRIGHT, Godot.Core.TileSet._SINGLE_TILE,
        Godot.Core.TileSet._is_tile_bound,
        Godot.Core.TileSet._forward_subtile_selection,
        Godot.Core.TileSet.create_tile,
        Godot.Core.TileSet.autotile_clear_bitmask_map,
        Godot.Core.TileSet.autotile_set_icon_coordinate,
        Godot.Core.TileSet.autotile_get_icon_coordinate,
        Godot.Core.TileSet.autotile_set_subtile_priority,
        Godot.Core.TileSet.autotile_get_subtile_priority,
        Godot.Core.TileSet.autotile_set_z_index,
        Godot.Core.TileSet.autotile_get_z_index,
        Godot.Core.TileSet.autotile_set_light_occluder,
        Godot.Core.TileSet.autotile_get_light_occluder,
        Godot.Core.TileSet.autotile_set_navigation_polygon,
        Godot.Core.TileSet.autotile_get_navigation_polygon,
        Godot.Core.TileSet.autotile_set_bitmask,
        Godot.Core.TileSet.autotile_get_bitmask,
        Godot.Core.TileSet.autotile_set_bitmask_mode,
        Godot.Core.TileSet.autotile_get_bitmask_mode,
        Godot.Core.TileSet.autotile_set_spacing,
        Godot.Core.TileSet.autotile_get_spacing,
        Godot.Core.TileSet.autotile_set_size,
        Godot.Core.TileSet.autotile_get_size,
        Godot.Core.TileSet.tile_set_name, Godot.Core.TileSet.tile_get_name,
        Godot.Core.TileSet.tile_set_texture,
        Godot.Core.TileSet.tile_get_texture,
        Godot.Core.TileSet.tile_set_normal_map,
        Godot.Core.TileSet.tile_get_normal_map,
        Godot.Core.TileSet.tile_set_material,
        Godot.Core.TileSet.tile_get_material,
        Godot.Core.TileSet.tile_set_modulate,
        Godot.Core.TileSet.tile_get_modulate,
        Godot.Core.TileSet.tile_set_texture_offset,
        Godot.Core.TileSet.tile_get_texture_offset,
        Godot.Core.TileSet.tile_set_region,
        Godot.Core.TileSet.tile_get_region,
        Godot.Core.TileSet.tile_set_shape,
        Godot.Core.TileSet.tile_get_shape,
        Godot.Core.TileSet.tile_set_shape_offset,
        Godot.Core.TileSet.tile_get_shape_offset,
        Godot.Core.TileSet.tile_set_shape_transform,
        Godot.Core.TileSet.tile_get_shape_transform,
        Godot.Core.TileSet.tile_set_shape_one_way,
        Godot.Core.TileSet.tile_get_shape_one_way,
        Godot.Core.TileSet.tile_set_shape_one_way_margin,
        Godot.Core.TileSet.tile_get_shape_one_way_margin,
        Godot.Core.TileSet.tile_add_shape,
        Godot.Core.TileSet.tile_get_shape_count,
        Godot.Core.TileSet.tile_set_shapes,
        Godot.Core.TileSet.tile_get_shapes,
        Godot.Core.TileSet.tile_set_tile_mode,
        Godot.Core.TileSet.tile_get_tile_mode,
        Godot.Core.TileSet.tile_set_navigation_polygon,
        Godot.Core.TileSet.tile_get_navigation_polygon,
        Godot.Core.TileSet.tile_set_navigation_polygon_offset,
        Godot.Core.TileSet.tile_get_navigation_polygon_offset,
        Godot.Core.TileSet.tile_set_light_occluder,
        Godot.Core.TileSet.tile_get_light_occluder,
        Godot.Core.TileSet.tile_set_occluder_offset,
        Godot.Core.TileSet.tile_get_occluder_offset,
        Godot.Core.TileSet.tile_set_z_index,
        Godot.Core.TileSet.tile_get_z_index,
        Godot.Core.TileSet.remove_tile, Godot.Core.TileSet.clear,
        Godot.Core.TileSet.get_last_unused_tile_id,
        Godot.Core.TileSet.find_tile_by_name,
        Godot.Core.TileSet.get_tiles_ids)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_BITMASK_2X2 :: Int
_BITMASK_2X2 = 0

_BITMASK_3X3 :: Int
_BITMASK_3X3 = 2

_BIND_BOTTOMLEFT :: Int
_BIND_BOTTOMLEFT = 64

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

{-# NOINLINE bindTileSet__is_tile_bound #-}

bindTileSet__is_tile_bound :: MethodBind
bindTileSet__is_tile_bound
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "_is_tile_bound" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_tile_bound ::
                 (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
_is_tile_bound cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet__is_tile_bound (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindTileSet_autotile_clear_bitmask_map #-}

-- | Clears all bitmask info of the autotile.
bindTileSet_autotile_clear_bitmask_map :: MethodBind
bindTileSet_autotile_clear_bitmask_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_clear_bitmask_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all bitmask info of the autotile.
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

{-# NOINLINE bindTileSet_autotile_set_icon_coordinate #-}

-- | Sets the subtile that will be used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask info is incomplete. It will also be used to represent it in the TileSet editor.
bindTileSet_autotile_set_icon_coordinate :: MethodBind
bindTileSet_autotile_set_icon_coordinate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_icon_coordinate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the subtile that will be used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask info is incomplete. It will also be used to represent it in the TileSet editor.
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

{-# NOINLINE bindTileSet_autotile_get_icon_coordinate #-}

-- | Returns the subtile that's being used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask info is incomplete. It will also be used to represent it in the TileSet editor.
bindTileSet_autotile_get_icon_coordinate :: MethodBind
bindTileSet_autotile_get_icon_coordinate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_icon_coordinate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the subtile that's being used as an icon in an atlas/autotile given its coordinates.
--   				The subtile defined as the icon will be used as a fallback when the atlas/autotile's bitmask info is incomplete. It will also be used to represent it in the TileSet editor.
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

{-# NOINLINE bindTileSet_autotile_set_bitmask #-}

-- | Sets the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in [enum TileSet.AutotileBindings] present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
bindTileSet_autotile_set_bitmask :: MethodBind
bindTileSet_autotile_set_bitmask
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in [enum TileSet.AutotileBindings] present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
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

{-# NOINLINE bindTileSet_autotile_get_bitmask #-}

-- | Returns the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in [enum TileSet.AutotileBindings] present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
bindTileSet_autotile_get_bitmask :: MethodBind
bindTileSet_autotile_get_bitmask
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_bitmask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bitmask of the subtile from an autotile given its coordinates.
--   				The value is the sum of the values in [enum TileSet.AutotileBindings] present in the subtile (e.g. a value of 5 means the bitmask has bindings in both the top left and top right).
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

{-# NOINLINE bindTileSet_autotile_set_bitmask_mode #-}

-- | Sets the [enum TileSet.BitmaskMode] of the autotile.
bindTileSet_autotile_set_bitmask_mode :: MethodBind
bindTileSet_autotile_set_bitmask_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_set_bitmask_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [enum TileSet.BitmaskMode] of the autotile.
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

{-# NOINLINE bindTileSet_autotile_get_bitmask_mode #-}

-- | Returns the [enum TileSet.BitmaskMode] of the autotile.
bindTileSet_autotile_get_bitmask_mode :: MethodBind
bindTileSet_autotile_get_bitmask_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "autotile_get_bitmask_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [enum TileSet.BitmaskMode] of the autotile.
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

{-# NOINLINE bindTileSet_tile_set_normal_map #-}

-- | Sets the tile's normal map texture.
bindTileSet_tile_set_normal_map :: MethodBind
bindTileSet_tile_set_normal_map
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's normal map texture.
tile_set_normal_map ::
                      (TileSet :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
tile_set_normal_map cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindTileSet_tile_set_modulate #-}

-- | Sets the tile's modulation color.
bindTileSet_tile_set_modulate :: MethodBind
bindTileSet_tile_set_modulate
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's modulation color.
tile_set_modulate ::
                    (TileSet :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
tile_set_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindTileSet_tile_set_shape_transform #-}

-- | Sets a [Transform2D] on a tile's shape.
bindTileSet_tile_set_shape_transform :: MethodBind
bindTileSet_tile_set_shape_transform
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a [Transform2D] on a tile's shape.
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

{-# NOINLINE bindTileSet_tile_get_shape_transform #-}

-- | Returns the [Transform2D] of a tile's shape.
bindTileSet_tile_get_shape_transform :: MethodBind
bindTileSet_tile_get_shape_transform
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shape_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Transform2D] of a tile's shape.
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
                 cls -> Int -> Shape2D -> Transform2d -> Bool -> Vector2 -> IO ()
tile_add_shape cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_add_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindTileSet_tile_get_shapes #-}

-- | Returns an array of the tile's shapes.
bindTileSet_tile_get_shapes :: MethodBind
bindTileSet_tile_get_shapes
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of the tile's shapes.
tile_get_shapes ::
                  (TileSet :< cls, Object :< cls) => cls -> Int -> IO Array
tile_get_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileSet_tile_set_tile_mode #-}

-- | Sets the tile's [enum TileSet.TileMode].
bindTileSet_tile_set_tile_mode :: MethodBind
bindTileSet_tile_set_tile_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_set_tile_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tile's [enum TileSet.TileMode].
tile_set_tile_mode ::
                     (TileSet :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
tile_set_tile_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_set_tile_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTileSet_tile_get_tile_mode #-}

-- | Returns the tile's [enum TileSet.TileMode].
bindTileSet_tile_get_tile_mode :: MethodBind
bindTileSet_tile_get_tile_mode
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_tile_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's [enum TileSet.TileMode].
tile_get_tile_mode ::
                     (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_tile_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_tile_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindTileSet_tile_get_z_index #-}

-- | Returns the tile's z-index (drawing layer).
bindTileSet_tile_get_z_index :: MethodBind
bindTileSet_tile_get_z_index
  = unsafePerformIO $
      withCString "TileSet" $
        \ clsNamePtr ->
          withCString "tile_get_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tile's z-index (drawing layer).
tile_get_z_index ::
                   (TileSet :< cls, Object :< cls) => cls -> Int -> IO Int
tile_get_z_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTileSet_tile_get_z_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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