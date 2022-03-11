{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SpringArm
       (Godot.Core.SpringArm.add_excluded_object,
        Godot.Core.SpringArm.clear_excluded_objects,
        Godot.Core.SpringArm.get_collision_mask,
        Godot.Core.SpringArm.get_hit_length,
        Godot.Core.SpringArm.get_length, Godot.Core.SpringArm.get_margin,
        Godot.Core.SpringArm.get_shape,
        Godot.Core.SpringArm.remove_excluded_object,
        Godot.Core.SpringArm.set_collision_mask,
        Godot.Core.SpringArm.set_length, Godot.Core.SpringArm.set_margin,
        Godot.Core.SpringArm.set_shape)
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

instance NodeProperty SpringArm "collision_mask" Int 'False where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty SpringArm "margin" Float 'False where
        nodeProperty = (get_margin, wrapDroppingSetter set_margin, Nothing)

instance NodeProperty SpringArm "shape" Shape 'False where
        nodeProperty = (get_shape, wrapDroppingSetter set_shape, Nothing)

instance NodeProperty SpringArm "spring_length" Float 'False where
        nodeProperty = (get_length, wrapDroppingSetter set_length, Nothing)

{-# NOINLINE bindSpringArm_add_excluded_object #-}

-- | Adds the @PhysicsBody@ object with the given @RID@ to the list of @PhysicsBody@ objects excluded from the collision check.
bindSpringArm_add_excluded_object :: MethodBind
bindSpringArm_add_excluded_object
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "add_excluded_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the @PhysicsBody@ object with the given @RID@ to the list of @PhysicsBody@ objects excluded from the collision check.
add_excluded_object ::
                      (SpringArm :< cls, Object :< cls) => cls -> Rid -> IO ()
add_excluded_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_add_excluded_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "add_excluded_object" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.SpringArm.add_excluded_object

{-# NOINLINE bindSpringArm_clear_excluded_objects #-}

-- | Clears the list of @PhysicsBody@ objects excluded from the collision check.
bindSpringArm_clear_excluded_objects :: MethodBind
bindSpringArm_clear_excluded_objects
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "clear_excluded_objects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the list of @PhysicsBody@ objects excluded from the collision check.
clear_excluded_objects ::
                         (SpringArm :< cls, Object :< cls) => cls -> IO ()
clear_excluded_objects cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_clear_excluded_objects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "clear_excluded_objects" '[] (IO ())
         where
        nodeMethod = Godot.Core.SpringArm.clear_excluded_objects

{-# NOINLINE bindSpringArm_get_collision_mask #-}

-- | The layers against which the collision check shall be done. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindSpringArm_get_collision_mask :: MethodBind
bindSpringArm_get_collision_mask
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layers against which the collision check shall be done. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_mask ::
                     (SpringArm :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "get_collision_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpringArm.get_collision_mask

{-# NOINLINE bindSpringArm_get_hit_length #-}

-- | Returns the spring arm's current length.
bindSpringArm_get_hit_length :: MethodBind
bindSpringArm_get_hit_length
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_hit_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the spring arm's current length.
get_hit_length ::
                 (SpringArm :< cls, Object :< cls) => cls -> IO Float
get_hit_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_hit_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "get_hit_length" '[] (IO Float) where
        nodeMethod = Godot.Core.SpringArm.get_hit_length

{-# NOINLINE bindSpringArm_get_length #-}

-- | The maximum extent of the SpringArm. This is used as a length for both the ray and the shape cast used internally to calculate the desired position of the SpringArm's child nodes.
--   			To know more about how to perform a shape cast or a ray cast, please consult the @PhysicsDirectSpaceState@ documentation.
bindSpringArm_get_length :: MethodBind
bindSpringArm_get_length
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum extent of the SpringArm. This is used as a length for both the ray and the shape cast used internally to calculate the desired position of the SpringArm's child nodes.
--   			To know more about how to perform a shape cast or a ray cast, please consult the @PhysicsDirectSpaceState@ documentation.
get_length :: (SpringArm :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "get_length" '[] (IO Float) where
        nodeMethod = Godot.Core.SpringArm.get_length

{-# NOINLINE bindSpringArm_get_margin #-}

-- | When the collision check is made, a candidate length for the SpringArm is given.
--   			The margin is then subtracted to this length and the translation is applied to the child objects of the SpringArm.
--   			This margin is useful for when the SpringArm has a @Camera@ as a child node: without the margin, the @Camera@ would be placed on the exact point of collision, while with the margin the @Camera@ would be placed close to the point of collision.
bindSpringArm_get_margin :: MethodBind
bindSpringArm_get_margin
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When the collision check is made, a candidate length for the SpringArm is given.
--   			The margin is then subtracted to this length and the translation is applied to the child objects of the SpringArm.
--   			This margin is useful for when the SpringArm has a @Camera@ as a child node: without the margin, the @Camera@ would be placed on the exact point of collision, while with the margin the @Camera@ would be placed close to the point of collision.
get_margin :: (SpringArm :< cls, Object :< cls) => cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "get_margin" '[] (IO Float) where
        nodeMethod = Godot.Core.SpringArm.get_margin

{-# NOINLINE bindSpringArm_get_shape #-}

-- | The @Shape@ to use for the SpringArm.
--   			When the shape is set, the SpringArm will cast the @Shape@ on its z axis instead of performing a ray cast.
bindSpringArm_get_shape :: MethodBind
bindSpringArm_get_shape
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Shape@ to use for the SpringArm.
--   			When the shape is set, the SpringArm will cast the @Shape@ on its z axis instead of performing a ray cast.
get_shape :: (SpringArm :< cls, Object :< cls) => cls -> IO Shape
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_shape (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "get_shape" '[] (IO Shape) where
        nodeMethod = Godot.Core.SpringArm.get_shape

{-# NOINLINE bindSpringArm_remove_excluded_object #-}

-- | Removes the given @RID@ from the list of @PhysicsBody@ objects excluded from the collision check.
bindSpringArm_remove_excluded_object :: MethodBind
bindSpringArm_remove_excluded_object
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "remove_excluded_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given @RID@ from the list of @PhysicsBody@ objects excluded from the collision check.
remove_excluded_object ::
                         (SpringArm :< cls, Object :< cls) => cls -> Rid -> IO Bool
remove_excluded_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_remove_excluded_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "remove_excluded_object" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SpringArm.remove_excluded_object

{-# NOINLINE bindSpringArm_set_collision_mask #-}

-- | The layers against which the collision check shall be done. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindSpringArm_set_collision_mask :: MethodBind
bindSpringArm_set_collision_mask
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layers against which the collision check shall be done. See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_mask ::
                     (SpringArm :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "set_collision_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.SpringArm.set_collision_mask

{-# NOINLINE bindSpringArm_set_length #-}

-- | The maximum extent of the SpringArm. This is used as a length for both the ray and the shape cast used internally to calculate the desired position of the SpringArm's child nodes.
--   			To know more about how to perform a shape cast or a ray cast, please consult the @PhysicsDirectSpaceState@ documentation.
bindSpringArm_set_length :: MethodBind
bindSpringArm_set_length
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum extent of the SpringArm. This is used as a length for both the ray and the shape cast used internally to calculate the desired position of the SpringArm's child nodes.
--   			To know more about how to perform a shape cast or a ray cast, please consult the @PhysicsDirectSpaceState@ documentation.
set_length ::
             (SpringArm :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "set_length" '[Float] (IO ()) where
        nodeMethod = Godot.Core.SpringArm.set_length

{-# NOINLINE bindSpringArm_set_margin #-}

-- | When the collision check is made, a candidate length for the SpringArm is given.
--   			The margin is then subtracted to this length and the translation is applied to the child objects of the SpringArm.
--   			This margin is useful for when the SpringArm has a @Camera@ as a child node: without the margin, the @Camera@ would be placed on the exact point of collision, while with the margin the @Camera@ would be placed close to the point of collision.
bindSpringArm_set_margin :: MethodBind
bindSpringArm_set_margin
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When the collision check is made, a candidate length for the SpringArm is given.
--   			The margin is then subtracted to this length and the translation is applied to the child objects of the SpringArm.
--   			This margin is useful for when the SpringArm has a @Camera@ as a child node: without the margin, the @Camera@ would be placed on the exact point of collision, while with the margin the @Camera@ would be placed close to the point of collision.
set_margin ::
             (SpringArm :< cls, Object :< cls) => cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "set_margin" '[Float] (IO ()) where
        nodeMethod = Godot.Core.SpringArm.set_margin

{-# NOINLINE bindSpringArm_set_shape #-}

-- | The @Shape@ to use for the SpringArm.
--   			When the shape is set, the SpringArm will cast the @Shape@ on its z axis instead of performing a ray cast.
bindSpringArm_set_shape :: MethodBind
bindSpringArm_set_shape
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Shape@ to use for the SpringArm.
--   			When the shape is set, the SpringArm will cast the @Shape@ on its z axis instead of performing a ray cast.
set_shape ::
            (SpringArm :< cls, Object :< cls) => cls -> Shape -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_shape (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpringArm "set_shape" '[Shape] (IO ()) where
        nodeMethod = Godot.Core.SpringArm.set_shape