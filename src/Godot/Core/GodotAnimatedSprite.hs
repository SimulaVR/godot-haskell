module Godot.Core.GodotAnimatedSprite where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

animation_finished :: Signal GodotAnimatedSprite
animation_finished = Signal "animation_finished"

frame_changed :: Signal GodotAnimatedSprite
frame_changed = Signal "frame_changed"