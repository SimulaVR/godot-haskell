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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

{-# NOINLINE bindCrypto_generate_random_bytes #-}

-- | Generates a @PoolByteArray@ of cryptographically secure random bytes with given @size@.
bindCrypto_generate_random_bytes :: MethodBind
bindCrypto_generate_random_bytes
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_random_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a @PoolByteArray@ of cryptographically secure random bytes with given @size@.
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

instance NodeMethod Crypto "generate_random_bytes" '[Int]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Crypto.generate_random_bytes

{-# NOINLINE bindCrypto_generate_rsa #-}

-- | Generates an RSA @CryptoKey@ that can be used for creating self-signed certificates and passed to @method StreamPeerSSL.accept_stream@.
bindCrypto_generate_rsa :: MethodBind
bindCrypto_generate_rsa
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_rsa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates an RSA @CryptoKey@ that can be used for creating self-signed certificates and passed to @method StreamPeerSSL.accept_stream@.
generate_rsa ::
               (Crypto :< cls, Object :< cls) => cls -> Int -> IO CryptoKey
generate_rsa cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_rsa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Crypto "generate_rsa" '[Int] (IO CryptoKey)
         where
        nodeMethod = Godot.Core.Crypto.generate_rsa

{-# NOINLINE bindCrypto_generate_self_signed_certificate #-}

-- | Generates a self-signed @X509Certificate@ from the given @CryptoKey@ and @issuer_name@. The certificate validity will be defined by @not_before@ and @not_after@ (first valid date and last valid date). The @issuer_name@ must contain at least "CN=" (common name, i.e. the domain name), "O=" (organization, i.e. your company name), "C=" (country, i.e. 2 lettered ISO-3166 code of the country the organization is based in).
--   				A small example to generate an RSA key and a X509 self-signed certificate.
--   				
--   @
--   
--   				var crypto = Crypto.new()
--   				# Generate 4096 bits RSA key.
--   				var key = crypto.generate_rsa(4096)
--   				# Generate self-signed certificate using the given key.
--   				var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
--   				
--   @
bindCrypto_generate_self_signed_certificate :: MethodBind
bindCrypto_generate_self_signed_certificate
  = unsafePerformIO $
      withCString "Crypto" $
        \ clsNamePtr ->
          withCString "generate_self_signed_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a self-signed @X509Certificate@ from the given @CryptoKey@ and @issuer_name@. The certificate validity will be defined by @not_before@ and @not_after@ (first valid date and last valid date). The @issuer_name@ must contain at least "CN=" (common name, i.e. the domain name), "O=" (organization, i.e. your company name), "C=" (country, i.e. 2 lettered ISO-3166 code of the country the organization is based in).
--   				A small example to generate an RSA key and a X509 self-signed certificate.
--   				
--   @
--   
--   				var crypto = Crypto.new()
--   				# Generate 4096 bits RSA key.
--   				var key = crypto.generate_rsa(4096)
--   				# Generate self-signed certificate using the given key.
--   				var cert = crypto.generate_self_signed_certificate(key, "CN=example.com,O=A Game Company,C=IT")
--   				
--   @
generate_self_signed_certificate ::
                                   (Crypto :< cls, Object :< cls) =>
                                   cls ->
                                     CryptoKey ->
                                       Maybe GodotString ->
                                         Maybe GodotString ->
                                           Maybe GodotString -> IO X509Certificate
generate_self_signed_certificate cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantString "CN=myserver,O=myorganisation,C=IT"
         arg2,
       defaultedVariant VariantString "20140101000000" arg3,
       defaultedVariant VariantString "20340101000000" arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCrypto_generate_self_signed_certificate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Crypto "generate_self_signed_certificate"
           '[CryptoKey, Maybe GodotString, Maybe GodotString,
             Maybe GodotString]
           (IO X509Certificate)
         where
        nodeMethod = Godot.Core.Crypto.generate_self_signed_certificate