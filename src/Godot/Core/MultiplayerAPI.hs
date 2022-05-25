{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MultiplayerAPI
       (Godot.Core.MultiplayerAPI._RPC_MODE_SLAVE,
        Godot.Core.MultiplayerAPI._RPC_MODE_PUPPETSYNC,
        Godot.Core.MultiplayerAPI._RPC_MODE_REMOTESYNC,
        Godot.Core.MultiplayerAPI._RPC_MODE_MASTER,
        Godot.Core.MultiplayerAPI._RPC_MODE_DISABLED,
        Godot.Core.MultiplayerAPI._RPC_MODE_REMOTE,
        Godot.Core.MultiplayerAPI._RPC_MODE_PUPPET,
        Godot.Core.MultiplayerAPI._RPC_MODE_SYNC,
        Godot.Core.MultiplayerAPI._RPC_MODE_MASTERSYNC,
        Godot.Core.MultiplayerAPI.sig_connected_to_server,
        Godot.Core.MultiplayerAPI.sig_connection_failed,
        Godot.Core.MultiplayerAPI.sig_network_peer_connected,
        Godot.Core.MultiplayerAPI.sig_network_peer_disconnected,
        Godot.Core.MultiplayerAPI.sig_network_peer_packet,
        Godot.Core.MultiplayerAPI.sig_server_disconnected,
        Godot.Core.MultiplayerAPI._add_peer,
        Godot.Core.MultiplayerAPI._connected_to_server,
        Godot.Core.MultiplayerAPI._connection_failed,
        Godot.Core.MultiplayerAPI._del_peer,
        Godot.Core.MultiplayerAPI._server_disconnected,
        Godot.Core.MultiplayerAPI.clear,
        Godot.Core.MultiplayerAPI.get_network_connected_peers,
        Godot.Core.MultiplayerAPI.get_network_peer,
        Godot.Core.MultiplayerAPI.get_network_unique_id,
        Godot.Core.MultiplayerAPI.get_rpc_sender_id,
        Godot.Core.MultiplayerAPI.has_network_peer,
        Godot.Core.MultiplayerAPI.is_network_server,
        Godot.Core.MultiplayerAPI.is_object_decoding_allowed,
        Godot.Core.MultiplayerAPI.is_refusing_new_network_connections,
        Godot.Core.MultiplayerAPI.poll,
        Godot.Core.MultiplayerAPI.send_bytes,
        Godot.Core.MultiplayerAPI.set_allow_object_decoding,
        Godot.Core.MultiplayerAPI.set_network_peer,
        Godot.Core.MultiplayerAPI.set_refuse_new_network_connections,
        Godot.Core.MultiplayerAPI.set_root_node)
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
import Godot.Core.Reference()

_RPC_MODE_SLAVE :: Int
_RPC_MODE_SLAVE = 3

_RPC_MODE_PUPPETSYNC :: Int
_RPC_MODE_PUPPETSYNC = 6

_RPC_MODE_REMOTESYNC :: Int
_RPC_MODE_REMOTESYNC = 4

_RPC_MODE_MASTER :: Int
_RPC_MODE_MASTER = 2

_RPC_MODE_DISABLED :: Int
_RPC_MODE_DISABLED = 0

_RPC_MODE_REMOTE :: Int
_RPC_MODE_REMOTE = 1

_RPC_MODE_PUPPET :: Int
_RPC_MODE_PUPPET = 3

_RPC_MODE_SYNC :: Int
_RPC_MODE_SYNC = 4

_RPC_MODE_MASTERSYNC :: Int
_RPC_MODE_MASTERSYNC = 5

-- | Emitted when this MultiplayerAPI's @network_peer@ successfully connected to a server. Only emitted on clients.
sig_connected_to_server ::
                        Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_connected_to_server
  = Godot.Internal.Dispatch.Signal "connected_to_server"

instance NodeSignal MultiplayerAPI "connected_to_server" '[]

-- | Emitted when this MultiplayerAPI's @network_peer@ fails to establish a connection to a server. Only emitted on clients.
sig_connection_failed ::
                      Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_connection_failed
  = Godot.Internal.Dispatch.Signal "connection_failed"

instance NodeSignal MultiplayerAPI "connection_failed" '[]

-- | Emitted when this MultiplayerAPI's @network_peer@ connects with a new peer. ID is the peer ID of the new peer. Clients get notified when other clients connect to the same server. Upon connecting to a server, a client also receives this signal for the server (with ID being 1).
sig_network_peer_connected ::
                           Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_network_peer_connected
  = Godot.Internal.Dispatch.Signal "network_peer_connected"

instance NodeSignal MultiplayerAPI "network_peer_connected" '[Int]

-- | Emitted when this MultiplayerAPI's @network_peer@ disconnects from a peer. Clients get notified when other clients disconnect from the same server.
sig_network_peer_disconnected ::
                              Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_network_peer_disconnected
  = Godot.Internal.Dispatch.Signal "network_peer_disconnected"

instance NodeSignal MultiplayerAPI "network_peer_disconnected"
           '[Int]

-- | Emitted when this MultiplayerAPI's @network_peer@ receive a @packet@ with custom data (see @method send_bytes@). ID is the peer ID of the peer that sent the packet.
sig_network_peer_packet ::
                        Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_network_peer_packet
  = Godot.Internal.Dispatch.Signal "network_peer_packet"

instance NodeSignal MultiplayerAPI "network_peer_packet"
           '[Int, PoolByteArray]

-- | Emitted when this MultiplayerAPI's @network_peer@ disconnects from server. Only emitted on clients.
sig_server_disconnected ::
                        Godot.Internal.Dispatch.Signal MultiplayerAPI
sig_server_disconnected
  = Godot.Internal.Dispatch.Signal "server_disconnected"

instance NodeSignal MultiplayerAPI "server_disconnected" '[]

instance NodeProperty MultiplayerAPI "allow_object_decoding" Bool
           'False
         where
        nodeProperty
          = (is_object_decoding_allowed,
             wrapDroppingSetter set_allow_object_decoding, Nothing)

instance NodeProperty MultiplayerAPI "network_peer"
           NetworkedMultiplayerPeer
           'False
         where
        nodeProperty
          = (get_network_peer, wrapDroppingSetter set_network_peer, Nothing)

instance NodeProperty MultiplayerAPI
           "refuse_new_network_connections"
           Bool
           'False
         where
        nodeProperty
          = (is_refusing_new_network_connections,
             wrapDroppingSetter set_refuse_new_network_connections, Nothing)

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

instance NodeMethod MultiplayerAPI "_add_peer" '[Int] (IO ()) where
        nodeMethod = Godot.Core.MultiplayerAPI._add_peer

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

instance NodeMethod MultiplayerAPI "_connected_to_server" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiplayerAPI._connected_to_server

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

instance NodeMethod MultiplayerAPI "_connection_failed" '[] (IO ())
         where
        nodeMethod = Godot.Core.MultiplayerAPI._connection_failed

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

instance NodeMethod MultiplayerAPI "_del_peer" '[Int] (IO ()) where
        nodeMethod = Godot.Core.MultiplayerAPI._del_peer

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

instance NodeMethod MultiplayerAPI "_server_disconnected" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiplayerAPI._server_disconnected

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

instance NodeMethod MultiplayerAPI "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.MultiplayerAPI.clear

{-# NOINLINE bindMultiplayerAPI_get_network_connected_peers #-}

-- | Returns the peer IDs of all connected peers of this MultiplayerAPI's @network_peer@.
bindMultiplayerAPI_get_network_connected_peers :: MethodBind
bindMultiplayerAPI_get_network_connected_peers
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_network_connected_peers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peer IDs of all connected peers of this MultiplayerAPI's @network_peer@.
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

instance NodeMethod MultiplayerAPI "get_network_connected_peers"
           '[]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.get_network_connected_peers

{-# NOINLINE bindMultiplayerAPI_get_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with @method is_network_server@) and will set root node's network mode to master, or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
bindMultiplayerAPI_get_network_peer :: MethodBind
bindMultiplayerAPI_get_network_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with @method is_network_server@) and will set root node's network mode to master, or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
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

instance NodeMethod MultiplayerAPI "get_network_peer" '[]
           (IO NetworkedMultiplayerPeer)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.get_network_peer

{-# NOINLINE bindMultiplayerAPI_get_network_unique_id #-}

-- | Returns the unique peer ID of this MultiplayerAPI's @network_peer@.
bindMultiplayerAPI_get_network_unique_id :: MethodBind
bindMultiplayerAPI_get_network_unique_id
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_network_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the unique peer ID of this MultiplayerAPI's @network_peer@.
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

instance NodeMethod MultiplayerAPI "get_network_unique_id" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.get_network_unique_id

{-# NOINLINE bindMultiplayerAPI_get_rpc_sender_id #-}

-- | Returns the sender's peer ID for the RPC currently being executed.
--   				__Note:__ If not inside an RPC this method will return 0.
bindMultiplayerAPI_get_rpc_sender_id :: MethodBind
bindMultiplayerAPI_get_rpc_sender_id
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "get_rpc_sender_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the sender's peer ID for the RPC currently being executed.
--   				__Note:__ If not inside an RPC this method will return 0.
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

instance NodeMethod MultiplayerAPI "get_rpc_sender_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.get_rpc_sender_id

{-# NOINLINE bindMultiplayerAPI_has_network_peer #-}

-- | Returns @true@ if there is a @network_peer@ set.
bindMultiplayerAPI_has_network_peer :: MethodBind
bindMultiplayerAPI_has_network_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "has_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if there is a @network_peer@ set.
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

instance NodeMethod MultiplayerAPI "has_network_peer" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.has_network_peer

{-# NOINLINE bindMultiplayerAPI_is_network_server #-}

-- | Returns @true@ if this MultiplayerAPI's @network_peer@ is in server mode (listening for connections).
bindMultiplayerAPI_is_network_server :: MethodBind
bindMultiplayerAPI_is_network_server
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "is_network_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this MultiplayerAPI's @network_peer@ is in server mode (listening for connections).
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

instance NodeMethod MultiplayerAPI "is_network_server" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.is_network_server

{-# NOINLINE bindMultiplayerAPI_is_object_decoding_allowed #-}

-- | If @true@ (or if the @network_peer@ has @PacketPeer.allow_object_decoding@ set to @true@), the MultiplayerAPI will allow encoding and decoding of object during RPCs/RSETs.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindMultiplayerAPI_is_object_decoding_allowed :: MethodBind
bindMultiplayerAPI_is_object_decoding_allowed
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "is_object_decoding_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ (or if the @network_peer@ has @PacketPeer.allow_object_decoding@ set to @true@), the MultiplayerAPI will allow encoding and decoding of object during RPCs/RSETs.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
is_object_decoding_allowed ::
                             (MultiplayerAPI :< cls, Object :< cls) => cls -> IO Bool
is_object_decoding_allowed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindMultiplayerAPI_is_object_decoding_allowed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiplayerAPI "is_object_decoding_allowed" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.is_object_decoding_allowed

{-# NOINLINE bindMultiplayerAPI_is_refusing_new_network_connections
             #-}

-- | If @true@, the MultiplayerAPI's @network_peer@ refuses new incoming connections.
bindMultiplayerAPI_is_refusing_new_network_connections ::
                                                       MethodBind
bindMultiplayerAPI_is_refusing_new_network_connections
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "is_refusing_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the MultiplayerAPI's @network_peer@ refuses new incoming connections.
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

instance NodeMethod MultiplayerAPI
           "is_refusing_new_network_connections"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.MultiplayerAPI.is_refusing_new_network_connections

{-# NOINLINE bindMultiplayerAPI_poll #-}

-- | Method used for polling the MultiplayerAPI. You only need to worry about this if you are using @Node.custom_multiplayer@ override or you set @SceneTree.multiplayer_poll@ to @false@. By default, @SceneTree@ will poll its MultiplayerAPI for you.
--   				__Note:__ This method results in RPCs and RSETs being called, so they will be executed in the same context of this function (e.g. @_process@, @physics@, @Thread@).
bindMultiplayerAPI_poll :: MethodBind
bindMultiplayerAPI_poll
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Method used for polling the MultiplayerAPI. You only need to worry about this if you are using @Node.custom_multiplayer@ override or you set @SceneTree.multiplayer_poll@ to @false@. By default, @SceneTree@ will poll its MultiplayerAPI for you.
--   				__Note:__ This method results in RPCs and RSETs being called, so they will be executed in the same context of this function (e.g. @_process@, @physics@, @Thread@).
poll :: (MultiplayerAPI :< cls, Object :< cls) => cls -> IO ()
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_poll (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiplayerAPI "poll" '[] (IO ()) where
        nodeMethod = Godot.Core.MultiplayerAPI.poll

{-# NOINLINE bindMultiplayerAPI_send_bytes #-}

-- | Sends the given raw @bytes@ to a specific peer identified by @id@ (see @method NetworkedMultiplayerPeer.set_target_peer@). Default ID is @0@, i.e. broadcast to all peers.
bindMultiplayerAPI_send_bytes :: MethodBind
bindMultiplayerAPI_send_bytes
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "send_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the given raw @bytes@ to a specific peer identified by @id@ (see @method NetworkedMultiplayerPeer.set_target_peer@). Default ID is @0@, i.e. broadcast to all peers.
send_bytes ::
             (MultiplayerAPI :< cls, Object :< cls) =>
             cls -> PoolByteArray -> Maybe Int -> Maybe Int -> IO Int
send_bytes cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2,
       maybe (VariantInt (2)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_send_bytes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiplayerAPI "send_bytes"
           '[PoolByteArray, Maybe Int, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.MultiplayerAPI.send_bytes

{-# NOINLINE bindMultiplayerAPI_set_allow_object_decoding #-}

-- | If @true@ (or if the @network_peer@ has @PacketPeer.allow_object_decoding@ set to @true@), the MultiplayerAPI will allow encoding and decoding of object during RPCs/RSETs.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindMultiplayerAPI_set_allow_object_decoding :: MethodBind
bindMultiplayerAPI_set_allow_object_decoding
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "set_allow_object_decoding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ (or if the @network_peer@ has @PacketPeer.allow_object_decoding@ set to @true@), the MultiplayerAPI will allow encoding and decoding of object during RPCs/RSETs.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
set_allow_object_decoding ::
                            (MultiplayerAPI :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_object_decoding cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiplayerAPI_set_allow_object_decoding
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiplayerAPI "set_allow_object_decoding"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiplayerAPI.set_allow_object_decoding

{-# NOINLINE bindMultiplayerAPI_set_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with @method is_network_server@) and will set root node's network mode to master, or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
bindMultiplayerAPI_set_network_peer :: MethodBind
bindMultiplayerAPI_set_network_peer
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "set_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the MultiplayerAPI will become a network server (check with @method is_network_server@) and will set root node's network mode to master, or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to MultiplayerAPI's signals.
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

instance NodeMethod MultiplayerAPI "set_network_peer"
           '[NetworkedMultiplayerPeer]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiplayerAPI.set_network_peer

{-# NOINLINE bindMultiplayerAPI_set_refuse_new_network_connections
             #-}

-- | If @true@, the MultiplayerAPI's @network_peer@ refuses new incoming connections.
bindMultiplayerAPI_set_refuse_new_network_connections :: MethodBind
bindMultiplayerAPI_set_refuse_new_network_connections
  = unsafePerformIO $
      withCString "MultiplayerAPI" $
        \ clsNamePtr ->
          withCString "set_refuse_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the MultiplayerAPI's @network_peer@ refuses new incoming connections.
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

instance NodeMethod MultiplayerAPI
           "set_refuse_new_network_connections"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.MultiplayerAPI.set_refuse_new_network_connections

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

instance NodeMethod MultiplayerAPI "set_root_node" '[Node] (IO ())
         where
        nodeMethod = Godot.Core.MultiplayerAPI.set_root_node