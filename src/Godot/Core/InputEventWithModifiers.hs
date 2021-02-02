{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InputEventWithModifiers
       (Godot.Core.InputEventWithModifiers.get_alt,
        Godot.Core.InputEventWithModifiers.get_command,
        Godot.Core.InputEventWithModifiers.get_control,
        Godot.Core.InputEventWithModifiers.get_metakey,
        Godot.Core.InputEventWithModifiers.get_shift,
        Godot.Core.InputEventWithModifiers.set_alt,
        Godot.Core.InputEventWithModifiers.set_command,
        Godot.Core.InputEventWithModifiers.set_control,
        Godot.Core.InputEventWithModifiers.set_metakey,
        Godot.Core.InputEventWithModifiers.set_shift)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInputEventWithModifiers_get_alt #-}

-- | State of the [code]Alt[/code] modifier.
bindInputEventWithModifiers_get_alt :: MethodBind
bindInputEventWithModifiers_get_alt
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "get_alt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Alt[/code] modifier.
get_alt ::
          (InputEventWithModifiers :< cls, Object :< cls) => cls -> IO Bool
get_alt cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_get_alt
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_get_command #-}

-- | State of the [code]Command[/code] modifier.
bindInputEventWithModifiers_get_command :: MethodBind
bindInputEventWithModifiers_get_command
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "get_command" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Command[/code] modifier.
get_command ::
              (InputEventWithModifiers :< cls, Object :< cls) => cls -> IO Bool
get_command cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_get_command
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_get_control #-}

-- | State of the [code]Ctrl[/code] modifier.
bindInputEventWithModifiers_get_control :: MethodBind
bindInputEventWithModifiers_get_control
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "get_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Ctrl[/code] modifier.
get_control ::
              (InputEventWithModifiers :< cls, Object :< cls) => cls -> IO Bool
get_control cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_get_control
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_get_metakey #-}

-- | State of the [code]Meta[/code] modifier.
bindInputEventWithModifiers_get_metakey :: MethodBind
bindInputEventWithModifiers_get_metakey
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "get_metakey" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Meta[/code] modifier.
get_metakey ::
              (InputEventWithModifiers :< cls, Object :< cls) => cls -> IO Bool
get_metakey cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_get_metakey
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_get_shift #-}

-- | State of the [code]Shift[/code] modifier.
bindInputEventWithModifiers_get_shift :: MethodBind
bindInputEventWithModifiers_get_shift
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "get_shift" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Shift[/code] modifier.
get_shift ::
            (InputEventWithModifiers :< cls, Object :< cls) => cls -> IO Bool
get_shift cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_get_shift
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_set_alt #-}

-- | State of the [code]Alt[/code] modifier.
bindInputEventWithModifiers_set_alt :: MethodBind
bindInputEventWithModifiers_set_alt
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "set_alt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Alt[/code] modifier.
set_alt ::
          (InputEventWithModifiers :< cls, Object :< cls) =>
          cls -> Bool -> IO ()
set_alt cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_set_alt
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_set_command #-}

-- | State of the [code]Command[/code] modifier.
bindInputEventWithModifiers_set_command :: MethodBind
bindInputEventWithModifiers_set_command
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "set_command" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Command[/code] modifier.
set_command ::
              (InputEventWithModifiers :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_command cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_set_command
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_set_control #-}

-- | State of the [code]Ctrl[/code] modifier.
bindInputEventWithModifiers_set_control :: MethodBind
bindInputEventWithModifiers_set_control
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "set_control" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Ctrl[/code] modifier.
set_control ::
              (InputEventWithModifiers :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_control cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_set_control
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_set_metakey #-}

-- | State of the [code]Meta[/code] modifier.
bindInputEventWithModifiers_set_metakey :: MethodBind
bindInputEventWithModifiers_set_metakey
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "set_metakey" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Meta[/code] modifier.
set_metakey ::
              (InputEventWithModifiers :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_metakey cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_set_metakey
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInputEventWithModifiers_set_shift #-}

-- | State of the [code]Shift[/code] modifier.
bindInputEventWithModifiers_set_shift :: MethodBind
bindInputEventWithModifiers_set_shift
  = unsafePerformIO $
      withCString "InputEventWithModifiers" $
        \ clsNamePtr ->
          withCString "set_shift" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | State of the [code]Shift[/code] modifier.
set_shift ::
            (InputEventWithModifiers :< cls, Object :< cls) =>
            cls -> Bool -> IO ()
set_shift cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventWithModifiers_set_shift
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)