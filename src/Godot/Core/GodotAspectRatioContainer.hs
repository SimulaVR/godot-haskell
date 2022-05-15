module Godot.Core.GodotAspectRatioContainer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STRETCH_FIT :: Int

pattern STRETCH_FIT = 2

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

pattern ALIGN_BEGIN :: Int

pattern ALIGN_BEGIN = 0

pattern STRETCH_HEIGHT_CONTROLS_WIDTH :: Int

pattern STRETCH_HEIGHT_CONTROLS_WIDTH = 1

pattern STRETCH_COVER :: Int

pattern STRETCH_COVER = 3

pattern STRETCH_WIDTH_CONTROLS_HEIGHT :: Int

pattern STRETCH_WIDTH_CONTROLS_HEIGHT = 0

pattern ALIGN_END :: Int

pattern ALIGN_END = 2