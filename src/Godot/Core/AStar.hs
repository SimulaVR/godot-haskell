{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AStar
       (Godot.Core.AStar._compute_cost, Godot.Core.AStar._estimate_cost,
        Godot.Core.AStar.add_point, Godot.Core.AStar.are_points_connected,
        Godot.Core.AStar.clear, Godot.Core.AStar.connect_points,
        Godot.Core.AStar.disconnect_points,
        Godot.Core.AStar.get_available_point_id,
        Godot.Core.AStar.get_closest_point,
        Godot.Core.AStar.get_closest_position_in_segment,
        Godot.Core.AStar.get_id_path, Godot.Core.AStar.get_point_capacity,
        Godot.Core.AStar.get_point_connections,
        Godot.Core.AStar.get_point_count, Godot.Core.AStar.get_point_path,
        Godot.Core.AStar.get_point_position,
        Godot.Core.AStar.get_point_weight_scale,
        Godot.Core.AStar.get_points, Godot.Core.AStar.has_point,
        Godot.Core.AStar.is_point_disabled, Godot.Core.AStar.remove_point,
        Godot.Core.AStar.reserve_space,
        Godot.Core.AStar.set_point_disabled,
        Godot.Core.AStar.set_point_position,
        Godot.Core.AStar.set_point_weight_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAStar__compute_cost #-}

-- | Called when computing the cost between two connected points.
bindAStar__compute_cost :: MethodBind
bindAStar__compute_cost
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "_compute_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when computing the cost between two connected points.
_compute_cost ::
                (AStar :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
_compute_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar__compute_cost (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar__estimate_cost #-}

-- | Called when estimating the cost between a point and the path's ending point.
bindAStar__estimate_cost :: MethodBind
bindAStar__estimate_cost
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "_estimate_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when estimating the cost between a point and the path's ending point.
_estimate_cost ::
                 (AStar :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
_estimate_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar__estimate_cost (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_add_point #-}

-- | Adds a new point at the given position with the given identifier. The algorithm prefers points with lower [code]weight_scale[/code] to form a path. The [code]id[/code] must be 0 or larger, and the [code]weight_scale[/code] must be 1 or larger.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 0, 0), 4) # Adds the point (1, 0, 0) with weight_scale 4 and id 1
--   				[/codeblock]
--   				If there already exists a point for the given id, its position and weight scale are updated to the given values.
bindAStar_add_point :: MethodBind
bindAStar_add_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new point at the given position with the given identifier. The algorithm prefers points with lower [code]weight_scale[/code] to form a path. The [code]id[/code] must be 0 or larger, and the [code]weight_scale[/code] must be 1 or larger.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 0, 0), 4) # Adds the point (1, 0, 0) with weight_scale 4 and id 1
--   				[/codeblock]
--   				If there already exists a point for the given id, its position and weight scale are updated to the given values.
add_point ::
            (AStar :< cls, Object :< cls) =>
            cls -> Int -> Vector3 -> Float -> IO ()
add_point cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_add_point (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_are_points_connected #-}

-- | Returns whether there is a connection/segment between the given points.
bindAStar_are_points_connected :: MethodBind
bindAStar_are_points_connected
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "are_points_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether there is a connection/segment between the given points.
are_points_connected ::
                       (AStar :< cls, Object :< cls) =>
                       cls -> Int -> Int -> Bool -> IO Bool
are_points_connected cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_are_points_connected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_clear #-}

-- | Clears all the points and segments.
bindAStar_clear :: MethodBind
bindAStar_clear
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all the points and segments.
clear :: (AStar :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_clear (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_connect_points #-}

-- | Creates a segment between the given points. If [code]bidirectional[/code] is [code]false[/code], only movement from [code]id[/code] to [code]to_id[/code] is allowed, not the reverse direction.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 1, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2, false)
--   				[/codeblock]
bindAStar_connect_points :: MethodBind
bindAStar_connect_points
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "connect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a segment between the given points. If [code]bidirectional[/code] is [code]false[/code], only movement from [code]id[/code] to [code]to_id[/code] is allowed, not the reverse direction.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 1, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2, false)
--   				[/codeblock]
connect_points ::
                 (AStar :< cls, Object :< cls) => cls -> Int -> Int -> Bool -> IO ()
connect_points cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_connect_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_disconnect_points #-}

-- | Deletes the segment between the given points.
bindAStar_disconnect_points :: MethodBind
bindAStar_disconnect_points
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "disconnect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the segment between the given points.
disconnect_points ::
                    (AStar :< cls, Object :< cls) => cls -> Int -> Int -> Bool -> IO ()
disconnect_points cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_disconnect_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_available_point_id #-}

-- | Returns the next available point id with no point associated to it.
bindAStar_get_available_point_id :: MethodBind
bindAStar_get_available_point_id
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_available_point_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next available point id with no point associated to it.
get_available_point_id ::
                         (AStar :< cls, Object :< cls) => cls -> IO Int
get_available_point_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_available_point_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_closest_point #-}

-- | Returns the id of the closest point to [code]to_position[/code]. Returns -1 if there are no points in the points pool.
bindAStar_get_closest_point :: MethodBind
bindAStar_get_closest_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the id of the closest point to [code]to_position[/code]. Returns -1 if there are no points in the points pool.
get_closest_point ::
                    (AStar :< cls, Object :< cls) => cls -> Vector3 -> Bool -> IO Int
get_closest_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_closest_position_in_segment #-}

-- | Returns the closest position to [code]to_position[/code] that resides inside a segment between two connected points.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2)
--   				var res = astar.get_closest_position_in_segment(Vector3(3, 3, 0)) # Returns (0, 3, 0)
--   				[/codeblock]
--   				The result is in the segment that goes from [code]y = 0[/code] to [code]y = 5[/code]. It's the closest position in the segment to the given point.
bindAStar_get_closest_position_in_segment :: MethodBind
bindAStar_get_closest_position_in_segment
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_closest_position_in_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest position to [code]to_position[/code] that resides inside a segment between two connected points.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2)
--   				var res = astar.get_closest_position_in_segment(Vector3(3, 3, 0)) # Returns (0, 3, 0)
--   				[/codeblock]
--   				The result is in the segment that goes from [code]y = 0[/code] to [code]y = 5[/code]. It's the closest position in the segment to the given point.
get_closest_position_in_segment ::
                                  (AStar :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_position_in_segment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_closest_position_in_segment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_id_path #-}

-- | Returns an array with the ids of the points that form the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 1, 0), 1) # Default weight is 1
--   				astar.add_point(3, Vector3(1, 1, 0))
--   				astar.add_point(4, Vector3(2, 0, 0))
--   
--   				astar.connect_points(1, 2, false)
--   				astar.connect_points(2, 3, false)
--   				astar.connect_points(4, 3, false)
--   				astar.connect_points(1, 4, false)
--   
--   				var res = astar.get_id_path(1, 3) # Returns [1, 2, 3]
--   				[/codeblock]
--   				If you change the 2nd point's weight to 3, then the result will be [code][1, 4, 3][/code] instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.
bindAStar_get_id_path :: MethodBind
bindAStar_get_id_path
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_id_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the ids of the points that form the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 1, 0), 1) # Default weight is 1
--   				astar.add_point(3, Vector3(1, 1, 0))
--   				astar.add_point(4, Vector3(2, 0, 0))
--   
--   				astar.connect_points(1, 2, false)
--   				astar.connect_points(2, 3, false)
--   				astar.connect_points(4, 3, false)
--   				astar.connect_points(1, 4, false)
--   
--   				var res = astar.get_id_path(1, 3) # Returns [1, 2, 3]
--   				[/codeblock]
--   				If you change the 2nd point's weight to 3, then the result will be [code][1, 4, 3][/code] instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.
get_id_path ::
              (AStar :< cls, Object :< cls) =>
              cls -> Int -> Int -> IO PoolIntArray
