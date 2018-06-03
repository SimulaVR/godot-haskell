module Godot.Core.GodotVisualScriptNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

ports_changed :: Signal GodotVisualScriptNode
ports_changed = Signal "ports_changed"