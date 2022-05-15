module Godot.Core.Godot_File where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern COMPRESSION_GZIP :: Int

pattern COMPRESSION_GZIP = 3

pattern READ_WRITE :: Int

pattern READ_WRITE = 3

pattern WRITE :: Int

pattern WRITE = 2

pattern READ :: Int

pattern READ = 1

pattern COMPRESSION_DEFLATE :: Int

pattern COMPRESSION_DEFLATE = 1

pattern COMPRESSION_FASTLZ :: Int

pattern COMPRESSION_FASTLZ = 0

pattern WRITE_READ :: Int

pattern WRITE_READ = 7

pattern COMPRESSION_ZSTD :: Int

pattern COMPRESSION_ZSTD = 2