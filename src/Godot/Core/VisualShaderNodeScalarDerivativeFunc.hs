{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeScalarDerivativeFunc
       (Godot.Core.VisualShaderNodeScalarDerivativeFunc._FUNC_SUM,
        Godot.Core.VisualShaderNodeScalarDerivativeFunc._FUNC_Y,
        Godot.Core.VisualShaderNodeScalarDerivativeFunc._FUNC_X,
        Godot.Core.VisualShaderNodeScalarDerivativeFunc.get_function,
        Godot.Core.VisualShaderNodeScalarDerivativeFunc.set_function)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FUNC_SUM :: Int
_FUNC_SUM = 0

_FUNC_Y :: Int
_FUNC_Y = 2

_FUNC_X :: Int
_FUNC_X = 1

{-# NOINLINE bindVisualShaderNodeScalarDerivativeFunc_get_function
             #-}

-- | The derivative type. See [enum Function] for options.
bindVisualShaderNodeScalarDerivativeFunc_get_function :: MethodBind
bindVisualShaderNodeScalarDerivativeFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarDerivativeFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The derivative type. See [enum Function] for options.
get_function ::
               (VisualShaderNodeScalarDerivativeFunc :< cls, Object :< cls) =>
               cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarDerivativeFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeScalarDerivativeFunc_set_function
             #-}

-- | The derivative type. See [enum Function] for options.
bindVisualShaderNodeScalarDerivativeFunc_set_function :: MethodBind
bindVisualShaderNodeScalarDerivativeFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarDerivativeFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The derivative type. See [enum Function] for options.
set_function ::
               (VisualShaderNodeScalarDerivativeFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarDerivativeFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)