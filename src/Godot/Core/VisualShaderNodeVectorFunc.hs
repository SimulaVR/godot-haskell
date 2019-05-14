{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeVectorFunc
       (Godot.Core.VisualShaderNodeVectorFunc._FUNC_NORMALIZE,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_RECIPROCAL,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_HSV2RGB,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_RGB2HSV,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_NEGATE,
        Godot.Core.VisualShaderNodeVectorFunc._FUNC_SATURATE,
        Godot.Core.VisualShaderNodeVectorFunc.set_function,
        Godot.Core.VisualShaderNodeVectorFunc.get_function)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FUNC_NORMALIZE :: Int
_FUNC_NORMALIZE = 0

_FUNC_RECIPROCAL :: Int
_FUNC_RECIPROCAL = 3

_FUNC_HSV2RGB :: Int
_FUNC_HSV2RGB = 5

_FUNC_RGB2HSV :: Int
_FUNC_RGB2HSV = 4

_FUNC_NEGATE :: Int
_FUNC_NEGATE = 2

_FUNC_SATURATE :: Int
_FUNC_SATURATE = 1

{-# NOINLINE bindVisualShaderNodeVectorFunc_set_function #-}

bindVisualShaderNodeVectorFunc_set_function :: MethodBind
bindVisualShaderNodeVectorFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function ::
               (VisualShaderNodeVectorFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeVectorFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeVectorFunc_get_function #-}

bindVisualShaderNodeVectorFunc_get_function :: MethodBind
bindVisualShaderNodeVectorFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function ::
               (VisualShaderNodeVectorFunc :< cls, Object :< cls) => cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeVectorFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)