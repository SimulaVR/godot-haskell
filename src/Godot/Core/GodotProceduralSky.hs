module Godot.Core.GodotProceduralSky where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern TEXTURE_SIZE_512 :: Int

pattern TEXTURE_SIZE_512 = 1

pattern TEXTURE_SIZE_2048 :: Int

pattern TEXTURE_SIZE_2048 = 3

pattern TEXTURE_SIZE_1024 :: Int

pattern TEXTURE_SIZE_1024 = 2

pattern TEXTURE_SIZE_256 :: Int

pattern TEXTURE_SIZE_256 = 0

pattern TEXTURE_SIZE_MAX :: Int

pattern TEXTURE_SIZE_MAX = 5

pattern TEXTURE_SIZE_4096 :: Int

pattern TEXTURE_SIZE_4096 = 4