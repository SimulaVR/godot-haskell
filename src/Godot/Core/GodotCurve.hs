module Godot.Core.GodotCurve where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TANGENT_LINEAR :: Int

pattern TANGENT_LINEAR = 1

pattern TANGENT_FREE :: Int

pattern TANGENT_FREE = 0

pattern TANGENT_MODE_COUNT :: Int

pattern TANGENT_MODE_COUNT = 2

range_changed :: Signal GodotCurve
range_changed = Signal "range_changed"