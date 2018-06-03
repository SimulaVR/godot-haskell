module Godot.Core.GodotVisibilityNotifier2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

screen_entered :: Signal GodotVisibilityNotifier2D
screen_entered = Signal "screen_entered"

viewport_entered :: Signal GodotVisibilityNotifier2D
viewport_entered = Signal "viewport_entered"

screen_exited :: Signal GodotVisibilityNotifier2D
screen_exited = Signal "screen_exited"

viewport_exited :: Signal GodotVisibilityNotifier2D
viewport_exited = Signal "viewport_exited"