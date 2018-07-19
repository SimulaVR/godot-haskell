module Godot.Core.GodotColorPickerButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

color_changed :: Signal GodotColorPickerButton
color_changed = Signal "color_changed"