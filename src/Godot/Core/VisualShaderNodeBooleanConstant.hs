{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeBooleanConstant
       (Godot.Core.VisualShaderNodeBooleanConstant.get_constant,
        Godot.Core.VisualShaderNodeBooleanConstant.set_constant)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualShaderNodeBooleanConstant_get_constant #-}

bindVisualShaderNodeBooleanConstant_get_constant :: MethodBind
bindVisualShaderNodeBooleanConstant_get_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeBooleanConstant" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant ::
               (VisualShaderNodeBooleanConstant :< cls, Object :< cls) =>
               cls -> IO Bool
get_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeBooleanConstant_get_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeBooleanConstant_set_constant #-}

bindVisualShaderNodeBooleanConstant_set_constant :: MethodBind
bindVisualShaderNodeBooleanConstant_set_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeBooleanConstant" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant ::
               (VisualShaderNodeBooleanConstant :< cls, Object :< cls) =>
               cls -> Bool -> IO ()
set_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeBooleanConstant_set_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)