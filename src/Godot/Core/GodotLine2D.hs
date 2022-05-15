module Godot.Core.GodotLine2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern LINE_TEXTURE_NONE :: Int

pattern LINE_TEXTURE_NONE = 0

pattern LINE_JOINT_SHARP :: Int

pattern LINE_JOINT_SHARP = 0

pattern LINE_CAP_BOX :: Int

pattern LINE_CAP_BOX = 1

pattern LINE_TEXTURE_TILE :: Int

pattern LINE_TEXTURE_TILE = 1

pattern LINE_TEXTURE_STRETCH :: Int

pattern LINE_TEXTURE_STRETCH = 2

pattern LINE_CAP_ROUND :: Int

pattern LINE_CAP_ROUND = 2

pattern LINE_JOINT_BEVEL :: Int

pattern LINE_JOINT_BEVEL = 1

pattern LINE_CAP_NONE :: Int

pattern LINE_CAP_NONE = 0

pattern LINE_JOINT_ROUND :: Int

pattern LINE_JOINT_ROUND = 2