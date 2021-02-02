{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Popup
       (Godot.Core.Popup._NOTIFICATION_POST_POPUP,
        Godot.Core.Popup._NOTIFICATION_POPUP_HIDE,
        Godot.Core.Popup.sig_about_to_show,
        Godot.Core.Popup.sig_popup_hide, Godot.Core.Popup.is_exclusive,
        Godot.Core.Popup.popup, Godot.Core.Popup.popup_centered,
        Godot.Core.Popup.popup_centered_clamped,
        Godot.Core.Popup.popup_centered_minsize,
        Godot.Core.Popup.popup_centered_ratio,
        Godot.Core.Popup.set_as_minsize, Godot.Core.Popup.set_exclusive)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_POST_POPUP :: Int
_NOTIFICATION_POST_POPUP = 80

_NOTIFICATION_POPUP_HIDE :: Int
_NOTIFICATION_POPUP_HIDE = 81

-- | This signal is emitted when a popup is about to be shown. (often used in [PopupMenu] for clearing the list of options and creating a new one according to the current context).
sig_about_to_show :: Godot.Internal.Dispatch.Signal Popup
sig_about_to_show = Godot.Internal.Dispatch.Signal "about_to_show"

-- | This signal is emitted when a popup is hidden.
sig_popup_hide :: Godot.Internal.Dispatch.Signal Popup
sig_popup_hide = Godot.Internal.Dispatch.Signal "popup_hide"

{-# NOINLINE bindPopup_is_exclusive #-}

-- | If [code]true[/code], the popup will not be hidden when a click event occurs outside of it, or when it receives the [code]ui_cancel[/code] action event.
bindPopup_is_exclusive :: MethodBind
bindPopup_is_exclusive
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "is_exclusive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the popup will not be hidden when a click event occurs outside of it, or when it receives the [code]ui_cancel[/code] action event.
is_exclusive :: (Popup :< cls, Object :< cls) => cls -> IO Bool
is_exclusive cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_is_exclusive (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_popup #-}

-- | Popup (show the control in modal form).
bindPopup_popup :: MethodBind
bindPopup_popup
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Popup (show the control in modal form).
popup :: (Popup :< cls, Object :< cls) => cls -> Rect2 -> IO ()
popup cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_popup_centered #-}

-- | Popup (show the control in modal form) in the center of the screen relative to its current canvas transform, at the current size, or at a size determined by "size".
bindPopup_popup_centered :: MethodBind
bindPopup_popup_centered
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Popup (show the control in modal form) in the center of the screen relative to its current canvas transform, at the current size, or at a size determined by "size".
popup_centered ::
                 (Popup :< cls, Object :< cls) => cls -> Vector2 -> IO ()
popup_centered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_popup_centered_clamped #-}

bindPopup_popup_centered_clamped :: MethodBind
bindPopup_popup_centered_clamped
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered_clamped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

popup_centered_clamped ::
                         (Popup :< cls, Object :< cls) => cls -> Vector2 -> Float -> IO ()
popup_centered_clamped cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered_clamped
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_popup_centered_minsize #-}

-- | Popup (show the control in modal form) in the center of the screen relative to the current canvas transform, ensuring the size is never smaller than [code]minsize[/code].
bindPopup_popup_centered_minsize :: MethodBind
bindPopup_popup_centered_minsize
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered_minsize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Popup (show the control in modal form) in the center of the screen relative to the current canvas transform, ensuring the size is never smaller than [code]minsize[/code].
popup_centered_minsize ::
                         (Popup :< cls, Object :< cls) => cls -> Vector2 -> IO ()
popup_centered_minsize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered_minsize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_popup_centered_ratio #-}

-- | Popup (show the control in modal form) in the center of the screen relative to the current canvas transform, scaled at a ratio of size of the screen.
bindPopup_popup_centered_ratio :: MethodBind
bindPopup_popup_centered_ratio
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "popup_centered_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Popup (show the control in modal form) in the center of the screen relative to the current canvas transform, scaled at a ratio of size of the screen.
popup_centered_ratio ::
                       (Popup :< cls, Object :< cls) => cls -> Float -> IO ()
popup_centered_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_popup_centered_ratio (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_set_as_minsize #-}

bindPopup_set_as_minsize :: MethodBind
bindPopup_set_as_minsize
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "set_as_minsize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_as_minsize :: (Popup :< cls, Object :< cls) => cls -> IO ()
set_as_minsize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_set_as_minsize (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPopup_set_exclusive #-}

-- | If [code]true[/code], the popup will not be hidden when a click event occurs outside of it, or when it receives the [code]ui_cancel[/code] action event.
bindPopup_set_exclusive :: MethodBind
bindPopup_set_exclusive
  = unsafePerformIO $
      withCString "Popup" $
        \ clsNamePtr ->
          withCString "set_exclusive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the popup will not be hidden when a click event occurs outside of it, or when it receives the [code]ui_cancel[/code] action event.
set_exclusive ::
                (Popup :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclusive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPopup_set_exclusive (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)