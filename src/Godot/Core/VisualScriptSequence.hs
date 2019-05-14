{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptSequence
       (Godot.Core.VisualScriptSequence.set_steps,
        Godot.Core.VisualScriptSequence.get_steps)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptSequence_set_steps #-}

bindVisualScriptSequence_set_steps :: MethodBind
bindVisualScriptSequence_set_steps
  = unsafePerformIO $
      withCString "VisualScriptSequence" $
        \ clsNamePtr ->
          withCString "set_steps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_steps ::
            (VisualScriptSequence :< cls, Object :< cls) => cls -> Int -> IO ()
set_steps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSequence_set_steps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptSequence_get_steps #-}

bindVisualScriptSequence_get_steps :: MethodBind
bindVisualScriptSequence_get_steps
  = unsafePerformIO $
      withCString "VisualScriptSequence" $
        \ clsNamePtr ->
          withCString "get_steps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_steps ::
            (VisualScriptSequence :< cls, Object :< cls) => cls -> IO Int
get_steps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSequence_get_steps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)