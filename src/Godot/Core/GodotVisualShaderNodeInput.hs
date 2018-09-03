module Godot.Core.GodotVisualShaderNodeInput where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

input_type_changed :: Signal GodotVisualShaderNodeInput
input_type_changed = Signal "input_type_changed"