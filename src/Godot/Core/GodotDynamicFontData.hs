module Godot.Core.GodotDynamicFontData where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern HINTING_NONE :: Int

pattern HINTING_NONE = 0

pattern HINTING_NORMAL :: Int

pattern HINTING_NORMAL = 2

pattern HINTING_LIGHT :: Int

pattern HINTING_LIGHT = 1