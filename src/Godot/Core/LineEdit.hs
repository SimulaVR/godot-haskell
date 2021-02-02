{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.LineEdit
       (Godot.Core.LineEdit._MENU_PASTE, Godot.Core.LineEdit._ALIGN_RIGHT,
        Godot.Core.LineEdit._ALIGN_FILL, Godot.Core.LineEdit._MENU_CLEAR,
        Godot.Core.LineEdit._MENU_MAX, Godot.Core.LineEdit._MENU_REDO,
        Godot.Core.LineEdit._MENU_COPY, Godot.Core.LineEdit._MENU_UNDO,
        Godot.Core.LineEdit._MENU_SELECT_ALL,
        Godot.Core.LineEdit._MENU_CUT, Godot.Core.LineEdit._ALIGN_LEFT,
        Godot.Core.LineEdit._ALIGN_CENTER,
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MENU_PASTE :: Int
_MENU_PASTE = 2

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_ALIGN_FILL :: Int
_ALIGN_FILL = 3

_MENU_CLEAR :: Int
_MENU_CLEAR = 3

_MENU_MAX :: Int
_MENU_MAX = 7

_MENU_REDO :: Int
_MENU_REDO = 6

_MENU_COPY :: Int
_MENU_COPY = 1

_MENU_UNDO :: Int
_MENU_UNDO = 5

_MENU_SELECT_ALL :: Int
_MENU_SELECT_ALL = 4

_MENU_CUT :: Int
_MENU_CUT = 0

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

sig_text_change_rejected :: Godot.Internal.Dispatch.Signal LineEdit
sig_text_change_rejected
  = Godot.Internal.Dispatch.Signal "text_change_rejected"

-- | Emitted when the text changes.
sig_text_changed :: Godot.Internal.Dispatch.Signal LineEdit
sig_text_changed = Godot.Internal.Dispatch.Signal "text_changed"

-- | Emitted when the user presses [code]KEY_ENTER[/code] on the [code]LineEdit[/code].
sig_text_entered :: Godot.Internal.Dispatch.Signal LineEdit
sig_text_entered = Godot.Internal.Dispatch.Signal "text_entered"

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

{-# NOINLINE bindLineEdit_append_at_cursor #-}

-- | Adds [code]text[/code] after the cursor. If the resulting value is longer than [member max_length], nothing happens.
bindLineEdit_append_at_cursor :: MethodBind
bindLineEdit_append_at_cursor
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "append_at_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds [code]text[/code] after the cursor. If the resulting value is longer than [member max_length], nothing happens.
append_at_cursor ::
                   (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
append_at_cursor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_append_at_cursor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_clear #-}

-- | Erases the [code]LineEdit[/code] text.
bindLineEdit_clear :: MethodBind
bindLineEdit_clear
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Erases the [code]LineEdit[/code] text.
clear :: (LineEdit :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_clear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_cursor_get_blink_enabled #-}

-- | If [code]true[/code], the caret (visual cursor) blinks.
bindLineEdit_cursor_get_blink_enabled :: MethodBind
bindLineEdit_cursor_get_blink_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_blink_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the caret (visual cursor) blinks.
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

{-# NOINLINE bindLineEdit_cursor_set_blink_enabled #-}

-- | If [code]true[/code], the caret (visual cursor) blinks.
bindLineEdit_cursor_set_blink_enabled :: MethodBind
bindLineEdit_cursor_set_blink_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_blink_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the caret (visual cursor) blinks.
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

{-# NOINLINE bindLineEdit_get_align #-}

-- | Text alignment as defined in the ALIGN_* enum.
bindLineEdit_get_align :: MethodBind
bindLineEdit_get_align
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text alignment as defined in the ALIGN_* enum.
get_align :: (LineEdit :< cls, Object :< cls) => cls -> IO Int
get_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_get_cursor_position #-}

-- | The cursor's position inside the [code]LineEdit[/code]. When set, the text may scroll to accommodate it.
bindLineEdit_get_cursor_position :: MethodBind
bindLineEdit_get_cursor_position
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_cursor_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cursor's position inside the [code]LineEdit[/code]. When set, the text may scroll to accommodate it.
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

{-# NOINLINE bindLineEdit_get_expand_to_text_length #-}

-- | If [code]true[/code], the [code]LineEdit[/code] width will increase to stay longer than the [member text]. It will [b]not[/b] compress if the [member text] is shortened.
bindLineEdit_get_expand_to_text_length :: MethodBind
bindLineEdit_get_expand_to_text_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_expand_to_text_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]LineEdit[/code] width will increase to stay longer than the [member text]. It will [b]not[/b] compress if the [member text] is shortened.
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

{-# NOINLINE bindLineEdit_get_max_length #-}

-- | Maximum amount of characters that can be entered inside the [code]LineEdit[/code]. If [code]0[/code], there is no limit.
bindLineEdit_get_max_length :: MethodBind
bindLineEdit_get_max_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum amount of characters that can be entered inside the [code]LineEdit[/code]. If [code]0[/code], there is no limit.
get_max_length :: (LineEdit :< cls, Object :< cls) => cls -> IO Int
get_max_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_max_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_get_menu #-}

-- | Returns the [PopupMenu] of this [code]LineEdit[/code]. By default, this menu is displayed when right-clicking on the [code]LineEdit[/code].
bindLineEdit_get_menu :: MethodBind
bindLineEdit_get_menu
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_menu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [PopupMenu] of this [code]LineEdit[/code]. By default, this menu is displayed when right-clicking on the [code]LineEdit[/code].
get_menu :: (LineEdit :< cls, Object :< cls) => cls -> IO PopupMenu
get_menu cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_menu (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_get_placeholder #-}

-- | Text shown when the [code]LineEdit[/code] is empty. It is [b]not[/b] the [code]LineEdit[/code]'s default value (see [member text]).
bindLineEdit_get_placeholder :: MethodBind
bindLineEdit_get_placeholder
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text shown when the [code]LineEdit[/code] is empty. It is [b]not[/b] the [code]LineEdit[/code]'s default value (see [member text]).
get_placeholder ::
                  (LineEdit :< cls, Object :< cls) => cls -> IO GodotString
get_placeholder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_placeholder (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_get_placeholder_alpha #-}

-- | Opacity of the [member placeholder_text]. From [code]0[/code] to [code]1[/code].
bindLineEdit_get_placeholder_alpha :: MethodBind
bindLineEdit_get_placeholder_alpha
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_placeholder_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opacity of the [member placeholder_text]. From [code]0[/code] to [code]1[/code].
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

{-# NOINLINE bindLineEdit_get_right_icon #-}

bindLineEdit_get_right_icon :: MethodBind
bindLineEdit_get_right_icon
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_right_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_right_icon ::
                 (LineEdit :< cls, Object :< cls) => cls -> IO Texture
get_right_icon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_right_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindLineEdit_get_text #-}

-- | String value of the [code]LineEdit[/code].
bindLineEdit_get_text :: MethodBind
bindLineEdit_get_text
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | String value of the [code]LineEdit[/code].
get_text ::
           (LineEdit :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_get_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_is_clear_button_enabled #-}

-- | If [code]true[/code], the [code]LineEdit[/code] will show a clear button if [code]text[/code] is not empty.
bindLineEdit_is_clear_button_enabled :: MethodBind
bindLineEdit_is_clear_button_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_clear_button_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]LineEdit[/code] will show a clear button if [code]text[/code] is not empty.
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

{-# NOINLINE bindLineEdit_is_context_menu_enabled #-}

-- | If [code]true[/code], the context menu will appear when right clicked.
bindLineEdit_is_context_menu_enabled :: MethodBind
bindLineEdit_is_context_menu_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_context_menu_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the context menu will appear when right clicked.
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

{-# NOINLINE bindLineEdit_is_editable #-}

-- | If [code]false[/code], existing text cannot be modified and new text cannot be added.
bindLineEdit_is_editable :: MethodBind
bindLineEdit_is_editable
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]false[/code], existing text cannot be modified and new text cannot be added.
is_editable :: (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_editable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_is_secret #-}

-- | If [code]true[/code], every character is replaced with the secret character (see [member secret_character]).
bindLineEdit_is_secret :: MethodBind
bindLineEdit_is_secret
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_secret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], every character is replaced with the secret character (see [member secret_character]).
is_secret :: (LineEdit :< cls, Object :< cls) => cls -> IO Bool
is_secret cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_is_secret (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_is_selecting_enabled #-}

bindLineEdit_is_selecting_enabled :: MethodBind
bindLineEdit_is_selecting_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_selecting_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindLineEdit_is_shortcut_keys_enabled #-}

bindLineEdit_is_shortcut_keys_enabled :: MethodBind
bindLineEdit_is_shortcut_keys_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "is_shortcut_keys_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindLineEdit_menu_option #-}

-- | Executes a given action as defined in the MENU_* enum.
bindLineEdit_menu_option :: MethodBind
bindLineEdit_menu_option
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "menu_option" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Executes a given action as defined in the MENU_* enum.
menu_option ::
              (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
menu_option cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_menu_option (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_select #-}

-- | Selects characters inside [code]LineEdit[/code] between [code]from[/code] and [code]to[/code]. By default [code]from[/code] is at the beginning and [code]to[/code] at the end.
--   				[codeblock]
--   				text = "Welcome"
--   				select()     # Welcome
--   				select(4)    # ome
--   				select(2, 5) # lco
--   				[/codeblock]
bindLineEdit_select :: MethodBind
bindLineEdit_select
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects characters inside [code]LineEdit[/code] between [code]from[/code] and [code]to[/code]. By default [code]from[/code] is at the beginning and [code]to[/code] at the end.
--   				[codeblock]
--   				text = "Welcome"
--   				select()     # Welcome
--   				select(4)    # ome
--   				select(2, 5) # lco
--   				[/codeblock]
select ::
         (LineEdit :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
select cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_select_all #-}

-- | Selects the whole [String].
bindLineEdit_select_all :: MethodBind
bindLineEdit_select_all
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "select_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Selects the whole [String].
select_all :: (LineEdit :< cls, Object :< cls) => cls -> IO ()
select_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_select_all (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_set_align #-}

-- | Text alignment as defined in the ALIGN_* enum.
bindLineEdit_set_align :: MethodBind
bindLineEdit_set_align
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text alignment as defined in the ALIGN_* enum.
set_align ::
            (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_set_clear_button_enabled #-}

-- | If [code]true[/code], the [code]LineEdit[/code] will show a clear button if [code]text[/code] is not empty.
bindLineEdit_set_clear_button_enabled :: MethodBind
bindLineEdit_set_clear_button_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_clear_button_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]LineEdit[/code] will show a clear button if [code]text[/code] is not empty.
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

{-# NOINLINE bindLineEdit_set_context_menu_enabled #-}

-- | If [code]true[/code], the context menu will appear when right clicked.
bindLineEdit_set_context_menu_enabled :: MethodBind
bindLineEdit_set_context_menu_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_context_menu_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the context menu will appear when right clicked.
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

{-# NOINLINE bindLineEdit_set_cursor_position #-}

-- | The cursor's position inside the [code]LineEdit[/code]. When set, the text may scroll to accommodate it.
bindLineEdit_set_cursor_position :: MethodBind
bindLineEdit_set_cursor_position
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_cursor_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cursor's position inside the [code]LineEdit[/code]. When set, the text may scroll to accommodate it.
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

{-# NOINLINE bindLineEdit_set_editable #-}

-- | If [code]false[/code], existing text cannot be modified and new text cannot be added.
bindLineEdit_set_editable :: MethodBind
bindLineEdit_set_editable
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]false[/code], existing text cannot be modified and new text cannot be added.
set_editable ::
               (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_editable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_set_expand_to_text_length #-}

-- | If [code]true[/code], the [code]LineEdit[/code] width will increase to stay longer than the [member text]. It will [b]not[/b] compress if the [member text] is shortened.
bindLineEdit_set_expand_to_text_length :: MethodBind
bindLineEdit_set_expand_to_text_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_expand_to_text_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]LineEdit[/code] width will increase to stay longer than the [member text]. It will [b]not[/b] compress if the [member text] is shortened.
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

{-# NOINLINE bindLineEdit_set_max_length #-}

-- | Maximum amount of characters that can be entered inside the [code]LineEdit[/code]. If [code]0[/code], there is no limit.
bindLineEdit_set_max_length :: MethodBind
bindLineEdit_set_max_length
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_max_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum amount of characters that can be entered inside the [code]LineEdit[/code]. If [code]0[/code], there is no limit.
set_max_length ::
                 (LineEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_max_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_set_placeholder #-}

-- | Text shown when the [code]LineEdit[/code] is empty. It is [b]not[/b] the [code]LineEdit[/code]'s default value (see [member text]).
bindLineEdit_set_placeholder :: MethodBind
bindLineEdit_set_placeholder
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text shown when the [code]LineEdit[/code] is empty. It is [b]not[/b] the [code]LineEdit[/code]'s default value (see [member text]).
set_placeholder ::
                  (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_placeholder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_placeholder (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_set_placeholder_alpha #-}

-- | Opacity of the [member placeholder_text]. From [code]0[/code] to [code]1[/code].
bindLineEdit_set_placeholder_alpha :: MethodBind
bindLineEdit_set_placeholder_alpha
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_placeholder_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opacity of the [member placeholder_text]. From [code]0[/code] to [code]1[/code].
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

{-# NOINLINE bindLineEdit_set_right_icon #-}

bindLineEdit_set_right_icon :: MethodBind
bindLineEdit_set_right_icon
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_right_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_right_icon ::
                 (LineEdit :< cls, Object :< cls) => cls -> Texture -> IO ()
set_right_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_right_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLineEdit_set_secret #-}

-- | If [code]true[/code], every character is replaced with the secret character (see [member secret_character]).
bindLineEdit_set_secret :: MethodBind
bindLineEdit_set_secret
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_secret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], every character is replaced with the secret character (see [member secret_character]).
set_secret ::
             (LineEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_secret cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_secret (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindLineEdit_set_selecting_enabled #-}

bindLineEdit_set_selecting_enabled :: MethodBind
bindLineEdit_set_selecting_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_selecting_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindLineEdit_set_shortcut_keys_enabled #-}

bindLineEdit_set_shortcut_keys_enabled :: MethodBind
bindLineEdit_set_shortcut_keys_enabled
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_shortcut_keys_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindLineEdit_set_text #-}

-- | String value of the [code]LineEdit[/code].
bindLineEdit_set_text :: MethodBind
bindLineEdit_set_text
  = unsafePerformIO $
      withCString "LineEdit" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | String value of the [code]LineEdit[/code].
set_text ::
           (LineEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineEdit_set_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)