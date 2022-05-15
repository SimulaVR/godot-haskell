module Godot.Core.GodotShader where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_CANVAS_ITEM :: Int

pattern MODE_CANVAS_ITEM = 1

pattern MODE_SPATIAL :: Int

pattern MODE_SPATIAL = 0

pattern MODE_PARTICLES :: Int

pattern MODE_PARTICLES = 2