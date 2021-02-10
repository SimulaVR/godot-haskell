{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionShape2D
       (Godot.Core.CollisionShape2D._shape_changed,
        Godot.Core.CollisionShape2D.get_one_way_collision_margin,
        Godot.Core.CollisionShape2D.get_shape,
        Godot.Core.CollisionShape2D.is_disabled,
        Godot.Core.CollisionShape2D.is_one_way_collision_enabled,
        Godot.Core.CollisionShape2D.set_disabled,
        Godot.Core.CollisionShape2D.set_one_way_collision,
        Godot.Core.CollisionShape2D.set_one_way_collision_margin,
        Godot.Core.CollisionShape2D.set_shape)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCollisionShape2D__shape_changed #-}

bindCollisionShape2D__shape_changed :: MethodBind
bindCollisionShape2D__shape_changed
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "_shape_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_shape_changed ::
                 (CollisionShape2D :< cls, Object :< cls) => cls -> IO ()
_shape_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape2D__shape_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_get_one_way_collision_margin #-}

-- | The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the shape at a high velocity.
bindCollisionShape2D_get_one_way_collision_margin :: MethodBind
bindCollisionShape2D_get_one_way_collision_margin
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "get_one_way_collision_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the shape at a high velocity.
get_one_way_collision_margin ::
                               (CollisionShape2D :< cls, Object :< cls) => cls -> IO Float
get_one_way_collision_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionShape2D_get_one_way_collision_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_get_shape #-}

-- | The actual shape owned by this collision shape.
bindCollisionShape2D_get_shape :: MethodBind
bindCollisionShape2D_get_shape
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The actual shape owned by this collision shape.
get_shape ::
            (CollisionShape2D :< cls, Object :< cls) => cls -> IO Shape2D
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape2D_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_is_disabled #-}

-- | A disabled collision shape has no effect in the world. This property should be changed with [method Object.set_deferred].
bindCollisionShape2D_is_disabled :: MethodBind
bindCollisionShape2D_is_disabled
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A disabled collision shape has no effect in the world. This property should be changed with [method Object.set_deferred].
is_disabled ::
              (CollisionShape2D :< cls, Object :< cls) => cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape2D_is_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_is_one_way_collision_enabled #-}

-- | Sets whether this collision shape should only detect collision on one side (top or bottom).
bindCollisionShape2D_is_one_way_collision_enabled :: MethodBind
bindCollisionShape2D_is_one_way_collision_enabled
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "is_one_way_collision_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether this collision shape should only detect collision on one side (top or bottom).
is_one_way_collision_enabled ::
                               (CollisionShape2D :< cls, Object :< cls) => cls -> IO Bool
is_one_way_collision_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionShape2D_is_one_way_collision_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_set_disabled #-}

-- | A disabled collision shape has no effect in the world. This property should be changed with [method Object.set_deferred].
bindCollisionShape2D_set_disabled :: MethodBind
bindCollisionShape2D_set_disabled
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A disabled collision shape has no effect in the world. This property should be changed with [method Object.set_deferred].
set_disabled ::
               (CollisionShape2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape2D_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_set_one_way_collision #-}

-- | Sets whether this collision shape should only detect collision on one side (top or bottom).
bindCollisionShape2D_set_one_way_collision :: MethodBind
bindCollisionShape2D_set_one_way_collision
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "set_one_way_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether this collision shape should only detect collision on one side (top or bottom).
set_one_way_collision ::
                        (CollisionShape2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_way_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape2D_set_one_way_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_set_one_way_collision_margin #-}

-- | The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the shape at a high velocity.
bindCollisionShape2D_set_one_way_collision_margin :: MethodBind
bindCollisionShape2D_set_one_way_collision_margin
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "set_one_way_collision_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The margin used for one-way collision (in pixels). Higher values will make the shape thicker, and work better for colliders that enter the shape at a high velocity.
set_one_way_collision_margin ::
                               (CollisionShape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_one_way_collision_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionShape2D_set_one_way_collision_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape2D_set_shape #-}

-- | The actual shape owned by this collision shape.
bindCollisionShape2D_set_shape :: MethodBind
bindCollisionShape2D_set_shape
  = unsafePerformIO $
      withCString "CollisionShape2D" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The actual shape owned by this collision shape.
set_shape ::
            (CollisionShape2D :< cls, Object :< cls) => cls -> Shape2D -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape2D_set_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)