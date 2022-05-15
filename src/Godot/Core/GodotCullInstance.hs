module Godot.Core.GodotCullInstance where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern PORTAL_MODE_GLOBAL :: Int

pattern PORTAL_MODE_GLOBAL = 3

pattern PORTAL_MODE_DYNAMIC :: Int

pattern PORTAL_MODE_DYNAMIC = 1

pattern PORTAL_MODE_STATIC :: Int

pattern PORTAL_MODE_STATIC = 0

pattern PORTAL_MODE_ROAMING :: Int

pattern PORTAL_MODE_ROAMING = 2

pattern PORTAL_MODE_IGNORE :: Int

pattern PORTAL_MODE_IGNORE = 4