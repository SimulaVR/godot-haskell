module Godot.Core.GodotScrollContainer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

scroll_started :: Signal GodotScrollContainer
scroll_started = Signal "scroll_started"

scroll_ended :: Signal GodotScrollContainer
scroll_ended = Signal "scroll_ended"