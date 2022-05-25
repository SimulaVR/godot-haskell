{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeVectorFunc
       (Godot.Core.VisualShaderNodeVectorFunc._FUNC_HSV2RGB,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_TANH,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_SIGN,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ASIN,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_RECIPROCAL,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_SINH,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_LOG2,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_LOG,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_INVERSE_SQRT,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_SIN,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ACOSH,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_EXP,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_COSH,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_EXP2,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ROUND,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_DEGREES,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_RADIANS,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_CEIL,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_TRUNC,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ROUNDEVEN,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_RGB2HSV,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ASINH,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ATANH,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_NORMALIZE,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_TAN,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_FRAC,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ACOS,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_COS,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_SATURATE,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_FLOOR,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_NEGATE,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ATAN,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ABS,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_ONEMINUS,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_SQRT,
        Godot.Core.VisualShaderNodeVectorFunc.get_function,
        Godot.Core.VisualShaderNodeVectorFunc.set_function)
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

_FUNC_HSV2RGB :: Int
_FUNC_HSV2RGB = 5

_FUNC_TANH :: Int
_FUNC_TANH = 32

_FUNC_SIGN :: Int
_FUNC_SIGN = 27

_FUNC_ASIN :: Int
_FUNC_ASIN = 9

_FUNC_RECIPROCAL :: Int
_FUNC_RECIPROCAL = 3

_FUNC_SINH :: Int
_FUNC_SINH = 29

_FUNC_LOG2 :: Int
_FUNC_LOG2 = 23

_FUNC_LOG :: Int
_FUNC_LOG = 22

_FUNC_INVERSE_SQRT :: Int
_FUNC_INVERSE_SQRT = 21

_FUNC_SIN :: Int
_FUNC_SIN = 28

_FUNC_ACOSH :: Int
_FUNC_ACOSH = 8

_FUNC_EXP :: Int
_FUNC_EXP = 17

_FUNC_COSH :: Int
_FUNC_COSH = 15

_FUNC_EXP2 :: Int
_FUNC_EXP2 = 18

_FUNC_ROUND :: Int
_FUNC_ROUND = 25

_FUNC_DEGREES :: Int
_FUNC_DEGREES = 16

_FUNC_RADIANS :: Int
_FUNC_RADIANS = 24

_FUNC_CEIL :: Int
_FUNC_CEIL = 13

_FUNC_TRUNC :: Int
_FUNC_TRUNC = 33

_FUNC_ROUNDEVEN :: Int
_FUNC_ROUNDEVEN = 26

_FUNC_RGB2HSV :: Int
_FUNC_RGB2HSV = 4

_FUNC_ASINH :: Int
_FUNC_ASINH = 10

_FUNC_ATANH :: Int
_FUNC_ATANH = 12

_FUNC_NORMALIZE :: Int
_FUNC_NORMALIZE = 0

_FUNC_TAN :: Int
_FUNC_TAN = 31

_FUNC_FRAC :: Int
_FUNC_FRAC = 20

_FUNC_ACOS :: Int
_FUNC_ACOS = 7

_FUNC_COS :: Int
_FUNC_COS = 14

_FUNC_SATURATE :: Int
_FUNC_SATURATE = 1

_FUNC_FLOOR :: Int
_FUNC_FLOOR = 19

_FUNC_NEGATE :: Int
_FUNC_NEGATE = 2

_FUNC_ATAN :: Int
_FUNC_ATAN = 11

_FUNC_ABS :: Int
_FUNC_ABS = 6

_FUNC_ONEMINUS :: Int
_FUNC_ONEMINUS = 34

_FUNC_SQRT :: Int
_FUNC_SQRT = 30

instance NodeProperty VisualShaderNodeVectorFunc "function" Int
           'False
         where
        nodeProperty
          = (get_function, wrapDroppingSetter set_function, Nothing)

{-# NOINLINE bindVisualShaderNodeVectorFunc_get_function #-}

bindVisualShaderNodeVectorFunc_get_function :: MethodBind
bindVisualShaderNodeVectorFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function ::
               (VisualShaderNodeVectorFunc :< cls, Object :< cls) => cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeVectorFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVectorFunc "get_function" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeVectorFunc.get_function

{-# NOINLINE bindVisualShaderNodeVectorFunc_set_function #-}

bindVisualShaderNodeVectorFunc_set_function :: MethodBind
bindVisualShaderNodeVectorFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function ::
               (VisualShaderNodeVectorFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeVectorFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVectorFunc "set_function"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeVectorFunc.set_function