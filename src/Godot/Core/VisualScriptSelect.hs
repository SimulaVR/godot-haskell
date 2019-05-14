{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptSelect
       (Godot.Core.VisualScriptSelect.set_typed,
        Godot.Core.VisualScriptSelect.get_typed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptSelect_set_typed #-}

bindVisualScriptSelect_set_typed :: MethodBind
bindVisualScriptSelect_set_typed
  = unsafePerformIO $
      withCString "VisualScriptSelect" $
        \ clsNamePtr ->
          withCString "set_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_typed ::
            (VisualScriptSelect :< cls, Object :< cls) => cls -> Int -> IO ()
set_typed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSelect_set_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptSelect_get_typed #-}

bindVisualScriptSelect_get_typed :: MethodBind
bindVisualScriptSelect_get_typed
  = unsafePerformIO $
      withCString "VisualScriptSelect" $
        \ clsNamePtr ->
          withCString "get_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_typed ::
            (VisualScriptSelect :< cls, Object :< cls) => cls -> IO Int
get_typed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSelect_get_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)