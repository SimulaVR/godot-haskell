{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConvexPolygonShape
       (Godot.Core.ConvexPolygonShape.get_points,
        Godot.Core.ConvexPolygonShape.set_points)
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
import Godot.Core.Shape()

instance NodeProperty ConvexPolygonShape "points" PoolVector3Array
           'False
         where
        nodeProperty = (get_points, wrapDroppingSetter set_points, Nothing)

{-# NOINLINE bindConvexPolygonShape_get_points #-}

-- | The list of 3D points forming the convex polygon shape.
bindConvexPolygonShape_get_points :: MethodBind
bindConvexPolygonShape_get_points
  = unsafePerformIO $
      withCString "ConvexPolygonShape" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of 3D points forming the convex polygon shape.
get_points ::
             (ConvexPolygonShape :< cls, Object :< cls) =>
             cls -> IO PoolVector3Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConvexPolygonShape_get_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConvexPolygonShape "get_points" '[]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.ConvexPolygonShape.get_points

{-# NOINLINE bindConvexPolygonShape_set_points #-}

-- | The list of 3D points forming the convex polygon shape.
bindConvexPolygonShape_set_points :: MethodBind
bindConvexPolygonShape_set_points
  = unsafePerformIO $
      withCString "ConvexPolygonShape" $
        \ clsNamePtr ->
          withCString "set_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of 3D points forming the convex polygon shape.
set_points ::
             (ConvexPolygonShape :< cls, Object :< cls) =>
             cls -> PoolVector3Array -> IO ()
set_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConvexPolygonShape_set_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConvexPolygonShape "set_points"
           '[PoolVector3Array]
           (IO ())
         where
        nodeMethod = Godot.Core.ConvexPolygonShape.set_points