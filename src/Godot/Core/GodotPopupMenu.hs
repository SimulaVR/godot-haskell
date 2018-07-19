module Godot.Core.GodotPopupMenu where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

index_pressed :: Signal GodotPopupMenu
index_pressed = Signal "index_pressed"

id_pressed :: Signal GodotPopupMenu
id_pressed = Signal "id_pressed"