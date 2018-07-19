module Godot.Core.GodotLineEdit where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MENU_PASTE :: Int

pattern MENU_PASTE = 2

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pattern ALIGN_FILL :: Int

pattern ALIGN_FILL = 3

pattern MENU_CLEAR :: Int

pattern MENU_CLEAR = 3

pattern MENU_MAX :: Int

pattern MENU_MAX = 7

pattern MENU_REDO :: Int

pattern MENU_REDO = 6

pattern MENU_COPY :: Int

pattern MENU_COPY = 1

pattern MENU_UNDO :: Int

pattern MENU_UNDO = 5

pattern MENU_SELECT_ALL :: Int

pattern MENU_SELECT_ALL = 4

pattern MENU_CUT :: Int

pattern MENU_CUT = 0

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

text_entered :: Signal GodotLineEdit
text_entered = Signal "text_entered"

text_changed :: Signal GodotLineEdit
text_changed = Signal "text_changed"