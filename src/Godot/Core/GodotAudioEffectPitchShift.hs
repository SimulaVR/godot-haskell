module Godot.Core.GodotAudioEffectPitchShift where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FFT_SIZE_MAX :: Int

pattern FFT_SIZE_MAX = 5

pattern FFT_SIZE_1024 :: Int

pattern FFT_SIZE_1024 = 2

pattern FFT_SIZE_2048 :: Int

pattern FFT_SIZE_2048 = 3

pattern FFT_SIZE_4096 :: Int

pattern FFT_SIZE_4096 = 4

pattern FFT_SIZE_512 :: Int

pattern FFT_SIZE_512 = 1

pattern FFT_SIZE_256 :: Int

pattern FFT_SIZE_256 = 0