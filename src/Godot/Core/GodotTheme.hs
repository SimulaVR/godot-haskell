module Godot.Core.GodotTheme where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern DATA_TYPE_STYLEBOX :: Int

pattern DATA_TYPE_STYLEBOX = 4

pattern DATA_TYPE_COLOR :: Int

pattern DATA_TYPE_COLOR = 0

pattern DATA_TYPE_CONSTANT :: Int

pattern DATA_TYPE_CONSTANT = 1

pattern DATA_TYPE_ICON :: Int

pattern DATA_TYPE_ICON = 3

pattern DATA_TYPE_FONT :: Int

pattern DATA_TYPE_FONT = 2

pattern DATA_TYPE_MAX :: Int

pattern DATA_TYPE_MAX = 5