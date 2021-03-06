{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.X509Certificate
       (Godot.Core.X509Certificate.load, Godot.Core.X509Certificate.save)
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
import Godot.Core.Resource()

{-# NOINLINE bindX509Certificate_load #-}

-- | Loads a certificate from @path@ ("*.crt" file).
bindX509Certificate_load :: MethodBind
bindX509Certificate_load
  = unsafePerformIO $
      withCString "X509Certificate" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a certificate from @path@ ("*.crt" file).
load ::
       (X509Certificate :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindX509Certificate_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod X509Certificate "load" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.X509Certificate.load

{-# NOINLINE bindX509Certificate_save #-}

-- | Saves a certificate to the given @path@ (should be a "*.crt" file).
bindX509Certificate_save :: MethodBind
bindX509Certificate_save
  = unsafePerformIO $
      withCString "X509Certificate" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves a certificate to the given @path@ (should be a "*.crt" file).
save ::
       (X509Certificate :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
save cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindX509Certificate_save (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod X509Certificate "save" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.X509Certificate.save