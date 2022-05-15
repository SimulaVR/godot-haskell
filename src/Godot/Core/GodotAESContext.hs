module Godot.Core.GodotAESContext where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_CBC_ENCRYPT :: Int

pattern MODE_CBC_ENCRYPT = 2

pattern MODE_ECB_DECRYPT :: Int

pattern MODE_ECB_DECRYPT = 1

pattern MODE_MAX :: Int

pattern MODE_MAX = 4

pattern MODE_ECB_ENCRYPT :: Int

pattern MODE_ECB_ENCRYPT = 0

pattern MODE_CBC_DECRYPT :: Int

pattern MODE_CBC_DECRYPT = 3