module Godot.Core.GodotCSGShape where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern OPERATION_SUBTRACTION :: Int

pattern OPERATION_SUBTRACTION = 2

pattern OPERATION_UNION :: Int

pattern OPERATION_UNION = 0

pattern OPERATION_INTERSECTION :: Int

pattern OPERATION_INTERSECTION = 1