module Godot.Core.GodotARVRServer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TRACKER_BASESTATION :: Int

pattern TRACKER_BASESTATION = 2

pattern DONT_RESET_ROTATION :: Int

pattern DONT_RESET_ROTATION = 2

pattern RESET_FULL_ROTATION :: Int

pattern RESET_FULL_ROTATION = 0

pattern TRACKER_CONTROLLER :: Int

pattern TRACKER_CONTROLLER = 1

pattern TRACKER_ANY :: Int

pattern TRACKER_ANY = 255

pattern TRACKER_ANCHOR :: Int

pattern TRACKER_ANCHOR = 4

pattern RESET_BUT_KEEP_TILT :: Int

pattern RESET_BUT_KEEP_TILT = 1

pattern TRACKER_UNKNOWN :: Int

pattern TRACKER_UNKNOWN = 128

pattern TRACKER_ANY_KNOWN :: Int

pattern TRACKER_ANY_KNOWN = 127

interface_added :: Signal GodotARVRServer
interface_added = Signal "interface_added"

interface_removed :: Signal GodotARVRServer
interface_removed = Signal "interface_removed"

tracker_added :: Signal GodotARVRServer
tracker_added = Signal "tracker_added"

tracker_removed :: Signal GodotARVRServer
tracker_removed = Signal "tracker_removed"