module Godot.Core.GodotNode where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern DUPLICATE_GROUPS :: Int

pattern DUPLICATE_GROUPS = 2

pattern DUPLICATE_SCRIPTS :: Int

pattern DUPLICATE_SCRIPTS = 4

pattern NOTIFICATION_PAUSED :: Int

pattern NOTIFICATION_PAUSED = 14

pattern NOTIFICATION_MOVED_IN_PARENT :: Int

pattern NOTIFICATION_MOVED_IN_PARENT = 12

pattern NOTIFICATION_UNPARENTED :: Int

pattern NOTIFICATION_UNPARENTED = 19

pattern PAUSE_MODE_PROCESS :: Int

pattern PAUSE_MODE_PROCESS = 2

pattern NOTIFICATION_DRAG_END :: Int

pattern NOTIFICATION_DRAG_END = 22

pattern NOTIFICATION_PATH_CHANGED :: Int

pattern NOTIFICATION_PATH_CHANGED = 23

pattern NOTIFICATION_PHYSICS_PROCESS :: Int

pattern NOTIFICATION_PHYSICS_PROCESS = 16

pattern NOTIFICATION_INTERNAL_PHYSICS_PROCESS :: Int

pattern NOTIFICATION_INTERNAL_PHYSICS_PROCESS = 26

pattern DUPLICATE_USE_INSTANCING :: Int

pattern DUPLICATE_USE_INSTANCING = 8

pattern NOTIFICATION_ENTER_TREE :: Int

pattern NOTIFICATION_ENTER_TREE = 10

pattern NOTIFICATION_EXIT_TREE :: Int

pattern NOTIFICATION_EXIT_TREE = 11

pattern NOTIFICATION_PROCESS :: Int

pattern NOTIFICATION_PROCESS = 17

pattern NOTIFICATION_INTERNAL_PROCESS :: Int

pattern NOTIFICATION_INTERNAL_PROCESS = 25

pattern PAUSE_MODE_STOP :: Int

pattern PAUSE_MODE_STOP = 1

pattern PAUSE_MODE_INHERIT :: Int

pattern PAUSE_MODE_INHERIT = 0

pattern NOTIFICATION_TRANSLATION_CHANGED :: Int

pattern NOTIFICATION_TRANSLATION_CHANGED = 24

pattern NOTIFICATION_INSTANCED :: Int

pattern NOTIFICATION_INSTANCED = 20

pattern NOTIFICATION_UNPAUSED :: Int

pattern NOTIFICATION_UNPAUSED = 15

pattern NOTIFICATION_PARENTED :: Int

pattern NOTIFICATION_PARENTED = 18

pattern NOTIFICATION_DRAG_BEGIN :: Int

pattern NOTIFICATION_DRAG_BEGIN = 21

pattern DUPLICATE_SIGNALS :: Int

pattern DUPLICATE_SIGNALS = 1

pattern NOTIFICATION_READY :: Int

pattern NOTIFICATION_READY = 13

renamed :: Signal GodotNode
renamed = Signal "renamed"

ready :: Signal GodotNode
ready = Signal "ready"

tree_entered :: Signal GodotNode
tree_entered = Signal "tree_entered"

tree_exiting :: Signal GodotNode
tree_exiting = Signal "tree_exiting"

tree_exited :: Signal GodotNode
tree_exited = Signal "tree_exited"