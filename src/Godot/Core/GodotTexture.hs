module Godot.Core.GodotTexture where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern FLAG_VIDEO_SURFACE :: Int

pattern FLAG_VIDEO_SURFACE = 4096

pattern FLAGS_DEFAULT :: Int

pattern FLAGS_DEFAULT = 7

pattern FLAG_REPEAT :: Int

pattern FLAG_REPEAT = 2

pattern FLAG_CONVERT_TO_LINEAR :: Int

pattern FLAG_CONVERT_TO_LINEAR = 16

pattern FLAG_ANISOTROPIC_FILTER :: Int

pattern FLAG_ANISOTROPIC_FILTER = 8

pattern FLAG_MIPMAPS :: Int

pattern FLAG_MIPMAPS = 1

pattern FLAG_FILTER :: Int

pattern FLAG_FILTER = 4

pattern FLAG_MIRRORED_REPEAT :: Int

pattern FLAG_MIRRORED_REPEAT = 32