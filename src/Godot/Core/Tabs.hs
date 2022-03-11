{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Tabs
       (Godot.Core.Tabs._ALIGN_RIGHT,
        Godot.Core.Tabs._CLOSE_BUTTON_SHOW_ACTIVE_ONLY,
        Godot.Core.Tabs._ALIGN_MAX, Godot.Core.Tabs._CLOSE_BUTTON_MAX,
        Godot.Core.Tabs._CLOSE_BUTTON_SHOW_ALWAYS,
        Godot.Core.Tabs._CLOSE_BUTTON_SHOW_NEVER,
        Godot.Core.Tabs._ALIGN_LEFT, Godot.Core.Tabs._ALIGN_CENTER,
        Godot.Core.Tabs.sig_reposition_active_tab_request,
        Godot.Core.Tabs.sig_right_button_pressed,
        Godot.Core.Tabs.sig_tab_changed, Godot.Core.Tabs.sig_tab_clicked,
        Godot.Core.Tabs.sig_tab_close, Godot.Core.Tabs.sig_tab_hover,
        Godot.Core.Tabs._gui_input, Godot.Core.Tabs._on_mouse_exited,
        Godot.Core.Tabs._update_hover, Godot.Core.Tabs.add_tab,
        Godot.Core.Tabs.ensure_tab_visible,
        Godot.Core.Tabs.get_current_tab,
        Godot.Core.Tabs.get_drag_to_rearrange_enabled,
        Godot.Core.Tabs.get_offset_buttons_visible,
        Godot.Core.Tabs.get_scrolling_enabled,
        Godot.Core.Tabs.get_select_with_rmb, Godot.Core.Tabs.get_tab_align,
        Godot.Core.Tabs.get_tab_close_display_policy,
        Godot.Core.Tabs.get_tab_count, Godot.Core.Tabs.get_tab_disabled,
        Godot.Core.Tabs.get_tab_icon, Godot.Core.Tabs.get_tab_offset,
        Godot.Core.Tabs.get_tab_rect, Godot.Core.Tabs.get_tab_title,
        Godot.Core.Tabs.get_tabs_rearrange_group, Godot.Core.Tabs.move_tab,
        Godot.Core.Tabs.remove_tab, Godot.Core.Tabs.set_current_tab,
        Godot.Core.Tabs.set_drag_to_rearrange_enabled,
        Godot.Core.Tabs.set_scrolling_enabled,
        Godot.Core.Tabs.set_select_with_rmb, Godot.Core.Tabs.set_tab_align,
        Godot.Core.Tabs.set_tab_close_display_policy,
        Godot.Core.Tabs.set_tab_disabled, Godot.Core.Tabs.set_tab_icon,
        Godot.Core.Tabs.set_tab_title,
        Godot.Core.Tabs.set_tabs_rearrange_group)
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

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_CLOSE_BUTTON_SHOW_ACTIVE_ONLY :: Int
_CLOSE_BUTTON_SHOW_ACTIVE_ONLY = 1

_ALIGN_MAX :: Int
_ALIGN_MAX = 3

_CLOSE_BUTTON_MAX :: Int
_CLOSE_BUTTON_MAX = 3

_CLOSE_BUTTON_SHOW_ALWAYS :: Int
_CLOSE_BUTTON_SHOW_ALWAYS = 2

_CLOSE_BUTTON_SHOW_NEVER :: Int
_CLOSE_BUTTON_SHOW_NEVER = 0

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

-- | Emitted when the active tab is rearranged via mouse drag. See @drag_to_rearrange_enabled@.
sig_reposition_active_tab_request ::
                                  Godot.Internal.Dispatch.Signal Tabs
sig_reposition_active_tab_request
  = Godot.Internal.Dispatch.Signal "reposition_active_tab_request"

instance NodeSignal Tabs "reposition_active_tab_request" '[Int]

-- | Emitted when a tab is right-clicked.
sig_right_button_pressed :: Godot.Internal.Dispatch.Signal Tabs
sig_right_button_pressed
  = Godot.Internal.Dispatch.Signal "right_button_pressed"

instance NodeSignal Tabs "right_button_pressed" '[Int]

-- | Emitted when switching to another tab.
sig_tab_changed :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_changed = Godot.Internal.Dispatch.Signal "tab_changed"

instance NodeSignal Tabs "tab_changed" '[Int]

-- | Emitted when a tab is clicked, even if it is the current tab.
sig_tab_clicked :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_clicked = Godot.Internal.Dispatch.Signal "tab_clicked"

instance NodeSignal Tabs "tab_clicked" '[Int]

-- | Emitted when a tab is closed.
sig_tab_close :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_close = Godot.Internal.Dispatch.Signal "tab_close"

instance NodeSignal Tabs "tab_close" '[Int]

-- | Emitted when a tab is hovered by the mouse.
sig_tab_hover :: Godot.Internal.Dispatch.Signal Tabs
sig_tab_hover = Godot.Internal.Dispatch.Signal "tab_hover"

instance NodeSignal Tabs "tab_hover" '[Int]

instance NodeProperty Tabs "current_tab" Int 'False where
        nodeProperty
          = (get_current_tab, wrapDroppingSetter set_current_tab, Nothing)

instance NodeProperty Tabs "drag_to_rearrange_enabled" Bool 'False
         where
        nodeProperty
          = (get_drag_to_rearrange_enabled,
             wrapDroppingSetter set_drag_to_rearrange_enabled, Nothing)

instance NodeProperty Tabs "scrolling_enabled" Bool 'False where
        nodeProperty
          = (get_scrolling_enabled, wrapDroppingSetter set_scrolling_enabled,
             Nothing)

instance NodeProperty Tabs "tab_align" Int 'False where
        nodeProperty
          = (get_tab_align, wrapDroppingSetter set_tab_align, Nothing)

instance NodeProperty Tabs "tab_close_display_policy" Int 'False
         where
        nodeProperty
          = (get_tab_close_display_policy,
             wrapDroppingSetter set_tab_close_display_policy, Nothing)

{-# NOINLINE bindTabs__gui_input #-}

bindTabs__gui_input :: MethodBind
bindTabs__gui_input
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (Tabs :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs__gui_input (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "_gui_input" '[InputEvent] (IO ()) where
        nodeMethod = Godot.Core.Tabs._gui_input

{-# NOINLINE bindTabs__on_mouse_exited #-}

bindTabs__on_mouse_exited :: MethodBind
bindTabs__on_mouse_exited
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "_on_mouse_exited" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_on_mouse_exited :: (Tabs :< cls, Object :< cls) => cls -> IO ()
_on_mouse_exited cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs__on_mouse_exited (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "_on_mouse_exited" '[] (IO ()) where
        nodeMethod = Godot.Core.Tabs._on_mouse_exited

{-# NOINLINE bindTabs__update_hover #-}

bindTabs__update_hover :: MethodBind
bindTabs__update_hover
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "_update_hover" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_hover :: (Tabs :< cls, Object :< cls) => cls -> IO ()
_update_hover cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs__update_hover (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "_update_hover" '[] (IO ()) where
        nodeMethod = Godot.Core.Tabs._update_hover

{-# NOINLINE bindTabs_add_tab #-}

-- | Adds a new tab.
bindTabs_add_tab :: MethodBind
bindTabs_add_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "add_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new tab.
add_tab ::
          (Tabs :< cls, Object :< cls) =>
          cls -> Maybe GodotString -> Maybe Texture -> IO ()
add_tab cls arg1 arg2
  = withVariantArray
      [defaultedVariant VariantString "" arg1,
       maybe VariantNil toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_add_tab (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "add_tab"
           '[Maybe GodotString, Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.Tabs.add_tab

{-# NOINLINE bindTabs_ensure_tab_visible #-}

-- | Moves the scroll view to make the tab visible.
bindTabs_ensure_tab_visible :: MethodBind
bindTabs_ensure_tab_visible
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "ensure_tab_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the scroll view to make the tab visible.
ensure_tab_visible ::
                     (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
ensure_tab_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_ensure_tab_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "ensure_tab_visible" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Tabs.ensure_tab_visible

{-# NOINLINE bindTabs_get_current_tab #-}

-- | Select tab at index @tab_idx@.
bindTabs_get_current_tab :: MethodBind
bindTabs_get_current_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select tab at index @tab_idx@.
get_current_tab :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_current_tab cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_current_tab (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_current_tab" '[] (IO Int) where
        nodeMethod = Godot.Core.Tabs.get_current_tab

{-# NOINLINE bindTabs_get_drag_to_rearrange_enabled #-}

-- | If @true@, tabs can be rearranged with mouse drag.
bindTabs_get_drag_to_rearrange_enabled :: MethodBind
bindTabs_get_drag_to_rearrange_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_drag_to_rearrange_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, tabs can be rearranged with mouse drag.
get_drag_to_rearrange_enabled ::
                                (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_drag_to_rearrange_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_drag_to_rearrange_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_drag_to_rearrange_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Tabs.get_drag_to_rearrange_enabled

{-# NOINLINE bindTabs_get_offset_buttons_visible #-}

-- | Returns @true@ if the offset buttons (the ones that appear when there's not enough space for all tabs) are visible.
bindTabs_get_offset_buttons_visible :: MethodBind
bindTabs_get_offset_buttons_visible
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_offset_buttons_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the offset buttons (the ones that appear when there's not enough space for all tabs) are visible.
get_offset_buttons_visible ::
                             (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_offset_buttons_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_offset_buttons_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_offset_buttons_visible" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Tabs.get_offset_buttons_visible

{-# NOINLINE bindTabs_get_scrolling_enabled #-}

-- | if @true@, the mouse's scroll wheel can be used to navigate the scroll view.
bindTabs_get_scrolling_enabled :: MethodBind
bindTabs_get_scrolling_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_scrolling_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | if @true@, the mouse's scroll wheel can be used to navigate the scroll view.
get_scrolling_enabled ::
                        (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_scrolling_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_scrolling_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_scrolling_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Tabs.get_scrolling_enabled

{-# NOINLINE bindTabs_get_select_with_rmb #-}

-- | Returns @true@ if select with right mouse button is enabled.
bindTabs_get_select_with_rmb :: MethodBind
bindTabs_get_select_with_rmb
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_select_with_rmb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if select with right mouse button is enabled.
get_select_with_rmb ::
                      (Tabs :< cls, Object :< cls) => cls -> IO Bool
get_select_with_rmb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_select_with_rmb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_select_with_rmb" '[] (IO Bool) where
        nodeMethod = Godot.Core.Tabs.get_select_with_rmb

{-# NOINLINE bindTabs_get_tab_align #-}

-- | The alignment of all tabs. See @enum TabAlign@ for details.
bindTabs_get_tab_align :: MethodBind
bindTabs_get_tab_align
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of all tabs. See @enum TabAlign@ for details.
get_tab_align :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_align" '[] (IO Int) where
        nodeMethod = Godot.Core.Tabs.get_tab_align

{-# NOINLINE bindTabs_get_tab_close_display_policy #-}

-- | Sets when the close button will appear on the tabs. See @enum CloseButtonDisplayPolicy@ for details.
bindTabs_get_tab_close_display_policy :: MethodBind
bindTabs_get_tab_close_display_policy
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_close_display_policy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets when the close button will appear on the tabs. See @enum CloseButtonDisplayPolicy@ for details.
get_tab_close_display_policy ::
                               (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_close_display_policy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_close_display_policy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_close_display_policy" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Tabs.get_tab_close_display_policy

{-# NOINLINE bindTabs_get_tab_count #-}

-- | Returns the number of tabs.
bindTabs_get_tab_count :: MethodBind
bindTabs_get_tab_count
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of tabs.
get_tab_count :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Tabs.get_tab_count

{-# NOINLINE bindTabs_get_tab_disabled #-}

-- | Returns @true@ if the tab at index @tab_idx@ is disabled.
bindTabs_get_tab_disabled :: MethodBind
bindTabs_get_tab_disabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the tab at index @tab_idx@ is disabled.
get_tab_disabled ::
                   (Tabs :< cls, Object :< cls) => cls -> Int -> IO Bool
get_tab_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_disabled" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.Tabs.get_tab_disabled

{-# NOINLINE bindTabs_get_tab_icon #-}

-- | Returns the @Texture@ for the tab at index @tab_idx@ or @null@ if the tab has no @Texture@.
bindTabs_get_tab_icon :: MethodBind
bindTabs_get_tab_icon
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Texture@ for the tab at index @tab_idx@ or @null@ if the tab has no @Texture@.
get_tab_icon ::
               (Tabs :< cls, Object :< cls) => cls -> Int -> IO Texture
get_tab_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_icon" '[Int] (IO Texture) where
        nodeMethod = Godot.Core.Tabs.get_tab_icon

{-# NOINLINE bindTabs_get_tab_offset #-}

-- | Returns the number of hidden tabs offsetted to the left.
bindTabs_get_tab_offset :: MethodBind
bindTabs_get_tab_offset
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of hidden tabs offsetted to the left.
get_tab_offset :: (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tab_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_offset" '[] (IO Int) where
        nodeMethod = Godot.Core.Tabs.get_tab_offset

{-# NOINLINE bindTabs_get_tab_rect #-}

-- | Returns tab @Rect2@ with local position and size.
bindTabs_get_tab_rect :: MethodBind
bindTabs_get_tab_rect
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns tab @Rect2@ with local position and size.
get_tab_rect ::
               (Tabs :< cls, Object :< cls) => cls -> Int -> IO Rect2
get_tab_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_rect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_rect" '[Int] (IO Rect2) where
        nodeMethod = Godot.Core.Tabs.get_tab_rect

{-# NOINLINE bindTabs_get_tab_title #-}

-- | Returns the title of the tab at index @tab_idx@.
bindTabs_get_tab_title :: MethodBind
bindTabs_get_tab_title
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tab_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the title of the tab at index @tab_idx@.
get_tab_title ::
                (Tabs :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_tab_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tab_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tab_title" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.Tabs.get_tab_title

{-# NOINLINE bindTabs_get_tabs_rearrange_group #-}

-- | Returns the @Tabs@' rearrange group ID.
bindTabs_get_tabs_rearrange_group :: MethodBind
bindTabs_get_tabs_rearrange_group
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "get_tabs_rearrange_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Tabs@' rearrange group ID.
get_tabs_rearrange_group ::
                           (Tabs :< cls, Object :< cls) => cls -> IO Int
get_tabs_rearrange_group cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_get_tabs_rearrange_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "get_tabs_rearrange_group" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Tabs.get_tabs_rearrange_group

{-# NOINLINE bindTabs_move_tab #-}

-- | Moves a tab from @from@ to @to@.
bindTabs_move_tab :: MethodBind
bindTabs_move_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "move_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves a tab from @from@ to @to@.
move_tab ::
           (Tabs :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
move_tab cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_move_tab (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "move_tab" '[Int, Int] (IO ()) where
        nodeMethod = Godot.Core.Tabs.move_tab

{-# NOINLINE bindTabs_remove_tab #-}

-- | Removes the tab at index @tab_idx@.
bindTabs_remove_tab :: MethodBind
bindTabs_remove_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "remove_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the tab at index @tab_idx@.
remove_tab :: (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
remove_tab cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_remove_tab (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "remove_tab" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Tabs.remove_tab

{-# NOINLINE bindTabs_set_current_tab #-}

-- | Select tab at index @tab_idx@.
bindTabs_set_current_tab :: MethodBind
bindTabs_set_current_tab
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_current_tab" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Select tab at index @tab_idx@.
set_current_tab ::
                  (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_current_tab cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_current_tab (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_current_tab" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Tabs.set_current_tab

{-# NOINLINE bindTabs_set_drag_to_rearrange_enabled #-}

-- | If @true@, tabs can be rearranged with mouse drag.
bindTabs_set_drag_to_rearrange_enabled :: MethodBind
bindTabs_set_drag_to_rearrange_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_drag_to_rearrange_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, tabs can be rearranged with mouse drag.
set_drag_to_rearrange_enabled ::
                                (Tabs :< cls, Object :< cls) => cls -> Bool -> IO ()
set_drag_to_rearrange_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_drag_to_rearrange_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_drag_to_rearrange_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_drag_to_rearrange_enabled

{-# NOINLINE bindTabs_set_scrolling_enabled #-}

-- | if @true@, the mouse's scroll wheel can be used to navigate the scroll view.
bindTabs_set_scrolling_enabled :: MethodBind
bindTabs_set_scrolling_enabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_scrolling_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | if @true@, the mouse's scroll wheel can be used to navigate the scroll view.
set_scrolling_enabled ::
                        (Tabs :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scrolling_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_scrolling_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_scrolling_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_scrolling_enabled

{-# NOINLINE bindTabs_set_select_with_rmb #-}

-- | If @true@, enables selecting a tab with the right mouse button.
bindTabs_set_select_with_rmb :: MethodBind
bindTabs_set_select_with_rmb
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_select_with_rmb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables selecting a tab with the right mouse button.
set_select_with_rmb ::
                      (Tabs :< cls, Object :< cls) => cls -> Bool -> IO ()
set_select_with_rmb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_select_with_rmb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_select_with_rmb" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_select_with_rmb

{-# NOINLINE bindTabs_set_tab_align #-}

-- | The alignment of all tabs. See @enum TabAlign@ for details.
bindTabs_set_tab_align :: MethodBind
bindTabs_set_tab_align
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of all tabs. See @enum TabAlign@ for details.
set_tab_align ::
                (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_tab_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_tab_align" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Tabs.set_tab_align

{-# NOINLINE bindTabs_set_tab_close_display_policy #-}

-- | Sets when the close button will appear on the tabs. See @enum CloseButtonDisplayPolicy@ for details.
bindTabs_set_tab_close_display_policy :: MethodBind
bindTabs_set_tab_close_display_policy
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_close_display_policy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets when the close button will appear on the tabs. See @enum CloseButtonDisplayPolicy@ for details.
set_tab_close_display_policy ::
                               (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_tab_close_display_policy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_close_display_policy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_tab_close_display_policy" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_tab_close_display_policy

{-# NOINLINE bindTabs_set_tab_disabled #-}

-- | If @disabled@ is @true@, disables the tab at index @tab_idx@, making it non-interactable.
bindTabs_set_tab_disabled :: MethodBind
bindTabs_set_tab_disabled
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @disabled@ is @true@, disables the tab at index @tab_idx@, making it non-interactable.
set_tab_disabled ::
                   (Tabs :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_tab_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_tab_disabled" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_tab_disabled

{-# NOINLINE bindTabs_set_tab_icon #-}

-- | Sets an @icon@ for the tab at index @tab_idx@.
bindTabs_set_tab_icon :: MethodBind
bindTabs_set_tab_icon
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an @icon@ for the tab at index @tab_idx@.
set_tab_icon ::
               (Tabs :< cls, Object :< cls) => cls -> Int -> Texture -> IO ()
set_tab_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_tab_icon" '[Int, Texture] (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_tab_icon

{-# NOINLINE bindTabs_set_tab_title #-}

-- | Sets a @title@ for the tab at index @tab_idx@.
bindTabs_set_tab_title :: MethodBind
bindTabs_set_tab_title
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tab_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a @title@ for the tab at index @tab_idx@.
set_tab_title ::
                (Tabs :< cls, Object :< cls) => cls -> Int -> GodotString -> IO ()
set_tab_title cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tab_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_tab_title" '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_tab_title

{-# NOINLINE bindTabs_set_tabs_rearrange_group #-}

-- | Defines the rearrange group ID. Choose for each @Tabs@ the same value to dragging tabs between @Tabs@. Enable drag with @drag_to_rearrange_enabled@.
bindTabs_set_tabs_rearrange_group :: MethodBind
bindTabs_set_tabs_rearrange_group
  = unsafePerformIO $
      withCString "Tabs" $
        \ clsNamePtr ->
          withCString "set_tabs_rearrange_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the rearrange group ID. Choose for each @Tabs@ the same value to dragging tabs between @Tabs@. Enable drag with @drag_to_rearrange_enabled@.
set_tabs_rearrange_group ::
                           (Tabs :< cls, Object :< cls) => cls -> Int -> IO ()
set_tabs_rearrange_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTabs_set_tabs_rearrange_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Tabs "set_tabs_rearrange_group" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Tabs.set_tabs_rearrange_group