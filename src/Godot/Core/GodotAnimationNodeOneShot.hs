module Godot.Core.GodotAnimationNodeOneShot where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MIX_MODE_ADD :: Int

pattern MIX_MODE_ADD = 1

pattern MIX_MODE_BLEND :: Int

pattern MIX_MODE_BLEND = 0