module Godot.Core.GodotWebSocketClient where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

server_close_request :: Signal GodotWebSocketClient
server_close_request = Signal "server_close_request"

connection_established :: Signal GodotWebSocketClient
connection_established = Signal "connection_established"

data_received :: Signal GodotWebSocketClient
data_received = Signal "data_received"

connection_error :: Signal GodotWebSocketClient
connection_error = Signal "connection_error"

connection_closed :: Signal GodotWebSocketClient
connection_closed = Signal "connection_closed"