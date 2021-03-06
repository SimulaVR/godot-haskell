{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsBody
       (Godot.Core.PhysicsBody._get_layers,
        Godot.Core.PhysicsBody._set_layers,
        Godot.Core.PhysicsBody.add_collision_exception_with,
        Godot.Core.PhysicsBody.get_collision_exceptions,
        Godot.Core.PhysicsBody.get_collision_layer,
        Godot.Core.PhysicsBody.get_collision_layer_bit,
        Godot.Core.PhysicsBody.get_collision_mask,
        Godot.Core.PhysicsBody.get_collision_mask_bit,
        Godot.Core.PhysicsBody.remove_collision_exception_with,
        Godot.Core.PhysicsBody.set_collision_layer,
        Godot.Core.PhysicsBody.set_collision_layer_bit,
        Godot.Core.PhysicsBody.set_collision_mask,
        Godot.Core.PhysicsBody.set_collision_mask_bit)
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
import Godot.Core.CollisionObject()

instance NodeProperty PhysicsBody "collision_layer" Int 'False
         where
        nodeProperty
          = (get_collision_layer, wrapDroppingSetter set_collision_layer,
             Nothing)

instance NodeProperty PhysicsBody "collision_mask" Int 'False where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

{-# NOINLINE bindPhysicsBody__get_layers #-}

bindPhysicsBody__get_layers :: MethodBind
bindPhysicsBody__get_layers
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "_get_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_layers :: (PhysicsBody :< cls, Object :< cls) => cls -> IO Int
_get_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody__get_layers (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "_get_layers" '[] (IO Int) where
        nodeMethod = Godot.Core.PhysicsBody._get_layers

{-# NOINLINE bindPhysicsBody__set_layers #-}

bindPhysicsBody__set_layers :: MethodBind
bindPhysicsBody__set_layers
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "_set_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_layers ::
              (PhysicsBody :< cls, Object :< cls) => cls -> Int -> IO ()
_set_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody__set_layers (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "_set_layers" '[Int] (IO ()) where
        nodeMethod = Godot.Core.PhysicsBody._set_layers

{-# NOINLINE bindPhysicsBody_add_collision_exception_with #-}

-- | Adds a body to the list of bodies that this body can't collide with.
bindPhysicsBody_add_collision_exception_with :: MethodBind
bindPhysicsBody_add_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "add_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a body to the list of bodies that this body can't collide with.
add_collision_exception_with ::
                               (PhysicsBody :< cls, Object :< cls) => cls -> Node -> IO ()
add_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_add_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "add_collision_exception_with"
           '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.add_collision_exception_with

{-# NOINLINE bindPhysicsBody_get_collision_exceptions #-}

-- | Returns an array of nodes that were added as collision exceptions for this body.
bindPhysicsBody_get_collision_exceptions :: MethodBind
bindPhysicsBody_get_collision_exceptions
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "get_collision_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of nodes that were added as collision exceptions for this body.
get_collision_exceptions ::
                           (PhysicsBody :< cls, Object :< cls) => cls -> IO Array
get_collision_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_get_collision_exceptions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "get_collision_exceptions" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsBody.get_collision_exceptions

{-# NOINLINE bindPhysicsBody_get_collision_layer #-}

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the @collision_mask@ property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysicsBody_get_collision_layer :: MethodBind
bindPhysicsBody_get_collision_layer
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the @collision_mask@ property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_layer ::
                      (PhysicsBody :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "get_collision_layer" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsBody.get_collision_layer

{-# NOINLINE bindPhysicsBody_get_collision_layer_bit #-}

-- | Returns an individual bit on the @collision_layer@.
bindPhysicsBody_get_collision_layer_bit :: MethodBind
bindPhysicsBody_get_collision_layer_bit
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the @collision_layer@.
get_collision_layer_bit ::
                          (PhysicsBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "get_collision_layer_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsBody.get_collision_layer_bit

{-# NOINLINE bindPhysicsBody_get_collision_mask #-}

-- | The physics layers this area scans for collisions. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysicsBody_get_collision_mask :: MethodBind
bindPhysicsBody_get_collision_mask
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans for collisions. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_mask ::
                     (PhysicsBody :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "get_collision_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsBody.get_collision_mask

{-# NOINLINE bindPhysicsBody_get_collision_mask_bit #-}

-- | Returns an individual bit on the @collision_mask@.
bindPhysicsBody_get_collision_mask_bit :: MethodBind
bindPhysicsBody_get_collision_mask_bit
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an individual bit on the @collision_mask@.
get_collision_mask_bit ::
                         (PhysicsBody :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "get_collision_mask_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsBody.get_collision_mask_bit

{-# NOINLINE bindPhysicsBody_remove_collision_exception_with #-}

-- | Removes a body from the list of bodies that this body can't collide with.
bindPhysicsBody_remove_collision_exception_with :: MethodBind
bindPhysicsBody_remove_collision_exception_with
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "remove_collision_exception_with" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a body from the list of bodies that this body can't collide with.
remove_collision_exception_with ::
                                  (PhysicsBody :< cls, Object :< cls) => cls -> Node -> IO ()
remove_collision_exception_with cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsBody_remove_collision_exception_with
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "remove_collision_exception_with"
           '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.remove_collision_exception_with

{-# NOINLINE bindPhysicsBody_set_collision_layer #-}

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the @collision_mask@ property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysicsBody_set_collision_layer :: MethodBind
bindPhysicsBody_set_collision_layer
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area is in.
--   			Collidable objects can exist in any of 32 different layers. These layers work like a tagging system, and are not visual. A collidable can use these layers to select with which objects it can collide, using the @collision_mask@ property.
--   			A contact is detected if object A is in any of the layers that object B scans, or object B is in any layer scanned by object A. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_layer ::
                      (PhysicsBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "set_collision_layer" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.set_collision_layer

{-# NOINLINE bindPhysicsBody_set_collision_layer_bit #-}

-- | Sets individual bits on the @collision_layer@ bitmask. Use this if you only need to change one layer's value.
bindPhysicsBody_set_collision_layer_bit :: MethodBind
bindPhysicsBody_set_collision_layer_bit
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual bits on the @collision_layer@ bitmask. Use this if you only need to change one layer's value.
set_collision_layer_bit ::
                          (PhysicsBody :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "set_collision_layer_bit"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.set_collision_layer_bit

{-# NOINLINE bindPhysicsBody_set_collision_mask #-}

-- | The physics layers this area scans for collisions. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysicsBody_set_collision_mask :: MethodBind
bindPhysicsBody_set_collision_mask
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans for collisions. See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_mask ::
                     (PhysicsBody :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "set_collision_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.set_collision_mask

{-# NOINLINE bindPhysicsBody_set_collision_mask_bit #-}

-- | Sets individual bits on the @collision_mask@ bitmask. Use this if you only need to change one layer's value.
bindPhysicsBody_set_collision_mask_bit :: MethodBind
bindPhysicsBody_set_collision_mask_bit
  = unsafePerformIO $
      withCString "PhysicsBody" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets individual bits on the @collision_mask@ bitmask. Use this if you only need to change one layer's value.
set_collision_mask_bit ::
                         (PhysicsBody :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsBody_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsBody "set_collision_mask_bit"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsBody.set_collision_mask_bit