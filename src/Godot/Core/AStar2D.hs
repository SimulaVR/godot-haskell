{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AStar2D
       (Godot.Core.AStar2D.add_point,
        Godot.Core.AStar2D.are_points_connected, Godot.Core.AStar2D.clear,
        Godot.Core.AStar2D.connect_points,
        Godot.Core.AStar2D.disconnect_points,
        Godot.Core.AStar2D.get_available_point_id,
        Godot.Core.AStar2D.get_closest_point,
        Godot.Core.AStar2D.get_closest_position_in_segment,
        Godot.Core.AStar2D.get_id_path,
        Godot.Core.AStar2D.get_point_capacity,
        Godot.Core.AStar2D.get_point_connections,
        Godot.Core.AStar2D.get_point_count,
        Godot.Core.AStar2D.get_point_path,
        Godot.Core.AStar2D.get_point_position,
        Godot.Core.AStar2D.get_point_weight_scale,
        Godot.Core.AStar2D.get_points, Godot.Core.AStar2D.has_point,
        Godot.Core.AStar2D.is_point_disabled,
        Godot.Core.AStar2D.remove_point, Godot.Core.AStar2D.reserve_space,
        Godot.Core.AStar2D.set_point_disabled,
        Godot.Core.AStar2D.set_point_position,
        Godot.Core.AStar2D.set_point_weight_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAStar2D_add_point #-}

bindAStar2D_add_point :: MethodBind
bindAStar2D_add_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_point ::
            (AStar2D :< cls, Object :< cls) =>
            cls -> Int -> Vector2 -> Float -> IO ()
add_point cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_add_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_are_points_connected #-}

bindAStar2D_are_points_connected :: MethodBind
bindAStar2D_are_points_connected
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "are_points_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

are_points_connected ::
                       (AStar2D :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
are_points_connected cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_are_points_connected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_clear #-}

bindAStar2D_clear :: MethodBind
bindAStar2D_clear
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (AStar2D :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_connect_points #-}

bindAStar2D_connect_points :: MethodBind
bindAStar2D_connect_points
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "connect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

connect_points ::
                 (AStar2D :< cls, Object :< cls) =>
                 cls -> Int -> Int -> Bool -> IO ()
connect_points cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_connect_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_disconnect_points #-}

bindAStar2D_disconnect_points :: MethodBind
bindAStar2D_disconnect_points
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "disconnect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

disconnect_points ::
                    (AStar2D :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
disconnect_points cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_disconnect_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_available_point_id #-}

bindAStar2D_get_available_point_id :: MethodBind
bindAStar2D_get_available_point_id
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_available_point_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_available_point_id ::
                         (AStar2D :< cls, Object :< cls) => cls -> IO Int
get_available_point_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_available_point_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_closest_point #-}

bindAStar2D_get_closest_point :: MethodBind
bindAStar2D_get_closest_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point ::
                    (AStar2D :< cls, Object :< cls) => cls -> Vector2 -> Bool -> IO Int
get_closest_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_closest_position_in_segment #-}

bindAStar2D_get_closest_position_in_segment :: MethodBind
bindAStar2D_get_closest_position_in_segment
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_closest_position_in_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_position_in_segment ::
                                  (AStar2D :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
get_closest_position_in_segment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_closest_position_in_segment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_id_path #-}

bindAStar2D_get_id_path :: MethodBind
bindAStar2D_get_id_path
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_id_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_id_path ::
              (AStar2D :< cls, Object :< cls) =>
              cls -> Int -> Int -> IO PoolIntArray
get_id_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_id_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_point_capacity #-}

bindAStar2D_get_point_capacity :: MethodBind
bindAStar2D_get_point_capacity
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_capacity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_capacity ::
                     (AStar2D :< cls, Object :< cls) => cls -> IO Int
get_point_capacity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_capacity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_point_connections #-}

bindAStar2D_get_point_connections :: MethodBind
bindAStar2D_get_point_connections
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_connections ::
                        (AStar2D :< cls, Object :< cls) => cls -> Int -> IO PoolIntArray
get_point_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_point_count #-}

bindAStar2D_get_point_count :: MethodBind
bindAStar2D_get_point_count
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_count :: (AStar2D :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_point_path #-}

bindAStar2D_get_point_path :: MethodBind
bindAStar2D_get_point_path
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_path ::
                 (AStar2D :< cls, Object :< cls) =>
                 cls -> Int -> Int -> IO PoolVector2Array
get_point_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_point_position #-}

bindAStar2D_get_point_position :: MethodBind
bindAStar2D_get_point_position
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_position ::
                     (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_point_weight_scale #-}

bindAStar2D_get_point_weight_scale :: MethodBind
bindAStar2D_get_point_weight_scale
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_weight_scale ::
                         (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_weight_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_weight_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_get_points #-}

bindAStar2D_get_points :: MethodBind
bindAStar2D_get_points
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_points :: (AStar2D :< cls, Object :< cls) => cls -> IO Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_has_point #-}

bindAStar2D_has_point :: MethodBind
bindAStar2D_has_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "has_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_point ::
            (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Bool
has_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_has_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_is_point_disabled #-}

bindAStar2D_is_point_disabled :: MethodBind
bindAStar2D_is_point_disabled
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "is_point_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_point_disabled ::
                    (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Bool
is_point_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_is_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_remove_point #-}

bindAStar2D_remove_point :: MethodBind
bindAStar2D_remove_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_point ::
               (AStar2D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_reserve_space #-}

bindAStar2D_reserve_space :: MethodBind
bindAStar2D_reserve_space
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "reserve_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reserve_space ::
                (AStar2D :< cls, Object :< cls) => cls -> Int -> IO ()
reserve_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_reserve_space (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_set_point_disabled #-}

bindAStar2D_set_point_disabled :: MethodBind
bindAStar2D_set_point_disabled
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "set_point_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_point_disabled ::
                     (AStar2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_point_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_set_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_set_point_position #-}

bindAStar2D_set_point_position :: MethodBind
bindAStar2D_set_point_position
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_point_position ::
                     (AStar2D :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar2D_set_point_weight_scale #-}

bindAStar2D_set_point_weight_scale :: MethodBind
bindAStar2D_set_point_weight_scale
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "set_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_point_weight_scale ::
                         (AStar2D :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_weight_scale cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_set_point_weight_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)