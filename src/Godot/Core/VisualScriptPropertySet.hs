{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptPropertySet
       (Godot.Core.VisualScriptPropertySet._CALL_MODE_BASIC_TYPE,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_SHIFT_LEFT,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_DIV,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_MOD,
        Godot.Core.VisualScriptPropertySet._CALL_MODE_NODE_PATH,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_BIT_OR,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_SHIFT_RIGHT,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_NONE,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_ADD,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_MUL,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_SUB,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_BIT_AND,
        Godot.Core.VisualScriptPropertySet._CALL_MODE_SELF,
        Godot.Core.VisualScriptPropertySet._CALL_MODE_INSTANCE,
        Godot.Core.VisualScriptPropertySet._ASSIGN_OP_BIT_XOR,
        Godot.Core.VisualScriptPropertySet._get_type_cache,
        Godot.Core.VisualScriptPropertySet._set_type_cache,
        Godot.Core.VisualScriptPropertySet.get_assign_op,
        Godot.Core.VisualScriptPropertySet.get_base_path,
        Godot.Core.VisualScriptPropertySet.get_base_script,
        Godot.Core.VisualScriptPropertySet.get_base_type,
        Godot.Core.VisualScriptPropertySet.get_basic_type,
        Godot.Core.VisualScriptPropertySet.get_call_mode,
        Godot.Core.VisualScriptPropertySet.get_index,
        Godot.Core.VisualScriptPropertySet.get_property,
        Godot.Core.VisualScriptPropertySet.set_assign_op,
        Godot.Core.VisualScriptPropertySet.set_base_path,
        Godot.Core.VisualScriptPropertySet.set_base_script,
        Godot.Core.VisualScriptPropertySet.set_base_type,
        Godot.Core.VisualScriptPropertySet.set_basic_type,
        Godot.Core.VisualScriptPropertySet.set_call_mode,
        Godot.Core.VisualScriptPropertySet.set_index,
        Godot.Core.VisualScriptPropertySet.set_property)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CALL_MODE_BASIC_TYPE :: Int
_CALL_MODE_BASIC_TYPE = 3

_ASSIGN_OP_SHIFT_LEFT :: Int
_ASSIGN_OP_SHIFT_LEFT = 6

_ASSIGN_OP_DIV :: Int
_ASSIGN_OP_DIV = 4

_ASSIGN_OP_MOD :: Int
_ASSIGN_OP_MOD = 5

_CALL_MODE_NODE_PATH :: Int
_CALL_MODE_NODE_PATH = 1

_ASSIGN_OP_BIT_OR :: Int
_ASSIGN_OP_BIT_OR = 9

_ASSIGN_OP_SHIFT_RIGHT :: Int
_ASSIGN_OP_SHIFT_RIGHT = 7

_ASSIGN_OP_NONE :: Int
_ASSIGN_OP_NONE = 0

_ASSIGN_OP_ADD :: Int
_ASSIGN_OP_ADD = 1

_ASSIGN_OP_MUL :: Int
_ASSIGN_OP_MUL = 3

_ASSIGN_OP_SUB :: Int
_ASSIGN_OP_SUB = 2

_ASSIGN_OP_BIT_AND :: Int
_ASSIGN_OP_BIT_AND = 8

_CALL_MODE_SELF :: Int
_CALL_MODE_SELF = 0

_CALL_MODE_INSTANCE :: Int
_CALL_MODE_INSTANCE = 2

_ASSIGN_OP_BIT_XOR :: Int
_ASSIGN_OP_BIT_XOR = 10

{-# NOINLINE bindVisualScriptPropertySet__get_type_cache #-}

bindVisualScriptPropertySet__get_type_cache :: MethodBind
bindVisualScriptPropertySet__get_type_cache
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "_get_type_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_type_cache ::
                  (VisualScriptPropertySet :< cls, Object :< cls) =>
                  cls -> IO Dictionary
_get_type_cache cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet__get_type_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet__set_type_cache #-}

bindVisualScriptPropertySet__set_type_cache :: MethodBind
bindVisualScriptPropertySet__set_type_cache
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "_set_type_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_type_cache ::
                  (VisualScriptPropertySet :< cls, Object :< cls) =>
                  cls -> Dictionary -> IO ()
_set_type_cache cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet__set_type_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_assign_op #-}

bindVisualScriptPropertySet_get_assign_op :: MethodBind
bindVisualScriptPropertySet_get_assign_op
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_assign_op" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_assign_op ::
                (VisualScriptPropertySet :< cls, Object :< cls) => cls -> IO Int
get_assign_op cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_assign_op
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_base_path #-}

bindVisualScriptPropertySet_get_base_path :: MethodBind
bindVisualScriptPropertySet_get_base_path
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_path ::
                (VisualScriptPropertySet :< cls, Object :< cls) =>
                cls -> IO NodePath
get_base_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_base_script #-}

bindVisualScriptPropertySet_get_base_script :: MethodBind
bindVisualScriptPropertySet_get_base_script
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_script ::
                  (VisualScriptPropertySet :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_base_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_base_type #-}

bindVisualScriptPropertySet_get_base_type :: MethodBind
bindVisualScriptPropertySet_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptPropertySet :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_basic_type #-}

bindVisualScriptPropertySet_get_basic_type :: MethodBind
bindVisualScriptPropertySet_get_basic_type
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type ::
                 (VisualScriptPropertySet :< cls, Object :< cls) => cls -> IO Int
get_basic_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_call_mode #-}

bindVisualScriptPropertySet_get_call_mode :: MethodBind
bindVisualScriptPropertySet_get_call_mode
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_call_mode ::
                (VisualScriptPropertySet :< cls, Object :< cls) => cls -> IO Int
get_call_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_index #-}

bindVisualScriptPropertySet_get_index :: MethodBind
bindVisualScriptPropertySet_get_index
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_index ::
            (VisualScriptPropertySet :< cls, Object :< cls) =>
            cls -> IO GodotString
get_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_get_property #-}

bindVisualScriptPropertySet_get_property :: MethodBind
bindVisualScriptPropertySet_get_property
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "get_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_property ::
               (VisualScriptPropertySet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_property cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_get_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_assign_op #-}

bindVisualScriptPropertySet_set_assign_op :: MethodBind
bindVisualScriptPropertySet_set_assign_op
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_assign_op" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_assign_op ::
                (VisualScriptPropertySet :< cls, Object :< cls) =>
                cls -> Int -> IO ()
set_assign_op cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_assign_op
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_base_path #-}

bindVisualScriptPropertySet_set_base_path :: MethodBind
bindVisualScriptPropertySet_set_base_path
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_path ::
                (VisualScriptPropertySet :< cls, Object :< cls) =>
                cls -> NodePath -> IO ()
set_base_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_base_script #-}

bindVisualScriptPropertySet_set_base_script :: MethodBind
bindVisualScriptPropertySet_set_base_script
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_script ::
                  (VisualScriptPropertySet :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_base_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_base_type #-}

bindVisualScriptPropertySet_set_base_type :: MethodBind
bindVisualScriptPropertySet_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptPropertySet :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_basic_type #-}

bindVisualScriptPropertySet_set_basic_type :: MethodBind
bindVisualScriptPropertySet_set_basic_type
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type ::
                 (VisualScriptPropertySet :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_basic_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_call_mode #-}

bindVisualScriptPropertySet_set_call_mode :: MethodBind
bindVisualScriptPropertySet_set_call_mode
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_call_mode ::
                (VisualScriptPropertySet :< cls, Object :< cls) =>
                cls -> Int -> IO ()
set_call_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_index #-}

bindVisualScriptPropertySet_set_index :: MethodBind
bindVisualScriptPropertySet_set_index
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_index ::
            (VisualScriptPropertySet :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
set_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPropertySet_set_property #-}

bindVisualScriptPropertySet_set_property :: MethodBind
bindVisualScriptPropertySet_set_property
  = unsafePerformIO $
      withCString "VisualScriptPropertySet" $
        \ clsNamePtr ->
          withCString "set_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_property ::
               (VisualScriptPropertySet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_property cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPropertySet_set_property
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)