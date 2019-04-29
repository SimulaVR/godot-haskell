module Godot.Core.GodotWlrKeyboard where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

key :: Signal GodotWlrKeyboard
key = Signal "key"

modifiers :: Signal GodotWlrKeyboard
modifiers = Signal "modifiers"