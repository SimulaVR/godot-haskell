module Godot.Core.GodotBoxContainer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

pattern ALIGN_BEGIN :: Int

pattern ALIGN_BEGIN = 0

pattern ALIGN_END :: Int

pattern ALIGN_END = 2