{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PhysicsMaterial
       (Godot.Core.PhysicsMaterial.set_friction,
        Godot.Core.PhysicsMaterial.get_friction,
        Godot.Core.PhysicsMaterial.set_rough,
        Godot.Core.PhysicsMaterial.is_rough,
        Godot.Core.PhysicsMaterial.set_bounce,
        Godot.Core.PhysicsMaterial.get_bounce,
        Godot.Core.PhysicsMaterial.set_absorbent,
        Godot.Core.PhysicsMaterial.is_absorbent)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysicsMaterial_set_friction #-}

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction). Default value: [code]1[/code].
bindPhysicsMaterial_set_friction :: MethodBind
bindPhysicsMaterial_set_friction
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction). Default value: [code]1[/code].
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

{-# NOINLINE bindPhysicsMaterial_get_friction #-}

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction). Default value: [code]1[/code].
bindPhysicsMaterial_get_friction :: MethodBind
bindPhysicsMaterial_get_friction
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from [code]0[/code] (frictionless) to [code]1[/code] (maximum friction). Default value: [code]1[/code].
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

{-# NOINLINE bindPhysicsMaterial_set_rough #-}

bindPhysicsMaterial_set_rough :: MethodBind
bindPhysicsMaterial_set_rough
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rough ::
            (PhysicsMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_rough cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_is_rough #-}

bindPhysicsMaterial_is_rough :: MethodBind
bindPhysicsMaterial_is_rough
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "is_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_rough ::
           (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Bool
is_rough cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_is_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_set_bounce #-}

-- | The body's bounciness. Default value: [code]0[/code].
bindPhysicsMaterial_set_bounce :: MethodBind
bindPhysicsMaterial_set_bounce
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Default value: [code]0[/code].
set_bounce ::
             (PhysicsMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_get_bounce #-}

-- | The body's bounciness. Default value: [code]0[/code].
bindPhysicsMaterial_get_bounce :: MethodBind
bindPhysicsMaterial_get_bounce
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Default value: [code]0[/code].
get_bounce ::
             (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicsMaterial_set_absorbent #-}

bindPhysicsMaterial_set_absorbent :: MethodBind
bindPhysicsMaterial_set_absorbent
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_absorbent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsMaterial_is_absorbent #-}

bindPhysicsMaterial_is_absorbent :: MethodBind
bindPhysicsMaterial_is_absorbent
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "is_absorbent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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