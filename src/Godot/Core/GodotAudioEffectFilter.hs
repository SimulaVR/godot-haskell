module Godot.Core.GodotAudioEffectFilter where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FILTER_24DB :: Int

pattern FILTER_24DB = 3

pattern FILTER_12DB :: Int

pattern FILTER_12DB = 1

pattern FILTER_18DB :: Int

pattern FILTER_18DB = 2

pattern FILTER_6DB :: Int

pattern FILTER_6DB = 0