get_id_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_id_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_point_capacity #-}

bindAStar_get_point_capacity :: MethodBind
bindAStar_get_point_capacity
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_capacity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_capacity ::
                     (AStar :< cls, Object :< cls) => cls -> IO Int
get_point_capacity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_capacity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_point_connections #-}

-- | Returns an array with the ids of the points that form the connect with the given point.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 1, 0))
--   				astar.add_point(3, Vector3(1, 1, 0))
--   				astar.add_point(4, Vector3(2, 0, 0))
--   
--   				astar.connect_points(1, 2, true)
--   				astar.connect_points(1, 3, true)
--   
--   				var neighbors = astar.get_point_connections(1) # Returns [2, 3]
--   				[/codeblock]
bindAStar_get_point_connections :: MethodBind
bindAStar_get_point_connections
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the ids of the points that form the connect with the given point.
--   				[codeblock]
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 1, 0))
--   				astar.add_point(3, Vector3(1, 1, 0))
--   				astar.add_point(4, Vector3(2, 0, 0))
--   
--   				astar.connect_points(1, 2, true)
--   				astar.connect_points(1, 3, true)
--   
--   				var neighbors = astar.get_point_connections(1) # Returns [2, 3]
--   				[/codeblock]
get_point_connections ::
                        (AStar :< cls, Object :< cls) => cls -> Int -> IO PoolIntArray
