module Godot.Tools.GodotEditorResourcePicker where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

resource_changed :: Signal GodotEditorResourcePicker
resource_changed = Signal "resource_changed"

resource_selected :: Signal GodotEditorResourcePicker
resource_selected = Signal "resource_selected"