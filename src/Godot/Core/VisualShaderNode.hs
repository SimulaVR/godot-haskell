{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNode
       (Godot.Core.VisualShaderNode._PORT_TYPE_MAX,
        Godot.Core.VisualShaderNode._PORT_TYPE_TRANSFORM,
        Godot.Core.VisualShaderNode._PORT_TYPE_VECTOR,
        Godot.Core.VisualShaderNode._PORT_TYPE_SCALAR,
        Godot.Core.VisualShaderNode._PORT_TYPE_SAMPLER,
        Godot.Core.VisualShaderNode._PORT_TYPE_BOOLEAN,
        Godot.Core.VisualShaderNode.sig_editor_refresh_request,
        Godot.Core.VisualShaderNode.get_default_input_values,
        Godot.Core.VisualShaderNode.get_input_port_default_value,
        Godot.Core.VisualShaderNode.get_output_port_for_preview,
        Godot.Core.VisualShaderNode.set_default_input_values,
        Godot.Core.VisualShaderNode.set_input_port_default_value,
        Godot.Core.VisualShaderNode.set_output_port_for_preview)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PORT_TYPE_MAX :: Int
_PORT_TYPE_MAX = 5

_PORT_TYPE_TRANSFORM :: Int
_PORT_TYPE_TRANSFORM = 3

_PORT_TYPE_VECTOR :: Int
_PORT_TYPE_VECTOR = 1

_PORT_TYPE_SCALAR :: Int
_PORT_TYPE_SCALAR = 0

_PORT_TYPE_SAMPLER :: Int
_PORT_TYPE_SAMPLER = 4

_PORT_TYPE_BOOLEAN :: Int
_PORT_TYPE_BOOLEAN = 2

sig_editor_refresh_request ::
                           Godot.Internal.Dispatch.Signal VisualShaderNode
sig_editor_refresh_request
  = Godot.Internal.Dispatch.Signal "editor_refresh_request"

{-# NOINLINE bindVisualShaderNode_get_default_input_values #-}

bindVisualShaderNode_get_default_input_values :: MethodBind
bindVisualShaderNode_get_default_input_values
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "get_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_default_input_values ::
                           (VisualShaderNode :< cls, Object :< cls) => cls -> IO Array
get_default_input_values cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_get_default_input_values
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

{-# NOINLINE bindVisualShaderNode_set_default_input_values #-}

bindVisualShaderNode_set_default_input_values :: MethodBind
bindVisualShaderNode_set_default_input_values
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "set_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_default_input_values ::
                           (VisualShaderNode :< cls, Object :< cls) => cls -> Array -> IO ()
set_default_input_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_set_default_input_values
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