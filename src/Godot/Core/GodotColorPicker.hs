module Godot.Core.GodotColorPicker where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

preset_removed :: Signal GodotColorPicker
preset_removed = Signal "preset_removed"

preset_added :: Signal GodotColorPicker
preset_added = Signal "preset_added"

color_changed :: Signal GodotColorPicker
color_changed = Signal "color_changed"