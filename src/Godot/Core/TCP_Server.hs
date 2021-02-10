{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TCP_Server
       (Godot.Core.TCP_Server.is_connection_available,
        Godot.Core.TCP_Server.is_listening, Godot.Core.TCP_Server.listen,
        Godot.Core.TCP_Server.stop, Godot.Core.TCP_Server.take_connection)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindTCP_Server_is_connection_available #-}

-- | Returns [code]true[/code] if a connection is available for taking.
bindTCP_Server_is_connection_available :: MethodBind
bindTCP_Server_is_connection_available
  = unsafePerformIO $
      withCString "TCP_Server" $
        \ clsNamePtr ->
          withCString "is_connection_available" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if a connection is available for taking.
is_connection_available ::
                          (TCP_Server :< cls, Object :< cls) => cls -> IO Bool
is_connection_available cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTCP_Server_is_connection_available
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTCP_Server_is_listening #-}

-- | Returns [code]true[/code] if the server is currently listening for connections.
bindTCP_Server_is_listening :: MethodBind
bindTCP_Server_is_listening
  = unsafePerformIO $
      withCString "TCP_Server" $
        \ clsNamePtr ->
          withCString "is_listening" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the server is currently listening for connections.
is_listening ::
               (TCP_Server :< cls, Object :< cls) => cls -> IO Bool
is_listening cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTCP_Server_is_listening (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTCP_Server_listen #-}

-- | Listen on the [code]port[/code] binding to [code]bind_address[/code].
--   				If [code]bind_address[/code] is set as [code]"*"[/code] (default), the server will listen on all available addresses (both IPv4 and IPv6).
--   				If [code]bind_address[/code] is set as [code]"0.0.0.0"[/code] (for IPv4) or [code]"::"[/code] (for IPv6), the server will listen on all available addresses matching that IP type.
--   				If [code]bind_address[/code] is set to any valid address (e.g. [code]"192.168.1.101"[/code], [code]"::1"[/code], etc), the server will only listen on the interface with that addresses (or fail if no interface with the given address exists).
bindTCP_Server_listen :: MethodBind
bindTCP_Server_listen
  = unsafePerformIO $
      withCString "TCP_Server" $
        \ clsNamePtr ->
          withCString "listen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Listen on the [code]port[/code] binding to [code]bind_address[/code].
--   				If [code]bind_address[/code] is set as [code]"*"[/code] (default), the server will listen on all available addresses (both IPv4 and IPv6).
--   				If [code]bind_address[/code] is set as [code]"0.0.0.0"[/code] (for IPv4) or [code]"::"[/code] (for IPv6), the server will listen on all available addresses matching that IP type.
--   				If [code]bind_address[/code] is set to any valid address (e.g. [code]"192.168.1.101"[/code], [code]"::1"[/code], etc), the server will only listen on the interface with that addresses (or fail if no interface with the given address exists).
listen ::
         (TCP_Server :< cls, Object :< cls) =>
         cls -> Int -> GodotString -> IO Int
listen cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTCP_Server_listen (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTCP_Server_stop #-}

-- | Stops listening.
bindTCP_Server_stop :: MethodBind
bindTCP_Server_stop
  = unsafePerformIO $
      withCString "TCP_Server" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops listening.
stop :: (TCP_Server :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTCP_Server_stop (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTCP_Server_take_connection #-}

-- | If a connection is available, returns a StreamPeerTCP with the connection.
bindTCP_Server_take_connection :: MethodBind
bindTCP_Server_take_connection
  = unsafePerformIO $
      withCString "TCP_Server" $
        \ clsNamePtr ->
          withCString "take_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If a connection is available, returns a StreamPeerTCP with the connection.
take_connection ::
                  (TCP_Server :< cls, Object :< cls) => cls -> IO StreamPeerTCP
take_connection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTCP_Server_take_connection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)