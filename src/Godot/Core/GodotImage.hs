module Godot.Core.GodotImage where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern FORMAT_RGBAF :: Int

pattern FORMAT_RGBAF = 11

pattern FORMAT_PVRTC2A :: Int

pattern FORMAT_PVRTC2A = 26

pattern FORMAT_ETC2_RGB8 :: Int

pattern FORMAT_ETC2_RGB8 = 34

pattern FORMAT_RGF :: Int

pattern FORMAT_RGF = 9

pattern FORMAT_DXT3 :: Int

pattern FORMAT_DXT3 = 18

pattern COMPRESS_SOURCE_GENERIC :: Int

pattern COMPRESS_SOURCE_GENERIC = 0

pattern FORMAT_ETC2_R11S :: Int

pattern FORMAT_ETC2_R11S = 31

pattern FORMAT_PVRTC4A :: Int

pattern FORMAT_PVRTC4A = 28

pattern FORMAT_RGBA4444 :: Int

pattern FORMAT_RGBA4444 = 6

pattern FORMAT_ETC2_RG11S :: Int

pattern FORMAT_ETC2_RG11S = 33

pattern FORMAT_RGBF :: Int

pattern FORMAT_RGBF = 10

pattern FORMAT_MAX :: Int

pattern FORMAT_MAX = 37

pattern COMPRESS_SOURCE_NORMAL :: Int

pattern COMPRESS_SOURCE_NORMAL = 2

pattern COMPRESS_ETC :: Int

pattern COMPRESS_ETC = 3

pattern FORMAT_RGTC_R :: Int

pattern FORMAT_RGTC_R = 20

pattern COMPRESS_S3TC :: Int

pattern COMPRESS_S3TC = 0

pattern COMPRESS_PVRTC4 :: Int

pattern COMPRESS_PVRTC4 = 2

pattern FORMAT_ETC2_RG11 :: Int

pattern FORMAT_ETC2_RG11 = 32

pattern FORMAT_ETC :: Int

pattern FORMAT_ETC = 29

pattern FORMAT_RGBA5551 :: Int

pattern FORMAT_RGBA5551 = 7

pattern COMPRESS_ETC2 :: Int

pattern COMPRESS_ETC2 = 4

pattern FORMAT_ETC2_R11 :: Int

pattern FORMAT_ETC2_R11 = 30

pattern FORMAT_LA8 :: Int

pattern FORMAT_LA8 = 1

pattern FORMAT_DXT5 :: Int

pattern FORMAT_DXT5 = 19

pattern ALPHA_NONE :: Int

pattern ALPHA_NONE = 0

pattern ALPHA_BIT :: Int

pattern ALPHA_BIT = 1

pattern FORMAT_ETC2_RGB8A1 :: Int

pattern FORMAT_ETC2_RGB8A1 = 36

pattern FORMAT_RGTC_RG :: Int

pattern FORMAT_RGTC_RG = 21

pattern FORMAT_BPTC_RGBF :: Int

pattern FORMAT_BPTC_RGBF = 23

pattern COMPRESS_SOURCE_SRGB :: Int

pattern COMPRESS_SOURCE_SRGB = 1

pattern FORMAT_RGBA8 :: Int

pattern FORMAT_RGBA8 = 5

pattern INTERPOLATE_NEAREST :: Int

pattern INTERPOLATE_NEAREST = 0

pattern FORMAT_RGBAH :: Int

pattern FORMAT_RGBAH = 15

pattern FORMAT_RGBE9995 :: Int

pattern FORMAT_RGBE9995 = 16

pattern FORMAT_BPTC_RGBFU :: Int

pattern FORMAT_BPTC_RGBFU = 24

pattern ALPHA_BLEND :: Int

pattern ALPHA_BLEND = 2

pattern FORMAT_PVRTC2 :: Int

pattern FORMAT_PVRTC2 = 25

pattern FORMAT_DXT1 :: Int

pattern FORMAT_DXT1 = 17

pattern FORMAT_ETC2_RGBA8 :: Int

pattern FORMAT_ETC2_RGBA8 = 35

pattern FORMAT_BPTC_RGBA :: Int

pattern FORMAT_BPTC_RGBA = 22

pattern COMPRESS_PVRTC2 :: Int

pattern COMPRESS_PVRTC2 = 1

pattern FORMAT_RF :: Int

pattern FORMAT_RF = 8

pattern FORMAT_L8 :: Int

pattern FORMAT_L8 = 0

pattern FORMAT_RGB8 :: Int

pattern FORMAT_RGB8 = 4

pattern FORMAT_RGBH :: Int

pattern FORMAT_RGBH = 14

pattern FORMAT_PVRTC4 :: Int

pattern FORMAT_PVRTC4 = 27

pattern FORMAT_RH :: Int

pattern FORMAT_RH = 12

pattern FORMAT_R8 :: Int

pattern FORMAT_R8 = 2

pattern INTERPOLATE_BILINEAR :: Int

pattern INTERPOLATE_BILINEAR = 1

pattern INTERPOLATE_CUBIC :: Int

pattern INTERPOLATE_CUBIC = 2

pattern FORMAT_RG8 :: Int

pattern FORMAT_RG8 = 3

pattern FORMAT_RGH :: Int

pattern FORMAT_RGH = 13