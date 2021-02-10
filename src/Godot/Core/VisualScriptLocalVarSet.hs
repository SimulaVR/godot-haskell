{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptLocalVarSet
       (Godot.Core.VisualScriptLocalVarSet.get_var_name,
        Godot.Core.VisualScriptLocalVarSet.get_var_type,
        Godot.Core.VisualScriptLocalVarSet.set_var_name,
        Godot.Core.VisualScriptLocalVarSet.set_var_type)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptLocalVarSet_get_var_name #-}

bindVisualScriptLocalVarSet_get_var_name :: MethodBind
bindVisualScriptLocalVarSet_get_var_name
  = unsafePerformIO $
      withCString "VisualScriptLocalVarSet" $
        \ clsNamePtr ->
          withCString "get_var_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_var_name ::
               (VisualScriptLocalVarSet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_var_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVarSet_get_var_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptLocalVarSet_get_var_type #-}

bindVisualScriptLocalVarSet_get_var_type :: MethodBind
bindVisualScriptLocalVarSet_get_var_type
  = unsafePerformIO $
      withCString "VisualScriptLocalVarSet" $
        \ clsNamePtr ->
          withCString "get_var_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_var_type ::
               (VisualScriptLocalVarSet :< cls, Object :< cls) => cls -> IO Int
get_var_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVarSet_get_var_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptLocalVarSet_set_var_name #-}

bindVisualScriptLocalVarSet_set_var_name :: MethodBind
bindVisualScriptLocalVarSet_set_var_name
  = unsafePerformIO $
      withCString "VisualScriptLocalVarSet" $
        \ clsNamePtr ->
          withCString "set_var_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_var_name ::
               (VisualScriptLocalVarSet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_var_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVarSet_set_var_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptLocalVarSet_set_var_type #-}

bindVisualScriptLocalVarSet_set_var_type :: MethodBind
bindVisualScriptLocalVarSet_set_var_type
  = unsafePerformIO $
      withCString "VisualScriptLocalVarSet" $
        \ clsNamePtr ->
          withCString "set_var_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_var_type ::
               (VisualScriptLocalVarSet :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_var_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLocalVarSet_set_var_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)