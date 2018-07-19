module Godot.Core.GodotRichTextLabel where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ITEM_UNDERLINE :: Int

pattern ITEM_UNDERLINE = 6

pattern ITEM_META :: Int

pattern ITEM_META = 11

pattern ITEM_ALIGN :: Int

pattern ITEM_ALIGN = 7

pattern ITEM_FRAME :: Int

pattern ITEM_FRAME = 0

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pattern ALIGN_FILL :: Int

pattern ALIGN_FILL = 3

pattern ITEM_FONT :: Int

pattern ITEM_FONT = 4

pattern ITEM_TABLE :: Int

pattern ITEM_TABLE = 10

pattern ITEM_COLOR :: Int

pattern ITEM_COLOR = 5

pattern ITEM_TEXT :: Int

pattern ITEM_TEXT = 1

pattern ITEM_IMAGE :: Int

pattern ITEM_IMAGE = 2

pattern LIST_NUMBERS :: Int

pattern LIST_NUMBERS = 0

pattern LIST_LETTERS :: Int

pattern LIST_LETTERS = 1

pattern ITEM_LIST :: Int

pattern ITEM_LIST = 9

pattern ITEM_NEWLINE :: Int

pattern ITEM_NEWLINE = 3

pattern ITEM_INDENT :: Int

pattern ITEM_INDENT = 8

pattern LIST_DOTS :: Int

pattern LIST_DOTS = 2

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

meta_clicked :: Signal GodotRichTextLabel
meta_clicked = Signal "meta_clicked"

meta_hover_started :: Signal GodotRichTextLabel
meta_hover_started = Signal "meta_hover_started"

meta_hover_ended :: Signal GodotRichTextLabel
meta_hover_ended = Signal "meta_hover_ended"