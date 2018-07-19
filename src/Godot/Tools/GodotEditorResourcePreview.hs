module Godot.Tools.GodotEditorResourcePreview where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

preview_invalidated :: Signal GodotEditorResourcePreview
preview_invalidated = Signal "preview_invalidated"