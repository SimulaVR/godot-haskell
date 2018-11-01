module Godot.Core.Godot_ResourceSaver where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FLAG_REPLACE_SUBRESOURCE_PATHS :: Int

pattern FLAG_REPLACE_SUBRESOURCE_PATHS = 64

pattern FLAG_RELATIVE_PATHS :: Int

pattern FLAG_RELATIVE_PATHS = 1

pattern FLAG_OMIT_EDITOR_PROPERTIES :: Int

pattern FLAG_OMIT_EDITOR_PROPERTIES = 8

pattern FLAG_SAVE_BIG_ENDIAN :: Int

pattern FLAG_SAVE_BIG_ENDIAN = 16

pattern FLAG_CHANGE_PATH :: Int

pattern FLAG_CHANGE_PATH = 4

pattern FLAG_COMPRESS :: Int

pattern FLAG_COMPRESS = 32

pattern FLAG_BUNDLE_RESOURCES :: Int

pattern FLAG_BUNDLE_RESOURCES = 2