module Godot.Core.GodotDynamicFont where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern SPACING_TOP :: Int

pattern SPACING_TOP = 0

pattern SPACING_SPACE :: Int

pattern SPACING_SPACE = 3

pattern SPACING_CHAR :: Int

pattern SPACING_CHAR = 2

pattern SPACING_BOTTOM :: Int

pattern SPACING_BOTTOM = 1