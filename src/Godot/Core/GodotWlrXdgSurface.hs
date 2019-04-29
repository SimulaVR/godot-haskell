module Godot.Core.GodotWlrXdgSurface where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern XDG_SURFACE_ROLE_POPUP :: Int

pattern XDG_SURFACE_ROLE_POPUP = 2

pattern XDG_SURFACE_ROLE_NONE :: Int

pattern XDG_SURFACE_ROLE_NONE = 0

pattern XDG_SURFACE_ROLE_TOPLEVEL :: Int

pattern XDG_SURFACE_ROLE_TOPLEVEL = 1

map :: Signal GodotWlrXdgSurface
map = Signal "map"

unmap :: Signal GodotWlrXdgSurface
unmap = Signal "unmap"

destroy :: Signal GodotWlrXdgSurface
destroy = Signal "destroy"