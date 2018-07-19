module Godot.Core.GodotGraphEdit where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

delete_nodes_request :: Signal GodotGraphEdit
delete_nodes_request = Signal "delete_nodes_request"

duplicate_nodes_request :: Signal GodotGraphEdit
duplicate_nodes_request = Signal "duplicate_nodes_request"

popup_request :: Signal GodotGraphEdit
popup_request = Signal "popup_request"

scroll_offset_changed :: Signal GodotGraphEdit
scroll_offset_changed = Signal "scroll_offset_changed"

node_selected :: Signal GodotGraphEdit
node_selected = Signal "node_selected"

_begin_node_move :: Signal GodotGraphEdit
_begin_node_move = Signal "_begin_node_move"

connection_to_empty :: Signal GodotGraphEdit
connection_to_empty = Signal "connection_to_empty"

disconnection_request :: Signal GodotGraphEdit
disconnection_request = Signal "disconnection_request"

connection_request :: Signal GodotGraphEdit
connection_request = Signal "connection_request"

_end_node_move :: Signal GodotGraphEdit
_end_node_move = Signal "_end_node_move"