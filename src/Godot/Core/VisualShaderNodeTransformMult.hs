{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeTransformMult
       (Godot.Core.VisualShaderNodeTransformMult._OP_AxB_COMP,
        Godot.Core.VisualShaderNodeTransformMult._OP_BxA_COMP,
        Godot.Core.VisualShaderNodeTransformMult._OP_AxB,
        Godot.Core.VisualShaderNodeTransformMult._OP_BxA,
        Godot.Core.VisualShaderNodeTransformMult.get_operator,
        Godot.Core.VisualShaderNodeTransformMult.set_operator)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_OP_AxB_COMP :: Int
_OP_AxB_COMP = 2

_OP_BxA_COMP :: Int
_OP_BxA_COMP = 3

_OP_AxB :: Int
_OP_AxB = 0

_OP_BxA :: Int
_OP_BxA = 1

{-# NOINLINE bindVisualShaderNodeTransformMult_get_operator #-}

-- | The multiplication type to be performed on the transforms. See [enum Operator] for options.
bindVisualShaderNodeTransformMult_get_operator :: MethodBind
bindVisualShaderNodeTransformMult_get_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformMult" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The multiplication type to be performed on the transforms. See [enum Operator] for options.
get_operator ::
               (VisualShaderNodeTransformMult :< cls, Object :< cls) =>
               cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformMult_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTransformMult_set_operator #-}

-- | The multiplication type to be performed on the transforms. See [enum Operator] for options.
bindVisualShaderNodeTransformMult_set_operator :: MethodBind
bindVisualShaderNodeTransformMult_set_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformMult" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The multiplication type to be performed on the transforms. See [enum Operator] for options.
set_operator ::
               (VisualShaderNodeTransformMult :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformMult_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)