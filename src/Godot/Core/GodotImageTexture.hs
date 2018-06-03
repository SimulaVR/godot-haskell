module Godot.Core.GodotImageTexture where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern STORAGE_RAW :: Int

pattern STORAGE_RAW = 0

pattern STORAGE_COMPRESS_LOSSLESS :: Int

pattern STORAGE_COMPRESS_LOSSLESS = 2

pattern STORAGE_COMPRESS_LOSSY :: Int

pattern STORAGE_COMPRESS_LOSSY = 1