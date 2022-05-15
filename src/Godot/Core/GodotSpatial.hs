module Godot.Core.GodotSpatial where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_EXIT_GAMEPLAY :: Int

pattern NOTIFICATION_EXIT_GAMEPLAY = 46

pattern NOTIFICATION_TRANSFORM_CHANGED :: Int

pattern NOTIFICATION_TRANSFORM_CHANGED = 2000

pattern NOTIFICATION_ENTER_GAMEPLAY :: Int

pattern NOTIFICATION_ENTER_GAMEPLAY = 45

pattern NOTIFICATION_VISIBILITY_CHANGED :: Int

pattern NOTIFICATION_VISIBILITY_CHANGED = 43

pattern NOTIFICATION_EXIT_WORLD :: Int

pattern NOTIFICATION_EXIT_WORLD = 42

pattern NOTIFICATION_ENTER_WORLD :: Int

pattern NOTIFICATION_ENTER_WORLD = 41

gameplay_entered :: Signal GodotSpatial
gameplay_entered = Signal "gameplay_entered"

gameplay_exited :: Signal GodotSpatial
gameplay_exited = Signal "gameplay_exited"

visibility_changed :: Signal GodotSpatial
visibility_changed = Signal "visibility_changed"