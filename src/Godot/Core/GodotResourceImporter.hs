module Godot.Core.GodotResourceImporter where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern IMPORT_ORDER_DEFAULT :: Int

pattern IMPORT_ORDER_DEFAULT = 0

pattern IMPORT_ORDER_SCENE :: Int

pattern IMPORT_ORDER_SCENE = 100