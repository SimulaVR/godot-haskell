{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNode
       (Godot.Core.VisualShaderNode.sig_editor_refresh_request,
        Godot.Core.VisualShaderNode.set_output_port_for_preview,
        Godot.Core.VisualShaderNode.get_output_port_for_preview,
        Godot.Core.VisualShaderNode.set_input_port_default_value,
        Godot.Core.VisualShaderNode.get_input_port_default_value,
        Godot.Core.VisualShaderNode._set_default_input_values,
        Godot.Core.VisualShaderNode._get_default_input_values)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_editor_refresh_request ::
                           Godot.Internal.Dispatch.Signal VisualShaderNode
sig_editor_refresh_request
  = Godot.Internal.Dispatch.Signal "editor_refresh_request"

{-# NOINLINE bindVisualShaderNode_set_output_port_for_preview #-}

bindVisualShaderNode_set_output_port_for_preview :: MethodBind
bindVisualShaderNode_set_output_port_for_preview
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "set_output_port_for_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_output_port_for_preview ::
                              (VisualShaderNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_output_port_for_preview cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_set_output_port_for_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNode_get_output_port_for_preview #-}

bindVisualShaderNode_get_output_port_for_preview :: MethodBind
bindVisualShaderNode_get_output_port_for_preview
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "get_output_port_for_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_output_port_for_preview ::
                              (VisualShaderNode :< cls, Object :< cls) => cls -> IO Int
get_output_port_for_preview cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_get_output_port_for_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNode_set_input_port_default_value #-}

bindVisualShaderNode_set_input_port_default_value :: MethodBind
bindVisualShaderNode_set_input_port_default_value
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "set_input_port_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_port_default_value ::
                               (VisualShaderNode :< cls, Object :< cls) =>
                               cls -> Int -> GodotVariant -> IO ()
set_input_port_default_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_set_input_port_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNode_get_input_port_default_value #-}

bindVisualShaderNode_get_input_port_default_value :: MethodBind
bindVisualShaderNode_get_input_port_default_value
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "get_input_port_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_port_default_value ::
                               (VisualShaderNode :< cls, Object :< cls) =>
                               cls -> Int -> IO GodotVariant
get_input_port_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_get_input_port_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNode__set_default_input_values #-}

bindVisualShaderNode__set_default_input_values :: MethodBind
bindVisualShaderNode__set_default_input_values
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "_set_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_default_input_values ::
                            (VisualShaderNode :< cls, Object :< cls) => cls -> Array -> IO ()
_set_default_input_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode__set_default_input_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNode__get_default_input_values #-}

bindVisualShaderNode__get_default_input_values :: MethodBind
bindVisualShaderNode__get_default_input_values
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "_get_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_default_input_values ::
                            (VisualShaderNode :< cls, Object :< cls) => cls -> IO Array
_get_default_input_values cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode__get_default_input_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)