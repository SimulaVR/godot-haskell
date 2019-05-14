{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.KinematicCollision2D
       (Godot.Core.KinematicCollision2D.get_position,
        Godot.Core.KinematicCollision2D.get_normal,
        Godot.Core.KinematicCollision2D.get_travel,
        Godot.Core.KinematicCollision2D.get_remainder,
        Godot.Core.KinematicCollision2D.get_local_shape,
        Godot.Core.KinematicCollision2D.get_collider,
        Godot.Core.KinematicCollision2D.get_collider_id,
        Godot.Core.KinematicCollision2D.get_collider_shape,
        Godot.Core.KinematicCollision2D.get_collider_shape_index,
        Godot.Core.KinematicCollision2D.get_collider_velocity,
        Godot.Core.KinematicCollision2D.get_collider_metadata)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindKinematicCollision2D_get_position #-}

-- | The point of collision.
bindKinematicCollision2D_get_position :: MethodBind
bindKinematicCollision2D_get_position
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The point of collision.
get_position ::
               (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_normal #-}

-- | The colliding body's shape's normal at the point of collision.
bindKinematicCollision2D_get_normal :: MethodBind
bindKinematicCollision2D_get_normal
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's shape's normal at the point of collision.
get_normal ::
             (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Vector2
get_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_travel #-}

-- | The distance the moving object traveled before collision.
bindKinematicCollision2D_get_travel :: MethodBind
bindKinematicCollision2D_get_travel
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance the moving object traveled before collision.
get_travel ::
             (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Vector2
get_travel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_travel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_remainder #-}

-- | The moving object's remaining movement vector.
bindKinematicCollision2D_get_remainder :: MethodBind
bindKinematicCollision2D_get_remainder
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_remainder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The moving object's remaining movement vector.
get_remainder ::
                (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Vector2
get_remainder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_remainder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_local_shape #-}

-- | The moving object's colliding shape.
bindKinematicCollision2D_get_local_shape :: MethodBind
bindKinematicCollision2D_get_local_shape
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_local_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The moving object's colliding shape.
get_local_shape ::
                  (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Object
get_local_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_local_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_collider #-}

-- | The colliding body.
bindKinematicCollision2D_get_collider :: MethodBind
bindKinematicCollision2D_get_collider
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body.
get_collider ::
               (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Object
get_collider cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_collider_id #-}

-- | The colliding body's unique [RID].
bindKinematicCollision2D_get_collider_id :: MethodBind
bindKinematicCollision2D_get_collider_id
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's unique [RID].
get_collider_id ::
                  (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Int
get_collider_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_collider_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_collider_shape #-}

-- | The colliding body's shape.
bindKinematicCollision2D_get_collider_shape :: MethodBind
bindKinematicCollision2D_get_collider_shape
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's shape.
get_collider_shape ::
                     (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Object
get_collider_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision2D_get_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_collider_shape_index #-}

-- | The colliding shape's index. See [CollisionObject2D].
bindKinematicCollision2D_get_collider_shape_index :: MethodBind
bindKinematicCollision2D_get_collider_shape_index
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_collider_shape_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding shape's index. See [CollisionObject2D].
get_collider_shape_index ::
                           (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Int
get_collider_shape_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindKinematicCollision2D_get_collider_shape_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_collider_velocity #-}

-- | The colliding object's velocity.
bindKinematicCollision2D_get_collider_velocity :: MethodBind
bindKinematicCollision2D_get_collider_velocity
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_collider_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding object's velocity.
get_collider_velocity ::
                        (KinematicCollision2D :< cls, Object :< cls) => cls -> IO Vector2
get_collider_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindKinematicCollision2D_get_collider_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicCollision2D_get_collider_metadata #-}

-- | The colliding body's metadata. See [Object].
bindKinematicCollision2D_get_collider_metadata :: MethodBind
bindKinematicCollision2D_get_collider_metadata
  = unsafePerformIO $
      withCString "KinematicCollision2D" $
        \ clsNamePtr ->
          withCString "get_collider_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's metadata. See [Object].
get_collider_metadata ::
                        (KinematicCollision2D :< cls, Object :< cls) =>
                        cls -> IO GodotVariant
get_collider_metadata cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindKinematicCollision2D_get_collider_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)