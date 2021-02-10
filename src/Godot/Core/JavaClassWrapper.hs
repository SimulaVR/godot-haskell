{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JavaClassWrapper
       (Godot.Core.JavaClassWrapper.wrap) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindJavaClassWrapper_wrap #-}

bindJavaClassWrapper_wrap :: MethodBind
bindJavaClassWrapper_wrap
  = unsafePerformIO $
      withCString "JavaClassWrapper" $
        \ clsNamePtr ->
          withCString "wrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

wrap ::
       (JavaClassWrapper :< cls, Object :< cls) =>
       cls -> GodotString -> IO JavaClass
wrap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaClassWrapper_wrap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)