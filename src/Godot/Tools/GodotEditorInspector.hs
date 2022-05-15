module Godot.Tools.GodotEditorInspector where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

object_id_selected :: Signal GodotEditorInspector
object_id_selected = Signal "object_id_selected"

property_edited :: Signal GodotEditorInspector
property_edited = Signal "property_edited"

property_keyed :: Signal GodotEditorInspector
property_keyed = Signal "property_keyed"

property_selected :: Signal GodotEditorInspector
property_selected = Signal "property_selected"

property_toggled :: Signal GodotEditorInspector
property_toggled = Signal "property_toggled"

resource_selected :: Signal GodotEditorInspector
resource_selected = Signal "resource_selected"

restart_requested :: Signal GodotEditorInspector
restart_requested = Signal "restart_requested"