{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeColorFunc
       (Godot.Core.VisualShaderNodeColorFunc._FUNC_SEPIA,
        Godot.Core.VisualShaderNodeColorFunc._FUNC_GRAYSCALE,
        Godot.Core.VisualShaderNodeColorFunc.get_function,
        Godot.Core.VisualShaderNodeColorFunc.set_function)
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

_FUNC_SEPIA :: Int
_FUNC_SEPIA = 1

_FUNC_GRAYSCALE :: Int
_FUNC_GRAYSCALE = 0

instance NodeProperty VisualShaderNodeColorFunc "function" Int
           'False
         where
        nodeProperty
          = (get_function, wrapDroppingSetter set_function, Nothing)

{-# NOINLINE bindVisualShaderNodeColorFunc_get_function #-}

-- | A function to be applied to the input color. See @enum Function@ for options.
bindVisualShaderNodeColorFunc_get_function :: MethodBind
bindVisualShaderNodeColorFunc_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeColorFunc" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A function to be applied to the input color. See @enum Function@ for options.
get_function ::
               (VisualShaderNodeColorFunc :< cls, Object :< cls) => cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeColorFunc_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeColorFunc "get_function" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeColorFunc.get_function

{-# NOINLINE bindVisualShaderNodeColorFunc_set_function #-}

-- | A function to be applied to the input color. See @enum Function@ for options.
bindVisualShaderNodeColorFunc_set_function :: MethodBind
bindVisualShaderNodeColorFunc_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeColorFunc" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A function to be applied to the input color. See @enum Function@ for options.
set_function ::
               (VisualShaderNodeColorFunc :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeColorFunc_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeColorFunc "set_function" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeColorFunc.set_function