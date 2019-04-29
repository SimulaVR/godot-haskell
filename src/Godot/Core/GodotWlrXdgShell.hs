module Godot.Core.GodotWlrXdgShell where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

new_surface :: Signal GodotWlrXdgShell
new_surface = Signal "new_surface"