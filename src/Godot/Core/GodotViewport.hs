module Godot.Core.GodotViewport where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern RENDER_INFO_MAX :: Int

pattern RENDER_INFO_MAX = 8

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_64 :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_64 = 4

pattern USAGE_3D :: Int

pattern USAGE_3D = 2

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_MAX :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_MAX = 7

pattern RENDER_INFO_2D_DRAW_CALLS_IN_FRAME :: Int

pattern RENDER_INFO_2D_DRAW_CALLS_IN_FRAME = 7

pattern UPDATE_ALWAYS :: Int

pattern UPDATE_ALWAYS = 3

pattern DEBUG_DRAW_UNSHADED :: Int

pattern DEBUG_DRAW_UNSHADED = 1

pattern RENDER_INFO_OBJECTS_IN_FRAME :: Int

pattern RENDER_INFO_OBJECTS_IN_FRAME = 0

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED = 0

pattern UPDATE_WHEN_VISIBLE :: Int

pattern UPDATE_WHEN_VISIBLE = 2

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_1024 :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_1024 = 6

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_16 :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_16 = 3

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_256 :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_256 = 5

pattern USAGE_2D :: Int

pattern USAGE_2D = 0

pattern MSAA_8X :: Int

pattern MSAA_8X = 3

pattern USAGE_3D_NO_EFFECTS :: Int

pattern USAGE_3D_NO_EFFECTS = 3

pattern RENDER_INFO_2D_ITEMS_IN_FRAME :: Int

pattern RENDER_INFO_2D_ITEMS_IN_FRAME = 6

pattern UPDATE_ONCE :: Int

pattern UPDATE_ONCE = 1

pattern CLEAR_MODE_NEVER :: Int

pattern CLEAR_MODE_NEVER = 1

pattern DEBUG_DRAW_DISABLED :: Int

pattern DEBUG_DRAW_DISABLED = 0

pattern MSAA_4X :: Int

pattern MSAA_4X = 2

pattern RENDER_INFO_SURFACE_CHANGES_IN_FRAME :: Int

pattern RENDER_INFO_SURFACE_CHANGES_IN_FRAME = 4

pattern CLEAR_MODE_ONLY_NEXT_FRAME :: Int

pattern CLEAR_MODE_ONLY_NEXT_FRAME = 2

pattern MSAA_16X :: Int

pattern MSAA_16X = 4

pattern DEBUG_DRAW_WIREFRAME :: Int

pattern DEBUG_DRAW_WIREFRAME = 3

pattern MSAA_DISABLED :: Int

pattern MSAA_DISABLED = 0

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_4 :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_4 = 2

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_1 :: Int

pattern SHADOW_ATLAS_QUADRANT_SUBDIV_1 = 1

pattern RENDER_INFO_DRAW_CALLS_IN_FRAME :: Int

pattern RENDER_INFO_DRAW_CALLS_IN_FRAME = 5

pattern DEBUG_DRAW_OVERDRAW :: Int

pattern DEBUG_DRAW_OVERDRAW = 2

pattern MSAA_2X :: Int

pattern MSAA_2X = 1

pattern UPDATE_DISABLED :: Int

pattern UPDATE_DISABLED = 0

pattern RENDER_INFO_VERTICES_IN_FRAME :: Int

pattern RENDER_INFO_VERTICES_IN_FRAME = 1

pattern RENDER_INFO_SHADER_CHANGES_IN_FRAME :: Int

pattern RENDER_INFO_SHADER_CHANGES_IN_FRAME = 3

pattern CLEAR_MODE_ALWAYS :: Int

pattern CLEAR_MODE_ALWAYS = 0

pattern RENDER_INFO_MATERIAL_CHANGES_IN_FRAME :: Int

pattern RENDER_INFO_MATERIAL_CHANGES_IN_FRAME = 2

pattern USAGE_2D_NO_SAMPLING :: Int

pattern USAGE_2D_NO_SAMPLING = 1

gui_focus_changed :: Signal GodotViewport
gui_focus_changed = Signal "gui_focus_changed"

size_changed :: Signal GodotViewport
size_changed = Signal "size_changed"