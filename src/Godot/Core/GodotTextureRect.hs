module Godot.Core.GodotTextureRect where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STRETCH_TILE :: Int

pattern STRETCH_TILE = 2

pattern STRETCH_KEEP_ASPECT_COVERED :: Int

pattern STRETCH_KEEP_ASPECT_COVERED = 7

pattern STRETCH_KEEP_ASPECT :: Int

pattern STRETCH_KEEP_ASPECT = 5

pattern STRETCH_SCALE_ON_EXPAND :: Int

pattern STRETCH_SCALE_ON_EXPAND = 0

pattern STRETCH_SCALE :: Int

pattern STRETCH_SCALE = 1

pattern STRETCH_KEEP :: Int

pattern STRETCH_KEEP = 3

pattern STRETCH_KEEP_CENTERED :: Int

pattern STRETCH_KEEP_CENTERED = 4

pattern STRETCH_KEEP_ASPECT_CENTERED :: Int

pattern STRETCH_KEEP_ASPECT_CENTERED = 6