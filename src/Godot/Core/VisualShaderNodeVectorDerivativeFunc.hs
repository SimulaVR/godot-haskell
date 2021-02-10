{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeVectorDerivativeFunc
       (Godot.Core.VisualShaderNodeVectorDerivativeFunc._FUNC_SUM,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc._FUNC_Y,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc._FUNC_X,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc.get_function,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc.set_function)
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

{-# NOINLINE bindVisualShaderNodeVectorDerivativeFunc_get_function
             #-}

-- | A derivative type. See [enum Function] for options.
bindVisualShaderNodeVectorDerivativeFunc_get_function :: MethodBind
bindVisualShaderNodeVectorDerivativeFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorDerivativeFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A derivative type. See [enum Function] for options.
get_function ::
               (VisualShaderNodeVectorDerivativeFunc :< cls, Object :< cls) =>
               cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVectorDerivativeFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeVectorDerivativeFunc_set_function
             #-}

-- | A derivative type. See [enum Function] for options.
bindVisualShaderNodeVectorDerivativeFunc_set_function :: MethodBind
bindVisualShaderNodeVectorDerivativeFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorDerivativeFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A derivative type. See [enum Function] for options.
set_function ::
               (VisualShaderNodeVectorDerivativeFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVectorDerivativeFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)