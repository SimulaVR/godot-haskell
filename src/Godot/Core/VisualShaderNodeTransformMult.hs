{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeTransformMult
       (Godot.Core.VisualShaderNodeTransformMult._OP_AxB,
        Godot.Core.VisualShaderNodeTransformMult._OP_BxA,
        Godot.Core.VisualShaderNodeTransformMult.set_operator,
        Godot.Core.VisualShaderNodeTransformMult.get_operator)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_OP_AxB :: Int
_OP_AxB = 0

_OP_BxA :: Int
_OP_BxA = 1

{-# NOINLINE bindVisualShaderNodeTransformMult_set_operator #-}

bindVisualShaderNodeTransformMult_set_operator :: MethodBind
bindVisualShaderNodeTransformMult_set_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformMult" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindVisualShaderNodeTransformMult_get_operator #-}

bindVisualShaderNodeTransformMult_get_operator :: MethodBind
bindVisualShaderNodeTransformMult_get_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformMult" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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