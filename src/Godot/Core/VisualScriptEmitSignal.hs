{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptEmitSignal
       (Godot.Core.VisualScriptEmitSignal.get_signal,
        Godot.Core.VisualScriptEmitSignal.set_signal)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptEmitSignal_get_signal #-}

bindVisualScriptEmitSignal_get_signal :: MethodBind
bindVisualScriptEmitSignal_get_signal
  = unsafePerformIO $
      withCString "VisualScriptEmitSignal" $
        \ clsNamePtr ->
          withCString "get_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_signal ::
             (VisualScriptEmitSignal :< cls, Object :< cls) =>
             cls -> IO GodotString
get_signal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptEmitSignal_get_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptEmitSignal_set_signal #-}

bindVisualScriptEmitSignal_set_signal :: MethodBind
bindVisualScriptEmitSignal_set_signal
  = unsafePerformIO $
      withCString "VisualScriptEmitSignal" $
        \ clsNamePtr ->
          withCString "set_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_signal ::
             (VisualScriptEmitSignal :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptEmitSignal_set_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)