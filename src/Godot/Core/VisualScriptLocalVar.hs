{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptLocalVar
       (Godot.Core.VisualScriptLocalVar.get_var_name,
        Godot.Core.VisualScriptLocalVar.get_var_type,
        Godot.Core.VisualScriptLocalVar.set_var_name,
        Godot.Core.VisualScriptLocalVar.set_var_type)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptLocalVar_get_var_name #-}

bindVisualScriptLocalVar_get_var_name :: MethodBind
bindVisualScriptLocalVar_get_var_name
  = unsafePerformIO $
      withCString "VisualScriptLocalVar" $
        \ clsNamePtr ->
          withCString "get_var_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_var_name ::
               (VisualScriptLocalVar :< cls, Object :< cls) =>
               cls -> IO GodotString
get_var_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVar_get_var_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptLocalVar_get_var_type #-}

bindVisualScriptLocalVar_get_var_type :: MethodBind
bindVisualScriptLocalVar_get_var_type
  = unsafePerformIO $
      withCString "VisualScriptLocalVar" $
        \ clsNamePtr ->
          withCString "get_var_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_var_type ::
               (VisualScriptLocalVar :< cls, Object :< cls) => cls -> IO Int
get_var_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVar_get_var_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptLocalVar_set_var_name #-}

bindVisualScriptLocalVar_set_var_name :: MethodBind
bindVisualScriptLocalVar_set_var_name
  = unsafePerformIO $
      withCString "VisualScriptLocalVar" $
        \ clsNamePtr ->
          withCString "set_var_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_var_name ::
               (VisualScriptLocalVar :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_var_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVar_set_var_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptLocalVar_set_var_type #-}

bindVisualScriptLocalVar_set_var_type :: MethodBind
bindVisualScriptLocalVar_set_var_type
  = unsafePerformIO $
      withCString "VisualScriptLocalVar" $
        \ clsNamePtr ->
          withCString "set_var_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_var_type ::
               (VisualScriptLocalVar :< cls, Object :< cls) => cls -> Int -> IO ()
set_var_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVar_set_var_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)