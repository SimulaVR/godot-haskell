module Godot.Core.GodotVisualShaderNodeScalarOp where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern OP_MUL :: Int

pattern OP_MUL = 2

pattern OP_SUB :: Int

pattern OP_SUB = 1

pattern OP_MAX :: Int

pattern OP_MAX = 6

pattern OP_POW :: Int

pattern OP_POW = 5

pattern OP_MOD :: Int

pattern OP_MOD = 4

pattern OP_ADD :: Int

pattern OP_ADD = 0

pattern OP_MIN :: Int

pattern OP_MIN = 7

pattern OP_ATAN2 :: Int

pattern OP_ATAN2 = 8

pattern OP_DIV :: Int

pattern OP_DIV = 3