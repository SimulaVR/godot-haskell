{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeCustom
       (Godot.Core.VisualShaderNodeCustom._get_category,
        Godot.Core.VisualShaderNodeCustom._get_code,
        Godot.Core.VisualShaderNodeCustom._get_description,
        Godot.Core.VisualShaderNodeCustom._get_global_code,
        Godot.Core.VisualShaderNodeCustom._get_input_port_count,
        Godot.Core.VisualShaderNodeCustom._get_input_port_name,
        Godot.Core.VisualShaderNodeCustom._get_input_port_type,
        Godot.Core.VisualShaderNodeCustom._get_name,
        Godot.Core.VisualShaderNodeCustom._get_output_port_count,
        Godot.Core.VisualShaderNodeCustom._get_output_port_name,
        Godot.Core.VisualShaderNodeCustom._get_output_port_type,
        Godot.Core.VisualShaderNodeCustom._get_return_icon_type,
        Godot.Core.VisualShaderNodeCustom._get_subcategory)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualShaderNodeCustom__get_category #-}

-- | Override this method to define the category of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b]. If not overridden, the node will be filed under the "Custom" category.
bindVisualShaderNodeCustom__get_category :: MethodBind
bindVisualShaderNodeCustom__get_category
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_category" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the category of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b]. If not overridden, the node will be filed under the "Custom" category.
_get_category ::
                (VisualShaderNodeCustom :< cls, Object :< cls) =>
                cls -> IO GodotString
_get_category cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCustom__get_category
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_code #-}

-- | Override this method to define the actual shader code of the associated custom node. The shader code should be returned as a string, which can have multiple lines (the [code]"""[/code] multiline string construct can be used for convenience).
--   				The [code]input_vars[/code] and [code]output_vars[/code] arrays contain the string names of the various input and output variables, as defined by [code]_get_input_*[/code] and [code]_get_output_*[/code] virtual methods in this class.
--   				The output ports can be assigned values in the shader code. For example, [code]return output_vars[0] + " = " + input_vars[0] + ";"[/code].
--   				You can customize the generated code based on the shader [code]mode[/code] (see [enum Shader.Mode]) and/or [code]type[/code] (see [enum VisualShader.Type]).
--   				Defining this method is [b]required[/b].
bindVisualShaderNodeCustom__get_code :: MethodBind
bindVisualShaderNodeCustom__get_code
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the actual shader code of the associated custom node. The shader code should be returned as a string, which can have multiple lines (the [code]"""[/code] multiline string construct can be used for convenience).
--   				The [code]input_vars[/code] and [code]output_vars[/code] arrays contain the string names of the various input and output variables, as defined by [code]_get_input_*[/code] and [code]_get_output_*[/code] virtual methods in this class.
--   				The output ports can be assigned values in the shader code. For example, [code]return output_vars[0] + " = " + input_vars[0] + ";"[/code].
--   				You can customize the generated code based on the shader [code]mode[/code] (see [enum Shader.Mode]) and/or [code]type[/code] (see [enum VisualShader.Type]).
--   				Defining this method is [b]required[/b].
_get_code ::
            (VisualShaderNodeCustom :< cls, Object :< cls) =>
            cls -> Array -> Array -> Int -> Int -> IO GodotString
_get_code cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCustom__get_code
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_description #-}

-- | Override this method to define the description of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b].
bindVisualShaderNodeCustom__get_description :: MethodBind
bindVisualShaderNodeCustom__get_description
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the description of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b].
_get_description ::
                   (VisualShaderNodeCustom :< cls, Object :< cls) =>
                   cls -> IO GodotString
_get_description cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCustom__get_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_global_code #-}

