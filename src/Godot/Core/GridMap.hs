{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GridMap
       (Godot.Core.GridMap._INVALID_CELL_ITEM,
        Godot.Core.GridMap.set_collision_layer,
        Godot.Core.GridMap.get_collision_layer,
        Godot.Core.GridMap.set_collision_mask,
        Godot.Core.GridMap.get_collision_mask,
        Godot.Core.GridMap.set_collision_mask_bit,
        Godot.Core.GridMap.get_collision_mask_bit,
        Godot.Core.GridMap.set_collision_layer_bit,
        Godot.Core.GridMap.get_collision_layer_bit,
        Godot.Core.GridMap.set_theme, Godot.Core.GridMap.get_theme,
        Godot.Core.GridMap.set_mesh_library,
        Godot.Core.GridMap.get_mesh_library,
        Godot.Core.GridMap.set_cell_size, Godot.Core.GridMap.get_cell_size,
        Godot.Core.GridMap.set_cell_scale,
        Godot.Core.GridMap.get_cell_scale,
        Godot.Core.GridMap.set_octant_size,
        Godot.Core.GridMap.get_octant_size,
        Godot.Core.GridMap.set_cell_item, Godot.Core.GridMap.get_cell_item,
        Godot.Core.GridMap.get_cell_item_orientation,
        Godot.Core.GridMap.world_to_map, Godot.Core.GridMap.map_to_world,
        Godot.Core.GridMap._update_octants_callback,
        Godot.Core.GridMap.resource_changed,
        Godot.Core.GridMap.set_center_x, Godot.Core.GridMap.get_center_x,
        Godot.Core.GridMap.set_center_y, Godot.Core.GridMap.get_center_y,
        Godot.Core.GridMap.set_center_z, Godot.Core.GridMap.get_center_z,
        Godot.Core.GridMap.set_clip, Godot.Core.GridMap.clear,
        Godot.Core.GridMap.get_used_cells, Godot.Core.GridMap.get_meshes,
        Godot.Core.GridMap.get_bake_meshes,
        Godot.Core.GridMap.get_bake_mesh_instance,
        Godot.Core.GridMap.clear_baked_meshes,
        Godot.Core.GridMap.make_baked_meshes)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_INVALID_CELL_ITEM :: Int
_INVALID_CELL_ITEM = -1

{-# NOINLINE bindGridMap_set_collision_layer #-}

bindGridMap_set_collision_layer :: MethodBind
bindGridMap_set_collision_layer
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_layer ::
                      (GridMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_collision_layer #-}

bindGridMap_get_collision_layer :: MethodBind
bindGridMap_get_collision_layer
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_layer ::
                      (GridMap :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_collision_mask #-}

bindGridMap_set_collision_mask :: MethodBind
bindGridMap_set_collision_mask
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask ::
                     (GridMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_collision_mask #-}

bindGridMap_get_collision_mask :: MethodBind
bindGridMap_get_collision_mask
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask ::
                     (GridMap :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_collision_mask_bit #-}

bindGridMap_set_collision_mask_bit :: MethodBind
bindGridMap_set_collision_mask_bit
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask_bit ::
                         (GridMap :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_collision_mask_bit #-}

bindGridMap_get_collision_mask_bit :: MethodBind
bindGridMap_get_collision_mask_bit
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask_bit ::
                         (GridMap :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_collision_layer_bit #-}

bindGridMap_set_collision_layer_bit :: MethodBind
bindGridMap_set_collision_layer_bit
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_layer_bit ::
                          (GridMap :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_collision_layer_bit #-}

bindGridMap_get_collision_layer_bit :: MethodBind
bindGridMap_get_collision_layer_bit
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_layer_bit ::
                          (GridMap :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_theme #-}

bindGridMap_set_theme :: MethodBind
bindGridMap_set_theme
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_theme ::
            (GridMap :< cls, Object :< cls) => cls -> MeshLibrary -> IO ()
set_theme cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_theme (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_theme #-}

bindGridMap_get_theme :: MethodBind
bindGridMap_get_theme
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_theme ::
            (GridMap :< cls, Object :< cls) => cls -> IO MeshLibrary
get_theme cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_theme (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_mesh_library #-}

bindGridMap_set_mesh_library :: MethodBind
bindGridMap_set_mesh_library
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_mesh_library" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh_library ::
                   (GridMap :< cls, Object :< cls) => cls -> MeshLibrary -> IO ()
set_mesh_library cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_mesh_library (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_mesh_library #-}

bindGridMap_get_mesh_library :: MethodBind
bindGridMap_get_mesh_library
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_mesh_library" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh_library ::
                   (GridMap :< cls, Object :< cls) => cls -> IO MeshLibrary
get_mesh_library cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_mesh_library (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_cell_size #-}

bindGridMap_set_cell_size :: MethodBind
bindGridMap_set_cell_size
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_size ::
                (GridMap :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_cell_size #-}

bindGridMap_get_cell_size :: MethodBind
bindGridMap_get_cell_size
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_size ::
                (GridMap :< cls, Object :< cls) => cls -> IO Vector3
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_cell_scale #-}

bindGridMap_set_cell_scale :: MethodBind
bindGridMap_set_cell_scale
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_cell_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_scale ::
                 (GridMap :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_cell_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_cell_scale #-}

bindGridMap_get_cell_scale :: MethodBind
bindGridMap_get_cell_scale
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_cell_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_scale ::
                 (GridMap :< cls, Object :< cls) => cls -> IO Float
get_cell_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_cell_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_octant_size #-}

bindGridMap_set_octant_size :: MethodBind
bindGridMap_set_octant_size
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_octant_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_octant_size ::
                  (GridMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_octant_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_octant_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_octant_size #-}

bindGridMap_get_octant_size :: MethodBind
bindGridMap_get_octant_size
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_octant_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_octant_size :: (GridMap :< cls, Object :< cls) => cls -> IO Int
get_octant_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_octant_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_cell_item #-}

bindGridMap_set_cell_item :: MethodBind
bindGridMap_set_cell_item
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_cell_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_item ::
                (GridMap :< cls, Object :< cls) =>
                cls -> Int -> Int -> Int -> Int -> Int -> IO ()
set_cell_item cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_cell_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_cell_item #-}

bindGridMap_get_cell_item :: MethodBind
bindGridMap_get_cell_item
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_cell_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_item ::
                (GridMap :< cls, Object :< cls) =>
                cls -> Int -> Int -> Int -> IO Int
get_cell_item cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_cell_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_cell_item_orientation #-}

bindGridMap_get_cell_item_orientation :: MethodBind
bindGridMap_get_cell_item_orientation
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_cell_item_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_item_orientation ::
                            (GridMap :< cls, Object :< cls) =>
                            cls -> Int -> Int -> Int -> IO Int
get_cell_item_orientation cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_cell_item_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_world_to_map #-}

bindGridMap_world_to_map :: MethodBind
bindGridMap_world_to_map
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "world_to_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

world_to_map ::
               (GridMap :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
world_to_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_world_to_map (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_map_to_world #-}

bindGridMap_map_to_world :: MethodBind
bindGridMap_map_to_world
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "map_to_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

map_to_world ::
               (GridMap :< cls, Object :< cls) =>
               cls -> Int -> Int -> Int -> IO Vector3
map_to_world cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_map_to_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap__update_octants_callback #-}

bindGridMap__update_octants_callback :: MethodBind
bindGridMap__update_octants_callback
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "_update_octants_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_octants_callback ::
                           (GridMap :< cls, Object :< cls) => cls -> IO ()
_update_octants_callback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap__update_octants_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_resource_changed #-}

bindGridMap_resource_changed :: MethodBind
bindGridMap_resource_changed
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "resource_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resource_changed ::
                   (GridMap :< cls, Object :< cls) => cls -> Resource -> IO ()
resource_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_resource_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_center_x #-}

bindGridMap_set_center_x :: MethodBind
bindGridMap_set_center_x
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_center_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_center_x ::
               (GridMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_center_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_center_x (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_center_x #-}

bindGridMap_get_center_x :: MethodBind
bindGridMap_get_center_x
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_center_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_center_x :: (GridMap :< cls, Object :< cls) => cls -> IO Bool
get_center_x cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_center_x (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_center_y #-}

bindGridMap_set_center_y :: MethodBind
bindGridMap_set_center_y
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_center_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_center_y ::
               (GridMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_center_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_center_y (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_center_y #-}

bindGridMap_get_center_y :: MethodBind
bindGridMap_get_center_y
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_center_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_center_y :: (GridMap :< cls, Object :< cls) => cls -> IO Bool
get_center_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_center_y (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_center_z #-}

bindGridMap_set_center_z :: MethodBind
bindGridMap_set_center_z
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_center_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_center_z ::
               (GridMap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_center_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_center_z (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_center_z #-}

bindGridMap_get_center_z :: MethodBind
bindGridMap_get_center_z
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_center_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_center_z :: (GridMap :< cls, Object :< cls) => cls -> IO Bool
get_center_z cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_center_z (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_set_clip #-}

bindGridMap_set_clip :: MethodBind
bindGridMap_set_clip
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "set_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_clip ::
           (GridMap :< cls, Object :< cls) =>
           cls -> Bool -> Bool -> Int -> Int -> IO ()
set_clip cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_set_clip (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_clear #-}

bindGridMap_clear :: MethodBind
bindGridMap_clear
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (GridMap :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_used_cells #-}

bindGridMap_get_used_cells :: MethodBind
bindGridMap_get_used_cells
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_used_cells" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_used_cells ::
                 (GridMap :< cls, Object :< cls) => cls -> IO Array
get_used_cells cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_used_cells (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_meshes #-}

bindGridMap_get_meshes :: MethodBind
bindGridMap_get_meshes
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_meshes :: (GridMap :< cls, Object :< cls) => cls -> IO Array
get_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_meshes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_bake_meshes #-}

bindGridMap_get_bake_meshes :: MethodBind
bindGridMap_get_bake_meshes
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_bake_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bake_meshes ::
                  (GridMap :< cls, Object :< cls) => cls -> IO Array
get_bake_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_bake_meshes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_get_bake_mesh_instance #-}

bindGridMap_get_bake_mesh_instance :: MethodBind
bindGridMap_get_bake_mesh_instance
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "get_bake_mesh_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bake_mesh_instance ::
                         (GridMap :< cls, Object :< cls) => cls -> Int -> IO Rid
get_bake_mesh_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_get_bake_mesh_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_clear_baked_meshes #-}

bindGridMap_clear_baked_meshes :: MethodBind
bindGridMap_clear_baked_meshes
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "clear_baked_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_baked_meshes ::
                     (GridMap :< cls, Object :< cls) => cls -> IO ()
clear_baked_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_clear_baked_meshes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridMap_make_baked_meshes #-}

bindGridMap_make_baked_meshes :: MethodBind
bindGridMap_make_baked_meshes
  = unsafePerformIO $
      withCString "GridMap" $
        \ clsNamePtr ->
          withCString "make_baked_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_baked_meshes ::
                    (GridMap :< cls, Object :< cls) => cls -> Bool -> Float -> IO ()
make_baked_meshes cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridMap_make_baked_meshes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)