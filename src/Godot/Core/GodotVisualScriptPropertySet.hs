module Godot.Core.GodotVisualScriptPropertySet where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ASSIGN_OP_DIV :: Int

pattern ASSIGN_OP_DIV = 4

pattern ASSIGN_OP_MOD :: Int

pattern ASSIGN_OP_MOD = 5

pattern ASSIGN_OP_SHIFT_LEFT :: Int

pattern ASSIGN_OP_SHIFT_LEFT = 6

pattern ASSIGN_OP_BIT_OR :: Int

pattern ASSIGN_OP_BIT_OR = 9

pattern ASSIGN_OP_BIT_XOR :: Int

pattern ASSIGN_OP_BIT_XOR = 10

pattern CALL_MODE_NODE_PATH :: Int

pattern CALL_MODE_NODE_PATH = 1

pattern CALL_MODE_BASIC_TYPE :: Int

pattern CALL_MODE_BASIC_TYPE = 3

pattern CALL_MODE_INSTANCE :: Int

pattern CALL_MODE_INSTANCE = 2

pattern CALL_MODE_SELF :: Int

pattern CALL_MODE_SELF = 0

pattern ASSIGN_OP_ADD :: Int

pattern ASSIGN_OP_ADD = 1

pattern ASSIGN_OP_SUB :: Int

pattern ASSIGN_OP_SUB = 2

pattern ASSIGN_OP_MUL :: Int

pattern ASSIGN_OP_MUL = 3

pattern ASSIGN_OP_BIT_AND :: Int

pattern ASSIGN_OP_BIT_AND = 8

pattern ASSIGN_OP_NONE :: Int

pattern ASSIGN_OP_NONE = 0

pattern ASSIGN_OP_SHIFT_RIGHT :: Int

pattern ASSIGN_OP_SHIFT_RIGHT = 7