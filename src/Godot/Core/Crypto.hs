{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Crypto
       (Godot.Core.Crypto.generate_random_bytes,
        Godot.Core.Crypto.generate_rsa,
        Godot.Core.Crypto.generate_self_signed_certificate)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCrypto_generate_random_bytes #-}

bindCrypto_generate_random_bytes :: MethodBind
bindCrypto_generate_random_bytes
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_random_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

generate_random_bytes ::
                        (Crypto :< cls, Object :< cls) => cls -> Int -> IO PoolByteArray
generate_random_bytes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_random_bytes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCrypto_generate_rsa #-}

bindCrypto_generate_rsa :: MethodBind
bindCrypto_generate_rsa
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_rsa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

generate_rsa ::
               (Crypto :< cls, Object :< cls) => cls -> Int -> IO CryptoKey
generate_rsa cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_rsa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCrypto_generate_self_signed_certificate #-}

bindCrypto_generate_self_signed_certificate :: MethodBind
bindCrypto_generate_self_signed_certificate
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_self_signed_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

generate_self_signed_certificate ::
                                   (Crypto :< cls, Object :< cls) =>
                                   cls ->
                                     CryptoKey ->
                                       GodotString ->
                                         GodotString -> GodotString -> IO X509Certificate
generate_self_signed_certificate cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_self_signed_certificate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)