module Godot.Tools.GodotEditorFileSystem where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

filesystem_changed :: Signal GodotEditorFileSystem
filesystem_changed = Signal "filesystem_changed"

resources_reimported :: Signal GodotEditorFileSystem
resources_reimported = Signal "resources_reimported"

resources_reload :: Signal GodotEditorFileSystem
resources_reload = Signal "resources_reload"

sources_changed :: Signal GodotEditorFileSystem
sources_changed = Signal "sources_changed"