module Godot.Core.GodotVisualScriptYield where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern YIELD_FRAME :: Int

pattern YIELD_FRAME = 1

pattern YIELD_PHYSICS_FRAME :: Int

pattern YIELD_PHYSICS_FRAME = 2

pattern YIELD_WAIT :: Int

pattern YIELD_WAIT = 3