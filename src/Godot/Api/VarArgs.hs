module Godot.Api.VarArgs where

import Foreign.C (withCString)
import Godot.Internal.Dispatch
import System.IO.Unsafe (unsafePerformIO)
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

bindObject_emit_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "emit_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindObject_emit_signal #-}

instance Method "emit_signal" GodotObject (GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 varargs =
    withVariantArray
      ([toVariant arg1] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindObject_emit_signal (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindObject_call
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "call" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindObject_call #-}

instance Method "call" GodotObject (GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 varargs =
    withVariantArray
      ([toVariant arg1] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindObject_call (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindObject_call_deferred
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "call_deferred" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindObject_call_deferred #-}

instance Method "call_deferred" GodotObject (GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 varargs =
    withVariantArray
      ([toVariant arg1] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindObject_call_deferred (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindFuncRef_call_func
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "call_func" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindFuncRef_call_func #-}

instance Method "call_func" GodotFuncRef ([Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls varargs =
    withVariantArray
      varargs
      (\(arrPtr, len) ->
         godot_method_bind_call bindFuncRef_call_func (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindUndoRedo_add_do_method
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_do_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindUndoRedo_add_do_method #-}

instance Method "add_do_method" GodotUndoRedo (GodotObject -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 arg2 varargs =
    withVariantArray
      ([toVariant arg1, toVariant arg2] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call
           bindUndoRedo_add_do_method
           (safeCast cls)
           arrPtr
           len >>= \(err, res) -> throwIfErr err >> fromGodotVariant res)

bindUndoRedo_add_undo_method
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_undo_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindUndoRedo_add_undo_method #-}

instance Method "add_undo_method" GodotUndoRedo (GodotObject -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 arg2 varargs =
    withVariantArray
      ([toVariant arg1, toVariant arg2] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call
           bindUndoRedo_add_undo_method
           (safeCast cls)
           arrPtr
           len >>= \(err, res) -> throwIfErr err >> fromGodotVariant res)

bindNode_rpc
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindNode_rpc #-}

instance Method "rpc" GodotNode (GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 varargs =
    withVariantArray
      ([toVariant arg1] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindNode_rpc (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindNode_rpc_unreliable
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_unreliable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindNode_rpc_unreliable #-}

instance Method "rpc_unreliable" GodotNode (GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 varargs =
    withVariantArray
      ([toVariant arg1] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindNode_rpc_unreliable (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindNode_rpc_id
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindNode_rpc_id #-}

instance Method "rpc_id" GodotNode (Int -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 arg2 varargs =
    withVariantArray
      ([toVariant arg1, toVariant arg2] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindNode_rpc_id (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindNode_rpc_unreliable_id
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_unreliable_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindNode_rpc_unreliable_id #-}

instance Method "rpc_unreliable_id" GodotNode (Int -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 arg2 varargs =
    withVariantArray
      ([toVariant arg1, toVariant arg2] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call
           bindNode_rpc_unreliable_id
           (safeCast cls)
           arrPtr
           len >>= \(err, res) -> throwIfErr err >> fromGodotVariant res)

bindSceneTree_call_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "call_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindSceneTree_call_group_flags #-}

instance Method "call_group_flags" GodotSceneTree (Int -> GodotString -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 arg2 arg3 varargs =
    withVariantArray
      ([toVariant arg1, toVariant arg2, toVariant arg3] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call
           bindSceneTree_call_group_flags
           (safeCast cls)
           arrPtr
           len >>= \(err, res) -> throwIfErr err >> fromGodotVariant res)

bindSceneTree_call_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "call_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindSceneTree_call_group #-}

instance Method "call_group" GodotSceneTree (GodotString -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls arg1 arg2 varargs =
    withVariantArray
      ([toVariant arg1, toVariant arg2] ++ varargs)
      (\(arrPtr, len) ->
         godot_method_bind_call bindSceneTree_call_group (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindNativeScript_new
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "new" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindNativeScript_new #-}

instance Method "new" GodotNativeScript ([Variant 'GodotTy] -> IO GodotObject) where
  runMethod cls varargs =
    withVariantArray
      varargs
      (\(arrPtr, len) ->
         godot_method_bind_call bindNativeScript_new (safeCast cls) arrPtr len >>= \(err, res) ->
           throwIfErr err >> fromGodotVariant res)

bindGDScriptFunctionState__signal_callback
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "_signal_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

{-# NOINLINE bindGDScriptFunctionState__signal_callback #-}

instance Method "_signal_callback" GodotGDScriptFunctionState ([Variant 'GodotTy] -> IO GodotVariant) where
  runMethod cls varargs =
    withVariantArray
      varargs
      (\(arrPtr, len) ->
         godot_method_bind_call
           bindGDScriptFunctionState__signal_callback
           (safeCast cls)
           arrPtr
           len >>= \(err, res) -> throwIfErr err >> fromGodotVariant res)
