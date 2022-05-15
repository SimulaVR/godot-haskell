module Godot.Core.GodotRigidBody2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern MODE_KINEMATIC :: Int

pattern MODE_KINEMATIC = 3

pattern MODE_CHARACTER :: Int

pattern MODE_CHARACTER = 2

pattern MODE_RIGID :: Int

pattern MODE_RIGID = 0

pattern MODE_STATIC :: Int

pattern MODE_STATIC = 1

pattern CCD_MODE_DISABLED :: Int

pattern CCD_MODE_DISABLED = 0

pattern CCD_MODE_CAST_RAY :: Int

pattern CCD_MODE_CAST_RAY = 1

pattern CCD_MODE_CAST_SHAPE :: Int

pattern CCD_MODE_CAST_SHAPE = 2

body_entered :: Signal GodotRigidBody2D
body_entered = Signal "body_entered"

body_exited :: Signal GodotRigidBody2D
body_exited = Signal "body_exited"

body_shape_entered :: Signal GodotRigidBody2D
body_shape_entered = Signal "body_shape_entered"

body_shape_exited :: Signal GodotRigidBody2D
body_shape_exited = Signal "body_shape_exited"

sleeping_state_changed :: Signal GodotRigidBody2D
sleeping_state_changed = Signal "sleeping_state_changed"