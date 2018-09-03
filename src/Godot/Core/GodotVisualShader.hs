module Godot.Core.GodotVisualShader where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NODE_ID_INVALID :: Int

pattern NODE_ID_INVALID = -1

pattern TYPE_VERTEX :: Int

pattern TYPE_VERTEX = 0

pattern TYPE_FRAGMENT :: Int

pattern TYPE_FRAGMENT = 1

pattern NODE_ID_OUTPUT :: Int

pattern NODE_ID_OUTPUT = 0

pattern TYPE_MAX :: Int

pattern TYPE_MAX = 3

pattern TYPE_LIGHT :: Int

pattern TYPE_LIGHT = 2