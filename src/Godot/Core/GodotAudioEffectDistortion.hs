module Godot.Core.GodotAudioEffectDistortion where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_CLIP :: Int

pattern MODE_CLIP = 0

pattern MODE_LOFI :: Int

pattern MODE_LOFI = 2

pattern MODE_OVERDRIVE :: Int

pattern MODE_OVERDRIVE = 3

pattern MODE_WAVESHAPE :: Int

pattern MODE_WAVESHAPE = 4

pattern MODE_ATAN :: Int

pattern MODE_ATAN = 1