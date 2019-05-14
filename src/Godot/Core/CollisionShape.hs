{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CollisionShape
       (Godot.Core.CollisionShape.resource_changed,
        Godot.Core.CollisionShape.set_shape,
        Godot.Core.CollisionShape.get_shape,
        Godot.Core.CollisionShape.set_disabled,
        Godot.Core.CollisionShape.is_disabled,
        Godot.Core.CollisionShape.make_convex_from_brothers)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCollisionShape_resource_changed #-}

-- | If this method exists within a script it will be called whenever the shape resource has been modified.
bindCollisionShape_resource_changed :: MethodBind
bindCollisionShape_resource_changed
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "resource_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this method exists within a script it will be called whenever the shape resource has been modified.
resource_changed ::
                   (CollisionShape :< cls, Object :< cls) => cls -> Resource -> IO ()
resource_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_resource_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape_set_shape #-}

-- | The actual shape owned by this collision shape.
bindCollisionShape_set_shape :: MethodBind
bindCollisionShape_set_shape
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The actual shape owned by this collision shape.
set_shape ::
            (CollisionShape :< cls, Object :< cls) => cls -> Shape -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_set_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape_get_shape #-}

-- | The actual shape owned by this collision shape.
bindCollisionShape_get_shape :: MethodBind
bindCollisionShape_get_shape
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The actual shape owned by this collision shape.
get_shape ::
            (CollisionShape :< cls, Object :< cls) => cls -> IO Shape
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape_set_disabled #-}

-- | A disabled collision shape has no effect in the world.
bindCollisionShape_set_disabled :: MethodBind
bindCollisionShape_set_disabled
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A disabled collision shape has no effect in the world.
set_disabled ::
               (CollisionShape :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_set_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape_is_disabled #-}

-- | A disabled collision shape has no effect in the world.
bindCollisionShape_is_disabled :: MethodBind
bindCollisionShape_is_disabled
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A disabled collision shape has no effect in the world.
is_disabled ::
              (CollisionShape :< cls, Object :< cls) => cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_is_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionShape_make_convex_from_brothers #-}

-- | Sets the collision shape's shape to the addition of all its convexed [MeshInstance] siblings geometry.
bindCollisionShape_make_convex_from_brothers :: MethodBind
bindCollisionShape_make_convex_from_brothers
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "make_convex_from_brothers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the collision shape's shape to the addition of all its convexed [MeshInstance] siblings geometry.
make_convex_from_brothers ::
                            (CollisionShape :< cls, Object :< cls) => cls -> IO ()
make_convex_from_brothers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_make_convex_from_brothers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)