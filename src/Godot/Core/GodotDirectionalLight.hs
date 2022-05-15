module Godot.Core.GodotDirectionalLight where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SHADOW_DEPTH_RANGE_OPTIMIZED :: Int

pattern SHADOW_DEPTH_RANGE_OPTIMIZED = 1

pattern SHADOW_PARALLEL_4_SPLITS :: Int

pattern SHADOW_PARALLEL_4_SPLITS = 2

pattern SHADOW_ORTHOGONAL :: Int

pattern SHADOW_ORTHOGONAL = 0

pattern SHADOW_DEPTH_RANGE_STABLE :: Int

pattern SHADOW_DEPTH_RANGE_STABLE = 0

pattern SHADOW_PARALLEL_2_SPLITS :: Int

pattern SHADOW_PARALLEL_2_SPLITS = 1