module Godot.Core.GodotCanvasItemMaterial where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern BLEND_MODE_ADD :: Int

pattern BLEND_MODE_ADD = 1

pattern BLEND_MODE_PREMULT_ALPHA :: Int

pattern BLEND_MODE_PREMULT_ALPHA = 4

pattern LIGHT_MODE_UNSHADED :: Int

pattern LIGHT_MODE_UNSHADED = 1

pattern BLEND_MODE_MIX :: Int

pattern BLEND_MODE_MIX = 0

pattern LIGHT_MODE_LIGHT_ONLY :: Int

pattern LIGHT_MODE_LIGHT_ONLY = 2

pattern LIGHT_MODE_NORMAL :: Int

pattern LIGHT_MODE_NORMAL = 0

pattern BLEND_MODE_SUB :: Int

pattern BLEND_MODE_SUB = 2

pattern BLEND_MODE_MUL :: Int

pattern BLEND_MODE_MUL = 3