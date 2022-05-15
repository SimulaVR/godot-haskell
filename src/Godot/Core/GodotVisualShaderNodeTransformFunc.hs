module Godot.Core.GodotVisualShaderNodeTransformFunc where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_INVERSE :: Int

pattern FUNC_INVERSE = 0

pattern FUNC_TRANSPOSE :: Int

pattern FUNC_TRANSPOSE = 1