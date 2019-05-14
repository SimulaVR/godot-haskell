{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.WebSocketServer
       (Godot.Core.WebSocketServer.sig_client_close_request,
        Godot.Core.WebSocketServer.sig_data_received,
        Godot.Core.WebSocketServer.sig_client_connected,
        Godot.Core.WebSocketServer.sig_client_disconnected,
        Godot.Core.WebSocketServer.is_listening,
        Godot.Core.WebSocketServer.listen, Godot.Core.WebSocketServer.stop,
        Godot.Core.WebSocketServer.has_peer,
        Godot.Core.WebSocketServer.get_peer_address,
        Godot.Core.WebSocketServer.get_peer_port,
        Godot.Core.WebSocketServer.disconnect_peer)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_client_close_request ::
                         Godot.Internal.Dispatch.Signal WebSocketServer
sig_client_close_request
  = Godot.Internal.Dispatch.Signal "client_close_request"

sig_data_received :: Godot.Internal.Dispatch.Signal WebSocketServer
sig_data_received = Godot.Internal.Dispatch.Signal "data_received"

sig_client_connected ::
                     Godot.Internal.Dispatch.Signal WebSocketServer
sig_client_connected
  = Godot.Internal.Dispatch.Signal "client_connected"

sig_client_disconnected ::
                        Godot.Internal.Dispatch.Signal WebSocketServer
sig_client_disconnected
  = Godot.Internal.Dispatch.Signal "client_disconnected"

{-# NOINLINE bindWebSocketServer_is_listening #-}

bindWebSocketServer_is_listening :: MethodBind
bindWebSocketServer_is_listening
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "is_listening" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_listening ::
               (WebSocketServer :< cls, Object :< cls) => cls -> IO Bool
is_listening cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_is_listening
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketServer_listen #-}

bindWebSocketServer_listen :: MethodBind
bindWebSocketServer_listen
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "listen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

listen ::
         (WebSocketServer :< cls, Object :< cls) =>
         cls -> Int -> PoolStringArray -> Bool -> IO Int
listen cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_listen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketServer_stop #-}

bindWebSocketServer_stop :: MethodBind
bindWebSocketServer_stop
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

stop :: (WebSocketServer :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketServer_has_peer #-}

bindWebSocketServer_has_peer :: MethodBind
bindWebSocketServer_has_peer
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "has_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_peer ::
           (WebSocketServer :< cls, Object :< cls) => cls -> Int -> IO Bool
has_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_has_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketServer_get_peer_address #-}

bindWebSocketServer_get_peer_address :: MethodBind
bindWebSocketServer_get_peer_address
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_peer_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer_address ::
                   (WebSocketServer :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotString
get_peer_address cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_peer_address
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketServer_get_peer_port #-}

bindWebSocketServer_get_peer_port :: MethodBind
bindWebSocketServer_get_peer_port
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_peer_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer_port ::
                (WebSocketServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_peer_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_peer_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebSocketServer_disconnect_peer #-}

bindWebSocketServer_disconnect_peer :: MethodBind
bindWebSocketServer_disconnect_peer
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "disconnect_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

disconnect_peer ::
                  (WebSocketServer :< cls, Object :< cls) =>
                  cls -> Int -> Int -> GodotString -> IO ()
disconnect_peer cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_disconnect_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)