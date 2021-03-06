{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptBuiltinFunc
       (Godot.Core.VisualScriptBuiltinFunc._MATH_RAD2DEG,
        Godot.Core.VisualScriptBuiltinFunc._MATH_TAN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_DEG2RAD,
        Godot.Core.VisualScriptBuiltinFunc._MATH_LERP,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ISINF,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ATAN2,
        Godot.Core.VisualScriptBuiltinFunc._TYPE_EXISTS,
        Godot.Core.VisualScriptBuiltinFunc._MATH_SMOOTHSTEP,
        Godot.Core.VisualScriptBuiltinFunc._MATH_LERP_ANGLE,
        Godot.Core.VisualScriptBuiltinFunc._MATH_WRAPF,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ATAN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_POSMOD,
        Godot.Core.VisualScriptBuiltinFunc._MATH_COSH,
        Godot.Core.VisualScriptBuiltinFunc._MATH_SEED,
        Godot.Core.VisualScriptBuiltinFunc._TYPE_CONVERT,
        Godot.Core.VisualScriptBuiltinFunc._LOGIC_MIN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_STEPIFY,
        Godot.Core.VisualScriptBuiltinFunc._COLORN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_SQRT,
        Godot.Core.VisualScriptBuiltinFunc._TEXT_PRINT,
        Godot.Core.VisualScriptBuiltinFunc._MATH_DB2LINEAR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_RAND,
        Godot.Core.VisualScriptBuiltinFunc._FUNC_FUNCREF,
        Godot.Core.VisualScriptBuiltinFunc._LOGIC_NEAREST_PO2,
        Godot.Core.VisualScriptBuiltinFunc._OBJ_WEAKREF,
        Godot.Core.VisualScriptBuiltinFunc._MATH_CARTESIAN2POLAR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_POLAR2CARTESIAN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ISNAN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_CEIL,
        Godot.Core.VisualScriptBuiltinFunc._MATH_SIGN,
        Godot.Core.VisualScriptBuiltinFunc._MATH_TANH,
        Godot.Core.VisualScriptBuiltinFunc._MATH_RANDOM,
        Godot.Core.VisualScriptBuiltinFunc._MATH_RANGE_LERP,
        Godot.Core.VisualScriptBuiltinFunc._MATH_FMOD,
        Godot.Core.VisualScriptBuiltinFunc._MATH_DECIMALS,
        Godot.Core.VisualScriptBuiltinFunc._VAR_TO_BYTES,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ABS,
        Godot.Core.VisualScriptBuiltinFunc._TEXT_STR,
        Godot.Core.VisualScriptBuiltinFunc._BYTES_TO_VAR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_FLOOR,
        Godot.Core.VisualScriptBuiltinFunc._TEXT_PRINTRAW,
        Godot.Core.VisualScriptBuiltinFunc._MATH_POW,
        Godot.Core.VisualScriptBuiltinFunc._LOGIC_CLAMP,
        Godot.Core.VisualScriptBuiltinFunc._MATH_MOVE_TOWARD,
        Godot.Core.VisualScriptBuiltinFunc._MATH_EXP,
        Godot.Core.VisualScriptBuiltinFunc._TEXT_CHAR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_RANDOMIZE,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ASIN,
        Godot.Core.VisualScriptBuiltinFunc._FUNC_MAX,
        Godot.Core.VisualScriptBuiltinFunc._LOGIC_MAX,
        Godot.Core.VisualScriptBuiltinFunc._MATH_EASE,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ROUND,
        Godot.Core.VisualScriptBuiltinFunc._MATH_RANDF,
        Godot.Core.VisualScriptBuiltinFunc._MATH_DECTIME,
        Godot.Core.VisualScriptBuiltinFunc._MATH_COS,
        Godot.Core.VisualScriptBuiltinFunc._MATH_SIN,
        Godot.Core.VisualScriptBuiltinFunc._VAR_TO_STR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_SINH,
        Godot.Core.VisualScriptBuiltinFunc._TEXT_ORD,
        Godot.Core.VisualScriptBuiltinFunc._STR_TO_VAR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_INVERSE_LERP,
        Godot.Core.VisualScriptBuiltinFunc._MATH_FPOSMOD,
        Godot.Core.VisualScriptBuiltinFunc._MATH_WRAP,
        Godot.Core.VisualScriptBuiltinFunc._MATH_LOG,
        Godot.Core.VisualScriptBuiltinFunc._TYPE_OF,
        Godot.Core.VisualScriptBuiltinFunc._TEXT_PRINTERR,
        Godot.Core.VisualScriptBuiltinFunc._MATH_LINEAR2DB,
        Godot.Core.VisualScriptBuiltinFunc._MATH_ACOS,
        Godot.Core.VisualScriptBuiltinFunc._MATH_RANDSEED,
        Godot.Core.VisualScriptBuiltinFunc.get_func,
        Godot.Core.VisualScriptBuiltinFunc.set_func)
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
import Godot.Core.VisualScriptNode()

_MATH_RAD2DEG :: Int
_MATH_RAD2DEG = 38

_MATH_TAN :: Int
_MATH_TAN = 2

_MATH_DEG2RAD :: Int
_MATH_DEG2RAD = 37

_MATH_LERP :: Int
_MATH_LERP = 26

_MATH_ISINF :: Int
_MATH_ISINF = 22

_MATH_ATAN2 :: Int
_MATH_ATAN2 = 9

_TYPE_EXISTS :: Int
_TYPE_EXISTS = 53

_MATH_SMOOTHSTEP :: Int
_MATH_SMOOTHSTEP = 64

_MATH_LERP_ANGLE :: Int
_MATH_LERP_ANGLE = 66

_MATH_WRAPF :: Int
_MATH_WRAPF = 44

_MATH_ATAN :: Int
_MATH_ATAN = 8

_MATH_POSMOD :: Int
_MATH_POSMOD = 65

_MATH_COSH :: Int
_MATH_COSH = 4

_MATH_SEED :: Int
_MATH_SEED = 35

_TYPE_CONVERT :: Int
_TYPE_CONVERT = 51

_LOGIC_MIN :: Int
_LOGIC_MIN = 46

_MATH_STEPIFY :: Int
_MATH_STEPIFY = 25

_COLORN :: Int
_COLORN = 63

_MATH_SQRT :: Int
_MATH_SQRT = 10

_TEXT_PRINT :: Int
_TEXT_PRINT = 56

_MATH_DB2LINEAR :: Int
_MATH_DB2LINEAR = 40

_MATH_RAND :: Int
_MATH_RAND = 32

_FUNC_FUNCREF :: Int
_FUNC_FUNCREF = 50

_LOGIC_NEAREST_PO2 :: Int
_LOGIC_NEAREST_PO2 = 48

_OBJ_WEAKREF :: Int
_OBJ_WEAKREF = 49

_MATH_CARTESIAN2POLAR :: Int
_MATH_CARTESIAN2POLAR = 42

_MATH_POLAR2CARTESIAN :: Int
_MATH_POLAR2CARTESIAN = 41

_MATH_ISNAN :: Int
_MATH_ISNAN = 21

_MATH_CEIL :: Int
_MATH_CEIL = 14

_MATH_SIGN :: Int
_MATH_SIGN = 17

_MATH_TANH :: Int
_MATH_TANH = 5

_MATH_RANDOM :: Int
_MATH_RANDOM = 34

_MATH_RANGE_LERP :: Int
_MATH_RANGE_LERP = 28

_MATH_FMOD :: Int
_MATH_FMOD = 11

_MATH_DECIMALS :: Int
_MATH_DECIMALS = 24

_VAR_TO_BYTES :: Int
_VAR_TO_BYTES = 61

_MATH_ABS :: Int
_MATH_ABS = 16

_TEXT_STR :: Int
_TEXT_STR = 55

_BYTES_TO_VAR :: Int
_BYTES_TO_VAR = 62

_MATH_FLOOR :: Int
_MATH_FLOOR = 13

_TEXT_PRINTRAW :: Int
_TEXT_PRINTRAW = 58

_MATH_POW :: Int
_MATH_POW = 18

_LOGIC_CLAMP :: Int
_LOGIC_CLAMP = 47

_MATH_MOVE_TOWARD :: Int
_MATH_MOVE_TOWARD = 29

_MATH_EXP :: Int
_MATH_EXP = 20

_TEXT_CHAR :: Int
_TEXT_CHAR = 54

_MATH_RANDOMIZE :: Int
_MATH_RANDOMIZE = 31

_MATH_ASIN :: Int
_MATH_ASIN = 6

_FUNC_MAX :: Int
_FUNC_MAX = 68

_LOGIC_MAX :: Int
_LOGIC_MAX = 45

_MATH_EASE :: Int
_MATH_EASE = 23

_MATH_ROUND :: Int
_MATH_ROUND = 15

_MATH_RANDF :: Int
_MATH_RANDF = 33

_MATH_DECTIME :: Int
_MATH_DECTIME = 30

_MATH_COS :: Int
_MATH_COS = 1

_MATH_SIN :: Int
_MATH_SIN = 0

_VAR_TO_STR :: Int
_VAR_TO_STR = 59

_MATH_SINH :: Int
_MATH_SINH = 3

_TEXT_ORD :: Int
_TEXT_ORD = 67

_STR_TO_VAR :: Int
_STR_TO_VAR = 60

_MATH_INVERSE_LERP :: Int
_MATH_INVERSE_LERP = 27

_MATH_FPOSMOD :: Int
_MATH_FPOSMOD = 12

_MATH_WRAP :: Int
_MATH_WRAP = 43

_MATH_LOG :: Int
_MATH_LOG = 19

_TYPE_OF :: Int
_TYPE_OF = 52

_TEXT_PRINTERR :: Int
_TEXT_PRINTERR = 57

_MATH_LINEAR2DB :: Int
_MATH_LINEAR2DB = 39

_MATH_ACOS :: Int
_MATH_ACOS = 7

_MATH_RANDSEED :: Int
_MATH_RANDSEED = 36

instance NodeProperty VisualScriptBuiltinFunc "function" Int 'False
         where
        nodeProperty = (get_func, wrapDroppingSetter set_func, Nothing)

{-# NOINLINE bindVisualScriptBuiltinFunc_get_func #-}

bindVisualScriptBuiltinFunc_get_func :: MethodBind
bindVisualScriptBuiltinFunc_get_func
  = unsafePerformIO $
      withCString "VisualScriptBuiltinFunc" $
        \ clsNamePtr ->
          withCString "get_func" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_func ::
           (VisualScriptBuiltinFunc :< cls, Object :< cls) => cls -> IO Int
get_func cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptBuiltinFunc_get_func
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptBuiltinFunc "get_func" '[] (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptBuiltinFunc.get_func

{-# NOINLINE bindVisualScriptBuiltinFunc_set_func #-}

bindVisualScriptBuiltinFunc_set_func :: MethodBind
bindVisualScriptBuiltinFunc_set_func
  = unsafePerformIO $
      withCString "VisualScriptBuiltinFunc" $
        \ clsNamePtr ->
          withCString "set_func" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_func ::
           (VisualScriptBuiltinFunc :< cls, Object :< cls) =>
           cls -> Int -> IO ()
set_func cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptBuiltinFunc_set_func
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptBuiltinFunc "set_func" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptBuiltinFunc.set_func