{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionPolygon
       (Godot.Core.CollisionPolygon._is_editable_3d_polygon,
        Godot.Core.CollisionPolygon.get_depth,
        Godot.Core.CollisionPolygon.get_polygon,
        Godot.Core.CollisionPolygon.is_disabled,
        Godot.Core.CollisionPolygon.set_depth,
        Godot.Core.CollisionPolygon.set_disabled,
        Godot.Core.CollisionPolygon.set_polygon)
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
import Godot.Core.Spatial()

instance NodeProperty CollisionPolygon "depth" Float 'False where
        nodeProperty = (get_depth, wrapDroppingSetter set_depth, Nothing)

instance NodeProperty CollisionPolygon "disabled" Bool 'False where
        nodeProperty
          = (is_disabled, wrapDroppingSetter set_disabled, Nothing)

instance NodeProperty CollisionPolygon "polygon" PoolVector2Array
           'False
         where
        nodeProperty
          = (get_polygon, wrapDroppingSetter set_polygon, Nothing)

{-# NOINLINE bindCollisionPolygon__is_editable_3d_polygon #-}

bindCollisionPolygon__is_editable_3d_polygon :: MethodBind
bindCollisionPolygon__is_editable_3d_polygon
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "_is_editable_3d_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_editable_3d_polygon ::
                          (CollisionPolygon :< cls, Object :< cls) => cls -> IO Bool
_is_editable_3d_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon__is_editable_3d_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "_is_editable_3d_polygon" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionPolygon._is_editable_3d_polygon

{-# NOINLINE bindCollisionPolygon_get_depth #-}

-- | Length that the resulting collision extends in either direction perpendicular to its polygon.
bindCollisionPolygon_get_depth :: MethodBind
bindCollisionPolygon_get_depth
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Length that the resulting collision extends in either direction perpendicular to its polygon.
get_depth ::
            (CollisionPolygon :< cls, Object :< cls) => cls -> IO Float
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon_get_depth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "get_depth" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CollisionPolygon.get_depth

{-# NOINLINE bindCollisionPolygon_get_polygon #-}

-- | Array of vertices which define the polygon.
--   			__Note:__ The returned value is a copy of the original. Methods which mutate the size or properties of the return value will not impact the original polygon. To change properties of the polygon, assign it to a temporary variable and make changes before reassigning the @polygon@ member.
bindCollisionPolygon_get_polygon :: MethodBind
bindCollisionPolygon_get_polygon
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Array of vertices which define the polygon.
--   			__Note:__ The returned value is a copy of the original. Methods which mutate the size or properties of the return value will not impact the original polygon. To change properties of the polygon, assign it to a temporary variable and make changes before reassigning the @polygon@ member.
get_polygon ::
              (CollisionPolygon :< cls, Object :< cls) =>
              cls -> IO PoolVector2Array
get_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon_get_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "get_polygon" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.CollisionPolygon.get_polygon

{-# NOINLINE bindCollisionPolygon_is_disabled #-}

-- | If @true@, no collision will be produced.
bindCollisionPolygon_is_disabled :: MethodBind
bindCollisionPolygon_is_disabled
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, no collision will be produced.
is_disabled ::
              (CollisionPolygon :< cls, Object :< cls) => cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon_is_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "is_disabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionPolygon.is_disabled

{-# NOINLINE bindCollisionPolygon_set_depth #-}

-- | Length that the resulting collision extends in either direction perpendicular to its polygon.
bindCollisionPolygon_set_depth :: MethodBind
bindCollisionPolygon_set_depth
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "set_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Length that the resulting collision extends in either direction perpendicular to its polygon.
set_depth ::
            (CollisionPolygon :< cls, Object :< cls) => cls -> Float -> IO ()
set_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon_set_depth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "set_depth" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CollisionPolygon.set_depth

{-# NOINLINE bindCollisionPolygon_set_disabled #-}

-- | If @true@, no collision will be produced.
bindCollisionPolygon_set_disabled :: MethodBind
bindCollisionPolygon_set_disabled
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, no collision will be produced.
set_disabled ::
               (CollisionPolygon :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "set_disabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.CollisionPolygon.set_disabled

{-# NOINLINE bindCollisionPolygon_set_polygon #-}

-- | Array of vertices which define the polygon.
--   			__Note:__ The returned value is a copy of the original. Methods which mutate the size or properties of the return value will not impact the original polygon. To change properties of the polygon, assign it to a temporary variable and make changes before reassigning the @polygon@ member.
bindCollisionPolygon_set_polygon :: MethodBind
bindCollisionPolygon_set_polygon
  = unsafePerformIO $
      withCString "CollisionPolygon" $
        \ clsNamePtr ->
          withCString "set_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Array of vertices which define the polygon.
--   			__Note:__ The returned value is a copy of the original. Methods which mutate the size or properties of the return value will not impact the original polygon. To change properties of the polygon, assign it to a temporary variable and make changes before reassigning the @polygon@ member.
set_polygon ::
              (CollisionPolygon :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO ()
set_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon_set_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionPolygon "set_polygon"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionPolygon.set_polygon