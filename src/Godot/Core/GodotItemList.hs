module Godot.Core.GodotItemList where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern SELECT_SINGLE :: Int

pattern SELECT_SINGLE = 0

pattern SELECT_MULTI :: Int

pattern SELECT_MULTI = 1

pattern ICON_MODE_TOP :: Int

pattern ICON_MODE_TOP = 0

pattern ICON_MODE_LEFT :: Int

pattern ICON_MODE_LEFT = 1

item_activated :: Signal GodotItemList
item_activated = Signal "item_activated"

item_rmb_selected :: Signal GodotItemList
item_rmb_selected = Signal "item_rmb_selected"

item_selected :: Signal GodotItemList
item_selected = Signal "item_selected"

multi_selected :: Signal GodotItemList
multi_selected = Signal "multi_selected"

nothing_selected :: Signal GodotItemList
nothing_selected = Signal "nothing_selected"

rmb_clicked :: Signal GodotItemList
rmb_clicked = Signal "rmb_clicked"