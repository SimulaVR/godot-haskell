{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RichTextLabel
       (Godot.Core.RichTextLabel._ITEM_ALIGN,
        Godot.Core.RichTextLabel._ITEM_FADE,
        Godot.Core.RichTextLabel._ITEM_TORNADO,
        Godot.Core.RichTextLabel._ITEM_WAVE,
        Godot.Core.RichTextLabel._ITEM_RAINBOW,
        Godot.Core.RichTextLabel._ALIGN_CENTER,
        Godot.Core.RichTextLabel._ALIGN_LEFT,
        Godot.Core.RichTextLabel._LIST_LETTERS,
        Godot.Core.RichTextLabel._ITEM_SHAKE,
        Godot.Core.RichTextLabel._LIST_NUMBERS,
        Godot.Core.RichTextLabel._ITEM_STRIKETHROUGH,
        Godot.Core.RichTextLabel._ITEM_META,
        Godot.Core.RichTextLabel._ITEM_FRAME,
        Godot.Core.RichTextLabel._LIST_DOTS,
        Godot.Core.RichTextLabel._ALIGN_RIGHT,
        Godot.Core.RichTextLabel._ITEM_CUSTOMFX,
        Godot.Core.RichTextLabel._ITEM_UNDERLINE,
        Godot.Core.RichTextLabel._ITEM_IMAGE,
        Godot.Core.RichTextLabel._ITEM_TEXT,
        Godot.Core.RichTextLabel._ITEM_COLOR,
        Godot.Core.RichTextLabel._ITEM_TABLE,
        Godot.Core.RichTextLabel._ITEM_FONT,
        Godot.Core.RichTextLabel._ITEM_NEWLINE,
        Godot.Core.RichTextLabel._ALIGN_FILL,
        Godot.Core.RichTextLabel._ITEM_LIST,
        Godot.Core.RichTextLabel._ITEM_INDENT,
        Godot.Core.RichTextLabel.sig_meta_clicked,
        Godot.Core.RichTextLabel.sig_meta_hover_ended,
        Godot.Core.RichTextLabel.sig_meta_hover_started,
        Godot.Core.RichTextLabel._gui_input,
        Godot.Core.RichTextLabel._scroll_changed,
        Godot.Core.RichTextLabel.add_image,
        Godot.Core.RichTextLabel.add_text,
        Godot.Core.RichTextLabel.append_bbcode,
        Godot.Core.RichTextLabel.clear,
        Godot.Core.RichTextLabel.get_bbcode,
        Godot.Core.RichTextLabel.get_content_height,
        Godot.Core.RichTextLabel.get_effects,
        Godot.Core.RichTextLabel.get_line_count,
        Godot.Core.RichTextLabel.get_percent_visible,
        Godot.Core.RichTextLabel.get_tab_size,
        Godot.Core.RichTextLabel.get_text,
        Godot.Core.RichTextLabel.get_total_character_count,
        Godot.Core.RichTextLabel.get_v_scroll,
        Godot.Core.RichTextLabel.get_visible_characters,
        Godot.Core.RichTextLabel.get_visible_line_count,
        Godot.Core.RichTextLabel.install_effect,
        Godot.Core.RichTextLabel.is_meta_underlined,
        Godot.Core.RichTextLabel.is_overriding_selected_font_color,
        Godot.Core.RichTextLabel.is_scroll_active,
        Godot.Core.RichTextLabel.is_scroll_following,
        Godot.Core.RichTextLabel.is_selection_enabled,
        Godot.Core.RichTextLabel.is_using_bbcode,
        Godot.Core.RichTextLabel.newline,
        Godot.Core.RichTextLabel.parse_bbcode,
        Godot.Core.RichTextLabel.parse_expressions_for_values,
        Godot.Core.RichTextLabel.pop, Godot.Core.RichTextLabel.push_align,
        Godot.Core.RichTextLabel.push_bold,
        Godot.Core.RichTextLabel.push_bold_italics,
        Godot.Core.RichTextLabel.push_cell,
        Godot.Core.RichTextLabel.push_color,
        Godot.Core.RichTextLabel.push_font,
        Godot.Core.RichTextLabel.push_indent,
        Godot.Core.RichTextLabel.push_italics,
        Godot.Core.RichTextLabel.push_list,
        Godot.Core.RichTextLabel.push_meta,
        Godot.Core.RichTextLabel.push_mono,
        Godot.Core.RichTextLabel.push_normal,
        Godot.Core.RichTextLabel.push_strikethrough,
        Godot.Core.RichTextLabel.push_table,
        Godot.Core.RichTextLabel.push_underline,
        Godot.Core.RichTextLabel.remove_line,
        Godot.Core.RichTextLabel.scroll_to_line,
        Godot.Core.RichTextLabel.set_bbcode,
        Godot.Core.RichTextLabel.set_effects,
        Godot.Core.RichTextLabel.set_meta_underline,
        Godot.Core.RichTextLabel.set_override_selected_font_color,
        Godot.Core.RichTextLabel.set_percent_visible,
        Godot.Core.RichTextLabel.set_scroll_active,
        Godot.Core.RichTextLabel.set_scroll_follow,
        Godot.Core.RichTextLabel.set_selection_enabled,
        Godot.Core.RichTextLabel.set_tab_size,
        Godot.Core.RichTextLabel.set_table_column_expand,
        Godot.Core.RichTextLabel.set_text,
        Godot.Core.RichTextLabel.set_use_bbcode,
        Godot.Core.RichTextLabel.set_visible_characters)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Control()

_ITEM_ALIGN :: Int
_ITEM_ALIGN = 8

_ITEM_FADE :: Int
_ITEM_FADE = 12

_ITEM_TORNADO :: Int
_ITEM_TORNADO = 15

_ITEM_WAVE :: Int
_ITEM_WAVE = 14

_ITEM_RAINBOW :: Int
_ITEM_RAINBOW = 16

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_LIST_LETTERS :: Int
_LIST_LETTERS = 1

_ITEM_SHAKE :: Int
_ITEM_SHAKE = 13

_LIST_NUMBERS :: Int
_LIST_NUMBERS = 0

_ITEM_STRIKETHROUGH :: Int
_ITEM_STRIKETHROUGH = 7

_ITEM_META :: Int
_ITEM_META = 17

_ITEM_FRAME :: Int
_ITEM_FRAME = 0

_LIST_DOTS :: Int
_LIST_DOTS = 2

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_ITEM_CUSTOMFX :: Int
_ITEM_CUSTOMFX = 18

_ITEM_UNDERLINE :: Int
_ITEM_UNDERLINE = 6

_ITEM_IMAGE :: Int
_ITEM_IMAGE = 2

_ITEM_TEXT :: Int
_ITEM_TEXT = 1

_ITEM_COLOR :: Int
_ITEM_COLOR = 5

_ITEM_TABLE :: Int
_ITEM_TABLE = 11

_ITEM_FONT :: Int
_ITEM_FONT = 4

_ITEM_NEWLINE :: Int
_ITEM_NEWLINE = 3

_ALIGN_FILL :: Int
_ALIGN_FILL = 3

_ITEM_LIST :: Int
_ITEM_LIST = 10

_ITEM_INDENT :: Int
_ITEM_INDENT = 9

-- | Triggered when the user clicks on content between meta tags. If the meta is defined in text, e.g. @@url={"data"="hi"}@hi@/url@@, then the parameter for this signal will be a @String@ type. If a particular type or an object is desired, the @method push_meta@ method must be used to manually insert the data into the tag stack.
sig_meta_clicked :: Godot.Internal.Dispatch.Signal RichTextLabel
sig_meta_clicked = Godot.Internal.Dispatch.Signal "meta_clicked"

instance NodeSignal RichTextLabel "meta_clicked" '[GodotVariant]

-- | Triggers when the mouse exits a meta tag.
sig_meta_hover_ended ::
                     Godot.Internal.Dispatch.Signal RichTextLabel
sig_meta_hover_ended
  = Godot.Internal.Dispatch.Signal "meta_hover_ended"

instance NodeSignal RichTextLabel "meta_hover_ended"
           '[GodotVariant]

-- | Triggers when the mouse enters a meta tag.
sig_meta_hover_started ::
                       Godot.Internal.Dispatch.Signal RichTextLabel
sig_meta_hover_started
  = Godot.Internal.Dispatch.Signal "meta_hover_started"

instance NodeSignal RichTextLabel "meta_hover_started"
           '[GodotVariant]

instance NodeProperty RichTextLabel "bbcode_enabled" Bool 'False
         where
        nodeProperty
          = (is_using_bbcode, wrapDroppingSetter set_use_bbcode, Nothing)

instance NodeProperty RichTextLabel "bbcode_text" GodotString
           'False
         where
        nodeProperty = (get_bbcode, wrapDroppingSetter set_bbcode, Nothing)

instance NodeProperty RichTextLabel "custom_effects" Array 'False
         where
        nodeProperty
          = (get_effects, wrapDroppingSetter set_effects, Nothing)

instance NodeProperty RichTextLabel "meta_underlined" Bool 'False
         where
        nodeProperty
          = (is_meta_underlined, wrapDroppingSetter set_meta_underline,
             Nothing)

instance NodeProperty RichTextLabel "override_selected_font_color"
           Bool
           'False
         where
        nodeProperty
          = (is_overriding_selected_font_color,
             wrapDroppingSetter set_override_selected_font_color, Nothing)

instance NodeProperty RichTextLabel "percent_visible" Float 'False
         where
        nodeProperty
          = (get_percent_visible, wrapDroppingSetter set_percent_visible,
             Nothing)

instance NodeProperty RichTextLabel "scroll_active" Bool 'False
         where
        nodeProperty
          = (is_scroll_active, wrapDroppingSetter set_scroll_active, Nothing)

instance NodeProperty RichTextLabel "scroll_following" Bool 'False
         where
        nodeProperty
          = (is_scroll_following, wrapDroppingSetter set_scroll_follow,
             Nothing)

instance NodeProperty RichTextLabel "selection_enabled" Bool 'False
         where
        nodeProperty
          = (is_selection_enabled, wrapDroppingSetter set_selection_enabled,
             Nothing)

instance NodeProperty RichTextLabel "tab_size" Int 'False where
        nodeProperty
          = (get_tab_size, wrapDroppingSetter set_tab_size, Nothing)

instance NodeProperty RichTextLabel "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

instance NodeProperty RichTextLabel "visible_characters" Int 'False
         where
        nodeProperty
          = (get_visible_characters,
             wrapDroppingSetter set_visible_characters, Nothing)

{-# NOINLINE bindRichTextLabel__gui_input #-}

bindRichTextLabel__gui_input :: MethodBind
bindRichTextLabel__gui_input
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (RichTextLabel :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "_gui_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel._gui_input

{-# NOINLINE bindRichTextLabel__scroll_changed #-}

bindRichTextLabel__scroll_changed :: MethodBind
bindRichTextLabel__scroll_changed
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "_scroll_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_scroll_changed ::
                  (RichTextLabel :< cls, Object :< cls) => cls -> Float -> IO ()
_scroll_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel__scroll_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "_scroll_changed" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel._scroll_changed

{-# NOINLINE bindRichTextLabel_add_image #-}

-- | Adds an image's opening and closing tags to the tag stack, optionally providing a @width@ and @height@ to resize the image.
--   				If @width@ or @height@ is set to 0, the image size will be adjusted in order to keep the original aspect ratio.
bindRichTextLabel_add_image :: MethodBind
bindRichTextLabel_add_image
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "add_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an image's opening and closing tags to the tag stack, optionally providing a @width@ and @height@ to resize the image.
--   				If @width@ or @height@ is set to 0, the image size will be adjusted in order to keep the original aspect ratio.
add_image ::
            (RichTextLabel :< cls, Object :< cls) =>
            cls -> Texture -> Maybe Int -> Maybe Int -> IO ()
add_image cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_add_image (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "add_image"
           '[Texture, Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.add_image

{-# NOINLINE bindRichTextLabel_add_text #-}

-- | Adds raw non-BBCode-parsed text to the tag stack.
bindRichTextLabel_add_text :: MethodBind
bindRichTextLabel_add_text
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "add_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds raw non-BBCode-parsed text to the tag stack.
add_text ::
           (RichTextLabel :< cls, Object :< cls) =>
           cls -> GodotString -> IO ()
add_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_add_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "add_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.add_text

{-# NOINLINE bindRichTextLabel_append_bbcode #-}

-- | Parses @bbcode@ and adds tags to the tag stack as needed. Returns the result of the parsing, @OK@ if successful.
bindRichTextLabel_append_bbcode :: MethodBind
bindRichTextLabel_append_bbcode
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "append_bbcode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Parses @bbcode@ and adds tags to the tag stack as needed. Returns the result of the parsing, @OK@ if successful.
append_bbcode ::
                (RichTextLabel :< cls, Object :< cls) =>
                cls -> GodotString -> IO Int
append_bbcode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_append_bbcode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "append_bbcode" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.append_bbcode

{-# NOINLINE bindRichTextLabel_clear #-}

-- | Clears the tag stack and sets @bbcode_text@ to an empty string.
bindRichTextLabel_clear :: MethodBind
bindRichTextLabel_clear
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the tag stack and sets @bbcode_text@ to an empty string.
clear :: (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.clear

{-# NOINLINE bindRichTextLabel_get_bbcode #-}

-- | The label's text in BBCode format. Is not representative of manual modifications to the internal tag stack. Erases changes made by other methods when edited.
--   			__Note:__ It is unadvised to use @+=@ operator with @bbcode_text@ (e.g. @bbcode_text += "some string"@) as it replaces the whole text and can cause slowdowns. Use @method append_bbcode@ for adding text instead.
bindRichTextLabel_get_bbcode :: MethodBind
bindRichTextLabel_get_bbcode
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_bbcode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The label's text in BBCode format. Is not representative of manual modifications to the internal tag stack. Erases changes made by other methods when edited.
--   			__Note:__ It is unadvised to use @+=@ operator with @bbcode_text@ (e.g. @bbcode_text += "some string"@) as it replaces the whole text and can cause slowdowns. Use @method append_bbcode@ for adding text instead.
get_bbcode ::
             (RichTextLabel :< cls, Object :< cls) => cls -> IO GodotString
get_bbcode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_bbcode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_bbcode" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_bbcode

{-# NOINLINE bindRichTextLabel_get_content_height #-}

-- | Returns the height of the content.
bindRichTextLabel_get_content_height :: MethodBind
bindRichTextLabel_get_content_height
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_content_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the height of the content.
get_content_height ::
                     (RichTextLabel :< cls, Object :< cls) => cls -> IO Int
get_content_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_content_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_content_height" '[] (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_content_height

{-# NOINLINE bindRichTextLabel_get_effects #-}

-- | The currently installed custom effects. This is an array of @RichTextEffect@s.
--   			To add a custom effect, it's more convenient to use @method install_effect@.
bindRichTextLabel_get_effects :: MethodBind
bindRichTextLabel_get_effects
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_effects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently installed custom effects. This is an array of @RichTextEffect@s.
--   			To add a custom effect, it's more convenient to use @method install_effect@.
get_effects ::
              (RichTextLabel :< cls, Object :< cls) => cls -> IO Array
get_effects cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_effects (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_effects" '[] (IO Array)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_effects

{-# NOINLINE bindRichTextLabel_get_line_count #-}

-- | Returns the total number of newlines in the tag stack's text tags. Considers wrapped text as one line.
bindRichTextLabel_get_line_count :: MethodBind
bindRichTextLabel_get_line_count
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_line_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of newlines in the tag stack's text tags. Considers wrapped text as one line.
get_line_count ::
                 (RichTextLabel :< cls, Object :< cls) => cls -> IO Int
get_line_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_line_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_line_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_line_count

{-# NOINLINE bindRichTextLabel_get_percent_visible #-}

-- | The range of characters to display, as a @float@ between 0.0 and 1.0. When assigned an out of range value, it's the same as assigning 1.0.
--   			__Note:__ Setting this property updates @visible_characters@ based on current @method get_total_character_count@.
bindRichTextLabel_get_percent_visible :: MethodBind
bindRichTextLabel_get_percent_visible
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The range of characters to display, as a @float@ between 0.0 and 1.0. When assigned an out of range value, it's the same as assigning 1.0.
--   			__Note:__ Setting this property updates @visible_characters@ based on current @method get_total_character_count@.
get_percent_visible ::
                      (RichTextLabel :< cls, Object :< cls) => cls -> IO Float
get_percent_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_percent_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_percent_visible" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_percent_visible

{-# NOINLINE bindRichTextLabel_get_tab_size #-}

-- | The number of spaces associated with a single tab length. Does not affect @\t@ in text tags, only indent tags.
bindRichTextLabel_get_tab_size :: MethodBind
bindRichTextLabel_get_tab_size
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_tab_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of spaces associated with a single tab length. Does not affect @\t@ in text tags, only indent tags.
get_tab_size ::
               (RichTextLabel :< cls, Object :< cls) => cls -> IO Int
get_tab_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_tab_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_tab_size" '[] (IO Int) where
        nodeMethod = Godot.Core.RichTextLabel.get_tab_size

{-# NOINLINE bindRichTextLabel_get_text #-}

-- | The raw text of the label.
--   			When set, clears the tag stack and adds a raw text tag to the top of it. Does not parse BBCodes. Does not modify @bbcode_text@.
bindRichTextLabel_get_text :: MethodBind
bindRichTextLabel_get_text
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The raw text of the label.
--   			When set, clears the tag stack and adds a raw text tag to the top of it. Does not parse BBCodes. Does not modify @bbcode_text@.
get_text ::
           (RichTextLabel :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_text" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_text

{-# NOINLINE bindRichTextLabel_get_total_character_count #-}

-- | Returns the total number of characters from text tags. Does not include BBCodes.
bindRichTextLabel_get_total_character_count :: MethodBind
bindRichTextLabel_get_total_character_count
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_total_character_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of characters from text tags. Does not include BBCodes.
get_total_character_count ::
                            (RichTextLabel :< cls, Object :< cls) => cls -> IO Int
get_total_character_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_total_character_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_total_character_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_total_character_count

{-# NOINLINE bindRichTextLabel_get_v_scroll #-}

-- | Returns the vertical scrollbar.
bindRichTextLabel_get_v_scroll :: MethodBind
bindRichTextLabel_get_v_scroll
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the vertical scrollbar.
get_v_scroll ::
               (RichTextLabel :< cls, Object :< cls) => cls -> IO VScrollBar
get_v_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_v_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_v_scroll" '[]
           (IO VScrollBar)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_v_scroll

{-# NOINLINE bindRichTextLabel_get_visible_characters #-}

-- | The restricted number of characters to display in the label. If @-1@, all characters will be displayed.
bindRichTextLabel_get_visible_characters :: MethodBind
bindRichTextLabel_get_visible_characters
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_visible_characters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The restricted number of characters to display in the label. If @-1@, all characters will be displayed.
get_visible_characters ::
                         (RichTextLabel :< cls, Object :< cls) => cls -> IO Int
get_visible_characters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_visible_characters
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_visible_characters" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_visible_characters

{-# NOINLINE bindRichTextLabel_get_visible_line_count #-}

-- | Returns the number of visible lines.
bindRichTextLabel_get_visible_line_count :: MethodBind
bindRichTextLabel_get_visible_line_count
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "get_visible_line_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of visible lines.
get_visible_line_count ::
                         (RichTextLabel :< cls, Object :< cls) => cls -> IO Int
get_visible_line_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_get_visible_line_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "get_visible_line_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.get_visible_line_count

{-# NOINLINE bindRichTextLabel_install_effect #-}

-- | Installs a custom effect. @effect@ should be a valid @RichTextEffect@.
bindRichTextLabel_install_effect :: MethodBind
bindRichTextLabel_install_effect
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "install_effect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Installs a custom effect. @effect@ should be a valid @RichTextEffect@.
install_effect ::
                 (RichTextLabel :< cls, Object :< cls) =>
                 cls -> GodotVariant -> IO ()
install_effect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_install_effect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "install_effect" '[GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.install_effect

{-# NOINLINE bindRichTextLabel_is_meta_underlined #-}

-- | If @true@, the label underlines meta tags such as @@url@{text}@/url@@.
bindRichTextLabel_is_meta_underlined :: MethodBind
bindRichTextLabel_is_meta_underlined
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "is_meta_underlined" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label underlines meta tags such as @@url@{text}@/url@@.
is_meta_underlined ::
                     (RichTextLabel :< cls, Object :< cls) => cls -> IO Bool
is_meta_underlined cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_is_meta_underlined
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "is_meta_underlined" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RichTextLabel.is_meta_underlined

{-# NOINLINE bindRichTextLabel_is_overriding_selected_font_color
             #-}

-- | If @true@, the label uses the custom font color.
bindRichTextLabel_is_overriding_selected_font_color :: MethodBind
bindRichTextLabel_is_overriding_selected_font_color
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "is_overriding_selected_font_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label uses the custom font color.
is_overriding_selected_font_color ::
                                    (RichTextLabel :< cls, Object :< cls) => cls -> IO Bool
is_overriding_selected_font_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRichTextLabel_is_overriding_selected_font_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel
           "is_overriding_selected_font_color"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.RichTextLabel.is_overriding_selected_font_color

{-# NOINLINE bindRichTextLabel_is_scroll_active #-}

-- | If @true@, the scrollbar is visible. Setting this to @false@ does not block scrolling completely. See @method scroll_to_line@.
bindRichTextLabel_is_scroll_active :: MethodBind
bindRichTextLabel_is_scroll_active
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "is_scroll_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the scrollbar is visible. Setting this to @false@ does not block scrolling completely. See @method scroll_to_line@.
is_scroll_active ::
                   (RichTextLabel :< cls, Object :< cls) => cls -> IO Bool
is_scroll_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_is_scroll_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "is_scroll_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RichTextLabel.is_scroll_active

{-# NOINLINE bindRichTextLabel_is_scroll_following #-}

-- | If @true@, the window scrolls down to display new content automatically.
bindRichTextLabel_is_scroll_following :: MethodBind
bindRichTextLabel_is_scroll_following
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "is_scroll_following" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window scrolls down to display new content automatically.
is_scroll_following ::
                      (RichTextLabel :< cls, Object :< cls) => cls -> IO Bool
is_scroll_following cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_is_scroll_following
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "is_scroll_following" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RichTextLabel.is_scroll_following

{-# NOINLINE bindRichTextLabel_is_selection_enabled #-}

-- | If @true@, the label allows text selection.
bindRichTextLabel_is_selection_enabled :: MethodBind
bindRichTextLabel_is_selection_enabled
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "is_selection_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label allows text selection.
is_selection_enabled ::
                       (RichTextLabel :< cls, Object :< cls) => cls -> IO Bool
is_selection_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_is_selection_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "is_selection_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RichTextLabel.is_selection_enabled

{-# NOINLINE bindRichTextLabel_is_using_bbcode #-}

-- | If @true@, the label uses BBCode formatting.
bindRichTextLabel_is_using_bbcode :: MethodBind
bindRichTextLabel_is_using_bbcode
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "is_using_bbcode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label uses BBCode formatting.
is_using_bbcode ::
                  (RichTextLabel :< cls, Object :< cls) => cls -> IO Bool
is_using_bbcode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_is_using_bbcode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "is_using_bbcode" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RichTextLabel.is_using_bbcode

{-# NOINLINE bindRichTextLabel_newline #-}

-- | Adds a newline tag to the tag stack.
bindRichTextLabel_newline :: MethodBind
bindRichTextLabel_newline
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "newline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a newline tag to the tag stack.
newline :: (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
newline cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_newline (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "newline" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.newline

{-# NOINLINE bindRichTextLabel_parse_bbcode #-}

-- | The assignment version of @method append_bbcode@. Clears the tag stack and inserts the new content. Returns @OK@ if parses @bbcode@ successfully.
bindRichTextLabel_parse_bbcode :: MethodBind
bindRichTextLabel_parse_bbcode
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "parse_bbcode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The assignment version of @method append_bbcode@. Clears the tag stack and inserts the new content. Returns @OK@ if parses @bbcode@ successfully.
parse_bbcode ::
               (RichTextLabel :< cls, Object :< cls) =>
               cls -> GodotString -> IO Int
parse_bbcode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_parse_bbcode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "parse_bbcode" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.RichTextLabel.parse_bbcode

{-# NOINLINE bindRichTextLabel_parse_expressions_for_values #-}

-- | Parses BBCode parameter @expressions@ into a dictionary.
bindRichTextLabel_parse_expressions_for_values :: MethodBind
bindRichTextLabel_parse_expressions_for_values
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "parse_expressions_for_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Parses BBCode parameter @expressions@ into a dictionary.
parse_expressions_for_values ::
                               (RichTextLabel :< cls, Object :< cls) =>
                               cls -> PoolStringArray -> IO Dictionary
parse_expressions_for_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRichTextLabel_parse_expressions_for_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "parse_expressions_for_values"
           '[PoolStringArray]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.RichTextLabel.parse_expressions_for_values

{-# NOINLINE bindRichTextLabel_pop #-}

-- | Terminates the current tag. Use after @push_*@ methods to close BBCodes manually. Does not need to follow @add_*@ methods.
bindRichTextLabel_pop :: MethodBind
bindRichTextLabel_pop
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "pop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Terminates the current tag. Use after @push_*@ methods to close BBCodes manually. Does not need to follow @add_*@ methods.
pop :: (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
pop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_pop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "pop" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.pop

{-# NOINLINE bindRichTextLabel_push_align #-}

-- | Adds an @@align@@ tag based on the given @align@ value. See @enum Align@ for possible values.
bindRichTextLabel_push_align :: MethodBind
bindRichTextLabel_push_align
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an @@align@@ tag based on the given @align@ value. See @enum Align@ for possible values.
push_align ::
             (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
push_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_align" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_align

{-# NOINLINE bindRichTextLabel_push_bold #-}

-- | Adds a @@font@@ tag with a bold font to the tag stack. This is the same as adding a @__@ tag if not currently in a @@i@@ tag.
bindRichTextLabel_push_bold :: MethodBind
bindRichTextLabel_push_bold
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_bold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@font@@ tag with a bold font to the tag stack. This is the same as adding a @__@ tag if not currently in a @@i@@ tag.
push_bold :: (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_bold cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_bold (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_bold" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_bold

{-# NOINLINE bindRichTextLabel_push_bold_italics #-}

-- | Adds a @@font@@ tag with a bold italics font to the tag stack.
bindRichTextLabel_push_bold_italics :: MethodBind
bindRichTextLabel_push_bold_italics
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_bold_italics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@font@@ tag with a bold italics font to the tag stack.
push_bold_italics ::
                    (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_bold_italics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_bold_italics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_bold_italics" '[] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.push_bold_italics

{-# NOINLINE bindRichTextLabel_push_cell #-}

-- | Adds a @@cell@@ tag to the tag stack. Must be inside a @@table@@ tag. See @method push_table@ for details.
bindRichTextLabel_push_cell :: MethodBind
bindRichTextLabel_push_cell
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_cell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@cell@@ tag to the tag stack. Must be inside a @@table@@ tag. See @method push_table@ for details.
push_cell :: (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_cell cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_cell (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_cell" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_cell

{-# NOINLINE bindRichTextLabel_push_color #-}

-- | Adds a @@color@@ tag to the tag stack.
bindRichTextLabel_push_color :: MethodBind
bindRichTextLabel_push_color
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@color@@ tag to the tag stack.
push_color ::
             (RichTextLabel :< cls, Object :< cls) => cls -> Color -> IO ()
push_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.push_color

{-# NOINLINE bindRichTextLabel_push_font #-}

-- | Adds a @@font@@ tag to the tag stack. Overrides default fonts for its duration.
bindRichTextLabel_push_font :: MethodBind
bindRichTextLabel_push_font
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@font@@ tag to the tag stack. Overrides default fonts for its duration.
push_font ::
            (RichTextLabel :< cls, Object :< cls) => cls -> Font -> IO ()
push_font cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_font (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_font" '[Font] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_font

{-# NOINLINE bindRichTextLabel_push_indent #-}

-- | Adds an @@indent@@ tag to the tag stack. Multiplies @level@ by current @tab_size@ to determine new margin length.
bindRichTextLabel_push_indent :: MethodBind
bindRichTextLabel_push_indent
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_indent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an @@indent@@ tag to the tag stack. Multiplies @level@ by current @tab_size@ to determine new margin length.
push_indent ::
              (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
push_indent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_indent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_indent" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.push_indent

{-# NOINLINE bindRichTextLabel_push_italics #-}

-- | Adds a @@font@@ tag with a italics font to the tag stack. This is the same as adding a @@i@@ tag if not currently in a @__@ tag.
bindRichTextLabel_push_italics :: MethodBind
bindRichTextLabel_push_italics
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_italics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@font@@ tag with a italics font to the tag stack. This is the same as adding a @@i@@ tag if not currently in a @__@ tag.
push_italics ::
               (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_italics cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_italics (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_italics" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_italics

{-# NOINLINE bindRichTextLabel_push_list #-}

-- | Adds a @@list@@ tag to the tag stack. Similar to the BBCodes @@ol@@ or @@ul@@, but supports more list types. Not fully implemented!
bindRichTextLabel_push_list :: MethodBind
bindRichTextLabel_push_list
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@list@@ tag to the tag stack. Similar to the BBCodes @@ol@@ or @@ul@@, but supports more list types. Not fully implemented!
push_list ::
            (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
push_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_list" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_list

{-# NOINLINE bindRichTextLabel_push_meta #-}

-- | Adds a @@meta@@ tag to the tag stack. Similar to the BBCode @@url=something@{text}@/url@@, but supports non-@String@ metadata types.
bindRichTextLabel_push_meta :: MethodBind
bindRichTextLabel_push_meta
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@meta@@ tag to the tag stack. Similar to the BBCode @@url=something@{text}@/url@@, but supports non-@String@ metadata types.
push_meta ::
            (RichTextLabel :< cls, Object :< cls) =>
            cls -> GodotVariant -> IO ()
push_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_meta (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_meta" '[GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.push_meta

{-# NOINLINE bindRichTextLabel_push_mono #-}

-- | Adds a @@font@@ tag with a monospace font to the tag stack.
bindRichTextLabel_push_mono :: MethodBind
bindRichTextLabel_push_mono
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_mono" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@font@@ tag with a monospace font to the tag stack.
push_mono :: (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_mono cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_mono (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_mono" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_mono

{-# NOINLINE bindRichTextLabel_push_normal #-}

-- | Adds a @@font@@ tag with a normal font to the tag stack.
bindRichTextLabel_push_normal :: MethodBind
bindRichTextLabel_push_normal
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@font@@ tag with a normal font to the tag stack.
push_normal ::
              (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_normal" '[] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_normal

{-# NOINLINE bindRichTextLabel_push_strikethrough #-}

-- | Adds a @@s@@ tag to the tag stack.
bindRichTextLabel_push_strikethrough :: MethodBind
bindRichTextLabel_push_strikethrough
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_strikethrough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@s@@ tag to the tag stack.
push_strikethrough ::
                     (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_strikethrough cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_strikethrough
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_strikethrough" '[] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.push_strikethrough

{-# NOINLINE bindRichTextLabel_push_table #-}

-- | Adds a @@table=columns@@ tag to the tag stack.
bindRichTextLabel_push_table :: MethodBind
bindRichTextLabel_push_table
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_table" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@table=columns@@ tag to the tag stack.
push_table ::
             (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
push_table cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_table (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_table" '[Int] (IO ()) where
        nodeMethod = Godot.Core.RichTextLabel.push_table

{-# NOINLINE bindRichTextLabel_push_underline #-}

-- | Adds a @@u@@ tag to the tag stack.
bindRichTextLabel_push_underline :: MethodBind
bindRichTextLabel_push_underline
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "push_underline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @@u@@ tag to the tag stack.
push_underline ::
                 (RichTextLabel :< cls, Object :< cls) => cls -> IO ()
push_underline cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_push_underline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "push_underline" '[] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.push_underline

{-# NOINLINE bindRichTextLabel_remove_line #-}

-- | Removes a line of content from the label. Returns @true@ if the line exists.
--   				The @line@ argument is the index of the line to remove, it can take values in the interval @@0, get_line_count() - 1@@.
bindRichTextLabel_remove_line :: MethodBind
bindRichTextLabel_remove_line
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "remove_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a line of content from the label. Returns @true@ if the line exists.
--   				The @line@ argument is the index of the line to remove, it can take values in the interval @@0, get_line_count() - 1@@.
remove_line ::
              (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO Bool
remove_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_remove_line (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "remove_line" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.RichTextLabel.remove_line

{-# NOINLINE bindRichTextLabel_scroll_to_line #-}

-- | Scrolls the window's top line to match @line@.
bindRichTextLabel_scroll_to_line :: MethodBind
bindRichTextLabel_scroll_to_line
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "scroll_to_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scrolls the window's top line to match @line@.
scroll_to_line ::
                 (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
scroll_to_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_scroll_to_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "scroll_to_line" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.scroll_to_line

{-# NOINLINE bindRichTextLabel_set_bbcode #-}

-- | The label's text in BBCode format. Is not representative of manual modifications to the internal tag stack. Erases changes made by other methods when edited.
--   			__Note:__ It is unadvised to use @+=@ operator with @bbcode_text@ (e.g. @bbcode_text += "some string"@) as it replaces the whole text and can cause slowdowns. Use @method append_bbcode@ for adding text instead.
bindRichTextLabel_set_bbcode :: MethodBind
bindRichTextLabel_set_bbcode
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_bbcode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The label's text in BBCode format. Is not representative of manual modifications to the internal tag stack. Erases changes made by other methods when edited.
--   			__Note:__ It is unadvised to use @+=@ operator with @bbcode_text@ (e.g. @bbcode_text += "some string"@) as it replaces the whole text and can cause slowdowns. Use @method append_bbcode@ for adding text instead.
set_bbcode ::
             (RichTextLabel :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_bbcode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_bbcode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_bbcode" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_bbcode

{-# NOINLINE bindRichTextLabel_set_effects #-}

-- | The currently installed custom effects. This is an array of @RichTextEffect@s.
--   			To add a custom effect, it's more convenient to use @method install_effect@.
bindRichTextLabel_set_effects :: MethodBind
bindRichTextLabel_set_effects
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_effects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The currently installed custom effects. This is an array of @RichTextEffect@s.
--   			To add a custom effect, it's more convenient to use @method install_effect@.
set_effects ::
              (RichTextLabel :< cls, Object :< cls) => cls -> Array -> IO ()
set_effects cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_effects (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_effects" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_effects

{-# NOINLINE bindRichTextLabel_set_meta_underline #-}

-- | If @true@, the label underlines meta tags such as @@url@{text}@/url@@.
bindRichTextLabel_set_meta_underline :: MethodBind
bindRichTextLabel_set_meta_underline
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_meta_underline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label underlines meta tags such as @@url@{text}@/url@@.
set_meta_underline ::
                     (RichTextLabel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_meta_underline cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_meta_underline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_meta_underline" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_meta_underline

{-# NOINLINE bindRichTextLabel_set_override_selected_font_color #-}

-- | If @true@, the label uses the custom font color.
bindRichTextLabel_set_override_selected_font_color :: MethodBind
bindRichTextLabel_set_override_selected_font_color
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_override_selected_font_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label uses the custom font color.
set_override_selected_font_color ::
                                   (RichTextLabel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_override_selected_font_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRichTextLabel_set_override_selected_font_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel
           "set_override_selected_font_color"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.RichTextLabel.set_override_selected_font_color

{-# NOINLINE bindRichTextLabel_set_percent_visible #-}

-- | The range of characters to display, as a @float@ between 0.0 and 1.0. When assigned an out of range value, it's the same as assigning 1.0.
--   			__Note:__ Setting this property updates @visible_characters@ based on current @method get_total_character_count@.
bindRichTextLabel_set_percent_visible :: MethodBind
bindRichTextLabel_set_percent_visible
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The range of characters to display, as a @float@ between 0.0 and 1.0. When assigned an out of range value, it's the same as assigning 1.0.
--   			__Note:__ Setting this property updates @visible_characters@ based on current @method get_total_character_count@.
set_percent_visible ::
                      (RichTextLabel :< cls, Object :< cls) => cls -> Float -> IO ()
set_percent_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_percent_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_percent_visible" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_percent_visible

{-# NOINLINE bindRichTextLabel_set_scroll_active #-}

-- | If @true@, the scrollbar is visible. Setting this to @false@ does not block scrolling completely. See @method scroll_to_line@.
bindRichTextLabel_set_scroll_active :: MethodBind
bindRichTextLabel_set_scroll_active
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_scroll_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the scrollbar is visible. Setting this to @false@ does not block scrolling completely. See @method scroll_to_line@.
set_scroll_active ::
                    (RichTextLabel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scroll_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_scroll_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_scroll_active" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_scroll_active

{-# NOINLINE bindRichTextLabel_set_scroll_follow #-}

-- | If @true@, the window scrolls down to display new content automatically.
bindRichTextLabel_set_scroll_follow :: MethodBind
bindRichTextLabel_set_scroll_follow
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_scroll_follow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window scrolls down to display new content automatically.
set_scroll_follow ::
                    (RichTextLabel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scroll_follow cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_scroll_follow
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_scroll_follow" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_scroll_follow

{-# NOINLINE bindRichTextLabel_set_selection_enabled #-}

-- | If @true@, the label allows text selection.
bindRichTextLabel_set_selection_enabled :: MethodBind
bindRichTextLabel_set_selection_enabled
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_selection_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label allows text selection.
set_selection_enabled ::
                        (RichTextLabel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_selection_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_selection_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_selection_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_selection_enabled

{-# NOINLINE bindRichTextLabel_set_tab_size #-}

-- | The number of spaces associated with a single tab length. Does not affect @\t@ in text tags, only indent tags.
bindRichTextLabel_set_tab_size :: MethodBind
bindRichTextLabel_set_tab_size
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_tab_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of spaces associated with a single tab length. Does not affect @\t@ in text tags, only indent tags.
set_tab_size ::
               (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
set_tab_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_tab_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_tab_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_tab_size

{-# NOINLINE bindRichTextLabel_set_table_column_expand #-}

-- | Edits the selected column's expansion options. If @expand@ is @true@, the column expands in proportion to its expansion ratio versus the other columns' ratios.
--   				For example, 2 columns with ratios 3 and 4 plus 70 pixels in available width would expand 30 and 40 pixels, respectively.
--   				If @expand@ is @false@, the column will not contribute to the total ratio.
bindRichTextLabel_set_table_column_expand :: MethodBind
bindRichTextLabel_set_table_column_expand
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_table_column_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Edits the selected column's expansion options. If @expand@ is @true@, the column expands in proportion to its expansion ratio versus the other columns' ratios.
--   				For example, 2 columns with ratios 3 and 4 plus 70 pixels in available width would expand 30 and 40 pixels, respectively.
--   				If @expand@ is @false@, the column will not contribute to the total ratio.
set_table_column_expand ::
                          (RichTextLabel :< cls, Object :< cls) =>
                          cls -> Int -> Bool -> Int -> IO ()
set_table_column_expand cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_table_column_expand
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_table_column_expand"
           '[Int, Bool, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_table_column_expand

{-# NOINLINE bindRichTextLabel_set_text #-}

-- | The raw text of the label.
--   			When set, clears the tag stack and adds a raw text tag to the top of it. Does not parse BBCodes. Does not modify @bbcode_text@.
bindRichTextLabel_set_text :: MethodBind
bindRichTextLabel_set_text
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The raw text of the label.
--   			When set, clears the tag stack and adds a raw text tag to the top of it. Does not parse BBCodes. Does not modify @bbcode_text@.
set_text ::
           (RichTextLabel :< cls, Object :< cls) =>
           cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_text

{-# NOINLINE bindRichTextLabel_set_use_bbcode #-}

-- | If @true@, the label uses BBCode formatting.
bindRichTextLabel_set_use_bbcode :: MethodBind
bindRichTextLabel_set_use_bbcode
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_use_bbcode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the label uses BBCode formatting.
set_use_bbcode ::
                 (RichTextLabel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_bbcode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_use_bbcode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_use_bbcode" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_use_bbcode

{-# NOINLINE bindRichTextLabel_set_visible_characters #-}

-- | The restricted number of characters to display in the label. If @-1@, all characters will be displayed.
bindRichTextLabel_set_visible_characters :: MethodBind
bindRichTextLabel_set_visible_characters
  = unsafePerformIO $
      withCString "RichTextLabel" $
        \ clsNamePtr ->
          withCString "set_visible_characters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The restricted number of characters to display in the label. If @-1@, all characters will be displayed.
set_visible_characters ::
                         (RichTextLabel :< cls, Object :< cls) => cls -> Int -> IO ()
set_visible_characters cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextLabel_set_visible_characters
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RichTextLabel "set_visible_characters" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.RichTextLabel.set_visible_characters