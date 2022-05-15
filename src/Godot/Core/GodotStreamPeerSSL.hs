module Godot.Core.GodotStreamPeerSSL where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STATUS_ERROR :: Int

pattern STATUS_ERROR = 3

pattern STATUS_DISCONNECTED :: Int

pattern STATUS_DISCONNECTED = 0

pattern STATUS_HANDSHAKING :: Int

pattern STATUS_HANDSHAKING = 1

pattern STATUS_ERROR_HOSTNAME_MISMATCH :: Int

pattern STATUS_ERROR_HOSTNAME_MISMATCH = 4

pattern STATUS_CONNECTED :: Int

pattern STATUS_CONNECTED = 2