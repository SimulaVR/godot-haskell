module Godot.Core.GodotTextureButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STRETCH_TILE :: Int

pattern STRETCH_TILE = 1

pattern STRETCH_KEEP_ASPECT_COVERED :: Int

pattern STRETCH_KEEP_ASPECT_COVERED = 6

pattern STRETCH_KEEP_ASPECT :: Int

pattern STRETCH_KEEP_ASPECT = 4

pattern STRETCH_SCALE :: Int

pattern STRETCH_SCALE = 0

pattern STRETCH_KEEP :: Int

pattern STRETCH_KEEP = 2

pattern STRETCH_KEEP_CENTERED :: Int

pattern STRETCH_KEEP_CENTERED = 3

pattern STRETCH_KEEP_ASPECT_CENTERED :: Int

pattern STRETCH_KEEP_ASPECT_CENTERED = 5