module Godot.Core.GodotReflectionProbe where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern UPDATE_ALWAYS :: Int

pattern UPDATE_ALWAYS = 1

pattern UPDATE_ONCE :: Int

pattern UPDATE_ONCE = 0