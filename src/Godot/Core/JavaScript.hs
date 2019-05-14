{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.JavaScript (Godot.Core.JavaScript.eval) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindJavaScript_eval #-}

-- | Execute the string [code]code[/code] as JavaScript code within the browser window. This is a call to the actual global JavaScript function [code]eval()[/code].
--   				If [code]use_global_execution_context[/code] is [code]true[/code], the code will be evaluated in the global execution context. Otherwise, it is evaluated in the execution context of a function within the engine's runtime environment.
bindJavaScript_eval :: MethodBind
bindJavaScript_eval
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "eval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Execute the string [code]code[/code] as JavaScript code within the browser window. This is a call to the actual global JavaScript function [code]eval()[/code].
--   				If [code]use_global_execution_context[/code] is [code]true[/code], the code will be evaluated in the global execution context. Otherwise, it is evaluated in the execution context of a function within the engine's runtime environment.
eval ::
       (JavaScript :< cls, Object :< cls) =>
       cls -> GodotString -> Bool -> IO GodotVariant
eval cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_eval (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)