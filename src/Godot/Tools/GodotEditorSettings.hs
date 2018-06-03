module Godot.Tools.GodotEditorSettings where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

settings_changed :: Signal GodotEditorSettings
settings_changed = Signal "settings_changed"