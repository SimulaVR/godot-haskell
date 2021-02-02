{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeInput
       (Godot.Core.VisualShaderNodeInput.sig_input_type_changed,
        Godot.Core.VisualShaderNodeInput.get_input_name,
        Godot.Core.VisualShaderNodeInput.get_input_real_name,
        Godot.Core.VisualShaderNodeInput.set_input_name)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_input_type_changed ::
                       Godot.Internal.Dispatch.Signal VisualShaderNodeInput
sig_input_type_changed
  = Godot.Internal.Dispatch.Signal "input_type_changed"

{-# NOINLINE bindVisualShaderNodeInput_get_input_name #-}

bindVisualShaderNodeInput_get_input_name :: MethodBind
bindVisualShaderNodeInput_get_input_name
  = unsafePerformIO $
      withCString "VisualShaderNodeInput" $
        \ clsNamePtr ->
          withCString "get_input_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_name ::
                 (VisualShaderNodeInput :< cls, Object :< cls) =>
                 cls -> IO GodotString
get_input_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeInput_get_input_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeInput_get_input_real_name #-}

bindVisualShaderNodeInput_get_input_real_name :: MethodBind
bindVisualShaderNodeInput_get_input_real_name
  = unsafePerformIO $
      withCString "VisualShaderNodeInput" $
        \ clsNamePtr ->
          withCString "get_input_real_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_real_name ::
                      (VisualShaderNodeInput :< cls, Object :< cls) =>
                      cls -> IO GodotString
get_input_real_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeInput_get_input_real_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeInput_set_input_name #-}

bindVisualShaderNodeInput_set_input_name :: MethodBind
bindVisualShaderNodeInput_set_input_name
  = unsafePerformIO $
      withCString "VisualShaderNodeInput" $
        \ clsNamePtr ->
          withCString "set_input_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_name ::
                 (VisualShaderNodeInput :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_input_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeInput_set_input_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)