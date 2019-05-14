{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.FuncRef
       (Godot.Core.FuncRef.call_func, Godot.Core.FuncRef.set_instance,
        Godot.Core.FuncRef.set_function)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindFuncRef_call_func #-}

-- | Calls the referenced function previously set by [method set_function] or [method @GDScript.funcref].
bindFuncRef_call_func :: MethodBind
bindFuncRef_call_func
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "call_func" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the referenced function previously set by [method set_function] or [method @GDScript.funcref].
call_func ::
            (FuncRef :< cls, Object :< cls) =>
            cls -> [Variant 'GodotTy] -> IO GodotVariant
call_func cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_call_func (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFuncRef_set_instance #-}

-- | The object containing the referenced function. This object must be of a type actually inheriting from [Object], not a built-in type such as [int], [Vector2] or [Dictionary].
bindFuncRef_set_instance :: MethodBind
bindFuncRef_set_instance
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "set_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The object containing the referenced function. This object must be of a type actually inheriting from [Object], not a built-in type such as [int], [Vector2] or [Dictionary].
set_instance ::
               (FuncRef :< cls, Object :< cls) => cls -> Object -> IO ()
set_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_set_instance (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFuncRef_set_function #-}

-- | The name of the referenced function to call on the object, without parentheses or any parameters.
bindFuncRef_set_function :: MethodBind
bindFuncRef_set_function
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the referenced function to call on the object, without parentheses or any parameters.
set_function ::
               (FuncRef :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_set_function (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)