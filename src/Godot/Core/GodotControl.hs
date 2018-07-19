module Godot.Core.GodotControl where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_MOUSE_EXIT :: Int

pattern NOTIFICATION_MOUSE_EXIT = 42

pattern CURSOR_MOVE :: Int

pattern CURSOR_MOVE = 13

pattern NOTIFICATION_MOUSE_ENTER :: Int

pattern NOTIFICATION_MOUSE_ENTER = 41

pattern PRESET_MODE_KEEP_WIDTH :: Int

pattern PRESET_MODE_KEEP_WIDTH = 1

pattern CURSOR_ARROW :: Int

pattern CURSOR_ARROW = 0

pattern GROW_DIRECTION_BEGIN :: Int

pattern GROW_DIRECTION_BEGIN = 0

pattern CURSOR_IBEAM :: Int

pattern CURSOR_IBEAM = 1

pattern CURSOR_HSPLIT :: Int

pattern CURSOR_HSPLIT = 15

pattern FOCUS_ALL :: Int

pattern FOCUS_ALL = 2

pattern PRESET_BOTTOM_RIGHT :: Int

pattern PRESET_BOTTOM_RIGHT = 3

pattern CURSOR_DRAG :: Int

pattern CURSOR_DRAG = 6

pattern PRESET_TOP_LEFT :: Int

pattern PRESET_TOP_LEFT = 0

pattern PRESET_CENTER_TOP :: Int

pattern PRESET_CENTER_TOP = 5

pattern FOCUS_CLICK :: Int

pattern FOCUS_CLICK = 1

pattern CURSOR_BUSY :: Int

pattern CURSOR_BUSY = 5

pattern SIZE_SHRINK_CENTER :: Int

pattern SIZE_SHRINK_CENTER = 4

pattern CURSOR_CROSS :: Int

pattern CURSOR_CROSS = 3

pattern CURSOR_WAIT :: Int

pattern CURSOR_WAIT = 4

pattern PRESET_TOP_RIGHT :: Int

pattern PRESET_TOP_RIGHT = 1

pattern NOTIFICATION_THEME_CHANGED :: Int

pattern NOTIFICATION_THEME_CHANGED = 45

pattern CURSOR_BDIAGSIZE :: Int

pattern CURSOR_BDIAGSIZE = 11

pattern PRESET_HCENTER_WIDE :: Int

pattern PRESET_HCENTER_WIDE = 14

pattern ANCHOR_BEGIN :: Int

pattern ANCHOR_BEGIN = 0

pattern MOUSE_FILTER_IGNORE :: Int

pattern MOUSE_FILTER_IGNORE = 2

pattern PRESET_TOP_WIDE :: Int

pattern PRESET_TOP_WIDE = 10

pattern PRESET_MODE_MINSIZE :: Int

pattern PRESET_MODE_MINSIZE = 0

pattern NOTIFICATION_FOCUS_ENTER :: Int

pattern NOTIFICATION_FOCUS_ENTER = 43

pattern SIZE_EXPAND_FILL :: Int

pattern SIZE_EXPAND_FILL = 3

pattern CURSOR_HELP :: Int

pattern CURSOR_HELP = 16

pattern NOTIFICATION_RESIZED :: Int

pattern NOTIFICATION_RESIZED = 40

pattern SIZE_EXPAND :: Int

pattern SIZE_EXPAND = 2

pattern CURSOR_CAN_DROP :: Int

pattern CURSOR_CAN_DROP = 7

pattern PRESET_MODE_KEEP_SIZE :: Int

pattern PRESET_MODE_KEEP_SIZE = 3

pattern GROW_DIRECTION_END :: Int

pattern GROW_DIRECTION_END = 1

pattern PRESET_VCENTER_WIDE :: Int

pattern PRESET_VCENTER_WIDE = 13

pattern SIZE_SHRINK_END :: Int

pattern SIZE_SHRINK_END = 8

pattern PRESET_RIGHT_WIDE :: Int

pattern PRESET_RIGHT_WIDE = 11

pattern SIZE_FILL :: Int

pattern SIZE_FILL = 1

pattern PRESET_BOTTOM_WIDE :: Int

pattern PRESET_BOTTOM_WIDE = 12

pattern CURSOR_POINTING_HAND :: Int

pattern CURSOR_POINTING_HAND = 2

pattern PRESET_MODE_KEEP_HEIGHT :: Int

pattern PRESET_MODE_KEEP_HEIGHT = 2

pattern CURSOR_FDIAGSIZE :: Int

pattern CURSOR_FDIAGSIZE = 12

pattern PRESET_WIDE :: Int

pattern PRESET_WIDE = 15

pattern PRESET_CENTER_LEFT :: Int

pattern PRESET_CENTER_LEFT = 4

pattern MOUSE_FILTER_PASS :: Int

pattern MOUSE_FILTER_PASS = 1

pattern NOTIFICATION_MODAL_CLOSE :: Int

pattern NOTIFICATION_MODAL_CLOSE = 46

pattern CURSOR_HSIZE :: Int

pattern CURSOR_HSIZE = 10

pattern PRESET_CENTER_RIGHT :: Int

pattern PRESET_CENTER_RIGHT = 6

pattern CURSOR_FORBIDDEN :: Int

pattern CURSOR_FORBIDDEN = 8

pattern CURSOR_VSIZE :: Int

pattern CURSOR_VSIZE = 9

pattern PRESET_CENTER_BOTTOM :: Int

pattern PRESET_CENTER_BOTTOM = 7

pattern NOTIFICATION_FOCUS_EXIT :: Int

pattern NOTIFICATION_FOCUS_EXIT = 44

pattern PRESET_LEFT_WIDE :: Int

pattern PRESET_LEFT_WIDE = 9

pattern ANCHOR_END :: Int

pattern ANCHOR_END = 1

pattern MOUSE_FILTER_STOP :: Int

pattern MOUSE_FILTER_STOP = 0

pattern PRESET_BOTTOM_LEFT :: Int

pattern PRESET_BOTTOM_LEFT = 2

pattern PRESET_CENTER :: Int

pattern PRESET_CENTER = 8

pattern CURSOR_VSPLIT :: Int

pattern CURSOR_VSPLIT = 14

pattern FOCUS_NONE :: Int

pattern FOCUS_NONE = 0

mouse_exited :: Signal GodotControl
mouse_exited = Signal "mouse_exited"

gui_input :: Signal GodotControl
gui_input = Signal "gui_input"

modal_closed :: Signal GodotControl
modal_closed = Signal "modal_closed"

focus_entered :: Signal GodotControl
focus_entered = Signal "focus_entered"

resized :: Signal GodotControl
resized = Signal "resized"

minimum_size_changed :: Signal GodotControl
minimum_size_changed = Signal "minimum_size_changed"

mouse_entered :: Signal GodotControl
mouse_entered = Signal "mouse_entered"

size_flags_changed :: Signal GodotControl
size_flags_changed = Signal "size_flags_changed"

focus_exited :: Signal GodotControl
focus_exited = Signal "focus_exited"