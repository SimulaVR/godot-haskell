module Godot.Core.GodotVisualScriptInputAction where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_PRESSED :: Int

pattern MODE_PRESSED = 0

pattern MODE_JUST_RELEASED :: Int

pattern MODE_JUST_RELEASED = 3

pattern MODE_RELEASED :: Int

pattern MODE_RELEASED = 1

pattern MODE_JUST_PRESSED :: Int

pattern MODE_JUST_PRESSED = 2