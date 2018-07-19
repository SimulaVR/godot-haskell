module Godot.Core.GodotAnimationTreePlayer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NODE_TIMESEEK :: Int

pattern NODE_TIMESEEK = 8

pattern NODE_OUTPUT :: Int

pattern NODE_OUTPUT = 0

pattern NODE_ANIMATION :: Int

pattern NODE_ANIMATION = 1

pattern NODE_BLEND2 :: Int

pattern NODE_BLEND2 = 4

pattern NODE_TIMESCALE :: Int

pattern NODE_TIMESCALE = 7

pattern NODE_BLEND4 :: Int

pattern NODE_BLEND4 = 6

pattern NODE_BLEND3 :: Int

pattern NODE_BLEND3 = 5

pattern NODE_TRANSITION :: Int

pattern NODE_TRANSITION = 9

pattern NODE_MIX :: Int

pattern NODE_MIX = 3

pattern NODE_ONESHOT :: Int

pattern NODE_ONESHOT = 2

pattern ANIMATION_PROCESS_PHYSICS :: Int

pattern ANIMATION_PROCESS_PHYSICS = 0

pattern ANIMATION_PROCESS_IDLE :: Int

pattern ANIMATION_PROCESS_IDLE = 1