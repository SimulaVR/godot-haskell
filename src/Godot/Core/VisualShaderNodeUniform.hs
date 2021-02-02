{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeUniform
       (Godot.Core.VisualShaderNodeUniform.get_uniform_name,
        Godot.Core.VisualShaderNodeUniform.set_uniform_name)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualShaderNodeUniform_get_uniform_name #-}

bindVisualShaderNodeUniform_get_uniform_name :: MethodBind
bindVisualShaderNodeUniform_get_uniform_name
  = unsafePerformIO $
      withCString "VisualShaderNodeUniform" $
        \ clsNamePtr ->
          withCString "get_uniform_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_uniform_name ::
                   (VisualShaderNodeUniform :< cls, Object :< cls) =>
                   cls -> IO GodotString
get_uniform_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeUniform_get_uniform_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeUniform_set_uniform_name #-}

bindVisualShaderNodeUniform_set_uniform_name :: MethodBind
bindVisualShaderNodeUniform_set_uniform_name
  = unsafePerformIO $
      withCString "VisualShaderNodeUniform" $
        \ clsNamePtr ->
          withCString "set_uniform_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_uniform_name ::
                   (VisualShaderNodeUniform :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
set_uniform_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeUniform_set_uniform_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)