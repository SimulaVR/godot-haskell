{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.WindowDialog
       (Godot.Core.WindowDialog._gui_input,
        Godot.Core.WindowDialog.set_title,
        Godot.Core.WindowDialog.get_title,
        Godot.Core.WindowDialog.set_resizable,
        Godot.Core.WindowDialog.get_resizable,
        Godot.Core.WindowDialog._closed,
        Godot.Core.WindowDialog.get_close_button)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindWindowDialog__gui_input #-}

bindWindowDialog__gui_input :: MethodBind
bindWindowDialog__gui_input
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (WindowDialog :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWindowDialog_set_title #-}

-- | The text displayed in the window's title bar.
bindWindowDialog_set_title :: MethodBind
bindWindowDialog_set_title
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "set_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed in the window's title bar.
set_title ::
            (WindowDialog :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog_set_title (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWindowDialog_get_title #-}

-- | The text displayed in the window's title bar.
bindWindowDialog_get_title :: MethodBind
bindWindowDialog_get_title
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "get_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed in the window's title bar.
get_title ::
            (WindowDialog :< cls, Object :< cls) => cls -> IO GodotString
get_title cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog_get_title (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWindowDialog_set_resizable #-}

-- | If [code]true[/code], the user can resize the window. Default value: [code]false[/code].
bindWindowDialog_set_resizable :: MethodBind
bindWindowDialog_set_resizable
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "set_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the user can resize the window. Default value: [code]false[/code].
set_resizable ::
                (WindowDialog :< cls, Object :< cls) => cls -> Bool -> IO ()
set_resizable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog_set_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWindowDialog_get_resizable #-}

-- | If [code]true[/code], the user can resize the window. Default value: [code]false[/code].
bindWindowDialog_get_resizable :: MethodBind
bindWindowDialog_get_resizable
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "get_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the user can resize the window. Default value: [code]false[/code].
get_resizable ::
                (WindowDialog :< cls, Object :< cls) => cls -> IO Bool
get_resizable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog_get_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWindowDialog__closed #-}

bindWindowDialog__closed :: MethodBind
bindWindowDialog__closed
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "_closed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_closed :: (WindowDialog :< cls, Object :< cls) => cls -> IO ()
_closed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog__closed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWindowDialog_get_close_button #-}

-- | Return the close [TextureButton].
bindWindowDialog_get_close_button :: MethodBind
bindWindowDialog_get_close_button
  = unsafePerformIO $
      withCString "WindowDialog" $
        \ clsNamePtr ->
          withCString "get_close_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the close [TextureButton].
get_close_button ::
                   (WindowDialog :< cls, Object :< cls) => cls -> IO TextureButton
get_close_button cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWindowDialog_get_close_button
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)