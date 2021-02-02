{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ProxyTexture
       (Godot.Core.ProxyTexture.get_base,
        Godot.Core.ProxyTexture.set_base)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindProxyTexture_get_base #-}

bindProxyTexture_get_base :: MethodBind
bindProxyTexture_get_base
  = unsafePerformIO $
      withCString "ProxyTexture" $
        \ clsNamePtr ->
          withCString "get_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base ::
           (ProxyTexture :< cls, Object :< cls) => cls -> IO Texture
get_base cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProxyTexture_get_base (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProxyTexture_set_base #-}

bindProxyTexture_set_base :: MethodBind
bindProxyTexture_set_base
  = unsafePerformIO $
      withCString "ProxyTexture" $
        \ clsNamePtr ->
          withCString "set_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base ::
           (ProxyTexture :< cls, Object :< cls) => cls -> Texture -> IO ()
set_base cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProxyTexture_set_base (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)