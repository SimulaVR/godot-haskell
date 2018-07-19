module Godot.Core.GodotCollisionPolygon2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern BUILD_SOLIDS :: Int

pattern BUILD_SOLIDS = 0

pattern BUILD_SEGMENTS :: Int

pattern BUILD_SEGMENTS = 1