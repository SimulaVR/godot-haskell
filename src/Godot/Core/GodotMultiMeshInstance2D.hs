module Godot.Core.GodotMultiMeshInstance2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

texture_changed :: Signal GodotMultiMeshInstance2D
texture_changed = Signal "texture_changed"