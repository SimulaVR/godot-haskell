{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ScrollContainer
       (Godot.Core.ScrollContainer.sig_scroll_ended,
        Godot.Core.ScrollContainer.sig_scroll_started,
        Godot.Core.ScrollContainer._ensure_focused_visible,
        Godot.Core.ScrollContainer._gui_input,
        Godot.Core.ScrollContainer._scroll_moved,
        Godot.Core.ScrollContainer._update_scrollbar_position,
        Godot.Core.ScrollContainer.get_deadzone,
        Godot.Core.ScrollContainer.get_h_scroll,
        Godot.Core.ScrollContainer.get_h_scrollbar,
        Godot.Core.ScrollContainer.get_v_scroll,
        Godot.Core.ScrollContainer.get_v_scrollbar,
        Godot.Core.ScrollContainer.is_following_focus,
        Godot.Core.ScrollContainer.is_h_scroll_enabled,
        Godot.Core.ScrollContainer.is_v_scroll_enabled,
        Godot.Core.ScrollContainer.set_deadzone,
        Godot.Core.ScrollContainer.set_enable_h_scroll,
        Godot.Core.ScrollContainer.set_enable_v_scroll,
        Godot.Core.ScrollContainer.set_follow_focus,
        Godot.Core.ScrollContainer.set_h_scroll,
        Godot.Core.ScrollContainer.set_v_scroll)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted whenever scrolling stops.
sig_scroll_ended :: Godot.Internal.Dispatch.Signal ScrollContainer
sig_scroll_ended = Godot.Internal.Dispatch.Signal "scroll_ended"

-- | Emitted whenever scrolling is started.
sig_scroll_started ::
                   Godot.Internal.Dispatch.Signal ScrollContainer
sig_scroll_started
  = Godot.Internal.Dispatch.Signal "scroll_started"

{-# NOINLINE bindScrollContainer__ensure_focused_visible #-}

bindScrollContainer__ensure_focused_visible :: MethodBind
bindScrollContainer__ensure_focused_visible
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "_ensure_focused_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_ensure_focused_visible ::
                          (ScrollContainer :< cls, Object :< cls) => cls -> Control -> IO ()
_ensure_focused_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer__ensure_focused_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer__gui_input #-}

bindScrollContainer__gui_input :: MethodBind
bindScrollContainer__gui_input
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (ScrollContainer :< cls, Object :< cls) =>
             cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer__scroll_moved #-}

bindScrollContainer__scroll_moved :: MethodBind
bindScrollContainer__scroll_moved
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "_scroll_moved" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_scroll_moved ::
                (ScrollContainer :< cls, Object :< cls) => cls -> Float -> IO ()
_scroll_moved cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer__scroll_moved
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer__update_scrollbar_position #-}

bindScrollContainer__update_scrollbar_position :: MethodBind
bindScrollContainer__update_scrollbar_position
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "_update_scrollbar_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_scrollbar_position ::
                             (ScrollContainer :< cls, Object :< cls) => cls -> IO ()
_update_scrollbar_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindScrollContainer__update_scrollbar_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_get_deadzone #-}

bindScrollContainer_get_deadzone :: MethodBind
bindScrollContainer_get_deadzone
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_deadzone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_deadzone ::
               (ScrollContainer :< cls, Object :< cls) => cls -> IO Int
get_deadzone cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_get_deadzone
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_get_h_scroll #-}

-- | The current horizontal scroll value.
bindScrollContainer_get_h_scroll :: MethodBind
bindScrollContainer_get_h_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_h_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current horizontal scroll value.
get_h_scroll ::
               (ScrollContainer :< cls, Object :< cls) => cls -> IO Int
get_h_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_get_h_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_get_h_scrollbar #-}

bindScrollContainer_get_h_scrollbar :: MethodBind
bindScrollContainer_get_h_scrollbar
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_h_scrollbar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_h_scrollbar ::
                  (ScrollContainer :< cls, Object :< cls) => cls -> IO HScrollBar
get_h_scrollbar cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_get_h_scrollbar
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_get_v_scroll #-}

-- | The current vertical scroll value.
bindScrollContainer_get_v_scroll :: MethodBind
bindScrollContainer_get_v_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current vertical scroll value.
get_v_scroll ::
               (ScrollContainer :< cls, Object :< cls) => cls -> IO Int
get_v_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_get_v_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_get_v_scrollbar #-}

bindScrollContainer_get_v_scrollbar :: MethodBind
bindScrollContainer_get_v_scrollbar
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_v_scrollbar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_v_scrollbar ::
                  (ScrollContainer :< cls, Object :< cls) => cls -> IO VScrollBar
get_v_scrollbar cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_get_v_scrollbar
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_is_following_focus #-}

bindScrollContainer_is_following_focus :: MethodBind
bindScrollContainer_is_following_focus
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "is_following_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_following_focus ::
                     (ScrollContainer :< cls, Object :< cls) => cls -> IO Bool
is_following_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_is_following_focus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_is_h_scroll_enabled #-}

-- | If [code]true[/code], enables horizontal scrolling.
bindScrollContainer_is_h_scroll_enabled :: MethodBind
bindScrollContainer_is_h_scroll_enabled
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "is_h_scroll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables horizontal scrolling.
is_h_scroll_enabled ::
                      (ScrollContainer :< cls, Object :< cls) => cls -> IO Bool
is_h_scroll_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_is_h_scroll_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_is_v_scroll_enabled #-}

-- | If [code]true[/code], enables vertical scrolling.
bindScrollContainer_is_v_scroll_enabled :: MethodBind
bindScrollContainer_is_v_scroll_enabled
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "is_v_scroll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables vertical scrolling.
is_v_scroll_enabled ::
                      (ScrollContainer :< cls, Object :< cls) => cls -> IO Bool
is_v_scroll_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_is_v_scroll_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_set_deadzone #-}

bindScrollContainer_set_deadzone :: MethodBind
bindScrollContainer_set_deadzone
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_deadzone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_deadzone ::
               (ScrollContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_deadzone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_set_deadzone
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_set_enable_h_scroll #-}

-- | If [code]true[/code], enables horizontal scrolling.
bindScrollContainer_set_enable_h_scroll :: MethodBind
bindScrollContainer_set_enable_h_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_enable_h_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables horizontal scrolling.
set_enable_h_scroll ::
                      (ScrollContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enable_h_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_set_enable_h_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_set_enable_v_scroll #-}

-- | If [code]true[/code], enables vertical scrolling.
bindScrollContainer_set_enable_v_scroll :: MethodBind
bindScrollContainer_set_enable_v_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_enable_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables vertical scrolling.
set_enable_v_scroll ::
                      (ScrollContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enable_v_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_set_enable_v_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_set_follow_focus #-}

bindScrollContainer_set_follow_focus :: MethodBind
bindScrollContainer_set_follow_focus
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_follow_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_follow_focus ::
                   (ScrollContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_follow_focus cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_set_follow_focus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_set_h_scroll #-}

-- | The current horizontal scroll value.
bindScrollContainer_set_h_scroll :: MethodBind
bindScrollContainer_set_h_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_h_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current horizontal scroll value.
set_h_scroll ::
               (ScrollContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_h_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_set_h_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScrollContainer_set_v_scroll #-}

-- | The current vertical scroll value.
bindScrollContainer_set_v_scroll :: MethodBind
bindScrollContainer_set_v_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current vertical scroll value.
set_v_scroll ::
               (ScrollContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_v_scroll cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollContainer_set_v_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)