module Godot.Core.GodotNavigationMesh where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern SAMPLE_PARTITION_LAYERS :: Int

pattern SAMPLE_PARTITION_LAYERS = 2

pattern SAMPLE_PARTITION_WATERSHED :: Int

pattern SAMPLE_PARTITION_WATERSHED = 0

pattern SAMPLE_PARTITION_MONOTONE :: Int

pattern SAMPLE_PARTITION_MONOTONE = 1