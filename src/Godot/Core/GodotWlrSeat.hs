module Godot.Core.GodotWlrSeat where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SEAT_CAPABILITY_POINTER :: Int

pattern SEAT_CAPABILITY_POINTER = 1

pattern SEAT_CAPABILITY_TOUCH :: Int

pattern SEAT_CAPABILITY_TOUCH = 4

pattern SEAT_CAPABILITY_KEYBOARD :: Int

pattern SEAT_CAPABILITY_KEYBOARD = 2