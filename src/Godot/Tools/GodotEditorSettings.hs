module Godot.Tools.GodotEditorSettings where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_EDITOR_SETTINGS_CHANGED :: Int

pattern NOTIFICATION_EDITOR_SETTINGS_CHANGED = 10000

settings_changed :: Signal GodotEditorSettings
settings_changed = Signal "settings_changed"