module Godot.Core.GodotTabs where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pattern CLOSE_BUTTON_SHOW_ACTIVE_ONLY :: Int

pattern CLOSE_BUTTON_SHOW_ACTIVE_ONLY = 1

pattern ALIGN_MAX :: Int

pattern ALIGN_MAX = 3

pattern CLOSE_BUTTON_MAX :: Int

pattern CLOSE_BUTTON_MAX = 3

pattern CLOSE_BUTTON_SHOW_ALWAYS :: Int

pattern CLOSE_BUTTON_SHOW_ALWAYS = 2

pattern CLOSE_BUTTON_SHOW_NEVER :: Int

pattern CLOSE_BUTTON_SHOW_NEVER = 0

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

tab_close :: Signal GodotTabs
tab_close = Signal "tab_close"

tab_clicked :: Signal GodotTabs
tab_clicked = Signal "tab_clicked"

reposition_active_tab_request :: Signal GodotTabs
reposition_active_tab_request
  = Signal "reposition_active_tab_request"

right_button_pressed :: Signal GodotTabs
right_button_pressed = Signal "right_button_pressed"

tab_changed :: Signal GodotTabs
tab_changed = Signal "tab_changed"

tab_hover :: Signal GodotTabs
tab_hover = Signal "tab_hover"