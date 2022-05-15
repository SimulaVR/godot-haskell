module Godot.Core.GodotVisualShaderNodeVectorFunc where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_HSV2RGB :: Int

pattern FUNC_HSV2RGB = 5

pattern FUNC_TANH :: Int

pattern FUNC_TANH = 32

pattern FUNC_SIGN :: Int

pattern FUNC_SIGN = 27

pattern FUNC_ASIN :: Int

pattern FUNC_ASIN = 9

pattern FUNC_RECIPROCAL :: Int

pattern FUNC_RECIPROCAL = 3

pattern FUNC_SINH :: Int

pattern FUNC_SINH = 29

pattern FUNC_LOG2 :: Int

pattern FUNC_LOG2 = 23

pattern FUNC_LOG :: Int

pattern FUNC_LOG = 22

pattern FUNC_INVERSE_SQRT :: Int

pattern FUNC_INVERSE_SQRT = 21

pattern FUNC_SIN :: Int

pattern FUNC_SIN = 28

pattern FUNC_ACOSH :: Int

pattern FUNC_ACOSH = 8

pattern FUNC_EXP :: Int

pattern FUNC_EXP = 17

pattern FUNC_COSH :: Int

pattern FUNC_COSH = 15

pattern FUNC_EXP2 :: Int

pattern FUNC_EXP2 = 18

pattern FUNC_ROUND :: Int

pattern FUNC_ROUND = 25

pattern FUNC_DEGREES :: Int

pattern FUNC_DEGREES = 16

pattern FUNC_RADIANS :: Int

pattern FUNC_RADIANS = 24

pattern FUNC_CEIL :: Int

pattern FUNC_CEIL = 13

pattern FUNC_TRUNC :: Int

pattern FUNC_TRUNC = 33

pattern FUNC_ROUNDEVEN :: Int

pattern FUNC_ROUNDEVEN = 26

pattern FUNC_RGB2HSV :: Int

pattern FUNC_RGB2HSV = 4

pattern FUNC_ASINH :: Int

pattern FUNC_ASINH = 10

pattern FUNC_ATANH :: Int

pattern FUNC_ATANH = 12

pattern FUNC_NORMALIZE :: Int

pattern FUNC_NORMALIZE = 0

pattern FUNC_TAN :: Int

pattern FUNC_TAN = 31

pattern FUNC_FRAC :: Int

pattern FUNC_FRAC = 20

pattern FUNC_ACOS :: Int

pattern FUNC_ACOS = 7

pattern FUNC_COS :: Int

pattern FUNC_COS = 14

pattern FUNC_SATURATE :: Int

pattern FUNC_SATURATE = 1

pattern FUNC_FLOOR :: Int

pattern FUNC_FLOOR = 19

pattern FUNC_NEGATE :: Int

pattern FUNC_NEGATE = 2

pattern FUNC_ATAN :: Int

pattern FUNC_ATAN = 11

pattern FUNC_ABS :: Int

pattern FUNC_ABS = 6

pattern FUNC_ONEMINUS :: Int

pattern FUNC_ONEMINUS = 34

pattern FUNC_SQRT :: Int

pattern FUNC_SQRT = 30