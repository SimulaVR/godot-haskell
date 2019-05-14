{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CollisionPolygon2D
       (Godot.Core.CollisionPolygon2D._BUILD_SOLIDS,
        Godot.Core.CollisionPolygon2D._BUILD_SEGMENTS,
        Godot.Core.CollisionPolygon2D.set_polygon,
        Godot.Core.CollisionPolygon2D.get_polygon,
        Godot.Core.CollisionPolygon2D.set_build_mode,
        Godot.Core.CollisionPolygon2D.get_build_mode,
        Godot.Core.CollisionPolygon2D.set_disabled,
        Godot.Core.CollisionPolygon2D.is_disabled,
        Godot.Core.CollisionPolygon2D.set_one_way_collision,
        Godot.Core.CollisionPolygon2D.is_one_way_collision_enabled,
        Godot.Core.CollisionPolygon2D.set_one_way_collision_margin,
        Godot.Core.CollisionPolygon2D.get_one_way_collision_margin)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_BUILD_SOLIDS :: Int
_BUILD_SOLIDS = 0

_BUILD_SEGMENTS :: Int
_BUILD_SEGMENTS = 1

{-# NOINLINE bindCollisionPolygon2D_set_polygon #-}

-- | The polygon's list of vertices. The final point will be connected to the first. The returned value is a clone of the PoolVector2Array, not a reference.
bindCollisionPolygon2D_set_polygon :: MethodBind
bindCollisionPolygon2D_set_polygon
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "set_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's list of vertices. The final point will be connected to the first. The returned value is a clone of the PoolVector2Array, not a reference.
set_polygon ::
              (CollisionPolygon2D :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO ()
set_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_set_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_get_polygon #-}

-- | The polygon's list of vertices. The final point will be connected to the first. The returned value is a clone of the PoolVector2Array, not a reference.
bindCollisionPolygon2D_get_polygon :: MethodBind
bindCollisionPolygon2D_get_polygon
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's list of vertices. The final point will be connected to the first. The returned value is a clone of the PoolVector2Array, not a reference.
get_polygon ::
              (CollisionPolygon2D :< cls, Object :< cls) =>
              cls -> IO PoolVector2Array
get_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_get_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_set_build_mode #-}

-- | Collision build mode. Use one of the [code]BUILD_*[/code] constants. Default value: [code]BUILD_SOLIDS[/code].
bindCollisionPolygon2D_set_build_mode :: MethodBind
bindCollisionPolygon2D_set_build_mode
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "set_build_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Collision build mode. Use one of the [code]BUILD_*[/code] constants. Default value: [code]BUILD_SOLIDS[/code].
set_build_mode ::
                 (CollisionPolygon2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_build_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_set_build_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_get_build_mode #-}

-- | Collision build mode. Use one of the [code]BUILD_*[/code] constants. Default value: [code]BUILD_SOLIDS[/code].
bindCollisionPolygon2D_get_build_mode :: MethodBind
bindCollisionPolygon2D_get_build_mode
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "get_build_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Collision build mode. Use one of the [code]BUILD_*[/code] constants. Default value: [code]BUILD_SOLIDS[/code].
get_build_mode ::
                 (CollisionPolygon2D :< cls, Object :< cls) => cls -> IO Int
get_build_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_get_build_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_set_disabled #-}

-- | If [code]true[/code], no collisions will be detected.
bindCollisionPolygon2D_set_disabled :: MethodBind
bindCollisionPolygon2D_set_disabled
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], no collisions will be detected.
set_disabled ::
               (CollisionPolygon2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_is_disabled #-}

-- | If [code]true[/code], no collisions will be detected.
bindCollisionPolygon2D_is_disabled :: MethodBind
bindCollisionPolygon2D_is_disabled
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], no collisions will be detected.
is_disabled ::
              (CollisionPolygon2D :< cls, Object :< cls) => cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_is_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_set_one_way_collision #-}

-- | If [code]true[/code], only edges that face up, relative to CollisionPolygon2D's rotation, will collide with other objects.
bindCollisionPolygon2D_set_one_way_collision :: MethodBind
bindCollisionPolygon2D_set_one_way_collision
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "set_one_way_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only edges that face up, relative to CollisionPolygon2D's rotation, will collide with other objects.
set_one_way_collision ::
                        (CollisionPolygon2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_way_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionPolygon2D_set_one_way_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_is_one_way_collision_enabled
             #-}

-- | If [code]true[/code], only edges that face up, relative to CollisionPolygon2D's rotation, will collide with other objects.
bindCollisionPolygon2D_is_one_way_collision_enabled :: MethodBind
bindCollisionPolygon2D_is_one_way_collision_enabled
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "is_one_way_collision_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only edges that face up, relative to CollisionPolygon2D's rotation, will collide with other objects.
is_one_way_collision_enabled ::
                               (CollisionPolygon2D :< cls, Object :< cls) => cls -> IO Bool
is_one_way_collision_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionPolygon2D_is_one_way_collision_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_set_one_way_collision_margin
             #-}

bindCollisionPolygon2D_set_one_way_collision_margin :: MethodBind
bindCollisionPolygon2D_set_one_way_collision_margin
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "set_one_way_collision_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_one_way_collision_margin ::
                               (CollisionPolygon2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_one_way_collision_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionPolygon2D_set_one_way_collision_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionPolygon2D_get_one_way_collision_margin
             #-}

bindCollisionPolygon2D_get_one_way_collision_margin :: MethodBind
bindCollisionPolygon2D_get_one_way_collision_margin
  = unsafePerformIO $
      withCString "CollisionPolygon2D" $
        \ clsNamePtr ->
          withCString "get_one_way_collision_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_one_way_collision_margin ::
                               (CollisionPolygon2D :< cls, Object :< cls) => cls -> IO Float
get_one_way_collision_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionPolygon2D_get_one_way_collision_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)