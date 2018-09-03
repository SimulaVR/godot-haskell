module Godot.Core.GodotPhysicalBone where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern JOINT_TYPE_6DOF :: Int

pattern JOINT_TYPE_6DOF = 5

pattern JOINT_TYPE_PIN :: Int

pattern JOINT_TYPE_PIN = 1

pattern JOINT_TYPE_CONE :: Int

pattern JOINT_TYPE_CONE = 2

pattern JOINT_TYPE_NONE :: Int

pattern JOINT_TYPE_NONE = 0

pattern JOINT_TYPE_SLIDER :: Int

pattern JOINT_TYPE_SLIDER = 4

pattern JOINT_TYPE_HINGE :: Int

pattern JOINT_TYPE_HINGE = 3