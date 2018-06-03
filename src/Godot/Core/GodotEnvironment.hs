module Godot.Core.GodotEnvironment where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern TONE_MAPPER_FILMIC :: Int

pattern TONE_MAPPER_FILMIC = 2

pattern SSAO_QUALITY_LOW :: Int

pattern SSAO_QUALITY_LOW = 0

pattern BG_CANVAS :: Int

pattern BG_CANVAS = 4

pattern DOF_BLUR_QUALITY_LOW :: Int

pattern DOF_BLUR_QUALITY_LOW = 0

pattern GLOW_BLEND_MODE_ADDITIVE :: Int

pattern GLOW_BLEND_MODE_ADDITIVE = 0

pattern DOF_BLUR_QUALITY_HIGH :: Int

pattern DOF_BLUR_QUALITY_HIGH = 2

pattern DOF_BLUR_QUALITY_MEDIUM :: Int

pattern DOF_BLUR_QUALITY_MEDIUM = 1

pattern BG_SKY :: Int

pattern BG_SKY = 2

pattern SSAO_QUALITY_MEDIUM :: Int

pattern SSAO_QUALITY_MEDIUM = 1

pattern GLOW_BLEND_MODE_SOFTLIGHT :: Int

pattern GLOW_BLEND_MODE_SOFTLIGHT = 2

pattern TONE_MAPPER_LINEAR :: Int

pattern TONE_MAPPER_LINEAR = 0

pattern BG_MAX :: Int

pattern BG_MAX = 6

pattern BG_COLOR_SKY :: Int

pattern BG_COLOR_SKY = 3

pattern SSAO_BLUR_DISABLED :: Int

pattern SSAO_BLUR_DISABLED = 0

pattern SSAO_BLUR_2x2 :: Int

pattern SSAO_BLUR_2x2 = 2

pattern TONE_MAPPER_ACES :: Int

pattern TONE_MAPPER_ACES = 3

pattern SSAO_BLUR_1x1 :: Int

pattern SSAO_BLUR_1x1 = 1

pattern BG_COLOR :: Int

pattern BG_COLOR = 1

pattern SSAO_BLUR_3x3 :: Int

pattern SSAO_BLUR_3x3 = 3

pattern GLOW_BLEND_MODE_REPLACE :: Int

pattern GLOW_BLEND_MODE_REPLACE = 3

pattern GLOW_BLEND_MODE_SCREEN :: Int

pattern GLOW_BLEND_MODE_SCREEN = 1

pattern SSAO_QUALITY_HIGH :: Int

pattern SSAO_QUALITY_HIGH = 2

pattern TONE_MAPPER_REINHARDT :: Int

pattern TONE_MAPPER_REINHARDT = 1

pattern BG_CLEAR_COLOR :: Int

pattern BG_CLEAR_COLOR = 0

pattern BG_KEEP :: Int

pattern BG_KEEP = 5