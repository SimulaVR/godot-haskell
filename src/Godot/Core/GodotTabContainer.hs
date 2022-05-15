module Godot.Core.GodotTabContainer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pre_popup_pressed :: Signal GodotTabContainer
pre_popup_pressed = Signal "pre_popup_pressed"

tab_changed :: Signal GodotTabContainer
tab_changed = Signal "tab_changed"

tab_selected :: Signal GodotTabContainer
tab_selected = Signal "tab_selected"