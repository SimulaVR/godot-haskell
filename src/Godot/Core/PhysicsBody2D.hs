{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PhysicsBody2D
       (Godot.Core.PhysicsBody2D.set_collision_layer,
        Godot.Core.PhysicsBody2D.get_collision_layer,
        Godot.Core.PhysicsBody2D.set_collision_mask,
        Godot.Core.PhysicsBody2D.get_collision_mask,
        Godot.Core.PhysicsBody2D.set_collision_mask_bit,
        Godot.Core.PhysicsBody2D.get_collision_mask_bit,
        Godot.Core.PhysicsBody2D.set_collision_layer_bit,
        Godot.Core.PhysicsBody2D.get_collision_layer_bit,
        Godot.Core.PhysicsBody2D._set_layers,
        Godot.Core.PhysicsBody2D._get_layers,
        Godot.Core.PhysicsBody2D.get_collision_exceptions,
        Godot.Core.PhysicsBody2D.add_collision_exception_with,
        Godot.Core.PhysicsBody2D.remove_collision_exception_with)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysicsBody2D_set_collision_layer #-}

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A.
bindPhysicsBody2D_set_collision_layer :: MethodBind
bindPhysicsBody2D_set_collision_layer
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A.
set_collision_layer ::
                      (PhysicsBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_get_collision_layer #-}

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A.
bindPhysicsBody2D_get_collision_layer :: MethodBind
bindPhysicsBody2D_get_collision_layer
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the collision_mask property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A.
get_collision_layer ::
                      (PhysicsBody2D :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_set_collision_mask #-}

-- | The physics layers this area scans for collisions.
bindPhysicsBody2D_set_collision_mask :: MethodBind
bindPhysicsBody2D_set_collision_mask
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans for collisions.
set_collision_mask ::
                     (PhysicsBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_get_collision_mask #-}

-- | The physics layers this area scans for collisions.
bindPhysicsBody2D_get_collision_mask :: MethodBind
bindPhysicsBody2D_get_collision_mask
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans for collisions.
get_collision_mask ::
                     (PhysicsBody2D :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_set_collision_mask_bit #-}

-- | Sets individual bits on the collision mask. Use this if you only need to change one layer's value.
bindPhysicsBody2D_set_collision_mask_bit :: MethodBind
bindPhysicsBody2D_set_collision_mask_bit
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual bits on the collision mask. Use this if you only need to change one layer's value.
set_collision_mask_bit ::
                         (PhysicsBody2D :< cls, Object :< cls) =>
                         cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_get_collision_mask_bit #-}

-- | Returns an individual bit on the collision mask.
bindPhysicsBody2D_get_collision_mask_bit :: MethodBind
bindPhysicsBody2D_get_collision_mask_bit
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the collision mask.
get_collision_mask_bit ::
                         (PhysicsBody2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_set_collision_layer_bit #-}

-- | Sets individual bits on the layer mask. Use this if you only need to change one layer's value.
bindPhysicsBody2D_set_collision_layer_bit :: MethodBind
bindPhysicsBody2D_set_collision_layer_bit
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual bits on the layer mask. Use this if you only need to change one layer's value.
set_collision_layer_bit ::
                          (PhysicsBody2D :< cls, Object :< cls) =>
                          cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_get_collision_layer_bit #-}

-- | Returns an individual bit on the collision mask.
bindPhysicsBody2D_get_collision_layer_bit :: MethodBind
bindPhysicsBody2D_get_collision_layer_bit
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the collision mask.
get_collision_layer_bit ::
                          (PhysicsBody2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D__set_layers #-}

-- | Both [member collision_layer] and [member collision_mask]. Returns [member collision_layer] when accessed. Updates [member collision_layer] and [member collision_mask] when modified.
bindPhysicsBody2D__set_layers :: MethodBind
bindPhysicsBody2D__set_layers
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "_set_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Both [member collision_layer] and [member collision_mask]. Returns [member collision_layer] when accessed. Updates [member collision_layer] and [member collision_mask] when modified.
_set_layers ::
              (PhysicsBody2D :< cls, Object :< cls) => cls -> Int -> IO ()
_set_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D__set_layers (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D__get_layers #-}

-- | Both [member collision_layer] and [member collision_mask]. Returns [member collision_layer] when accessed. Updates [member collision_layer] and [member collision_mask] when modified.
bindPhysicsBody2D__get_layers :: MethodBind
bindPhysicsBody2D__get_layers
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "_get_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Both [member collision_layer] and [member collision_mask]. Returns [member collision_layer] when accessed. Updates [member collision_layer] and [member collision_mask] when modified.
_get_layers ::
              (PhysicsBody2D :< cls, Object :< cls) => cls -> IO Int
_get_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D__get_layers (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_get_collision_exceptions #-}

-- | Returns an array of nodes that were added as collision exceptions for this body.
bindPhysicsBody2D_get_collision_exceptions :: MethodBind
bindPhysicsBody2D_get_collision_exceptions
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "get_collision_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of nodes that were added as collision exceptions for this body.
get_collision_exceptions ::
                           (PhysicsBody2D :< cls, Object :< cls) => cls -> IO Array
get_collision_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody2D_get_collision_exceptions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_add_collision_exception_with #-}

-- | Adds a body to the list of bodies that this body can't collide with.
bindPhysicsBody2D_add_collision_exception_with :: MethodBind
bindPhysicsBody2D_add_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "add_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies that this body can't collide with.
add_collision_exception_with ::
                               (PhysicsBody2D :< cls, Object :< cls) => cls -> Node -> IO ()
add_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsBody2D_add_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsBody2D_remove_collision_exception_with #-}

-- | Removes a body from the list of bodies that this body can't collide with.
bindPhysicsBody2D_remove_collision_exception_with :: MethodBind
bindPhysicsBody2D_remove_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody2D" $
        \ clsNamePtr ->
          withCString "remove_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies that this body can't collide with.
remove_collision_exception_with ::
                                  (PhysicsBody2D :< cls, Object :< cls) => cls -> Node -> IO ()
remove_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsBody2D_remove_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)