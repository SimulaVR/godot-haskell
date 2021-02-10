{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConeTwistJoint
       (Godot.Core.ConeTwistJoint._PARAM_SWING_SPAN,
        Godot.Core.ConeTwistJoint._PARAM_SOFTNESS,
        Godot.Core.ConeTwistJoint._PARAM_TWIST_SPAN,
        Godot.Core.ConeTwistJoint._PARAM_MAX,
        Godot.Core.ConeTwistJoint._PARAM_RELAXATION,
        Godot.Core.ConeTwistJoint._PARAM_BIAS,
        Godot.Core.ConeTwistJoint._get_swing_span,
        Godot.Core.ConeTwistJoint._get_twist_span,
        Godot.Core.ConeTwistJoint._set_swing_span,
        Godot.Core.ConeTwistJoint._set_twist_span,
        Godot.Core.ConeTwistJoint.get_param,
        Godot.Core.ConeTwistJoint.set_param)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PARAM_SWING_SPAN :: Int
_PARAM_SWING_SPAN = 0

_PARAM_SOFTNESS :: Int
_PARAM_SOFTNESS = 3

_PARAM_TWIST_SPAN :: Int
_PARAM_TWIST_SPAN = 1

_PARAM_MAX :: Int
_PARAM_MAX = 5

_PARAM_RELAXATION :: Int
_PARAM_RELAXATION = 4

_PARAM_BIAS :: Int
_PARAM_BIAS = 2

{-# NOINLINE bindConeTwistJoint__get_swing_span #-}

-- | Swing is rotation from side to side, around the axis perpendicular to the twist axis.
--   			The swing span defines, how much rotation will not get corrected along the swing axis.
--   			Could be defined as looseness in the [ConeTwistJoint].
--   			If below 0.05, this behavior is locked.
bindConeTwistJoint__get_swing_span :: MethodBind
bindConeTwistJoint__get_swing_span
  = unsafePerformIO $
      withCString "ConeTwistJoint" $
        \ clsNamePtr ->
          withCString "_get_swing_span" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Swing is rotation from side to side, around the axis perpendicular to the twist axis.
--   			The swing span defines, how much rotation will not get corrected along the swing axis.
--   			Could be defined as looseness in the [ConeTwistJoint].
--   			If below 0.05, this behavior is locked.
_get_swing_span ::
                  (ConeTwistJoint :< cls, Object :< cls) => cls -> IO Float
_get_swing_span cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConeTwistJoint__get_swing_span
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConeTwistJoint__get_twist_span #-}

-- | Twist is the rotation around the twist axis, this value defined how far the joint can twist.
--   			Twist is locked if below 0.05.
bindConeTwistJoint__get_twist_span :: MethodBind
bindConeTwistJoint__get_twist_span
  = unsafePerformIO $
      withCString "ConeTwistJoint" $
        \ clsNamePtr ->
          withCString "_get_twist_span" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Twist is the rotation around the twist axis, this value defined how far the joint can twist.
--   			Twist is locked if below 0.05.
_get_twist_span ::
                  (ConeTwistJoint :< cls, Object :< cls) => cls -> IO Float
_get_twist_span cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConeTwistJoint__get_twist_span
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConeTwistJoint__set_swing_span #-}

-- | Swing is rotation from side to side, around the axis perpendicular to the twist axis.
--   			The swing span defines, how much rotation will not get corrected along the swing axis.
--   			Could be defined as looseness in the [ConeTwistJoint].
--   			If below 0.05, this behavior is locked.
bindConeTwistJoint__set_swing_span :: MethodBind
bindConeTwistJoint__set_swing_span
  = unsafePerformIO $
      withCString "ConeTwistJoint" $
        \ clsNamePtr ->
          withCString "_set_swing_span" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Swing is rotation from side to side, around the axis perpendicular to the twist axis.
--   			The swing span defines, how much rotation will not get corrected along the swing axis.
--   			Could be defined as looseness in the [ConeTwistJoint].
--   			If below 0.05, this behavior is locked.
_set_swing_span ::
                  (ConeTwistJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_swing_span cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConeTwistJoint__set_swing_span
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConeTwistJoint__set_twist_span #-}

-- | Twist is the rotation around the twist axis, this value defined how far the joint can twist.
--   			Twist is locked if below 0.05.
bindConeTwistJoint__set_twist_span :: MethodBind
bindConeTwistJoint__set_twist_span
  = unsafePerformIO $
      withCString "ConeTwistJoint" $
        \ clsNamePtr ->
          withCString "_set_twist_span" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Twist is the rotation around the twist axis, this value defined how far the joint can twist.
--   			Twist is locked if below 0.05.
_set_twist_span ::
                  (ConeTwistJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_twist_span cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConeTwistJoint__set_twist_span
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConeTwistJoint_get_param #-}

-- | The speed with which the swing or twist will take place.
--   			The higher, the faster.
bindConeTwistJoint_get_param :: MethodBind
bindConeTwistJoint_get_param
  = unsafePerformIO $
      withCString "ConeTwistJoint" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed with which the swing or twist will take place.
--   			The higher, the faster.
get_param ::
            (ConeTwistJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConeTwistJoint_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConeTwistJoint_set_param #-}

-- | The speed with which the swing or twist will take place.
--   			The higher, the faster.
bindConeTwistJoint_set_param :: MethodBind
bindConeTwistJoint_set_param
  = unsafePerformIO $
      withCString "ConeTwistJoint" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed with which the swing or twist will take place.
--   			The higher, the faster.
set_param ::
            (ConeTwistJoint :< cls, Object :< cls) =>
            cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConeTwistJoint_set_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)