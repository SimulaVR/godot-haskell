{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeColorOp
       (Godot.Core.VisualShaderNodeColorOp._OP_SCREEN,
        Godot.Core.VisualShaderNodeColorOp._OP_SOFT_LIGHT,
        Godot.Core.VisualShaderNodeColorOp._OP_DODGE,
        Godot.Core.VisualShaderNodeColorOp._OP_BURN,
        Godot.Core.VisualShaderNodeColorOp._OP_HARD_LIGHT,
        Godot.Core.VisualShaderNodeColorOp._OP_DARKEN,
        Godot.Core.VisualShaderNodeColorOp._OP_DIFFERENCE,
        Godot.Core.VisualShaderNodeColorOp._OP_OVERLAY,
        Godot.Core.VisualShaderNodeColorOp._OP_LIGHTEN,
        Godot.Core.VisualShaderNodeColorOp.get_operator,
        Godot.Core.VisualShaderNodeColorOp.set_operator)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_OP_SCREEN :: Int
_OP_SCREEN = 0

_OP_SOFT_LIGHT :: Int
_OP_SOFT_LIGHT = 7

_OP_DODGE :: Int
_OP_DODGE = 5

_OP_BURN :: Int
_OP_BURN = 6

_OP_HARD_LIGHT :: Int
_OP_HARD_LIGHT = 8

_OP_DARKEN :: Int
_OP_DARKEN = 2

_OP_DIFFERENCE :: Int
_OP_DIFFERENCE = 1

_OP_OVERLAY :: Int
_OP_OVERLAY = 4

_OP_LIGHTEN :: Int
_OP_LIGHTEN = 3

{-# NOINLINE bindVisualShaderNodeColorOp_get_operator #-}

bindVisualShaderNodeColorOp_get_operator :: MethodBind
bindVisualShaderNodeColorOp_get_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeColorOp" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_operator ::
               (VisualShaderNodeColorOp :< cls, Object :< cls) => cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeColorOp_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeColorOp_set_operator #-}

bindVisualShaderNodeColorOp_set_operator :: MethodBind
bindVisualShaderNodeColorOp_set_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeColorOp" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_operator ::
               (VisualShaderNodeColorOp :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeColorOp_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)