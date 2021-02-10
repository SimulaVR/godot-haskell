{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WebSocketClient
       (Godot.Core.WebSocketClient.sig_connection_closed,
        Godot.Core.WebSocketClient.sig_connection_error,
        Godot.Core.WebSocketClient.sig_connection_established,
        Godot.Core.WebSocketClient.sig_data_received,
        Godot.Core.WebSocketClient.sig_server_close_request,
        Godot.Core.WebSocketClient.connect_to_url,
        Godot.Core.WebSocketClient.disconnect_from_host,
        Godot.Core.WebSocketClient.get_connected_host,
        Godot.Core.WebSocketClient.get_connected_port,
        Godot.Core.WebSocketClient.get_trusted_ssl_certificate,
        Godot.Core.WebSocketClient.is_verify_ssl_enabled,
        Godot.Core.WebSocketClient.set_trusted_ssl_certificate,
        Godot.Core.WebSocketClient.set_verify_ssl_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_connection_closed ::
                      Godot.Internal.Dispatch.Signal WebSocketClient
sig_connection_closed
  = Godot.Internal.Dispatch.Signal "connection_closed"

instance NodeSignal WebSocketClient "connection_closed" '[Bool]

sig_connection_error ::
                     Godot.Internal.Dispatch.Signal WebSocketClient
sig_connection_error
  = Godot.Internal.Dispatch.Signal "connection_error"

instance NodeSignal WebSocketClient "connection_error" '[]

sig_connection_established ::
                           Godot.Internal.Dispatch.Signal WebSocketClient
sig_connection_established
  = Godot.Internal.Dispatch.Signal "connection_established"

instance NodeSignal WebSocketClient "connection_established"
           '[GodotString]

sig_data_received :: Godot.Internal.Dispatch.Signal WebSocketClient
sig_data_received = Godot.Internal.Dispatch.Signal "data_received"

instance NodeSignal WebSocketClient "data_received" '[]

sig_server_close_request ::
                         Godot.Internal.Dispatch.Signal WebSocketClient
sig_server_close_request
  = Godot.Internal.Dispatch.Signal "server_close_request"

instance NodeSignal WebSocketClient "server_close_request"
           '[Int, GodotString]

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
                 cls ->
                   GodotString -> PoolStringArray -> Bool -> PoolStringArray -> IO Int
connect_to_url cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
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

{-# NOINLINE bindWebSocketClient_get_connected_host #-}

bindWebSocketClient_get_connected_host :: MethodBind
bindWebSocketClient_get_connected_host
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "get_connected_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_connected_host ::
                     (WebSocketClient :< cls, Object :< cls) => cls -> IO GodotString
get_connected_host cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketClient_get_connected_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketClient_get_connected_port #-}

bindWebSocketClient_get_connected_port :: MethodBind
bindWebSocketClient_get_connected_port
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "get_connected_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_connected_port ::
                     (WebSocketClient :< cls, Object :< cls) => cls -> IO Int
get_connected_port cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketClient_get_connected_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketClient_get_trusted_ssl_certificate #-}

bindWebSocketClient_get_trusted_ssl_certificate :: MethodBind
bindWebSocketClient_get_trusted_ssl_certificate
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "get_trusted_ssl_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_trusted_ssl_certificate ::
                              (WebSocketClient :< cls, Object :< cls) =>
                              cls -> IO X509Certificate
get_trusted_ssl_certificate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindWebSocketClient_get_trusted_ssl_certificate
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

{-# NOINLINE bindWebSocketClient_set_trusted_ssl_certificate #-}

bindWebSocketClient_set_trusted_ssl_certificate :: MethodBind
bindWebSocketClient_set_trusted_ssl_certificate
  = unsafePerformIO $
      withCString "WebSocketClient" $
        \ clsNamePtr ->
          withCString "set_trusted_ssl_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_trusted_ssl_certificate ::
                              (WebSocketClient :< cls, Object :< cls) =>
                              cls -> X509Certificate -> IO ()
set_trusted_ssl_certificate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindWebSocketClient_set_trusted_ssl_certificate
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