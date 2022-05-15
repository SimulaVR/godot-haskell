module Godot.Core.GodotVisualShaderNodeIs where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_IS_NAN :: Int

pattern FUNC_IS_NAN = 1

pattern FUNC_IS_INF :: Int

pattern FUNC_IS_INF = 0