module Godot.Core.GodotNetworkedMultiplayerPeer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern CONNECTION_DISCONNECTED :: Int

pattern CONNECTION_DISCONNECTED = 0

pattern TRANSFER_MODE_UNRELIABLE :: Int

pattern TRANSFER_MODE_UNRELIABLE = 0

pattern CONNECTION_CONNECTED :: Int

pattern CONNECTION_CONNECTED = 2

pattern TARGET_PEER_SERVER :: Int

pattern TARGET_PEER_SERVER = 1

pattern TARGET_PEER_BROADCAST :: Int

pattern TARGET_PEER_BROADCAST = 0

pattern CONNECTION_CONNECTING :: Int

pattern CONNECTION_CONNECTING = 1

pattern TRANSFER_MODE_RELIABLE :: Int

pattern TRANSFER_MODE_RELIABLE = 2

pattern TRANSFER_MODE_UNRELIABLE_ORDERED :: Int

pattern TRANSFER_MODE_UNRELIABLE_ORDERED = 1

connection_failed :: Signal GodotNetworkedMultiplayerPeer
connection_failed = Signal "connection_failed"

connection_succeeded :: Signal GodotNetworkedMultiplayerPeer
connection_succeeded = Signal "connection_succeeded"

peer_disconnected :: Signal GodotNetworkedMultiplayerPeer
peer_disconnected = Signal "peer_disconnected"

peer_connected :: Signal GodotNetworkedMultiplayerPeer
peer_connected = Signal "peer_connected"

server_disconnected :: Signal GodotNetworkedMultiplayerPeer
server_disconnected = Signal "server_disconnected"