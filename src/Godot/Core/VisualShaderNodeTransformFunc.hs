{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeTransformFunc
       (Godot.Core.VisualShaderNodeTransformFunc._FUNC_INVERSE,
        Godot.Core.VisualShaderNodeTransformFunc._FUNC_TRANSPOSE,
        Godot.Core.VisualShaderNodeTransformFunc.get_function,
        Godot.Core.VisualShaderNodeTransformFunc.set_function)
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

_FUNC_INVERSE :: Int
_FUNC_INVERSE = 0

_FUNC_TRANSPOSE :: Int
_FUNC_TRANSPOSE = 1

instance NodeProperty VisualShaderNodeTransformFunc "function" Int
           'False
         where
        nodeProperty
          = (get_function, wrapDroppingSetter set_function, Nothing)

{-# NOINLINE bindVisualShaderNodeTransformFunc_get_function #-}

bindVisualShaderNodeTransformFunc_get_function :: MethodBind
bindVisualShaderNodeTransformFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function ::
               (VisualShaderNodeTransformFunc :< cls, Object :< cls) =>
               cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeTransformFunc "get_function"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeTransformFunc.get_function

{-# NOINLINE bindVisualShaderNodeTransformFunc_set_function #-}

bindVisualShaderNodeTransformFunc_set_function :: MethodBind
bindVisualShaderNodeTransformFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function ::
               (VisualShaderNodeTransformFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeTransformFunc "set_function"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeTransformFunc.set_function