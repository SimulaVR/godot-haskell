{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptVariableSet
       (Godot.Core.VisualScriptVariableSet.get_variable,
        Godot.Core.VisualScriptVariableSet.set_variable)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptVariableSet_get_variable #-}

bindVisualScriptVariableSet_get_variable :: MethodBind
bindVisualScriptVariableSet_get_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableSet" $
        \ clsNamePtr ->
          withCString "get_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable ::
               (VisualScriptVariableSet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_variable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableSet_get_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptVariableSet_set_variable #-}

bindVisualScriptVariableSet_set_variable :: MethodBind
bindVisualScriptVariableSet_set_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableSet" $
        \ clsNamePtr ->
          withCString "set_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable ::
               (VisualScriptVariableSet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_variable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableSet_set_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)