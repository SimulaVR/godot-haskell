module Godot.Core.GodotSpriteBase3D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern FLAG_SHADED :: Int

pattern FLAG_SHADED = 1

pattern ALPHA_CUT_OPAQUE_PREPASS :: Int

pattern ALPHA_CUT_OPAQUE_PREPASS = 2

pattern FLAG_DOUBLE_SIDED :: Int

pattern FLAG_DOUBLE_SIDED = 2

pattern ALPHA_CUT_DISABLED :: Int

pattern ALPHA_CUT_DISABLED = 0

pattern ALPHA_CUT_DISCARD :: Int

pattern ALPHA_CUT_DISCARD = 1

pattern FLAG_MAX :: Int

pattern FLAG_MAX = 3

pattern FLAG_TRANSPARENT :: Int

pattern FLAG_TRANSPARENT = 0