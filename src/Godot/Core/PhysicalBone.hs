{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PhysicalBone
       (Godot.Core.PhysicalBone._JOINT_TYPE_6DOF,
        Godot.Core.PhysicalBone._JOINT_TYPE_PIN,
        Godot.Core.PhysicalBone._JOINT_TYPE_CONE,
        Godot.Core.PhysicalBone._JOINT_TYPE_NONE,
        Godot.Core.PhysicalBone._JOINT_TYPE_SLIDER,
        Godot.Core.PhysicalBone._JOINT_TYPE_HINGE,
        Godot.Core.PhysicalBone._direct_state_changed,
        Godot.Core.PhysicalBone.set_joint_type,
        Godot.Core.PhysicalBone.get_joint_type,
        Godot.Core.PhysicalBone.set_joint_offset,
        Godot.Core.PhysicalBone.get_joint_offset,
        Godot.Core.PhysicalBone.set_body_offset,
        Godot.Core.PhysicalBone.get_body_offset,
        Godot.Core.PhysicalBone.is_static_body,
        Godot.Core.PhysicalBone.get_simulate_physics,
        Godot.Core.PhysicalBone.is_simulating_physics,
        Godot.Core.PhysicalBone.get_bone_id,
        Godot.Core.PhysicalBone.set_mass, Godot.Core.PhysicalBone.get_mass,
        Godot.Core.PhysicalBone.set_weight,
        Godot.Core.PhysicalBone.get_weight,
        Godot.Core.PhysicalBone.set_friction,
        Godot.Core.PhysicalBone.get_friction,
        Godot.Core.PhysicalBone.set_bounce,
        Godot.Core.PhysicalBone.get_bounce,
        Godot.Core.PhysicalBone.set_gravity_scale,
        Godot.Core.PhysicalBone.get_gravity_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_JOINT_TYPE_6DOF :: Int
_JOINT_TYPE_6DOF = 5

_JOINT_TYPE_PIN :: Int
_JOINT_TYPE_PIN = 1

_JOINT_TYPE_CONE :: Int
_JOINT_TYPE_CONE = 2

_JOINT_TYPE_NONE :: Int
_JOINT_TYPE_NONE = 0

_JOINT_TYPE_SLIDER :: Int
_JOINT_TYPE_SLIDER = 4

_JOINT_TYPE_HINGE :: Int
_JOINT_TYPE_HINGE = 3

{-# NOINLINE bindPhysicalBone__direct_state_changed #-}

bindPhysicalBone__direct_state_changed :: MethodBind
bindPhysicalBone__direct_state_changed
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "_direct_state_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_direct_state_changed ::
                        (PhysicalBone :< cls, Object :< cls) => cls -> Object -> IO ()
_direct_state_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone__direct_state_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_joint_type #-}

bindPhysicalBone_set_joint_type :: MethodBind
bindPhysicalBone_set_joint_type
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_joint_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joint_type ::
                 (PhysicalBone :< cls, Object :< cls) => cls -> Int -> IO ()
set_joint_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_joint_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_joint_type #-}

bindPhysicalBone_get_joint_type :: MethodBind
bindPhysicalBone_get_joint_type
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_joint_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joint_type ::
                 (PhysicalBone :< cls, Object :< cls) => cls -> IO Int
get_joint_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_joint_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_joint_offset #-}

bindPhysicalBone_set_joint_offset :: MethodBind
bindPhysicalBone_set_joint_offset
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_joint_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_joint_offset ::
                   (PhysicalBone :< cls, Object :< cls) => cls -> Transform -> IO ()
set_joint_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_joint_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_joint_offset #-}

bindPhysicalBone_get_joint_offset :: MethodBind
bindPhysicalBone_get_joint_offset
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_joint_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_joint_offset ::
                   (PhysicalBone :< cls, Object :< cls) => cls -> IO Transform
get_joint_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_joint_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_body_offset #-}

bindPhysicalBone_set_body_offset :: MethodBind
bindPhysicalBone_set_body_offset
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_body_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_body_offset ::
                  (PhysicalBone :< cls, Object :< cls) => cls -> Transform -> IO ()
set_body_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_body_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_body_offset #-}

bindPhysicalBone_get_body_offset :: MethodBind
bindPhysicalBone_get_body_offset
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_body_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_body_offset ::
                  (PhysicalBone :< cls, Object :< cls) => cls -> IO Transform
get_body_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_body_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_is_static_body #-}

bindPhysicalBone_is_static_body :: MethodBind
bindPhysicalBone_is_static_body
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "is_static_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_static_body ::
                 (PhysicalBone :< cls, Object :< cls) => cls -> IO Bool
is_static_body cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_is_static_body (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_simulate_physics #-}

bindPhysicalBone_get_simulate_physics :: MethodBind
bindPhysicalBone_get_simulate_physics
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_simulate_physics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_simulate_physics ::
                       (PhysicalBone :< cls, Object :< cls) => cls -> IO Bool
get_simulate_physics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_simulate_physics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_is_simulating_physics #-}

bindPhysicalBone_is_simulating_physics :: MethodBind
bindPhysicalBone_is_simulating_physics
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "is_simulating_physics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_simulating_physics ::
                        (PhysicalBone :< cls, Object :< cls) => cls -> IO Bool
is_simulating_physics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_is_simulating_physics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_bone_id #-}

bindPhysicalBone_get_bone_id :: MethodBind
bindPhysicalBone_get_bone_id
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_bone_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_id ::
              (PhysicalBone :< cls, Object :< cls) => cls -> IO Int
get_bone_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_bone_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_mass #-}

bindPhysicalBone_set_mass :: MethodBind
bindPhysicalBone_set_mass
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mass ::
           (PhysicalBone :< cls, Object :< cls) => cls -> Float -> IO ()
set_mass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_mass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_mass #-}

bindPhysicalBone_get_mass :: MethodBind
bindPhysicalBone_get_mass
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_mass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mass :: (PhysicalBone :< cls, Object :< cls) => cls -> IO Float
get_mass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_mass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_weight #-}

bindPhysicalBone_set_weight :: MethodBind
bindPhysicalBone_set_weight
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_weight ::
             (PhysicalBone :< cls, Object :< cls) => cls -> Float -> IO ()
set_weight cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_weight (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_weight #-}

bindPhysicalBone_get_weight :: MethodBind
bindPhysicalBone_get_weight
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_weight ::
             (PhysicalBone :< cls, Object :< cls) => cls -> IO Float
get_weight cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_weight (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_friction #-}

bindPhysicalBone_set_friction :: MethodBind
bindPhysicalBone_set_friction
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_friction ::
               (PhysicalBone :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_friction #-}

bindPhysicalBone_get_friction :: MethodBind
bindPhysicalBone_get_friction
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_friction ::
               (PhysicalBone :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_friction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_bounce #-}

bindPhysicalBone_set_bounce :: MethodBind
bindPhysicalBone_set_bounce
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bounce ::
             (PhysicalBone :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_bounce #-}

bindPhysicalBone_get_bounce :: MethodBind
bindPhysicalBone_get_bounce
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bounce ::
             (PhysicalBone :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_set_gravity_scale #-}

bindPhysicalBone_set_gravity_scale :: MethodBind
bindPhysicalBone_set_gravity_scale
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "set_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_gravity_scale ::
                    (PhysicalBone :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_set_gravity_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysicalBone_get_gravity_scale #-}

bindPhysicalBone_get_gravity_scale :: MethodBind
bindPhysicalBone_get_gravity_scale
  = unsafePerformIO $
      withCString "PhysicalBone" $
        \ clsNamePtr ->
          withCString "get_gravity_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_gravity_scale ::
                    (PhysicalBone :< cls, Object :< cls) => cls -> IO Float
get_gravity_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicalBone_get_gravity_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)