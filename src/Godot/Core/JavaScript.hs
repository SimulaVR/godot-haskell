{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JavaScript (Godot.Core.JavaScript.eval) where
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
import Godot.Core.Object()

{-# NOINLINE bindJavaScript_eval #-}

-- | Execute the string @code@ as JavaScript code within the browser window. This is a call to the actual global JavaScript function @eval()@.
--   				If @use_global_execution_context@ is @true@, the code will be evaluated in the global execution context. Otherwise, it is evaluated in the execution context of a function within the engine's runtime environment.
bindJavaScript_eval :: MethodBind
bindJavaScript_eval
  = unsafePerformIO $
      withCString "JavaScript" $
        \ clsNamePtr ->
          withCString "eval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Execute the string @code@ as JavaScript code within the browser window. This is a call to the actual global JavaScript function @eval()@.
--   				If @use_global_execution_context@ is @true@, the code will be evaluated in the global execution context. Otherwise, it is evaluated in the execution context of a function within the engine's runtime environment.
eval ::
       (JavaScript :< cls, Object :< cls) =>
       cls -> GodotString -> Maybe Bool -> IO GodotVariant
eval cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJavaScript_eval (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JavaScript "eval" '[GodotString, Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.JavaScript.eval