module Godot.Core.GodotOptionButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

item_focused :: Signal GodotOptionButton
item_focused = Signal "item_focused"

item_selected :: Signal GodotOptionButton
item_selected = Signal "item_selected"