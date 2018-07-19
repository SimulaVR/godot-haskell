module Godot.Core.GodotGDScriptFunctionState where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

completed :: Signal GodotGDScriptFunctionState
completed = Signal "completed"