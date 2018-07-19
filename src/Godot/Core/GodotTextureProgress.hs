module Godot.Core.GodotTextureProgress where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FILL_BOTTOM_TO_TOP :: Int

pattern FILL_BOTTOM_TO_TOP = 3

pattern FILL_TOP_TO_BOTTOM :: Int

pattern FILL_TOP_TO_BOTTOM = 2

pattern FILL_RIGHT_TO_LEFT :: Int

pattern FILL_RIGHT_TO_LEFT = 1

pattern FILL_CLOCKWISE :: Int

pattern FILL_CLOCKWISE = 4

pattern FILL_LEFT_TO_RIGHT :: Int

pattern FILL_LEFT_TO_RIGHT = 0

pattern FILL_COUNTER_CLOCKWISE :: Int

pattern FILL_COUNTER_CLOCKWISE = 5