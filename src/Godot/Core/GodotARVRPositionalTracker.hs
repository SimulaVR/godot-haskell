module Godot.Core.GodotARVRPositionalTracker where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TRACKER_LEFT_HAND :: Int

pattern TRACKER_LEFT_HAND = 1

pattern TRACKER_RIGHT_HAND :: Int

pattern TRACKER_RIGHT_HAND = 2

pattern TRACKER_HAND_UNKNOWN :: Int

pattern TRACKER_HAND_UNKNOWN = 0