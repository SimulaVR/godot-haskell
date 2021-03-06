{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConvexPolygonShape2D
       (Godot.Core.ConvexPolygonShape2D.get_points,
        Godot.Core.ConvexPolygonShape2D.set_point_cloud,
        Godot.Core.ConvexPolygonShape2D.set_points)
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
import Godot.Core.Shape2D()

instance NodeProperty ConvexPolygonShape2D "points"
           PoolVector2Array
           'False
         where
        nodeProperty = (get_points, wrapDroppingSetter set_points, Nothing)

{-# NOINLINE bindConvexPolygonShape2D_get_points #-}

-- | The polygon's list of vertices. Can be in either clockwise or counterclockwise order.
bindConvexPolygonShape2D_get_points :: MethodBind
bindConvexPolygonShape2D_get_points
  = unsafePerformIO $
      withCString "ConvexPolygonShape2D" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's list of vertices. Can be in either clockwise or counterclockwise order.
get_points ::
             (ConvexPolygonShape2D :< cls, Object :< cls) =>
             cls -> IO PoolVector2Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConvexPolygonShape2D_get_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConvexPolygonShape2D "get_points" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.ConvexPolygonShape2D.get_points

{-# NOINLINE bindConvexPolygonShape2D_set_point_cloud #-}

-- | Based on the set of points provided, this creates and assigns the @points@ property using the convex hull algorithm. Removing all unneeded points. See @method Geometry.convex_hull_2d@ for details.
bindConvexPolygonShape2D_set_point_cloud :: MethodBind
bindConvexPolygonShape2D_set_point_cloud
  = unsafePerformIO $
      withCString "ConvexPolygonShape2D" $
        \ clsNamePtr ->
          withCString "set_point_cloud" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Based on the set of points provided, this creates and assigns the @points@ property using the convex hull algorithm. Removing all unneeded points. See @method Geometry.convex_hull_2d@ for details.
set_point_cloud ::
                  (ConvexPolygonShape2D :< cls, Object :< cls) =>
                  cls -> PoolVector2Array -> IO ()
set_point_cloud cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConvexPolygonShape2D_set_point_cloud
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConvexPolygonShape2D "set_point_cloud"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.ConvexPolygonShape2D.set_point_cloud

{-# NOINLINE bindConvexPolygonShape2D_set_points #-}

-- | The polygon's list of vertices. Can be in either clockwise or counterclockwise order.
bindConvexPolygonShape2D_set_points :: MethodBind
bindConvexPolygonShape2D_set_points
  = unsafePerformIO $
      withCString "ConvexPolygonShape2D" $
        \ clsNamePtr ->
          withCString "set_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's list of vertices. Can be in either clockwise or counterclockwise order.
set_points ::
             (ConvexPolygonShape2D :< cls, Object :< cls) =>
             cls -> PoolVector2Array -> IO ()
set_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConvexPolygonShape2D_set_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConvexPolygonShape2D "set_points"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.ConvexPolygonShape2D.set_points