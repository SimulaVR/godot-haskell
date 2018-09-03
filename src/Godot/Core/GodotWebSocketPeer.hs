module Godot.Core.GodotWebSocketPeer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern WRITE_MODE_TEXT :: Int

pattern WRITE_MODE_TEXT = 0

pattern WRITE_MODE_BINARY :: Int

pattern WRITE_MODE_BINARY = 1