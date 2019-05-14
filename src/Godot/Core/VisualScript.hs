{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScript
       (Godot.Core.VisualScript.sig_node_ports_changed,
        Godot.Core.VisualScript._node_ports_changed,
        Godot.Core.VisualScript.add_function,
        Godot.Core.VisualScript.has_function,
        Godot.Core.VisualScript.remove_function,
        Godot.Core.VisualScript.rename_function,
        Godot.Core.VisualScript.set_function_scroll,
        Godot.Core.VisualScript.get_function_scroll,
        Godot.Core.VisualScript.add_node,
        Godot.Core.VisualScript.remove_node,
        Godot.Core.VisualScript.get_function_node_id,
        Godot.Core.VisualScript.get_node, Godot.Core.VisualScript.has_node,
        Godot.Core.VisualScript.set_node_position,
        Godot.Core.VisualScript.get_node_position,
        Godot.Core.VisualScript.sequence_connect,
        Godot.Core.VisualScript.sequence_disconnect,
        Godot.Core.VisualScript.has_sequence_connection,
        Godot.Core.VisualScript.data_connect,
        Godot.Core.VisualScript.data_disconnect,
        Godot.Core.VisualScript.has_data_connection,
        Godot.Core.VisualScript.add_variable,
        Godot.Core.VisualScript.has_variable,
        Godot.Core.VisualScript.remove_variable,
        Godot.Core.VisualScript.set_variable_default_value,
        Godot.Core.VisualScript.get_variable_default_value,
        Godot.Core.VisualScript.set_variable_info,
        Godot.Core.VisualScript.get_variable_info,
        Godot.Core.VisualScript.set_variable_export,
        Godot.Core.VisualScript.get_variable_export,
        Godot.Core.VisualScript.rename_variable,
        Godot.Core.VisualScript.add_custom_signal,
        Godot.Core.VisualScript.has_custom_signal,
        Godot.Core.VisualScript.custom_signal_add_argument,
        Godot.Core.VisualScript.custom_signal_set_argument_type,
        Godot.Core.VisualScript.custom_signal_get_argument_type,
        Godot.Core.VisualScript.custom_signal_set_argument_name,
        Godot.Core.VisualScript.custom_signal_get_argument_name,
        Godot.Core.VisualScript.custom_signal_remove_argument,
        Godot.Core.VisualScript.custom_signal_get_argument_count,
        Godot.Core.VisualScript.custom_signal_swap_argument,
        Godot.Core.VisualScript.remove_custom_signal,
        Godot.Core.VisualScript.rename_custom_signal,
        Godot.Core.VisualScript.set_instance_base_type,
        Godot.Core.VisualScript._set_data,
        Godot.Core.VisualScript._get_data)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_node_ports_changed ::
                       Godot.Internal.Dispatch.Signal VisualScript
sig_node_ports_changed
  = Godot.Internal.Dispatch.Signal "node_ports_changed"

{-# NOINLINE bindVisualScript__node_ports_changed #-}

bindVisualScript__node_ports_changed :: MethodBind
bindVisualScript__node_ports_changed
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "_node_ports_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_ports_changed ::
                      (VisualScript :< cls, Object :< cls) => cls -> Int -> IO ()
_node_ports_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript__node_ports_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_add_function #-}

bindVisualScript_add_function :: MethodBind
bindVisualScript_add_function
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "add_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_function ::
               (VisualScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_add_function (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_has_function #-}

bindVisualScript_has_function :: MethodBind
bindVisualScript_has_function
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "has_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_function ::
               (VisualScript :< cls, Object :< cls) =>
               cls -> GodotString -> IO Bool
has_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_has_function (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_remove_function #-}

bindVisualScript_remove_function :: MethodBind
bindVisualScript_remove_function
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "remove_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_function ::
                  (VisualScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_remove_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_rename_function #-}

bindVisualScript_rename_function :: MethodBind
bindVisualScript_rename_function
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "rename_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rename_function ::
                  (VisualScript :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> IO ()
rename_function cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_rename_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_set_function_scroll #-}

bindVisualScript_set_function_scroll :: MethodBind
bindVisualScript_set_function_scroll
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "set_function_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function_scroll ::
                      (VisualScript :< cls, Object :< cls) =>
                      cls -> GodotString -> Vector2 -> IO ()
set_function_scroll cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_set_function_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_function_scroll #-}

bindVisualScript_get_function_scroll :: MethodBind
bindVisualScript_get_function_scroll
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_function_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function_scroll ::
                      (VisualScript :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Vector2
get_function_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_function_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_add_node #-}

bindVisualScript_add_node :: MethodBind
bindVisualScript_add_node
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_node ::
           (VisualScript :< cls, Object :< cls) =>
           cls -> GodotString -> Int -> VisualScriptNode -> Vector2 -> IO ()
add_node cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_add_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_remove_node #-}

bindVisualScript_remove_node :: MethodBind
bindVisualScript_remove_node
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_node ::
              (VisualScript :< cls, Object :< cls) =>
              cls -> GodotString -> Int -> IO ()
remove_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_remove_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_function_node_id #-}

bindVisualScript_get_function_node_id :: MethodBind
bindVisualScript_get_function_node_id
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_function_node_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function_node_id ::
                       (VisualScript :< cls, Object :< cls) =>
                       cls -> GodotString -> IO Int
get_function_node_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_function_node_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_node #-}

bindVisualScript_get_node :: MethodBind
bindVisualScript_get_node
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_node ::
           (VisualScript :< cls, Object :< cls) =>
           cls -> GodotString -> Int -> IO VisualScriptNode
get_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_has_node #-}

bindVisualScript_has_node :: MethodBind
bindVisualScript_has_node
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "has_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_node ::
           (VisualScript :< cls, Object :< cls) =>
           cls -> GodotString -> Int -> IO Bool
has_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_has_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_set_node_position #-}

bindVisualScript_set_node_position :: MethodBind
bindVisualScript_set_node_position
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "set_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_node_position ::
                    (VisualScript :< cls, Object :< cls) =>
                    cls -> GodotString -> Int -> Vector2 -> IO ()
set_node_position cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_set_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_node_position #-}

bindVisualScript_get_node_position :: MethodBind
bindVisualScript_get_node_position
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_node_position ::
                    (VisualScript :< cls, Object :< cls) =>
                    cls -> GodotString -> Int -> IO Vector2
get_node_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_sequence_connect #-}

bindVisualScript_sequence_connect :: MethodBind
bindVisualScript_sequence_connect
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "sequence_connect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

sequence_connect ::
                   (VisualScript :< cls, Object :< cls) =>
                   cls -> GodotString -> Int -> Int -> Int -> IO ()
sequence_connect cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_sequence_connect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_sequence_disconnect #-}

bindVisualScript_sequence_disconnect :: MethodBind
bindVisualScript_sequence_disconnect
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "sequence_disconnect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

sequence_disconnect ::
                      (VisualScript :< cls, Object :< cls) =>
                      cls -> GodotString -> Int -> Int -> Int -> IO ()
sequence_disconnect cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_sequence_disconnect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_has_sequence_connection #-}

bindVisualScript_has_sequence_connection :: MethodBind
bindVisualScript_has_sequence_connection
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "has_sequence_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_sequence_connection ::
                          (VisualScript :< cls, Object :< cls) =>
                          cls -> GodotString -> Int -> Int -> Int -> IO Bool
has_sequence_connection cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_has_sequence_connection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_data_connect #-}

bindVisualScript_data_connect :: MethodBind
bindVisualScript_data_connect
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "data_connect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

data_connect ::
               (VisualScript :< cls, Object :< cls) =>
               cls -> GodotString -> Int -> Int -> Int -> Int -> IO ()
data_connect cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_data_connect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_data_disconnect #-}

bindVisualScript_data_disconnect :: MethodBind
bindVisualScript_data_disconnect
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "data_disconnect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

data_disconnect ::
                  (VisualScript :< cls, Object :< cls) =>
                  cls -> GodotString -> Int -> Int -> Int -> Int -> IO ()
data_disconnect cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_data_disconnect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_has_data_connection #-}

bindVisualScript_has_data_connection :: MethodBind
bindVisualScript_has_data_connection
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "has_data_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_data_connection ::
                      (VisualScript :< cls, Object :< cls) =>
                      cls -> GodotString -> Int -> Int -> Int -> Int -> IO Bool
has_data_connection cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_has_data_connection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_add_variable #-}

bindVisualScript_add_variable :: MethodBind
bindVisualScript_add_variable
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "add_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_variable ::
               (VisualScript :< cls, Object :< cls) =>
               cls -> GodotString -> GodotVariant -> Bool -> IO ()
add_variable cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_add_variable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_has_variable #-}

bindVisualScript_has_variable :: MethodBind
bindVisualScript_has_variable
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "has_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_variable ::
               (VisualScript :< cls, Object :< cls) =>
               cls -> GodotString -> IO Bool
has_variable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_has_variable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_remove_variable #-}

bindVisualScript_remove_variable :: MethodBind
bindVisualScript_remove_variable
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "remove_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_variable ::
                  (VisualScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_variable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_remove_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_set_variable_default_value #-}

bindVisualScript_set_variable_default_value :: MethodBind
bindVisualScript_set_variable_default_value
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "set_variable_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable_default_value ::
                             (VisualScript :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotVariant -> IO ()
set_variable_default_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_set_variable_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_variable_default_value #-}

bindVisualScript_get_variable_default_value :: MethodBind
bindVisualScript_get_variable_default_value
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_variable_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable_default_value ::
                             (VisualScript :< cls, Object :< cls) =>
                             cls -> GodotString -> IO GodotVariant
get_variable_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_variable_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_set_variable_info #-}

bindVisualScript_set_variable_info :: MethodBind
bindVisualScript_set_variable_info
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "set_variable_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable_info ::
                    (VisualScript :< cls, Object :< cls) =>
                    cls -> GodotString -> Dictionary -> IO ()
set_variable_info cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_set_variable_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_variable_info #-}

bindVisualScript_get_variable_info :: MethodBind
bindVisualScript_get_variable_info
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_variable_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable_info ::
                    (VisualScript :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Dictionary
get_variable_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_variable_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_set_variable_export #-}

bindVisualScript_set_variable_export :: MethodBind
bindVisualScript_set_variable_export
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "set_variable_export" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable_export ::
                      (VisualScript :< cls, Object :< cls) =>
                      cls -> GodotString -> Bool -> IO ()
set_variable_export cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_set_variable_export
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_get_variable_export #-}

bindVisualScript_get_variable_export :: MethodBind
bindVisualScript_get_variable_export
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "get_variable_export" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable_export ::
                      (VisualScript :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Bool
get_variable_export cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_get_variable_export
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_rename_variable #-}

bindVisualScript_rename_variable :: MethodBind
bindVisualScript_rename_variable
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "rename_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rename_variable ::
                  (VisualScript :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> IO ()
rename_variable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_rename_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_add_custom_signal #-}

bindVisualScript_add_custom_signal :: MethodBind
bindVisualScript_add_custom_signal
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "add_custom_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_custom_signal ::
                    (VisualScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_custom_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_add_custom_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_has_custom_signal #-}

bindVisualScript_has_custom_signal :: MethodBind
bindVisualScript_has_custom_signal
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "has_custom_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_custom_signal ::
                    (VisualScript :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Bool
has_custom_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_has_custom_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_add_argument #-}

bindVisualScript_custom_signal_add_argument :: MethodBind
bindVisualScript_custom_signal_add_argument
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_add_argument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_add_argument ::
                             (VisualScript :< cls, Object :< cls) =>
                             cls -> GodotString -> Int -> GodotString -> Int -> IO ()
custom_signal_add_argument cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_custom_signal_add_argument
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_set_argument_type #-}

bindVisualScript_custom_signal_set_argument_type :: MethodBind
bindVisualScript_custom_signal_set_argument_type
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_set_argument_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_set_argument_type ::
                                  (VisualScript :< cls, Object :< cls) =>
                                  cls -> GodotString -> Int -> Int -> IO ()
custom_signal_set_argument_type cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScript_custom_signal_set_argument_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_get_argument_type #-}

bindVisualScript_custom_signal_get_argument_type :: MethodBind
bindVisualScript_custom_signal_get_argument_type
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_get_argument_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_get_argument_type ::
                                  (VisualScript :< cls, Object :< cls) =>
                                  cls -> GodotString -> Int -> IO Int
custom_signal_get_argument_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScript_custom_signal_get_argument_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_set_argument_name #-}

bindVisualScript_custom_signal_set_argument_name :: MethodBind
bindVisualScript_custom_signal_set_argument_name
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_set_argument_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_set_argument_name ::
                                  (VisualScript :< cls, Object :< cls) =>
                                  cls -> GodotString -> Int -> GodotString -> IO ()
custom_signal_set_argument_name cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScript_custom_signal_set_argument_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_get_argument_name #-}

bindVisualScript_custom_signal_get_argument_name :: MethodBind
bindVisualScript_custom_signal_get_argument_name
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_get_argument_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_get_argument_name ::
                                  (VisualScript :< cls, Object :< cls) =>
                                  cls -> GodotString -> Int -> IO GodotString
custom_signal_get_argument_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScript_custom_signal_get_argument_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_remove_argument #-}

bindVisualScript_custom_signal_remove_argument :: MethodBind
bindVisualScript_custom_signal_remove_argument
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_remove_argument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_remove_argument ::
                                (VisualScript :< cls, Object :< cls) =>
                                cls -> GodotString -> Int -> IO ()
custom_signal_remove_argument cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScript_custom_signal_remove_argument
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_get_argument_count #-}

bindVisualScript_custom_signal_get_argument_count :: MethodBind
bindVisualScript_custom_signal_get_argument_count
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_get_argument_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_get_argument_count ::
                                   (VisualScript :< cls, Object :< cls) =>
                                   cls -> GodotString -> IO Int
custom_signal_get_argument_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScript_custom_signal_get_argument_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_custom_signal_swap_argument #-}

bindVisualScript_custom_signal_swap_argument :: MethodBind
bindVisualScript_custom_signal_swap_argument
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "custom_signal_swap_argument" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

custom_signal_swap_argument ::
                              (VisualScript :< cls, Object :< cls) =>
                              cls -> GodotString -> Int -> Int -> IO ()
custom_signal_swap_argument cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_custom_signal_swap_argument
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_remove_custom_signal #-}

bindVisualScript_remove_custom_signal :: MethodBind
bindVisualScript_remove_custom_signal
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "remove_custom_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_custom_signal ::
                       (VisualScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_custom_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_remove_custom_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_rename_custom_signal #-}

bindVisualScript_rename_custom_signal :: MethodBind
bindVisualScript_rename_custom_signal
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "rename_custom_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rename_custom_signal ::
                       (VisualScript :< cls, Object :< cls) =>
                       cls -> GodotString -> GodotString -> IO ()
rename_custom_signal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_rename_custom_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript_set_instance_base_type #-}

bindVisualScript_set_instance_base_type :: MethodBind
bindVisualScript_set_instance_base_type
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "set_instance_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_instance_base_type ::
                         (VisualScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_instance_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript_set_instance_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript__set_data #-}

bindVisualScript__set_data :: MethodBind
bindVisualScript__set_data
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (VisualScript :< cls, Object :< cls) => cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript__set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScript__get_data #-}

bindVisualScript__get_data :: MethodBind
bindVisualScript__get_data
  = unsafePerformIO $
      withCString "VisualScript" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (VisualScript :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScript__get_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)