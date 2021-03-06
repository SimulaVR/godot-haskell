{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PolygonPathFinder
       (Godot.Core.PolygonPathFinder._get_data,
        Godot.Core.PolygonPathFinder._set_data,
        Godot.Core.PolygonPathFinder.find_path,
        Godot.Core.PolygonPathFinder.get_bounds,
        Godot.Core.PolygonPathFinder.get_closest_point,
        Godot.Core.PolygonPathFinder.get_intersections,
        Godot.Core.PolygonPathFinder.get_point_penalty,
        Godot.Core.PolygonPathFinder.is_point_inside,
        Godot.Core.PolygonPathFinder.set_point_penalty,
        Godot.Core.PolygonPathFinder.setup)
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

instance NodeProperty PolygonPathFinder "data" Dictionary 'False
         where
        nodeProperty = (_get_data, wrapDroppingSetter _set_data, Nothing)

{-# NOINLINE bindPolygonPathFinder__get_data #-}

bindPolygonPathFinder__get_data :: MethodBind
bindPolygonPathFinder__get_data
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (PolygonPathFinder :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder__get_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "_get_data" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.PolygonPathFinder._get_data

{-# NOINLINE bindPolygonPathFinder__set_data #-}

bindPolygonPathFinder__set_data :: MethodBind
bindPolygonPathFinder__set_data
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (PolygonPathFinder :< cls, Object :< cls) =>
            cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder__set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "_set_data" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.PolygonPathFinder._set_data

{-# NOINLINE bindPolygonPathFinder_find_path #-}

bindPolygonPathFinder_find_path :: MethodBind
bindPolygonPathFinder_find_path
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "find_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

find_path ::
            (PolygonPathFinder :< cls, Object :< cls) =>
            cls -> Vector2 -> Vector2 -> IO PoolVector2Array
find_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_find_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "find_path"
           '[Vector2, Vector2]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.PolygonPathFinder.find_path

{-# NOINLINE bindPolygonPathFinder_get_bounds #-}

bindPolygonPathFinder_get_bounds :: MethodBind
bindPolygonPathFinder_get_bounds
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bounds ::
             (PolygonPathFinder :< cls, Object :< cls) => cls -> IO Rect2
get_bounds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_get_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "get_bounds" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.PolygonPathFinder.get_bounds

{-# NOINLINE bindPolygonPathFinder_get_closest_point #-}

bindPolygonPathFinder_get_closest_point :: MethodBind
bindPolygonPathFinder_get_closest_point
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_closest_point ::
                    (PolygonPathFinder :< cls, Object :< cls) =>
                    cls -> Vector2 -> IO Vector2
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "get_closest_point"
           '[Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.PolygonPathFinder.get_closest_point

{-# NOINLINE bindPolygonPathFinder_get_intersections #-}

bindPolygonPathFinder_get_intersections :: MethodBind
bindPolygonPathFinder_get_intersections
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "get_intersections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_intersections ::
                    (PolygonPathFinder :< cls, Object :< cls) =>
                    cls -> Vector2 -> Vector2 -> IO PoolVector2Array
get_intersections cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_get_intersections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "get_intersections"
           '[Vector2, Vector2]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.PolygonPathFinder.get_intersections

{-# NOINLINE bindPolygonPathFinder_get_point_penalty #-}

bindPolygonPathFinder_get_point_penalty :: MethodBind
bindPolygonPathFinder_get_point_penalty
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "get_point_penalty" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_point_penalty ::
                    (PolygonPathFinder :< cls, Object :< cls) => cls -> Int -> IO Float
get_point_penalty cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_get_point_penalty
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "get_point_penalty" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.PolygonPathFinder.get_point_penalty

{-# NOINLINE bindPolygonPathFinder_is_point_inside #-}

bindPolygonPathFinder_is_point_inside :: MethodBind
bindPolygonPathFinder_is_point_inside
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "is_point_inside" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_point_inside ::
                  (PolygonPathFinder :< cls, Object :< cls) =>
                  cls -> Vector2 -> IO Bool
is_point_inside cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_is_point_inside
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "is_point_inside" '[Vector2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PolygonPathFinder.is_point_inside

{-# NOINLINE bindPolygonPathFinder_set_point_penalty #-}

bindPolygonPathFinder_set_point_penalty :: MethodBind
bindPolygonPathFinder_set_point_penalty
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "set_point_penalty" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_point_penalty ::
                    (PolygonPathFinder :< cls, Object :< cls) =>
                    cls -> Int -> Float -> IO ()
set_point_penalty cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_set_point_penalty
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "set_point_penalty"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PolygonPathFinder.set_point_penalty

{-# NOINLINE bindPolygonPathFinder_setup #-}

bindPolygonPathFinder_setup :: MethodBind
bindPolygonPathFinder_setup
  = unsafePerformIO $
      withCString "PolygonPathFinder" $
        \ clsNamePtr ->
          withCString "setup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

setup ::
        (PolygonPathFinder :< cls, Object :< cls) =>
        cls -> PoolVector2Array -> PoolIntArray -> IO ()
setup cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygonPathFinder_setup (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PolygonPathFinder "setup"
           '[PoolVector2Array, PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.PolygonPathFinder.setup