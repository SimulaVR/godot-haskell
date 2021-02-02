{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.HingeJoint
       (Godot.Core.HingeJoint._PARAM_MOTOR_MAX_IMPULSE,
        Godot.Core.HingeJoint._FLAG_USE_LIMIT,
        Godot.Core.HingeJoint._PARAM_LIMIT_RELAXATION,
        Godot.Core.HingeJoint._PARAM_LIMIT_UPPER,
        Godot.Core.HingeJoint._PARAM_LIMIT_BIAS,
        Godot.Core.HingeJoint._PARAM_MAX, Godot.Core.HingeJoint._FLAG_MAX,
        Godot.Core.HingeJoint._PARAM_LIMIT_SOFTNESS,
        Godot.Core.HingeJoint._PARAM_MOTOR_TARGET_VELOCITY,
        Godot.Core.HingeJoint._FLAG_ENABLE_MOTOR,
        Godot.Core.HingeJoint._PARAM_LIMIT_LOWER,
        Godot.Core.HingeJoint._PARAM_BIAS,
        Godot.Core.HingeJoint._get_lower_limit,
        Godot.Core.HingeJoint._get_upper_limit,
        Godot.Core.HingeJoint._set_lower_limit,
        Godot.Core.HingeJoint._set_upper_limit,
        Godot.Core.HingeJoint.get_flag, Godot.Core.HingeJoint.get_param,
        Godot.Core.HingeJoint.set_flag, Godot.Core.HingeJoint.set_param)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PARAM_MOTOR_MAX_IMPULSE :: Int
_PARAM_MOTOR_MAX_IMPULSE = 7

_FLAG_USE_LIMIT :: Int
_FLAG_USE_LIMIT = 0

_PARAM_LIMIT_RELAXATION :: Int
_PARAM_LIMIT_RELAXATION = 5

_PARAM_LIMIT_UPPER :: Int
_PARAM_LIMIT_UPPER = 1

_PARAM_LIMIT_BIAS :: Int
_PARAM_LIMIT_BIAS = 3

_PARAM_MAX :: Int
_PARAM_MAX = 8

_FLAG_MAX :: Int
_FLAG_MAX = 2

_PARAM_LIMIT_SOFTNESS :: Int
_PARAM_LIMIT_SOFTNESS = 4

_PARAM_MOTOR_TARGET_VELOCITY :: Int
_PARAM_MOTOR_TARGET_VELOCITY = 6

_FLAG_ENABLE_MOTOR :: Int
_FLAG_ENABLE_MOTOR = 1

_PARAM_LIMIT_LOWER :: Int
_PARAM_LIMIT_LOWER = 2

_PARAM_BIAS :: Int
_PARAM_BIAS = 0

{-# NOINLINE bindHingeJoint__get_lower_limit #-}

-- | The minimum rotation. only active if [member angular_limit/enable] is [code]true[/code].
bindHingeJoint__get_lower_limit :: MethodBind
bindHingeJoint__get_lower_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_get_lower_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation. only active if [member angular_limit/enable] is [code]true[/code].
_get_lower_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> IO Float
_get_lower_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__get_lower_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint__get_upper_limit #-}

-- | The maximum rotation. only active if [member angular_limit/enable] is [code]true[/code].
bindHingeJoint__get_upper_limit :: MethodBind
bindHingeJoint__get_upper_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_get_upper_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum rotation. only active if [member angular_limit/enable] is [code]true[/code].
_get_upper_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> IO Float
_get_upper_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__get_upper_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint__set_lower_limit #-}

-- | The minimum rotation. only active if [member angular_limit/enable] is [code]true[/code].
bindHingeJoint__set_lower_limit :: MethodBind
bindHingeJoint__set_lower_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_set_lower_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation. only active if [member angular_limit/enable] is [code]true[/code].
_set_lower_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_lower_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__set_lower_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint__set_upper_limit #-}

-- | The maximum rotation. only active if [member angular_limit/enable] is [code]true[/code].
bindHingeJoint__set_upper_limit :: MethodBind
bindHingeJoint__set_upper_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_set_upper_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum rotation. only active if [member angular_limit/enable] is [code]true[/code].
_set_upper_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_upper_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__set_upper_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint_get_flag #-}

-- | If [code]true[/code], the hinges maximum and minimum rotation, defined by [member angular_limit/lower] and [member angular_limit/upper] has effects.
bindHingeJoint_get_flag :: MethodBind
bindHingeJoint_get_flag
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the hinges maximum and minimum rotation, defined by [member angular_limit/lower] and [member angular_limit/upper] has effects.
get_flag ::
           (HingeJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint_get_flag (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint_get_param #-}

-- | The speed with which the rotation across the axis perpendicular to the hinge gets corrected.
bindHingeJoint_get_param :: MethodBind
bindHingeJoint_get_param
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed with which the rotation across the axis perpendicular to the hinge gets corrected.
get_param ::
            (HingeJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint_set_flag #-}

-- | If [code]true[/code], the hinges maximum and minimum rotation, defined by [member angular_limit/lower] and [member angular_limit/upper] has effects.
bindHingeJoint_set_flag :: MethodBind
bindHingeJoint_set_flag
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the hinges maximum and minimum rotation, defined by [member angular_limit/lower] and [member angular_limit/upper] has effects.
set_flag ::
           (HingeJoint :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint_set_flag (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHingeJoint_set_param #-}

-- | The speed with which the rotation across the axis perpendicular to the hinge gets corrected.
bindHingeJoint_set_param :: MethodBind
bindHingeJoint_set_param
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed with which the rotation across the axis perpendicular to the hinge gets corrected.
set_param ::
            (HingeJoint :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)