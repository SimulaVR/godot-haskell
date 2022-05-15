module Godot.Core.GodotCollisionObject2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

input_event :: Signal GodotCollisionObject2D
input_event = Signal "input_event"

mouse_entered :: Signal GodotCollisionObject2D
mouse_entered = Signal "mouse_entered"

mouse_exited :: Signal GodotCollisionObject2D
mouse_exited = Signal "mouse_exited"