{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JSONRPC
       (Godot.Core.JSONRPC._METHOD_NOT_FOUND,
        Godot.Core.JSONRPC._INTERNAL_ERROR,
        Godot.Core.JSONRPC._INVALID_REQUEST,
        Godot.Core.JSONRPC._PARSE_ERROR,
        Godot.Core.JSONRPC._INVALID_PARAMS,
        Godot.Core.JSONRPC.make_notification,
        Godot.Core.JSONRPC.make_request, Godot.Core.JSONRPC.make_response,
        Godot.Core.JSONRPC.make_response_error,
        Godot.Core.JSONRPC.process_action,
        Godot.Core.JSONRPC.process_string, Godot.Core.JSONRPC.set_scope)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_METHOD_NOT_FOUND :: Int
_METHOD_NOT_FOUND = -32601

_INTERNAL_ERROR :: Int
_INTERNAL_ERROR = -32603

_INVALID_REQUEST :: Int
_INVALID_REQUEST = -32600

_PARSE_ERROR :: Int
_PARSE_ERROR = -32700

_INVALID_PARAMS :: Int
_INVALID_PARAMS = -32602

{-# NOINLINE bindJSONRPC_make_notification #-}

bindJSONRPC_make_notification :: MethodBind
bindJSONRPC_make_notification
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_notification ::
                    (JSONRPC :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotVariant -> IO Dictionary
make_notification cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_make_notification (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONRPC_make_request #-}

bindJSONRPC_make_request :: MethodBind
bindJSONRPC_make_request
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_request" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_request ::
               (JSONRPC :< cls, Object :< cls) =>
               cls -> GodotString -> GodotVariant -> GodotVariant -> IO Dictionary
make_request cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_make_request (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONRPC_make_response #-}

bindJSONRPC_make_response :: MethodBind
bindJSONRPC_make_response
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_response" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_response ::
                (JSONRPC :< cls, Object :< cls) =>
                cls -> GodotVariant -> GodotVariant -> IO Dictionary
make_response cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_make_response (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONRPC_make_response_error #-}

bindJSONRPC_make_response_error :: MethodBind
bindJSONRPC_make_response_error
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_response_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_response_error ::
                      (JSONRPC :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> GodotVariant -> IO Dictionary
make_response_error cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_make_response_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONRPC_process_action #-}

bindJSONRPC_process_action :: MethodBind
bindJSONRPC_process_action
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "process_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

process_action ::
                 (JSONRPC :< cls, Object :< cls) =>
                 cls -> GodotVariant -> Bool -> IO GodotVariant
process_action cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_process_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONRPC_process_string #-}

bindJSONRPC_process_string :: MethodBind
bindJSONRPC_process_string
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "process_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

process_string ::
                 (JSONRPC :< cls, Object :< cls) =>
                 cls -> GodotString -> IO GodotString
process_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_process_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONRPC_set_scope #-}

bindJSONRPC_set_scope :: MethodBind
bindJSONRPC_set_scope
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "set_scope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_scope ::
            (JSONRPC :< cls, Object :< cls) =>
            cls -> GodotString -> Object -> IO ()
set_scope cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_set_scope (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)