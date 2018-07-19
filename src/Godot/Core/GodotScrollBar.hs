module Godot.Core.GodotScrollBar where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

scrolling :: Signal GodotScrollBar
scrolling = Signal "scrolling"