get_point_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_connections (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_point_count #-}

bindAStar_get_point_count :: MethodBind
bindAStar_get_point_count
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_count :: (AStar :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_point_path #-}

-- | Returns an array with the points that are in the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
bindAStar_get_point_path :: MethodBind
bindAStar_get_point_path
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the points that are in the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
get_point_path ::
                 (AStar :< cls, Object :< cls) =>
                 cls -> Int -> Int -> IO PoolVector3Array
get_point_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_point_position #-}

-- | Returns the position of the point associated with the given id.
bindAStar_get_point_position :: MethodBind
bindAStar_get_point_position
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the point associated with the given id.
get_point_position ::
                     (AStar :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_point_weight_scale #-}

-- | Returns the weight scale of the point associated with the given id.
bindAStar_get_point_weight_scale :: MethodBind
bindAStar_get_point_weight_scale
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the weight scale of the point associated with the given id.
get_point_weight_scale ::
                         (AStar :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_weight_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_weight_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_get_points #-}

-- | Returns an array of all points.
bindAStar_get_points :: MethodBind
bindAStar_get_points
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all points.
get_points :: (AStar :< cls, Object :< cls) => cls -> IO Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_points (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_has_point #-}

-- | Returns whether a point associated with the given id exists.
bindAStar_has_point :: MethodBind
bindAStar_has_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "has_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a point associated with the given id exists.
has_point :: (AStar :< cls, Object :< cls) => cls -> Int -> IO Bool
has_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_has_point (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_is_point_disabled #-}

-- | Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.
bindAStar_is_point_disabled :: MethodBind
bindAStar_is_point_disabled
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "is_point_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.
is_point_disabled ::
                    (AStar :< cls, Object :< cls) => cls -> Int -> IO Bool
is_point_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_is_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_remove_point #-}

-- | Removes the point associated with the given id from the points pool.
bindAStar_remove_point :: MethodBind
bindAStar_remove_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the point associated with the given id from the points pool.
remove_point ::
               (AStar :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_reserve_space #-}

bindAStar_reserve_space :: MethodBind
bindAStar_reserve_space
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "reserve_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reserve_space ::
                (AStar :< cls, Object :< cls) => cls -> Int -> IO ()
reserve_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_reserve_space (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_set_point_disabled #-}

-- | Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.
bindAStar_set_point_disabled :: MethodBind
bindAStar_set_point_disabled
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "set_point_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.
set_point_disabled ::
                     (AStar :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_point_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_set_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_set_point_position #-}

-- | Sets the position for the point with the given id.
bindAStar_set_point_position :: MethodBind
bindAStar_set_point_position
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position for the point with the given id.
set_point_position ::
                     (AStar :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAStar_set_point_weight_scale #-}

-- | Sets the [code]weight_scale[/code] for the point with the given id.
bindAStar_set_point_weight_scale :: MethodBind
bindAStar_set_point_weight_scale
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "set_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [code]weight_scale[/code] for the point with the given id.
set_point_weight_scale ::
                         (AStar :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_point_weight_scale cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_set_point_weight_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)