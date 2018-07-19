module Godot.Core.GodotButton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1