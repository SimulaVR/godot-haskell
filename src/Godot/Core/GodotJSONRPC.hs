module Godot.Core.GodotJSONRPC where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern INTERNAL_ERROR :: Int

pattern INTERNAL_ERROR = -32603

pattern PARSE_ERROR :: Int

pattern PARSE_ERROR = -32700

pattern INVALID_PARAMS :: Int

pattern INVALID_PARAMS = -32602

pattern INVALID_REQUEST :: Int

pattern INVALID_REQUEST = -32600

pattern METHOD_NOT_FOUND :: Int

pattern METHOD_NOT_FOUND = -32601