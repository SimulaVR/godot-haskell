module Godot.Core.GodotClippedCamera where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern CLIP_PROCESS_PHYSICS :: Int

pattern CLIP_PROCESS_PHYSICS = 0

pattern CLIP_PROCESS_IDLE :: Int

pattern CLIP_PROCESS_IDLE = 1