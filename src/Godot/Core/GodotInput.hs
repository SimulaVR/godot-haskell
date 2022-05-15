module Godot.Core.GodotInput where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MOUSE_MODE_VISIBLE :: Int

pattern MOUSE_MODE_VISIBLE = 0

pattern MOUSE_MODE_CAPTURED :: Int

pattern MOUSE_MODE_CAPTURED = 2

pattern CURSOR_IBEAM :: Int

pattern CURSOR_IBEAM = 1

pattern CURSOR_HSPLIT :: Int

pattern CURSOR_HSPLIT = 15

pattern CURSOR_BUSY :: Int

pattern CURSOR_BUSY = 5

pattern CURSOR_POINTING_HAND :: Int

pattern CURSOR_POINTING_HAND = 2

pattern MOUSE_MODE_HIDDEN :: Int

pattern MOUSE_MODE_HIDDEN = 1

pattern CURSOR_VSPLIT :: Int

pattern CURSOR_VSPLIT = 14

pattern CURSOR_CAN_DROP :: Int

pattern CURSOR_CAN_DROP = 7

pattern CURSOR_CROSS :: Int

pattern CURSOR_CROSS = 3

pattern CURSOR_FDIAGSIZE :: Int

pattern CURSOR_FDIAGSIZE = 12

pattern CURSOR_MOVE :: Int

pattern CURSOR_MOVE = 13

pattern CURSOR_DRAG :: Int

pattern CURSOR_DRAG = 6

pattern CURSOR_VSIZE :: Int

pattern CURSOR_VSIZE = 9

pattern CURSOR_WAIT :: Int

pattern CURSOR_WAIT = 4

pattern CURSOR_ARROW :: Int

pattern CURSOR_ARROW = 0

pattern CURSOR_HELP :: Int

pattern CURSOR_HELP = 16

pattern CURSOR_FORBIDDEN :: Int

pattern CURSOR_FORBIDDEN = 8

pattern CURSOR_HSIZE :: Int

pattern CURSOR_HSIZE = 10

pattern CURSOR_BDIAGSIZE :: Int

pattern CURSOR_BDIAGSIZE = 11

pattern MOUSE_MODE_CONFINED :: Int

pattern MOUSE_MODE_CONFINED = 3

joy_connection_changed :: Signal GodotInput
joy_connection_changed = Signal "joy_connection_changed"