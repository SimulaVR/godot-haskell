module Godot.Core.GodotTouchScreenButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern VISIBILITY_ALWAYS :: Int

pattern VISIBILITY_ALWAYS = 0

pattern VISIBILITY_TOUCHSCREEN_ONLY :: Int

pattern VISIBILITY_TOUCHSCREEN_ONLY = 1

pressed :: Signal GodotTouchScreenButton
pressed = Signal "pressed"

released :: Signal GodotTouchScreenButton
released = Signal "released"