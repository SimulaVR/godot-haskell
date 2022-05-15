module Godot.Core.GodotAudioStreamPlayer3D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ATTENUATION_LOGARITHMIC :: Int

pattern ATTENUATION_LOGARITHMIC = 2

pattern ATTENUATION_INVERSE_SQUARE_DISTANCE :: Int

pattern ATTENUATION_INVERSE_SQUARE_DISTANCE = 1

pattern OUT_OF_RANGE_PAUSE :: Int

pattern OUT_OF_RANGE_PAUSE = 1

pattern ATTENUATION_INVERSE_DISTANCE :: Int

pattern ATTENUATION_INVERSE_DISTANCE = 0

pattern OUT_OF_RANGE_MIX :: Int

pattern OUT_OF_RANGE_MIX = 0

pattern DOPPLER_TRACKING_IDLE_STEP :: Int

pattern DOPPLER_TRACKING_IDLE_STEP = 1

pattern ATTENUATION_DISABLED :: Int

pattern ATTENUATION_DISABLED = 3

pattern DOPPLER_TRACKING_PHYSICS_STEP :: Int

pattern DOPPLER_TRACKING_PHYSICS_STEP = 2

pattern DOPPLER_TRACKING_DISABLED :: Int

pattern DOPPLER_TRACKING_DISABLED = 0

finished :: Signal GodotAudioStreamPlayer3D
finished = Signal "finished"