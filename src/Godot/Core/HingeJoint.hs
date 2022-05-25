{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.HingeJoint
       (Godot.Core.HingeJoint._PARAM_LIMIT_SOFTNESS,
        Godot.Core.HingeJoint._PARAM_MAX,
        Godot.Core.HingeJoint._FLAG_USE_LIMIT,
        Godot.Core.HingeJoint._FLAG_ENABLE_MOTOR,
        Godot.Core.HingeJoint._FLAG_MAX,
        Godot.Core.HingeJoint._PARAM_LIMIT_LOWER,
        Godot.Core.HingeJoint._PARAM_LIMIT_RELAXATION,
        Godot.Core.HingeJoint._PARAM_MOTOR_MAX_IMPULSE,
        Godot.Core.HingeJoint._PARAM_LIMIT_BIAS,
        Godot.Core.HingeJoint._PARAM_BIAS,
        Godot.Core.HingeJoint._PARAM_MOTOR_TARGET_VELOCITY,
        Godot.Core.HingeJoint._PARAM_LIMIT_UPPER,
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Joint()

_PARAM_LIMIT_SOFTNESS :: Int
_PARAM_LIMIT_SOFTNESS = 4

_PARAM_MAX :: Int
_PARAM_MAX = 8

_FLAG_USE_LIMIT :: Int
_FLAG_USE_LIMIT = 0

_FLAG_ENABLE_MOTOR :: Int
_FLAG_ENABLE_MOTOR = 1

_FLAG_MAX :: Int
_FLAG_MAX = 2

_PARAM_LIMIT_LOWER :: Int
_PARAM_LIMIT_LOWER = 2

_PARAM_LIMIT_RELAXATION :: Int
_PARAM_LIMIT_RELAXATION = 5

_PARAM_MOTOR_MAX_IMPULSE :: Int
_PARAM_MOTOR_MAX_IMPULSE = 7

_PARAM_LIMIT_BIAS :: Int
_PARAM_LIMIT_BIAS = 3

_PARAM_BIAS :: Int
_PARAM_BIAS = 0

_PARAM_MOTOR_TARGET_VELOCITY :: Int
_PARAM_MOTOR_TARGET_VELOCITY = 6

_PARAM_LIMIT_UPPER :: Int
_PARAM_LIMIT_UPPER = 1

instance NodeProperty HingeJoint "angular_limit/bias" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param, wrapIndexedSetter 3 set_param,
             Nothing)

instance NodeProperty HingeJoint "angular_limit/enable" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag, wrapIndexedSetter 0 set_flag,
             Nothing)

instance NodeProperty HingeJoint "angular_limit/lower" Float 'False
         where
        nodeProperty
          = (_get_lower_limit, wrapDroppingSetter _set_lower_limit, Nothing)

instance NodeProperty HingeJoint "angular_limit/relaxation" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param, wrapIndexedSetter 5 set_param,
             Nothing)

instance NodeProperty HingeJoint "angular_limit/softness" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param, wrapIndexedSetter 4 set_param,
             Nothing)

instance NodeProperty HingeJoint "angular_limit/upper" Float 'False
         where
        nodeProperty
          = (_get_upper_limit, wrapDroppingSetter _set_upper_limit, Nothing)

instance NodeProperty HingeJoint "motor/enable" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_flag, wrapIndexedSetter 1 set_flag,
             Nothing)

instance NodeProperty HingeJoint "motor/max_impulse" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_param, wrapIndexedSetter 7 set_param,
             Nothing)

instance NodeProperty HingeJoint "motor/target_velocity" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param, wrapIndexedSetter 6 set_param,
             Nothing)

instance NodeProperty HingeJoint "params/bias" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_param, wrapIndexedSetter 0 set_param,
             Nothing)

{-# NOINLINE bindHingeJoint__get_lower_limit #-}

-- | The minimum rotation. Only active if @angular_limit/enable@ is @true@.
bindHingeJoint__get_lower_limit :: MethodBind
bindHingeJoint__get_lower_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_get_lower_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation. Only active if @angular_limit/enable@ is @true@.
_get_lower_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> IO Float
_get_lower_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__get_lower_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HingeJoint "_get_lower_limit" '[] (IO Float)
         where
        nodeMethod = Godot.Core.HingeJoint._get_lower_limit

{-# NOINLINE bindHingeJoint__get_upper_limit #-}

-- | The maximum rotation. Only active if @angular_limit/enable@ is @true@.
bindHingeJoint__get_upper_limit :: MethodBind
bindHingeJoint__get_upper_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_get_upper_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum rotation. Only active if @angular_limit/enable@ is @true@.
_get_upper_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> IO Float
_get_upper_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__get_upper_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HingeJoint "_get_upper_limit" '[] (IO Float)
         where
        nodeMethod = Godot.Core.HingeJoint._get_upper_limit

{-# NOINLINE bindHingeJoint__set_lower_limit #-}

-- | The minimum rotation. Only active if @angular_limit/enable@ is @true@.
bindHingeJoint__set_lower_limit :: MethodBind
bindHingeJoint__set_lower_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_set_lower_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum rotation. Only active if @angular_limit/enable@ is @true@.
_set_lower_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_lower_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__set_lower_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HingeJoint "_set_lower_limit" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.HingeJoint._set_lower_limit

{-# NOINLINE bindHingeJoint__set_upper_limit #-}

-- | The maximum rotation. Only active if @angular_limit/enable@ is @true@.
bindHingeJoint__set_upper_limit :: MethodBind
bindHingeJoint__set_upper_limit
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "_set_upper_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum rotation. Only active if @angular_limit/enable@ is @true@.
_set_upper_limit ::
                   (HingeJoint :< cls, Object :< cls) => cls -> Float -> IO ()
_set_upper_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint__set_upper_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HingeJoint "_set_upper_limit" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.HingeJoint._set_upper_limit

{-# NOINLINE bindHingeJoint_get_flag #-}

-- | If @true@, the hinges maximum and minimum rotation, defined by @angular_limit/lower@ and @angular_limit/upper@ has effects.
bindHingeJoint_get_flag :: MethodBind
bindHingeJoint_get_flag
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the hinges maximum and minimum rotation, defined by @angular_limit/lower@ and @angular_limit/upper@ has effects.
get_flag ::
           (HingeJoint :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint_get_flag (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HingeJoint "get_flag" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.HingeJoint.get_flag

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

instance NodeMethod HingeJoint "get_param" '[Int] (IO Float) where
        nodeMethod = Godot.Core.HingeJoint.get_param

{-# NOINLINE bindHingeJoint_set_flag #-}

-- | If @true@, the hinges maximum and minimum rotation, defined by @angular_limit/lower@ and @angular_limit/upper@ has effects.
bindHingeJoint_set_flag :: MethodBind
bindHingeJoint_set_flag
  = unsafePerformIO $
      withCString "HingeJoint" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the hinges maximum and minimum rotation, defined by @angular_limit/lower@ and @angular_limit/upper@ has effects.
set_flag ::
           (HingeJoint :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHingeJoint_set_flag (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HingeJoint "set_flag" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.HingeJoint.set_flag

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

instance NodeMethod HingeJoint "set_param" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.HingeJoint.set_param