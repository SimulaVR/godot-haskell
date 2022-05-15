module Godot.Core.GodotUndoRedo where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MERGE_DISABLE :: Int

pattern MERGE_DISABLE = 0

pattern MERGE_ALL :: Int

pattern MERGE_ALL = 2

pattern MERGE_ENDS :: Int

pattern MERGE_ENDS = 1

version_changed :: Signal GodotUndoRedo
version_changed = Signal "version_changed"