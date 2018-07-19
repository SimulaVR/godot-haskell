module Godot.Core.GodotAudioServer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SPEAKER_SURROUND_71 :: Int

pattern SPEAKER_SURROUND_71 = 3

pattern SPEAKER_MODE_STEREO :: Int

pattern SPEAKER_MODE_STEREO = 0

pattern SPEAKER_SURROUND_51 :: Int

pattern SPEAKER_SURROUND_51 = 2

bus_layout_changed :: Signal GodotAudioServer
bus_layout_changed = Signal "bus_layout_changed"