module Godot.Core.GodotLinkButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern UNDERLINE_MODE_ALWAYS :: Int

pattern UNDERLINE_MODE_ALWAYS = 0

pattern UNDERLINE_MODE_NEVER :: Int

pattern UNDERLINE_MODE_NEVER = 2

pattern UNDERLINE_MODE_ON_HOVER :: Int

pattern UNDERLINE_MODE_ON_HOVER = 1