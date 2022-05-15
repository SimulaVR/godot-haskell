module Godot.Tools.GodotFileSystemDock where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

display_mode_changed :: Signal GodotFileSystemDock
display_mode_changed = Signal "display_mode_changed"

file_removed :: Signal GodotFileSystemDock
file_removed = Signal "file_removed"

files_moved :: Signal GodotFileSystemDock
files_moved = Signal "files_moved"

folder_moved :: Signal GodotFileSystemDock
folder_moved = Signal "folder_moved"

folder_removed :: Signal GodotFileSystemDock
folder_removed = Signal "folder_removed"

inherit :: Signal GodotFileSystemDock
inherit = Signal "inherit"

instance' :: Signal GodotFileSystemDock
instance' = Signal "instance'"