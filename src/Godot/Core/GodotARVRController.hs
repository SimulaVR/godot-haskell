module Godot.Core.GodotARVRController where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

button_pressed :: Signal GodotARVRController
button_pressed = Signal "button_pressed"

button_release :: Signal GodotARVRController
button_release = Signal "button_release"

mesh_updated :: Signal GodotARVRController
mesh_updated = Signal "mesh_updated"