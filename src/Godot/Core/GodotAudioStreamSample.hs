module Godot.Core.GodotAudioStreamSample where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern FORMAT_8_BITS :: Int

pattern FORMAT_8_BITS = 0

pattern LOOP_PING_PONG :: Int

pattern LOOP_PING_PONG = 2

pattern LOOP_DISABLED :: Int

pattern LOOP_DISABLED = 0

pattern FORMAT_IMA_ADPCM :: Int

pattern FORMAT_IMA_ADPCM = 2

pattern LOOP_FORWARD :: Int

pattern LOOP_FORWARD = 1

pattern FORMAT_16_BITS :: Int

pattern FORMAT_16_BITS = 1