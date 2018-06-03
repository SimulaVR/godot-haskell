module Godot.Tools.GodotEditorFileDialog where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern ACCESS_RESOURCES :: Int

pattern ACCESS_RESOURCES = 0

pattern DISPLAY_THUMBNAILS :: Int

pattern DISPLAY_THUMBNAILS = 0

pattern MODE_OPEN_FILES :: Int

pattern MODE_OPEN_FILES = 1

pattern MODE_OPEN_FILE :: Int

pattern MODE_OPEN_FILE = 0

pattern MODE_SAVE_FILE :: Int

pattern MODE_SAVE_FILE = 4

pattern DISPLAY_LIST :: Int

pattern DISPLAY_LIST = 1

pattern ACCESS_USERDATA :: Int

pattern ACCESS_USERDATA = 1

pattern ACCESS_FILESYSTEM :: Int

pattern ACCESS_FILESYSTEM = 2

pattern MODE_OPEN_DIR :: Int

pattern MODE_OPEN_DIR = 2

pattern MODE_OPEN_ANY :: Int

pattern MODE_OPEN_ANY = 3

files_selected :: Signal GodotEditorFileDialog
files_selected = Signal "files_selected"

dir_selected :: Signal GodotEditorFileDialog
dir_selected = Signal "dir_selected"

file_selected :: Signal GodotEditorFileDialog
file_selected = Signal "file_selected"