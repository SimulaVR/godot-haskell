module Godot.Core.GodotCubeMap where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SIDE_RIGHT :: Int

pattern SIDE_RIGHT = 1

pattern STORAGE_RAW :: Int

pattern STORAGE_RAW = 0

pattern SIDE_FRONT :: Int

pattern SIDE_FRONT = 4

pattern SIDE_LEFT :: Int

pattern SIDE_LEFT = 0

pattern FLAGS_DEFAULT :: Int

pattern FLAGS_DEFAULT = 7

pattern FLAG_FILTER :: Int

pattern FLAG_FILTER = 4

pattern STORAGE_COMPRESS_LOSSLESS :: Int

pattern STORAGE_COMPRESS_LOSSLESS = 2

pattern STORAGE_COMPRESS_LOSSY :: Int

pattern STORAGE_COMPRESS_LOSSY = 1

pattern FLAG_REPEAT :: Int

pattern FLAG_REPEAT = 2

pattern FLAG_MIPMAPS :: Int

pattern FLAG_MIPMAPS = 1

pattern SIDE_BOTTOM :: Int

pattern SIDE_BOTTOM = 2

pattern SIDE_TOP :: Int

pattern SIDE_TOP = 3

pattern SIDE_BACK :: Int

pattern SIDE_BACK = 5