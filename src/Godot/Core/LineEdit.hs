{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.LineEdit
       (Godot.Core.LineEdit._MENU_PASTE, Godot.Core.LineEdit._MENU_UNDO,
        Godot.Core.LineEdit._MENU_SELECT_ALL,
        Godot.Core.LineEdit._ALIGN_CENTER, Godot.Core.LineEdit._ALIGN_LEFT,
        Godot.Core.LineEdit._MENU_CUT, Godot.Core.LineEdit._ALIGN_RIGHT,
        Godot.Core.LineEdit._MENU_REDO, Godot.Core.LineEdit._MENU_MAX,
        Godot.Core.LineEdit._MENU_COPY, Godot.Core.LineEdit._ALIGN_FILL,
        Godot.Core.LineEdit._MENU_CLEAR,
        Godot.Core.LineEdit.sig_text_change_rejected,
        Godot.Core.LineEdit.sig_text_changed,
        Godot.Core.LineEdit.sig_text_entered,
        Godot.Core.LineEdit._editor_settings_changed,
        Godot.Core.LineEdit._gui_input, Godot.Core.LineEdit._text_changed,
        Godot.Core.LineEdit._toggle_draw_caret,
        Godot.Core.LineEdit.append_at_cursor, Godot.Core.LineEdit.clear,
        Godot.Core.LineEdit.cursor_get_blink_enabled,
        Godot.Core.LineEdit.cursor_get_blink_speed,
        Godot.Core.LineEdit.cursor_set_blink_enabled,
        Godot.Core.LineEdit.cursor_set_blink_speed,
        Godot.Core.LineEdit.deselect, Godot.Core.LineEdit.get_align,
        Godot.Core.LineEdit.get_cursor_position,
        Godot.Core.LineEdit.get_expand_to_text_length,
        Godot.Core.LineEdit.get_max_length, Godot.Core.LineEdit.get_menu,
        Godot.Core.LineEdit.get_placeholder,
        Godot.Core.LineEdit.get_placeholder_alpha,
        Godot.Core.LineEdit.get_right_icon,
        Godot.Core.LineEdit.get_secret_character,
        Godot.Core.LineEdit.get_text,
        Godot.Core.LineEdit.is_clear_button_enabled,
        Godot.Core.LineEdit.is_context_menu_enabled,
        Godot.Core.LineEdit.is_editable, Godot.Core.LineEdit.is_secret,
        Godot.Core.LineEdit.is_selecting_enabled,
        Godot.Core.LineEdit.is_shortcut_keys_enabled,
        Godot.Core.LineEdit.menu_option, Godot.Core.LineEdit.select,
        Godot.Core.LineEdit.select_all, Godot.Core.LineEdit.set_align,
        Godot.Core.LineEdit.set_clear_button_enabled,
        Godot.Core.LineEdit.set_context_menu_enabled,
        Godot.Core.LineEdit.set_cursor_position,
        Godot.Core.LineEdit.set_editable,
        Godot.Core.LineEdit.set_expand_to_text_length,
        Godot.Core.LineEdit.set_max_length,
        Godot.Core.LineEdit.set_placeholder,
        Godot.Core.LineEdit.set_placeholder_alpha,
        Godot.Core.LineEdit.set_right_icon, Godot.Core.LineEdit.set_secret,
        Godot.Core.LineEdit.set_secret_character,
        Godot.Core.LineEdit.set_selecting_enabled,
        Godot.Core.LineEdit.set_shortcut_keys_enabled,
        Godot.Core.LineEdit.set_text)
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

_MENU_PASTE :: Int
_MENU_PASTE = 2

_MENU_UNDO :: Int
_MENU_UNDO = 5

_MENU_SELECT_ALL :: Int
_MENU_SELECT_ALL = 4

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_MENU_CUT :: Int
_MENU_CUT = 0

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_MENU_REDO :: Int
_MENU_REDO = 6

_MENU_MAX :: Int
_MENU_MAX = 7

_MENU_COPY :: Int
_MENU_COPY = 1

_ALIGN_FILL :: Int
_ALIGN_FILL = 3

_MENU_CLEAR :: Int
_MENU_CLEAR = 3

-- | Emitted when trying to append text that would overflow the @max_length@.
sig_text_change_rejected :: Godot.Internal.Dispatch.Signal LineEdit
sig_text_change_rejected
  = Godot.Internal.Dispatch.Signal "text_change_rejected"

instance NodeSignal LineEdit "text_change_rejected" '[]

-- | Emitted when the text changes.
sig_text_changed :: Godot.Internal.Dispatch.Signal LineEdit
sig_text_changed = Godot.Internal.Dispatch.Signal "text_changed"

instance NodeSignal LineEdit "text_changed" '[GodotString]

-- | Emitted when the user presses @KEY_ENTER@ on the @LineEdit@.
sig_text_entered :: Godot.Internal.Dispatch.Signal LineEdit
sig_text_entered = Godot.Internal.Dispatch.Signal "text_entered"

instance NodeSignal LineEdit "text_entered" '[GodotString]

instance NodeProperty LineEdit "align" Int 'False where
        nodeProperty = (get_align, wrapDroppingSetter set_align, Nothing)

instance NodeProperty LineEdit "caret_blink" Bool 'False where
        nodeProperty
          = (cursor_get_blink_enabled,
             wrapDroppingSetter cursor_set_blink_enabled, Nothing)

instance NodeProperty LineEdit "caret_blink_speed" Float 'False
         where
        nodeProperty
          = (cursor_get_blink_speed,
             wrapDroppingSetter cursor_set_blink_speed, Nothing)

instance NodeProperty LineEdit "caret_position" Int 'False where
        nodeProperty
          = (get_cursor_position, wrapDroppingSetter set_cursor_position,
             Nothing)

instance NodeProperty LineEdit "clear_button_enabled" Bool 'False
         where
        nodeProperty
          = (is_clear_button_enabled,
             wrapDroppingSetter set_clear_button_enabled, Nothing)

instance NodeProperty LineEdit "context_menu_enabled" Bool 'False
         where
        nodeProperty
          = (is_context_menu_enabled,
             wrapDroppingSetter set_context_menu_enabled, Nothing)

instance NodeProperty LineEdit "editable" Bool 'False where
        nodeProperty
          = (is_editable, wrapDroppingSetter set_editable, Nothing)

instance NodeProperty LineEdit "expand_to_text_length" Bool 'False
         where
        nodeProperty
          = (get_expand_to_text_length,
             wrapDroppingSetter set_expand_to_text_length, Nothing)

instance NodeProperty LineEdit "max_length" Int 'False where
        nodeProperty
          = (get_max_length, wrapDroppingSetter set_max_length, Nothing)

instance NodeProperty LineEdit "placeholder_alpha" Float 'False
         where
        nodeProperty
          = (get_placeholder_alpha, wrapDroppingSetter set_placeholder_alpha,
             Nothing)

instance NodeProperty LineEdit "placeholder_text" GodotString
           'False
         where
        nodeProperty
          = (get_placeholder, wrapDroppingSetter set_placeholder, Nothing)

instance NodeProperty LineEdit "right_icon" Texture 'False where
        nodeProperty
          = (get_right_icon, wrapDroppingSetter set_right_icon, Nothing)

instance NodeProperty LineEdit "secret" Bool 'False where
        nodeProperty = (is_secret, wrapDroppingSetter set_secret, Nothing)

instance NodeProperty LineEdit "secret_character" GodotString
           'False
         where
        nodeProperty
          = (get_secret_character, wrapDroppingSetter set_secret_character,
             Nothing)

instance NodeProperty LineEdit "selecting_enabled" Bool 'False
         where
        nodeProperty
          = (is_selecting_enabled, wrapDroppingSetter set_selecting_enabled,
             Nothing)

instance NodeProperty LineEdit "shortcut_keys_enabled" Bool 'False
         where
        nodeProperty
          = (is_shortcut_keys_enabled,
             wrapDroppingSetter set_shortcut_keys_enabled, Nothing)

instance NodeProperty LineEdit "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

{-# NOINLINE bindLineEdit__editor_settings_changed #-}

bindLineEdit__editor_settings_changed :: MethodBind
bindLineEdit__editor_settings_changed
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "_editor_settings_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_editor_settings_changed ::
                           (LineEdit :< cls, Object :< cls) => cls -> IO ()
_editor_settings_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit__editor_settings_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "_editor_settings_changed" '[] (IO ())
         where
        nodeMethod = Godot.Core.LineEdit._editor_settings_changed

{-# NOINLINE bindLineEdit__gui_input #-}

bindLineEdit__gui_input :: MethodBind
bindLineEdit__gui_input
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (LineEdit :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "_gui_input" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.LineEdit._gui_input

{-# NOINLINE bindLineEdit__text_changed #-}

bindLineEdit__text_changed :: MethodBind
bindLineEdit__text_changed
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "_text_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_text_changed :: (LineEdit :< cls, Object :< cls) => cls -> IO ()
_text_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit__text_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "_text_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.LineEdit._text_changed

{-# NOINLINE bindLineEdit__toggle_draw_caret #-}

bindLineEdit__toggle_draw_caret :: MethodBind
bindLineEdit__toggle_draw_caret
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "_toggle_draw_caret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_toggle_draw_caret ::
                     (LineEdit :< cls, Object :< cls) => cls -> IO ()
_toggle_draw_caret cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit__toggle_draw_caret (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "_toggle_draw_caret" '[] (IO ()) where
        nodeMethod = Godot.Core.LineEdit._toggle_draw_caret

{-# NOINLINE bindLineEdit_append_at_cursor #-}

-- | Adds @text@ after the cursor. If the resulting value is longer than @max_length@, nothing happens.
bindLineEdit_append_at_cursor :: MethodBind
bindLineEdit_append_at_cursor
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "append_at_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds @text@ after the cursor. If the resulting value is longer than @max_length@, nothing happens.
append_at_cursor ::
                   (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
append_at_cursor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_append_at_cursor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "append_at_cursor" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.append_at_cursor

{-# NOINLINE bindLineEdit_clear #-}

-- | Erases the @LineEdit@ text.
bindLineEdit_clear :: MethodBind
bindLineEdit_clear
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Erases the @LineEdit@ text.
clear :: (LineEdit :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.clear

{-# NOINLINE bindLineEdit_cursor_get_blink_enabled #-}

-- | If @true@, the caret (visual cursor) blinks.
bindLineEdit_cursor_get_blink_enabled :: MethodBind
bindLineEdit_cursor_get_blink_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_blink_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the caret (visual cursor) blinks.
cursor_get_blink_enabled ::
                           (LineEdit :< cls, Object :< cls) => cls -> IO Bool
cursor_get_blink_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_cursor_get_blink_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "cursor_get_blink_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.LineEdit.cursor_get_blink_enabled

{-# NOINLINE bindLineEdit_cursor_get_blink_speed #-}

-- | Duration (in seconds) of a caret's blinking cycle.
bindLineEdit_cursor_get_blink_speed :: MethodBind
bindLineEdit_cursor_get_blink_speed
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_blink_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duration (in seconds) of a caret's blinking cycle.
cursor_get_blink_speed ::
                         (LineEdit :< cls, Object :< cls) => cls -> IO Float
cursor_get_blink_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_cursor_get_blink_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "cursor_get_blink_speed" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.LineEdit.cursor_get_blink_speed

{-# NOINLINE bindLineEdit_cursor_set_blink_enabled #-}

-- | If @true@, the caret (visual cursor) blinks.
bindLineEdit_cursor_set_blink_enabled :: MethodBind
bindLineEdit_cursor_set_blink_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_blink_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the caret (visual cursor) blinks.
cursor_set_blink_enabled ::
                           (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
cursor_set_blink_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_cursor_set_blink_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "cursor_set_blink_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.cursor_set_blink_enabled

{-# NOINLINE bindLineEdit_cursor_set_blink_speed #-}

-- | Duration (in seconds) of a caret's blinking cycle.
bindLineEdit_cursor_set_blink_speed :: MethodBind
bindLineEdit_cursor_set_blink_speed
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_blink_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duration (in seconds) of a caret's blinking cycle.
cursor_set_blink_speed ::
                         (LineEdit :< cls, Object :< cls) => cls -> Float -> IO ()
cursor_set_blink_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_cursor_set_blink_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "cursor_set_blink_speed" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.cursor_set_blink_speed

{-# NOINLINE bindLineEdit_deselect #-}

-- | Clears the current selection.
bindLineEdit_deselect :: MethodBind
bindLineEdit_deselect
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "deselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the current selection.
deselect :: (LineEdit :< cls, Object :< cls) => cls -> IO ()
deselect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_deselect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "deselect" '[] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.deselect

{-# NOINLINE bindLineEdit_get_align #-}

-- | Text alignment as defined in the @enum Align@ enum.
bindLineEdit_get_align :: MethodBind
bindLineEdit_get_align
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text alignment as defined in the @enum Align@ enum.
get_align :: (LineEdit :< cls, Object :< cls) => cls -> IO Int
get_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_align" '[] (IO Int) where
        nodeMethod = Godot.Core.LineEdit.get_align

{-# NOINLINE bindLineEdit_get_cursor_position #-}

-- | The cursor's position inside the @LineEdit@. When set, the text may scroll to accommodate it.
bindLineEdit_get_cursor_position :: MethodBind
bindLineEdit_get_cursor_position
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_cursor_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cursor's position inside the @LineEdit@. When set, the text may scroll to accommodate it.
get_cursor_position ::
                      (LineEdit :< cls, Object :< cls) => cls -> IO Int
get_cursor_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_cursor_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_cursor_position" '[] (IO Int)
         where
        nodeMethod = Godot.Core.LineEdit.get_cursor_position

{-# NOINLINE bindLineEdit_get_expand_to_text_length #-}

-- | If @true@, the @LineEdit@ width will increase to stay longer than the @text@. It will __not__ compress if the @text@ is shortened.
bindLineEdit_get_expand_to_text_length :: MethodBind
bindLineEdit_get_expand_to_text_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_expand_to_text_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @LineEdit@ width will increase to stay longer than the @text@. It will __not__ compress if the @text@ is shortened.
get_expand_to_text_length ::
                            (LineEdit :< cls, Object :< cls) => cls -> IO Bool
get_expand_to_text_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_expand_to_text_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_expand_to_text_length" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.LineEdit.get_expand_to_text_length

{-# NOINLINE bindLineEdit_get_max_length #-}

-- | Maximum amount of characters that can be entered inside the @LineEdit@. If @0@, there is no limit.
bindLineEdit_get_max_length :: MethodBind
bindLineEdit_get_max_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum amount of characters that can be entered inside the @LineEdit@. If @0@, there is no limit.
get_max_length :: (LineEdit :< cls, Object :< cls) => cls -> IO Int
get_max_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_max_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_max_length" '[] (IO Int) where
        nodeMethod = Godot.Core.LineEdit.get_max_length

{-# NOINLINE bindLineEdit_get_menu #-}

-- | Returns the @PopupMenu@ of this @LineEdit@. By default, this menu is displayed when right-clicking on the @LineEdit@.
bindLineEdit_get_menu :: MethodBind
bindLineEdit_get_menu
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_menu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @PopupMenu@ of this @LineEdit@. By default, this menu is displayed when right-clicking on the @LineEdit@.
get_menu :: (LineEdit :< cls, Object :< cls) => cls -> IO PopupMenu
get_menu cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_menu (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_menu" '[] (IO PopupMenu) where
        nodeMethod = Godot.Core.LineEdit.get_menu

{-# NOINLINE bindLineEdit_get_placeholder #-}

-- | Text shown when the @LineEdit@ is empty. It is __not__ the @LineEdit@'s default value (see @text@).
bindLineEdit_get_placeholder :: MethodBind
bindLineEdit_get_placeholder
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text shown when the @LineEdit@ is empty. It is __not__ the @LineEdit@'s default value (see @text@).
get_placeholder ::
                  (LineEdit :< cls, Object :< cls) => cls -> IO GodotString
get_placeholder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_placeholder (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_placeholder" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.LineEdit.get_placeholder

{-# NOINLINE bindLineEdit_get_placeholder_alpha #-}

-- | Opacity of the @placeholder_text@. From @0@ to @1@.
bindLineEdit_get_placeholder_alpha :: MethodBind
bindLineEdit_get_placeholder_alpha
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_placeholder_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opacity of the @placeholder_text@. From @0@ to @1@.
get_placeholder_alpha ::
                        (LineEdit :< cls, Object :< cls) => cls -> IO Float
get_placeholder_alpha cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_placeholder_alpha
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_placeholder_alpha" '[] (IO Float)
         where
        nodeMethod = Godot.Core.LineEdit.get_placeholder_alpha

{-# NOINLINE bindLineEdit_get_right_icon #-}

-- | Sets the icon that will appear in the right end of the @LineEdit@ if there's no @text@, or always, if @clear_button_enabled@ is set to @false@.
bindLineEdit_get_right_icon :: MethodBind
bindLineEdit_get_right_icon
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_right_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the icon that will appear in the right end of the @LineEdit@ if there's no @text@, or always, if @clear_button_enabled@ is set to @false@.
get_right_icon ::
                 (LineEdit :< cls, Object :< cls) => cls -> IO Texture
get_right_icon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_right_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_right_icon" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.LineEdit.get_right_icon

{-# NOINLINE bindLineEdit_get_secret_character #-}

-- | The character to use to mask secret input (defaults to "*"). Only a single character can be used as the secret character.
bindLineEdit_get_secret_character :: MethodBind
bindLineEdit_get_secret_character
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_secret_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The character to use to mask secret input (defaults to "*"). Only a single character can be used as the secret character.
get_secret_character ::
                       (LineEdit :< cls, Object :< cls) => cls -> IO GodotString
get_secret_character cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_secret_character
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_secret_character" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.LineEdit.get_secret_character

{-# NOINLINE bindLineEdit_get_text #-}

-- | String value of the @LineEdit@.
--   			__Note:__ Changing text using this property won't emit the @signal text_changed@ signal.
bindLineEdit_get_text :: MethodBind
bindLineEdit_get_text
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | String value of the @LineEdit@.
--   			__Note:__ Changing text using this property won't emit the @signal text_changed@ signal.
get_text ::
           (LineEdit :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "get_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.LineEdit.get_text

{-# NOINLINE bindLineEdit_is_clear_button_enabled #-}

-- | If @true@, the @LineEdit@ will show a clear button if @text@ is not empty, which can be used to clear the text quickly.
bindLineEdit_is_clear_button_enabled :: MethodBind
bindLineEdit_is_clear_button_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_clear_button_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @LineEdit@ will show a clear button if @text@ is not empty, which can be used to clear the text quickly.
is_clear_button_enabled ::
                          (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_clear_button_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_clear_button_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "is_clear_button_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.LineEdit.is_clear_button_enabled

{-# NOINLINE bindLineEdit_is_context_menu_enabled #-}

-- | If @true@, the context menu will appear when right-clicked.
bindLineEdit_is_context_menu_enabled :: MethodBind
bindLineEdit_is_context_menu_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_context_menu_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the context menu will appear when right-clicked.
is_context_menu_enabled ::
                          (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_context_menu_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_context_menu_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "is_context_menu_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.LineEdit.is_context_menu_enabled

{-# NOINLINE bindLineEdit_is_editable #-}

-- | If @false@, existing text cannot be modified and new text cannot be added.
bindLineEdit_is_editable :: MethodBind
bindLineEdit_is_editable
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, existing text cannot be modified and new text cannot be added.
is_editable :: (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_editable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "is_editable" '[] (IO Bool) where
        nodeMethod = Godot.Core.LineEdit.is_editable

{-# NOINLINE bindLineEdit_is_secret #-}

-- | If @true@, every character is replaced with the secret character (see @secret_character@).
bindLineEdit_is_secret :: MethodBind
bindLineEdit_is_secret
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_secret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, every character is replaced with the secret character (see @secret_character@).
is_secret :: (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_secret cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_secret (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "is_secret" '[] (IO Bool) where
        nodeMethod = Godot.Core.LineEdit.is_secret

{-# NOINLINE bindLineEdit_is_selecting_enabled #-}

-- | If @false@, it's impossible to select the text using mouse nor keyboard.
bindLineEdit_is_selecting_enabled :: MethodBind
bindLineEdit_is_selecting_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_selecting_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, it's impossible to select the text using mouse nor keyboard.
is_selecting_enabled ::
                       (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_selecting_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_selecting_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "is_selecting_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.LineEdit.is_selecting_enabled

{-# NOINLINE bindLineEdit_is_shortcut_keys_enabled #-}

-- | If @false@, using shortcuts will be disabled.
bindLineEdit_is_shortcut_keys_enabled :: MethodBind
bindLineEdit_is_shortcut_keys_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_shortcut_keys_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, using shortcuts will be disabled.
is_shortcut_keys_enabled ::
                           (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_shortcut_keys_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_shortcut_keys_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "is_shortcut_keys_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.LineEdit.is_shortcut_keys_enabled

{-# NOINLINE bindLineEdit_menu_option #-}

-- | Executes a given action as defined in the @enum MenuItems@ enum.
bindLineEdit_menu_option :: MethodBind
bindLineEdit_menu_option
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "menu_option" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Executes a given action as defined in the @enum MenuItems@ enum.
menu_option ::
              (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
menu_option cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_menu_option (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "menu_option" '[Int] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.menu_option

{-# NOINLINE bindLineEdit_select #-}

-- | Selects characters inside @LineEdit@ between @from@ and @to@. By default, @from@ is at the beginning and @to@ at the end.
--   				
--   @
--   
--   				text = "Welcome"
--   				select() # Will select "Welcome".
--   				select(4) # Will select "ome".
--   				select(2, 5) # Will select "lco".
--   				
--   @
bindLineEdit_select :: MethodBind
bindLineEdit_select
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects characters inside @LineEdit@ between @from@ and @to@. By default, @from@ is at the beginning and @to@ at the end.
--   				
--   @
--   
--   				text = "Welcome"
--   				select() # Will select "Welcome".
--   				select(4) # Will select "ome".
--   				select(2, 5) # Will select "lco".
--   				
--   @
select ::
         (LineEdit :< cls, Object :< cls) =>
         cls -> Maybe Int -> Maybe Int -> IO ()
select cls arg1 arg2
  = withVariantArray
      [maybe (VariantInt (0)) toVariant arg1,
       maybe (VariantInt (-1)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "select" '[Maybe Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.select

{-# NOINLINE bindLineEdit_select_all #-}

-- | Selects the whole @String@.
bindLineEdit_select_all :: MethodBind
bindLineEdit_select_all
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "select_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects the whole @String@.
select_all :: (LineEdit :< cls, Object :< cls) => cls -> IO ()
select_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_select_all (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "select_all" '[] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.select_all

{-# NOINLINE bindLineEdit_set_align #-}

-- | Text alignment as defined in the @enum Align@ enum.
bindLineEdit_set_align :: MethodBind
bindLineEdit_set_align
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text alignment as defined in the @enum Align@ enum.
set_align ::
            (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_align" '[Int] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.set_align

{-# NOINLINE bindLineEdit_set_clear_button_enabled #-}

-- | If @true@, the @LineEdit@ will show a clear button if @text@ is not empty, which can be used to clear the text quickly.
bindLineEdit_set_clear_button_enabled :: MethodBind
bindLineEdit_set_clear_button_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_clear_button_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @LineEdit@ will show a clear button if @text@ is not empty, which can be used to clear the text quickly.
set_clear_button_enabled ::
                           (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clear_button_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_clear_button_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_clear_button_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_clear_button_enabled

{-# NOINLINE bindLineEdit_set_context_menu_enabled #-}

-- | If @true@, the context menu will appear when right-clicked.
bindLineEdit_set_context_menu_enabled :: MethodBind
bindLineEdit_set_context_menu_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_context_menu_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the context menu will appear when right-clicked.
set_context_menu_enabled ::
                           (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_context_menu_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_context_menu_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_context_menu_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_context_menu_enabled

{-# NOINLINE bindLineEdit_set_cursor_position #-}

-- | The cursor's position inside the @LineEdit@. When set, the text may scroll to accommodate it.
bindLineEdit_set_cursor_position :: MethodBind
bindLineEdit_set_cursor_position
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_cursor_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cursor's position inside the @LineEdit@. When set, the text may scroll to accommodate it.
set_cursor_position ::
                      (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_cursor_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_cursor_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_cursor_position" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_cursor_position

{-# NOINLINE bindLineEdit_set_editable #-}

-- | If @false@, existing text cannot be modified and new text cannot be added.
bindLineEdit_set_editable :: MethodBind
bindLineEdit_set_editable
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, existing text cannot be modified and new text cannot be added.
set_editable ::
               (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_editable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_editable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.set_editable

{-# NOINLINE bindLineEdit_set_expand_to_text_length #-}

-- | If @true@, the @LineEdit@ width will increase to stay longer than the @text@. It will __not__ compress if the @text@ is shortened.
bindLineEdit_set_expand_to_text_length :: MethodBind
bindLineEdit_set_expand_to_text_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_expand_to_text_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @LineEdit@ width will increase to stay longer than the @text@. It will __not__ compress if the @text@ is shortened.
set_expand_to_text_length ::
                            (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand_to_text_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_expand_to_text_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_expand_to_text_length" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_expand_to_text_length

{-# NOINLINE bindLineEdit_set_max_length #-}

-- | Maximum amount of characters that can be entered inside the @LineEdit@. If @0@, there is no limit.
bindLineEdit_set_max_length :: MethodBind
bindLineEdit_set_max_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum amount of characters that can be entered inside the @LineEdit@. If @0@, there is no limit.
set_max_length ::
                 (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_max_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_max_length" '[Int] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.set_max_length

{-# NOINLINE bindLineEdit_set_placeholder #-}

-- | Text shown when the @LineEdit@ is empty. It is __not__ the @LineEdit@'s default value (see @text@).
bindLineEdit_set_placeholder :: MethodBind
bindLineEdit_set_placeholder
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text shown when the @LineEdit@ is empty. It is __not__ the @LineEdit@'s default value (see @text@).
set_placeholder ::
                  (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_placeholder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_placeholder (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_placeholder" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_placeholder

{-# NOINLINE bindLineEdit_set_placeholder_alpha #-}

-- | Opacity of the @placeholder_text@. From @0@ to @1@.
bindLineEdit_set_placeholder_alpha :: MethodBind
bindLineEdit_set_placeholder_alpha
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_placeholder_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opacity of the @placeholder_text@. From @0@ to @1@.
set_placeholder_alpha ::
                        (LineEdit :< cls, Object :< cls) => cls -> Float -> IO ()
set_placeholder_alpha cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_placeholder_alpha
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_placeholder_alpha" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_placeholder_alpha

{-# NOINLINE bindLineEdit_set_right_icon #-}

-- | Sets the icon that will appear in the right end of the @LineEdit@ if there's no @text@, or always, if @clear_button_enabled@ is set to @false@.
bindLineEdit_set_right_icon :: MethodBind
bindLineEdit_set_right_icon
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_right_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the icon that will appear in the right end of the @LineEdit@ if there's no @text@, or always, if @clear_button_enabled@ is set to @false@.
set_right_icon ::
                 (LineEdit :< cls, Object :< cls) => cls -> Texture -> IO ()
set_right_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_right_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_right_icon" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_right_icon

{-# NOINLINE bindLineEdit_set_secret #-}

-- | If @true@, every character is replaced with the secret character (see @secret_character@).
bindLineEdit_set_secret :: MethodBind
bindLineEdit_set_secret
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_secret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, every character is replaced with the secret character (see @secret_character@).
set_secret ::
             (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_secret cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_secret (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_secret" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.LineEdit.set_secret

{-# NOINLINE bindLineEdit_set_secret_character #-}

-- | The character to use to mask secret input (defaults to "*"). Only a single character can be used as the secret character.
bindLineEdit_set_secret_character :: MethodBind
bindLineEdit_set_secret_character
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_secret_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The character to use to mask secret input (defaults to "*"). Only a single character can be used as the secret character.
set_secret_character ::
                       (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_secret_character cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_secret_character
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_secret_character" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_secret_character

{-# NOINLINE bindLineEdit_set_selecting_enabled #-}

-- | If @false@, it's impossible to select the text using mouse nor keyboard.
bindLineEdit_set_selecting_enabled :: MethodBind
bindLineEdit_set_selecting_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_selecting_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, it's impossible to select the text using mouse nor keyboard.
set_selecting_enabled ::
                        (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_selecting_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_selecting_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_selecting_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_selecting_enabled

{-# NOINLINE bindLineEdit_set_shortcut_keys_enabled #-}

-- | If @false@, using shortcuts will be disabled.
bindLineEdit_set_shortcut_keys_enabled :: MethodBind
bindLineEdit_set_shortcut_keys_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_shortcut_keys_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @false@, using shortcuts will be disabled.
set_shortcut_keys_enabled ::
                            (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shortcut_keys_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_shortcut_keys_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_shortcut_keys_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_shortcut_keys_enabled

{-# NOINLINE bindLineEdit_set_text #-}

-- | String value of the @LineEdit@.
--   			__Note:__ Changing text using this property won't emit the @signal text_changed@ signal.
bindLineEdit_set_text :: MethodBind
bindLineEdit_set_text
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | String value of the @LineEdit@.
--   			__Note:__ Changing text using this property won't emit the @signal text_changed@ signal.
set_text ::
           (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineEdit "set_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.LineEdit.set_text