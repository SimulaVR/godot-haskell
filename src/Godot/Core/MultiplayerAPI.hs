{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MultiplayerAPI
       (Godot.Core.MultiplayerAPI._RPC_MODE_SLAVE,
        Godot.Core.MultiplayerAPI._RPC_MODE_DISABLED,
        Godot.Core.MultiplayerAPI._RPC_MODE_MASTER,
        Godot.Core.MultiplayerAPI._RPC_MODE_MASTERSYNC,
        Godot.Core.MultiplayerAPI._RPC_MODE_SYNC,
        Godot.Core.MultiplayerAPI._RPC_MODE_REMOTE,
        Godot.Core.MultiplayerAPI._RPC_MODE_PUPPET,
        Godot.Core.MultiplayerAPI._RPC_MODE_PUPPETSYNC,
        Godot.Core.MultiplayerAPI._RPC_MODE_REMOTESYNC,
        Godot.Core.MultiplayerAPI.sig_connected_to_server,
        Godot.Core.MultiplayerAPI.sig_connection_failed,
        Godot.Core.MultiplayerAPI.sig_network_peer_packet,
        Godot.Core.MultiplayerAPI.sig_network_peer_disconnected,
        Godot.Core.MultiplayerAPI.sig_network_peer_connected,
        Godot.Core.MultiplayerAPI.sig_server_disconnected,
        Godot.Core.MultiplayerAPI.set_root_node,
        Godot.Core.MultiplayerAPI.send_bytes,
        Godot.Core.MultiplayerAPI.has_network_peer,
        Godot.Core.MultiplayerAPI.get_network_peer,
        Godot.Core.MultiplayerAPI.get_network_unique_id,
        Godot.Core.MultiplayerAPI.is_network_server,
        Godot.Core.MultiplayerAPI.get_rpc_sender_id,
        Godot.Core.MultiplayerAPI._add_peer,
        Godot.Core.MultiplayerAPI._del_peer,
        Godot.Core.MultiplayerAPI.set_network_peer,
        Godot.Core.MultiplayerAPI.poll, Godot.Core.MultiplayerAPI.clear,
        Godot.Core.MultiplayerAPI._connected_to_server,
        Godot.Core.MultiplayerAPI._connection_failed,
        Godot.Core.MultiplayerAPI._server_disconnected,
        Godot.Core.MultiplayerAPI.get_network_connected_peers,
        Godot.Core.MultiplayerAPI.set_refuse_new_network_connections,
        Godot.Core.MultiplayerAPI.is_refusing_new_network_connections)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_RPC_MODE_SLAVE :: Int
_RPC_MODE_SLAVE = 3

_RPC_MODE_DISABLED :: Int
_RPC_MODE_DISABLED = 0

_RPC_MODE_MASTER :: Int
_RPC_MODE_MASTER = 2

_RPC_MODE_MASTERSYNC :: Int
_RPC_MODE_MASTERSYNC = 5

_RPC_MODE_SYNC :: Int
_RPC_MODE_SYNC = 4

_RPC_MODE_REMOTE :: Int
_RPC_MODE_REMOTE = 1

_RPC_MODE_PUPPET :: Int
_RPC_MODE_PUPPET = 3

_RPC_MODE_PUPPETSYNC :: Int
_RPC_MODE_PUPPETSYNC = 6

_RPC_MODE_REMOTESYNC :: Int
_RPC_MODE_REMOTESYNC = 4

-- | Emitted whenever this MultiplayerAPI's [member network_peer] successfully connected to a server. Only emitted on clients.
sig_connected_to_server ::
                        Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_connected_to_server
  = Godot.Internal.Dispatch.Signal "connected_to_server"

-- | Emitted whenever this MultiplayerAPI's [member network_peer] fails to establish a connection to a server. Only emitted on clients.
sig_connection_failed ::
                      Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_connection_failed
  = Godot.Internal.Dispatch.Signal "connection_failed"

-- | Emitted whenever this MultiplayerAPI's [member network_peer] receive a [code]packet[/code] with custom data (see [method send_bytes]). ID is the peer ID of the peer that sent the packet.
sig_network_peer_packet ::
                        Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_network_peer_packet
  = Godot.Internal.Dispatch.Signal "network_peer_packet"

-- | Emitted whenever this MultiplayerAPI's [member network_peer] disconnects from a peer. Clients get notified when other clients disconnect from the same server.
sig_network_peer_disconnected ::
                              Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_network_peer_disconnected
  = Godot.Internal.Dispatch.Signal "network_peer_disconnected"

-- | Emitted whenever this MultiplayerAPI's [member network_peer] connects with a new peer. ID is the peer ID of the new peer. Clients get notified when other clients connect to the same server. Upon connecting to a server, a client also receives this signal for the server (with ID being 1).
sig_network_peer_connected ::
                           Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_network_peer_connected
  = Godot.Internal.Dispatch.Signal "network_peer_connected"

-- | Emitted whenever this MultiplayerAPI's [member network_peer] disconnects from server. Only emitted on clients.
sig_server_disconnected ::
                        Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_server_disconnected
  = Godot.Internal.Dispatch.Signal "server_disconnected"

{-# NOINLINE bindMultiplayerAPI_set_root_node #-}

-- | Sets the base root node to use for RPCs. Instead of an absolute path, a relative path will be used to find the node upon which the RPC should be executed.
--   				This effectively allows to have different branches of the scene tree to be managed by different MultiplayerAPI, allowing for example to run both client and server in the same scene.
bindMultiplayerAPI_set_root_node :: MethodBind
bindMultiplayerAPI_set_root_node
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "set_root_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the base root node to use for RPCs. Instead of an absolute path, a relative path will be used to find the node upon which the RPC should be executed.
--   				This effectively allows to have different branches of the scene tree to be managed by different MultiplayerAPI, allowing for example to run both client and server in the same scene.
set_root_node ::
                (MultiplayerAPI :< cls, Object :< cls) => cls -> Node -> IO ()
set_root_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_set_root_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_send_bytes #-}

-- | Sends the given raw [code]bytes[/code] to a specific peer identified by [code]id[/code] (see [method NetworkedMultiplayerPeer.set_target_peer]). Default ID is [code]0[/code], i.e. broadcast to all peers.
bindMultiplayerAPI_send_bytes :: MethodBind
bindMultiplayerAPI_send_bytes
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "send_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the given raw [code]bytes[/code] to a specific peer identified by [code]id[/code] (see [method NetworkedMultiplayerPeer.set_target_peer]). Default ID is [code]0[/code], i.e. broadcast to all peers.
send_bytes ::
             (MultiplayerAPI :< cls, Object :< cls) =>
             cls -> PoolByteArray -> Int -> Int -> IO Int
send_bytes cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_send_bytes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_has_network_peer #-}

-- | Returns [code]true[/code] if there is a [member network_peer] set.
bindMultiplayerAPI_has_network_peer :: MethodBind
bindMultiplayerAPI_has_network_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "has_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if there is a [member network_peer] set.
has_network_peer ::
                   (MultiplayerAPI :< cls, Object :< cls) => cls -> IO Bool
has_network_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_has_network_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_get_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
bindMultiplayerAPI_get_network_peer :: MethodBind
bindMultiplayerAPI_get_network_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
get_network_peer ::
                   (MultiplayerAPI :< cls, Object :< cls) =>
                   cls -> IO NetworkedMultiplayerPeer
get_network_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_get_network_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_get_network_unique_id #-}

-- | Returns the unique peer ID of this MultiplayerAPI's [member network_peer].
bindMultiplayerAPI_get_network_unique_id :: MethodBind
bindMultiplayerAPI_get_network_unique_id
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_network_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the unique peer ID of this MultiplayerAPI's [member network_peer].
get_network_unique_id ::
                        (MultiplayerAPI :< cls, Object :< cls) => cls -> IO Int
get_network_unique_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_get_network_unique_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_is_network_server #-}

-- | Returns [code]true[/code] if this MultiplayerAPI's [member network_peer] is in server mode (listening for connections).
bindMultiplayerAPI_is_network_server :: MethodBind
bindMultiplayerAPI_is_network_server
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "is_network_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this MultiplayerAPI's [member network_peer] is in server mode (listening for connections).
is_network_server ::
                    (MultiplayerAPI :< cls, Object :< cls) => cls -> IO Bool
is_network_server cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_is_network_server
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_get_rpc_sender_id #-}

-- | Returns the sender's peer ID for the RPC currently being executed.
--   				NOTE: If not inside an RPC this method will return 0.
bindMultiplayerAPI_get_rpc_sender_id :: MethodBind
bindMultiplayerAPI_get_rpc_sender_id
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_rpc_sender_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the sender's peer ID for the RPC currently being executed.
--   				NOTE: If not inside an RPC this method will return 0.
get_rpc_sender_id ::
                    (MultiplayerAPI :< cls, Object :< cls) => cls -> IO Int
get_rpc_sender_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_get_rpc_sender_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI__add_peer #-}

bindMultiplayerAPI__add_peer :: MethodBind
bindMultiplayerAPI__add_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "_add_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_add_peer ::
            (MultiplayerAPI :< cls, Object :< cls) => cls -> Int -> IO ()
_add_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI__add_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI__del_peer #-}

bindMultiplayerAPI__del_peer :: MethodBind
bindMultiplayerAPI__del_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "_del_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_del_peer ::
            (MultiplayerAPI :< cls, Object :< cls) => cls -> Int -> IO ()
_del_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI__del_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_set_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
bindMultiplayerAPI_set_network_peer :: MethodBind
bindMultiplayerAPI_set_network_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "set_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
set_network_peer ::
                   (MultiplayerAPI :< cls, Object :< cls) =>
                   cls -> NetworkedMultiplayerPeer -> IO ()
set_network_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_set_network_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_poll #-}

-- | Method used for polling the MultiplayerAPI. You only need to worry about this if you are using [member Node.custom_multiplayer] override or you set [member SceneTree.multiplayer_poll] to [code]false[/code]. By default [SceneTree] will poll its MultiplayerAPI for you.
--   				NOTE: This method results in RPCs and RSETs being called, so they will be executed in the same context of this function (e.g. [code]_process[/code], [code]physics[/code], [Thread]).
bindMultiplayerAPI_poll :: MethodBind
bindMultiplayerAPI_poll
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Method used for polling the MultiplayerAPI. You only need to worry about this if you are using [member Node.custom_multiplayer] override or you set [member SceneTree.multiplayer_poll] to [code]false[/code]. By default [SceneTree] will poll its MultiplayerAPI for you.
--   				NOTE: This method results in RPCs and RSETs being called, so they will be executed in the same context of this function (e.g. [code]_process[/code], [code]physics[/code], [Thread]).
poll :: (MultiplayerAPI :< cls, Object :< cls) => cls -> IO ()
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_poll (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_clear #-}

-- | Clears the current MultiplayerAPI network state (you shouldn't call this unless you know what you are doing).
bindMultiplayerAPI_clear :: MethodBind
bindMultiplayerAPI_clear
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the current MultiplayerAPI network state (you shouldn't call this unless you know what you are doing).
clear :: (MultiplayerAPI :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI__connected_to_server #-}

bindMultiplayerAPI__connected_to_server :: MethodBind
bindMultiplayerAPI__connected_to_server
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "_connected_to_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_connected_to_server ::
                       (MultiplayerAPI :< cls, Object :< cls) => cls -> IO ()
_connected_to_server cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI__connected_to_server
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI__connection_failed #-}

bindMultiplayerAPI__connection_failed :: MethodBind
bindMultiplayerAPI__connection_failed
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "_connection_failed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_connection_failed ::
                     (MultiplayerAPI :< cls, Object :< cls) => cls -> IO ()
_connection_failed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI__connection_failed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI__server_disconnected #-}

bindMultiplayerAPI__server_disconnected :: MethodBind
bindMultiplayerAPI__server_disconnected
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "_server_disconnected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_server_disconnected ::
                       (MultiplayerAPI :< cls, Object :< cls) => cls -> IO ()
_server_disconnected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI__server_disconnected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_get_network_connected_peers #-}

-- | Returns the peer IDs of all connected peers of this MultiplayerAPI's [member network_peer].
bindMultiplayerAPI_get_network_connected_peers :: MethodBind
bindMultiplayerAPI_get_network_connected_peers
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_network_connected_peers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peer IDs of all connected peers of this MultiplayerAPI's [member network_peer].
get_network_connected_peers ::
                              (MultiplayerAPI :< cls, Object :< cls) => cls -> IO PoolIntArray
get_network_connected_peers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindMultiplayerAPI_get_network_connected_peers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_set_refuse_new_network_connections
             #-}

-- | If [code]true[/code], the MultiplayerAPI's [member network_peer] refuses new incoming connections.
bindMultiplayerAPI_set_refuse_new_network_connections :: MethodBind
bindMultiplayerAPI_set_refuse_new_network_connections
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "set_refuse_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the MultiplayerAPI's [member network_peer] refuses new incoming connections.
set_refuse_new_network_connections ::
                                     (MultiplayerAPI :< cls, Object :< cls) => cls -> Bool -> IO ()
set_refuse_new_network_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindMultiplayerAPI_set_refuse_new_network_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiplayerAPI_is_refusing_new_network_connections
             #-}

-- | If [code]true[/code], the MultiplayerAPI's [member network_peer] refuses new incoming connections.
bindMultiplayerAPI_is_refusing_new_network_connections ::
                                                       MethodBind
bindMultiplayerAPI_is_refusing_new_network_connections
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "is_refusing_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the MultiplayerAPI's [member network_peer] refuses new incoming connections.
is_refusing_new_network_connections ::
                                      (MultiplayerAPI :< cls, Object :< cls) => cls -> IO Bool
is_refusing_new_network_connections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindMultiplayerAPI_is_refusing_new_network_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)