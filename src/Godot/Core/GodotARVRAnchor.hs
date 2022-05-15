module Godot.Core.GodotARVRAnchor where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

mesh_updated :: Signal GodotARVRAnchor
mesh_updated = Signal "mesh_updated"