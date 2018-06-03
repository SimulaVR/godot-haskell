module Godot.Core.Godot_VisualScriptEditor where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

custom_nodes_updated :: Signal Godot_VisualScriptEditor
custom_nodes_updated = Signal "custom_nodes_updated"