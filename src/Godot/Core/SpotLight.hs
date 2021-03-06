{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SpotLight
       (Godot.Core.SpotLight.get_param, Godot.Core.SpotLight.set_param)
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
import Godot.Core.Light()

{-# NOINLINE bindSpotLight_get_param #-}

-- | The spotlight's angle in degrees.
bindSpotLight_get_param :: MethodBind
bindSpotLight_get_param
  = unsafePerformIO $
      withCString "SpotLight" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The spotlight's angle in degrees.
get_param ::
            (SpotLight :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpotLight_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpotLight "get_param" '[Int] (IO Float) where
        nodeMethod = Godot.Core.SpotLight.get_param

{-# NOINLINE bindSpotLight_set_param #-}

-- | The spotlight's angle in degrees.
bindSpotLight_set_param :: MethodBind
bindSpotLight_set_param
  = unsafePerformIO $
      withCString "SpotLight" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The spotlight's angle in degrees.
set_param ::
            (SpotLight :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpotLight_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpotLight "set_param" '[Int, Float] (IO ())
         where
        nodeMethod = Godot.Core.SpotLight.set_param

instance NodeProperty SpotLight "spot_angle" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 5 get_param, wrapIndexedSetter 5 set_param,
             Nothing)

instance NodeProperty SpotLight "spot_angle_attenuation" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param, wrapIndexedSetter 6 set_param,
             Nothing)

instance NodeProperty SpotLight "spot_attenuation" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param, wrapIndexedSetter 4 set_param,
             Nothing)

instance NodeProperty SpotLight "spot_range" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 3 get_param, wrapIndexedSetter 3 set_param,
             Nothing)