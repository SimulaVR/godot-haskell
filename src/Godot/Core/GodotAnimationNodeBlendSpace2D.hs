module Godot.Core.GodotAnimationNodeBlendSpace2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern BLEND_MODE_DISCRETE_CARRY :: Int

pattern BLEND_MODE_DISCRETE_CARRY = 2

pattern BLEND_MODE_DISCRETE :: Int

pattern BLEND_MODE_DISCRETE = 1

pattern BLEND_MODE_INTERPOLATED :: Int

pattern BLEND_MODE_INTERPOLATED = 0

triangles_updated :: Signal GodotAnimationNodeBlendSpace2D
triangles_updated = Signal "triangles_updated"