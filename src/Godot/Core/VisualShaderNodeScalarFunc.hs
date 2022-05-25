{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeScalarFunc
       (Godot.Core.VisualShaderNodeScalarFunc._FUNC_TANH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SIGN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ASIN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_RECIPROCAL,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SINH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_LOG2,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_LOG,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_INVERSE_SQRT,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SIN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ACOSH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_EXP,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_COSH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_EXP2,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ROUND,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_DEGREES,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_RADIANS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_CEIL,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_TRUNC,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ROUNDEVEN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ASINH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ATANH,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_TAN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_FRAC,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ACOS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_COS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SATURATE,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_FLOOR,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_NEGATE,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ATAN,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ABS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_ONEMINUS,
        Godot.Core.VisualShaderNodeScalarFunc._FUNC_SQRT,
        Godot.Core.VisualShaderNodeScalarFunc.get_function,
        Godot.Core.VisualShaderNodeScalarFunc.set_function)
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
import Godot.Core.VisualShaderNode()

_FUNC_TANH :: Int
_FUNC_TANH = 8

_FUNC_SIGN :: Int
_FUNC_SIGN = 13

_FUNC_ASIN :: Int
_FUNC_ASIN = 3

_FUNC_RECIPROCAL :: Int
_FUNC_RECIPROCAL = 28

_FUNC_SINH :: Int
_FUNC_SINH = 6

_FUNC_LOG2 :: Int
_FUNC_LOG2 = 26

_FUNC_LOG :: Int
_FUNC_LOG = 9

_FUNC_INVERSE_SQRT :: Int
_FUNC_INVERSE_SQRT = 25

_FUNC_SIN :: Int
_FUNC_SIN = 0

_FUNC_ACOSH :: Int
_FUNC_ACOSH = 20

_FUNC_EXP :: Int
_FUNC_EXP = 10

_FUNC_COSH :: Int
_FUNC_COSH = 7

_FUNC_EXP2 :: Int
_FUNC_EXP2 = 24

_FUNC_ROUND :: Int
_FUNC_ROUND = 15

_FUNC_DEGREES :: Int
_FUNC_DEGREES = 23

_FUNC_RADIANS :: Int
_FUNC_RADIANS = 27

_FUNC_CEIL :: Int
_FUNC_CEIL = 16

_FUNC_TRUNC :: Int
_FUNC_TRUNC = 30

_FUNC_ROUNDEVEN :: Int
_FUNC_ROUNDEVEN = 29

_FUNC_ASINH :: Int
_FUNC_ASINH = 21

_FUNC_ATANH :: Int
_FUNC_ATANH = 22

_FUNC_TAN :: Int
_FUNC_TAN = 2

_FUNC_FRAC :: Int
_FUNC_FRAC = 17

_FUNC_ACOS :: Int
_FUNC_ACOS = 4

_FUNC_COS :: Int
_FUNC_COS = 1

_FUNC_SATURATE :: Int
_FUNC_SATURATE = 18

_FUNC_FLOOR :: Int
_FUNC_FLOOR = 14

_FUNC_NEGATE :: Int
_FUNC_NEGATE = 19

_FUNC_ATAN :: Int
_FUNC_ATAN = 5

_FUNC_ABS :: Int
_FUNC_ABS = 12

_FUNC_ONEMINUS :: Int
_FUNC_ONEMINUS = 31

_FUNC_SQRT :: Int
_FUNC_SQRT = 11

instance NodeProperty VisualShaderNodeScalarFunc "function" Int
           'False
         where
        nodeProperty
          = (get_function, wrapDroppingSetter set_function, Nothing)

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

instance NodeMethod VisualShaderNodeScalarFunc "get_function" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarFunc.get_function

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

instance NodeMethod VisualShaderNodeScalarFunc "set_function"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarFunc.set_function