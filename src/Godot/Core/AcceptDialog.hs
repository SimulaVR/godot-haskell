{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.WindowDialog()

-- | Emitted when the dialog is accepted, i.e. the OK button is pressed.
sig_confirmed :: Godot.Internal.Dispatch.Signal AcceptDialog
sig_confirmed = Godot.Internal.Dispatch.Signal "confirmed"

instance NodeSignal AcceptDialog "confirmed" '[]

-- | Emitted when a custom button is pressed. See @method add_button@.
sig_custom_action :: Godot.Internal.Dispatch.Signal AcceptDialog
sig_custom_action = Godot.Internal.Dispatch.Signal "custom_action"

instance NodeSignal AcceptDialog "custom_action" '[GodotString]

instance NodeProperty AcceptDialog "dialog_autowrap" Bool 'False
         where
        nodeProperty
          = (has_autowrap, wrapDroppingSetter set_autowrap, Nothing)

instance NodeProperty AcceptDialog "dialog_hide_on_ok" Bool 'False
         where
        nodeProperty
          = (get_hide_on_ok, wrapDroppingSetter set_hide_on_ok, Nothing)

instance NodeProperty AcceptDialog "dialog_text" GodotString 'False
         where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

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

instance NodeMethod AcceptDialog "_builtin_text_entered"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AcceptDialog._builtin_text_entered

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

instance NodeMethod AcceptDialog "_custom_action" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AcceptDialog._custom_action

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

instance NodeMethod AcceptDialog "_ok" '[] (IO ()) where
        nodeMethod = Godot.Core.AcceptDialog._ok

{-# NOINLINE bindAcceptDialog_add_button #-}

-- | Adds a button with label @text@ and a custom @action@ to the dialog and returns the created button. @action@ will be passed to the @signal custom_action@ signal when pressed.
--   				If @true@, @right@ will place the button to the right of any sibling buttons.
--   				You can use @method remove_button@ method to remove a button created with this method from the dialog.
bindAcceptDialog_add_button :: MethodBind
bindAcceptDialog_add_button
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "add_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a button with label @text@ and a custom @action@ to the dialog and returns the created button. @action@ will be passed to the @signal custom_action@ signal when pressed.
--   				If @true@, @right@ will place the button to the right of any sibling buttons.
--   				You can use @method remove_button@ method to remove a button created with this method from the dialog.
add_button ::
             (AcceptDialog :< cls, Object :< cls) =>
             cls -> GodotString -> Maybe Bool -> Maybe GodotString -> IO Button
add_button cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2,
       defaultedVariant VariantString "" arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_add_button (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "add_button"
           '[GodotString, Maybe Bool, Maybe GodotString]
           (IO Button)
         where
        nodeMethod = Godot.Core.AcceptDialog.add_button

{-# NOINLINE bindAcceptDialog_add_cancel #-}

-- | Adds a button with label @name@ and a cancel action to the dialog and returns the created button.
--   				You can use @method remove_button@ method to remove a button created with this method from the dialog.
bindAcceptDialog_add_cancel :: MethodBind
bindAcceptDialog_add_cancel
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "add_cancel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a button with label @name@ and a cancel action to the dialog and returns the created button.
--   				You can use @method remove_button@ method to remove a button created with this method from the dialog.
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

instance NodeMethod AcceptDialog "add_cancel" '[GodotString]
           (IO Button)
         where
        nodeMethod = Godot.Core.AcceptDialog.add_cancel

{-# NOINLINE bindAcceptDialog_get_hide_on_ok #-}

-- | If @true@, the dialog is hidden when the OK button is pressed. You can set it to @false@ if you want to do e.g. input validation when receiving the @signal confirmed@ signal, and handle hiding the dialog in your own logic.
--   			__Note:__ Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example @FileDialog@ defaults to @false@, and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such, this property can't be used in @FileDialog@ to disable hiding the dialog when pressing OK.
bindAcceptDialog_get_hide_on_ok :: MethodBind
bindAcceptDialog_get_hide_on_ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_hide_on_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the dialog is hidden when the OK button is pressed. You can set it to @false@ if you want to do e.g. input validation when receiving the @signal confirmed@ signal, and handle hiding the dialog in your own logic.
--   			__Note:__ Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example @FileDialog@ defaults to @false@, and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such, this property can't be used in @FileDialog@ to disable hiding the dialog when pressing OK.
get_hide_on_ok ::
                 (AcceptDialog :< cls, Object :< cls) => cls -> IO Bool
get_hide_on_ok cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_hide_on_ok (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "get_hide_on_ok" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AcceptDialog.get_hide_on_ok

{-# NOINLINE bindAcceptDialog_get_label #-}

-- | Returns the label used for built-in text.
--   				__Warning:__ This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their @CanvasItem.visible@ property.
bindAcceptDialog_get_label :: MethodBind
bindAcceptDialog_get_label
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the label used for built-in text.
--   				__Warning:__ This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their @CanvasItem.visible@ property.
get_label ::
            (AcceptDialog :< cls, Object :< cls) => cls -> IO Label
get_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "get_label" '[] (IO Label) where
        nodeMethod = Godot.Core.AcceptDialog.get_label

{-# NOINLINE bindAcceptDialog_get_ok #-}

-- | Returns the OK @Button@ instance.
--   				__Warning:__ This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their @CanvasItem.visible@ property.
bindAcceptDialog_get_ok :: MethodBind
bindAcceptDialog_get_ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the OK @Button@ instance.
--   				__Warning:__ This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their @CanvasItem.visible@ property.
get_ok :: (AcceptDialog :< cls, Object :< cls) => cls -> IO Button
get_ok cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_ok (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "get_ok" '[] (IO Button) where
        nodeMethod = Godot.Core.AcceptDialog.get_ok

{-# NOINLINE bindAcceptDialog_get_text #-}

-- | The text displayed by the dialog.
bindAcceptDialog_get_text :: MethodBind
bindAcceptDialog_get_text
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed by the dialog.
get_text ::
           (AcceptDialog :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_get_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "get_text" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.AcceptDialog.get_text

{-# NOINLINE bindAcceptDialog_has_autowrap #-}

-- | Sets autowrapping for the text in the dialog.
bindAcceptDialog_has_autowrap :: MethodBind
bindAcceptDialog_has_autowrap
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "has_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets autowrapping for the text in the dialog.
has_autowrap ::
               (AcceptDialog :< cls, Object :< cls) => cls -> IO Bool
has_autowrap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_has_autowrap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "has_autowrap" '[] (IO Bool) where
        nodeMethod = Godot.Core.AcceptDialog.has_autowrap

{-# NOINLINE bindAcceptDialog_register_text_enter #-}

-- | Registers a @LineEdit@ in the dialog. When the enter key is pressed, the dialog will be accepted.
bindAcceptDialog_register_text_enter :: MethodBind
bindAcceptDialog_register_text_enter
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "register_text_enter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Registers a @LineEdit@ in the dialog. When the enter key is pressed, the dialog will be accepted.
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

instance NodeMethod AcceptDialog "register_text_enter" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.AcceptDialog.register_text_enter

{-# NOINLINE bindAcceptDialog_set_autowrap #-}

-- | Sets autowrapping for the text in the dialog.
bindAcceptDialog_set_autowrap :: MethodBind
bindAcceptDialog_set_autowrap
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "set_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets autowrapping for the text in the dialog.
set_autowrap ::
               (AcceptDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autowrap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_set_autowrap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "set_autowrap" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AcceptDialog.set_autowrap

{-# NOINLINE bindAcceptDialog_set_hide_on_ok #-}

-- | If @true@, the dialog is hidden when the OK button is pressed. You can set it to @false@ if you want to do e.g. input validation when receiving the @signal confirmed@ signal, and handle hiding the dialog in your own logic.
--   			__Note:__ Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example @FileDialog@ defaults to @false@, and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such, this property can't be used in @FileDialog@ to disable hiding the dialog when pressing OK.
bindAcceptDialog_set_hide_on_ok :: MethodBind
bindAcceptDialog_set_hide_on_ok
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "set_hide_on_ok" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the dialog is hidden when the OK button is pressed. You can set it to @false@ if you want to do e.g. input validation when receiving the @signal confirmed@ signal, and handle hiding the dialog in your own logic.
--   			__Note:__ Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example @FileDialog@ defaults to @false@, and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such, this property can't be used in @FileDialog@ to disable hiding the dialog when pressing OK.
set_hide_on_ok ::
                 (AcceptDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hide_on_ok cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_set_hide_on_ok (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "set_hide_on_ok" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AcceptDialog.set_hide_on_ok

{-# NOINLINE bindAcceptDialog_set_text #-}

-- | The text displayed by the dialog.
bindAcceptDialog_set_text :: MethodBind
bindAcceptDialog_set_text
  = unsafePerformIO $
      withCString "AcceptDialog" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed by the dialog.
set_text ::
           (AcceptDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAcceptDialog_set_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AcceptDialog "set_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.AcceptDialog.set_text