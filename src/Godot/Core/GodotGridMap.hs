module Godot.Core.GodotGridMap where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern INVALID_CELL_ITEM :: Int

pattern INVALID_CELL_ITEM = -1

cell_size_changed :: Signal GodotGridMap
cell_size_changed = Signal "cell_size_changed"