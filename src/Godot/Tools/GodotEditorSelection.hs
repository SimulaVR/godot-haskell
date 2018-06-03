module Godot.Tools.GodotEditorSelection where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

selection_changed :: Signal GodotEditorSelection
selection_changed = Signal "selection_changed"