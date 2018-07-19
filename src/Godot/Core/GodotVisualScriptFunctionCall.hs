module Godot.Core.GodotVisualScriptFunctionCall where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern CALL_MODE_BASIC_TYPE :: Int

pattern CALL_MODE_BASIC_TYPE = 3

pattern RPC_UNRELIABLE_TO_ID :: Int

pattern RPC_UNRELIABLE_TO_ID = 4

pattern CALL_MODE_NODE_PATH :: Int

pattern CALL_MODE_NODE_PATH = 1

pattern RPC_UNRELIABLE :: Int

pattern RPC_UNRELIABLE = 2

pattern CALL_MODE_SELF :: Int

pattern CALL_MODE_SELF = 0

pattern RPC_RELIABLE_TO_ID :: Int

pattern RPC_RELIABLE_TO_ID = 3

pattern CALL_MODE_INSTANCE :: Int

pattern CALL_MODE_INSTANCE = 2

pattern CALL_MODE_SINGLETON :: Int

pattern CALL_MODE_SINGLETON = 4

pattern RPC_DISABLED :: Int

pattern RPC_DISABLED = 0

pattern RPC_RELIABLE :: Int

pattern RPC_RELIABLE = 1