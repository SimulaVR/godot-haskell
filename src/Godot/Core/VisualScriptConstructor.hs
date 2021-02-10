{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptConstructor
       (Godot.Core.VisualScriptConstructor.get_constructor,
        Godot.Core.VisualScriptConstructor.get_constructor_type,
        Godot.Core.VisualScriptConstructor.set_constructor,
        Godot.Core.VisualScriptConstructor.set_constructor_type)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptConstructor_get_constructor #-}

bindVisualScriptConstructor_get_constructor :: MethodBind
bindVisualScriptConstructor_get_constructor
  = unsafePerformIO $
      withCString "VisualScriptConstructor" $
        \ clsNamePtr ->
          withCString "get_constructor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constructor ::
                  (VisualScriptConstructor :< cls, Object :< cls) =>
                  cls -> IO Dictionary
get_constructor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstructor_get_constructor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptConstructor_get_constructor_type #-}

bindVisualScriptConstructor_get_constructor_type :: MethodBind
bindVisualScriptConstructor_get_constructor_type
  = unsafePerformIO $
      withCString "VisualScriptConstructor" $
        \ clsNamePtr ->
          withCString "get_constructor_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constructor_type ::
                       (VisualScriptConstructor :< cls, Object :< cls) => cls -> IO Int
get_constructor_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptConstructor_get_constructor_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptConstructor_set_constructor #-}

bindVisualScriptConstructor_set_constructor :: MethodBind
bindVisualScriptConstructor_set_constructor
  = unsafePerformIO $
      withCString "VisualScriptConstructor" $
        \ clsNamePtr ->
          withCString "set_constructor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constructor ::
                  (VisualScriptConstructor :< cls, Object :< cls) =>
                  cls -> Dictionary -> IO ()
set_constructor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstructor_set_constructor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptConstructor_set_constructor_type #-}

bindVisualScriptConstructor_set_constructor_type :: MethodBind
bindVisualScriptConstructor_set_constructor_type
  = unsafePerformIO $
      withCString "VisualScriptConstructor" $
        \ clsNamePtr ->
          withCString "set_constructor_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constructor_type ::
                       (VisualScriptConstructor :< cls, Object :< cls) =>
                       cls -> Int -> IO ()
set_constructor_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptConstructor_set_constructor_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)