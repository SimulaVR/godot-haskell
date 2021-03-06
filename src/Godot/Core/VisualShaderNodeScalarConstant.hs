{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeScalarConstant
       (Godot.Core.VisualShaderNodeScalarConstant.get_constant,
        Godot.Core.VisualShaderNodeScalarConstant.set_constant)
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

instance NodeProperty VisualShaderNodeScalarConstant "constant"
           Float
           'False
         where
        nodeProperty
          = (get_constant, wrapDroppingSetter set_constant, Nothing)

{-# NOINLINE bindVisualShaderNodeScalarConstant_get_constant #-}

bindVisualShaderNodeScalarConstant_get_constant :: MethodBind
bindVisualShaderNodeScalarConstant_get_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarConstant" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant ::
               (VisualShaderNodeScalarConstant :< cls, Object :< cls) =>
               cls -> IO Float
get_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarConstant_get_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeScalarConstant "get_constant"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarConstant.get_constant

{-# NOINLINE bindVisualShaderNodeScalarConstant_set_constant #-}

bindVisualShaderNodeScalarConstant_set_constant :: MethodBind
bindVisualShaderNodeScalarConstant_set_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeScalarConstant" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant ::
               (VisualShaderNodeScalarConstant :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeScalarConstant_set_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeScalarConstant "set_constant"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeScalarConstant.set_constant