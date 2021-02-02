{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeColorConstant
       (Godot.Core.VisualShaderNodeColorConstant.get_constant,
        Godot.Core.VisualShaderNodeColorConstant.set_constant)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualShaderNodeColorConstant_get_constant #-}

bindVisualShaderNodeColorConstant_get_constant :: MethodBind
bindVisualShaderNodeColorConstant_get_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeColorConstant" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant ::
               (VisualShaderNodeColorConstant :< cls, Object :< cls) =>
               cls -> IO Color
get_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorConstant_get_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeColorConstant_set_constant #-}

bindVisualShaderNodeColorConstant_set_constant :: MethodBind
bindVisualShaderNodeColorConstant_set_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeColorConstant" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant ::
               (VisualShaderNodeColorConstant :< cls, Object :< cls) =>
               cls -> Color -> IO ()
set_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorConstant_set_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)