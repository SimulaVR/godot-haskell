{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.FuncRef
       (Godot.Core.FuncRef.call_func, Godot.Core.FuncRef.call_funcv,
        Godot.Core.FuncRef.is_valid, Godot.Core.FuncRef.set_function,
        Godot.Core.FuncRef.set_instance)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

{-# NOINLINE bindFuncRef_call_func #-}

-- | Calls the referenced function previously set by @method set_function@ or @method @GDScript.funcref@.
bindFuncRef_call_func :: MethodBind
bindFuncRef_call_func
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "call_func" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the referenced function previously set by @method set_function@ or @method @GDScript.funcref@.
call_func ::
            (FuncRef :< cls, Object :< cls) =>
            cls -> [Variant 'GodotTy] -> IO GodotVariant
call_func cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_call_func (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FuncRef "call_func" '[[Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.FuncRef.call_func

{-# NOINLINE bindFuncRef_call_funcv #-}

-- | Calls the referenced function previously set by @method set_function@ or @method @GDScript.funcref@. Contrarily to @method call_func@, this method does not support a variable number of arguments but expects all parameters to be passed via a single @Array@.
bindFuncRef_call_funcv :: MethodBind
bindFuncRef_call_funcv
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "call_funcv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the referenced function previously set by @method set_function@ or @method @GDScript.funcref@. Contrarily to @method call_func@, this method does not support a variable number of arguments but expects all parameters to be passed via a single @Array@.
call_funcv ::
             (FuncRef :< cls, Object :< cls) => cls -> Array -> IO GodotVariant
call_funcv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_call_funcv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FuncRef "call_funcv" '[Array] (IO GodotVariant)
         where
        nodeMethod = Godot.Core.FuncRef.call_funcv

{-# NOINLINE bindFuncRef_is_valid #-}

-- | Returns whether the object still exists and has the function assigned.
bindFuncRef_is_valid :: MethodBind
bindFuncRef_is_valid
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the object still exists and has the function assigned.
is_valid :: (FuncRef :< cls, Object :< cls) => cls -> IO Bool
is_valid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_is_valid (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FuncRef "is_valid" '[] (IO Bool) where
        nodeMethod = Godot.Core.FuncRef.is_valid

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

instance NodeMethod FuncRef "set_function" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.FuncRef.set_function

{-# NOINLINE bindFuncRef_set_instance #-}

-- | The object containing the referenced function. This object must be of a type actually inheriting from @Object@, not a built-in type such as @int@, @Vector2@ or @Dictionary@.
bindFuncRef_set_instance :: MethodBind
bindFuncRef_set_instance
  = unsafePerformIO $
      withCString "FuncRef" $
        \ clsNamePtr ->
          withCString "set_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The object containing the referenced function. This object must be of a type actually inheriting from @Object@, not a built-in type such as @int@, @Vector2@ or @Dictionary@.
set_instance ::
               (FuncRef :< cls, Object :< cls) => cls -> Object -> IO ()
set_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFuncRef_set_instance (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod FuncRef "set_instance" '[Object] (IO ()) where
        nodeMethod = Godot.Core.FuncRef.set_instance