-- | Override this method to add shader code on top of the global shader, to define your own standard library of reusable methods, varyings, constants, uniforms, etc. The shader code should be returned as a string, which can have multiple lines (the [code]"""[/code] multiline string construct can be used for convenience).
--   				Be careful with this functionality as it can cause name conflicts with other custom nodes, so be sure to give the defined entities unique names.
--   				You can customize the generated code based on the shader [code]mode[/code] (see [enum Shader.Mode]).
--   				Defining this method is [b]optional[/b].
bindVisualShaderNodeCustom__get_global_code :: MethodBind
bindVisualShaderNodeCustom__get_global_code
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_global_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to add shader code on top of the global shader, to define your own standard library of reusable methods, varyings, constants, uniforms, etc. The shader code should be returned as a string, which can have multiple lines (the [code]"""[/code] multiline string construct can be used for convenience).
--   				Be careful with this functionality as it can cause name conflicts with other custom nodes, so be sure to give the defined entities unique names.
--   				You can customize the generated code based on the shader [code]mode[/code] (see [enum Shader.Mode]).
--   				Defining this method is [b]optional[/b].
_get_global_code ::
                   (VisualShaderNodeCustom :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotString
_get_global_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCustom__get_global_code
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_input_port_count #-}

-- | Override this method to define the amount of input ports of the associated custom node.
--   				Defining this method is [b]required[/b]. If not overridden, the node has no input ports.
bindVisualShaderNodeCustom__get_input_port_count :: MethodBind
bindVisualShaderNodeCustom__get_input_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_input_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the amount of input ports of the associated custom node.
--   				Defining this method is [b]required[/b]. If not overridden, the node has no input ports.
_get_input_port_count ::
                        (VisualShaderNodeCustom :< cls, Object :< cls) => cls -> IO Int
_get_input_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_input_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_input_port_name #-}

-- | Override this method to define the names of input ports of the associated custom node. The names are used both for the input slots in the editor and as identifiers in the shader code, and are passed in the [code]input_vars[/code] array in [method _get_code].
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, input ports are named as [code]"in" + str(port)[/code].
bindVisualShaderNodeCustom__get_input_port_name :: MethodBind
bindVisualShaderNodeCustom__get_input_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_input_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the names of input ports of the associated custom node. The names are used both for the input slots in the editor and as identifiers in the shader code, and are passed in the [code]input_vars[/code] array in [method _get_code].
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, input ports are named as [code]"in" + str(port)[/code].
_get_input_port_name ::
                       (VisualShaderNodeCustom :< cls, Object :< cls) =>
                       cls -> Int -> IO GodotString
_get_input_port_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_input_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_input_port_type #-}

-- | Override this method to define the returned type of each input port of the associated custom node (see [enum VisualShaderNode.PortType] for possible types).
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, input ports will return the [constant VisualShaderNode.PORT_TYPE_SCALAR] type.
bindVisualShaderNodeCustom__get_input_port_type :: MethodBind
bindVisualShaderNodeCustom__get_input_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_input_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the returned type of each input port of the associated custom node (see [enum VisualShaderNode.PortType] for possible types).
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, input ports will return the [constant VisualShaderNode.PORT_TYPE_SCALAR] type.
_get_input_port_type ::
                       (VisualShaderNodeCustom :< cls, Object :< cls) =>
                       cls -> Int -> IO Int
_get_input_port_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_input_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_name #-}

-- | Override this method to define the name of the associated custom node in the Visual Shader Editor's members dialog and graph.
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, the node will be named as "Unnamed".
bindVisualShaderNodeCustom__get_name :: MethodBind
bindVisualShaderNodeCustom__get_name
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the name of the associated custom node in the Visual Shader Editor's members dialog and graph.
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, the node will be named as "Unnamed".
_get_name ::
            (VisualShaderNodeCustom :< cls, Object :< cls) =>
            cls -> IO GodotString
_get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCustom__get_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_output_port_count #-}

-- | Override this method to define the amount of output ports of the associated custom node.
--   				Defining this method is [b]required[/b]. If not overridden, the node has no output ports.
bindVisualShaderNodeCustom__get_output_port_count :: MethodBind
bindVisualShaderNodeCustom__get_output_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_output_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the amount of output ports of the associated custom node.
--   				Defining this method is [b]required[/b]. If not overridden, the node has no output ports.
_get_output_port_count ::
                         (VisualShaderNodeCustom :< cls, Object :< cls) => cls -> IO Int
_get_output_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_output_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_output_port_name #-}

-- | Override this method to define the names of output ports of the associated custom node. The names are used both for the output slots in the editor and as identifiers in the shader code, and are passed in the [code]output_vars[/code] array in [method _get_code].
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, output ports are named as [code]"out" + str(port)[/code].
bindVisualShaderNodeCustom__get_output_port_name :: MethodBind
bindVisualShaderNodeCustom__get_output_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_output_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the names of output ports of the associated custom node. The names are used both for the output slots in the editor and as identifiers in the shader code, and are passed in the [code]output_vars[/code] array in [method _get_code].
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, output ports are named as [code]"out" + str(port)[/code].
_get_output_port_name ::
                        (VisualShaderNodeCustom :< cls, Object :< cls) =>
                        cls -> Int -> IO GodotString
_get_output_port_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_output_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_output_port_type #-}

-- | Override this method to define the returned type of each output port of the associated custom node (see [enum VisualShaderNode.PortType] for possible types).
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, output ports will return the [constant VisualShaderNode.PORT_TYPE_SCALAR] type.
bindVisualShaderNodeCustom__get_output_port_type :: MethodBind
bindVisualShaderNodeCustom__get_output_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_output_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the returned type of each output port of the associated custom node (see [enum VisualShaderNode.PortType] for possible types).
--   				Defining this method is [b]optional[/b], but recommended. If not overridden, output ports will return the [constant VisualShaderNode.PORT_TYPE_SCALAR] type.
_get_output_port_type ::
                        (VisualShaderNodeCustom :< cls, Object :< cls) =>
                        cls -> Int -> IO Int
_get_output_port_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_output_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_return_icon_type #-}

-- | Override this method to define the return icon of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b]. If not overridden, no return icon is shown.
bindVisualShaderNodeCustom__get_return_icon_type :: MethodBind
bindVisualShaderNodeCustom__get_return_icon_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_return_icon_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the return icon of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b]. If not overridden, no return icon is shown.
_get_return_icon_type ::
                        (VisualShaderNodeCustom :< cls, Object :< cls) => cls -> IO Int
_get_return_icon_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCustom__get_return_icon_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeCustom__get_subcategory #-}

-- | Override this method to define the subcategory of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b]. If not overridden, the node will be filed under the root of the main category (see [method _get_category]).
bindVisualShaderNodeCustom__get_subcategory :: MethodBind
bindVisualShaderNodeCustom__get_subcategory
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_subcategory" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to define the subcategory of the associated custom node in the Visual Shader Editor's members dialog.
--   				Defining this method is [b]optional[/b]. If not overridden, the node will be filed under the root of the main category (see [method _get_category]).
_get_subcategory ::
                   (VisualShaderNodeCustom :< cls, Object :< cls) =>
                   cls -> IO GodotString
_get_subcategory cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCustom__get_subcategory
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)