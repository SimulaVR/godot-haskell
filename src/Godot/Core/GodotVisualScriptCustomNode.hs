module Godot.Core.GodotVisualScriptCustomNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STEP_YIELD_BIT :: Int

pattern STEP_YIELD_BIT = 268435456

pattern START_MODE_BEGIN_SEQUENCE :: Int

pattern START_MODE_BEGIN_SEQUENCE = 0

pattern STEP_GO_BACK_BIT :: Int

pattern STEP_GO_BACK_BIT = 33554432

pattern START_MODE_CONTINUE_SEQUENCE :: Int

pattern START_MODE_CONTINUE_SEQUENCE = 1

pattern START_MODE_RESUME_YIELD :: Int

pattern START_MODE_RESUME_YIELD = 2

pattern STEP_EXIT_FUNCTION_BIT :: Int

pattern STEP_EXIT_FUNCTION_BIT = 134217728

pattern STEP_PUSH_STACK_BIT :: Int

pattern STEP_PUSH_STACK_BIT = 16777216

pattern STEP_NO_ADVANCE_BIT :: Int

pattern STEP_NO_ADVANCE_BIT = 67108864