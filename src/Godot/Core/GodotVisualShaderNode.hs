module Godot.Core.GodotVisualShaderNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern PORT_TYPE_MAX :: Int

pattern PORT_TYPE_MAX = 5

pattern PORT_TYPE_TRANSFORM :: Int

pattern PORT_TYPE_TRANSFORM = 3

pattern PORT_TYPE_BOOLEAN :: Int

pattern PORT_TYPE_BOOLEAN = 2

pattern PORT_TYPE_SAMPLER :: Int

pattern PORT_TYPE_SAMPLER = 4

pattern PORT_TYPE_SCALAR :: Int

pattern PORT_TYPE_SCALAR = 0

pattern PORT_TYPE_VECTOR :: Int

pattern PORT_TYPE_VECTOR = 1

editor_refresh_request :: Signal GodotVisualShaderNode
editor_refresh_request = Signal "editor_refresh_request"