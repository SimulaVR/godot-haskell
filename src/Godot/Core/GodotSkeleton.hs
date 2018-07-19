module Godot.Core.GodotSkeleton where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_UPDATE_SKELETON :: Int

pattern NOTIFICATION_UPDATE_SKELETON = 50