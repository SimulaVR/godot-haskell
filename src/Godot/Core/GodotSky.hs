module Godot.Core.GodotSky where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern RADIANCE_SIZE_128 :: Int

pattern RADIANCE_SIZE_128 = 2

pattern RADIANCE_SIZE_2048 :: Int

pattern RADIANCE_SIZE_2048 = 6

pattern RADIANCE_SIZE_512 :: Int

pattern RADIANCE_SIZE_512 = 4

pattern RADIANCE_SIZE_1024 :: Int

pattern RADIANCE_SIZE_1024 = 5

pattern RADIANCE_SIZE_64 :: Int

pattern RADIANCE_SIZE_64 = 1

pattern RADIANCE_SIZE_32 :: Int

pattern RADIANCE_SIZE_32 = 0

pattern RADIANCE_SIZE_256 :: Int

pattern RADIANCE_SIZE_256 = 3

pattern RADIANCE_SIZE_MAX :: Int

pattern RADIANCE_SIZE_MAX = 7