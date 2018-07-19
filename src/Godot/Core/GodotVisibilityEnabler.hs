module Godot.Core.GodotVisibilityEnabler where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ENABLER_MAX :: Int

pattern ENABLER_MAX = 2

pattern ENABLER_PAUSE_ANIMATIONS :: Int

pattern ENABLER_PAUSE_ANIMATIONS = 0

pattern ENABLER_FREEZE_BODIES :: Int

pattern ENABLER_FREEZE_BODIES = 1