module Godot.Core.GodotMesh where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern ARRAY_COMPRESS_WEIGHTS :: Int

pattern ARRAY_COMPRESS_WEIGHTS = 65536

pattern ARRAY_FLAG_USE_16_BIT_BONES :: Int

pattern ARRAY_FLAG_USE_16_BIT_BONES = 524288

pattern ARRAY_FORMAT_INDEX :: Int

pattern ARRAY_FORMAT_INDEX = 256

pattern ARRAY_COMPRESS_TANGENT :: Int

pattern ARRAY_COMPRESS_TANGENT = 2048

pattern ARRAY_COMPRESS_NORMAL :: Int

pattern ARRAY_COMPRESS_NORMAL = 1024

pattern ARRAY_FORMAT_COLOR :: Int

pattern ARRAY_FORMAT_COLOR = 8

pattern ARRAY_FORMAT_TEX_UV :: Int

pattern ARRAY_FORMAT_TEX_UV = 16

pattern ARRAY_COMPRESS_VERTEX :: Int

pattern ARRAY_COMPRESS_VERTEX = 512

pattern ARRAY_FORMAT_VERTEX :: Int

pattern ARRAY_FORMAT_VERTEX = 1

pattern ARRAY_COMPRESS_TEX_UV :: Int

pattern ARRAY_COMPRESS_TEX_UV = 8192

pattern ARRAY_COMPRESS_BASE :: Int

pattern ARRAY_COMPRESS_BASE = 9

pattern ARRAY_COMPRESS_BONES :: Int

pattern ARRAY_COMPRESS_BONES = 32768

pattern ARRAY_MAX :: Int

pattern ARRAY_MAX = 9

pattern ARRAY_NORMAL :: Int

pattern ARRAY_NORMAL = 1

pattern ARRAY_FORMAT_TEX_UV2 :: Int

pattern ARRAY_FORMAT_TEX_UV2 = 32

pattern ARRAY_INDEX :: Int

pattern ARRAY_INDEX = 8

pattern ARRAY_COLOR :: Int

pattern ARRAY_COLOR = 3

pattern PRIMITIVE_TRIANGLE_STRIP :: Int

pattern PRIMITIVE_TRIANGLE_STRIP = 5

pattern PRIMITIVE_TRIANGLES :: Int

pattern PRIMITIVE_TRIANGLES = 4

pattern ARRAY_TEX_UV :: Int

pattern ARRAY_TEX_UV = 4

pattern BLEND_SHAPE_MODE_NORMALIZED :: Int

pattern BLEND_SHAPE_MODE_NORMALIZED = 0

pattern PRIMITIVE_LINE_LOOP :: Int

pattern PRIMITIVE_LINE_LOOP = 3

pattern PRIMITIVE_TRIANGLE_FAN :: Int

pattern PRIMITIVE_TRIANGLE_FAN = 6

pattern ARRAY_FORMAT_NORMAL :: Int

pattern ARRAY_FORMAT_NORMAL = 2

pattern ARRAY_TEX_UV2 :: Int

pattern ARRAY_TEX_UV2 = 5

pattern ARRAY_COMPRESS_DEFAULT :: Int

pattern ARRAY_COMPRESS_DEFAULT = 97792

pattern ARRAY_FORMAT_BONES :: Int

pattern ARRAY_FORMAT_BONES = 64

pattern ARRAY_COMPRESS_COLOR :: Int

pattern ARRAY_COMPRESS_COLOR = 4096

pattern ARRAY_WEIGHTS :: Int

pattern ARRAY_WEIGHTS = 7

pattern ARRAY_TANGENT :: Int

pattern ARRAY_TANGENT = 2

pattern ARRAY_COMPRESS_TEX_UV2 :: Int

pattern ARRAY_COMPRESS_TEX_UV2 = 16384

pattern PRIMITIVE_LINE_STRIP :: Int

pattern PRIMITIVE_LINE_STRIP = 2

pattern PRIMITIVE_LINES :: Int

pattern PRIMITIVE_LINES = 1

pattern ARRAY_BONES :: Int

pattern ARRAY_BONES = 6

pattern BLEND_SHAPE_MODE_RELATIVE :: Int

pattern BLEND_SHAPE_MODE_RELATIVE = 1

pattern ARRAY_VERTEX :: Int

pattern ARRAY_VERTEX = 0

pattern ARRAY_FLAG_USE_2D_VERTICES :: Int

pattern ARRAY_FLAG_USE_2D_VERTICES = 262144

pattern ARRAY_COMPRESS_INDEX :: Int

pattern ARRAY_COMPRESS_INDEX = 131072

pattern ARRAY_FORMAT_WEIGHTS :: Int

pattern ARRAY_FORMAT_WEIGHTS = 128

pattern ARRAY_FORMAT_TANGENT :: Int

pattern ARRAY_FORMAT_TANGENT = 4

pattern PRIMITIVE_POINTS :: Int

pattern PRIMITIVE_POINTS = 0