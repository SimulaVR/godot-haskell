module Godot.Core.GodotSprite where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

frame_changed :: Signal GodotSprite
frame_changed = Signal "frame_changed"

texture_changed :: Signal GodotSprite
texture_changed = Signal "texture_changed"