module Godot.Core.GodotMultiplayerAPI where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern RPC_MODE_SLAVE :: Int

pattern RPC_MODE_SLAVE = 3

pattern RPC_MODE_PUPPETSYNC :: Int

pattern RPC_MODE_PUPPETSYNC = 6

pattern RPC_MODE_REMOTESYNC :: Int

pattern RPC_MODE_REMOTESYNC = 4

pattern RPC_MODE_MASTER :: Int

pattern RPC_MODE_MASTER = 2

pattern RPC_MODE_DISABLED :: Int

pattern RPC_MODE_DISABLED = 0

pattern RPC_MODE_REMOTE :: Int

pattern RPC_MODE_REMOTE = 1

pattern RPC_MODE_PUPPET :: Int

pattern RPC_MODE_PUPPET = 3

pattern RPC_MODE_SYNC :: Int

pattern RPC_MODE_SYNC = 4

pattern RPC_MODE_MASTERSYNC :: Int

pattern RPC_MODE_MASTERSYNC = 5

connected_to_server :: Signal GodotMultiplayerAPI
connected_to_server = Signal "connected_to_server"

connection_failed :: Signal GodotMultiplayerAPI
connection_failed = Signal "connection_failed"

network_peer_connected :: Signal GodotMultiplayerAPI
network_peer_connected = Signal "network_peer_connected"

network_peer_disconnected :: Signal GodotMultiplayerAPI
network_peer_disconnected = Signal "network_peer_disconnected"

network_peer_packet :: Signal GodotMultiplayerAPI
network_peer_packet = Signal "network_peer_packet"

server_disconnected :: Signal GodotMultiplayerAPI
server_disconnected = Signal "server_disconnected"