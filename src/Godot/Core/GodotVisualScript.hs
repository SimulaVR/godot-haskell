module Godot.Core.GodotVisualScript where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

node_ports_changed :: Signal GodotVisualScript
node_ports_changed = Signal "node_ports_changed"