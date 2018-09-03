module Godot.Core.GodotAnimationNodeStateMachineTransition where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SWITCH_MODE_IMMEDIATE :: Int

pattern SWITCH_MODE_IMMEDIATE = 0

pattern SWITCH_MODE_SYNC :: Int

pattern SWITCH_MODE_SYNC = 1

pattern SWITCH_MODE_AT_END :: Int

pattern SWITCH_MODE_AT_END = 2

advance_condition_changed ::
                          Signal GodotAnimationNodeStateMachineTransition
advance_condition_changed = Signal "advance_condition_changed"