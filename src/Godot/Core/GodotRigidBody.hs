module Godot.Core.GodotRigidBody where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern MODE_STATIC :: Int

pattern MODE_STATIC = 1

pattern MODE_KINEMATIC :: Int

pattern MODE_KINEMATIC = 3

pattern MODE_RIGID :: Int

pattern MODE_RIGID = 0

pattern MODE_CHARACTER :: Int

pattern MODE_CHARACTER = 2

body_entered :: Signal GodotRigidBody
body_entered = Signal "body_entered"

body_shape_entered :: Signal GodotRigidBody
body_shape_entered = Signal "body_shape_entered"

sleeping_state_changed :: Signal GodotRigidBody
sleeping_state_changed = Signal "sleeping_state_changed"

body_exited :: Signal GodotRigidBody
body_exited = Signal "body_exited"

body_shape_exited :: Signal GodotRigidBody
body_shape_exited = Signal "body_shape_exited"