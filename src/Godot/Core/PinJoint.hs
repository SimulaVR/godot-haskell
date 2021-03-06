{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PinJoint
       (Godot.Core.PinJoint._PARAM_IMPULSE_CLAMP,
        Godot.Core.PinJoint._PARAM_DAMPING,
        Godot.Core.PinJoint._PARAM_BIAS, Godot.Core.PinJoint.get_param,
        Godot.Core.PinJoint.set_param)
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

_PARAM_IMPULSE_CLAMP :: Int
_PARAM_IMPULSE_CLAMP = 2

_PARAM_DAMPING :: Int
_PARAM_DAMPING = 1

_PARAM_BIAS :: Int
_PARAM_BIAS = 0

instance NodeProperty PinJoint "params/bias" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_param, wrapIndexedSetter 0 set_param,
             Nothing)

instance NodeProperty PinJoint "params/damping" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_param, wrapIndexedSetter 1 set_param,
             Nothing)

instance NodeProperty PinJoint "params/impulse_clamp" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param, wrapIndexedSetter 2 set_param,
             Nothing)

{-# NOINLINE bindPinJoint_get_param #-}

-- | Returns the value of the specified parameter.
bindPinJoint_get_param :: MethodBind
bindPinJoint_get_param
  = unsafePerformIO $
      withCString "PinJoint" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the specified parameter.
get_param ::
            (PinJoint :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPinJoint_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PinJoint "get_param" '[Int] (IO Float) where
        nodeMethod = Godot.Core.PinJoint.get_param

{-# NOINLINE bindPinJoint_set_param #-}

-- | Sets the value of the specified parameter.
bindPinJoint_set_param :: MethodBind
bindPinJoint_set_param
  = unsafePerformIO $
      withCString "PinJoint" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of the specified parameter.
set_param ::
            (PinJoint :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPinJoint_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PinJoint "set_param" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.PinJoint.set_param