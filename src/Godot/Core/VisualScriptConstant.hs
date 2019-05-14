{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptConstant
       (Godot.Core.VisualScriptConstant.set_constant_type,
        Godot.Core.VisualScriptConstant.get_constant_type,
        Godot.Core.VisualScriptConstant.set_constant_value,
        Godot.Core.VisualScriptConstant.get_constant_value)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptConstant_set_constant_type #-}

bindVisualScriptConstant_set_constant_type :: MethodBind
bindVisualScriptConstant_set_constant_type
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "set_constant_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant_type ::
                    (VisualScriptConstant :< cls, Object :< cls) => cls -> Int -> IO ()
set_constant_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_set_constant_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptConstant_get_constant_type #-}

bindVisualScriptConstant_get_constant_type :: MethodBind
bindVisualScriptConstant_get_constant_type
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "get_constant_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant_type ::
                    (VisualScriptConstant :< cls, Object :< cls) => cls -> IO Int
get_constant_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_get_constant_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptConstant_set_constant_value #-}

bindVisualScriptConstant_set_constant_value :: MethodBind
bindVisualScriptConstant_set_constant_value
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "set_constant_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant_value ::
                     (VisualScriptConstant :< cls, Object :< cls) =>
                     cls -> GodotVariant -> IO ()
set_constant_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_set_constant_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptConstant_get_constant_value #-}

bindVisualScriptConstant_get_constant_value :: MethodBind
bindVisualScriptConstant_get_constant_value
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "get_constant_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant_value ::
                     (VisualScriptConstant :< cls, Object :< cls) =>
                     cls -> IO GodotVariant
get_constant_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_get_constant_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)