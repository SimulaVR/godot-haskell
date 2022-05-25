{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeVectorOp
       (Godot.Core.VisualShaderNodeVectorOp._OP_DIV,
        Godot.Core.VisualShaderNodeVectorOp._OP_MIN,
        Godot.Core.VisualShaderNodeVectorOp._OP_REFLECT,
        Godot.Core.VisualShaderNodeVectorOp._OP_SUB,
        Godot.Core.VisualShaderNodeVectorOp._OP_MUL,
        Godot.Core.VisualShaderNodeVectorOp._OP_MAX,
        Godot.Core.VisualShaderNodeVectorOp._OP_CROSS,
        Godot.Core.VisualShaderNodeVectorOp._OP_ADD,
        Godot.Core.VisualShaderNodeVectorOp._OP_MOD,
        Godot.Core.VisualShaderNodeVectorOp._OP_POW,
        Godot.Core.VisualShaderNodeVectorOp._OP_STEP,
        Godot.Core.VisualShaderNodeVectorOp._OP_ATAN2,
        Godot.Core.VisualShaderNodeVectorOp.get_operator,
        Godot.Core.VisualShaderNodeVectorOp.set_operator)
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

_OP_REFLECT :: Int
_OP_REFLECT = 10

_OP_SUB :: Int
_OP_SUB = 1

_OP_MUL :: Int
_OP_MUL = 2

_OP_MAX :: Int
_OP_MAX = 6

_OP_CROSS :: Int
_OP_CROSS = 8

_OP_ADD :: Int
_OP_ADD = 0

_OP_MOD :: Int
_OP_MOD = 4

_OP_POW :: Int
_OP_POW = 5

_OP_STEP :: Int
_OP_STEP = 11

_OP_ATAN2 :: Int
_OP_ATAN2 = 9

instance NodeProperty VisualShaderNodeVectorOp "operator" Int
           'False
         where
        nodeProperty
          = (get_operator, wrapDroppingSetter set_operator, Nothing)

{-# NOINLINE bindVisualShaderNodeVectorOp_get_operator #-}

bindVisualShaderNodeVectorOp_get_operator :: MethodBind
bindVisualShaderNodeVectorOp_get_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorOp" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_operator ::
               (VisualShaderNodeVectorOp :< cls, Object :< cls) => cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeVectorOp_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVectorOp "get_operator" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeVectorOp.get_operator

{-# NOINLINE bindVisualShaderNodeVectorOp_set_operator #-}

bindVisualShaderNodeVectorOp_set_operator :: MethodBind
bindVisualShaderNodeVectorOp_set_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorOp" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_operator ::
               (VisualShaderNodeVectorOp :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeVectorOp_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVectorOp "set_operator" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeVectorOp.set_operator