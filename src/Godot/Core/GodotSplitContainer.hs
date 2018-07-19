module Godot.Core.GodotSplitContainer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern DRAGGER_HIDDEN :: Int

pattern DRAGGER_HIDDEN = 1

pattern DRAGGER_HIDDEN_COLLAPSED :: Int

pattern DRAGGER_HIDDEN_COLLAPSED = 2

pattern DRAGGER_VISIBLE :: Int

pattern DRAGGER_VISIBLE = 0

dragged :: Signal GodotSplitContainer
dragged = Signal "dragged"