module Godot.Core.GodotVisibilityNotifier where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

camera_exited :: Signal GodotVisibilityNotifier
camera_exited = Signal "camera_exited"

screen_entered :: Signal GodotVisibilityNotifier
screen_entered = Signal "screen_entered"

camera_entered :: Signal GodotVisibilityNotifier
camera_entered = Signal "camera_entered"

screen_exited :: Signal GodotVisibilityNotifier
screen_exited = Signal "screen_exited"