module Godot.Core.GodotPathFollow where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ROTATION_ORIENTED :: Int

pattern ROTATION_ORIENTED = 4

pattern ROTATION_XY :: Int

pattern ROTATION_XY = 2

pattern ROTATION_Y :: Int

pattern ROTATION_Y = 1

pattern ROTATION_XYZ :: Int

pattern ROTATION_XYZ = 3

pattern ROTATION_NONE :: Int

pattern ROTATION_NONE = 0