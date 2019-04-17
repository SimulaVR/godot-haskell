module Godot.Core.GodotAnimation where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TYPE_BEZIER :: Int

pattern TYPE_BEZIER = 3

pattern INTERPOLATION_NEAREST :: Int

pattern INTERPOLATION_NEAREST = 0

pattern UPDATE_DISCRETE :: Int

pattern UPDATE_DISCRETE = 1

pattern INTERPOLATION_LINEAR :: Int

pattern INTERPOLATION_LINEAR = 1

pattern TYPE_VALUE :: Int

pattern TYPE_VALUE = 0

pattern UPDATE_CAPTURE :: Int

pattern UPDATE_CAPTURE = 3

pattern TYPE_METHOD :: Int

pattern TYPE_METHOD = 2

pattern UPDATE_CONTINUOUS :: Int

pattern UPDATE_CONTINUOUS = 0

pattern INTERPOLATION_CUBIC :: Int

pattern INTERPOLATION_CUBIC = 2

pattern TYPE_TRANSFORM :: Int

pattern TYPE_TRANSFORM = 1

pattern UPDATE_TRIGGER :: Int

pattern UPDATE_TRIGGER = 2

pattern TYPE_AUDIO :: Int

pattern TYPE_AUDIO = 4

pattern TYPE_ANIMATION :: Int

pattern TYPE_ANIMATION = 5

tracks_changed :: Signal GodotAnimation
tracks_changed = Signal "tracks_changed"