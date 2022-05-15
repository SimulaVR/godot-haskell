module Godot.Core.Godot_Geometry where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern JOIN_ROUND :: Int

pattern JOIN_ROUND = 1

pattern END_ROUND :: Int

pattern END_ROUND = 4

pattern OPERATION_UNION :: Int

pattern OPERATION_UNION = 0

pattern JOIN_SQUARE :: Int

pattern JOIN_SQUARE = 0

pattern END_SQUARE :: Int

pattern END_SQUARE = 3

pattern END_POLYGON :: Int

pattern END_POLYGON = 0

pattern OPERATION_XOR :: Int

pattern OPERATION_XOR = 3

pattern END_JOINED :: Int

pattern END_JOINED = 1

pattern OPERATION_DIFFERENCE :: Int

pattern OPERATION_DIFFERENCE = 1

pattern OPERATION_INTERSECTION :: Int

pattern OPERATION_INTERSECTION = 2

pattern END_BUTT :: Int

pattern END_BUTT = 2

pattern JOIN_MITER :: Int

pattern JOIN_MITER = 2