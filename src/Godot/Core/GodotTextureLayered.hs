module Godot.Core.GodotTextureLayered where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FLAG_FILTER :: Int

pattern FLAG_FILTER = 4

pattern FLAGS_DEFAULT_TEXTURE_ARRAY :: Int

pattern FLAGS_DEFAULT_TEXTURE_ARRAY = 7

pattern FLAG_ANISOTROPIC_FILTER :: Int

pattern FLAG_ANISOTROPIC_FILTER = 8

pattern FLAG_REPEAT :: Int

pattern FLAG_REPEAT = 2

pattern FLAGS_DEFAULT_TEXTURE_3D :: Int

pattern FLAGS_DEFAULT_TEXTURE_3D = 4

pattern FLAG_MIPMAPS :: Int

pattern FLAG_MIPMAPS = 1