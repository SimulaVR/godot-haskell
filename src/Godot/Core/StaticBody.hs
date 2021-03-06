{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.StaticBody
       (Godot.Core.StaticBody._reload_physics_characteristics,
        Godot.Core.StaticBody.get_bounce,
        Godot.Core.StaticBody.get_constant_angular_velocity,
        Godot.Core.StaticBody.get_constant_linear_velocity,
        Godot.Core.StaticBody.get_friction,
        Godot.Core.StaticBody.get_physics_material_override,
        Godot.Core.StaticBody.set_bounce,
        Godot.Core.StaticBody.set_constant_angular_velocity,
        Godot.Core.StaticBody.set_constant_linear_velocity,
        Godot.Core.StaticBody.set_friction,
        Godot.Core.StaticBody.set_physics_material_override)
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
import Godot.Core.PhysicsBody()

instance NodeProperty StaticBody "bounce" Float 'False where
        nodeProperty = (get_bounce, wrapDroppingSetter set_bounce, Nothing)

instance NodeProperty StaticBody "constant_angular_velocity"
           Vector3
           'False
         where
        nodeProperty
          = (get_constant_angular_velocity,
             wrapDroppingSetter set_constant_angular_velocity, Nothing)

instance NodeProperty StaticBody "constant_linear_velocity" Vector3
           'False
         where
        nodeProperty
          = (get_constant_linear_velocity,
             wrapDroppingSetter set_constant_linear_velocity, Nothing)

instance NodeProperty StaticBody "friction" Float 'False where
        nodeProperty
          = (get_friction, wrapDroppingSetter set_friction, Nothing)

instance NodeProperty StaticBody "physics_material_override"
           PhysicsMaterial
           'False
         where
        nodeProperty
          = (get_physics_material_override,
             wrapDroppingSetter set_physics_material_override, Nothing)

{-# NOINLINE bindStaticBody__reload_physics_characteristics #-}

bindStaticBody__reload_physics_characteristics :: MethodBind
bindStaticBody__reload_physics_characteristics
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "_reload_physics_characteristics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_physics_characteristics ::
                                  (StaticBody :< cls, Object :< cls) => cls -> IO ()
_reload_physics_characteristics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody__reload_physics_characteristics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "_reload_physics_characteristics"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.StaticBody._reload_physics_characteristics

{-# NOINLINE bindStaticBody_get_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
bindStaticBody_get_bounce :: MethodBind
bindStaticBody_get_bounce
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
get_bounce :: (StaticBody :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "get_bounce" '[] (IO Float) where
        nodeMethod = Godot.Core.StaticBody.get_bounce

{-# NOINLINE bindStaticBody_get_constant_angular_velocity #-}

-- | The body's constant angular velocity. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
bindStaticBody_get_constant_angular_velocity :: MethodBind
bindStaticBody_get_constant_angular_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_constant_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's constant angular velocity. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
get_constant_angular_velocity ::
                                (StaticBody :< cls, Object :< cls) => cls -> IO Vector3
get_constant_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_constant_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "get_constant_angular_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.StaticBody.get_constant_angular_velocity

{-# NOINLINE bindStaticBody_get_constant_linear_velocity #-}

-- | The body's constant linear velocity. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
bindStaticBody_get_constant_linear_velocity :: MethodBind
bindStaticBody_get_constant_linear_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_constant_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's constant linear velocity. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
get_constant_linear_velocity ::
                               (StaticBody :< cls, Object :< cls) => cls -> IO Vector3
get_constant_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_constant_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "get_constant_linear_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.StaticBody.get_constant_linear_velocity

{-# NOINLINE bindStaticBody_get_friction #-}

-- | The body's friction, from 0 (frictionless) to 1 (full friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
bindStaticBody_get_friction :: MethodBind
bindStaticBody_get_friction
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction, from 0 (frictionless) to 1 (full friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
get_friction ::
               (StaticBody :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "get_friction" '[] (IO Float) where
        nodeMethod = Godot.Core.StaticBody.get_friction

{-# NOINLINE bindStaticBody_get_physics_material_override #-}

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
bindStaticBody_get_physics_material_override :: MethodBind
bindStaticBody_get_physics_material_override
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
get_physics_material_override ::
                                (StaticBody :< cls, Object :< cls) => cls -> IO PhysicsMaterial
get_physics_material_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "get_physics_material_override" '[]
           (IO PhysicsMaterial)
         where
        nodeMethod = Godot.Core.StaticBody.get_physics_material_override

{-# NOINLINE bindStaticBody_set_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
bindStaticBody_set_bounce :: MethodBind
bindStaticBody_set_bounce
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
--   			Deprecated, use @PhysicsMaterial.bounce@ instead via @physics_material_override@.
set_bounce ::
             (StaticBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "set_bounce" '[Float] (IO ()) where
        nodeMethod = Godot.Core.StaticBody.set_bounce

{-# NOINLINE bindStaticBody_set_constant_angular_velocity #-}

-- | The body's constant angular velocity. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
bindStaticBody_set_constant_angular_velocity :: MethodBind
bindStaticBody_set_constant_angular_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_constant_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's constant angular velocity. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
set_constant_angular_velocity ::
                                (StaticBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_constant_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_constant_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "set_constant_angular_velocity"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.StaticBody.set_constant_angular_velocity

{-# NOINLINE bindStaticBody_set_constant_linear_velocity #-}

-- | The body's constant linear velocity. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
bindStaticBody_set_constant_linear_velocity :: MethodBind
bindStaticBody_set_constant_linear_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_constant_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's constant linear velocity. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
set_constant_linear_velocity ::
                               (StaticBody :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_constant_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_constant_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "set_constant_linear_velocity"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.StaticBody.set_constant_linear_velocity

{-# NOINLINE bindStaticBody_set_friction #-}

-- | The body's friction, from 0 (frictionless) to 1 (full friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
bindStaticBody_set_friction :: MethodBind
bindStaticBody_set_friction
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction, from 0 (frictionless) to 1 (full friction).
--   			Deprecated, use @PhysicsMaterial.friction@ instead via @physics_material_override@.
set_friction ::
               (StaticBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "set_friction" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.StaticBody.set_friction

{-# NOINLINE bindStaticBody_set_physics_material_override #-}

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
bindStaticBody_set_physics_material_override :: MethodBind
bindStaticBody_set_physics_material_override
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics material override for the body.
--   			If a material is assigned to this property, it will be used instead of any other physics material, such as an inherited one.
set_physics_material_override ::
                                (StaticBody :< cls, Object :< cls) =>
                                cls -> PhysicsMaterial -> IO ()
set_physics_material_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StaticBody "set_physics_material_override"
           '[PhysicsMaterial]
           (IO ())
         where
        nodeMethod = Godot.Core.StaticBody.set_physics_material_override