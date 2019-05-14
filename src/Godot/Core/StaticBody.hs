{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StaticBody
       (Godot.Core.StaticBody.set_constant_linear_velocity,
        Godot.Core.StaticBody.set_constant_angular_velocity,
        Godot.Core.StaticBody.get_constant_linear_velocity,
        Godot.Core.StaticBody.get_constant_angular_velocity,
        Godot.Core.StaticBody.set_friction,
        Godot.Core.StaticBody.get_friction,
        Godot.Core.StaticBody.set_bounce, Godot.Core.StaticBody.get_bounce,
        Godot.Core.StaticBody.set_physics_material_override,
        Godot.Core.StaticBody.get_physics_material_override,
        Godot.Core.StaticBody._reload_physics_characteristics)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStaticBody_set_constant_linear_velocity #-}

-- | The constant linear velocity for the body. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
bindStaticBody_set_constant_linear_velocity :: MethodBind
bindStaticBody_set_constant_linear_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_constant_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The constant linear velocity for the body. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
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

{-# NOINLINE bindStaticBody_set_constant_angular_velocity #-}

-- | The constant angular velocity for the body. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
bindStaticBody_set_constant_angular_velocity :: MethodBind
bindStaticBody_set_constant_angular_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_constant_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The constant angular velocity for the body. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
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

{-# NOINLINE bindStaticBody_get_constant_linear_velocity #-}

-- | The constant linear velocity for the body. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
bindStaticBody_get_constant_linear_velocity :: MethodBind
bindStaticBody_get_constant_linear_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_constant_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The constant linear velocity for the body. This does not move the body, but affects other bodies that touch it, as if it was in a state of movement.
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

{-# NOINLINE bindStaticBody_get_constant_angular_velocity #-}

-- | The constant angular velocity for the body. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
bindStaticBody_get_constant_angular_velocity :: MethodBind
bindStaticBody_get_constant_angular_velocity
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_constant_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The constant angular velocity for the body. This does not rotate the body, but affects other bodies that touch it, as if it was in a state of rotation.
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

{-# NOINLINE bindStaticBody_set_friction #-}

-- | The body friction, from 0 (frictionless) to 1 (full friction).
bindStaticBody_set_friction :: MethodBind
bindStaticBody_set_friction
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body friction, from 0 (frictionless) to 1 (full friction).
set_friction ::
               (StaticBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody_get_friction #-}

-- | The body friction, from 0 (frictionless) to 1 (full friction).
bindStaticBody_get_friction :: MethodBind
bindStaticBody_get_friction
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body friction, from 0 (frictionless) to 1 (full friction).
get_friction ::
               (StaticBody :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody_set_bounce #-}

-- | The body bounciness.
bindStaticBody_set_bounce :: MethodBind
bindStaticBody_set_bounce
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body bounciness.
set_bounce ::
             (StaticBody :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody_get_bounce #-}

-- | The body bounciness.
bindStaticBody_get_bounce :: MethodBind
bindStaticBody_get_bounce
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body bounciness.
get_bounce :: (StaticBody :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody_set_physics_material_override #-}

bindStaticBody_set_physics_material_override :: MethodBind
bindStaticBody_set_physics_material_override
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "set_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindStaticBody_get_physics_material_override #-}

bindStaticBody_get_physics_material_override :: MethodBind
bindStaticBody_get_physics_material_override
  = unsafePerformIO $
      withCString "StaticBody" $
        \ clsNamePtr ->
          withCString "get_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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