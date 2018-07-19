module Godot.Core.GodotSprite3D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

frame_changed :: Signal GodotSprite3D
frame_changed = Signal "frame_changed"