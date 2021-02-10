{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptBasicTypeConstant
       (Godot.Core.VisualScriptBasicTypeConstant.get_basic_type,
        Godot.Core.VisualScriptBasicTypeConstant.get_basic_type_constant,
        Godot.Core.VisualScriptBasicTypeConstant.set_basic_type,
        Godot.Core.VisualScriptBasicTypeConstant.set_basic_type_constant)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptBasicTypeConstant_get_basic_type #-}

bindVisualScriptBasicTypeConstant_get_basic_type :: MethodBind
bindVisualScriptBasicTypeConstant_get_basic_type
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "get_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type ::
                 (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                 cls -> IO Int
get_basic_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_get_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptBasicTypeConstant_get_basic_type_constant
             #-}

bindVisualScriptBasicTypeConstant_get_basic_type_constant ::
                                                          MethodBind
bindVisualScriptBasicTypeConstant_get_basic_type_constant
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "get_basic_type_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type_constant ::
                          (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                          cls -> IO GodotString
get_basic_type_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_get_basic_type_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptBasicTypeConstant_set_basic_type #-}

bindVisualScriptBasicTypeConstant_set_basic_type :: MethodBind
bindVisualScriptBasicTypeConstant_set_basic_type
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "set_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type ::
                 (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_basic_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_set_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptBasicTypeConstant_set_basic_type_constant
             #-}

bindVisualScriptBasicTypeConstant_set_basic_type_constant ::
                                                          MethodBind
bindVisualScriptBasicTypeConstant_set_basic_type_constant
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "set_basic_type_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type_constant ::
                          (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                          cls -> GodotString -> IO ()
set_basic_type_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_set_basic_type_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)