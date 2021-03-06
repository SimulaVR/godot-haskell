{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Container()

-- | Emitted when scrolling stops.
sig_scroll_ended :: Godot.Internal.Dispatch.Signal ScrollContainer
sig_scroll_ended = Godot.Internal.Dispatch.Signal "scroll_ended"

instance NodeSignal ScrollContainer "scroll_ended" '[]

-- | Emitted when scrolling is started.
sig_scroll_started ::
                   Godot.Internal.Dispatch.Signal ScrollContainer
sig_scroll_started
  = Godot.Internal.Dispatch.Signal "scroll_started"

instance NodeSignal ScrollContainer "scroll_started" '[]

instance NodeProperty ScrollContainer "follow_focus" Bool 'False
         where
        nodeProperty
          = (is_following_focus, wrapDroppingSetter set_follow_focus,
             Nothing)

instance NodeProperty ScrollContainer "scroll_deadzone" Int 'False
         where
        nodeProperty
          = (get_deadzone, wrapDroppingSetter set_deadzone, Nothing)

instance NodeProperty ScrollContainer "scroll_horizontal" Int
           'False
         where
        nodeProperty
          = (get_h_scroll, wrapDroppingSetter set_h_scroll, Nothing)

instance NodeProperty ScrollContainer "scroll_horizontal_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_h_scroll_enabled, wrapDroppingSetter set_enable_h_scroll,
             Nothing)

instance NodeProperty ScrollContainer "scroll_vertical" Int 'False
         where
        nodeProperty
          = (get_v_scroll, wrapDroppingSetter set_v_scroll, Nothing)

instance NodeProperty ScrollContainer "scroll_vertical_enabled"
           Bool
           'False
         where
        nodeProperty
          = (is_v_scroll_enabled, wrapDroppingSetter set_enable_v_scroll,
             Nothing)

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

instance NodeMethod ScrollContainer "_ensure_focused_visible"
           '[Control]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer._ensure_focused_visible

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

instance NodeMethod ScrollContainer "_gui_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer._gui_input

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

instance NodeMethod ScrollContainer "_scroll_moved" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer._scroll_moved

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

instance NodeMethod ScrollContainer "_update_scrollbar_position"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer._update_scrollbar_position

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

instance NodeMethod ScrollContainer "get_deadzone" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ScrollContainer.get_deadzone

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

instance NodeMethod ScrollContainer "get_h_scroll" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ScrollContainer.get_h_scroll

{-# NOINLINE bindScrollContainer_get_h_scrollbar #-}

-- | Returns the horizontal scrollbar @HScrollBar@ of this @ScrollContainer@.
bindScrollContainer_get_h_scrollbar :: MethodBind
bindScrollContainer_get_h_scrollbar
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_h_scrollbar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the horizontal scrollbar @HScrollBar@ of this @ScrollContainer@.
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

instance NodeMethod ScrollContainer "get_h_scrollbar" '[]
           (IO HScrollBar)
         where
        nodeMethod = Godot.Core.ScrollContainer.get_h_scrollbar

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

instance NodeMethod ScrollContainer "get_v_scroll" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ScrollContainer.get_v_scroll

{-# NOINLINE bindScrollContainer_get_v_scrollbar #-}

-- | Returns the vertical scrollbar @VScrollBar@ of this @ScrollContainer@.
bindScrollContainer_get_v_scrollbar :: MethodBind
bindScrollContainer_get_v_scrollbar
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "get_v_scrollbar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the vertical scrollbar @VScrollBar@ of this @ScrollContainer@.
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

instance NodeMethod ScrollContainer "get_v_scrollbar" '[]
           (IO VScrollBar)
         where
        nodeMethod = Godot.Core.ScrollContainer.get_v_scrollbar

{-# NOINLINE bindScrollContainer_is_following_focus #-}

-- | If @true@, the ScrollContainer will automatically scroll to focused children (including indirect children) to make sure they are fully visible.
bindScrollContainer_is_following_focus :: MethodBind
bindScrollContainer_is_following_focus
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "is_following_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the ScrollContainer will automatically scroll to focused children (including indirect children) to make sure they are fully visible.
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

instance NodeMethod ScrollContainer "is_following_focus" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ScrollContainer.is_following_focus

{-# NOINLINE bindScrollContainer_is_h_scroll_enabled #-}

-- | If @true@, enables horizontal scrolling.
bindScrollContainer_is_h_scroll_enabled :: MethodBind
bindScrollContainer_is_h_scroll_enabled
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "is_h_scroll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables horizontal scrolling.
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

instance NodeMethod ScrollContainer "is_h_scroll_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ScrollContainer.is_h_scroll_enabled

{-# NOINLINE bindScrollContainer_is_v_scroll_enabled #-}

-- | If @true@, enables vertical scrolling.
bindScrollContainer_is_v_scroll_enabled :: MethodBind
bindScrollContainer_is_v_scroll_enabled
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "is_v_scroll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables vertical scrolling.
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

instance NodeMethod ScrollContainer "is_v_scroll_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ScrollContainer.is_v_scroll_enabled

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

instance NodeMethod ScrollContainer "set_deadzone" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer.set_deadzone

{-# NOINLINE bindScrollContainer_set_enable_h_scroll #-}

-- | If @true@, enables horizontal scrolling.
bindScrollContainer_set_enable_h_scroll :: MethodBind
bindScrollContainer_set_enable_h_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_enable_h_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables horizontal scrolling.
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

instance NodeMethod ScrollContainer "set_enable_h_scroll" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer.set_enable_h_scroll

{-# NOINLINE bindScrollContainer_set_enable_v_scroll #-}

-- | If @true@, enables vertical scrolling.
bindScrollContainer_set_enable_v_scroll :: MethodBind
bindScrollContainer_set_enable_v_scroll
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_enable_v_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables vertical scrolling.
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

instance NodeMethod ScrollContainer "set_enable_v_scroll" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer.set_enable_v_scroll

{-# NOINLINE bindScrollContainer_set_follow_focus #-}

-- | If @true@, the ScrollContainer will automatically scroll to focused children (including indirect children) to make sure they are fully visible.
bindScrollContainer_set_follow_focus :: MethodBind
bindScrollContainer_set_follow_focus
  = unsafePerformIO $
      withCString "ScrollContainer" $
        \ clsNamePtr ->
          withCString "set_follow_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the ScrollContainer will automatically scroll to focused children (including indirect children) to make sure they are fully visible.
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

instance NodeMethod ScrollContainer "set_follow_focus" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer.set_follow_focus

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

instance NodeMethod ScrollContainer "set_h_scroll" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer.set_h_scroll

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

instance NodeMethod ScrollContainer "set_v_scroll" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.ScrollContainer.set_v_scroll