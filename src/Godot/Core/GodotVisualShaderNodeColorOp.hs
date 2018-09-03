module Godot.Core.GodotVisualShaderNodeColorOp where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern OP_SCREEN :: Int

pattern OP_SCREEN = 0

pattern OP_SOFT_LIGHT :: Int

pattern OP_SOFT_LIGHT = 7

pattern OP_DODGE :: Int

pattern OP_DODGE = 5

pattern OP_BURN :: Int

pattern OP_BURN = 6

pattern OP_HARD_LIGHT :: Int

pattern OP_HARD_LIGHT = 8

pattern OP_DARKEN :: Int

pattern OP_DARKEN = 2

pattern OP_DIFFERENCE :: Int

pattern OP_DIFFERENCE = 1

pattern OP_OVERLAY :: Int

pattern OP_OVERLAY = 4

pattern OP_LIGHTEN :: Int

pattern OP_LIGHTEN = 3