module Godot.Core.GodotWebXRInterface where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

reference_space_reset :: Signal GodotWebXRInterface
reference_space_reset = Signal "reference_space_reset"

select :: Signal GodotWebXRInterface
select = Signal "select"

selectend :: Signal GodotWebXRInterface
selectend = Signal "selectend"

selectstart :: Signal GodotWebXRInterface
selectstart = Signal "selectstart"

session_ended :: Signal GodotWebXRInterface
session_ended = Signal "session_ended"

session_failed :: Signal GodotWebXRInterface
session_failed = Signal "session_failed"

session_started :: Signal GodotWebXRInterface
session_started = Signal "session_started"

session_supported :: Signal GodotWebXRInterface
session_supported = Signal "session_supported"

squeeze :: Signal GodotWebXRInterface
squeeze = Signal "squeeze"

squeezeend :: Signal GodotWebXRInterface
squeezeend = Signal "squeezeend"

squeezestart :: Signal GodotWebXRInterface
squeezestart = Signal "squeezestart"

visibility_state_changed :: Signal GodotWebXRInterface
visibility_state_changed = Signal "visibility_state_changed"