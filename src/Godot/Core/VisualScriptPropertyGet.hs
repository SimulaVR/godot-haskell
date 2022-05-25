{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptPropertyGet
       (Godot.Core.VisualScriptPropertyGet._CALL_MODE_NODE_PATH,
        Godot.Core.VisualScriptPropertyGet._CALL_MODE_INSTANCE,
        Godot.Core.VisualScriptPropertyGet._CALL_MODE_SELF,
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.VisualScriptNode()

_CALL_MODE_NODE_PATH :: Int
_CALL_MODE_NODE_PATH = 1

_CALL_MODE_INSTANCE :: Int
_CALL_MODE_INSTANCE = 2

_CALL_MODE_SELF :: Int
_CALL_MODE_SELF = 0

instance NodeProperty VisualScriptPropertyGet "base_script"
           GodotString
           'False
         where
        nodeProperty
          = (get_base_script, wrapDroppingSetter set_base_script, Nothing)

instance NodeProperty VisualScriptPropertyGet "base_type"
           GodotString
           'False
         where
        nodeProperty
          = (get_base_type, wrapDroppingSetter set_base_type, Nothing)

instance NodeProperty VisualScriptPropertyGet "basic_type" Int
           'False
         where
        nodeProperty
          = (get_basic_type, wrapDroppingSetter set_basic_type, Nothing)

instance NodeProperty VisualScriptPropertyGet "index" GodotString
           'False
         where
        nodeProperty = (get_index, wrapDroppingSetter set_index, Nothing)

instance NodeProperty VisualScriptPropertyGet "node_path" NodePath
           'False
         where
        nodeProperty
          = (get_base_path, wrapDroppingSetter set_base_path, Nothing)

instance NodeProperty VisualScriptPropertyGet "property"
           GodotString
           'False
         where
        nodeProperty
          = (get_property, wrapDroppingSetter set_property, Nothing)

instance NodeProperty VisualScriptPropertyGet "set_mode" Int 'False
         where
        nodeProperty
          = (get_call_mode, wrapDroppingSetter set_call_mode, Nothing)

instance NodeProperty VisualScriptPropertyGet "type_cache" Int
           'False
         where
        nodeProperty
          = (_get_type_cache, wrapDroppingSetter _set_type_cache, Nothing)

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

instance NodeMethod VisualScriptPropertyGet "_get_type_cache" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet._get_type_cache

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

instance NodeMethod VisualScriptPropertyGet "_set_type_cache"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet._set_type_cache

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

instance NodeMethod VisualScriptPropertyGet "get_base_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_base_path

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

instance NodeMethod VisualScriptPropertyGet "get_base_script" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_base_script

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

instance NodeMethod VisualScriptPropertyGet "get_base_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_base_type

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

instance NodeMethod VisualScriptPropertyGet "get_basic_type" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_basic_type

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

instance NodeMethod VisualScriptPropertyGet "get_call_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_call_mode

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

instance NodeMethod VisualScriptPropertyGet "get_index" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_index

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

instance NodeMethod VisualScriptPropertyGet "get_property" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.get_property

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

instance NodeMethod VisualScriptPropertyGet "set_base_path"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_base_path

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

instance NodeMethod VisualScriptPropertyGet "set_base_script"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_base_script

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

instance NodeMethod VisualScriptPropertyGet "set_base_type"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_base_type

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

instance NodeMethod VisualScriptPropertyGet "set_basic_type" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_basic_type

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

instance NodeMethod VisualScriptPropertyGet "set_call_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_call_mode

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

instance NodeMethod VisualScriptPropertyGet "set_index"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_index

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

instance NodeMethod VisualScriptPropertyGet "set_property"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptPropertyGet.set_property