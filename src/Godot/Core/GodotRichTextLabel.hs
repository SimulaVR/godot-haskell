module Godot.Core.GodotRichTextLabel where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern ITEM_ALIGN :: Int

pattern ITEM_ALIGN = 8

pattern ITEM_FADE :: Int

pattern ITEM_FADE = 12

pattern ITEM_TORNADO :: Int

pattern ITEM_TORNADO = 15

pattern ITEM_WAVE :: Int

pattern ITEM_WAVE = 14

pattern ITEM_RAINBOW :: Int

pattern ITEM_RAINBOW = 16

pattern ALIGN_CENTER :: Int

pattern ALIGN_CENTER = 1

pattern ALIGN_LEFT :: Int

pattern ALIGN_LEFT = 0

pattern LIST_LETTERS :: Int

pattern LIST_LETTERS = 1

pattern ITEM_SHAKE :: Int

pattern ITEM_SHAKE = 13

pattern LIST_NUMBERS :: Int

pattern LIST_NUMBERS = 0

pattern ITEM_STRIKETHROUGH :: Int

pattern ITEM_STRIKETHROUGH = 7

pattern ITEM_META :: Int

pattern ITEM_META = 17

pattern ITEM_FRAME :: Int

pattern ITEM_FRAME = 0

pattern LIST_DOTS :: Int

pattern LIST_DOTS = 2

pattern ALIGN_RIGHT :: Int

pattern ALIGN_RIGHT = 2

pattern ITEM_CUSTOMFX :: Int

pattern ITEM_CUSTOMFX = 18

pattern ITEM_UNDERLINE :: Int

pattern ITEM_UNDERLINE = 6

pattern ITEM_IMAGE :: Int

pattern ITEM_IMAGE = 2

pattern ITEM_TEXT :: Int

pattern ITEM_TEXT = 1

pattern ITEM_COLOR :: Int

pattern ITEM_COLOR = 5

pattern ITEM_TABLE :: Int

pattern ITEM_TABLE = 11

pattern ITEM_FONT :: Int

pattern ITEM_FONT = 4

pattern ITEM_NEWLINE :: Int

pattern ITEM_NEWLINE = 3

pattern ALIGN_FILL :: Int

pattern ALIGN_FILL = 3

pattern ITEM_LIST :: Int

pattern ITEM_LIST = 10

pattern ITEM_INDENT :: Int

pattern ITEM_INDENT = 9

meta_clicked :: Signal GodotRichTextLabel
meta_clicked = Signal "meta_clicked"

meta_hover_ended :: Signal GodotRichTextLabel
meta_hover_ended = Signal "meta_hover_ended"

meta_hover_started :: Signal GodotRichTextLabel
meta_hover_started = Signal "meta_hover_started"