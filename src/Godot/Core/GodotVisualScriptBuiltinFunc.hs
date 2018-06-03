module Godot.Core.GodotVisualScriptBuiltinFunc where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern MATH_RAD2DEG :: Int

pattern MATH_RAD2DEG = 37

pattern MATH_TAN :: Int

pattern MATH_TAN = 2

pattern MATH_DEG2RAD :: Int

pattern MATH_DEG2RAD = 36

pattern MATH_LERP :: Int

pattern MATH_LERP = 26

pattern MATH_ISINF :: Int

pattern MATH_ISINF = 22

pattern MATH_ATAN2 :: Int

pattern MATH_ATAN2 = 9

pattern TYPE_EXISTS :: Int

pattern TYPE_EXISTS = 52

pattern MATH_WRAPF :: Int

pattern MATH_WRAPF = 43

pattern MATH_ATAN :: Int

pattern MATH_ATAN = 8

pattern MATH_COSH :: Int

pattern MATH_COSH = 4

pattern MATH_SEED :: Int

pattern MATH_SEED = 34

pattern TYPE_CONVERT :: Int

pattern TYPE_CONVERT = 50

pattern LOGIC_MIN :: Int

pattern LOGIC_MIN = 45

pattern MATH_STEPIFY :: Int

pattern MATH_STEPIFY = 25

pattern COLORN :: Int

pattern COLORN = 62

pattern MATH_SQRT :: Int

pattern MATH_SQRT = 10

pattern TEXT_PRINT :: Int

pattern TEXT_PRINT = 55

pattern MATH_DB2LINEAR :: Int

pattern MATH_DB2LINEAR = 39

pattern MATH_RAND :: Int

pattern MATH_RAND = 31

pattern FUNC_FUNCREF :: Int

pattern FUNC_FUNCREF = 49

pattern LOGIC_NEAREST_PO2 :: Int

pattern LOGIC_NEAREST_PO2 = 47

pattern OBJ_WEAKREF :: Int

pattern OBJ_WEAKREF = 48

pattern MATH_CARTESIAN2POLAR :: Int

pattern MATH_CARTESIAN2POLAR = 41

pattern MATH_POLAR2CARTESIAN :: Int

pattern MATH_POLAR2CARTESIAN = 40

pattern MATH_ISNAN :: Int

pattern MATH_ISNAN = 21

pattern MATH_CEIL :: Int

pattern MATH_CEIL = 14

pattern MATH_SIGN :: Int

pattern MATH_SIGN = 17

pattern MATH_TANH :: Int

pattern MATH_TANH = 5

pattern MATH_RANDOM :: Int

pattern MATH_RANDOM = 33

pattern MATH_RANGE_LERP :: Int

pattern MATH_RANGE_LERP = 28

pattern MATH_FMOD :: Int

pattern MATH_FMOD = 11

pattern MATH_DECIMALS :: Int

pattern MATH_DECIMALS = 24

pattern VAR_TO_BYTES :: Int

pattern VAR_TO_BYTES = 60

pattern MATH_ABS :: Int

pattern MATH_ABS = 16

pattern TEXT_STR :: Int

pattern TEXT_STR = 54

pattern BYTES_TO_VAR :: Int

pattern BYTES_TO_VAR = 61

pattern MATH_FLOOR :: Int

pattern MATH_FLOOR = 13

pattern TEXT_PRINTRAW :: Int

pattern TEXT_PRINTRAW = 57

pattern MATH_POW :: Int

pattern MATH_POW = 18

pattern LOGIC_CLAMP :: Int

pattern LOGIC_CLAMP = 46

pattern MATH_EXP :: Int

pattern MATH_EXP = 20

pattern TEXT_CHAR :: Int

pattern TEXT_CHAR = 53

pattern MATH_RANDOMIZE :: Int

pattern MATH_RANDOMIZE = 30

pattern MATH_ASIN :: Int

pattern MATH_ASIN = 6

pattern FUNC_MAX :: Int

pattern FUNC_MAX = 63

pattern LOGIC_MAX :: Int

pattern LOGIC_MAX = 44

pattern MATH_EASE :: Int

pattern MATH_EASE = 23

pattern MATH_ROUND :: Int

pattern MATH_ROUND = 15

pattern MATH_RANDF :: Int

pattern MATH_RANDF = 32

pattern MATH_DECTIME :: Int

pattern MATH_DECTIME = 29

pattern MATH_COS :: Int

pattern MATH_COS = 1

pattern MATH_SIN :: Int

pattern MATH_SIN = 0

pattern VAR_TO_STR :: Int

pattern VAR_TO_STR = 58

pattern MATH_SINH :: Int

pattern MATH_SINH = 3

pattern STR_TO_VAR :: Int

pattern STR_TO_VAR = 59

pattern MATH_INVERSE_LERP :: Int

pattern MATH_INVERSE_LERP = 27

pattern MATH_FPOSMOD :: Int

pattern MATH_FPOSMOD = 12

pattern MATH_WRAP :: Int

pattern MATH_WRAP = 42

pattern MATH_LOG :: Int

pattern MATH_LOG = 19

pattern TYPE_OF :: Int

pattern TYPE_OF = 51

pattern TEXT_PRINTERR :: Int

pattern TEXT_PRINTERR = 56

pattern MATH_LINEAR2DB :: Int

pattern MATH_LINEAR2DB = 38

pattern MATH_ACOS :: Int

pattern MATH_ACOS = 7

pattern MATH_RANDSEED :: Int

pattern MATH_RANDSEED = 35