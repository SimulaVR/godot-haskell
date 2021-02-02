{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AcceptDialog
       (Godot.Core.AcceptDialog.sig_confirmed,
        Godot.Core.AcceptDialog.sig_custom_action,
        Godot.Core.AcceptDialog._builtin_text_entered,
        Godot.Core.AcceptDialog._custom_action,
        Godot.Core.AcceptDialog._ok, Godot.Core.AcceptDialog.add_button,
        Godot.Core.AcceptDialog.add_cancel,
        Godot.Core.AcceptDialog.get_hide_on_ok,
        Godot.Core.AcceptDialog.get_label, Godot.Core.AcceptDialog.get_ok,
        Godot.Core.AcceptDialog.get_text,
        Godot.Core.AcceptDialog.has_autowrap,
        Godot.Core.AcceptDialog.register_text_enter,
        Godot.Core.AcceptDialog.set_autowrap,
        Godot.Core.AcceptDialog.set_hide_on_ok,
        Godot.Core.AcceptDialog.set_text)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when the dialog is accepted, i.e. the OK button is pressed.
sig_confirmed :: Godot.Internal.Dispatch.Signal AcceptDialog
sig_confirmed = Godot.Internal.Dispatch.Signal "confirmed"

-- | Emitted when a custom button is pressed. See [method add_button].
sig_custom_action :: Godot.Internal.Dispatch.Signal AcceptDialog
sig_custom_action = Godot.Internal.Dispatch.Signal "custom_action"

{-# NOINLINE bindAcceptDialog__builtin_text_entered #-}

bindAcceptDialog__builtin_text_entered :: MethodBind
bindAcceptDialog__builtin_text_entered
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "_builtin_text_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_builtin_text_entered ::
                        (AcceptDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
_builtin_text_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog__builtin_text_entered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog__custom_action #-}

bindAcceptDialog__custom_action :: MethodBind
bindAcceptDialog__custom_action
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "_custom_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_custom_action ::
                 (AcceptDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
_custom_action cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog__custom_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog__ok #-}

bindAcceptDialog__ok :: MethodBind
bindAcceptDialog__ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_ok :: (AcceptDialog :< cls, Object :< cls) => cls -> IO ()
_ok cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog__ok (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_add_button #-}

-- | Adds a button with label [i]text[/i] and a custom [i]action[/i] to the dialog and returns the created button. [i]action[/i] will be passed to the [signal custom_action] signal when pressed.
--   				If [code]true[/code], [i]right[/i] will place the button to the right of any sibling buttons. Default value: [code]false[/code].
bindAcceptDialog_add_button :: MethodBind
bindAcceptDialog_add_button
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "add_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a button with label [i]text[/i] and a custom [i]action[/i] to the dialog and returns the created button. [i]action[/i] will be passed to the [signal custom_action] signal when pressed.
--   				If [code]true[/code], [i]right[/i] will place the button to the right of any sibling buttons. Default value: [code]false[/code].
add_button ::
             (AcceptDialog :< cls, Object :< cls) =>
             cls -> GodotString -> Bool -> GodotString -> IO Button
add_button cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_add_button (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_add_cancel #-}

-- | Adds a button with label [i]name[/i] and a cancel action to the dialog and returns the created button.
bindAcceptDialog_add_cancel :: MethodBind
bindAcceptDialog_add_cancel
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "add_cancel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a button with label [i]name[/i] and a cancel action to the dialog and returns the created button.
add_cancel ::
             (AcceptDialog :< cls, Object :< cls) =>
             cls -> GodotString -> IO Button
add_cancel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_add_cancel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_get_hide_on_ok #-}

-- | If [code]true[/code], the dialog is hidden when the OK button is pressed. You can set it to [code]false[/code] if you want to do e.g. input validation when receiving the [signal confirmed] signal, and handle hiding the dialog in your own logic. Default value: [code]true[/code].
--   			Note: Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example [FileDialog] defaults to [code]false[/code], and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such this property can't be used in [FileDialog] to disable hiding the dialog when pressing OK.
bindAcceptDialog_get_hide_on_ok :: MethodBind
bindAcceptDialog_get_hide_on_ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_hide_on_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the dialog is hidden when the OK button is pressed. You can set it to [code]false[/code] if you want to do e.g. input validation when receiving the [signal confirmed] signal, and handle hiding the dialog in your own logic. Default value: [code]true[/code].
--   			Note: Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example [FileDialog] defaults to [code]false[/code], and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such this property can't be used in [FileDialog] to disable hiding the dialog when pressing OK.
get_hide_on_ok ::
                 (AcceptDialog :< cls, Object :< cls) => cls -> IO Bool
get_hide_on_ok cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_hide_on_ok (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_get_label #-}

-- | Returns the label used for built-in text.
bindAcceptDialog_get_label :: MethodBind
bindAcceptDialog_get_label
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the label used for built-in text.
get_label ::
            (AcceptDialog :< cls, Object :< cls) => cls -> IO Label
get_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_get_ok #-}

-- | Returns the OK Button.
bindAcceptDialog_get_ok :: MethodBind
bindAcceptDialog_get_ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the OK Button.
get_ok :: (AcceptDialog :< cls, Object :< cls) => cls -> IO Button
get_ok cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_ok (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_get_text #-}

-- | The text displayed by this dialog.
bindAcceptDialog_get_text :: MethodBind
bindAcceptDialog_get_text
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed by this dialog.
get_text ::
           (AcceptDialog :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_has_autowrap #-}

bindAcceptDialog_has_autowrap :: MethodBind
bindAcceptDialog_has_autowrap
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "has_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_autowrap ::
               (AcceptDialog :< cls, Object :< cls) => cls -> IO Bool
has_autowrap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_has_autowrap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_register_text_enter #-}

-- | Registers a [LineEdit] in the dialog. When the enter key is pressed, the dialog will be accepted.
bindAcceptDialog_register_text_enter :: MethodBind
bindAcceptDialog_register_text_enter
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "register_text_enter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Registers a [LineEdit] in the dialog. When the enter key is pressed, the dialog will be accepted.
register_text_enter ::
                      (AcceptDialog :< cls, Object :< cls) => cls -> Node -> IO ()
register_text_enter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_register_text_enter
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_set_autowrap #-}

bindAcceptDialog_set_autowrap :: MethodBind
bindAcceptDialog_set_autowrap
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "set_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_autowrap ::
               (AcceptDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autowrap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_set_autowrap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_set_hide_on_ok #-}

-- | If [code]true[/code], the dialog is hidden when the OK button is pressed. You can set it to [code]false[/code] if you want to do e.g. input validation when receiving the [signal confirmed] signal, and handle hiding the dialog in your own logic. Default value: [code]true[/code].
--   			Note: Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example [FileDialog] defaults to [code]false[/code], and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such this property can't be used in [FileDialog] to disable hiding the dialog when pressing OK.
bindAcceptDialog_set_hide_on_ok :: MethodBind
bindAcceptDialog_set_hide_on_ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "set_hide_on_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the dialog is hidden when the OK button is pressed. You can set it to [code]false[/code] if you want to do e.g. input validation when receiving the [signal confirmed] signal, and handle hiding the dialog in your own logic. Default value: [code]true[/code].
--   			Note: Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example [FileDialog] defaults to [code]false[/code], and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such this property can't be used in [FileDialog] to disable hiding the dialog when pressing OK.
set_hide_on_ok ::
                 (AcceptDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_on_ok cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_set_hide_on_ok (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAcceptDialog_set_text #-}

-- | The text displayed by this dialog.
bindAcceptDialog_set_text :: MethodBind
bindAcceptDialog_set_text
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed by this dialog.
set_text ::
           (AcceptDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_set_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)