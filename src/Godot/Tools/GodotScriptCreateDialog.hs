module Godot.Tools.GodotScriptCreateDialog where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

script_created :: Signal GodotScriptCreateDialog
script_created = Signal "script_created"