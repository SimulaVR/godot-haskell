module Godot.Core.GodotVisualShaderNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

editor_refresh_request :: Signal GodotVisualShaderNode
editor_refresh_request = Signal "editor_refresh_request"