module Godot.Core.GodotSkeleton2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

bone_setup_changed :: Signal GodotSkeleton2D
bone_setup_changed = Signal "bone_setup_changed"