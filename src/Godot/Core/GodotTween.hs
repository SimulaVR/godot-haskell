module Godot.Core.GodotTween where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern TRANS_LINEAR :: Int

pattern TRANS_LINEAR = 0

pattern TRANS_BACK :: Int

pattern TRANS_BACK = 10

pattern EASE_OUT :: Int

pattern EASE_OUT = 1

pattern TRANS_CUBIC :: Int

pattern TRANS_CUBIC = 7

pattern EASE_IN :: Int

pattern EASE_IN = 0

pattern TWEEN_PROCESS_IDLE :: Int

pattern TWEEN_PROCESS_IDLE = 1

pattern TRANS_SINE :: Int

pattern TRANS_SINE = 1

pattern TRANS_CIRC :: Int

pattern TRANS_CIRC = 8

pattern EASE_OUT_IN :: Int

pattern EASE_OUT_IN = 3

pattern TRANS_EXPO :: Int

pattern TRANS_EXPO = 5

pattern TRANS_QUAD :: Int

pattern TRANS_QUAD = 4

pattern TWEEN_PROCESS_PHYSICS :: Int

pattern TWEEN_PROCESS_PHYSICS = 0

pattern TRANS_ELASTIC :: Int

pattern TRANS_ELASTIC = 6

pattern TRANS_QUINT :: Int

pattern TRANS_QUINT = 2

pattern TRANS_BOUNCE :: Int

pattern TRANS_BOUNCE = 9

pattern EASE_IN_OUT :: Int

pattern EASE_IN_OUT = 2

pattern TRANS_QUART :: Int

pattern TRANS_QUART = 3

tween_all_completed :: Signal GodotTween
tween_all_completed = Signal "tween_all_completed"

tween_completed :: Signal GodotTween
tween_completed = Signal "tween_completed"

tween_started :: Signal GodotTween
tween_started = Signal "tween_started"

tween_step :: Signal GodotTween
tween_step = Signal "tween_step"