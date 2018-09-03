module Godot.Tools.GodotEditorProperty where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

object_id_selected :: Signal GodotEditorProperty
object_id_selected = Signal "object_id_selected"

property_checked :: Signal GodotEditorProperty
property_checked = Signal "property_checked"

property_keyed_with_value :: Signal GodotEditorProperty
property_keyed_with_value = Signal "property_keyed_with_value"

property_keyed :: Signal GodotEditorProperty
property_keyed = Signal "property_keyed"

property_changed :: Signal GodotEditorProperty
property_changed = Signal "property_changed"

resource_selected :: Signal GodotEditorProperty
resource_selected = Signal "resource_selected"

selected :: Signal GodotEditorProperty
selected = Signal "selected"

multiple_properties_changed :: Signal GodotEditorProperty
multiple_properties_changed = Signal "multiple_properties_changed"