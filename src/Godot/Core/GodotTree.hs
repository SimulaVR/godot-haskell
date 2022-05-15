module Godot.Core.GodotTree where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern DROP_MODE_ON_ITEM :: Int

pattern DROP_MODE_ON_ITEM = 1

pattern DROP_MODE_INBETWEEN :: Int

pattern DROP_MODE_INBETWEEN = 2

pattern SELECT_SINGLE :: Int

pattern SELECT_SINGLE = 0

pattern SELECT_MULTI :: Int

pattern SELECT_MULTI = 2

pattern SELECT_ROW :: Int

pattern SELECT_ROW = 1

pattern DROP_MODE_DISABLED :: Int

pattern DROP_MODE_DISABLED = 0

button_pressed :: Signal GodotTree
button_pressed = Signal "button_pressed"

cell_selected :: Signal GodotTree
cell_selected = Signal "cell_selected"

column_title_pressed :: Signal GodotTree
column_title_pressed = Signal "column_title_pressed"

custom_popup_edited :: Signal GodotTree
custom_popup_edited = Signal "custom_popup_edited"

empty_rmb :: Signal GodotTree
empty_rmb = Signal "empty_rmb"

empty_tree_rmb_selected :: Signal GodotTree
empty_tree_rmb_selected = Signal "empty_tree_rmb_selected"

item_activated :: Signal GodotTree
item_activated = Signal "item_activated"

item_collapsed :: Signal GodotTree
item_collapsed = Signal "item_collapsed"

item_custom_button_pressed :: Signal GodotTree
item_custom_button_pressed = Signal "item_custom_button_pressed"

item_double_clicked :: Signal GodotTree
item_double_clicked = Signal "item_double_clicked"

item_edited :: Signal GodotTree
item_edited = Signal "item_edited"

item_rmb_edited :: Signal GodotTree
item_rmb_edited = Signal "item_rmb_edited"

item_rmb_selected :: Signal GodotTree
item_rmb_selected = Signal "item_rmb_selected"

item_selected :: Signal GodotTree
item_selected = Signal "item_selected"

multi_selected :: Signal GodotTree
multi_selected = Signal "multi_selected"

nothing_selected :: Signal GodotTree
nothing_selected = Signal "nothing_selected"