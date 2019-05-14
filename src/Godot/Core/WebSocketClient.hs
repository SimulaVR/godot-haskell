{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.WebSocketClient
       (Godot.Core.WebSocketClient.sig_server_close_request,
        Godot.Core.WebSocketClient.sig_connection_established,
        Godot.Core.WebSocketClient.sig_data_received,
        Godot.Core.WebSocketClient.sig_connection_error,
        Godot.Core.WebSocketClient.sig_connection_closed,
        Godot.Core.WebSocketClient.connect_to_url,
        Godot.Core.WebSocketClient.disconnect_from_host,
        Godot.Core.WebSocketClient.set_verify_ssl_enabled,
        Godot.Core.WebSocketClient.is_verify_ssl_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_server_close_request ::
                         Godot.Internal.Dispatch.Signal WebSocketClient
sig_server_close_request
  = Godot.Internal.Dispatch.Signal "server_close_request"

sig_connection_established ::
                           Godot.Internal.Dispatch.Signal WebSocketClient
sig_connection_established
  = Godot.Internal.Dispatch.Signal "connection_established"

sig_data_received :: Godot.Internal.Dispatch.Signal WebSocketClient
sig_data_received = Godot.Internal.Dispatch.Signal "data_received"

sig_connection_error ::
                     Godot.Internal.Dispatch.Signal WebSocketClient
sig_connection_error
  = Godot.Internal.Dispatch.Signal "connection_error"

sig_connection_closed ::
                      Godot.Internal.Dispatch.Signal WebSocketClient
sig_connection_closed
  = Godot.Internal.Dispatch.Signal "connection_closed"

{-# NOINLINE bindWebSocketClient_connect_to_url #-}

bindWebSocketClient_connect_to_url :: MethodBind
bindWebSocketClient_connect_to_url
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "connect_to_url" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

connect_to_url ::
                 (WebSocketClient :< cls, Object :< cls) =>
                 cls -> GodotString -> PoolStringArray -> Bool -> IO Int
connect_to_url cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketClient_connect_to_url
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketClient_disconnect_from_host #-}

bindWebSocketClient_disconnect_from_host :: MethodBind
bindWebSocketClient_disconnect_from_host
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "disconnect_from_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

disconnect_from_host ::
                       (WebSocketClient :< cls, Object :< cls) =>
                       cls -> Int -> GodotString -> IO ()
disconnect_from_host cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketClient_disconnect_from_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketClient_set_verify_ssl_enabled #-}

bindWebSocketClient_set_verify_ssl_enabled :: MethodBind
bindWebSocketClient_set_verify_ssl_enabled
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "set_verify_ssl_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_verify_ssl_enabled ::
                         (WebSocketClient :< cls, Object :< cls) => cls -> Bool -> IO ()
set_verify_ssl_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketClient_set_verify_ssl_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketClient_is_verify_ssl_enabled #-}

bindWebSocketClient_is_verify_ssl_enabled :: MethodBind
bindWebSocketClient_is_verify_ssl_enabled
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "is_verify_ssl_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_verify_ssl_enabled ::
                        (WebSocketClient :< cls, Object :< cls) => cls -> IO Bool
is_verify_ssl_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketClient_is_verify_ssl_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)