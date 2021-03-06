{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GDScript
       (Godot.Core.GDScript.get_as_byte_code, Godot.Core.GDScript.new)
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
import Godot.Core.Script()

{-# NOINLINE bindGDScript_get_as_byte_code #-}

bindGDScript_get_as_byte_code :: MethodBind
bindGDScript_get_as_byte_code
  = unsafePerformIO $
      withCString "GDScript" $
        \ clsNamePtr ->
          withCString "get_as_byte_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_as_byte_code ::
                   (GDScript :< cls, Object :< cls) => cls -> IO PoolByteArray
get_as_byte_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScript_get_as_byte_code (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDScript "get_as_byte_code" '[]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.GDScript.get_as_byte_code

{-# NOINLINE bindGDScript_new #-}

bindGDScript_new :: MethodBind
bindGDScript_new
  = unsafePerformIO $
      withCString "GDScript" $
        \ clsNamePtr ->
          withCString "new" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

new ::
      (GDScript :< cls, Object :< cls) =>
      cls -> [Variant 'GodotTy] -> IO GodotVariant
new cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScript_new (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDScript "new" '[[Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.GDScript.new