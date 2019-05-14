{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeScalarFunc
       (Godot.Core.VisualShaderNodeScalarFunc._FUNC_TAN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SQRT,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ATAN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_COS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ASIN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_EXP,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ACOS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_FRAC,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SIGN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_TANH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_CEIL,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_LOG,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SINH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_NEGATE,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SIN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SATURATE,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ROUND,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_COSH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ABS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_FLOOR,
        Godot.Core.VisualShaderNodeScalarFunc.set_function,
        Godot.Core.VisualShaderNodeScalarFunc.get_function)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FUNC_TAN :: Int
_FUNC_TAN = 2

_FUNC_SQRT :: Int
_FUNC_SQRT = 11

_FUNC_ATAN :: Int
_FUNC_ATAN = 5

_FUNC_COS :: Int
_FUNC_COS = 1

_FUNC_ASIN :: Int
_FUNC_ASIN = 3

_FUNC_EXP :: Int
_FUNC_EXP = 10

_FUNC_ACOS :: Int
_FUNC_ACOS = 4

_FUNC_FRAC :: Int
_FUNC_FRAC = 17

_FUNC_SIGN :: Int
_FUNC_SIGN = 13

_FUNC_TANH :: Int
_FUNC_TANH = 8

_FUNC_CEIL :: Int
_FUNC_CEIL = 16

_FUNC_LOG :: Int
_FUNC_LOG = 9

_FUNC_SINH :: Int
_FUNC_SINH = 6

_FUNC_NEGATE :: Int
_FUNC_NEGATE = 19

_FUNC_SIN :: Int
_FUNC_SIN = 0

_FUNC_SATURATE :: Int
_FUNC_SATURATE = 18

_FUNC_ROUND :: Int
_FUNC_ROUND = 15

_FUNC_COSH :: Int
_FUNC_COSH = 7

_FUNC_ABS :: Int
_FUNC_ABS = 12

_FUNC_FLOOR :: Int
_FUNC_FLOOR = 14

{-# NOINLINE bindVisualShaderNodeScalarFunc_set_function #-}

bindVisualShaderNodeScalarFunc_set_function :: MethodBind
bindVisualShaderNodeScalarFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function ::
               (VisualShaderNodeScalarFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeScalarFunc_get_function #-}

bindVisualShaderNodeScalarFunc_get_function :: MethodBind
bindVisualShaderNodeScalarFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function ::
               (VisualShaderNodeScalarFunc :< cls, Object :< cls) => cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)