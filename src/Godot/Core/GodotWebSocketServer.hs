module Godot.Core.GodotWebSocketServer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

data_received :: Signal GodotWebSocketServer
data_received = Signal "data_received"

client_connected :: Signal GodotWebSocketServer
client_connected = Signal "client_connected"

client_disconnected :: Signal GodotWebSocketServer
client_disconnected = Signal "client_disconnected"