{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeTransformMult
       (Godot.Core.VisualShaderNodeTransformMult._OP_BxA_COMP,
        Godot.Core.VisualShaderNodeTransformMult._OP_AxB_COMP,
        Godot.Core.VisualShaderNodeTransformMult._OP_AxB,
        Godot.Core.VisualShaderNodeTransformMult._OP_BxA,
        Godot.Core.VisualShaderNodeTransformMult.get_operator,
        Godot.Core.VisualShaderNodeTransformMult.set_operator)
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

_OP_BxA_COMP :: Int
_OP_BxA_COMP = 3

_OP_AxB_COMP :: Int
_OP_AxB_COMP = 2

_OP_AxB :: Int
_OP_AxB = 0

_OP_BxA :: Int
_OP_BxA = 1

instance NodeProperty VisualShaderNodeTransformMult "operator" Int
           'False
         where
        nodeProperty
          = (get_operator, wrapDroppingSetter set_operator, Nothing)

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

instance NodeMethod VisualShaderNodeTransformMult "get_operator"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeTransformMult.get_operator

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

instance NodeMethod VisualShaderNodeTransformMult "set_operator"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeTransformMult.set_operator