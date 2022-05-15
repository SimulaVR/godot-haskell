module Godot.Core.GodotVisualShaderNodeTransformMult where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern OP_BxA_COMP :: Int

pattern OP_BxA_COMP = 3

pattern OP_AxB_COMP :: Int

pattern OP_AxB_COMP = 2

pattern OP_AxB :: Int

pattern OP_AxB = 0

pattern OP_BxA :: Int

pattern OP_BxA = 1