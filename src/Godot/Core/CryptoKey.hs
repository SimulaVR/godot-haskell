{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CryptoKey
       (Godot.Core.CryptoKey.load, Godot.Core.CryptoKey.save) where
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
import Godot.Core.Resource()

{-# NOINLINE bindCryptoKey_load #-}

-- | Loads a key from @path@. If @public_only@ is @true@, only the public key will be loaded.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
bindCryptoKey_load :: MethodBind
bindCryptoKey_load
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a key from @path@. If @public_only@ is @true@, only the public key will be loaded.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
load ::
       (CryptoKey :< cls, Object :< cls) => cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_load (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CryptoKey "load" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.CryptoKey.load

{-# NOINLINE bindCryptoKey_save #-}

-- | Saves a key to the given @path@. If @public_only@ is @true@, only the public key will be saved.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
bindCryptoKey_save :: MethodBind
bindCryptoKey_save
  = unsafePerformIO $
      withCString "CryptoKey" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves a key to the given @path@. If @public_only@ is @true@, only the public key will be saved.
--   				__Note:__ @path@ should be a "*.pub" file if @public_only@ is @true@, a "*.key" file otherwise.
save ::
       (CryptoKey :< cls, Object :< cls) => cls -> GodotString -> IO Int
save cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCryptoKey_save (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CryptoKey "save" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.CryptoKey.save