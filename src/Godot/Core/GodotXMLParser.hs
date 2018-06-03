module Godot.Core.GodotXMLParser where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern NODE_UNKNOWN :: Int

pattern NODE_UNKNOWN = 6

pattern NODE_ELEMENT :: Int

pattern NODE_ELEMENT = 1

pattern NODE_CDATA :: Int

pattern NODE_CDATA = 5

pattern NODE_COMMENT :: Int

pattern NODE_COMMENT = 4

pattern NODE_TEXT :: Int

pattern NODE_TEXT = 3

pattern NODE_NONE :: Int

pattern NODE_NONE = 0

pattern NODE_ELEMENT_END :: Int

pattern NODE_ELEMENT_END = 2