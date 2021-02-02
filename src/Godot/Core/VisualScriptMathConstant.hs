{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptMathConstant
       (Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_INF,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_MAX,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_HALF_PI,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_TAU,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_NAN,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_PI,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_ONE,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_SQRT2,
        Godot.Core.VisualScriptMathConstant._MATH_CONSTANT_E,
        Godot.Core.VisualScriptMathConstant.get_math_constant,
        Godot.Core.VisualScriptMathConstant.set_math_constant)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MATH_CONSTANT_INF :: Int
_MATH_CONSTANT_INF = 6

_MATH_CONSTANT_MAX :: Int
_MATH_CONSTANT_MAX = 8

_MATH_CONSTANT_HALF_PI :: Int
_MATH_CONSTANT_HALF_PI = 2

_MATH_CONSTANT_TAU :: Int
_MATH_CONSTANT_TAU = 3

_MATH_CONSTANT_NAN :: Int
_MATH_CONSTANT_NAN = 7

_MATH_CONSTANT_PI :: Int
_MATH_CONSTANT_PI = 1

_MATH_CONSTANT_ONE :: Int
_MATH_CONSTANT_ONE = 0

_MATH_CONSTANT_SQRT2 :: Int
_MATH_CONSTANT_SQRT2 = 5

_MATH_CONSTANT_E :: Int
_MATH_CONSTANT_E = 4

{-# NOINLINE bindVisualScriptMathConstant_get_math_constant #-}

bindVisualScriptMathConstant_get_math_constant :: MethodBind
bindVisualScriptMathConstant_get_math_constant
  = unsafePerformIO $
      withCString "VisualScriptMathConstant" $
        \ clsNamePtr ->
          withCString "get_math_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_math_constant ::
                    (VisualScriptMathConstant :< cls, Object :< cls) => cls -> IO Int
get_math_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptMathConstant_get_math_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptMathConstant_set_math_constant #-}

bindVisualScriptMathConstant_set_math_constant :: MethodBind
bindVisualScriptMathConstant_set_math_constant
  = unsafePerformIO $
      withCString "VisualScriptMathConstant" $
        \ clsNamePtr ->
          withCString "set_math_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_math_constant ::
                    (VisualScriptMathConstant :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
set_math_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptMathConstant_set_math_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)