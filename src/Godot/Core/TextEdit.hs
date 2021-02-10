{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextEdit
       (Godot.Core.TextEdit._MENU_PASTE,
        Godot.Core.TextEdit._SEARCH_WHOLE_WORDS,
        Godot.Core.TextEdit._MENU_CLEAR, Godot.Core.TextEdit._MENU_MAX,
        Godot.Core.TextEdit._MENU_REDO,
        Godot.Core.TextEdit._SEARCH_BACKWARDS,
        Godot.Core.TextEdit._MENU_COPY,
        Godot.Core.TextEdit._SEARCH_RESULT_COLUMN,
        Godot.Core.TextEdit._MENU_UNDO,
        Godot.Core.TextEdit._MENU_SELECT_ALL,
        Godot.Core.TextEdit._MENU_CUT,
        Godot.Core.TextEdit._SEARCH_RESULT_LINE,
        Godot.Core.TextEdit._SEARCH_MATCH_CASE,
        Godot.Core.TextEdit.sig_breakpoint_toggled,
        Godot.Core.TextEdit.sig_cursor_changed,
        Godot.Core.TextEdit.sig_info_clicked,
        Godot.Core.TextEdit.sig_request_completion,
        Godot.Core.TextEdit.sig_symbol_lookup,
        Godot.Core.TextEdit.sig_text_changed,
        Godot.Core.TextEdit._click_selection_held,
        Godot.Core.TextEdit._cursor_changed_emit,
        Godot.Core.TextEdit._gui_input,
        Godot.Core.TextEdit._push_current_op,
        Godot.Core.TextEdit._scroll_moved,
        Godot.Core.TextEdit._text_changed_emit,
        Godot.Core.TextEdit._toggle_draw_caret,
        Godot.Core.TextEdit._update_wrap_at,
        Godot.Core.TextEdit._v_scroll_input,
        Godot.Core.TextEdit.add_color_region,
        Godot.Core.TextEdit.add_keyword_color,
        Godot.Core.TextEdit.can_fold,
        Godot.Core.TextEdit.center_viewport_to_cursor,
        Godot.Core.TextEdit.clear_colors,
        Godot.Core.TextEdit.clear_undo_history, Godot.Core.TextEdit.copy,
        Godot.Core.TextEdit.cursor_get_blink_enabled,
        Godot.Core.TextEdit.cursor_get_blink_speed,
        Godot.Core.TextEdit.cursor_get_column,
        Godot.Core.TextEdit.cursor_get_line,
        Godot.Core.TextEdit.cursor_is_block_mode,
        Godot.Core.TextEdit.cursor_set_blink_enabled,
        Godot.Core.TextEdit.cursor_set_blink_speed,
        Godot.Core.TextEdit.cursor_set_block_mode,
        Godot.Core.TextEdit.cursor_set_column,
        Godot.Core.TextEdit.cursor_set_line, Godot.Core.TextEdit.cut,
        Godot.Core.TextEdit.deselect, Godot.Core.TextEdit.draw_minimap,
        Godot.Core.TextEdit.fold_all_lines, Godot.Core.TextEdit.fold_line,
        Godot.Core.TextEdit.get_breakpoints,
        Godot.Core.TextEdit.get_h_scroll,
        Godot.Core.TextEdit.get_keyword_color,
        Godot.Core.TextEdit.get_line, Godot.Core.TextEdit.get_line_count,
        Godot.Core.TextEdit.get_menu,
        Godot.Core.TextEdit.get_minimap_width,
        Godot.Core.TextEdit.get_selection_from_column,
        Godot.Core.TextEdit.get_selection_from_line,
        Godot.Core.TextEdit.get_selection_text,
        Godot.Core.TextEdit.get_selection_to_column,
        Godot.Core.TextEdit.get_selection_to_line,
        Godot.Core.TextEdit.get_text, Godot.Core.TextEdit.get_v_scroll,
        Godot.Core.TextEdit.get_v_scroll_speed,
        Godot.Core.TextEdit.get_word_under_cursor,
        Godot.Core.TextEdit.has_keyword_color,
        Godot.Core.TextEdit.insert_text_at_cursor,
        Godot.Core.TextEdit.is_breakpoint_gutter_enabled,
        Godot.Core.TextEdit.is_context_menu_enabled,
        Godot.Core.TextEdit.is_drawing_fold_gutter,
        Godot.Core.TextEdit.is_drawing_minimap,
        Godot.Core.TextEdit.is_drawing_spaces,
        Godot.Core.TextEdit.is_drawing_tabs, Godot.Core.TextEdit.is_folded,
        Godot.Core.TextEdit.is_hiding_enabled,
        Godot.Core.TextEdit.is_highlight_all_occurrences_enabled,
        Godot.Core.TextEdit.is_highlight_current_line_enabled,
        Godot.Core.TextEdit.is_line_hidden,
        Godot.Core.TextEdit.is_overriding_selected_font_color,
        Godot.Core.TextEdit.is_readonly,
        Godot.Core.TextEdit.is_right_click_moving_caret,
        Godot.Core.TextEdit.is_selecting_enabled,
        Godot.Core.TextEdit.is_selection_active,
        Godot.Core.TextEdit.is_shortcut_keys_enabled,
        Godot.Core.TextEdit.is_show_line_numbers_enabled,
        Godot.Core.TextEdit.is_smooth_scroll_enabled,
        Godot.Core.TextEdit.is_syntax_coloring_enabled,
        Godot.Core.TextEdit.is_wrap_enabled,
        Godot.Core.TextEdit.menu_option, Godot.Core.TextEdit.paste,
        Godot.Core.TextEdit.redo, Godot.Core.TextEdit.remove_breakpoints,
        Godot.Core.TextEdit.search, Godot.Core.TextEdit.select,
        Godot.Core.TextEdit.select_all,
        Godot.Core.TextEdit.set_breakpoint_gutter_enabled,
        Godot.Core.TextEdit.set_context_menu_enabled,
        Godot.Core.TextEdit.set_draw_fold_gutter,
        Godot.Core.TextEdit.set_draw_spaces,
        Godot.Core.TextEdit.set_draw_tabs,
        Godot.Core.TextEdit.set_h_scroll,
        Godot.Core.TextEdit.set_hiding_enabled,
        Godot.Core.TextEdit.set_highlight_all_occurrences,
        Godot.Core.TextEdit.set_highlight_current_line,
        Godot.Core.TextEdit.set_line_as_hidden,
        Godot.Core.TextEdit.set_minimap_width,
        Godot.Core.TextEdit.set_override_selected_font_color,
        Godot.Core.TextEdit.set_readonly,
        Godot.Core.TextEdit.set_right_click_moves_caret,
        Godot.Core.TextEdit.set_selecting_enabled,
        Godot.Core.TextEdit.set_shortcut_keys_enabled,
        Godot.Core.TextEdit.set_show_line_numbers,
        Godot.Core.TextEdit.set_smooth_scroll_enable,
        Godot.Core.TextEdit.set_syntax_coloring,
        Godot.Core.TextEdit.set_text, Godot.Core.TextEdit.set_v_scroll,
        Godot.Core.TextEdit.set_v_scroll_speed,
        Godot.Core.TextEdit.set_wrap_enabled,
        Godot.Core.TextEdit.toggle_fold_line, Godot.Core.TextEdit.undo,
        Godot.Core.TextEdit.unfold_line,
        Godot.Core.TextEdit.unhide_all_lines)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MENU_PASTE :: Int
_MENU_PASTE = 2

_SEARCH_WHOLE_WORDS :: Int
_SEARCH_WHOLE_WORDS = 2

_MENU_CLEAR :: Int
_MENU_CLEAR = 3

_MENU_MAX :: Int
_MENU_MAX = 7

_MENU_REDO :: Int
_MENU_REDO = 6

_SEARCH_BACKWARDS :: Int
_SEARCH_BACKWARDS = 4

_MENU_COPY :: Int
_MENU_COPY = 1

_SEARCH_RESULT_COLUMN :: Int
_SEARCH_RESULT_COLUMN = 0

_MENU_UNDO :: Int
_MENU_UNDO = 5

_MENU_SELECT_ALL :: Int
_MENU_SELECT_ALL = 4

_MENU_CUT :: Int
_MENU_CUT = 0

_SEARCH_RESULT_LINE :: Int
_SEARCH_RESULT_LINE = 1

_SEARCH_MATCH_CASE :: Int
_SEARCH_MATCH_CASE = 1

-- | Emitted when a breakpoint is placed via the breakpoint gutter.
sig_breakpoint_toggled :: Godot.Internal.Dispatch.Signal TextEdit
sig_breakpoint_toggled
  = Godot.Internal.Dispatch.Signal "breakpoint_toggled"

instance NodeSignal TextEdit "breakpoint_toggled" '[Int]

-- | Emitted when the cursor changes.
sig_cursor_changed :: Godot.Internal.Dispatch.Signal TextEdit
sig_cursor_changed
  = Godot.Internal.Dispatch.Signal "cursor_changed"

instance NodeSignal TextEdit "cursor_changed" '[]

-- | Emitted when the info icon is clicked.
sig_info_clicked :: Godot.Internal.Dispatch.Signal TextEdit
sig_info_clicked = Godot.Internal.Dispatch.Signal "info_clicked"

instance NodeSignal TextEdit "info_clicked" '[Int, GodotString]

sig_request_completion :: Godot.Internal.Dispatch.Signal TextEdit
sig_request_completion
  = Godot.Internal.Dispatch.Signal "request_completion"

instance NodeSignal TextEdit "request_completion" '[]

sig_symbol_lookup :: Godot.Internal.Dispatch.Signal TextEdit
sig_symbol_lookup = Godot.Internal.Dispatch.Signal "symbol_lookup"

instance NodeSignal TextEdit "symbol_lookup"
           '[GodotString, Int, Int]

-- | Emitted when the text changes.
sig_text_changed :: Godot.Internal.Dispatch.Signal TextEdit
sig_text_changed = Godot.Internal.Dispatch.Signal "text_changed"

instance NodeSignal TextEdit "text_changed" '[]

{-# NOINLINE bindTextEdit__click_selection_held #-}

bindTextEdit__click_selection_held :: MethodBind
bindTextEdit__click_selection_held
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_click_selection_held" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_click_selection_held ::
                        (TextEdit :< cls, Object :< cls) => cls -> IO ()
_click_selection_held cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__click_selection_held
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__cursor_changed_emit #-}

bindTextEdit__cursor_changed_emit :: MethodBind
bindTextEdit__cursor_changed_emit
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_cursor_changed_emit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_cursor_changed_emit ::
                       (TextEdit :< cls, Object :< cls) => cls -> IO ()
_cursor_changed_emit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__cursor_changed_emit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__gui_input #-}

bindTextEdit__gui_input :: MethodBind
bindTextEdit__gui_input
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (TextEdit :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__push_current_op #-}

bindTextEdit__push_current_op :: MethodBind
bindTextEdit__push_current_op
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_push_current_op" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_push_current_op ::
                   (TextEdit :< cls, Object :< cls) => cls -> IO ()
_push_current_op cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__push_current_op (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__scroll_moved #-}

bindTextEdit__scroll_moved :: MethodBind
bindTextEdit__scroll_moved
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_scroll_moved" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_scroll_moved ::
                (TextEdit :< cls, Object :< cls) => cls -> Float -> IO ()
_scroll_moved cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__scroll_moved (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__text_changed_emit #-}

bindTextEdit__text_changed_emit :: MethodBind
bindTextEdit__text_changed_emit
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_text_changed_emit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_text_changed_emit ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO ()
_text_changed_emit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__text_changed_emit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__toggle_draw_caret #-}

bindTextEdit__toggle_draw_caret :: MethodBind
bindTextEdit__toggle_draw_caret
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_toggle_draw_caret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_toggle_draw_caret ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO ()
_toggle_draw_caret cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__toggle_draw_caret (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__update_wrap_at #-}

bindTextEdit__update_wrap_at :: MethodBind
bindTextEdit__update_wrap_at
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_update_wrap_at" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_wrap_at :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
_update_wrap_at cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__update_wrap_at (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit__v_scroll_input #-}

bindTextEdit__v_scroll_input :: MethodBind
bindTextEdit__v_scroll_input
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "_v_scroll_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_v_scroll_input :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
_v_scroll_input cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit__v_scroll_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_add_color_region #-}

-- | Adds color region (given the delimiters) and its colors.
bindTextEdit_add_color_region :: MethodBind
bindTextEdit_add_color_region
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "add_color_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds color region (given the delimiters) and its colors.
add_color_region ::
                   (TextEdit :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> Color -> Bool -> IO ()
add_color_region cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_add_color_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_add_keyword_color #-}

-- | Adds a [code]keyword[/code] and its [Color].
bindTextEdit_add_keyword_color :: MethodBind
bindTextEdit_add_keyword_color
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "add_keyword_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [code]keyword[/code] and its [Color].
add_keyword_color ::
                    (TextEdit :< cls, Object :< cls) =>
                    cls -> GodotString -> Color -> IO ()
add_keyword_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_add_keyword_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_can_fold #-}

-- | Returns if the given line is foldable, that is, it has indented lines right below it.
bindTextEdit_can_fold :: MethodBind
bindTextEdit_can_fold
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "can_fold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns if the given line is foldable, that is, it has indented lines right below it.
can_fold ::
           (TextEdit :< cls, Object :< cls) => cls -> Int -> IO Bool
can_fold cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_can_fold (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_center_viewport_to_cursor #-}

-- | Centers the viewport on the line the editing cursor is at. This also resets the [member scroll_horizontal] value to [code]0[/code].
bindTextEdit_center_viewport_to_cursor :: MethodBind
bindTextEdit_center_viewport_to_cursor
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "center_viewport_to_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Centers the viewport on the line the editing cursor is at. This also resets the [member scroll_horizontal] value to [code]0[/code].
center_viewport_to_cursor ::
                            (TextEdit :< cls, Object :< cls) => cls -> IO ()
center_viewport_to_cursor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_center_viewport_to_cursor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_clear_colors #-}

-- | Clears all custom syntax coloring information previously added with [method add_color_region] or [method add_keyword_color].
bindTextEdit_clear_colors :: MethodBind
bindTextEdit_clear_colors
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "clear_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all custom syntax coloring information previously added with [method add_color_region] or [method add_keyword_color].
clear_colors :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
clear_colors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_clear_colors (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_clear_undo_history #-}

-- | Clears the undo history.
bindTextEdit_clear_undo_history :: MethodBind
bindTextEdit_clear_undo_history
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "clear_undo_history" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the undo history.
clear_undo_history ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO ()
clear_undo_history cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_clear_undo_history (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_copy #-}

-- | Copy's the current text selection.
bindTextEdit_copy :: MethodBind
bindTextEdit_copy
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "copy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Copy's the current text selection.
copy :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
copy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_copy (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_get_blink_enabled #-}

-- | If [code]true[/code], the caret (visual cursor) blinks.
bindTextEdit_cursor_get_blink_enabled :: MethodBind
bindTextEdit_cursor_get_blink_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_blink_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the caret (visual cursor) blinks.
cursor_get_blink_enabled ::
                           (TextEdit :< cls, Object :< cls) => cls -> IO Bool
cursor_get_blink_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_get_blink_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_get_blink_speed #-}

-- | Duration (in seconds) of a caret's blinking cycle.
bindTextEdit_cursor_get_blink_speed :: MethodBind
bindTextEdit_cursor_get_blink_speed
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_blink_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duration (in seconds) of a caret's blinking cycle.
cursor_get_blink_speed ::
                         (TextEdit :< cls, Object :< cls) => cls -> IO Float
cursor_get_blink_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_get_blink_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_get_column #-}

-- | Returns the column the editing cursor is at.
bindTextEdit_cursor_get_column :: MethodBind
bindTextEdit_cursor_get_column
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_column" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the column the editing cursor is at.
cursor_get_column ::
                    (TextEdit :< cls, Object :< cls) => cls -> IO Int
cursor_get_column cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_get_column (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_get_line #-}

-- | Returns the line the editing cursor is at.
bindTextEdit_cursor_get_line :: MethodBind
bindTextEdit_cursor_get_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_get_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the line the editing cursor is at.
cursor_get_line ::
                  (TextEdit :< cls, Object :< cls) => cls -> IO Int
cursor_get_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_get_line (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_is_block_mode #-}

-- | If [code]true[/code], the caret displays as a rectangle.
--   			If [code]false[/code], the caret displays as a bar.
bindTextEdit_cursor_is_block_mode :: MethodBind
bindTextEdit_cursor_is_block_mode
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_is_block_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the caret displays as a rectangle.
--   			If [code]false[/code], the caret displays as a bar.
cursor_is_block_mode ::
                       (TextEdit :< cls, Object :< cls) => cls -> IO Bool
cursor_is_block_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_is_block_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_set_blink_enabled #-}

-- | If [code]true[/code], the caret (visual cursor) blinks.
bindTextEdit_cursor_set_blink_enabled :: MethodBind
bindTextEdit_cursor_set_blink_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_blink_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the caret (visual cursor) blinks.
cursor_set_blink_enabled ::
                           (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
cursor_set_blink_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_set_blink_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_set_blink_speed #-}

-- | Duration (in seconds) of a caret's blinking cycle.
bindTextEdit_cursor_set_blink_speed :: MethodBind
bindTextEdit_cursor_set_blink_speed
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_blink_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duration (in seconds) of a caret's blinking cycle.
cursor_set_blink_speed ::
                         (TextEdit :< cls, Object :< cls) => cls -> Float -> IO ()
cursor_set_blink_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_set_blink_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_set_block_mode #-}

-- | If [code]true[/code], the caret displays as a rectangle.
--   			If [code]false[/code], the caret displays as a bar.
bindTextEdit_cursor_set_block_mode :: MethodBind
bindTextEdit_cursor_set_block_mode
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_block_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the caret displays as a rectangle.
--   			If [code]false[/code], the caret displays as a bar.
cursor_set_block_mode ::
                        (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
cursor_set_block_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_set_block_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_set_column #-}

-- | Moves the cursor at the specified [code]column[/code] index.
--   				If [code]adjust_viewport[/code] is set to [code]true[/code], the viewport will center at the cursor position after the move occurs.
bindTextEdit_cursor_set_column :: MethodBind
bindTextEdit_cursor_set_column
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_column" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the cursor at the specified [code]column[/code] index.
--   				If [code]adjust_viewport[/code] is set to [code]true[/code], the viewport will center at the cursor position after the move occurs.
cursor_set_column ::
                    (TextEdit :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
cursor_set_column cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_set_column (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cursor_set_line #-}

-- | Moves the cursor at the specified [code]line[/code] index.
--   				If [code]adjust_viewport[/code] is set to [code]true[/code], the viewport will center at the cursor position after the move occurs.
--   				If [code]can_be_hidden[/code] is set to [code]true[/code], the specified [code]line[/code] can be hidden using [method set_line_as_hidden].
bindTextEdit_cursor_set_line :: MethodBind
bindTextEdit_cursor_set_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cursor_set_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the cursor at the specified [code]line[/code] index.
--   				If [code]adjust_viewport[/code] is set to [code]true[/code], the viewport will center at the cursor position after the move occurs.
--   				If [code]can_be_hidden[/code] is set to [code]true[/code], the specified [code]line[/code] can be hidden using [method set_line_as_hidden].
cursor_set_line ::
                  (TextEdit :< cls, Object :< cls) =>
                  cls -> Int -> Bool -> Bool -> Int -> IO ()
cursor_set_line cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cursor_set_line (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_cut #-}

-- | Cut's the current selection.
bindTextEdit_cut :: MethodBind
bindTextEdit_cut
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "cut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Cut's the current selection.
cut :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
cut cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_cut (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_deselect #-}

-- | Deselects the current selection.
bindTextEdit_deselect :: MethodBind
bindTextEdit_deselect
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "deselect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deselects the current selection.
deselect :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
deselect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_deselect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_draw_minimap #-}

-- | If [code]true[/code], a minimap is shown, providing an outline of your source code.
bindTextEdit_draw_minimap :: MethodBind
bindTextEdit_draw_minimap
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "draw_minimap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a minimap is shown, providing an outline of your source code.
draw_minimap ::
               (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
draw_minimap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_draw_minimap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_fold_all_lines #-}

-- | Folds all lines that are possible to be folded (see [method can_fold]).
bindTextEdit_fold_all_lines :: MethodBind
bindTextEdit_fold_all_lines
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "fold_all_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Folds all lines that are possible to be folded (see [method can_fold]).
fold_all_lines :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
fold_all_lines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_fold_all_lines (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_fold_line #-}

-- | Folds the given line, if possible (see [method can_fold]).
bindTextEdit_fold_line :: MethodBind
bindTextEdit_fold_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "fold_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Folds the given line, if possible (see [method can_fold]).
fold_line ::
            (TextEdit :< cls, Object :< cls) => cls -> Int -> IO ()
fold_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_fold_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_breakpoints #-}

-- | Returns an array containing the line number of each breakpoint.
bindTextEdit_get_breakpoints :: MethodBind
bindTextEdit_get_breakpoints
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_breakpoints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array containing the line number of each breakpoint.
get_breakpoints ::
                  (TextEdit :< cls, Object :< cls) => cls -> IO Array
get_breakpoints cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_breakpoints (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_h_scroll #-}

-- | The current horizontal scroll value.
bindTextEdit_get_h_scroll :: MethodBind
bindTextEdit_get_h_scroll
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_h_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current horizontal scroll value.
get_h_scroll :: (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_h_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_h_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_keyword_color #-}

-- | Returns the [Color] of the specified [code]keyword[/code].
bindTextEdit_get_keyword_color :: MethodBind
bindTextEdit_get_keyword_color
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_keyword_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Color] of the specified [code]keyword[/code].
get_keyword_color ::
                    (TextEdit :< cls, Object :< cls) => cls -> GodotString -> IO Color
get_keyword_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_keyword_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_line #-}

-- | Returns the text of a specific line.
bindTextEdit_get_line :: MethodBind
bindTextEdit_get_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the text of a specific line.
get_line ::
           (TextEdit :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_line_count #-}

-- | Returns the amount of total lines in the text.
bindTextEdit_get_line_count :: MethodBind
bindTextEdit_get_line_count
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_line_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of total lines in the text.
get_line_count :: (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_line_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_line_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_menu #-}

-- | Returns the [PopupMenu] of this [TextEdit]. By default, this menu is displayed when right-clicking on the [TextEdit].
bindTextEdit_get_menu :: MethodBind
bindTextEdit_get_menu
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_menu" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [PopupMenu] of this [TextEdit]. By default, this menu is displayed when right-clicking on the [TextEdit].
get_menu :: (TextEdit :< cls, Object :< cls) => cls -> IO PopupMenu
get_menu cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_menu (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_minimap_width #-}

-- | The width, in pixels, of the minimap.
bindTextEdit_get_minimap_width :: MethodBind
bindTextEdit_get_minimap_width
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_minimap_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width, in pixels, of the minimap.
get_minimap_width ::
                    (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_minimap_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_minimap_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_selection_from_column #-}

-- | Returns the selection begin column.
bindTextEdit_get_selection_from_column :: MethodBind
bindTextEdit_get_selection_from_column
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_selection_from_column" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the selection begin column.
get_selection_from_column ::
                            (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_selection_from_column cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_selection_from_column
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_selection_from_line #-}

-- | Returns the selection begin line.
bindTextEdit_get_selection_from_line :: MethodBind
bindTextEdit_get_selection_from_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_selection_from_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the selection begin line.
get_selection_from_line ::
                          (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_selection_from_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_selection_from_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_selection_text #-}

-- | Returns the text inside the selection.
bindTextEdit_get_selection_text :: MethodBind
bindTextEdit_get_selection_text
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_selection_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the text inside the selection.
get_selection_text ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO GodotString
get_selection_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_selection_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_selection_to_column #-}

-- | Returns the selection end column.
bindTextEdit_get_selection_to_column :: MethodBind
bindTextEdit_get_selection_to_column
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_selection_to_column" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the selection end column.
get_selection_to_column ::
                          (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_selection_to_column cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_selection_to_column
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_selection_to_line #-}

-- | Returns the selection end line.
bindTextEdit_get_selection_to_line :: MethodBind
bindTextEdit_get_selection_to_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_selection_to_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the selection end line.
get_selection_to_line ::
                        (TextEdit :< cls, Object :< cls) => cls -> IO Int
get_selection_to_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_selection_to_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_text #-}

-- | String value of the [TextEdit].
bindTextEdit_get_text :: MethodBind
bindTextEdit_get_text
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | String value of the [TextEdit].
get_text ::
           (TextEdit :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_v_scroll #-}

-- | The current vertical scroll value.
bindTextEdit_get_v_scroll :: MethodBind
bindTextEdit_get_v_scroll
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current vertical scroll value.
get_v_scroll :: (TextEdit :< cls, Object :< cls) => cls -> IO Float
get_v_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_v_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_v_scroll_speed #-}

-- | Vertical scroll sensitivity.
bindTextEdit_get_v_scroll_speed :: MethodBind
bindTextEdit_get_v_scroll_speed
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_v_scroll_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Vertical scroll sensitivity.
get_v_scroll_speed ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO Float
get_v_scroll_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_v_scroll_speed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_get_word_under_cursor #-}

-- | Returns a [String] text with the word under the mouse cursor location.
bindTextEdit_get_word_under_cursor :: MethodBind
bindTextEdit_get_word_under_cursor
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "get_word_under_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [String] text with the word under the mouse cursor location.
get_word_under_cursor ::
                        (TextEdit :< cls, Object :< cls) => cls -> IO GodotString
get_word_under_cursor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_get_word_under_cursor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_has_keyword_color #-}

-- | Returns whether the specified [code]keyword[/code] has a color set to it or not.
bindTextEdit_has_keyword_color :: MethodBind
bindTextEdit_has_keyword_color
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "has_keyword_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the specified [code]keyword[/code] has a color set to it or not.
has_keyword_color ::
                    (TextEdit :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_keyword_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_has_keyword_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_insert_text_at_cursor #-}

-- | Insert the specified text at the cursor position.
bindTextEdit_insert_text_at_cursor :: MethodBind
bindTextEdit_insert_text_at_cursor
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "insert_text_at_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Insert the specified text at the cursor position.
insert_text_at_cursor ::
                        (TextEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
insert_text_at_cursor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_insert_text_at_cursor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_breakpoint_gutter_enabled #-}

-- | If [code]true[/code], the breakpoint gutter is visible.
bindTextEdit_is_breakpoint_gutter_enabled :: MethodBind
bindTextEdit_is_breakpoint_gutter_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_breakpoint_gutter_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the breakpoint gutter is visible.
is_breakpoint_gutter_enabled ::
                               (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_breakpoint_gutter_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_breakpoint_gutter_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_context_menu_enabled #-}

-- | If [code]true[/code], a right-click displays the context menu.
bindTextEdit_is_context_menu_enabled :: MethodBind
bindTextEdit_is_context_menu_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_context_menu_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right-click displays the context menu.
is_context_menu_enabled ::
                          (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_context_menu_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_context_menu_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_drawing_fold_gutter #-}

-- | If [code]true[/code], the fold gutter is visible. This enables folding groups of indented lines.
bindTextEdit_is_drawing_fold_gutter :: MethodBind
bindTextEdit_is_drawing_fold_gutter
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_drawing_fold_gutter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the fold gutter is visible. This enables folding groups of indented lines.
is_drawing_fold_gutter ::
                         (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_drawing_fold_gutter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_drawing_fold_gutter
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_drawing_minimap #-}

-- | If [code]true[/code], a minimap is shown, providing an outline of your source code.
bindTextEdit_is_drawing_minimap :: MethodBind
bindTextEdit_is_drawing_minimap
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_drawing_minimap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a minimap is shown, providing an outline of your source code.
is_drawing_minimap ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_drawing_minimap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_drawing_minimap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_drawing_spaces #-}

-- | If [code]true[/code], the "space" character will have a visible representation.
bindTextEdit_is_drawing_spaces :: MethodBind
bindTextEdit_is_drawing_spaces
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_drawing_spaces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the "space" character will have a visible representation.
is_drawing_spaces ::
                    (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_drawing_spaces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_drawing_spaces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_drawing_tabs #-}

-- | If [code]true[/code], the "tab" character will have a visible representation.
bindTextEdit_is_drawing_tabs :: MethodBind
bindTextEdit_is_drawing_tabs
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_drawing_tabs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the "tab" character will have a visible representation.
is_drawing_tabs ::
                  (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_drawing_tabs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_drawing_tabs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_folded #-}

-- | Returns whether the line at the specified index is folded or not.
bindTextEdit_is_folded :: MethodBind
bindTextEdit_is_folded
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_folded" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the line at the specified index is folded or not.
is_folded ::
            (TextEdit :< cls, Object :< cls) => cls -> Int -> IO Bool
is_folded cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_folded (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_hiding_enabled #-}

-- | If [code]true[/code], all lines that have been set to hidden by [method set_line_as_hidden], will not be visible.
bindTextEdit_is_hiding_enabled :: MethodBind
bindTextEdit_is_hiding_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_hiding_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], all lines that have been set to hidden by [method set_line_as_hidden], will not be visible.
is_hiding_enabled ::
                    (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_hiding_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_hiding_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_highlight_all_occurrences_enabled #-}

-- | If [code]true[/code], all occurrences of the selected text will be highlighted.
bindTextEdit_is_highlight_all_occurrences_enabled :: MethodBind
bindTextEdit_is_highlight_all_occurrences_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_highlight_all_occurrences_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], all occurrences of the selected text will be highlighted.
is_highlight_all_occurrences_enabled ::
                                       (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_highlight_all_occurrences_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTextEdit_is_highlight_all_occurrences_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_highlight_current_line_enabled #-}

-- | If [code]true[/code], the line containing the cursor is highlighted.
bindTextEdit_is_highlight_current_line_enabled :: MethodBind
bindTextEdit_is_highlight_current_line_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_highlight_current_line_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the line containing the cursor is highlighted.
is_highlight_current_line_enabled ::
                                    (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_highlight_current_line_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTextEdit_is_highlight_current_line_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_line_hidden #-}

-- | Returns whether the line at the specified index is hidden or not.
bindTextEdit_is_line_hidden :: MethodBind
bindTextEdit_is_line_hidden
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_line_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the line at the specified index is hidden or not.
is_line_hidden ::
                 (TextEdit :< cls, Object :< cls) => cls -> Int -> IO Bool
is_line_hidden cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_line_hidden (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_overriding_selected_font_color #-}

-- | If [code]true[/code], custom [code]font_color_selected[/code] will be used for selected text.
bindTextEdit_is_overriding_selected_font_color :: MethodBind
bindTextEdit_is_overriding_selected_font_color
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_overriding_selected_font_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], custom [code]font_color_selected[/code] will be used for selected text.
is_overriding_selected_font_color ::
                                    (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_overriding_selected_font_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTextEdit_is_overriding_selected_font_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_readonly #-}

-- | If [code]true[/code], read-only mode is enabled. Existing text cannot be modified and new text cannot be added.
bindTextEdit_is_readonly :: MethodBind
bindTextEdit_is_readonly
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_readonly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], read-only mode is enabled. Existing text cannot be modified and new text cannot be added.
is_readonly :: (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_readonly cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_readonly (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_right_click_moving_caret #-}

-- | If [code]true[/code], a right-click moves the cursor at the mouse position before displaying the context menu.
--   			If [code]false[/code], the context menu disregards mouse location.
bindTextEdit_is_right_click_moving_caret :: MethodBind
bindTextEdit_is_right_click_moving_caret
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_right_click_moving_caret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right-click moves the cursor at the mouse position before displaying the context menu.
--   			If [code]false[/code], the context menu disregards mouse location.
is_right_click_moving_caret ::
                              (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_right_click_moving_caret cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_right_click_moving_caret
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_selecting_enabled #-}

-- | If [code]true[/code], text can be selected.
--   			If [code]false[/code], text can not be selected by the user or by the [method select] or [method select_all] methods.
bindTextEdit_is_selecting_enabled :: MethodBind
bindTextEdit_is_selecting_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_selecting_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], text can be selected.
--   			If [code]false[/code], text can not be selected by the user or by the [method select] or [method select_all] methods.
is_selecting_enabled ::
                       (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_selecting_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_selecting_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_selection_active #-}

-- | Returns [code]true[/code] if the selection is active.
bindTextEdit_is_selection_active :: MethodBind
bindTextEdit_is_selection_active
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_selection_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the selection is active.
is_selection_active ::
                      (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_selection_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_selection_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_shortcut_keys_enabled #-}

-- | If [code]true[/code], shortcut keys for context menu items are enabled, even if the context menu is disabled.
bindTextEdit_is_shortcut_keys_enabled :: MethodBind
bindTextEdit_is_shortcut_keys_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_shortcut_keys_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], shortcut keys for context menu items are enabled, even if the context menu is disabled.
is_shortcut_keys_enabled ::
                           (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_shortcut_keys_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_shortcut_keys_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_show_line_numbers_enabled #-}

-- | If [code]true[/code], line numbers are displayed to the left of the text.
bindTextEdit_is_show_line_numbers_enabled :: MethodBind
bindTextEdit_is_show_line_numbers_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_show_line_numbers_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], line numbers are displayed to the left of the text.
is_show_line_numbers_enabled ::
                               (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_show_line_numbers_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_show_line_numbers_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_smooth_scroll_enabled #-}

-- | If [code]true[/code], sets the [code]step[/code] of the scrollbars to [code]0.25[/code] which results in smoother scrolling.
bindTextEdit_is_smooth_scroll_enabled :: MethodBind
bindTextEdit_is_smooth_scroll_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_smooth_scroll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], sets the [code]step[/code] of the scrollbars to [code]0.25[/code] which results in smoother scrolling.
is_smooth_scroll_enabled ::
                           (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_smooth_scroll_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_smooth_scroll_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_syntax_coloring_enabled #-}

-- | If [code]true[/code], any custom color properties that have been set for this [TextEdit] will be visible.
bindTextEdit_is_syntax_coloring_enabled :: MethodBind
bindTextEdit_is_syntax_coloring_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_syntax_coloring_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], any custom color properties that have been set for this [TextEdit] will be visible.
is_syntax_coloring_enabled ::
                             (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_syntax_coloring_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_syntax_coloring_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_is_wrap_enabled #-}

-- | If [code]true[/code], enables text wrapping when it goes beyond the edge of what is visible.
bindTextEdit_is_wrap_enabled :: MethodBind
bindTextEdit_is_wrap_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "is_wrap_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables text wrapping when it goes beyond the edge of what is visible.
is_wrap_enabled ::
                  (TextEdit :< cls, Object :< cls) => cls -> IO Bool
is_wrap_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_is_wrap_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_menu_option #-}

-- | Triggers a right-click menu action by the specified index. See [enum MenuItems] for a list of available indexes.
bindTextEdit_menu_option :: MethodBind
bindTextEdit_menu_option
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "menu_option" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Triggers a right-click menu action by the specified index. See [enum MenuItems] for a list of available indexes.
menu_option ::
              (TextEdit :< cls, Object :< cls) => cls -> Int -> IO ()
menu_option cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_menu_option (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_paste #-}

-- | Paste the current selection.
bindTextEdit_paste :: MethodBind
bindTextEdit_paste
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "paste" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Paste the current selection.
paste :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
paste cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_paste (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_redo #-}

-- | Perform redo operation.
bindTextEdit_redo :: MethodBind
bindTextEdit_redo
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "redo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Perform redo operation.
redo :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
redo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_redo (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_remove_breakpoints #-}

-- | Removes all the breakpoints. This will not fire the [signal breakpoint_toggled] signal.
bindTextEdit_remove_breakpoints :: MethodBind
bindTextEdit_remove_breakpoints
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "remove_breakpoints" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all the breakpoints. This will not fire the [signal breakpoint_toggled] signal.
remove_breakpoints ::
                     (TextEdit :< cls, Object :< cls) => cls -> IO ()
remove_breakpoints cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_remove_breakpoints (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_search #-}

-- | Perform a search inside the text. Search flags can be specified in the [enum SearchFlags] enum.
--   				Returns an empty [code]PoolIntArray[/code] if no result was found. Otherwise, the result line and column can be accessed at indices specified in the [enum SearchResult] enum, e.g:
--   				[codeblock]
--   				var result = search(key, flags, line, column)
--   				if result.size() > 0:
--   				    # Result found.
--   				    var res_line = result[TextEdit.SEARCH_RESULT_LINE]
--   				    var res_column = result[TextEdit.SEARCH_RESULT_COLUMN]
--   				[/codeblock]
bindTextEdit_search :: MethodBind
bindTextEdit_search
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "search" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Perform a search inside the text. Search flags can be specified in the [enum SearchFlags] enum.
--   				Returns an empty [code]PoolIntArray[/code] if no result was found. Otherwise, the result line and column can be accessed at indices specified in the [enum SearchResult] enum, e.g:
--   				[codeblock]
--   				var result = search(key, flags, line, column)
--   				if result.size() > 0:
--   				    # Result found.
--   				    var res_line = result[TextEdit.SEARCH_RESULT_LINE]
--   				    var res_column = result[TextEdit.SEARCH_RESULT_COLUMN]
--   				[/codeblock]
search ::
         (TextEdit :< cls, Object :< cls) =>
         cls -> GodotString -> Int -> Int -> Int -> IO PoolIntArray
search cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_search (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_select #-}

-- | Perform selection, from line/column to line/column.
--   				If [member selecting_enabled] is [code]false[/code], no selection will occur.
bindTextEdit_select :: MethodBind
bindTextEdit_select
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "select" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Perform selection, from line/column to line/column.
--   				If [member selecting_enabled] is [code]false[/code], no selection will occur.
select ::
         (TextEdit :< cls, Object :< cls) =>
         cls -> Int -> Int -> Int -> Int -> IO ()
select cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_select (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_select_all #-}

-- | Select all the text.
--   				If [member selecting_enabled] is [code]false[/code], no selection will occur.
bindTextEdit_select_all :: MethodBind
bindTextEdit_select_all
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "select_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select all the text.
--   				If [member selecting_enabled] is [code]false[/code], no selection will occur.
select_all :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
select_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_select_all (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_breakpoint_gutter_enabled #-}

-- | If [code]true[/code], the breakpoint gutter is visible.
bindTextEdit_set_breakpoint_gutter_enabled :: MethodBind
bindTextEdit_set_breakpoint_gutter_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_breakpoint_gutter_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the breakpoint gutter is visible.
set_breakpoint_gutter_enabled ::
                                (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_breakpoint_gutter_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_breakpoint_gutter_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_context_menu_enabled #-}

-- | If [code]true[/code], a right-click displays the context menu.
bindTextEdit_set_context_menu_enabled :: MethodBind
bindTextEdit_set_context_menu_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_context_menu_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right-click displays the context menu.
set_context_menu_enabled ::
                           (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_context_menu_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_context_menu_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_draw_fold_gutter #-}

-- | If [code]true[/code], the fold gutter is visible. This enables folding groups of indented lines.
bindTextEdit_set_draw_fold_gutter :: MethodBind
bindTextEdit_set_draw_fold_gutter
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_draw_fold_gutter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the fold gutter is visible. This enables folding groups of indented lines.
set_draw_fold_gutter ::
                       (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_fold_gutter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_draw_fold_gutter
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_draw_spaces #-}

-- | If [code]true[/code], the "space" character will have a visible representation.
bindTextEdit_set_draw_spaces :: MethodBind
bindTextEdit_set_draw_spaces
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_draw_spaces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the "space" character will have a visible representation.
set_draw_spaces ::
                  (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_spaces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_draw_spaces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_draw_tabs #-}

-- | If [code]true[/code], the "tab" character will have a visible representation.
bindTextEdit_set_draw_tabs :: MethodBind
bindTextEdit_set_draw_tabs
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_draw_tabs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the "tab" character will have a visible representation.
set_draw_tabs ::
                (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_tabs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_draw_tabs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_h_scroll #-}

-- | The current horizontal scroll value.
bindTextEdit_set_h_scroll :: MethodBind
bindTextEdit_set_h_scroll
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_h_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current horizontal scroll value.
set_h_scroll ::
               (TextEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_h_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_h_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_hiding_enabled #-}

-- | If [code]true[/code], all lines that have been set to hidden by [method set_line_as_hidden], will not be visible.
bindTextEdit_set_hiding_enabled :: MethodBind
bindTextEdit_set_hiding_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_hiding_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], all lines that have been set to hidden by [method set_line_as_hidden], will not be visible.
set_hiding_enabled ::
                     (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hiding_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_hiding_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_highlight_all_occurrences #-}

-- | If [code]true[/code], all occurrences of the selected text will be highlighted.
bindTextEdit_set_highlight_all_occurrences :: MethodBind
bindTextEdit_set_highlight_all_occurrences
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_highlight_all_occurrences" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], all occurrences of the selected text will be highlighted.
set_highlight_all_occurrences ::
                                (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_highlight_all_occurrences cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_highlight_all_occurrences
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_highlight_current_line #-}

-- | If [code]true[/code], the line containing the cursor is highlighted.
bindTextEdit_set_highlight_current_line :: MethodBind
bindTextEdit_set_highlight_current_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_highlight_current_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the line containing the cursor is highlighted.
set_highlight_current_line ::
                             (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_highlight_current_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_highlight_current_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_line_as_hidden #-}

-- | If [code]true[/code], hides the line of the specified index.
bindTextEdit_set_line_as_hidden :: MethodBind
bindTextEdit_set_line_as_hidden
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_line_as_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], hides the line of the specified index.
set_line_as_hidden ::
                     (TextEdit :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_line_as_hidden cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_line_as_hidden (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_minimap_width #-}

-- | The width, in pixels, of the minimap.
bindTextEdit_set_minimap_width :: MethodBind
bindTextEdit_set_minimap_width
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_minimap_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width, in pixels, of the minimap.
set_minimap_width ::
                    (TextEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_minimap_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_minimap_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_override_selected_font_color #-}

-- | If [code]true[/code], custom [code]font_color_selected[/code] will be used for selected text.
bindTextEdit_set_override_selected_font_color :: MethodBind
bindTextEdit_set_override_selected_font_color
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_override_selected_font_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], custom [code]font_color_selected[/code] will be used for selected text.
set_override_selected_font_color ::
                                   (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_override_selected_font_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindTextEdit_set_override_selected_font_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_readonly #-}

-- | If [code]true[/code], read-only mode is enabled. Existing text cannot be modified and new text cannot be added.
bindTextEdit_set_readonly :: MethodBind
bindTextEdit_set_readonly
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_readonly" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], read-only mode is enabled. Existing text cannot be modified and new text cannot be added.
set_readonly ::
               (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_readonly cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_readonly (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_right_click_moves_caret #-}

-- | If [code]true[/code], a right-click moves the cursor at the mouse position before displaying the context menu.
--   			If [code]false[/code], the context menu disregards mouse location.
bindTextEdit_set_right_click_moves_caret :: MethodBind
bindTextEdit_set_right_click_moves_caret
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_right_click_moves_caret" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a right-click moves the cursor at the mouse position before displaying the context menu.
--   			If [code]false[/code], the context menu disregards mouse location.
set_right_click_moves_caret ::
                              (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_right_click_moves_caret cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_right_click_moves_caret
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_selecting_enabled #-}

-- | If [code]true[/code], text can be selected.
--   			If [code]false[/code], text can not be selected by the user or by the [method select] or [method select_all] methods.
bindTextEdit_set_selecting_enabled :: MethodBind
bindTextEdit_set_selecting_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_selecting_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], text can be selected.
--   			If [code]false[/code], text can not be selected by the user or by the [method select] or [method select_all] methods.
set_selecting_enabled ::
                        (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_selecting_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_selecting_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_shortcut_keys_enabled #-}

-- | If [code]true[/code], shortcut keys for context menu items are enabled, even if the context menu is disabled.
bindTextEdit_set_shortcut_keys_enabled :: MethodBind
bindTextEdit_set_shortcut_keys_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_shortcut_keys_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], shortcut keys for context menu items are enabled, even if the context menu is disabled.
set_shortcut_keys_enabled ::
                            (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shortcut_keys_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_shortcut_keys_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_show_line_numbers #-}

-- | If [code]true[/code], line numbers are displayed to the left of the text.
bindTextEdit_set_show_line_numbers :: MethodBind
bindTextEdit_set_show_line_numbers
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_show_line_numbers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], line numbers are displayed to the left of the text.
set_show_line_numbers ::
                        (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_show_line_numbers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_show_line_numbers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_smooth_scroll_enable #-}

-- | If [code]true[/code], sets the [code]step[/code] of the scrollbars to [code]0.25[/code] which results in smoother scrolling.
bindTextEdit_set_smooth_scroll_enable :: MethodBind
bindTextEdit_set_smooth_scroll_enable
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_smooth_scroll_enable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], sets the [code]step[/code] of the scrollbars to [code]0.25[/code] which results in smoother scrolling.
set_smooth_scroll_enable ::
                           (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_smooth_scroll_enable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_smooth_scroll_enable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_syntax_coloring #-}

-- | If [code]true[/code], any custom color properties that have been set for this [TextEdit] will be visible.
bindTextEdit_set_syntax_coloring :: MethodBind
bindTextEdit_set_syntax_coloring
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_syntax_coloring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], any custom color properties that have been set for this [TextEdit] will be visible.
set_syntax_coloring ::
                      (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_syntax_coloring cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_syntax_coloring
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_text #-}

-- | String value of the [TextEdit].
bindTextEdit_set_text :: MethodBind
bindTextEdit_set_text
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | String value of the [TextEdit].
set_text ::
           (TextEdit :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_v_scroll #-}

-- | The current vertical scroll value.
bindTextEdit_set_v_scroll :: MethodBind
bindTextEdit_set_v_scroll
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current vertical scroll value.
set_v_scroll ::
               (TextEdit :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_v_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_v_scroll_speed #-}

-- | Vertical scroll sensitivity.
bindTextEdit_set_v_scroll_speed :: MethodBind
bindTextEdit_set_v_scroll_speed
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_v_scroll_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Vertical scroll sensitivity.
set_v_scroll_speed ::
                     (TextEdit :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_scroll_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_v_scroll_speed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_set_wrap_enabled #-}

-- | If [code]true[/code], enables text wrapping when it goes beyond the edge of what is visible.
bindTextEdit_set_wrap_enabled :: MethodBind
bindTextEdit_set_wrap_enabled
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "set_wrap_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables text wrapping when it goes beyond the edge of what is visible.
set_wrap_enabled ::
                   (TextEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_wrap_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_set_wrap_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_toggle_fold_line #-}

-- | Toggle the folding of the code block at the given line.
bindTextEdit_toggle_fold_line :: MethodBind
bindTextEdit_toggle_fold_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "toggle_fold_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Toggle the folding of the code block at the given line.
toggle_fold_line ::
                   (TextEdit :< cls, Object :< cls) => cls -> Int -> IO ()
toggle_fold_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_toggle_fold_line (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_undo #-}

-- | Perform undo operation.
bindTextEdit_undo :: MethodBind
bindTextEdit_undo
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "undo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Perform undo operation.
undo :: (TextEdit :< cls, Object :< cls) => cls -> IO ()
undo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_undo (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_unfold_line #-}

-- | Unfolds the given line, if folded.
bindTextEdit_unfold_line :: MethodBind
bindTextEdit_unfold_line
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "unfold_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unfolds the given line, if folded.
unfold_line ::
              (TextEdit :< cls, Object :< cls) => cls -> Int -> IO ()
unfold_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_unfold_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextEdit_unhide_all_lines #-}

-- | Unhide all lines that were previously set to hidden by [method set_line_as_hidden].
bindTextEdit_unhide_all_lines :: MethodBind
bindTextEdit_unhide_all_lines
  = unsafePerformIO $
      withCString "TextEdit" $
        \ clsNamePtr ->
          withCString "unhide_all_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unhide all lines that were previously set to hidden by [method set_line_as_hidden].
unhide_all_lines ::
                   (TextEdit :< cls, Object :< cls) => cls -> IO ()
unhide_all_lines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextEdit_unhide_all_lines (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)