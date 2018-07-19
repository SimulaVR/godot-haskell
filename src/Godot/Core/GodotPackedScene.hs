module Godot.Core.GodotPackedScene where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern GEN_EDIT_STATE_DISABLED :: Int

pattern GEN_EDIT_STATE_DISABLED = 0

pattern GEN_EDIT_STATE_MAIN :: Int

pattern GEN_EDIT_STATE_MAIN = 2

pattern GEN_EDIT_STATE_INSTANCE :: Int

pattern GEN_EDIT_STATE_INSTANCE = 1