{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StaticBody2D
       (Godot.Core.StaticBody2D._reload_physics_characteristics,
        Godot.Core.StaticBody2D.get_bounce,
        Godot.Core.StaticBody2D.get_constant_angular_velocity,
        Godot.Core.StaticBody2D.get_constant_linear_velocity,
        Godot.Core.StaticBody2D.get_friction,
        Godot.Core.StaticBody2D.get_physics_material_override,
        Godot.Core.StaticBody2D.set_bounce,
        Godot.Core.StaticBody2D.set_constant_angular_velocity,
        Godot.Core.StaticBody2D.set_constant_linear_velocity,
        Godot.Core.StaticBody2D.set_friction,
        Godot.Core.StaticBody2D.set_physics_material_override)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStaticBody2D__reload_physics_characteristics #-}

bindStaticBody2D__reload_physics_characteristics :: MethodBind
bindStaticBody2D__reload_physics_characteristics
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "_reload_physics_characteristics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_physics_characteristics ::
                                  (StaticBody2D :< cls, Object :< cls) => cls -> IO ()
_reload_physics_characteristics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D__reload_physics_characteristics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_get_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
bindStaticBody2D_get_bounce :: MethodBind
bindStaticBody2D_get_bounce
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
get_bounce ::
             (StaticBody2D :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody2D_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_get_constant_angular_velocity #-}

-- | Constant angular velocity for the body. This does not rotate the body, but affects colliding bodies, as if it were rotating.
bindStaticBody2D_get_constant_angular_velocity :: MethodBind
bindStaticBody2D_get_constant_angular_velocity
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "get_constant_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Constant angular velocity for the body. This does not rotate the body, but affects colliding bodies, as if it were rotating.
get_constant_angular_velocity ::
                                (StaticBody2D :< cls, Object :< cls) => cls -> IO Float
get_constant_angular_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D_get_constant_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_get_constant_linear_velocity #-}

-- | Constant linear velocity for the body. This does not move the body, but affects colliding bodies, as if it were moving.
bindStaticBody2D_get_constant_linear_velocity :: MethodBind
bindStaticBody2D_get_constant_linear_velocity
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "get_constant_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Constant linear velocity for the body. This does not move the body, but affects colliding bodies, as if it were moving.
get_constant_linear_velocity ::
                               (StaticBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_constant_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D_get_constant_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_get_friction #-}

-- | The body's friction. Values range from [code]0[/code] (no friction) to [code]1[/code] (full friction).
bindStaticBody2D_get_friction :: MethodBind
bindStaticBody2D_get_friction
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (no friction) to [code]1[/code] (full friction).
get_friction ::
               (StaticBody2D :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody2D_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_get_physics_material_override #-}

bindStaticBody2D_get_physics_material_override :: MethodBind
bindStaticBody2D_get_physics_material_override
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "get_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_physics_material_override ::
                                (StaticBody2D :< cls, Object :< cls) => cls -> IO PhysicsMaterial
get_physics_material_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D_get_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_set_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
bindStaticBody2D_set_bounce :: MethodBind
bindStaticBody2D_set_bounce
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
set_bounce ::
             (StaticBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody2D_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_set_constant_angular_velocity #-}

-- | Constant angular velocity for the body. This does not rotate the body, but affects colliding bodies, as if it were rotating.
bindStaticBody2D_set_constant_angular_velocity :: MethodBind
bindStaticBody2D_set_constant_angular_velocity
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "set_constant_angular_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Constant angular velocity for the body. This does not rotate the body, but affects colliding bodies, as if it were rotating.
set_constant_angular_velocity ::
                                (StaticBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_constant_angular_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D_set_constant_angular_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_set_constant_linear_velocity #-}

-- | Constant linear velocity for the body. This does not move the body, but affects colliding bodies, as if it were moving.
bindStaticBody2D_set_constant_linear_velocity :: MethodBind
bindStaticBody2D_set_constant_linear_velocity
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "set_constant_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Constant linear velocity for the body. This does not move the body, but affects colliding bodies, as if it were moving.
set_constant_linear_velocity ::
                               (StaticBody2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_constant_linear_velocity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D_set_constant_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_set_friction #-}

-- | The body's friction. Values range from [code]0[/code] (no friction) to [code]1[/code] (full friction).
bindStaticBody2D_set_friction :: MethodBind
bindStaticBody2D_set_friction
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (no friction) to [code]1[/code] (full friction).
set_friction ::
               (StaticBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStaticBody2D_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStaticBody2D_set_physics_material_override #-}

bindStaticBody2D_set_physics_material_override :: MethodBind
bindStaticBody2D_set_physics_material_override
  = unsafePerformIO $
      withCString "StaticBody2D" $
        \ clsNamePtr ->
          withCString "set_physics_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_physics_material_override ::
                                (StaticBody2D :< cls, Object :< cls) =>
                                cls -> PhysicsMaterial -> IO ()
set_physics_material_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStaticBody2D_set_physics_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)