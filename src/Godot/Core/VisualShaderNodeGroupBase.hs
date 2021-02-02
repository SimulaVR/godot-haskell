{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeGroupBase
       (Godot.Core.VisualShaderNodeGroupBase.add_input_port,
        Godot.Core.VisualShaderNodeGroupBase.add_output_port,
        Godot.Core.VisualShaderNodeGroupBase.clear_input_ports,
        Godot.Core.VisualShaderNodeGroupBase.clear_output_ports,
        Godot.Core.VisualShaderNodeGroupBase.get_free_input_port_id,
        Godot.Core.VisualShaderNodeGroupBase.get_free_output_port_id,
        Godot.Core.VisualShaderNodeGroupBase.get_input_port_count,
        Godot.Core.VisualShaderNodeGroupBase.get_inputs,
        Godot.Core.VisualShaderNodeGroupBase.get_output_port_count,
        Godot.Core.VisualShaderNodeGroupBase.get_outputs,
        Godot.Core.VisualShaderNodeGroupBase.get_size,
        Godot.Core.VisualShaderNodeGroupBase.has_input_port,
        Godot.Core.VisualShaderNodeGroupBase.has_output_port,
        Godot.Core.VisualShaderNodeGroupBase.is_valid_port_name,
        Godot.Core.VisualShaderNodeGroupBase.remove_input_port,
        Godot.Core.VisualShaderNodeGroupBase.remove_output_port,
        Godot.Core.VisualShaderNodeGroupBase.set_input_port_name,
        Godot.Core.VisualShaderNodeGroupBase.set_input_port_type,
        Godot.Core.VisualShaderNodeGroupBase.set_inputs,
        Godot.Core.VisualShaderNodeGroupBase.set_output_port_name,
        Godot.Core.VisualShaderNodeGroupBase.set_output_port_type,
        Godot.Core.VisualShaderNodeGroupBase.set_outputs,
        Godot.Core.VisualShaderNodeGroupBase.set_size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualShaderNodeGroupBase_add_input_port #-}

bindVisualShaderNodeGroupBase_add_input_port :: MethodBind
bindVisualShaderNodeGroupBase_add_input_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "add_input_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_input_port ::
                 (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                 cls -> Int -> Int -> GodotString -> IO ()
add_input_port cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_add_input_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_add_output_port #-}

bindVisualShaderNodeGroupBase_add_output_port :: MethodBind
bindVisualShaderNodeGroupBase_add_output_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "add_output_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_output_port ::
                  (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                  cls -> Int -> Int -> GodotString -> IO ()
add_output_port cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_add_output_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_clear_input_ports #-}

bindVisualShaderNodeGroupBase_clear_input_ports :: MethodBind
bindVisualShaderNodeGroupBase_clear_input_ports
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "clear_input_ports" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_input_ports ::
                    (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO ()
clear_input_ports cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_clear_input_ports
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_clear_output_ports #-}

bindVisualShaderNodeGroupBase_clear_output_ports :: MethodBind
bindVisualShaderNodeGroupBase_clear_output_ports
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "clear_output_ports" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_output_ports ::
                     (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO ()
clear_output_ports cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_clear_output_ports
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_free_input_port_id
             #-}

bindVisualShaderNodeGroupBase_get_free_input_port_id :: MethodBind
bindVisualShaderNodeGroupBase_get_free_input_port_id
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_free_input_port_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_free_input_port_id ::
                         (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_free_input_port_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_free_input_port_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_free_output_port_id
             #-}

bindVisualShaderNodeGroupBase_get_free_output_port_id :: MethodBind
bindVisualShaderNodeGroupBase_get_free_output_port_id
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_free_output_port_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_free_output_port_id ::
                          (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_free_output_port_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_free_output_port_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_input_port_count #-}

bindVisualShaderNodeGroupBase_get_input_port_count :: MethodBind
bindVisualShaderNodeGroupBase_get_input_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_input_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_port_count ::
                       (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_input_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_input_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_inputs #-}

bindVisualShaderNodeGroupBase_get_inputs :: MethodBind
bindVisualShaderNodeGroupBase_get_inputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inputs ::
             (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
             cls -> IO GodotString
get_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_get_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_output_port_count
             #-}

bindVisualShaderNodeGroupBase_get_output_port_count :: MethodBind
bindVisualShaderNodeGroupBase_get_output_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_output_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_output_port_count ::
                        (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_output_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_output_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_outputs #-}

bindVisualShaderNodeGroupBase_get_outputs :: MethodBind
bindVisualShaderNodeGroupBase_get_outputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_outputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_outputs ::
              (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
              cls -> IO GodotString
get_outputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_get_outputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_get_size #-}

bindVisualShaderNodeGroupBase_get_size :: MethodBind
bindVisualShaderNodeGroupBase_get_size
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size ::
           (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
           cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_get_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_has_input_port #-}

bindVisualShaderNodeGroupBase_has_input_port :: MethodBind
bindVisualShaderNodeGroupBase_has_input_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "has_input_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_input_port ::
                 (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                 cls -> Int -> IO Bool
has_input_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_has_input_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_has_output_port #-}

bindVisualShaderNodeGroupBase_has_output_port :: MethodBind
bindVisualShaderNodeGroupBase_has_output_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "has_output_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_output_port ::
                  (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                  cls -> Int -> IO Bool
has_output_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_has_output_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_is_valid_port_name #-}

bindVisualShaderNodeGroupBase_is_valid_port_name :: MethodBind
bindVisualShaderNodeGroupBase_is_valid_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "is_valid_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_valid_port_name ::
                     (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                     cls -> GodotString -> IO Bool
is_valid_port_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_is_valid_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_remove_input_port #-}

bindVisualShaderNodeGroupBase_remove_input_port :: MethodBind
bindVisualShaderNodeGroupBase_remove_input_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "remove_input_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_input_port ::
                    (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
remove_input_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_remove_input_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_remove_output_port #-}

bindVisualShaderNodeGroupBase_remove_output_port :: MethodBind
bindVisualShaderNodeGroupBase_remove_output_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "remove_output_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_output_port ::
                     (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
remove_output_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_remove_output_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_input_port_name #-}

bindVisualShaderNodeGroupBase_set_input_port_name :: MethodBind
bindVisualShaderNodeGroupBase_set_input_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_input_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_port_name ::
                      (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> IO ()
set_input_port_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_input_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_input_port_type #-}

bindVisualShaderNodeGroupBase_set_input_port_type :: MethodBind
bindVisualShaderNodeGroupBase_set_input_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_input_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_port_type ::
                      (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                      cls -> Int -> Int -> IO ()
set_input_port_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_input_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_inputs #-}

bindVisualShaderNodeGroupBase_set_inputs :: MethodBind
bindVisualShaderNodeGroupBase_set_inputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_inputs ::
             (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_inputs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_set_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_output_port_name #-}

bindVisualShaderNodeGroupBase_set_output_port_name :: MethodBind
bindVisualShaderNodeGroupBase_set_output_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_output_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_output_port_name ::
                       (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                       cls -> Int -> GodotString -> IO ()
set_output_port_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_output_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_output_port_type #-}

bindVisualShaderNodeGroupBase_set_output_port_type :: MethodBind
bindVisualShaderNodeGroupBase_set_output_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_output_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_output_port_type ::
                       (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                       cls -> Int -> Int -> IO ()
set_output_port_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_output_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_outputs #-}

bindVisualShaderNodeGroupBase_set_outputs :: MethodBind
bindVisualShaderNodeGroupBase_set_outputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_outputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_outputs ::
              (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_outputs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_set_outputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeGroupBase_set_size #-}

bindVisualShaderNodeGroupBase_set_size :: MethodBind
bindVisualShaderNodeGroupBase_set_size
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_size ::
           (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_set_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)