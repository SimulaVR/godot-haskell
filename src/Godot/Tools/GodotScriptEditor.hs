module Godot.Tools.GodotScriptEditor where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

editor_script_changed :: Signal GodotScriptEditor
editor_script_changed = Signal "editor_script_changed"

script_close :: Signal GodotScriptEditor
script_close = Signal "script_close"