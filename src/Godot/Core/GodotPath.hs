module Godot.Core.GodotPath where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

curve_changed :: Signal GodotPath
curve_changed = Signal "curve_changed"