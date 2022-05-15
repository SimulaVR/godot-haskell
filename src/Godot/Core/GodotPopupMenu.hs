module Godot.Core.GodotPopupMenu where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

id_focused :: Signal GodotPopupMenu
id_focused = Signal "id_focused"

id_pressed :: Signal GodotPopupMenu
id_pressed = Signal "id_pressed"

index_pressed :: Signal GodotPopupMenu
index_pressed = Signal "index_pressed"