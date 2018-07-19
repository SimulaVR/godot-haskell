module Godot.Core.GodotProximityGroup where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_SIGNAL :: Int

pattern MODE_SIGNAL = 1

pattern MODE_PROXY :: Int

pattern MODE_PROXY = 0

broadcast :: Signal GodotProximityGroup
broadcast = Signal "broadcast"