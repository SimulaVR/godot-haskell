module Godot.Core.GodotObject where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern CONNECT_PERSIST :: Int

pattern CONNECT_PERSIST = 2

pattern CONNECT_ONESHOT :: Int

pattern CONNECT_ONESHOT = 4

pattern CONNECT_DEFERRED :: Int

pattern CONNECT_DEFERRED = 1

pattern NOTIFICATION_POSTINITIALIZE :: Int

pattern NOTIFICATION_POSTINITIALIZE = 0

pattern NOTIFICATION_PREDELETE :: Int

pattern NOTIFICATION_PREDELETE = 1

pattern CONNECT_REFERENCE_COUNTED :: Int

pattern CONNECT_REFERENCE_COUNTED = 8

script_changed :: Signal GodotObject
script_changed = Signal "script_changed"