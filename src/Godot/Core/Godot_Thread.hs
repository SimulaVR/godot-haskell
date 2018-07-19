module Godot.Core.Godot_Thread where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern PRIORITY_NORMAL :: Int

pattern PRIORITY_NORMAL = 1

pattern PRIORITY_LOW :: Int

pattern PRIORITY_LOW = 0

pattern PRIORITY_HIGH :: Int

pattern PRIORITY_HIGH = 2