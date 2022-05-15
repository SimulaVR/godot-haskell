module Godot.Core.GodotHashingContext where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern HASH_MD5 :: Int

pattern HASH_MD5 = 0

pattern HASH_SHA1 :: Int

pattern HASH_SHA1 = 1

pattern HASH_SHA256 :: Int

pattern HASH_SHA256 = 2