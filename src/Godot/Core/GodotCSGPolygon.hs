module Godot.Core.GodotCSGPolygon where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_PATH :: Int

pattern MODE_PATH = 2

pattern PATH_ROTATION_PATH :: Int

pattern PATH_ROTATION_PATH = 1

pattern PATH_ROTATION_PATH_FOLLOW :: Int

pattern PATH_ROTATION_PATH_FOLLOW = 2

pattern PATH_ROTATION_POLYGON :: Int

pattern PATH_ROTATION_POLYGON = 0

pattern MODE_SPIN :: Int

pattern MODE_SPIN = 1

pattern MODE_DEPTH :: Int

pattern MODE_DEPTH = 0