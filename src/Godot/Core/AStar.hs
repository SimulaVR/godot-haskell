{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

{-# NOINLINE bindAStar__compute_cost #-}

-- | Called when computing the cost between two connected points.
--   				Note that this function is hidden in the default @AStar@ class.
bindAStar__compute_cost :: MethodBind
bindAStar__compute_cost
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "_compute_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when computing the cost between two connected points.
--   				Note that this function is hidden in the default @AStar@ class.
_compute_cost ::
                (AStar :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
_compute_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar__compute_cost (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "_compute_cost" '[Int, Int] (IO Float)
         where
        nodeMethod = Godot.Core.AStar._compute_cost

{-# NOINLINE bindAStar__estimate_cost #-}

-- | Called when estimating the cost between a point and the path's ending point.
--   				Note that this function is hidden in the default @AStar@ class.
bindAStar__estimate_cost :: MethodBind
bindAStar__estimate_cost
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "_estimate_cost" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when estimating the cost between a point and the path's ending point.
--   				Note that this function is hidden in the default @AStar@ class.
_estimate_cost ::
                 (AStar :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
_estimate_cost cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar__estimate_cost (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "_estimate_cost" '[Int, Int] (IO Float)
         where
        nodeMethod = Godot.Core.AStar._estimate_cost

{-# NOINLINE bindAStar_add_point #-}

-- | Adds a new point at the given position with the given identifier. The @id@ must be 0 or larger, and the @weight_scale@ must be 1 or larger.
--   				The @weight_scale@ is multiplied by the result of @method _compute_cost@ when determining the overall cost of traveling across a segment from a neighboring point to this point. Thus, all else being equal, the algorithm prefers points with lower @weight_scale@s to form a path.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 0, 0), 4) # Adds the point (1, 0, 0) with weight_scale 4 and id 1
--   				
--   @
--   
--   				If there already exists a point for the given @id@, its position and weight scale are updated to the given values.
bindAStar_add_point :: MethodBind
bindAStar_add_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new point at the given position with the given identifier. The @id@ must be 0 or larger, and the @weight_scale@ must be 1 or larger.
--   				The @weight_scale@ is multiplied by the result of @method _compute_cost@ when determining the overall cost of traveling across a segment from a neighboring point to this point. Thus, all else being equal, the algorithm prefers points with lower @weight_scale@s to form a path.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 0, 0), 4) # Adds the point (1, 0, 0) with weight_scale 4 and id 1
--   				
--   @
--   
--   				If there already exists a point for the given @id@, its position and weight scale are updated to the given values.
add_point ::
            (AStar :< cls, Object :< cls) =>
            cls -> Int -> Vector3 -> Maybe Float -> IO ()
add_point cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_add_point (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "add_point" '[Int, Vector3, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar.add_point

{-# NOINLINE bindAStar_are_points_connected #-}

-- | Returns whether the two given points are directly connected by a segment. If @bidirectional@ is @false@, returns whether movement from @id@ to @to_id@ is possible through this segment.
bindAStar_are_points_connected :: MethodBind
bindAStar_are_points_connected
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "are_points_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the two given points are directly connected by a segment. If @bidirectional@ is @false@, returns whether movement from @id@ to @to_id@ is possible through this segment.
are_points_connected ::
                       (AStar :< cls, Object :< cls) =>
                       cls -> Int -> Int -> Maybe Bool -> IO Bool
are_points_connected cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_are_points_connected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "are_points_connected"
           '[Int, Int, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AStar.are_points_connected

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

instance NodeMethod AStar "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.AStar.clear

{-# NOINLINE bindAStar_connect_points #-}

-- | Creates a segment between the given points. If @bidirectional@ is @false@, only movement from @id@ to @to_id@ is allowed, not the reverse direction.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 1, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2, false)
--   				
--   @
bindAStar_connect_points :: MethodBind
bindAStar_connect_points
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "connect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a segment between the given points. If @bidirectional@ is @false@, only movement from @id@ to @to_id@ is allowed, not the reverse direction.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(1, 1, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2, false)
--   				
--   @
connect_points ::
                 (AStar :< cls, Object :< cls) =>
                 cls -> Int -> Int -> Maybe Bool -> IO ()
connect_points cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_connect_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "connect_points" '[Int, Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar.connect_points

{-# NOINLINE bindAStar_disconnect_points #-}

-- | Deletes the segment between the given points. If @bidirectional@ is @false@, only movement from @id@ to @to_id@ is prevented, and a unidirectional segment possibly remains.
bindAStar_disconnect_points :: MethodBind
bindAStar_disconnect_points
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "disconnect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the segment between the given points. If @bidirectional@ is @false@, only movement from @id@ to @to_id@ is prevented, and a unidirectional segment possibly remains.
disconnect_points ::
                    (AStar :< cls, Object :< cls) =>
                    cls -> Int -> Int -> Maybe Bool -> IO ()
disconnect_points cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_disconnect_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "disconnect_points"
           '[Int, Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar.disconnect_points

{-# NOINLINE bindAStar_get_available_point_id #-}

-- | Returns the next available point ID with no point associated to it.
bindAStar_get_available_point_id :: MethodBind
bindAStar_get_available_point_id
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_available_point_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next available point ID with no point associated to it.
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

instance NodeMethod AStar "get_available_point_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AStar.get_available_point_id

{-# NOINLINE bindAStar_get_closest_point #-}

-- | Returns the ID of the closest point to @to_position@, optionally taking disabled points into account. Returns @-1@ if there are no points in the points pool.
--   				__Note:__ If several points are the closest to @to_position@, the one with the smallest ID will be returned, ensuring a deterministic result.
bindAStar_get_closest_point :: MethodBind
bindAStar_get_closest_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID of the closest point to @to_position@, optionally taking disabled points into account. Returns @-1@ if there are no points in the points pool.
--   				__Note:__ If several points are the closest to @to_position@, the one with the smallest ID will be returned, ensuring a deterministic result.
get_closest_point ::
                    (AStar :< cls, Object :< cls) =>
                    cls -> Vector3 -> Maybe Bool -> IO Int
get_closest_point cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_closest_point"
           '[Vector3, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.AStar.get_closest_point

{-# NOINLINE bindAStar_get_closest_position_in_segment #-}

-- | Returns the closest position to @to_position@ that resides inside a segment between two connected points.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2)
--   				var res = astar.get_closest_position_in_segment(Vector3(3, 3, 0)) # Returns (0, 3, 0)
--   				
--   @
--   
--   				The result is in the segment that goes from @y = 0@ to @y = 5@. It's the closest position in the segment to the given point.
bindAStar_get_closest_position_in_segment :: MethodBind
bindAStar_get_closest_position_in_segment
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_closest_position_in_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest position to @to_position@ that resides inside a segment between two connected points.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 5, 0))
--   				astar.connect_points(1, 2)
--   				var res = astar.get_closest_position_in_segment(Vector3(3, 3, 0)) # Returns (0, 3, 0)
--   				
--   @
--   
--   				The result is in the segment that goes from @y = 0@ to @y = 5@. It's the closest position in the segment to the given point.
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

instance NodeMethod AStar "get_closest_position_in_segment"
           '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.AStar.get_closest_position_in_segment

{-# NOINLINE bindAStar_get_id_path #-}

-- | Returns an array with the IDs of the points that form the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
--   				
--   @
--   
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
--   				var res = astar.get_id_path(1, 3) # Returns @1, 2, 3@
--   				
--   @
--   
--   				If you change the 2nd point's weight to 3, then the result will be @@1, 4, 3@@ instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.
bindAStar_get_id_path :: MethodBind
bindAStar_get_id_path
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_id_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the IDs of the points that form the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
--   				
--   @
--   
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
--   				var res = astar.get_id_path(1, 3) # Returns @1, 2, 3@
--   				
--   @
--   
--   				If you change the 2nd point's weight to 3, then the result will be @@1, 4, 3@@ instead, because now even though the distance is longer, it's "easier" to get through point 4 than through point 2.
get_id_path ::
              (AStar :< cls, Object :< cls) =>
              cls -> Int -> Int -> IO PoolIntArray
get_id_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_id_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_id_path" '[Int, Int]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.AStar.get_id_path

{-# NOINLINE bindAStar_get_point_capacity #-}

-- | Returns the capacity of the structure backing the points, useful in conjunction with @reserve_space@.
bindAStar_get_point_capacity :: MethodBind
bindAStar_get_point_capacity
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_capacity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the capacity of the structure backing the points, useful in conjunction with @reserve_space@.
get_point_capacity ::
                     (AStar :< cls, Object :< cls) => cls -> IO Int
get_point_capacity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_capacity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_point_capacity" '[] (IO Int) where
        nodeMethod = Godot.Core.AStar.get_point_capacity

{-# NOINLINE bindAStar_get_point_connections #-}

-- | Returns an array with the IDs of the points that form the connection with the given point.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 1, 0))
--   				astar.add_point(3, Vector3(1, 1, 0))
--   				astar.add_point(4, Vector3(2, 0, 0))
--   
--   				astar.connect_points(1, 2, true)
--   				astar.connect_points(1, 3, true)
--   
--   				var neighbors = astar.get_point_connections(1) # Returns @2, 3@
--   				
--   @
bindAStar_get_point_connections :: MethodBind
bindAStar_get_point_connections
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the IDs of the points that form the connection with the given point.
--   				
--   @
--   
--   				var astar = AStar.new()
--   				astar.add_point(1, Vector3(0, 0, 0))
--   				astar.add_point(2, Vector3(0, 1, 0))
--   				astar.add_point(3, Vector3(1, 1, 0))
--   				astar.add_point(4, Vector3(2, 0, 0))
--   
--   				astar.connect_points(1, 2, true)
--   				astar.connect_points(1, 3, true)
--   
--   				var neighbors = astar.get_point_connections(1) # Returns @2, 3@
--   				
--   @
get_point_connections ::
                        (AStar :< cls, Object :< cls) => cls -> Int -> IO PoolIntArray
get_point_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_connections (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_point_connections" '[Int]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.AStar.get_point_connections

{-# NOINLINE bindAStar_get_point_count #-}

-- | Returns the number of points currently in the points pool.
bindAStar_get_point_count :: MethodBind
bindAStar_get_point_count
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of points currently in the points pool.
get_point_count :: (AStar :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_point_count" '[] (IO Int) where
        nodeMethod = Godot.Core.AStar.get_point_count

{-# NOINLINE bindAStar_get_point_path #-}

-- | Returns an array with the points that are in the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
--   				__Note:__ This method is not thread-safe. If called from a @Thread@, it will return an empty @PoolVector3Array@ and will print an error message.
bindAStar_get_point_path :: MethodBind
bindAStar_get_point_path
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the points that are in the path found by AStar between the given points. The array is ordered from the starting point to the ending point of the path.
--   				__Note:__ This method is not thread-safe. If called from a @Thread@, it will return an empty @PoolVector3Array@ and will print an error message.
get_point_path ::
                 (AStar :< cls, Object :< cls) =>
                 cls -> Int -> Int -> IO PoolVector3Array
get_point_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_point_path" '[Int, Int]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.AStar.get_point_path

{-# NOINLINE bindAStar_get_point_position #-}

-- | Returns the position of the point associated with the given @id@.
bindAStar_get_point_position :: MethodBind
bindAStar_get_point_position
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the point associated with the given @id@.
get_point_position ::
                     (AStar :< cls, Object :< cls) => cls -> Int -> IO Vector3
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "get_point_position" '[Int] (IO Vector3)
         where
        nodeMethod = Godot.Core.AStar.get_point_position

{-# NOINLINE bindAStar_get_point_weight_scale #-}

-- | Returns the weight scale of the point associated with the given @id@.
bindAStar_get_point_weight_scale :: MethodBind
bindAStar_get_point_weight_scale
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "get_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the weight scale of the point associated with the given @id@.
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

instance NodeMethod AStar "get_point_weight_scale" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AStar.get_point_weight_scale

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

instance NodeMethod AStar "get_points" '[] (IO Array) where
        nodeMethod = Godot.Core.AStar.get_points

{-# NOINLINE bindAStar_has_point #-}

-- | Returns whether a point associated with the given @id@ exists.
bindAStar_has_point :: MethodBind
bindAStar_has_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "has_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a point associated with the given @id@ exists.
has_point :: (AStar :< cls, Object :< cls) => cls -> Int -> IO Bool
has_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_has_point (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "has_point" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.AStar.has_point

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

instance NodeMethod AStar "is_point_disabled" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.AStar.is_point_disabled

{-# NOINLINE bindAStar_remove_point #-}

-- | Removes the point associated with the given @id@ from the points pool.
bindAStar_remove_point :: MethodBind
bindAStar_remove_point
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the point associated with the given @id@ from the points pool.
remove_point ::
               (AStar :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "remove_point" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AStar.remove_point

{-# NOINLINE bindAStar_reserve_space #-}

-- | Reserves space internally for @num_nodes@ points, useful if you're adding a known large number of points at once, for a grid for instance. New capacity must be greater or equals to old capacity.
bindAStar_reserve_space :: MethodBind
bindAStar_reserve_space
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "reserve_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reserves space internally for @num_nodes@ points, useful if you're adding a known large number of points at once, for a grid for instance. New capacity must be greater or equals to old capacity.
reserve_space ::
                (AStar :< cls, Object :< cls) => cls -> Int -> IO ()
reserve_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_reserve_space (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "reserve_space" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AStar.reserve_space

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
                     (AStar :< cls, Object :< cls) => cls -> Int -> Maybe Bool -> IO ()
set_point_disabled cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_set_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "set_point_disabled" '[Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar.set_point_disabled

{-# NOINLINE bindAStar_set_point_position #-}

-- | Sets the @position@ for the point with the given @id@.
bindAStar_set_point_position :: MethodBind
bindAStar_set_point_position
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @position@ for the point with the given @id@.
set_point_position ::
                     (AStar :< cls, Object :< cls) => cls -> Int -> Vector3 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar "set_point_position" '[Int, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar.set_point_position

{-# NOINLINE bindAStar_set_point_weight_scale #-}

-- | Sets the @weight_scale@ for the point with the given @id@. The @weight_scale@ is multiplied by the result of @method _compute_cost@ when determining the overall cost of traveling across a segment from a neighboring point to this point.
bindAStar_set_point_weight_scale :: MethodBind
bindAStar_set_point_weight_scale
  = unsafePerformIO $
      withCString "AStar" $
        \ clsNamePtr ->
          withCString "set_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @weight_scale@ for the point with the given @id@. The @weight_scale@ is multiplied by the result of @method _compute_cost@ when determining the overall cost of traveling across a segment from a neighboring point to this point.
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

instance NodeMethod AStar "set_point_weight_scale" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar.set_point_weight_scale