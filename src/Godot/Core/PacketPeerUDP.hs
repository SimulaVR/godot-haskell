{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PacketPeerUDP
       (Godot.Core.PacketPeerUDP.close,
        Godot.Core.PacketPeerUDP.get_packet_ip,
        Godot.Core.PacketPeerUDP.get_packet_port,
        Godot.Core.PacketPeerUDP.is_listening,
        Godot.Core.PacketPeerUDP.join_multicast_group,
        Godot.Core.PacketPeerUDP.leave_multicast_group,
        Godot.Core.PacketPeerUDP.listen,
        Godot.Core.PacketPeerUDP.set_broadcast_enabled,
        Godot.Core.PacketPeerUDP.set_dest_address,
        Godot.Core.PacketPeerUDP.wait)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPacketPeerUDP_close #-}

-- | Close the UDP socket the [code]PacketPeerUDP[/code] is currently listening on.
bindPacketPeerUDP_close :: MethodBind
bindPacketPeerUDP_close
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Close the UDP socket the [code]PacketPeerUDP[/code] is currently listening on.
close :: (PacketPeerUDP :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_close (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_get_packet_ip #-}

-- | Returns the IP of the remote peer that sent the last packet(that was received with [method PacketPeer.get_packet] or [method PacketPeer.get_var]).
bindPacketPeerUDP_get_packet_ip :: MethodBind
bindPacketPeerUDP_get_packet_ip
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "get_packet_ip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the IP of the remote peer that sent the last packet(that was received with [method PacketPeer.get_packet] or [method PacketPeer.get_var]).
get_packet_ip ::
                (PacketPeerUDP :< cls, Object :< cls) => cls -> IO GodotString
get_packet_ip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_get_packet_ip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_get_packet_port #-}

-- | Returns the port of the remote peer that sent the last packet(that was received with [method PacketPeer.get_packet] or [method PacketPeer.get_var]).
bindPacketPeerUDP_get_packet_port :: MethodBind
bindPacketPeerUDP_get_packet_port
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "get_packet_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the port of the remote peer that sent the last packet(that was received with [method PacketPeer.get_packet] or [method PacketPeer.get_var]).
get_packet_port ::
                  (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Int
get_packet_port cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_get_packet_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_is_listening #-}

-- | Returns whether this [code]PacketPeerUDP[/code] is listening.
bindPacketPeerUDP_is_listening :: MethodBind
bindPacketPeerUDP_is_listening
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "is_listening" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this [code]PacketPeerUDP[/code] is listening.
is_listening ::
               (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Bool
is_listening cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_is_listening (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_join_multicast_group #-}

bindPacketPeerUDP_join_multicast_group :: MethodBind
bindPacketPeerUDP_join_multicast_group
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "join_multicast_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

join_multicast_group ::
                       (PacketPeerUDP :< cls, Object :< cls) =>
                       cls -> GodotString -> GodotString -> IO Int
join_multicast_group cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_join_multicast_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_leave_multicast_group #-}

bindPacketPeerUDP_leave_multicast_group :: MethodBind
bindPacketPeerUDP_leave_multicast_group
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "leave_multicast_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

leave_multicast_group ::
                        (PacketPeerUDP :< cls, Object :< cls) =>
                        cls -> GodotString -> GodotString -> IO Int
leave_multicast_group cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_leave_multicast_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_listen #-}

-- | Make this [code]PacketPeerUDP[/code] listen on the "port" binding to "bind_address" with a buffer size "recv_buf_size".
--   				If "bind_address" is set as "*" (default), the peer will listen on all available addresses (both IPv4 and IPv6).
--   				If "bind_address" is set as "0.0.0.0" (for IPv4) or "::" (for IPv6), the peer will listen on all available addresses matching that IP type.
--   				If "bind_address" is set to any valid address (e.g. "192.168.1.101", "::1", etc), the peer will only listen on the interface with that addresses (or fail if no interface with the given address exists).
bindPacketPeerUDP_listen :: MethodBind
bindPacketPeerUDP_listen
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "listen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Make this [code]PacketPeerUDP[/code] listen on the "port" binding to "bind_address" with a buffer size "recv_buf_size".
--   				If "bind_address" is set as "*" (default), the peer will listen on all available addresses (both IPv4 and IPv6).
--   				If "bind_address" is set as "0.0.0.0" (for IPv4) or "::" (for IPv6), the peer will listen on all available addresses matching that IP type.
--   				If "bind_address" is set to any valid address (e.g. "192.168.1.101", "::1", etc), the peer will only listen on the interface with that addresses (or fail if no interface with the given address exists).
listen ::
         (PacketPeerUDP :< cls, Object :< cls) =>
         cls -> Int -> GodotString -> Int -> IO Int
listen cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_listen (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_set_broadcast_enabled #-}

bindPacketPeerUDP_set_broadcast_enabled :: MethodBind
bindPacketPeerUDP_set_broadcast_enabled
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "set_broadcast_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_broadcast_enabled ::
                        (PacketPeerUDP :< cls, Object :< cls) => cls -> Bool -> IO ()
set_broadcast_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_set_broadcast_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_set_dest_address #-}

-- | Set the destination address and port for sending packets and variables, a hostname will be resolved using if valid.
bindPacketPeerUDP_set_dest_address :: MethodBind
bindPacketPeerUDP_set_dest_address
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "set_dest_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the destination address and port for sending packets and variables, a hostname will be resolved using if valid.
set_dest_address ::
                   (PacketPeerUDP :< cls, Object :< cls) =>
                   cls -> GodotString -> Int -> IO Int
set_dest_address cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_set_dest_address
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerUDP_wait #-}

-- | Wait for a packet to arrive on the listening port, see [method listen].
bindPacketPeerUDP_wait :: MethodBind
bindPacketPeerUDP_wait
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Wait for a packet to arrive on the listening port, see [method listen].
wait :: (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_wait (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)