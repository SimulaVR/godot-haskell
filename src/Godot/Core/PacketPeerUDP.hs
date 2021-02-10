{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Closes the UDP socket the [PacketPeerUDP] is currently listening on.
bindPacketPeerUDP_close :: MethodBind
bindPacketPeerUDP_close
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Closes the UDP socket the [PacketPeerUDP] is currently listening on.
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

-- | Returns whether this [PacketPeerUDP] is listening.
bindPacketPeerUDP_is_listening :: MethodBind
bindPacketPeerUDP_is_listening
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "is_listening" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this [PacketPeerUDP] is listening.
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

-- | Joins the multicast group specified by [code]multicast_address[/code] using the interface identified by [code]interface_name[/code].
--   				You can join the same multicast group with multiple interfaces. Use [method IP.get_local_interfaces] to know which are available.
--   				Note: Some Android devices might require the [code]CHANGE_WIFI_MULTICAST_STATE[/code] permission for multicast to work.
bindPacketPeerUDP_join_multicast_group :: MethodBind
bindPacketPeerUDP_join_multicast_group
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "join_multicast_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Joins the multicast group specified by [code]multicast_address[/code] using the interface identified by [code]interface_name[/code].
--   				You can join the same multicast group with multiple interfaces. Use [method IP.get_local_interfaces] to know which are available.
--   				Note: Some Android devices might require the [code]CHANGE_WIFI_MULTICAST_STATE[/code] permission for multicast to work.
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

-- | Removes the interface identified by [code]interface_name[/code] from the multicast group specified by [code]multicast_address[/code].
bindPacketPeerUDP_leave_multicast_group :: MethodBind
bindPacketPeerUDP_leave_multicast_group
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "leave_multicast_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the interface identified by [code]interface_name[/code] from the multicast group specified by [code]multicast_address[/code].
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

-- | Makes this [PacketPeerUDP] listen on the [code]port[/code] binding to [code]bind_address[/code] with a buffer size [code]recv_buf_size[/code].
--   				If [code]bind_address[/code] is set to [code]"*"[/code] (default), the peer will listen on all available addresses (both IPv4 and IPv6).
--   				If [code]bind_address[/code] is set to [code]"0.0.0.0"[/code] (for IPv4) or [code]"::"[/code] (for IPv6), the peer will listen on all available addresses matching that IP type.
--   				If [code]bind_address[/code] is set to any valid address (e.g. [code]"192.168.1.101"[/code], [code]"::1"[/code], etc), the peer will only listen on the interface with that addresses (or fail if no interface with the given address exists).
bindPacketPeerUDP_listen :: MethodBind
bindPacketPeerUDP_listen
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "listen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes this [PacketPeerUDP] listen on the [code]port[/code] binding to [code]bind_address[/code] with a buffer size [code]recv_buf_size[/code].
--   				If [code]bind_address[/code] is set to [code]"*"[/code] (default), the peer will listen on all available addresses (both IPv4 and IPv6).
--   				If [code]bind_address[/code] is set to [code]"0.0.0.0"[/code] (for IPv4) or [code]"::"[/code] (for IPv6), the peer will listen on all available addresses matching that IP type.
--   				If [code]bind_address[/code] is set to any valid address (e.g. [code]"192.168.1.101"[/code], [code]"::1"[/code], etc), the peer will only listen on the interface with that addresses (or fail if no interface with the given address exists).
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

-- | Enable or disable sending of broadcast packets (e.g. [code]set_dest_address("255.255.255.255", 4343)[/code]. This option is disabled by default.
--   				Note: Some Android devices might require the [code]CHANGE_WIFI_MULTICAST_STATE[/code] permission and this option to be enabled to receive broadcast packets too.
bindPacketPeerUDP_set_broadcast_enabled :: MethodBind
bindPacketPeerUDP_set_broadcast_enabled
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "set_broadcast_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enable or disable sending of broadcast packets (e.g. [code]set_dest_address("255.255.255.255", 4343)[/code]. This option is disabled by default.
--   				Note: Some Android devices might require the [code]CHANGE_WIFI_MULTICAST_STATE[/code] permission and this option to be enabled to receive broadcast packets too.
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

-- | Sets the destination address and port for sending packets and variables. A hostname will be resolved using DNS if needed.
--   				Note: [method set_broadcast_enabled] must be enabled before sending packets to a broadcast address (e.g. [code]255.255.255.255[/code]).
bindPacketPeerUDP_set_dest_address :: MethodBind
bindPacketPeerUDP_set_dest_address
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "set_dest_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the destination address and port for sending packets and variables. A hostname will be resolved using DNS if needed.
--   				Note: [method set_broadcast_enabled] must be enabled before sending packets to a broadcast address (e.g. [code]255.255.255.255[/code]).
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

-- | Waits for a packet to arrive on the listening port. See [method listen].
bindPacketPeerUDP_wait :: MethodBind
bindPacketPeerUDP_wait
  = unsafePerformIO $
      withCString "PacketPeerUDP" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Waits for a packet to arrive on the listening port. See [method listen].
wait :: (PacketPeerUDP :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerUDP_wait (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)