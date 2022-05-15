module Godot.Core.GodotRoomManager where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern PVS_MODE_FULL :: Int

pattern PVS_MODE_FULL = 2

pattern PVS_MODE_PARTIAL :: Int

pattern PVS_MODE_PARTIAL = 1

pattern PVS_MODE_DISABLED :: Int

pattern PVS_MODE_DISABLED = 0