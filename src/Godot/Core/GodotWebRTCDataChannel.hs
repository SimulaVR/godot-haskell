module Godot.Core.GodotWebRTCDataChannel where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STATE_OPEN :: Int

pattern STATE_OPEN = 1

pattern STATE_CLOSED :: Int

pattern STATE_CLOSED = 3

pattern STATE_CONNECTING :: Int

pattern STATE_CONNECTING = 0

pattern WRITE_MODE_TEXT :: Int

pattern WRITE_MODE_TEXT = 0

pattern STATE_CLOSING :: Int

pattern STATE_CLOSING = 2

pattern WRITE_MODE_BINARY :: Int

pattern WRITE_MODE_BINARY = 1