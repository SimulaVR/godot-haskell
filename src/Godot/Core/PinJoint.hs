{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PinJoint
       (Godot.Core.PinJoint._PARAM_IMPULSE_CLAMP,
        Godot.Core.PinJoint._PARAM_DAMPING,
        Godot.Core.PinJoint._PARAM_BIAS, Godot.Core.PinJoint.set_param,
        Godot.Core.PinJoint.get_param)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PARAM_IMPULSE_CLAMP :: Int
_PARAM_IMPULSE_CLAMP = 2

_PARAM_DAMPING :: Int
_PARAM_DAMPING = 1

_PARAM_BIAS :: Int
_PARAM_BIAS = 0

{-# NOINLINE bindPinJoint_set_param #-}

-- | The force with which the pinned objects stay in positional relation to each other.
--   			The higher, the stronger.
bindPinJoint_set_param :: MethodBind
bindPinJoint_set_param
  = unsafePerformIO $
      withCString "PinJoint" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The force with which the pinned objects stay in positional relation to each other.
--   			The higher, the stronger.
set_param ::
            (PinJoint :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPinJoint_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPinJoint_get_param #-}

-- | The force with which the pinned objects stay in positional relation to each other.
--   			The higher, the stronger.
bindPinJoint_get_param :: MethodBind
bindPinJoint_get_param
  = unsafePerformIO $
      withCString "PinJoint" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The force with which the pinned objects stay in positional relation to each other.
--   			The higher, the stronger.
get_param ::
            (PinJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPinJoint_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)