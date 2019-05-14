{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Generic6DOFJoint
       (Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_LOWER_LIMIT,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_LINEAR_MOTOR,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_MOTOR_TARGET_VELOCITY,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_DAMPING,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_ERP,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_DAMPING,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_ANGULAR_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_LIMIT_SOFTNESS,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_MOTOR_TARGET_VELOCITY,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_LOWER_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_MOTOR_FORCE_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_RESTITUTION,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_ANGULAR_SPRING,
        Godot.Core.Generic6DOFJoint._PARAM_MAX,
        Godot.Core.Generic6DOFJoint._FLAG_MAX,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_LIMIT_SOFTNESS,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_UPPER_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_FORCE_LIMIT,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_LINEAR_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_UPPER_LIMIT,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_LINEAR_SPRING,
        Godot.Core.Generic6DOFJoint._FLAG_ENABLE_MOTOR,
        Godot.Core.Generic6DOFJoint._PARAM_LINEAR_MOTOR_FORCE_LIMIT,
        Godot.Core.Generic6DOFJoint._PARAM_ANGULAR_RESTITUTION,
        Godot.Core.Generic6DOFJoint._set_angular_hi_limit_x,
        Godot.Core.Generic6DOFJoint._get_angular_hi_limit_x,
        Godot.Core.Generic6DOFJoint._set_angular_lo_limit_x,
        Godot.Core.Generic6DOFJoint._get_angular_lo_limit_x,
        Godot.Core.Generic6DOFJoint._set_angular_hi_limit_y,
        Godot.Core.Generic6DOFJoint._get_angular_hi_limit_y,
        Godot.Core.Generic6DOFJoint._set_angular_lo_limit_y,
        Godot.Core.Generic6DOFJoint._get_angular_lo_limit_y,
        Godot.Core.Generic6DOFJoint._set_angular_hi_limit_z,
        Godot.Core.Generic6DOFJoint._get_angular_hi_limit_z,
        Godot.Core.Generic6DOFJoint._set_angular_lo_limit_z,
        Godot.Core.Generic6DOFJoint._get_angular_lo_limit_z,
        Godot.Core.Generic6DOFJoint.set_param_x,
        Godot.Core.Generic6DOFJoint.get_param_x,
        Godot.Core.Generic6DOFJoint.set_param_y,
        Godot.Core.Generic6DOFJoint.get_param_y,
        Godot.Core.Generic6DOFJoint.set_param_z,
        Godot.Core.Generic6DOFJoint.get_param_z,
        Godot.Core.Generic6DOFJoint.set_flag_x,
        Godot.Core.Generic6DOFJoint.get_flag_x,
        Godot.Core.Generic6DOFJoint.set_flag_y,
        Godot.Core.Generic6DOFJoint.get_flag_y,
        Godot.Core.Generic6DOFJoint.set_flag_z,
        Godot.Core.Generic6DOFJoint.get_flag_z,
        Godot.Core.Generic6DOFJoint.set_precision,
        Godot.Core.Generic6DOFJoint.get_precision)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PARAM_ANGULAR_LOWER_LIMIT :: Int
_PARAM_ANGULAR_LOWER_LIMIT = 10

_FLAG_ENABLE_LINEAR_MOTOR :: Int
_FLAG_ENABLE_LINEAR_MOTOR = 5

_PARAM_LINEAR_MOTOR_TARGET_VELOCITY :: Int
_PARAM_LINEAR_MOTOR_TARGET_VELOCITY = 5

_PARAM_LINEAR_DAMPING :: Int
_PARAM_LINEAR_DAMPING = 4

_PARAM_ANGULAR_ERP :: Int
_PARAM_ANGULAR_ERP = 16

_PARAM_ANGULAR_DAMPING :: Int
_PARAM_ANGULAR_DAMPING = 13

_FLAG_ENABLE_ANGULAR_LIMIT :: Int
_FLAG_ENABLE_ANGULAR_LIMIT = 1

_PARAM_LINEAR_LIMIT_SOFTNESS :: Int
_PARAM_LINEAR_LIMIT_SOFTNESS = 2

_PARAM_ANGULAR_MOTOR_TARGET_VELOCITY :: Int
_PARAM_ANGULAR_MOTOR_TARGET_VELOCITY = 17

_PARAM_LINEAR_LOWER_LIMIT :: Int
_PARAM_LINEAR_LOWER_LIMIT = 0

_PARAM_ANGULAR_MOTOR_FORCE_LIMIT :: Int
_PARAM_ANGULAR_MOTOR_FORCE_LIMIT = 18

_PARAM_LINEAR_RESTITUTION :: Int
_PARAM_LINEAR_RESTITUTION = 3

_FLAG_ENABLE_ANGULAR_SPRING :: Int
_FLAG_ENABLE_ANGULAR_SPRING = 2

_PARAM_MAX :: Int
_PARAM_MAX = 22

_FLAG_MAX :: Int
_FLAG_MAX = 6

_PARAM_ANGULAR_LIMIT_SOFTNESS :: Int
_PARAM_ANGULAR_LIMIT_SOFTNESS = 12

_PARAM_LINEAR_UPPER_LIMIT :: Int
_PARAM_LINEAR_UPPER_LIMIT = 1

_PARAM_ANGULAR_FORCE_LIMIT :: Int
_PARAM_ANGULAR_FORCE_LIMIT = 15

_FLAG_ENABLE_LINEAR_LIMIT :: Int
_FLAG_ENABLE_LINEAR_LIMIT = 0

_PARAM_ANGULAR_UPPER_LIMIT :: Int
_PARAM_ANGULAR_UPPER_LIMIT = 11

_FLAG_ENABLE_LINEAR_SPRING :: Int
_FLAG_ENABLE_LINEAR_SPRING = 3

_FLAG_ENABLE_MOTOR :: Int
_FLAG_ENABLE_MOTOR = 4

_PARAM_LINEAR_MOTOR_FORCE_LIMIT :: Int
_PARAM_LINEAR_MOTOR_FORCE_LIMIT = 6

_PARAM_ANGULAR_RESTITUTION :: Int
_PARAM_ANGULAR_RESTITUTION = 14

{-# NOINLINE bindGeneric6DOFJoint__set_angular_hi_limit_x #-}

-- | The minimum rotation in positive direction to break loose and rotate around the x-axis.
bindGeneric6DOFJoint__set_angular_hi_limit_x :: MethodBind
bindGeneric6DOFJoint__set_angular_hi_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_hi_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the x-axis.
_set_angular_hi_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_hi_limit_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_hi_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_hi_limit_x #-}

-- | The minimum rotation in positive direction to break loose and rotate around the x-axis.
bindGeneric6DOFJoint__get_angular_hi_limit_x :: MethodBind
bindGeneric6DOFJoint__get_angular_hi_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_hi_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the x-axis.
_get_angular_hi_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_hi_limit_x cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_hi_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__set_angular_lo_limit_x #-}

-- | The minimum rotation in negative direction to break loose and rotate around the x-axis.
bindGeneric6DOFJoint__set_angular_lo_limit_x :: MethodBind
bindGeneric6DOFJoint__set_angular_lo_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_lo_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the x-axis.
_set_angular_lo_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_lo_limit_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_lo_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_lo_limit_x #-}

-- | The minimum rotation in negative direction to break loose and rotate around the x-axis.
bindGeneric6DOFJoint__get_angular_lo_limit_x :: MethodBind
bindGeneric6DOFJoint__get_angular_lo_limit_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_lo_limit_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the x-axis.
_get_angular_lo_limit_x ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_lo_limit_x cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_lo_limit_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__set_angular_hi_limit_y #-}

-- | The minimum rotation in positive direction to break loose and rotate around the y-axis.
bindGeneric6DOFJoint__set_angular_hi_limit_y :: MethodBind
bindGeneric6DOFJoint__set_angular_hi_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_hi_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the y-axis.
_set_angular_hi_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_hi_limit_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_hi_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_hi_limit_y #-}

-- | The minimum rotation in positive direction to break loose and rotate around the y-axis.
bindGeneric6DOFJoint__get_angular_hi_limit_y :: MethodBind
bindGeneric6DOFJoint__get_angular_hi_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_hi_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the y-axis.
_get_angular_hi_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_hi_limit_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_hi_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__set_angular_lo_limit_y #-}

-- | The minimum rotation in negative direction to break loose and rotate around the y-axis.
bindGeneric6DOFJoint__set_angular_lo_limit_y :: MethodBind
bindGeneric6DOFJoint__set_angular_lo_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_lo_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the y-axis.
_set_angular_lo_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_lo_limit_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_lo_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_lo_limit_y #-}

-- | The minimum rotation in negative direction to break loose and rotate around the y-axis.
bindGeneric6DOFJoint__get_angular_lo_limit_y :: MethodBind
bindGeneric6DOFJoint__get_angular_lo_limit_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_lo_limit_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the y-axis.
_get_angular_lo_limit_y ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_lo_limit_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_lo_limit_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__set_angular_hi_limit_z #-}

-- | The minimum rotation in positive direction to break loose and rotate around the z-axis.
bindGeneric6DOFJoint__set_angular_hi_limit_z :: MethodBind
bindGeneric6DOFJoint__set_angular_hi_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_hi_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the z-axis.
_set_angular_hi_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_hi_limit_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_hi_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_hi_limit_z #-}

-- | The minimum rotation in positive direction to break loose and rotate around the z-axis.
bindGeneric6DOFJoint__get_angular_hi_limit_z :: MethodBind
bindGeneric6DOFJoint__get_angular_hi_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_hi_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in positive direction to break loose and rotate around the z-axis.
_get_angular_hi_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_hi_limit_z cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_hi_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__set_angular_lo_limit_z #-}

-- | The minimum rotation in negative direction to break loose and rotate around the z-axis.
bindGeneric6DOFJoint__set_angular_lo_limit_z :: MethodBind
bindGeneric6DOFJoint__set_angular_lo_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_set_angular_lo_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the z-axis.
_set_angular_lo_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_angular_lo_limit_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__set_angular_lo_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint__get_angular_lo_limit_z #-}

-- | The minimum rotation in negative direction to break loose and rotate around the z-axis.
bindGeneric6DOFJoint__get_angular_lo_limit_z :: MethodBind
bindGeneric6DOFJoint__get_angular_lo_limit_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "_get_angular_lo_limit_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation in negative direction to break loose and rotate around the z-axis.
_get_angular_lo_limit_z ::
                          (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Float
_get_angular_lo_limit_z cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint__get_angular_lo_limit_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_param_x #-}

-- | The amount of rotational damping across the x-axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
bindGeneric6DOFJoint_set_param_x :: MethodBind
bindGeneric6DOFJoint_set_param_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_param_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the x-axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
set_param_x ::
              (Generic6DOFJoint :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO ()
set_param_x cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_param_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_param_x #-}

-- | The amount of rotational damping across the x-axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
bindGeneric6DOFJoint_get_param_x :: MethodBind
bindGeneric6DOFJoint_get_param_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_param_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the x-axis.
--   			The lower, the longer an impulse from one side takes to travel to the other side.
get_param_x ::
              (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_param_x
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_param_y #-}

-- | The amount of rotational damping across the y-axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_set_param_y :: MethodBind
bindGeneric6DOFJoint_set_param_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_param_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the y-axis. The lower, the more dampening occurs.
set_param_y ::
              (Generic6DOFJoint :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO ()
set_param_y cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_param_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_param_y #-}

-- | The amount of rotational damping across the y-axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_get_param_y :: MethodBind
bindGeneric6DOFJoint_get_param_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_param_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the y-axis. The lower, the more dampening occurs.
get_param_y ::
              (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_param_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_param_z #-}

-- | The amount of rotational damping across the z-axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_set_param_z :: MethodBind
bindGeneric6DOFJoint_set_param_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_param_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the z-axis. The lower, the more dampening occurs.
set_param_z ::
              (Generic6DOFJoint :< cls, Object :< cls) =>
              cls -> Int -> Float -> IO ()
set_param_z cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_param_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_param_z #-}

-- | The amount of rotational damping across the z-axis. The lower, the more dampening occurs.
bindGeneric6DOFJoint_get_param_z :: MethodBind
bindGeneric6DOFJoint_get_param_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_param_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of rotational damping across the z-axis. The lower, the more dampening occurs.
get_param_z ::
              (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_param_z
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_flag_x #-}

-- | If [code]true[/code], rotation across the x-axis is limited.
bindGeneric6DOFJoint_set_flag_x :: MethodBind
bindGeneric6DOFJoint_set_flag_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_flag_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rotation across the x-axis is limited.
set_flag_x ::
             (Generic6DOFJoint :< cls, Object :< cls) =>
             cls -> Int -> Bool -> IO ()
set_flag_x cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_flag_x (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_flag_x #-}

-- | If [code]true[/code], rotation across the x-axis is limited.
bindGeneric6DOFJoint_get_flag_x :: MethodBind
bindGeneric6DOFJoint_get_flag_x
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_flag_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rotation across the x-axis is limited.
get_flag_x ::
             (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_flag_x (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_flag_y #-}

-- | If [code]true[/code], rotation across the y-axis is limited.
bindGeneric6DOFJoint_set_flag_y :: MethodBind
bindGeneric6DOFJoint_set_flag_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_flag_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rotation across the y-axis is limited.
set_flag_y ::
             (Generic6DOFJoint :< cls, Object :< cls) =>
             cls -> Int -> Bool -> IO ()
set_flag_y cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_flag_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_flag_y #-}

-- | If [code]true[/code], rotation across the y-axis is limited.
bindGeneric6DOFJoint_get_flag_y :: MethodBind
bindGeneric6DOFJoint_get_flag_y
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_flag_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rotation across the y-axis is limited.
get_flag_y ::
             (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_flag_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_flag_z #-}

-- | If [code]true[/code], rotation across the z-axis is limited.
bindGeneric6DOFJoint_set_flag_z :: MethodBind
bindGeneric6DOFJoint_set_flag_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_flag_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rotation across the z-axis is limited.
set_flag_z ::
             (Generic6DOFJoint :< cls, Object :< cls) =>
             cls -> Int -> Bool -> IO ()
set_flag_z cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_flag_z (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_flag_z #-}

-- | If [code]true[/code], rotation across the z-axis is limited.
bindGeneric6DOFJoint_get_flag_z :: MethodBind
bindGeneric6DOFJoint_get_flag_z
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_flag_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rotation across the z-axis is limited.
get_flag_z ::
             (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_flag_z (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_set_precision #-}

bindGeneric6DOFJoint_set_precision :: MethodBind
bindGeneric6DOFJoint_set_precision
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "set_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_precision ::
                (Generic6DOFJoint :< cls, Object :< cls) => cls -> Int -> IO ()
set_precision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_set_precision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeneric6DOFJoint_get_precision #-}

bindGeneric6DOFJoint_get_precision :: MethodBind
bindGeneric6DOFJoint_get_precision
  = unsafePerformIO $
      withCString "Generic6DOFJoint" $
        \ clsNamePtr ->
          withCString "get_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_precision ::
                (Generic6DOFJoint :< cls, Object :< cls) => cls -> IO Int
get_precision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeneric6DOFJoint_get_precision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)