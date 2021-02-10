{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeTransformConstant
       (Godot.Core.VisualShaderNodeTransformConstant.get_constant,
        Godot.Core.VisualShaderNodeTransformConstant.set_constant)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualShaderNodeTransformConstant_get_constant #-}

-- | A [Transform] constant which represents the state of this node.
bindVisualShaderNodeTransformConstant_get_constant :: MethodBind
bindVisualShaderNodeTransformConstant_get_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformConstant" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Transform] constant which represents the state of this node.
get_constant ::
               (VisualShaderNodeTransformConstant :< cls, Object :< cls) =>
               cls -> IO Transform
get_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformConstant_get_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTransformConstant_set_constant #-}

-- | A [Transform] constant which represents the state of this node.
bindVisualShaderNodeTransformConstant_set_constant :: MethodBind
bindVisualShaderNodeTransformConstant_set_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeTransformConstant" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Transform] constant which represents the state of this node.
set_constant ::
               (VisualShaderNodeTransformConstant :< cls, Object :< cls) =>
               cls -> Transform -> IO ()
set_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTransformConstant_set_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)