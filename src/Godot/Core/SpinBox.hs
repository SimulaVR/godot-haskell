{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SpinBox
       (Godot.Core.SpinBox._gui_input, Godot.Core.SpinBox._text_entered,
        Godot.Core.SpinBox.set_align, Godot.Core.SpinBox.get_align,
        Godot.Core.SpinBox.set_suffix, Godot.Core.SpinBox.get_suffix,
        Godot.Core.SpinBox.set_prefix, Godot.Core.SpinBox.get_prefix,
        Godot.Core.SpinBox.set_editable, Godot.Core.SpinBox.is_editable,
        Godot.Core.SpinBox._line_edit_focus_exit,
        Godot.Core.SpinBox.get_line_edit,
        Godot.Core.SpinBox._line_edit_input,
        Godot.Core.SpinBox._range_click_timeout)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSpinBox__gui_input #-}

bindSpinBox__gui_input :: MethodBind
bindSpinBox__gui_input
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (SpinBox :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox__text_entered #-}

bindSpinBox__text_entered :: MethodBind
bindSpinBox__text_entered
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "_text_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_text_entered ::
                (SpinBox :< cls, Object :< cls) => cls -> GodotString -> IO ()
_text_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox__text_entered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_set_align #-}

bindSpinBox_set_align :: MethodBind
bindSpinBox_set_align
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "set_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_align :: (SpinBox :< cls, Object :< cls) => cls -> Int -> IO ()
set_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_set_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_get_align #-}

bindSpinBox_get_align :: MethodBind
bindSpinBox_get_align
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "get_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_align :: (SpinBox :< cls, Object :< cls) => cls -> IO Int
get_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_get_align (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_set_suffix #-}

bindSpinBox_set_suffix :: MethodBind
bindSpinBox_set_suffix
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "set_suffix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_suffix ::
             (SpinBox :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_suffix cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_set_suffix (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_get_suffix #-}

bindSpinBox_get_suffix :: MethodBind
bindSpinBox_get_suffix
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "get_suffix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_suffix ::
             (SpinBox :< cls, Object :< cls) => cls -> IO GodotString
get_suffix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_get_suffix (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_set_prefix #-}

bindSpinBox_set_prefix :: MethodBind
bindSpinBox_set_prefix
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "set_prefix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_prefix ::
             (SpinBox :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_prefix cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_set_prefix (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_get_prefix #-}

bindSpinBox_get_prefix :: MethodBind
bindSpinBox_get_prefix
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "get_prefix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_prefix ::
             (SpinBox :< cls, Object :< cls) => cls -> IO GodotString
get_prefix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_get_prefix (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_set_editable #-}

bindSpinBox_set_editable :: MethodBind
bindSpinBox_set_editable
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_editable ::
               (SpinBox :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_set_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_is_editable #-}

bindSpinBox_is_editable :: MethodBind
bindSpinBox_is_editable
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_editable :: (SpinBox :< cls, Object :< cls) => cls -> IO Bool
is_editable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox__line_edit_focus_exit #-}

bindSpinBox__line_edit_focus_exit :: MethodBind
bindSpinBox__line_edit_focus_exit
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "_line_edit_focus_exit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_line_edit_focus_exit ::
                        (SpinBox :< cls, Object :< cls) => cls -> IO ()
_line_edit_focus_exit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox__line_edit_focus_exit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox_get_line_edit #-}

bindSpinBox_get_line_edit :: MethodBind
bindSpinBox_get_line_edit
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "get_line_edit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_line_edit ::
                (SpinBox :< cls, Object :< cls) => cls -> IO LineEdit
get_line_edit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox_get_line_edit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox__line_edit_input #-}

bindSpinBox__line_edit_input :: MethodBind
bindSpinBox__line_edit_input
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "_line_edit_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_line_edit_input ::
                   (SpinBox :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_line_edit_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox__line_edit_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpinBox__range_click_timeout #-}

bindSpinBox__range_click_timeout :: MethodBind
bindSpinBox__range_click_timeout
  = unsafePerformIO $
      withCString "SpinBox" $
        \ clsNamePtr ->
          withCString "_range_click_timeout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_range_click_timeout ::
                       (SpinBox :< cls, Object :< cls) => cls -> IO ()
_range_click_timeout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpinBox__range_click_timeout
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)