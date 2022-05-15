module Godot.Core.GodotSceneTree where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STRETCH_ASPECT_KEEP_WIDTH :: Int

pattern STRETCH_ASPECT_KEEP_WIDTH = 2

pattern STRETCH_ASPECT_EXPAND :: Int

pattern STRETCH_ASPECT_EXPAND = 4

pattern GROUP_CALL_REALTIME :: Int

pattern GROUP_CALL_REALTIME = 2

pattern STRETCH_ASPECT_IGNORE :: Int

pattern STRETCH_ASPECT_IGNORE = 0

pattern GROUP_CALL_DEFAULT :: Int

pattern GROUP_CALL_DEFAULT = 0

pattern GROUP_CALL_REVERSE :: Int

pattern GROUP_CALL_REVERSE = 1

pattern STRETCH_MODE_VIEWPORT :: Int

pattern STRETCH_MODE_VIEWPORT = 2

pattern STRETCH_MODE_2D :: Int

pattern STRETCH_MODE_2D = 1

pattern STRETCH_ASPECT_KEEP :: Int

pattern STRETCH_ASPECT_KEEP = 1

pattern STRETCH_ASPECT_KEEP_HEIGHT :: Int

pattern STRETCH_ASPECT_KEEP_HEIGHT = 3

pattern GROUP_CALL_UNIQUE :: Int

pattern GROUP_CALL_UNIQUE = 4

pattern STRETCH_MODE_DISABLED :: Int

pattern STRETCH_MODE_DISABLED = 0

connected_to_server :: Signal GodotSceneTree
connected_to_server = Signal "connected_to_server"

connection_failed :: Signal GodotSceneTree
connection_failed = Signal "connection_failed"

files_dropped :: Signal GodotSceneTree
files_dropped = Signal "files_dropped"

global_menu_action :: Signal GodotSceneTree
global_menu_action = Signal "global_menu_action"

idle_frame :: Signal GodotSceneTree
idle_frame = Signal "idle_frame"

network_peer_connected :: Signal GodotSceneTree
network_peer_connected = Signal "network_peer_connected"

network_peer_disconnected :: Signal GodotSceneTree
network_peer_disconnected = Signal "network_peer_disconnected"

node_added :: Signal GodotSceneTree
node_added = Signal "node_added"

node_configuration_warning_changed :: Signal GodotSceneTree
node_configuration_warning_changed
  = Signal "node_configuration_warning_changed"

node_removed :: Signal GodotSceneTree
node_removed = Signal "node_removed"

node_renamed :: Signal GodotSceneTree
node_renamed = Signal "node_renamed"

physics_frame :: Signal GodotSceneTree
physics_frame = Signal "physics_frame"

screen_resized :: Signal GodotSceneTree
screen_resized = Signal "screen_resized"

server_disconnected :: Signal GodotSceneTree
server_disconnected = Signal "server_disconnected"

tree_changed :: Signal GodotSceneTree
tree_changed = Signal "tree_changed"