module Godot.Core.GodotCameraServer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FEED_RGBA_IMAGE :: Int

pattern FEED_RGBA_IMAGE = 0

pattern FEED_CBCR_IMAGE :: Int

pattern FEED_CBCR_IMAGE = 1

pattern FEED_Y_IMAGE :: Int

pattern FEED_Y_IMAGE = 0

pattern FEED_YCBCR_IMAGE :: Int

pattern FEED_YCBCR_IMAGE = 0

camera_feed_added :: Signal GodotCameraServer
camera_feed_added = Signal "camera_feed_added"

camera_feed_removed :: Signal GodotCameraServer
camera_feed_removed = Signal "camera_feed_removed"