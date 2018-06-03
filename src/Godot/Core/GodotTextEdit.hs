module Godot.Core.GodotTextEdit where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern MENU_PASTE :: Int

pattern MENU_PASTE = 2

pattern SEARCH_WHOLE_WORDS :: Int

pattern SEARCH_WHOLE_WORDS = 2

pattern MENU_CLEAR :: Int

pattern MENU_CLEAR = 3

pattern MENU_MAX :: Int

pattern MENU_MAX = 6

pattern SEARCH_BACKWARDS :: Int

pattern SEARCH_BACKWARDS = 4

pattern MENU_COPY :: Int

pattern MENU_COPY = 1

pattern MENU_UNDO :: Int

pattern MENU_UNDO = 5

pattern MENU_SELECT_ALL :: Int

pattern MENU_SELECT_ALL = 4

pattern MENU_CUT :: Int

pattern MENU_CUT = 0

pattern SEARCH_MATCH_CASE :: Int

pattern SEARCH_MATCH_CASE = 1

breakpoint_toggled :: Signal GodotTextEdit
breakpoint_toggled = Signal "breakpoint_toggled"

text_changed :: Signal GodotTextEdit
text_changed = Signal "text_changed"

symbol_lookup :: Signal GodotTextEdit
symbol_lookup = Signal "symbol_lookup"

cursor_changed :: Signal GodotTextEdit
cursor_changed = Signal "cursor_changed"

request_completion :: Signal GodotTextEdit
request_completion = Signal "request_completion"