module Godot.Core.GodotRange where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

value_changed :: Signal GodotRange
value_changed = Signal "value_changed"

changed :: Signal GodotRange
changed = Signal "changed"