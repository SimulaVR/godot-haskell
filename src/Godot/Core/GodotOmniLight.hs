module Godot.Core.GodotOmniLight where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SHADOW_DETAIL_HORIZONTAL :: Int

pattern SHADOW_DETAIL_HORIZONTAL = 1

pattern SHADOW_DUAL_PARABOLOID :: Int

pattern SHADOW_DUAL_PARABOLOID = 0

pattern SHADOW_DETAIL_VERTICAL :: Int

pattern SHADOW_DETAIL_VERTICAL = 0

pattern SHADOW_CUBE :: Int

pattern SHADOW_CUBE = 1