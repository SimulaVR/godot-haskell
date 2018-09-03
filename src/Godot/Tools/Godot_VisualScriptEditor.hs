module Godot.Tools.Godot_VisualScriptEditor where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

custom_nodes_updated :: Signal Godot_VisualScriptEditor
custom_nodes_updated = Signal "custom_nodes_updated"