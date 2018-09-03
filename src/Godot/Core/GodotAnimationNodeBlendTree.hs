module Godot.Core.GodotAnimationNodeBlendTree where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern CONNECTION_ERROR_NO_INPUT_INDEX :: Int

pattern CONNECTION_ERROR_NO_INPUT_INDEX = 2

pattern CONNECTION_ERROR_NO_OUTPUT :: Int

pattern CONNECTION_ERROR_NO_OUTPUT = 3

pattern CONNECTION_OK :: Int

pattern CONNECTION_OK = 0

pattern CONNECTION_ERROR_SAME_NODE :: Int

pattern CONNECTION_ERROR_SAME_NODE = 4

pattern CONNECTION_ERROR_CONNECTION_EXISTS :: Int

pattern CONNECTION_ERROR_CONNECTION_EXISTS = 5

pattern CONNECTION_ERROR_NO_INPUT :: Int

pattern CONNECTION_ERROR_NO_INPUT = 1