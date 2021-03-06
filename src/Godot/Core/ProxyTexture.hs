{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ProxyTexture
       (Godot.Core.ProxyTexture.get_base,
        Godot.Core.ProxyTexture.set_base)
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
import Godot.Core.Texture()

instance NodeProperty ProxyTexture "base" Texture 'False where
        nodeProperty = (get_base, wrapDroppingSetter set_base, Nothing)

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

instance NodeMethod ProxyTexture "get_base" '[] (IO Texture) where
        nodeMethod = Godot.Core.ProxyTexture.get_base

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

instance NodeMethod ProxyTexture "set_base" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.ProxyTexture.set_base