{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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

bindVisualShaderNodeCustom__get_category :: MethodBind
bindVisualShaderNodeCustom__get_category
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_category" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_code :: MethodBind
bindVisualShaderNodeCustom__get_code
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_description :: MethodBind
bindVisualShaderNodeCustom__get_description
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_global_code :: MethodBind
bindVisualShaderNodeCustom__get_global_code
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_global_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_input_port_count :: MethodBind
bindVisualShaderNodeCustom__get_input_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_input_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_input_port_name :: MethodBind
bindVisualShaderNodeCustom__get_input_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_input_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_input_port_type :: MethodBind
bindVisualShaderNodeCustom__get_input_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_input_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_name :: MethodBind
bindVisualShaderNodeCustom__get_name
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_output_port_count :: MethodBind
bindVisualShaderNodeCustom__get_output_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_output_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_output_port_name :: MethodBind
bindVisualShaderNodeCustom__get_output_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_output_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_output_port_type :: MethodBind
bindVisualShaderNodeCustom__get_output_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_output_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_return_icon_type :: MethodBind
bindVisualShaderNodeCustom__get_return_icon_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_return_icon_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

bindVisualShaderNodeCustom__get_subcategory :: MethodBind
bindVisualShaderNodeCustom__get_subcategory
  = unsafePerformIO $
      withCString "VisualShaderNodeCustom" $
        \ clsNamePtr ->
          withCString "_get_subcategory" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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