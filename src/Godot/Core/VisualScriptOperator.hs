{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptOperator
       (Godot.Core.VisualScriptOperator.set_operator,
        Godot.Core.VisualScriptOperator.get_operator,
        Godot.Core.VisualScriptOperator.set_typed,
        Godot.Core.VisualScriptOperator.get_typed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptOperator_set_operator #-}

bindVisualScriptOperator_set_operator :: MethodBind
bindVisualScriptOperator_set_operator
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_operator ::
               (VisualScriptOperator :< cls, Object :< cls) => cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptOperator_get_operator #-}

bindVisualScriptOperator_get_operator :: MethodBind
bindVisualScriptOperator_get_operator
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_operator ::
               (VisualScriptOperator :< cls, Object :< cls) => cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptOperator_set_typed #-}

bindVisualScriptOperator_set_typed :: MethodBind
bindVisualScriptOperator_set_typed
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "set_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_typed ::
            (VisualScriptOperator :< cls, Object :< cls) => cls -> Int -> IO ()
set_typed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_set_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptOperator_get_typed #-}

bindVisualScriptOperator_get_typed :: MethodBind
bindVisualScriptOperator_get_typed
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "get_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_typed ::
            (VisualScriptOperator :< cls, Object :< cls) => cls -> IO Int
get_typed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_get_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)