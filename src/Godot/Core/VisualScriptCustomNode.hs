{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptCustomNode
       (Godot.Core.VisualScriptCustomNode._STEP_PUSH_STACK_BIT,
        Godot.Core.VisualScriptCustomNode._START_MODE_RESUME_YIELD,
        Godot.Core.VisualScriptCustomNode._STEP_EXIT_FUNCTION_BIT,
        Godot.Core.VisualScriptCustomNode._STEP_YIELD_BIT,
        Godot.Core.VisualScriptCustomNode._STEP_NO_ADVANCE_BIT,
        Godot.Core.VisualScriptCustomNode._START_MODE_BEGIN_SEQUENCE,
        Godot.Core.VisualScriptCustomNode._START_MODE_CONTINUE_SEQUENCE,
        Godot.Core.VisualScriptCustomNode._STEP_GO_BACK_BIT,
        Godot.Core.VisualScriptCustomNode._get_output_sequence_port_count,
        Godot.Core.VisualScriptCustomNode._has_input_sequence_port,
        Godot.Core.VisualScriptCustomNode._get_output_sequence_port_text,
        Godot.Core.VisualScriptCustomNode._get_input_value_port_count,
        Godot.Core.VisualScriptCustomNode._get_output_value_port_count,
        Godot.Core.VisualScriptCustomNode._get_input_value_port_type,
        Godot.Core.VisualScriptCustomNode._get_input_value_port_name,
        Godot.Core.VisualScriptCustomNode._get_output_value_port_type,
        Godot.Core.VisualScriptCustomNode._get_output_value_port_name,
        Godot.Core.VisualScriptCustomNode._get_caption,
        Godot.Core.VisualScriptCustomNode._get_text,
        Godot.Core.VisualScriptCustomNode._get_category,
        Godot.Core.VisualScriptCustomNode._get_working_memory_size,
        Godot.Core.VisualScriptCustomNode._step,
        Godot.Core.VisualScriptCustomNode._script_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STEP_PUSH_STACK_BIT :: Int
_STEP_PUSH_STACK_BIT = 16777216

_START_MODE_RESUME_YIELD :: Int
_START_MODE_RESUME_YIELD = 2

_STEP_EXIT_FUNCTION_BIT :: Int
_STEP_EXIT_FUNCTION_BIT = 134217728

_STEP_YIELD_BIT :: Int
_STEP_YIELD_BIT = 268435456

_STEP_NO_ADVANCE_BIT :: Int
_STEP_NO_ADVANCE_BIT = 67108864

_START_MODE_BEGIN_SEQUENCE :: Int
_START_MODE_BEGIN_SEQUENCE = 0

_START_MODE_CONTINUE_SEQUENCE :: Int
_START_MODE_CONTINUE_SEQUENCE = 1

_STEP_GO_BACK_BIT :: Int
_STEP_GO_BACK_BIT = 33554432

{-# NOINLINE bindVisualScriptCustomNode__get_output_sequence_port_count
             #-}

bindVisualScriptCustomNode__get_output_sequence_port_count ::
                                                           MethodBind
bindVisualScriptCustomNode__get_output_sequence_port_count
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_output_sequence_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_output_sequence_port_count ::
                                  (VisualScriptCustomNode :< cls, Object :< cls) => cls -> IO Int
_get_output_sequence_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_output_sequence_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__has_input_sequence_port
             #-}

bindVisualScriptCustomNode__has_input_sequence_port :: MethodBind
bindVisualScriptCustomNode__has_input_sequence_port
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_has_input_sequence_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_has_input_sequence_port ::
                           (VisualScriptCustomNode :< cls, Object :< cls) => cls -> IO Bool
_has_input_sequence_port cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__has_input_sequence_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_output_sequence_port_text
             #-}

bindVisualScriptCustomNode__get_output_sequence_port_text ::
                                                          MethodBind
bindVisualScriptCustomNode__get_output_sequence_port_text
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_output_sequence_port_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_output_sequence_port_text ::
                                 (VisualScriptCustomNode :< cls, Object :< cls) =>
                                 cls -> Int -> IO GodotString
_get_output_sequence_port_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_output_sequence_port_text
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_input_value_port_count
             #-}

bindVisualScriptCustomNode__get_input_value_port_count ::
                                                       MethodBind
bindVisualScriptCustomNode__get_input_value_port_count
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_input_value_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_input_value_port_count ::
                              (VisualScriptCustomNode :< cls, Object :< cls) => cls -> IO Int
_get_input_value_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_input_value_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_output_value_port_count
             #-}

bindVisualScriptCustomNode__get_output_value_port_count ::
                                                        MethodBind
bindVisualScriptCustomNode__get_output_value_port_count
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_output_value_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_output_value_port_count ::
                               (VisualScriptCustomNode :< cls, Object :< cls) => cls -> IO Int
_get_output_value_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_output_value_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_input_value_port_type
             #-}

bindVisualScriptCustomNode__get_input_value_port_type :: MethodBind
bindVisualScriptCustomNode__get_input_value_port_type
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_input_value_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_input_value_port_type ::
                             (VisualScriptCustomNode :< cls, Object :< cls) =>
                             cls -> Int -> IO Int
_get_input_value_port_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_input_value_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_input_value_port_name
             #-}

bindVisualScriptCustomNode__get_input_value_port_name :: MethodBind
bindVisualScriptCustomNode__get_input_value_port_name
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_input_value_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_input_value_port_name ::
                             (VisualScriptCustomNode :< cls, Object :< cls) =>
                             cls -> Int -> IO GodotString
_get_input_value_port_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_input_value_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_output_value_port_type
             #-}

bindVisualScriptCustomNode__get_output_value_port_type ::
                                                       MethodBind
bindVisualScriptCustomNode__get_output_value_port_type
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_output_value_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_output_value_port_type ::
                              (VisualScriptCustomNode :< cls, Object :< cls) =>
                              cls -> Int -> IO Int
_get_output_value_port_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_output_value_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_output_value_port_name
             #-}

bindVisualScriptCustomNode__get_output_value_port_name ::
                                                       MethodBind
bindVisualScriptCustomNode__get_output_value_port_name
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_output_value_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_output_value_port_name ::
                              (VisualScriptCustomNode :< cls, Object :< cls) =>
                              cls -> Int -> IO GodotString
_get_output_value_port_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_output_value_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_caption #-}

bindVisualScriptCustomNode__get_caption :: MethodBind
bindVisualScriptCustomNode__get_caption
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_caption ::
               (VisualScriptCustomNode :< cls, Object :< cls) =>
               cls -> IO GodotString
_get_caption cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptCustomNode__get_caption
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_text #-}

bindVisualScriptCustomNode__get_text :: MethodBind
bindVisualScriptCustomNode__get_text
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_text ::
            (VisualScriptCustomNode :< cls, Object :< cls) =>
            cls -> IO GodotString
_get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptCustomNode__get_text
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_category #-}

bindVisualScriptCustomNode__get_category :: MethodBind
bindVisualScriptCustomNode__get_category
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_category" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_category ::
                (VisualScriptCustomNode :< cls, Object :< cls) =>
                cls -> IO GodotString
_get_category cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptCustomNode__get_category
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__get_working_memory_size
             #-}

bindVisualScriptCustomNode__get_working_memory_size :: MethodBind
bindVisualScriptCustomNode__get_working_memory_size
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_get_working_memory_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_working_memory_size ::
                           (VisualScriptCustomNode :< cls, Object :< cls) => cls -> IO Int
_get_working_memory_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptCustomNode__get_working_memory_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__step #-}

bindVisualScriptCustomNode__step :: MethodBind
bindVisualScriptCustomNode__step
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_step ::
        (VisualScriptCustomNode :< cls, Object :< cls) =>
        cls -> Array -> Array -> Int -> Array -> IO GodotVariant
_step cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptCustomNode__step
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptCustomNode__script_changed #-}

bindVisualScriptCustomNode__script_changed :: MethodBind
bindVisualScriptCustomNode__script_changed
  = unsafePerformIO $
      withCString "VisualScriptCustomNode" $
        \ clsNamePtr ->
          withCString "_script_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_script_changed ::
                  (VisualScriptCustomNode :< cls, Object :< cls) => cls -> IO ()
_script_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptCustomNode__script_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)