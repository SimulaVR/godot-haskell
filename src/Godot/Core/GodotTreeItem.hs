module Godot.Core.GodotTreeItem where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pattern CELL_MODE_CUSTOM :: Int

pattern CELL_MODE_CUSTOM = 4

pattern CELL_MODE_ICON :: Int

pattern CELL_MODE_ICON = 3

pattern CELL_MODE_RANGE :: Int

pattern CELL_MODE_RANGE = 2

pattern CELL_MODE_STRING :: Int

pattern CELL_MODE_STRING = 0

pattern CELL_MODE_CHECK :: Int

pattern CELL_MODE_CHECK = 1

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1