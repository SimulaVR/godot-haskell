module Godot.Core.GodotArea where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SPACE_OVERRIDE_REPLACE :: Int

pattern SPACE_OVERRIDE_REPLACE = 3

pattern SPACE_OVERRIDE_DISABLED :: Int

pattern SPACE_OVERRIDE_DISABLED = 0

pattern SPACE_OVERRIDE_REPLACE_COMBINE :: Int

pattern SPACE_OVERRIDE_REPLACE_COMBINE = 4

pattern SPACE_OVERRIDE_COMBINE_REPLACE :: Int

pattern SPACE_OVERRIDE_COMBINE_REPLACE = 2

pattern SPACE_OVERRIDE_COMBINE :: Int

pattern SPACE_OVERRIDE_COMBINE = 1

area_entered :: Signal GodotArea
area_entered = Signal "area_entered"

area_exited :: Signal GodotArea
area_exited = Signal "area_exited"

area_shape_entered :: Signal GodotArea
area_shape_entered = Signal "area_shape_entered"

area_shape_exited :: Signal GodotArea
area_shape_exited = Signal "area_shape_exited"

body_entered :: Signal GodotArea
body_entered = Signal "body_entered"

body_exited :: Signal GodotArea
body_exited = Signal "body_exited"

body_shape_entered :: Signal GodotArea
body_shape_entered = Signal "body_shape_entered"

body_shape_exited :: Signal GodotArea
body_shape_exited = Signal "body_shape_exited"