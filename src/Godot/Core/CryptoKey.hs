{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CryptoKey
       (Godot.Core.CryptoKey.load, Godot.Core.CryptoKey.save) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCryptoKey_load #-}

bindCryptoKey_load :: MethodBind
bindCryptoKey_load
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

load ::
       (CryptoKey :< cls, Object :< cls) => cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_load (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCryptoKey_save #-}

bindCryptoKey_save :: MethodBind
bindCryptoKey_save
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

save ::
       (CryptoKey :< cls, Object :< cls) => cls -> GodotString -> IO Int
save cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_save (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)