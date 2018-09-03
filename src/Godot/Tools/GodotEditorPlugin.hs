module Godot.Tools.GodotEditorPlugin where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern CONTAINER_SPATIAL_EDITOR_SIDE_LEFT :: Int

pattern CONTAINER_SPATIAL_EDITOR_SIDE_LEFT = 2

pattern CONTAINER_SPATIAL_EDITOR_BOTTOM :: Int

pattern CONTAINER_SPATIAL_EDITOR_BOTTOM = 4

pattern DOCK_SLOT_LEFT_UR :: Int

pattern DOCK_SLOT_LEFT_UR = 2

pattern CONTAINER_SPATIAL_EDITOR_SIDE_RIGHT :: Int

pattern CONTAINER_SPATIAL_EDITOR_SIDE_RIGHT = 3

pattern DOCK_SLOT_LEFT_BL :: Int

pattern DOCK_SLOT_LEFT_BL = 1

pattern CONTAINER_SPATIAL_EDITOR_MENU :: Int

pattern CONTAINER_SPATIAL_EDITOR_MENU = 1

pattern DOCK_SLOT_RIGHT_BR :: Int

pattern DOCK_SLOT_RIGHT_BR = 7

pattern DOCK_SLOT_RIGHT_BL :: Int

pattern DOCK_SLOT_RIGHT_BL = 5

pattern CONTAINER_CANVAS_EDITOR_BOTTOM :: Int

pattern CONTAINER_CANVAS_EDITOR_BOTTOM = 8

pattern CONTAINER_CANVAS_EDITOR_SIDE_LEFT :: Int

pattern CONTAINER_CANVAS_EDITOR_SIDE_LEFT = 6

pattern CONTAINER_PROPERTY_EDITOR_BOTTOM :: Int

pattern CONTAINER_PROPERTY_EDITOR_BOTTOM = 9

pattern CONTAINER_TOOLBAR :: Int

pattern CONTAINER_TOOLBAR = 0

pattern DOCK_SLOT_RIGHT_UL :: Int

pattern DOCK_SLOT_RIGHT_UL = 4

pattern DOCK_SLOT_RIGHT_UR :: Int

pattern DOCK_SLOT_RIGHT_UR = 6

pattern DOCK_SLOT_LEFT_UL :: Int

pattern DOCK_SLOT_LEFT_UL = 0

pattern CONTAINER_CANVAS_EDITOR_MENU :: Int

pattern CONTAINER_CANVAS_EDITOR_MENU = 5

pattern CONTAINER_CANVAS_EDITOR_SIDE_RIGHT :: Int

pattern CONTAINER_CANVAS_EDITOR_SIDE_RIGHT = 7

pattern DOCK_SLOT_LEFT_BR :: Int

pattern DOCK_SLOT_LEFT_BR = 3

pattern DOCK_SLOT_MAX :: Int

pattern DOCK_SLOT_MAX = 8

main_screen_changed :: Signal GodotEditorPlugin
main_screen_changed = Signal "main_screen_changed"

scene_closed :: Signal GodotEditorPlugin
scene_closed = Signal "scene_closed"

scene_changed :: Signal GodotEditorPlugin
scene_changed = Signal "scene_changed"

resource_saved :: Signal GodotEditorPlugin
resource_saved = Signal "resource_saved"