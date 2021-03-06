{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PluginScript (Godot.Core.PluginScript.new) where
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
import Godot.Core.Script()

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

instance NodeMethod PluginScript "new" '[[Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.PluginScript.new