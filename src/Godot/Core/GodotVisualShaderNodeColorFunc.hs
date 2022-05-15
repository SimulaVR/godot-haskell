module Godot.Core.GodotVisualShaderNodeColorFunc where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_SEPIA :: Int

pattern FUNC_SEPIA = 1

pattern FUNC_GRAYSCALE :: Int

pattern FUNC_GRAYSCALE = 0