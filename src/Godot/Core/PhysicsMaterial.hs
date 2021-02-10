{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsMaterial
       (Godot.Core.PhysicsMaterial.get_bounce,
        Godot.Core.PhysicsMaterial.get_friction,
        Godot.Core.PhysicsMaterial.is_absorbent,
        Godot.Core.PhysicsMaterial.is_rough,
        Godot.Core.PhysicsMaterial.set_absorbent,
        Godot.Core.PhysicsMaterial.set_bounce,
        Godot.Core.PhysicsMaterial.set_friction,
        Godot.Core.PhysicsMaterial.set_rough)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysicsMaterial_get_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
bindPhysicsMaterial_get_bounce :: MethodBind
bindPhysicsMaterial_get_bounce
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
get_bounce ::
             (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_get_friction #-}

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
bindPhysicsMaterial_get_friction :: MethodBind
bindPhysicsMaterial_get_friction
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
get_friction ::
               (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_get_friction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_is_absorbent #-}

-- | If [code]true[/code], subtracts the bounciness from the colliding object's bounciness instead of adding it.
bindPhysicsMaterial_is_absorbent :: MethodBind
bindPhysicsMaterial_is_absorbent
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "is_absorbent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], subtracts the bounciness from the colliding object's bounciness instead of adding it.
is_absorbent ::
               (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Bool
is_absorbent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_is_absorbent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_is_rough #-}

-- | If [code]true[/code], the physics engine will use the friction of the object marked as "rough" when two objects collide. If [code]false[/code], the physics engine will use the lowest friction of all colliding objects instead. If [code]true[/code] for both colliding objects, the physics engine will use the highest friction.
bindPhysicsMaterial_is_rough :: MethodBind
bindPhysicsMaterial_is_rough
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "is_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the physics engine will use the friction of the object marked as "rough" when two objects collide. If [code]false[/code], the physics engine will use the lowest friction of all colliding objects instead. If [code]true[/code] for both colliding objects, the physics engine will use the highest friction.
is_rough ::
           (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Bool
is_rough cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_is_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_set_absorbent #-}

-- | If [code]true[/code], subtracts the bounciness from the colliding object's bounciness instead of adding it.
bindPhysicsMaterial_set_absorbent :: MethodBind
bindPhysicsMaterial_set_absorbent
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_absorbent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], subtracts the bounciness from the colliding object's bounciness instead of adding it.
set_absorbent ::
                (PhysicsMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_absorbent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_absorbent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_set_bounce #-}

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
bindPhysicsMaterial_set_bounce :: MethodBind
bindPhysicsMaterial_set_bounce
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from [code]0[/code] (no bounce) to [code]1[/code] (full bounciness).
set_bounce ::
             (PhysicsMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_set_friction #-}

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
bindPhysicsMaterial_set_friction :: MethodBind
bindPhysicsMaterial_set_friction
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction).
set_friction ::
               (PhysicsMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_friction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_set_rough #-}

-- | If [code]true[/code], the physics engine will use the friction of the object marked as "rough" when two objects collide. If [code]false[/code], the physics engine will use the lowest friction of all colliding objects instead. If [code]true[/code] for both colliding objects, the physics engine will use the highest friction.
bindPhysicsMaterial_set_rough :: MethodBind
bindPhysicsMaterial_set_rough
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the physics engine will use the friction of the object marked as "rough" when two objects collide. If [code]false[/code], the physics engine will use the lowest friction of all colliding objects instead. If [code]true[/code] for both colliding objects, the physics engine will use the highest friction.
set_rough ::
            (PhysicsMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_rough cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)