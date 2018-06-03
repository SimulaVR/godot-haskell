module Godot.Core.GodotMenuButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

about_to_show :: Signal GodotMenuButton
about_to_show = Signal "about_to_show"