{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SpotLight
       (Godot.Core.SpotLight.get_param, Godot.Core.SpotLight.set_param)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSpotLight_get_param #-}

bindSpotLight_get_param :: MethodBind
bindSpotLight_get_param
  = unsafePerformIO $
      withCString "SpotLight" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_param :: (SpotLight :< cls, Object :< cls) => cls -> IO Float
get_param cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpotLight_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpotLight_set_param #-}

bindSpotLight_set_param :: MethodBind
bindSpotLight_set_param
  = unsafePerformIO $
      withCString "SpotLight" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_param ::
            (SpotLight :< cls, Object :< cls) => cls -> Float -> IO ()
set_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpotLight_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)