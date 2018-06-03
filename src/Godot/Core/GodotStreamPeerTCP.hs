module Godot.Core.GodotStreamPeerTCP where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern STATUS_CONNECTED :: Int

pattern STATUS_CONNECTED = 2

pattern STATUS_CONNECTING :: Int

pattern STATUS_CONNECTING = 1

pattern STATUS_ERROR :: Int

pattern STATUS_ERROR = 3

pattern STATUS_NONE :: Int

pattern STATUS_NONE = 0