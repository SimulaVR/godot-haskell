module Godot.Core.GodotGraphNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern OVERLAY_DISABLED :: Int

pattern OVERLAY_DISABLED = 0

pattern OVERLAY_POSITION :: Int

pattern OVERLAY_POSITION = 2

pattern OVERLAY_BREAKPOINT :: Int

pattern OVERLAY_BREAKPOINT = 1

raise_request :: Signal GodotGraphNode
raise_request = Signal "raise_request"

close_request :: Signal GodotGraphNode
close_request = Signal "close_request"

dragged :: Signal GodotGraphNode
dragged = Signal "dragged"

offset_changed :: Signal GodotGraphNode
offset_changed = Signal "offset_changed"

resize_request :: Signal GodotGraphNode
resize_request = Signal "resize_request"