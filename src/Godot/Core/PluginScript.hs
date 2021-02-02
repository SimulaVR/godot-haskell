{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PluginScript (Godot.Core.PluginScript.new) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPluginScript_new #-}

bindPluginScript_new :: MethodBind
bindPluginScript_new
  = unsafePerformIO $
      withCString "PluginScript" $
        \ clsNamePtr ->
          withCString "new" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

new ::
      (PluginScript :< cls, Object :< cls) =>
      cls -> [Variant 'GodotTy] -> IO GodotVariant
new cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPluginScript_new (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)