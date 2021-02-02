{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptVariableGet
       (Godot.Core.VisualScriptVariableGet.get_variable,
        Godot.Core.VisualScriptVariableGet.set_variable)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptVariableGet_get_variable #-}

bindVisualScriptVariableGet_get_variable :: MethodBind
bindVisualScriptVariableGet_get_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableGet" $
        \ clsNamePtr ->
          withCString "get_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable ::
               (VisualScriptVariableGet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_variable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableGet_get_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptVariableGet_set_variable #-}

bindVisualScriptVariableGet_set_variable :: MethodBind
bindVisualScriptVariableGet_set_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableGet" $
        \ clsNamePtr ->
          withCString "set_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable ::
               (VisualScriptVariableGet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_variable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableGet_set_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)