{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

{-# NOINLINE bindAStar2D_add_point #-}

-- | Adds a new point at the given position with the given identifier. The algorithm prefers points with lower @weight_scale@ to form a path. The @id@ must be 0 or larger, and the @weight_scale@ must be 1 or larger.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(1, 0), 4) # Adds the point (1, 0) with weight_scale 4 and id 1
--   				
--   @
--   
--   				If there already exists a point for the given @id@, its position and weight scale are updated to the given values.
bindAStar2D_add_point :: MethodBind
bindAStar2D_add_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new point at the given position with the given identifier. The algorithm prefers points with lower @weight_scale@ to form a path. The @id@ must be 0 or larger, and the @weight_scale@ must be 1 or larger.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(1, 0), 4) # Adds the point (1, 0) with weight_scale 4 and id 1
--   				
--   @
--   
--   				If there already exists a point for the given @id@, its position and weight scale are updated to the given values.
add_point ::
            (AStar2D :< cls, Object :< cls) =>
            cls -> Int -> Vector2 -> Maybe Float -> IO ()
add_point cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_add_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "add_point"
           '[Int, Vector2, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar2D.add_point

{-# NOINLINE bindAStar2D_are_points_connected #-}

-- | Returns whether there is a connection/segment between the given points.
bindAStar2D_are_points_connected :: MethodBind
bindAStar2D_are_points_connected
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "are_points_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether there is a connection/segment between the given points.
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

instance NodeMethod AStar2D "are_points_connected" '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AStar2D.are_points_connected

{-# NOINLINE bindAStar2D_clear #-}

-- | Clears all the points and segments.
bindAStar2D_clear :: MethodBind
bindAStar2D_clear
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all the points and segments.
clear :: (AStar2D :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.AStar2D.clear

{-# NOINLINE bindAStar2D_connect_points #-}

-- | Creates a segment between the given points. If @bidirectional@ is @false@, only movement from @id@ to @to_id@ is allowed, not the reverse direction.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(1, 1))
--   				astar.add_point(2, Vector2(0, 5))
--   				astar.connect_points(1, 2, false)
--   				
--   @
bindAStar2D_connect_points :: MethodBind
bindAStar2D_connect_points
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "connect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a segment between the given points. If @bidirectional@ is @false@, only movement from @id@ to @to_id@ is allowed, not the reverse direction.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(1, 1))
--   				astar.add_point(2, Vector2(0, 5))
--   				astar.connect_points(1, 2, false)
--   				
--   @
connect_points ::
                 (AStar2D :< cls, Object :< cls) =>
                 cls -> Int -> Int -> Maybe Bool -> IO ()
connect_points cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_connect_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "connect_points"
           '[Int, Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar2D.connect_points

{-# NOINLINE bindAStar2D_disconnect_points #-}

-- | Deletes the segment between the given points.
bindAStar2D_disconnect_points :: MethodBind
bindAStar2D_disconnect_points
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "disconnect_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the segment between the given points.
disconnect_points ::
                    (AStar2D :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
disconnect_points cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_disconnect_points (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "disconnect_points" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.AStar2D.disconnect_points

{-# NOINLINE bindAStar2D_get_available_point_id #-}

-- | Returns the next available point ID with no point associated to it.
bindAStar2D_get_available_point_id :: MethodBind
bindAStar2D_get_available_point_id
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_available_point_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next available point ID with no point associated to it.
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

instance NodeMethod AStar2D "get_available_point_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AStar2D.get_available_point_id

{-# NOINLINE bindAStar2D_get_closest_point #-}

-- | Returns the ID of the closest point to @to_position@, optionally taking disabled points into account. Returns @-1@ if there are no points in the points pool.
--   				__Note:__ If several points are the closest to @to_position@, the one with the smallest ID will be returned, ensuring a deterministic result.
bindAStar2D_get_closest_point :: MethodBind
bindAStar2D_get_closest_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID of the closest point to @to_position@, optionally taking disabled points into account. Returns @-1@ if there are no points in the points pool.
--   				__Note:__ If several points are the closest to @to_position@, the one with the smallest ID will be returned, ensuring a deterministic result.
get_closest_point ::
                    (AStar2D :< cls, Object :< cls) =>
                    cls -> Vector2 -> Maybe Bool -> IO Int
get_closest_point cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_closest_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "get_closest_point"
           '[Vector2, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.AStar2D.get_closest_point

{-# NOINLINE bindAStar2D_get_closest_position_in_segment #-}

-- | Returns the closest position to @to_position@ that resides inside a segment between two connected points.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(0, 0))
--   				astar.add_point(2, Vector2(0, 5))
--   				astar.connect_points(1, 2)
--   				var res = astar.get_closest_position_in_segment(Vector2(3, 3)) # Returns (0, 3)
--   				
--   @
--   
--   				The result is in the segment that goes from @y = 0@ to @y = 5@. It's the closest position in the segment to the given point.
bindAStar2D_get_closest_position_in_segment :: MethodBind
bindAStar2D_get_closest_position_in_segment
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_closest_position_in_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the closest position to @to_position@ that resides inside a segment between two connected points.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(0, 0))
--   				astar.add_point(2, Vector2(0, 5))
--   				astar.connect_points(1, 2)
--   				var res = astar.get_closest_position_in_segment(Vector2(3, 3)) # Returns (0, 3)
--   				
--   @
--   
--   				The result is in the segment that goes from @y = 0@ to @y = 5@. It's the closest position in the segment to the given point.
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

instance NodeMethod AStar2D "get_closest_position_in_segment"
           '[Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AStar2D.get_closest_position_in_segment

{-# NOINLINE bindAStar2D_get_id_path #-}

-- | Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(0, 0))
--   				astar.add_point(2, Vector2(0, 1), 1) # Default weight is 1
--   				astar.add_point(3, Vector2(1, 1))
--   				astar.add_point(4, Vector2(2, 0))
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
bindAStar2D_get_id_path :: MethodBind
bindAStar2D_get_id_path
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_id_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the IDs of the points that form the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(0, 0))
--   				astar.add_point(2, Vector2(0, 1), 1) # Default weight is 1
--   				astar.add_point(3, Vector2(1, 1))
--   				astar.add_point(4, Vector2(2, 0))
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
              (AStar2D :< cls, Object :< cls) =>
              cls -> Int -> Int -> IO PoolIntArray
get_id_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_id_path (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "get_id_path" '[Int, Int]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.AStar2D.get_id_path

{-# NOINLINE bindAStar2D_get_point_capacity #-}

-- | Returns the capacity of the structure backing the points, useful in conjunction with @reserve_space@.
bindAStar2D_get_point_capacity :: MethodBind
bindAStar2D_get_point_capacity
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_capacity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the capacity of the structure backing the points, useful in conjunction with @reserve_space@.
get_point_capacity ::
                     (AStar2D :< cls, Object :< cls) => cls -> IO Int
get_point_capacity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_capacity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "get_point_capacity" '[] (IO Int) where
        nodeMethod = Godot.Core.AStar2D.get_point_capacity

{-# NOINLINE bindAStar2D_get_point_connections #-}

-- | Returns an array with the IDs of the points that form the connection with the given point.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(0, 0))
--   				astar.add_point(2, Vector2(0, 1))
--   				astar.add_point(3, Vector2(1, 1))
--   				astar.add_point(4, Vector2(2, 0))
--   
--   				astar.connect_points(1, 2, true)
--   				astar.connect_points(1, 3, true)
--   
--   				var neighbors = astar.get_point_connections(1) # Returns @2, 3@
--   				
--   @
bindAStar2D_get_point_connections :: MethodBind
bindAStar2D_get_point_connections
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the IDs of the points that form the connection with the given point.
--   				
--   @
--   
--   				var astar = AStar2D.new()
--   				astar.add_point(1, Vector2(0, 0))
--   				astar.add_point(2, Vector2(0, 1))
--   				astar.add_point(3, Vector2(1, 1))
--   				astar.add_point(4, Vector2(2, 0))
--   
--   				astar.connect_points(1, 2, true)
--   				astar.connect_points(1, 3, true)
--   
--   				var neighbors = astar.get_point_connections(1) # Returns @2, 3@
--   				
--   @
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

instance NodeMethod AStar2D "get_point_connections" '[Int]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.AStar2D.get_point_connections

{-# NOINLINE bindAStar2D_get_point_count #-}

-- | Returns the number of points currently in the points pool.
bindAStar2D_get_point_count :: MethodBind
bindAStar2D_get_point_count
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of points currently in the points pool.
get_point_count :: (AStar2D :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "get_point_count" '[] (IO Int) where
        nodeMethod = Godot.Core.AStar2D.get_point_count

{-# NOINLINE bindAStar2D_get_point_path #-}

-- | Returns an array with the points that are in the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
bindAStar2D_get_point_path :: MethodBind
bindAStar2D_get_point_path
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the points that are in the path found by AStar2D between the given points. The array is ordered from the starting point to the ending point of the path.
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

instance NodeMethod AStar2D "get_point_path" '[Int, Int]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.AStar2D.get_point_path

{-# NOINLINE bindAStar2D_get_point_position #-}

-- | Returns the position of the point associated with the given @id@.
bindAStar2D_get_point_position :: MethodBind
bindAStar2D_get_point_position
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the point associated with the given @id@.
get_point_position ::
                     (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "get_point_position" '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AStar2D.get_point_position

{-# NOINLINE bindAStar2D_get_point_weight_scale #-}

-- | Returns the weight scale of the point associated with the given @id@.
bindAStar2D_get_point_weight_scale :: MethodBind
bindAStar2D_get_point_weight_scale
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the weight scale of the point associated with the given @id@.
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

instance NodeMethod AStar2D "get_point_weight_scale" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AStar2D.get_point_weight_scale

{-# NOINLINE bindAStar2D_get_points #-}

-- | Returns an array of all points.
bindAStar2D_get_points :: MethodBind
bindAStar2D_get_points
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all points.
get_points :: (AStar2D :< cls, Object :< cls) => cls -> IO Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_get_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "get_points" '[] (IO Array) where
        nodeMethod = Godot.Core.AStar2D.get_points

{-# NOINLINE bindAStar2D_has_point #-}

-- | Returns whether a point associated with the given @id@ exists.
bindAStar2D_has_point :: MethodBind
bindAStar2D_has_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "has_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a point associated with the given @id@ exists.
has_point ::
            (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Bool
has_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_has_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "has_point" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.AStar2D.has_point

{-# NOINLINE bindAStar2D_is_point_disabled #-}

-- | Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.
bindAStar2D_is_point_disabled :: MethodBind
bindAStar2D_is_point_disabled
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "is_point_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a point is disabled or not for pathfinding. By default, all points are enabled.
is_point_disabled ::
                    (AStar2D :< cls, Object :< cls) => cls -> Int -> IO Bool
is_point_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_is_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "is_point_disabled" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.AStar2D.is_point_disabled

{-# NOINLINE bindAStar2D_remove_point #-}

-- | Removes the point associated with the given @id@ from the points pool.
bindAStar2D_remove_point :: MethodBind
bindAStar2D_remove_point
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the point associated with the given @id@ from the points pool.
remove_point ::
               (AStar2D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "remove_point" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AStar2D.remove_point

{-# NOINLINE bindAStar2D_reserve_space #-}

-- | Reserves space internally for @num_nodes@ points, useful if you're adding a known large number of points at once, for a grid for instance. New capacity must be greater or equals to old capacity.
bindAStar2D_reserve_space :: MethodBind
bindAStar2D_reserve_space
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "reserve_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reserves space internally for @num_nodes@ points, useful if you're adding a known large number of points at once, for a grid for instance. New capacity must be greater or equals to old capacity.
reserve_space ::
                (AStar2D :< cls, Object :< cls) => cls -> Int -> IO ()
reserve_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_reserve_space (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "reserve_space" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AStar2D.reserve_space

{-# NOINLINE bindAStar2D_set_point_disabled #-}

-- | Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.
bindAStar2D_set_point_disabled :: MethodBind
bindAStar2D_set_point_disabled
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "set_point_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables or enables the specified point for pathfinding. Useful for making a temporary obstacle.
set_point_disabled ::
                     (AStar2D :< cls, Object :< cls) =>
                     cls -> Int -> Maybe Bool -> IO ()
set_point_disabled cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_set_point_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "set_point_disabled" '[Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar2D.set_point_disabled

{-# NOINLINE bindAStar2D_set_point_position #-}

-- | Sets the @position@ for the point with the given @id@.
bindAStar2D_set_point_position :: MethodBind
bindAStar2D_set_point_position
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @position@ for the point with the given @id@.
set_point_position ::
                     (AStar2D :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAStar2D_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AStar2D "set_point_position" '[Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar2D.set_point_position

{-# NOINLINE bindAStar2D_set_point_weight_scale #-}

-- | Sets the @weight_scale@ for the point with the given @id@.
bindAStar2D_set_point_weight_scale :: MethodBind
bindAStar2D_set_point_weight_scale
  = unsafePerformIO $
      withCString "AStar2D" $
        \ clsNamePtr ->
          withCString "set_point_weight_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @weight_scale@ for the point with the given @id@.
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

instance NodeMethod AStar2D "set_point_weight_scale" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AStar2D.set_point_weight_scale