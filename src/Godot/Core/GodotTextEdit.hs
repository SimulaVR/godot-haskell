module Godot.Core.GodotTextEdit where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MENU_PASTE :: Int

pattern MENU_PASTE = 2

pattern MENU_UNDO :: Int

pattern MENU_UNDO = 5

pattern MENU_SELECT_ALL :: Int

pattern MENU_SELECT_ALL = 4

pattern SEARCH_RESULT_COLUMN :: Int

pattern SEARCH_RESULT_COLUMN = 0

pattern SEARCH_MATCH_CASE :: Int

pattern SEARCH_MATCH_CASE = 1

pattern SEARCH_BACKWARDS :: Int

pattern SEARCH_BACKWARDS = 4

pattern SEARCH_WHOLE_WORDS :: Int

pattern SEARCH_WHOLE_WORDS = 2

pattern MENU_CUT :: Int

pattern MENU_CUT = 0

pattern SEARCH_RESULT_LINE :: Int

pattern SEARCH_RESULT_LINE = 1

pattern MENU_REDO :: Int

pattern MENU_REDO = 6

pattern MENU_MAX :: Int

pattern MENU_MAX = 7

pattern MENU_COPY :: Int

pattern MENU_COPY = 1

pattern MENU_CLEAR :: Int

pattern MENU_CLEAR = 3

breakpoint_toggled :: Signal GodotTextEdit
breakpoint_toggled = Signal "breakpoint_toggled"

cursor_changed :: Signal GodotTextEdit
cursor_changed = Signal "cursor_changed"

info_clicked :: Signal GodotTextEdit
info_clicked = Signal "info_clicked"

request_completion :: Signal GodotTextEdit
request_completion = Signal "request_completion"

symbol_lookup :: Signal GodotTextEdit
symbol_lookup = Signal "symbol_lookup"

text_changed :: Signal GodotTextEdit
text_changed = Signal "text_changed"