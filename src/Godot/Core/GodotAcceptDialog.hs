module Godot.Core.GodotAcceptDialog where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

confirmed :: Signal GodotAcceptDialog
confirmed = Signal "confirmed"

custom_action :: Signal GodotAcceptDialog
custom_action = Signal "custom_action"