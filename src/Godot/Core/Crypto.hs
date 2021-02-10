{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Generates a [PoolByteArray] of cryptographically secure random bytes with given [code]size[/code].
bindCrypto_generate_random_bytes :: MethodBind
bindCrypto_generate_random_bytes
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_random_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a [PoolByteArray] of cryptographically secure random bytes with given [code]size[/code].
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

-- | Generates an RSA [CryptoKey] that can be used for creating self-signed certificates and passed to [method StreamPeerSSL.accept_stream].
bindCrypto_generate_rsa :: MethodBind
bindCrypto_generate_rsa
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_rsa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates an RSA [CryptoKey] that can be used for creating self-signed certificates and passed to [method StreamPeerSSL.accept_stream].
generate_rsa ::
               (Crypto :< cls, Object :< cls) => cls -> Int -> IO CryptoKey
generate_rsa cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_rsa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCrypto_generate_self_signed_certificate #-}

-- | Generates a self-signed [X509Certificate] from the given [CryptoKey] and [code]issuer_name[/code]. The certificate validity will be defined by [code]not_before[/code] and [code]not_after[/code] (first valid date and last valid date). The [code]issuer_name[/code] must contain at least "CN=" (common name, i.e. the domain name), "O=" (organization, i.e. your company name), "C=" (country, i.e. 2 lettered ISO-3166 code of the country the organization is based in).
--   				A small example to generate an RSA key and a X509 self-signed certificate.
--   				[codeblock]
--   				var crypto = Crypto.new()
--   				# Generate 4096 bits RSA key.
--   				var key = crypto.generate_rsa(4096)
--   				# Generate self-signed certificate using the given key.
--   				var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
--   				[/codeblock]
bindCrypto_generate_self_signed_certificate :: MethodBind
bindCrypto_generate_self_signed_certificate
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_self_signed_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a self-signed [X509Certificate] from the given [CryptoKey] and [code]issuer_name[/code]. The certificate validity will be defined by [code]not_before[/code] and [code]not_after[/code] (first valid date and last valid date). The [code]issuer_name[/code] must contain at least "CN=" (common name, i.e. the domain name), "O=" (organization, i.e. your company name), "C=" (country, i.e. 2 lettered ISO-3166 code of the country the organization is based in).
--   				A small example to generate an RSA key and a X509 self-signed certificate.
--   				[codeblock]
--   				var crypto = Crypto.new()
--   				# Generate 4096 bits RSA key.
--   				var key = crypto.generate_rsa(4096)
--   				# Generate self-signed certificate using the given key.
--   				var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
--   				[/codeblock]
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