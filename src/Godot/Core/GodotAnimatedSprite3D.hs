module Godot.Core.GodotAnimatedSprite3D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

frame_changed :: Signal GodotAnimatedSprite3D
frame_changed = Signal "frame_changed"