{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptClassConstant
       (Godot.Core.VisualScriptClassConstant.get_base_type,
        Godot.Core.VisualScriptClassConstant.get_class_constant,
        Godot.Core.VisualScriptClassConstant.set_base_type,
        Godot.Core.VisualScriptClassConstant.set_class_constant)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptClassConstant_get_base_type #-}

bindVisualScriptClassConstant_get_base_type :: MethodBind
bindVisualScriptClassConstant_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptClassConstant :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptClassConstant_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptClassConstant_get_class_constant #-}

bindVisualScriptClassConstant_get_class_constant :: MethodBind
bindVisualScriptClassConstant_get_class_constant
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "get_class_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_class_constant ::
                     (VisualScriptClassConstant :< cls, Object :< cls) =>
                     cls -> IO GodotString
get_class_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptClassConstant_get_class_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptClassConstant_set_base_type #-}

bindVisualScriptClassConstant_set_base_type :: MethodBind
bindVisualScriptClassConstant_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptClassConstant :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptClassConstant_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptClassConstant_set_class_constant #-}

bindVisualScriptClassConstant_set_class_constant :: MethodBind
bindVisualScriptClassConstant_set_class_constant
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "set_class_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_class_constant ::
                     (VisualScriptClassConstant :< cls, Object :< cls) =>
                     cls -> GodotString -> IO ()
set_class_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptClassConstant_set_class_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)