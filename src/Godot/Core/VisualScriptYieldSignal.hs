{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptYieldSignal
       (Godot.Core.VisualScriptYieldSignal._CALL_MODE_NODE_PATH,
        Godot.Core.VisualScriptYieldSignal._CALL_MODE_SELF,
        Godot.Core.VisualScriptYieldSignal._CALL_MODE_INSTANCE,
        Godot.Core.VisualScriptYieldSignal.get_base_path,
        Godot.Core.VisualScriptYieldSignal.get_base_type,
        Godot.Core.VisualScriptYieldSignal.get_call_mode,
        Godot.Core.VisualScriptYieldSignal.get_signal,
        Godot.Core.VisualScriptYieldSignal.set_base_path,
        Godot.Core.VisualScriptYieldSignal.set_base_type,
        Godot.Core.VisualScriptYieldSignal.set_call_mode,
        Godot.Core.VisualScriptYieldSignal.set_signal)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CALL_MODE_NODE_PATH :: Int
_CALL_MODE_NODE_PATH = 1

_CALL_MODE_SELF :: Int
_CALL_MODE_SELF = 0

_CALL_MODE_INSTANCE :: Int
_CALL_MODE_INSTANCE = 2

{-# NOINLINE bindVisualScriptYieldSignal_get_base_path #-}

bindVisualScriptYieldSignal_get_base_path :: MethodBind
bindVisualScriptYieldSignal_get_base_path
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "get_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_path ::
                (VisualScriptYieldSignal :< cls, Object :< cls) =>
                cls -> IO NodePath
get_base_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_get_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_get_base_type #-}

bindVisualScriptYieldSignal_get_base_type :: MethodBind
bindVisualScriptYieldSignal_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptYieldSignal :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_get_call_mode #-}

bindVisualScriptYieldSignal_get_call_mode :: MethodBind
bindVisualScriptYieldSignal_get_call_mode
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "get_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_call_mode ::
                (VisualScriptYieldSignal :< cls, Object :< cls) => cls -> IO Int
get_call_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_get_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_get_signal #-}

bindVisualScriptYieldSignal_get_signal :: MethodBind
bindVisualScriptYieldSignal_get_signal
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "get_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_signal ::
             (VisualScriptYieldSignal :< cls, Object :< cls) =>
             cls -> IO GodotString
get_signal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_get_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_set_base_path #-}

bindVisualScriptYieldSignal_set_base_path :: MethodBind
bindVisualScriptYieldSignal_set_base_path
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "set_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_path ::
                (VisualScriptYieldSignal :< cls, Object :< cls) =>
                cls -> NodePath -> IO ()
set_base_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_set_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_set_base_type #-}

bindVisualScriptYieldSignal_set_base_type :: MethodBind
bindVisualScriptYieldSignal_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptYieldSignal :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_set_call_mode #-}

bindVisualScriptYieldSignal_set_call_mode :: MethodBind
bindVisualScriptYieldSignal_set_call_mode
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "set_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_call_mode ::
                (VisualScriptYieldSignal :< cls, Object :< cls) =>
                cls -> Int -> IO ()
set_call_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_set_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptYieldSignal_set_signal #-}

bindVisualScriptYieldSignal_set_signal :: MethodBind
bindVisualScriptYieldSignal_set_signal
  = unsafePerformIO $
      withCString "VisualScriptYieldSignal" $
        \ clsNamePtr ->
          withCString "set_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_signal ::
             (VisualScriptYieldSignal :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYieldSignal_set_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)