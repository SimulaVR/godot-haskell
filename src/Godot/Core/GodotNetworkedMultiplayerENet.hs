module Godot.Core.GodotNetworkedMultiplayerENet where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern COMPRESS_ZLIB :: Int

pattern COMPRESS_ZLIB = 3

pattern COMPRESS_ZSTD :: Int

pattern COMPRESS_ZSTD = 4

pattern COMPRESS_RANGE_CODER :: Int

pattern COMPRESS_RANGE_CODER = 1

pattern COMPRESS_NONE :: Int

pattern COMPRESS_NONE = 0

pattern COMPRESS_FASTLZ :: Int

pattern COMPRESS_FASTLZ = 2