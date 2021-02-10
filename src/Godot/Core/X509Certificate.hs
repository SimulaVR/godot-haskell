{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.X509Certificate
       (Godot.Core.X509Certificate.load, Godot.Core.X509Certificate.save)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindX509Certificate_load #-}

-- | Loads a certificate from [code]path[/code] ("*.crt" file).
bindX509Certificate_load :: MethodBind
bindX509Certificate_load
  = unsafePerformIO $
      withCString "X509Certificate" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads a certificate from [code]path[/code] ("*.crt" file).
load ::
       (X509Certificate :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindX509Certificate_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindX509Certificate_save #-}

-- | Saves a certificate to the given [code]path[/code] (should be a "*.crt" file).
bindX509Certificate_save :: MethodBind
bindX509Certificate_save
  = unsafePerformIO $
      withCString "X509Certificate" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves a certificate to the given [code]path[/code] (should be a "*.crt" file).
save ::
       (X509Certificate :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
save cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindX509Certificate_save (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)