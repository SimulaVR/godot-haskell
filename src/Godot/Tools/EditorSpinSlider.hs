{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorSpinSlider
       (Godot.Tools.EditorSpinSlider._grabber_gui_input,
        Godot.Tools.EditorSpinSlider._grabber_mouse_entered,
        Godot.Tools.EditorSpinSlider._grabber_mouse_exited,
        Godot.Tools.EditorSpinSlider._gui_input,
        Godot.Tools.EditorSpinSlider._value_focus_exited,
        Godot.Tools.EditorSpinSlider._value_input_closed,
        Godot.Tools.EditorSpinSlider._value_input_entered,
        Godot.Tools.EditorSpinSlider.get_label,
        Godot.Tools.EditorSpinSlider.is_flat,
        Godot.Tools.EditorSpinSlider.is_read_only,
        Godot.Tools.EditorSpinSlider.set_flat,
        Godot.Tools.EditorSpinSlider.set_label,
        Godot.Tools.EditorSpinSlider.set_read_only)
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
import Godot.Core.Range()

instance NodeProperty EditorSpinSlider "flat" Bool 'False where
        nodeProperty = (is_flat, wrapDroppingSetter set_flat, Nothing)

instance NodeProperty EditorSpinSlider "label" GodotString 'False
         where
        nodeProperty = (get_label, wrapDroppingSetter set_label, Nothing)

instance NodeProperty EditorSpinSlider "read_only" Bool 'False
         where
        nodeProperty
          = (is_read_only, wrapDroppingSetter set_read_only, Nothing)

{-# NOINLINE bindEditorSpinSlider__grabber_gui_input #-}

bindEditorSpinSlider__grabber_gui_input :: MethodBind
bindEditorSpinSlider__grabber_gui_input
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_grabber_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_grabber_gui_input ::
                     (EditorSpinSlider :< cls, Object :< cls) =>
                     cls -> InputEvent -> IO ()
_grabber_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__grabber_gui_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_grabber_gui_input"
           '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._grabber_gui_input

{-# NOINLINE bindEditorSpinSlider__grabber_mouse_entered #-}

bindEditorSpinSlider__grabber_mouse_entered :: MethodBind
bindEditorSpinSlider__grabber_mouse_entered
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_grabber_mouse_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_grabber_mouse_entered ::
                         (EditorSpinSlider :< cls, Object :< cls) => cls -> IO ()
_grabber_mouse_entered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__grabber_mouse_entered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_grabber_mouse_entered" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._grabber_mouse_entered

{-# NOINLINE bindEditorSpinSlider__grabber_mouse_exited #-}

bindEditorSpinSlider__grabber_mouse_exited :: MethodBind
bindEditorSpinSlider__grabber_mouse_exited
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_grabber_mouse_exited" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_grabber_mouse_exited ::
                        (EditorSpinSlider :< cls, Object :< cls) => cls -> IO ()
_grabber_mouse_exited cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__grabber_mouse_exited
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_grabber_mouse_exited" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._grabber_mouse_exited

{-# NOINLINE bindEditorSpinSlider__gui_input #-}

bindEditorSpinSlider__gui_input :: MethodBind
bindEditorSpinSlider__gui_input
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (EditorSpinSlider :< cls, Object :< cls) =>
             cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_gui_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._gui_input

{-# NOINLINE bindEditorSpinSlider__value_focus_exited #-}

bindEditorSpinSlider__value_focus_exited :: MethodBind
bindEditorSpinSlider__value_focus_exited
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_value_focus_exited" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_value_focus_exited ::
                      (EditorSpinSlider :< cls, Object :< cls) => cls -> IO ()
_value_focus_exited cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__value_focus_exited
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_value_focus_exited" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._value_focus_exited

{-# NOINLINE bindEditorSpinSlider__value_input_closed #-}

bindEditorSpinSlider__value_input_closed :: MethodBind
bindEditorSpinSlider__value_input_closed
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_value_input_closed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_value_input_closed ::
                      (EditorSpinSlider :< cls, Object :< cls) => cls -> IO ()
_value_input_closed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__value_input_closed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_value_input_closed" '[]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._value_input_closed

{-# NOINLINE bindEditorSpinSlider__value_input_entered #-}

bindEditorSpinSlider__value_input_entered :: MethodBind
bindEditorSpinSlider__value_input_entered
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "_value_input_entered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_value_input_entered ::
                       (EditorSpinSlider :< cls, Object :< cls) =>
                       cls -> GodotString -> IO ()
_value_input_entered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider__value_input_entered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "_value_input_entered"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider._value_input_entered

{-# NOINLINE bindEditorSpinSlider_get_label #-}

bindEditorSpinSlider_get_label :: MethodBind
bindEditorSpinSlider_get_label
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "get_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_label ::
            (EditorSpinSlider :< cls, Object :< cls) => cls -> IO GodotString
get_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider_get_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "get_label" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Tools.EditorSpinSlider.get_label

{-# NOINLINE bindEditorSpinSlider_is_flat #-}

bindEditorSpinSlider_is_flat :: MethodBind
bindEditorSpinSlider_is_flat
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "is_flat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_flat ::
          (EditorSpinSlider :< cls, Object :< cls) => cls -> IO Bool
is_flat cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider_is_flat (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "is_flat" '[] (IO Bool) where
        nodeMethod = Godot.Tools.EditorSpinSlider.is_flat

{-# NOINLINE bindEditorSpinSlider_is_read_only #-}

bindEditorSpinSlider_is_read_only :: MethodBind
bindEditorSpinSlider_is_read_only
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "is_read_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_read_only ::
               (EditorSpinSlider :< cls, Object :< cls) => cls -> IO Bool
is_read_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider_is_read_only
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "is_read_only" '[] (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorSpinSlider.is_read_only

{-# NOINLINE bindEditorSpinSlider_set_flat #-}

bindEditorSpinSlider_set_flat :: MethodBind
bindEditorSpinSlider_set_flat
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "set_flat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_flat ::
           (EditorSpinSlider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flat cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider_set_flat (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "set_flat" '[Bool] (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider.set_flat

{-# NOINLINE bindEditorSpinSlider_set_label #-}

bindEditorSpinSlider_set_label :: MethodBind
bindEditorSpinSlider_set_label
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "set_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_label ::
            (EditorSpinSlider :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
set_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider_set_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "set_label" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider.set_label

{-# NOINLINE bindEditorSpinSlider_set_read_only #-}

bindEditorSpinSlider_set_read_only :: MethodBind
bindEditorSpinSlider_set_read_only
  = unsafePerformIO $
      withCString "EditorSpinSlider" $
        \ clsNamePtr ->
          withCString "set_read_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_read_only ::
                (EditorSpinSlider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_read_only cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpinSlider_set_read_only
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSpinSlider "set_read_only" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorSpinSlider.set_read_only