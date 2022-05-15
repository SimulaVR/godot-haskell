module Godot.Core.GodotArrayMesh where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ARRAY_WEIGHTS_SIZE :: Int

pattern ARRAY_WEIGHTS_SIZE = 4

pattern ARRAY_FORMAT_WEIGHTS :: Int

pattern ARRAY_FORMAT_WEIGHTS = 128

pattern ARRAY_NORMAL :: Int

pattern ARRAY_NORMAL = 1

pattern NO_INDEX_ARRAY :: Int

pattern NO_INDEX_ARRAY = -1

pattern ARRAY_MAX :: Int

pattern ARRAY_MAX = 9

pattern ARRAY_FORMAT_COLOR :: Int

pattern ARRAY_FORMAT_COLOR = 8

pattern ARRAY_FORMAT_TEX_UV :: Int

pattern ARRAY_FORMAT_TEX_UV = 16

pattern ARRAY_FORMAT_TEX_UV2 :: Int

pattern ARRAY_FORMAT_TEX_UV2 = 32

pattern ARRAY_FORMAT_NORMAL :: Int

pattern ARRAY_FORMAT_NORMAL = 2

pattern ARRAY_FORMAT_BONES :: Int

pattern ARRAY_FORMAT_BONES = 64

pattern ARRAY_FORMAT_TANGENT :: Int

pattern ARRAY_FORMAT_TANGENT = 4

pattern ARRAY_INDEX :: Int

pattern ARRAY_INDEX = 8

pattern ARRAY_VERTEX :: Int

pattern ARRAY_VERTEX = 0

pattern ARRAY_TEX_UV2 :: Int

pattern ARRAY_TEX_UV2 = 5

pattern ARRAY_COLOR :: Int

pattern ARRAY_COLOR = 3

pattern ARRAY_FORMAT_INDEX :: Int

pattern ARRAY_FORMAT_INDEX = 256

pattern ARRAY_TANGENT :: Int

pattern ARRAY_TANGENT = 2

pattern ARRAY_WEIGHTS :: Int

pattern ARRAY_WEIGHTS = 7

pattern ARRAY_FORMAT_VERTEX :: Int

pattern ARRAY_FORMAT_VERTEX = 1

pattern ARRAY_BONES :: Int

pattern ARRAY_BONES = 6

pattern ARRAY_TEX_UV :: Int

pattern ARRAY_TEX_UV = 4