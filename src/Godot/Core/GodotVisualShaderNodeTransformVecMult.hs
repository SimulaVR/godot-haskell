module Godot.Core.GodotVisualShaderNodeTransformVecMult where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern OP_3x3_BxA :: Int

pattern OP_3x3_BxA = 3

pattern OP_3x3_AxB :: Int

pattern OP_3x3_AxB = 2

pattern OP_AxB :: Int

pattern OP_AxB = 0

pattern OP_BxA :: Int

pattern OP_BxA = 1