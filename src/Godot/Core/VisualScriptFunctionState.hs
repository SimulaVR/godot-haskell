{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptFunctionState
       (Godot.Core.VisualScriptFunctionState.connect_to_signal,
        Godot.Core.VisualScriptFunctionState.resume,
        Godot.Core.VisualScriptFunctionState.is_valid,
        Godot.Core.VisualScriptFunctionState._signal_callback)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptFunctionState_connect_to_signal #-}

bindVisualScriptFunctionState_connect_to_signal :: MethodBind
bindVisualScriptFunctionState_connect_to_signal
  = unsafePerformIO $
      withCString "VisualScriptFunctionState" $
        \ clsNamePtr ->
          withCString "connect_to_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

connect_to_signal ::
                    (VisualScriptFunctionState :< cls, Object :< cls) =>
                    cls -> Object -> GodotString -> Array -> IO ()
connect_to_signal cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionState_connect_to_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionState_resume #-}

bindVisualScriptFunctionState_resume :: MethodBind
bindVisualScriptFunctionState_resume
  = unsafePerformIO $
      withCString "VisualScriptFunctionState" $
        \ clsNamePtr ->
          withCString "resume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resume ::
         (VisualScriptFunctionState :< cls, Object :< cls) =>
         cls -> Array -> IO GodotVariant
resume cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionState_resume
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionState_is_valid #-}

bindVisualScriptFunctionState_is_valid :: MethodBind
bindVisualScriptFunctionState_is_valid
  = unsafePerformIO $
      withCString "VisualScriptFunctionState" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_valid ::
           (VisualScriptFunctionState :< cls, Object :< cls) => cls -> IO Bool
is_valid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptFunctionState_is_valid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptFunctionState__signal_callback #-}

bindVisualScriptFunctionState__signal_callback :: MethodBind
bindVisualScriptFunctionState__signal_callback
  = unsafePerformIO $
      withCString "VisualScriptFunctionState" $
        \ clsNamePtr ->
          withCString "_signal_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_signal_callback ::
                   (VisualScriptFunctionState :< cls, Object :< cls) =>
                   cls -> [Variant 'GodotTy] -> IO GodotVariant
_signal_callback cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptFunctionState__signal_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)