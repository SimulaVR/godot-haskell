{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptFunctionCall
       (Godot.Core.VisualScriptFunctionCall._CALL_MODE_BASIC_TYPE,
        Godot.Core.VisualScriptFunctionCall._RPC_UNRELIABLE_TO_ID,
        Godot.Core.VisualScriptFunctionCall._CALL_MODE_NODE_PATH,
        Godot.Core.VisualScriptFunctionCall._RPC_UNRELIABLE,
        Godot.Core.VisualScriptFunctionCall._CALL_MODE_SELF,
        Godot.Core.VisualScriptFunctionCall._RPC_RELIABLE_TO_ID,
        Godot.Core.VisualScriptFunctionCall._CALL_MODE_INSTANCE,
        Godot.Core.VisualScriptFunctionCall._CALL_MODE_SINGLETON,
        Godot.Core.VisualScriptFunctionCall._RPC_DISABLED,
        Godot.Core.VisualScriptFunctionCall._RPC_RELIABLE,
        Godot.Core.VisualScriptFunctionCall.set_base_type,
        Godot.Core.VisualScriptFunctionCall.get_base_type,
        Godot.Core.VisualScriptFunctionCall.set_base_script,
        Godot.Core.VisualScriptFunctionCall.get_base_script,
        Godot.Core.VisualScriptFunctionCall.set_basic_type,
        Godot.Core.VisualScriptFunctionCall.get_basic_type,
        Godot.Core.VisualScriptFunctionCall.set_singleton,
        Godot.Core.VisualScriptFunctionCall.get_singleton,
        Godot.Core.VisualScriptFunctionCall.set_function,
        Godot.Core.VisualScriptFunctionCall.get_function,
        Godot.Core.VisualScriptFunctionCall.set_call_mode,
        Godot.Core.VisualScriptFunctionCall.get_call_mode,
        Godot.Core.VisualScriptFunctionCall.set_base_path,
        Godot.Core.VisualScriptFunctionCall.get_base_path,
        Godot.Core.VisualScriptFunctionCall.set_use_default_args,
        Godot.Core.VisualScriptFunctionCall.get_use_default_args,
        Godot.Core.VisualScriptFunctionCall._set_argument_cache,
        Godot.Core.VisualScriptFunctionCall._get_argument_cache,
        Godot.Core.VisualScriptFunctionCall.set_rpc_call_mode,
        Godot.Core.VisualScriptFunctionCall.get_rpc_call_mode,
        Godot.Core.VisualScriptFunctionCall.set_validate,
        Godot.Core.VisualScriptFunctionCall.get_validate)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CALL_MODE_BASIC_TYPE :: Int
_CALL_MODE_BASIC_TYPE = 3

_RPC_UNRELIABLE_TO_ID :: Int
_RPC_UNRELIABLE_TO_ID = 4

_CALL_MODE_NODE_PATH :: Int
_CALL_MODE_NODE_PATH = 1

_RPC_UNRELIABLE :: Int
_RPC_UNRELIABLE = 2

_CALL_MODE_SELF :: Int
_CALL_MODE_SELF = 0

_RPC_RELIABLE_TO_ID :: Int
_RPC_RELIABLE_TO_ID = 3

_CALL_MODE_INSTANCE :: Int
_CALL_MODE_INSTANCE = 2

_CALL_MODE_SINGLETON :: Int
_CALL_MODE_SINGLETON = 4

_RPC_DISABLED :: Int
_RPC_DISABLED = 0

_RPC_RELIABLE :: Int
_RPC_RELIABLE = 1

{-# NOINLINE bindVisualScriptFunctionCall_set_base_type #-}

bindVisualScriptFunctionCall_set_base_type :: MethodBind
bindVisualScriptFunctionCall_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_base_type #-}

bindVisualScriptFunctionCall_get_base_type :: MethodBind
bindVisualScriptFunctionCall_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_base_script #-}

bindVisualScriptFunctionCall_set_base_script :: MethodBind
bindVisualScriptFunctionCall_set_base_script
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_script ::
                  (VisualScriptFunctionCall :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_base_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_base_script #-}

bindVisualScriptFunctionCall_get_base_script :: MethodBind
bindVisualScriptFunctionCall_get_base_script
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_script ::
                  (VisualScriptFunctionCall :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_base_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_basic_type #-}

bindVisualScriptFunctionCall_set_basic_type :: MethodBind
bindVisualScriptFunctionCall_set_basic_type
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type ::
                 (VisualScriptFunctionCall :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_basic_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_basic_type #-}

bindVisualScriptFunctionCall_get_basic_type :: MethodBind
bindVisualScriptFunctionCall_get_basic_type
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type ::
                 (VisualScriptFunctionCall :< cls, Object :< cls) => cls -> IO Int
get_basic_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_singleton #-}

bindVisualScriptFunctionCall_set_singleton :: MethodBind
bindVisualScriptFunctionCall_set_singleton
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_singleton ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_singleton #-}

bindVisualScriptFunctionCall_get_singleton :: MethodBind
bindVisualScriptFunctionCall_get_singleton
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_singleton ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> IO GodotString
get_singleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_function #-}

bindVisualScriptFunctionCall_set_function :: MethodBind
bindVisualScriptFunctionCall_set_function
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_function ::
               (VisualScriptFunctionCall :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_function #-}

bindVisualScriptFunctionCall_get_function :: MethodBind
bindVisualScriptFunctionCall_get_function
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_function ::
               (VisualScriptFunctionCall :< cls, Object :< cls) =>
               cls -> IO GodotString
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_call_mode #-}

bindVisualScriptFunctionCall_set_call_mode :: MethodBind
bindVisualScriptFunctionCall_set_call_mode
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_call_mode ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> Int -> IO ()
set_call_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_call_mode #-}

bindVisualScriptFunctionCall_get_call_mode :: MethodBind
bindVisualScriptFunctionCall_get_call_mode
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_call_mode ::
                (VisualScriptFunctionCall :< cls, Object :< cls) => cls -> IO Int
get_call_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_base_path #-}

bindVisualScriptFunctionCall_set_base_path :: MethodBind
bindVisualScriptFunctionCall_set_base_path
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_path ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> NodePath -> IO ()
set_base_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_base_path #-}

bindVisualScriptFunctionCall_get_base_path :: MethodBind
bindVisualScriptFunctionCall_get_base_path
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_path ::
                (VisualScriptFunctionCall :< cls, Object :< cls) =>
                cls -> IO NodePath
get_base_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_use_default_args #-}

bindVisualScriptFunctionCall_set_use_default_args :: MethodBind
bindVisualScriptFunctionCall_set_use_default_args
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_use_default_args" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_default_args ::
                       (VisualScriptFunctionCall :< cls, Object :< cls) =>
                       cls -> Int -> IO ()
set_use_default_args cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionCall_set_use_default_args
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_use_default_args #-}

bindVisualScriptFunctionCall_get_use_default_args :: MethodBind
bindVisualScriptFunctionCall_get_use_default_args
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_use_default_args" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_use_default_args ::
                       (VisualScriptFunctionCall :< cls, Object :< cls) => cls -> IO Int
get_use_default_args cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionCall_get_use_default_args
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall__set_argument_cache #-}

bindVisualScriptFunctionCall__set_argument_cache :: MethodBind
bindVisualScriptFunctionCall__set_argument_cache
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "_set_argument_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_argument_cache ::
                      (VisualScriptFunctionCall :< cls, Object :< cls) =>
                      cls -> Dictionary -> IO ()
_set_argument_cache cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionCall__set_argument_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall__get_argument_cache #-}

bindVisualScriptFunctionCall__get_argument_cache :: MethodBind
bindVisualScriptFunctionCall__get_argument_cache
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "_get_argument_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_argument_cache ::
                      (VisualScriptFunctionCall :< cls, Object :< cls) =>
                      cls -> IO Dictionary
_get_argument_cache cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionCall__get_argument_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_rpc_call_mode #-}

bindVisualScriptFunctionCall_set_rpc_call_mode :: MethodBind
bindVisualScriptFunctionCall_set_rpc_call_mode
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_rpc_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rpc_call_mode ::
                    (VisualScriptFunctionCall :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
set_rpc_call_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionCall_set_rpc_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_rpc_call_mode #-}

bindVisualScriptFunctionCall_get_rpc_call_mode :: MethodBind
bindVisualScriptFunctionCall_get_rpc_call_mode
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_rpc_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rpc_call_mode ::
                    (VisualScriptFunctionCall :< cls, Object :< cls) => cls -> IO Int
get_rpc_call_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionCall_get_rpc_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_set_validate #-}

bindVisualScriptFunctionCall_set_validate :: MethodBind
bindVisualScriptFunctionCall_set_validate
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "set_validate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_validate ::
               (VisualScriptFunctionCall :< cls, Object :< cls) =>
               cls -> Bool -> IO ()
set_validate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_set_validate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionCall_get_validate #-}

bindVisualScriptFunctionCall_get_validate :: MethodBind
bindVisualScriptFunctionCall_get_validate
  = unsafePerformIO $
      withCString "VisualScriptFunctionCall" $
        \ clsNamePtr ->
          withCString "get_validate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_validate ::
               (VisualScriptFunctionCall :< cls, Object :< cls) => cls -> IO Bool
get_validate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionCall_get_validate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)