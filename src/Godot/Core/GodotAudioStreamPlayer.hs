module Godot.Core.GodotAudioStreamPlayer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern MIX_TARGET_SURROUND :: Int

pattern MIX_TARGET_SURROUND = 1

pattern MIX_TARGET_STEREO :: Int

pattern MIX_TARGET_STEREO = 0

pattern MIX_TARGET_CENTER :: Int

pattern MIX_TARGET_CENTER = 2

finished :: Signal GodotAudioStreamPlayer
finished = Signal "finished"