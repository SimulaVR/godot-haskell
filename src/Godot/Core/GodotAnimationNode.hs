module Godot.Core.GodotAnimationNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FILTER_PASS :: Int

pattern FILTER_PASS = 1

pattern FILTER_STOP :: Int

pattern FILTER_STOP = 2

pattern FILTER_IGNORE :: Int

pattern FILTER_IGNORE = 0

pattern FILTER_BLEND :: Int

pattern FILTER_BLEND = 3

removed_from_graph :: Signal GodotAnimationNode
removed_from_graph = Signal "removed_from_graph"

tree_changed :: Signal GodotAnimationNode
tree_changed = Signal "tree_changed"