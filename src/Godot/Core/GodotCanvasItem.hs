module Godot.Core.GodotCanvasItem where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern BLEND_MODE_ADD :: Int

pattern BLEND_MODE_ADD = 1

pattern NOTIFICATION_TRANSFORM_CHANGED :: Int

pattern NOTIFICATION_TRANSFORM_CHANGED = 2000

pattern BLEND_MODE_PREMULT_ALPHA :: Int

pattern BLEND_MODE_PREMULT_ALPHA = 4

pattern NOTIFICATION_VISIBILITY_CHANGED :: Int

pattern NOTIFICATION_VISIBILITY_CHANGED = 31

pattern BLEND_MODE_MIX :: Int

pattern BLEND_MODE_MIX = 0

pattern NOTIFICATION_EXIT_CANVAS :: Int

pattern NOTIFICATION_EXIT_CANVAS = 33

pattern BLEND_MODE_SUB :: Int

pattern BLEND_MODE_SUB = 2

pattern BLEND_MODE_MUL :: Int

pattern BLEND_MODE_MUL = 3

pattern NOTIFICATION_DRAW :: Int

pattern NOTIFICATION_DRAW = 30

pattern BLEND_MODE_DISABLED :: Int

pattern BLEND_MODE_DISABLED = 5

pattern NOTIFICATION_ENTER_CANVAS :: Int

pattern NOTIFICATION_ENTER_CANVAS = 32

draw :: Signal GodotCanvasItem
draw = Signal "draw"

hide :: Signal GodotCanvasItem
hide = Signal "hide"

item_rect_changed :: Signal GodotCanvasItem
item_rect_changed = Signal "item_rect_changed"

visibility_changed :: Signal GodotCanvasItem
visibility_changed = Signal "visibility_changed"