{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.OccluderPolygon2D
       (Godot.Core.OccluderPolygon2D._CULL_CLOCKWISE,
        Godot.Core.OccluderPolygon2D._CULL_DISABLED,
        Godot.Core.OccluderPolygon2D._CULL_COUNTER_CLOCKWISE,
        Godot.Core.OccluderPolygon2D.get_cull_mode,
        Godot.Core.OccluderPolygon2D.get_polygon,
        Godot.Core.OccluderPolygon2D.is_closed,
        Godot.Core.OccluderPolygon2D.set_closed,
        Godot.Core.OccluderPolygon2D.set_cull_mode,
        Godot.Core.OccluderPolygon2D.set_polygon)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CULL_CLOCKWISE :: Int
_CULL_CLOCKWISE = 1

_CULL_DISABLED :: Int
_CULL_DISABLED = 0

_CULL_COUNTER_CLOCKWISE :: Int
_CULL_COUNTER_CLOCKWISE = 2

{-# NOINLINE bindOccluderPolygon2D_get_cull_mode #-}

-- | The culling mode to use.
bindOccluderPolygon2D_get_cull_mode :: MethodBind
bindOccluderPolygon2D_get_cull_mode
  = unsafePerformIO $
      withCString "OccluderPolygon2D" $
        \ clsNamePtr ->
          withCString "get_cull_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The culling mode to use.
get_cull_mode ::
                (OccluderPolygon2D :< cls, Object :< cls) => cls -> IO Int
get_cull_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderPolygon2D_get_cull_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOccluderPolygon2D_get_polygon #-}

-- | A [Vector2] array with the index for polygon's vertices positions.
--   			[b]Note:[/b] The returned value is a copy of the underlying array, rather than a reference.
bindOccluderPolygon2D_get_polygon :: MethodBind
bindOccluderPolygon2D_get_polygon
  = unsafePerformIO $
      withCString "OccluderPolygon2D" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Vector2] array with the index for polygon's vertices positions.
--   			[b]Note:[/b] The returned value is a copy of the underlying array, rather than a reference.
get_polygon ::
              (OccluderPolygon2D :< cls, Object :< cls) =>
              cls -> IO PoolVector2Array
get_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderPolygon2D_get_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOccluderPolygon2D_is_closed #-}

-- | If [code]true[/code], closes the polygon. A closed OccluderPolygon2D occludes the light coming from any direction. An opened OccluderPolygon2D occludes the light only at its outline's direction.
bindOccluderPolygon2D_is_closed :: MethodBind
bindOccluderPolygon2D_is_closed
  = unsafePerformIO $
      withCString "OccluderPolygon2D" $
        \ clsNamePtr ->
          withCString "is_closed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], closes the polygon. A closed OccluderPolygon2D occludes the light coming from any direction. An opened OccluderPolygon2D occludes the light only at its outline's direction.
is_closed ::
            (OccluderPolygon2D :< cls, Object :< cls) => cls -> IO Bool
is_closed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderPolygon2D_is_closed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOccluderPolygon2D_set_closed #-}

-- | If [code]true[/code], closes the polygon. A closed OccluderPolygon2D occludes the light coming from any direction. An opened OccluderPolygon2D occludes the light only at its outline's direction.
bindOccluderPolygon2D_set_closed :: MethodBind
bindOccluderPolygon2D_set_closed
  = unsafePerformIO $
      withCString "OccluderPolygon2D" $
        \ clsNamePtr ->
          withCString "set_closed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], closes the polygon. A closed OccluderPolygon2D occludes the light coming from any direction. An opened OccluderPolygon2D occludes the light only at its outline's direction.
set_closed ::
             (OccluderPolygon2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_closed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderPolygon2D_set_closed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOccluderPolygon2D_set_cull_mode #-}

-- | The culling mode to use.
bindOccluderPolygon2D_set_cull_mode :: MethodBind
bindOccluderPolygon2D_set_cull_mode
  = unsafePerformIO $
      withCString "OccluderPolygon2D" $
        \ clsNamePtr ->
          withCString "set_cull_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The culling mode to use.
set_cull_mode ::
                (OccluderPolygon2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderPolygon2D_set_cull_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOccluderPolygon2D_set_polygon #-}

-- | A [Vector2] array with the index for polygon's vertices positions.
--   			[b]Note:[/b] The returned value is a copy of the underlying array, rather than a reference.
bindOccluderPolygon2D_set_polygon :: MethodBind
bindOccluderPolygon2D_set_polygon
  = unsafePerformIO $
      withCString "OccluderPolygon2D" $
        \ clsNamePtr ->
          withCString "set_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Vector2] array with the index for polygon's vertices positions.
--   			[b]Note:[/b] The returned value is a copy of the underlying array, rather than a reference.
set_polygon ::
              (OccluderPolygon2D :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO ()
set_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOccluderPolygon2D_set_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)