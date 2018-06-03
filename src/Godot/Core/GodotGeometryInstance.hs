module Godot.Core.GodotGeometryInstance where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern SHADOW_CASTING_SETTING_SHADOWS_ONLY :: Int

pattern SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3

pattern FLAG_USE_BAKED_LIGHT :: Int

pattern FLAG_USE_BAKED_LIGHT = 0

pattern FLAG_MAX :: Int

pattern FLAG_MAX = 1

pattern SHADOW_CASTING_SETTING_DOUBLE_SIDED :: Int

pattern SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2

pattern SHADOW_CASTING_SETTING_OFF :: Int

pattern SHADOW_CASTING_SETTING_OFF = 0

pattern SHADOW_CASTING_SETTING_ON :: Int

pattern SHADOW_CASTING_SETTING_ON = 1