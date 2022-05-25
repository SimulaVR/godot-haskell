{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeScalarOp
       (Godot.Core.VisualShaderNodeScalarOp._OP_DIV,
        Godot.Core.VisualShaderNodeScalarOp._OP_MIN,
        Godot.Core.VisualShaderNodeScalarOp._OP_SUB,
        Godot.Core.VisualShaderNodeScalarOp._OP_MUL,
        Godot.Core.VisualShaderNodeScalarOp._OP_MAX,
        Godot.Core.VisualShaderNodeScalarOp._OP_ADD,
        Godot.Core.VisualShaderNodeScalarOp._OP_MOD,
        Godot.Core.VisualShaderNodeScalarOp._OP_POW,
        Godot.Core.VisualShaderNodeScalarOp._OP_STEP,
        Godot.Core.VisualShaderNodeScalarOp._OP_ATAN2,
        Godot.Core.VisualShaderNodeScalarOp.get_operator,
        Godot.Core.VisualShaderNodeScalarOp.set_operator)
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

_OP_DIV :: Int
_OP_DIV = 3

_OP_MIN :: Int
_OP_MIN = 7

_OP_SUB :: Int
_OP_SUB = 1

_OP_MUL :: Int
_OP_MUL = 2

_OP_MAX :: Int
_OP_MAX = 6

_OP_ADD :: Int
_OP_ADD = 0

_OP_MOD :: Int
_OP_MOD = 4

_OP_POW :: Int
_OP_POW = 5

_OP_STEP :: Int
_OP_STEP = 9

_OP_ATAN2 :: Int
_OP_ATAN2 = 8

instance NodeProperty VisualShaderNodeScalarOp "operator" Int
           'False
         where
        nodeProperty
          = (get_operator, wrapDroppingSetter set_operator, Nothing)

{-# NOINLINE bindVisualShaderNodeScalarOp_get_operator #-}

bindVisualShaderNodeScalarOp_get_operator :: MethodBind
bindVisualShaderNodeScalarOp_get_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarOp" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_operator ::
               (VisualShaderNodeScalarOp :< cls, Object :< cls) => cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarOp_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeScalarOp "get_operator" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarOp.get_operator

{-# NOINLINE bindVisualShaderNodeScalarOp_set_operator #-}

bindVisualShaderNodeScalarOp_set_operator :: MethodBind
bindVisualShaderNodeScalarOp_set_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarOp" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_operator ::
               (VisualShaderNodeScalarOp :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeScalarOp_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeScalarOp "set_operator" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarOp.set_operator