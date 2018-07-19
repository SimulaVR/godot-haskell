module Godot.Core.GodotAudioStreamPlayer2D where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

finished :: Signal GodotAudioStreamPlayer2D
finished = Signal "finished"