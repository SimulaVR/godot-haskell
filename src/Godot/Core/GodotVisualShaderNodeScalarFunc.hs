module Godot.Core.GodotVisualShaderNodeScalarFunc where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_TANH :: Int

pattern FUNC_TANH = 8

pattern FUNC_SIGN :: Int

pattern FUNC_SIGN = 13

pattern FUNC_ASIN :: Int

pattern FUNC_ASIN = 3

pattern FUNC_RECIPROCAL :: Int

pattern FUNC_RECIPROCAL = 28

pattern FUNC_SINH :: Int

pattern FUNC_SINH = 6

pattern FUNC_LOG2 :: Int

pattern FUNC_LOG2 = 26

pattern FUNC_LOG :: Int

pattern FUNC_LOG = 9

pattern FUNC_INVERSE_SQRT :: Int

pattern FUNC_INVERSE_SQRT = 25

pattern FUNC_SIN :: Int

pattern FUNC_SIN = 0

pattern FUNC_ACOSH :: Int

pattern FUNC_ACOSH = 20

pattern FUNC_EXP :: Int

pattern FUNC_EXP = 10

pattern FUNC_COSH :: Int

pattern FUNC_COSH = 7

pattern FUNC_EXP2 :: Int

pattern FUNC_EXP2 = 24

pattern FUNC_ROUND :: Int

pattern FUNC_ROUND = 15

pattern FUNC_DEGREES :: Int

pattern FUNC_DEGREES = 23

pattern FUNC_RADIANS :: Int

pattern FUNC_RADIANS = 27

pattern FUNC_CEIL :: Int

pattern FUNC_CEIL = 16

pattern FUNC_TRUNC :: Int

pattern FUNC_TRUNC = 30

pattern FUNC_ROUNDEVEN :: Int

pattern FUNC_ROUNDEVEN = 29

pattern FUNC_ASINH :: Int

pattern FUNC_ASINH = 21

pattern FUNC_ATANH :: Int

pattern FUNC_ATANH = 22

pattern FUNC_TAN :: Int

pattern FUNC_TAN = 2

pattern FUNC_FRAC :: Int

pattern FUNC_FRAC = 17

pattern FUNC_ACOS :: Int

pattern FUNC_ACOS = 4

pattern FUNC_COS :: Int

pattern FUNC_COS = 1

pattern FUNC_SATURATE :: Int

pattern FUNC_SATURATE = 18

pattern FUNC_FLOOR :: Int

pattern FUNC_FLOOR = 14

pattern FUNC_NEGATE :: Int

pattern FUNC_NEGATE = 19

pattern FUNC_ATAN :: Int

pattern FUNC_ATAN = 5

pattern FUNC_ABS :: Int

pattern FUNC_ABS = 12

pattern FUNC_ONEMINUS :: Int

pattern FUNC_ONEMINUS = 31

pattern FUNC_SQRT :: Int

pattern FUNC_SQRT = 11