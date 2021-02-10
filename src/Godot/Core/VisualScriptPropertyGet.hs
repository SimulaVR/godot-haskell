{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptPropertyGet
       (Godot.Core.VisualScriptPropertyGet._CALL_MODE_NODE_PATH,
        Godot.Core.VisualScriptPropertyGet._CALL_MODE_SELF,
        Godot.Core.VisualScriptPropertyGet._CALL_MODE_INSTANCE,
        Godot.Core.VisualScriptPropertyGet._get_type_cache,
        Godot.Core.VisualScriptPropertyGet._set_type_cache,
        Godot.Core.VisualScriptPropertyGet.get_base_path,
        Godot.Core.VisualScriptPropertyGet.get_base_script,
        Godot.Core.VisualScriptPropertyGet.get_base_type,
        Godot.Core.VisualScriptPropertyGet.get_basic_type,
        Godot.Core.VisualScriptPropertyGet.get_call_mode,
        Godot.Core.VisualScriptPropertyGet.get_index,
        Godot.Core.VisualScriptPropertyGet.get_property,
        Godot.Core.VisualScriptPropertyGet.set_base_path,
        Godot.Core.VisualScriptPropertyGet.set_base_script,
        Godot.Core.VisualScriptPropertyGet.set_base_type,
        Godot.Core.VisualScriptPropertyGet.set_basic_type,
        Godot.Core.VisualScriptPropertyGet.set_call_mode,
        Godot.Core.VisualScriptPropertyGet.set_index,
        Godot.Core.VisualScriptPropertyGet.set_property)
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

{-# NOINLINE bindVisualScriptPropertyGet__get_type_cache #-}

bindVisualScriptPropertyGet__get_type_cache :: MethodBind
bindVisualScriptPropertyGet__get_type_cache
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "_get_type_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_type_cache ::
                  (VisualScriptPropertyGet :< cls, Object :< cls) => cls -> IO Int
_get_type_cache cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet__get_type_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet__set_type_cache #-}

bindVisualScriptPropertyGet__set_type_cache :: MethodBind
bindVisualScriptPropertyGet__set_type_cache
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "_set_type_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_type_cache ::
                  (VisualScriptPropertyGet :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
_set_type_cache cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet__set_type_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_base_path #-}

bindVisualScriptPropertyGet_get_base_path :: MethodBind
bindVisualScriptPropertyGet_get_base_path
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_path ::
                (VisualScriptPropertyGet :< cls, Object :< cls) =>
                cls -> IO NodePath
get_base_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_base_script #-}

bindVisualScriptPropertyGet_get_base_script :: MethodBind
bindVisualScriptPropertyGet_get_base_script
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_script ::
                  (VisualScriptPropertyGet :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_base_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_base_type #-}

bindVisualScriptPropertyGet_get_base_type :: MethodBind
bindVisualScriptPropertyGet_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptPropertyGet :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_basic_type #-}

bindVisualScriptPropertyGet_get_basic_type :: MethodBind
bindVisualScriptPropertyGet_get_basic_type
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type ::
                 (VisualScriptPropertyGet :< cls, Object :< cls) => cls -> IO Int
get_basic_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_call_mode #-}

bindVisualScriptPropertyGet_get_call_mode :: MethodBind
bindVisualScriptPropertyGet_get_call_mode
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_call_mode ::
                (VisualScriptPropertyGet :< cls, Object :< cls) => cls -> IO Int
get_call_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_index #-}

bindVisualScriptPropertyGet_get_index :: MethodBind
bindVisualScriptPropertyGet_get_index
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_index ::
            (VisualScriptPropertyGet :< cls, Object :< cls) =>
            cls -> IO GodotString
get_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_get_property #-}

bindVisualScriptPropertyGet_get_property :: MethodBind
bindVisualScriptPropertyGet_get_property
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "get_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_property ::
               (VisualScriptPropertyGet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_property cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_get_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_base_path #-}

bindVisualScriptPropertyGet_set_base_path :: MethodBind
bindVisualScriptPropertyGet_set_base_path
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_path ::
                (VisualScriptPropertyGet :< cls, Object :< cls) =>
                cls -> NodePath -> IO ()
set_base_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_base_script #-}

bindVisualScriptPropertyGet_set_base_script :: MethodBind
bindVisualScriptPropertyGet_set_base_script
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_script ::
                  (VisualScriptPropertyGet :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_base_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_base_type #-}

bindVisualScriptPropertyGet_set_base_type :: MethodBind
bindVisualScriptPropertyGet_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptPropertyGet :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_basic_type #-}

bindVisualScriptPropertyGet_set_basic_type :: MethodBind
bindVisualScriptPropertyGet_set_basic_type
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type ::
                 (VisualScriptPropertyGet :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_basic_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_call_mode #-}

bindVisualScriptPropertyGet_set_call_mode :: MethodBind
bindVisualScriptPropertyGet_set_call_mode
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_call_mode ::
                (VisualScriptPropertyGet :< cls, Object :< cls) =>
                cls -> Int -> IO ()
set_call_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_index #-}

bindVisualScriptPropertyGet_set_index :: MethodBind
bindVisualScriptPropertyGet_set_index
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_index ::
            (VisualScriptPropertyGet :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
set_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertyGet_set_property #-}

bindVisualScriptPropertyGet_set_property :: MethodBind
bindVisualScriptPropertyGet_set_property
  = unsafePerformIO $
      withCString "VisualScriptPropertyGet" $
        \ clsNamePtr ->
          withCString "set_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_property ::
               (VisualScriptPropertyGet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_property cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertyGet_set_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)