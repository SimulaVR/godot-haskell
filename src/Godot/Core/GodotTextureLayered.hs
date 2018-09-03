module Godot.Core.GodotTextureLayered where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FLAGS_DEFAULT :: Int

pattern FLAGS_DEFAULT = 4

pattern FLAG_REPEAT :: Int

pattern FLAG_REPEAT = 2

pattern FLAG_MIPMAPS :: Int

pattern FLAG_MIPMAPS = 1

pattern FLAG_FILTER :: Int

pattern FLAG_FILTER = 4