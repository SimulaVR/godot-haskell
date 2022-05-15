module Godot.Core.GodotAudioEffectSpectrumAnalyzerInstance where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MAGNITUDE_AVERAGE :: Int

pattern MAGNITUDE_AVERAGE = 0

pattern MAGNITUDE_MAX :: Int

pattern MAGNITUDE_MAX = 1