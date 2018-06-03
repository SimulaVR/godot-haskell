module Godot.Core.GodotARVRInterface where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern ARVR_STEREO :: Int

pattern ARVR_STEREO = 2

pattern ARVR_INSUFFICIENT_FEATURES :: Int

pattern ARVR_INSUFFICIENT_FEATURES = 2

pattern ARVR_NOT_TRACKING :: Int

pattern ARVR_NOT_TRACKING = 4

pattern EYE_MONO :: Int

pattern EYE_MONO = 0

pattern EYE_LEFT :: Int

pattern EYE_LEFT = 1

pattern ARVR_EXCESSIVE_MOTION :: Int

pattern ARVR_EXCESSIVE_MOTION = 1

pattern ARVR_NORMAL_TRACKING :: Int

pattern ARVR_NORMAL_TRACKING = 0

pattern EYE_RIGHT :: Int

pattern EYE_RIGHT = 2

pattern ARVR_NONE :: Int

pattern ARVR_NONE = 0

pattern ARVR_EXTERNAL :: Int

pattern ARVR_EXTERNAL = 8

pattern ARVR_UNKNOWN_TRACKING :: Int

pattern ARVR_UNKNOWN_TRACKING = 3

pattern ARVR_AR :: Int

pattern ARVR_AR = 4

pattern ARVR_MONO :: Int

pattern ARVR_MONO = 1