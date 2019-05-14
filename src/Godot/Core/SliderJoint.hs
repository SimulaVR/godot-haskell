{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SliderJoint
       (Godot.Core.SliderJoint._PARAM_ANGULAR_LIMIT_LOWER,
        Godot.Core.SliderJoint._PARAM_LINEAR_ORTHOGONAL_RESTITUTION,
        Godot.Core.SliderJoint._PARAM_ANGULAR_MOTION_DAMPING,
        Godot.Core.SliderJoint._PARAM_LINEAR_LIMIT_RESTITUTION,
        Godot.Core.SliderJoint._PARAM_LINEAR_MOTION_RESTITUTION,
        Godot.Core.SliderJoint._PARAM_ANGULAR_ORTHOGONAL_DAMPING,
        Godot.Core.SliderJoint._PARAM_ANGULAR_ORTHOGONAL_SOFTNESS,
        Godot.Core.SliderJoint._PARAM_LINEAR_ORTHOGONAL_SOFTNESS,
        Godot.Core.SliderJoint._PARAM_LINEAR_LIMIT_SOFTNESS,
        Godot.Core.SliderJoint._PARAM_ANGULAR_LIMIT_RESTITUTION,
        Godot.Core.SliderJoint._PARAM_LINEAR_LIMIT_LOWER,
        Godot.Core.SliderJoint._PARAM_LINEAR_MOTION_SOFTNESS,
        Godot.Core.SliderJoint._PARAM_MAX,
        Godot.Core.SliderJoint._PARAM_ANGULAR_LIMIT_DAMPING,
        Godot.Core.SliderJoint._PARAM_ANGULAR_LIMIT_SOFTNESS,
        Godot.Core.SliderJoint._PARAM_LINEAR_LIMIT_UPPER,
        Godot.Core.SliderJoint._PARAM_ANGULAR_LIMIT_UPPER,
        Godot.Core.SliderJoint._PARAM_LINEAR_LIMIT_DAMPING,
        Godot.Core.SliderJoint._PARAM_ANGULAR_MOTION_RESTITUTION,
        Godot.Core.SliderJoint._PARAM_LINEAR_ORTHOGONAL_DAMPING,
        Godot.Core.SliderJoint._PARAM_ANGULAR_ORTHOGONAL_RESTITUTION,
        Godot.Core.SliderJoint._PARAM_LINEAR_MOTION_DAMPING,
        Godot.Core.SliderJoint._PARAM_ANGULAR_MOTION_SOFTNESS,
        Godot.Core.SliderJoint.set_param, Godot.Core.SliderJoint.get_param,
        Godot.Core.SliderJoint._set_upper_limit_angular,
        Godot.Core.SliderJoint._get_upper_limit_angular,
        Godot.Core.SliderJoint._set_lower_limit_angular,
        Godot.Core.SliderJoint._get_lower_limit_angular)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PARAM_ANGULAR_LIMIT_LOWER :: Int
_PARAM_ANGULAR_LIMIT_LOWER = 12

_PARAM_LINEAR_ORTHOGONAL_RESTITUTION :: Int
_PARAM_LINEAR_ORTHOGONAL_RESTITUTION = 9

_PARAM_ANGULAR_MOTION_DAMPING :: Int
_PARAM_ANGULAR_MOTION_DAMPING = 18

_PARAM_LINEAR_LIMIT_RESTITUTION :: Int
_PARAM_LINEAR_LIMIT_RESTITUTION = 3

_PARAM_LINEAR_MOTION_RESTITUTION :: Int
_PARAM_LINEAR_MOTION_RESTITUTION = 6

_PARAM_ANGULAR_ORTHOGONAL_DAMPING :: Int
_PARAM_ANGULAR_ORTHOGONAL_DAMPING = 21

_PARAM_ANGULAR_ORTHOGONAL_SOFTNESS :: Int
_PARAM_ANGULAR_ORTHOGONAL_SOFTNESS = 19

_PARAM_LINEAR_ORTHOGONAL_SOFTNESS :: Int
_PARAM_LINEAR_ORTHOGONAL_SOFTNESS = 8

_PARAM_LINEAR_LIMIT_SOFTNESS :: Int
_PARAM_LINEAR_LIMIT_SOFTNESS = 2

_PARAM_ANGULAR_LIMIT_RESTITUTION :: Int
_PARAM_ANGULAR_LIMIT_RESTITUTION = 14

_PARAM_LINEAR_LIMIT_LOWER :: Int
_PARAM_LINEAR_LIMIT_LOWER = 1

_PARAM_LINEAR_MOTION_SOFTNESS :: Int
_PARAM_LINEAR_MOTION_SOFTNESS = 5

_PARAM_MAX :: Int
_PARAM_MAX = 22

_PARAM_ANGULAR_LIMIT_DAMPING :: Int
_PARAM_ANGULAR_LIMIT_DAMPING = 15

_PARAM_ANGULAR_LIMIT_SOFTNESS :: Int
_PARAM_ANGULAR_LIMIT_SOFTNESS = 13

_PARAM_LINEAR_LIMIT_UPPER :: Int
_PARAM_LINEAR_LIMIT_UPPER = 0

_PARAM_ANGULAR_LIMIT_UPPER :: Int
_PARAM_ANGULAR_LIMIT_UPPER = 11

_PARAM_LINEAR_LIMIT_DAMPING :: Int
_PARAM_LINEAR_LIMIT_DAMPING = 4

_PARAM_ANGULAR_MOTION_RESTITUTION :: Int
_PARAM_ANGULAR_MOTION_RESTITUTION = 17

_PARAM_LINEAR_ORTHOGONAL_DAMPING :: Int
_PARAM_LINEAR_ORTHOGONAL_DAMPING = 10

_PARAM_ANGULAR_ORTHOGONAL_RESTITUTION :: Int
_PARAM_ANGULAR_ORTHOGONAL_RESTITUTION = 20

_PARAM_LINEAR_MOTION_DAMPING :: Int
_PARAM_LINEAR_MOTION_DAMPING = 7

_PARAM_ANGULAR_MOTION_SOFTNESS :: Int
_PARAM_ANGULAR_MOTION_SOFTNESS = 16

{-# NOINLINE bindSliderJoint_set_param #-}

-- | The amount of damping of the rotation when the limit is surpassed.
--   			A lower damping value allows a rotation initiated by body A to travel to body B slower.
bindSliderJoint_set_param :: MethodBind
bindSliderJoint_set_param
  = unsafePerformIO $
      withCString "SliderJoint" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of damping of the rotation when the limit is surpassed.
--   			A lower damping value allows a rotation initiated by body A to travel to body B slower.
set_param ::
            (SliderJoint :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSliderJoint_set_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSliderJoint_get_param #-}

-- | The amount of damping of the rotation when the limit is surpassed.
--   			A lower damping value allows a rotation initiated by body A to travel to body B slower.
bindSliderJoint_get_param :: MethodBind
bindSliderJoint_get_param
  = unsafePerformIO $
      withCString "SliderJoint" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of damping of the rotation when the limit is surpassed.
--   			A lower damping value allows a rotation initiated by body A to travel to body B slower.
get_param ::
            (SliderJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSliderJoint_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSliderJoint__set_upper_limit_angular #-}

-- | The upper limit of rotation in the slider.
bindSliderJoint__set_upper_limit_angular :: MethodBind
bindSliderJoint__set_upper_limit_angular
  = unsafePerformIO $
      withCString "SliderJoint" $
        \ clsNamePtr ->
          withCString "_set_upper_limit_angular" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The upper limit of rotation in the slider.
_set_upper_limit_angular ::
                           (SliderJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_upper_limit_angular cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSliderJoint__set_upper_limit_angular
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSliderJoint__get_upper_limit_angular #-}

-- | The upper limit of rotation in the slider.
bindSliderJoint__get_upper_limit_angular :: MethodBind
bindSliderJoint__get_upper_limit_angular
  = unsafePerformIO $
      withCString "SliderJoint" $
        \ clsNamePtr ->
          withCString "_get_upper_limit_angular" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The upper limit of rotation in the slider.
_get_upper_limit_angular ::
                           (SliderJoint :< cls, Object :< cls) => cls -> IO Float
_get_upper_limit_angular cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSliderJoint__get_upper_limit_angular
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSliderJoint__set_lower_limit_angular #-}

-- | The lower limit of rotation in the slider.
bindSliderJoint__set_lower_limit_angular :: MethodBind
bindSliderJoint__set_lower_limit_angular
  = unsafePerformIO $
      withCString "SliderJoint" $
        \ clsNamePtr ->
          withCString "_set_lower_limit_angular" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lower limit of rotation in the slider.
_set_lower_limit_angular ::
                           (SliderJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_lower_limit_angular cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSliderJoint__set_lower_limit_angular
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSliderJoint__get_lower_limit_angular #-}

-- | The lower limit of rotation in the slider.
bindSliderJoint__get_lower_limit_angular :: MethodBind
bindSliderJoint__get_lower_limit_angular
  = unsafePerformIO $
      withCString "SliderJoint" $
        \ clsNamePtr ->
          withCString "_get_lower_limit_angular" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lower limit of rotation in the slider.
_get_lower_limit_angular ::
                           (SliderJoint :< cls, Object :< cls) => cls -> IO Float
_get_lower_limit_angular cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSliderJoint__get_lower_limit_angular
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)