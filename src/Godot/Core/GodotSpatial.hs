module Godot.Core.GodotSpatial where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern NOTIFICATION_ENTER_WORLD :: Int

pattern NOTIFICATION_ENTER_WORLD = 41

pattern NOTIFICATION_EXIT_WORLD :: Int

pattern NOTIFICATION_EXIT_WORLD = 42

pattern NOTIFICATION_TRANSFORM_CHANGED :: Int

pattern NOTIFICATION_TRANSFORM_CHANGED = 29

pattern NOTIFICATION_VISIBILITY_CHANGED :: Int

pattern NOTIFICATION_VISIBILITY_CHANGED = 43

visibility_changed :: Signal GodotSpatial
visibility_changed = Signal "visibility_changed"