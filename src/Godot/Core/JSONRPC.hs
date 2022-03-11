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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Object()

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

-- | Returns a dictionary in the form of a JSON-RPC notification. Notifications are one-shot messages which do not expect a response.
--   				- @method@: Name of the method being called.
--   				- @params@: An array or dictionary of parameters being passed to the method.
bindJSONRPC_make_notification :: MethodBind
bindJSONRPC_make_notification
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a dictionary in the form of a JSON-RPC notification. Notifications are one-shot messages which do not expect a response.
--   				- @method@: Name of the method being called.
--   				- @params@: An array or dictionary of parameters being passed to the method.
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

instance NodeMethod JSONRPC "make_notification"
           '[GodotString, GodotVariant]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.JSONRPC.make_notification

{-# NOINLINE bindJSONRPC_make_request #-}

-- | Returns a dictionary in the form of a JSON-RPC request. Requests are sent to a server with the expectation of a response. The ID field is used for the server to specify which exact request it is responding to.
--   				- @method@: Name of the method being called.
--   				- @params@: An array or dictionary of parameters being passed to the method.
--   				- @id@: Uniquely identifies this request. The server is expected to send a response with the same ID.
bindJSONRPC_make_request :: MethodBind
bindJSONRPC_make_request
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_request" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a dictionary in the form of a JSON-RPC request. Requests are sent to a server with the expectation of a response. The ID field is used for the server to specify which exact request it is responding to.
--   				- @method@: Name of the method being called.
--   				- @params@: An array or dictionary of parameters being passed to the method.
--   				- @id@: Uniquely identifies this request. The server is expected to send a response with the same ID.
make_request ::
               (JSONRPC :< cls, Object :< cls) =>
               cls -> GodotString -> GodotVariant -> GodotVariant -> IO Dictionary
make_request cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_make_request (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONRPC "make_request"
           '[GodotString, GodotVariant, GodotVariant]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.JSONRPC.make_request

{-# NOINLINE bindJSONRPC_make_response #-}

-- | When a server has received and processed a request, it is expected to send a response. If you did not want a response then you need to have sent a Notification instead.
--   				- @result@: The return value of the function which was called.
--   				- @id@: The ID of the request this response is targeted to.
bindJSONRPC_make_response :: MethodBind
bindJSONRPC_make_response
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_response" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When a server has received and processed a request, it is expected to send a response. If you did not want a response then you need to have sent a Notification instead.
--   				- @result@: The return value of the function which was called.
--   				- @id@: The ID of the request this response is targeted to.
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

instance NodeMethod JSONRPC "make_response"
           '[GodotVariant, GodotVariant]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.JSONRPC.make_response

{-# NOINLINE bindJSONRPC_make_response_error #-}

-- | Creates a response which indicates a previous reply has failed in some way.
--   				- @code@: The error code corresponding to what kind of error this is. See the @enum ErrorCode@ constants.
--   				- @message@: A custom message about this error.
--   				- @id@: The request this error is a response to.
bindJSONRPC_make_response_error :: MethodBind
bindJSONRPC_make_response_error
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "make_response_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a response which indicates a previous reply has failed in some way.
--   				- @code@: The error code corresponding to what kind of error this is. See the @enum ErrorCode@ constants.
--   				- @message@: A custom message about this error.
--   				- @id@: The request this error is a response to.
make_response_error ::
                      (JSONRPC :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> Maybe GodotVariant -> IO Dictionary
make_response_error cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_make_response_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONRPC "make_response_error"
           '[Int, GodotString, Maybe GodotVariant]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.JSONRPC.make_response_error

{-# NOINLINE bindJSONRPC_process_action #-}

-- | Given a Dictionary which takes the form of a JSON-RPC request: unpack the request and run it. Methods are resolved by looking at the field called "method" and looking for an equivalently named function in the JSONRPC object. If one is found that method is called.
--   				To add new supported methods extend the JSONRPC class and call @method process_action@ on your subclass.
--   				@action@: The action to be run, as a Dictionary in the form of a JSON-RPC request or notification.
bindJSONRPC_process_action :: MethodBind
bindJSONRPC_process_action
  = unsafePerformIO $
      withCString "JSONRPC" $
        \ clsNamePtr ->
          withCString "process_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Given a Dictionary which takes the form of a JSON-RPC request: unpack the request and run it. Methods are resolved by looking at the field called "method" and looking for an equivalently named function in the JSONRPC object. If one is found that method is called.
--   				To add new supported methods extend the JSONRPC class and call @method process_action@ on your subclass.
--   				@action@: The action to be run, as a Dictionary in the form of a JSON-RPC request or notification.
process_action ::
                 (JSONRPC :< cls, Object :< cls) =>
                 cls -> GodotVariant -> Maybe Bool -> IO GodotVariant
process_action cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONRPC_process_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSONRPC "process_action"
           '[GodotVariant, Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.JSONRPC.process_action

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

instance NodeMethod JSONRPC "process_string" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.JSONRPC.process_string

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

instance NodeMethod JSONRPC "set_scope" '[GodotString, Object]
           (IO ())
         where
        nodeMethod = Godot.Core.JSONRPC.set_scope