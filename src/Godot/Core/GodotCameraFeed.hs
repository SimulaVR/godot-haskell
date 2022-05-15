module Godot.Core.GodotCameraFeed where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FEED_YCBCR :: Int

pattern FEED_YCBCR = 2

pattern FEED_BACK :: Int

pattern FEED_BACK = 2

pattern FEED_RGB :: Int

pattern FEED_RGB = 1

pattern FEED_FRONT :: Int

pattern FEED_FRONT = 1

pattern FEED_YCBCR_SEP :: Int

pattern FEED_YCBCR_SEP = 3

pattern FEED_UNSPECIFIED :: Int

pattern FEED_UNSPECIFIED = 0

pattern FEED_NOIMAGE :: Int

pattern FEED_NOIMAGE = 0