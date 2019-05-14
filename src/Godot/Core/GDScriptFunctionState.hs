{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GDScriptFunctionState
       (Godot.Core.GDScriptFunctionState.sig_completed,
        Godot.Core.GDScriptFunctionState.resume,
        Godot.Core.GDScriptFunctionState.is_valid,
        Godot.Core.GDScriptFunctionState._signal_callback)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_completed ::
              Godot.Internal.Dispatch.Signal GDScriptFunctionState
sig_completed = Godot.Internal.Dispatch.Signal "completed"

{-# NOINLINE bindGDScriptFunctionState_resume #-}

bindGDScriptFunctionState_resume :: MethodBind
bindGDScriptFunctionState_resume
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "resume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resume ::
         (GDScriptFunctionState :< cls, Object :< cls) =>
         cls -> GodotVariant -> IO GodotVariant
resume cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScriptFunctionState_resume
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGDScriptFunctionState_is_valid #-}

bindGDScriptFunctionState_is_valid :: MethodBind
bindGDScriptFunctionState_is_valid
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_valid ::
           (GDScriptFunctionState :< cls, Object :< cls) =>
           cls -> Bool -> IO Bool
is_valid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScriptFunctionState_is_valid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGDScriptFunctionState__signal_callback #-}

bindGDScriptFunctionState__signal_callback :: MethodBind
bindGDScriptFunctionState__signal_callback
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "_signal_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_signal_callback ::
                   (GDScriptFunctionState :< cls, Object :< cls) =>
                   cls -> [Variant 'GodotTy] -> IO GodotVariant
_signal_callback cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScriptFunctionState__signal_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)