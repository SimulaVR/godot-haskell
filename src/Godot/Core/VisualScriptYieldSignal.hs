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

_CALL_MODE_SELF :: Int
_CALL_MODE_SELF = 0

_CALL_MODE_INSTANCE :: Int
_CALL_MODE_INSTANCE = 2

instance NodeProperty VisualScriptYieldSignal "base_type"
           GodotString
           'False
         where
        nodeProperty
          = (get_base_type, wrapDroppingSetter set_base_type, Nothing)

instance NodeProperty VisualScriptYieldSignal "call_mode" Int
           'False
         where
        nodeProperty
          = (get_call_mode, wrapDroppingSetter set_call_mode, Nothing)

instance NodeProperty VisualScriptYieldSignal "node_path" NodePath
           'False
         where
        nodeProperty
          = (get_base_path, wrapDroppingSetter set_base_path, Nothing)

instance NodeProperty VisualScriptYieldSignal "signal" GodotString
           'False
         where
        nodeProperty = (get_signal, wrapDroppingSetter set_signal, Nothing)

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

instance NodeMethod VisualScriptYieldSignal "get_base_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.get_base_path

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

instance NodeMethod VisualScriptYieldSignal "get_base_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.get_base_type

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

instance NodeMethod VisualScriptYieldSignal "get_call_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.get_call_mode

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

instance NodeMethod VisualScriptYieldSignal "get_signal" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.get_signal

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

instance NodeMethod VisualScriptYieldSignal "set_base_path"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.set_base_path

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

instance NodeMethod VisualScriptYieldSignal "set_base_type"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.set_base_type

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

instance NodeMethod VisualScriptYieldSignal "set_call_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.set_call_mode

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

instance NodeMethod VisualScriptYieldSignal "set_signal"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptYieldSignal.set_signal