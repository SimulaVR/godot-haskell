module Godot.Core.GodotContainer where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_SORT_CHILDREN :: Int

pattern NOTIFICATION_SORT_CHILDREN = 50

sort_children :: Signal GodotContainer
sort_children = Signal "sort_children"