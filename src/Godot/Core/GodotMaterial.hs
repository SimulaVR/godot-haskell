module Godot.Core.GodotMaterial where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern RENDER_PRIORITY_MIN :: Int

pattern RENDER_PRIORITY_MIN = -128

pattern RENDER_PRIORITY_MAX :: Int

pattern RENDER_PRIORITY_MAX = 127