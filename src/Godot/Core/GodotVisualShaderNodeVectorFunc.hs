module Godot.Core.GodotVisualShaderNodeVectorFunc where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_NORMALIZE :: Int

pattern FUNC_NORMALIZE = 0

pattern FUNC_RECIPROCAL :: Int

pattern FUNC_RECIPROCAL = 3

pattern FUNC_HSV2RGB :: Int

pattern FUNC_HSV2RGB = 5

pattern FUNC_RGB2HSV :: Int

pattern FUNC_RGB2HSV = 4

pattern FUNC_NEGATE :: Int

pattern FUNC_NEGATE = 2

pattern FUNC_SATURATE :: Int

pattern FUNC_SATURATE = 1