{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeVectorDerivativeFunc
       (Godot.Core.VisualShaderNodeVectorDerivativeFunc._FUNC_SUM,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc._FUNC_X,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc._FUNC_Y,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc.get_function,
        Godot.Core.VisualShaderNodeVectorDerivativeFunc.set_function)
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

_FUNC_SUM :: Int
_FUNC_SUM = 0

_FUNC_X :: Int
_FUNC_X = 1

_FUNC_Y :: Int
_FUNC_Y = 2

instance NodeProperty VisualShaderNodeVectorDerivativeFunc
           "function"
           Int
           'False
         where
        nodeProperty
          = (get_function, wrapDroppingSetter set_function, Nothing)

{-# NOINLINE bindVisualShaderNodeVectorDerivativeFunc_get_function
             #-}

bindVisualShaderNodeVectorDerivativeFunc_get_function :: MethodBind
bindVisualShaderNodeVectorDerivativeFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorDerivativeFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function ::
               (VisualShaderNodeVectorDerivativeFunc :< cls, Object :< cls) =>
               cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVectorDerivativeFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVectorDerivativeFunc
           "get_function"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeVectorDerivativeFunc.get_function

{-# NOINLINE bindVisualShaderNodeVectorDerivativeFunc_set_function
             #-}

bindVisualShaderNodeVectorDerivativeFunc_set_function :: MethodBind
bindVisualShaderNodeVectorDerivativeFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeVectorDerivativeFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function ::
               (VisualShaderNodeVectorDerivativeFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVectorDerivativeFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVectorDerivativeFunc
           "set_function"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeVectorDerivativeFunc.set_function