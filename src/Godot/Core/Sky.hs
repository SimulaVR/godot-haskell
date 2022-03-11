{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Sky
       (Godot.Core.Sky._RADIANCE_SIZE_128,
        Godot.Core.Sky._RADIANCE_SIZE_2048,
        Godot.Core.Sky._RADIANCE_SIZE_512,
        Godot.Core.Sky._RADIANCE_SIZE_1024,
        Godot.Core.Sky._RADIANCE_SIZE_64, Godot.Core.Sky._RADIANCE_SIZE_32,
        Godot.Core.Sky._RADIANCE_SIZE_256,
        Godot.Core.Sky._RADIANCE_SIZE_MAX,
        Godot.Core.Sky.get_radiance_size, Godot.Core.Sky.set_radiance_size)
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

_RADIANCE_SIZE_128 :: Int
_RADIANCE_SIZE_128 = 2

_RADIANCE_SIZE_2048 :: Int
_RADIANCE_SIZE_2048 = 6

_RADIANCE_SIZE_512 :: Int
_RADIANCE_SIZE_512 = 4

_RADIANCE_SIZE_1024 :: Int
_RADIANCE_SIZE_1024 = 5

_RADIANCE_SIZE_64 :: Int
_RADIANCE_SIZE_64 = 1

_RADIANCE_SIZE_32 :: Int
_RADIANCE_SIZE_32 = 0

_RADIANCE_SIZE_256 :: Int
_RADIANCE_SIZE_256 = 3

_RADIANCE_SIZE_MAX :: Int
_RADIANCE_SIZE_MAX = 7

instance NodeProperty Sky "radiance_size" Int 'False where
        nodeProperty
          = (get_radiance_size, wrapDroppingSetter set_radiance_size,
             Nothing)

{-# NOINLINE bindSky_get_radiance_size #-}

-- | The @Sky@'s radiance map size. The higher the radiance map size, the more detailed the lighting from the @Sky@ will be.
--   			See @enum RadianceSize@ constants for values.
--   			__Note:__ You will only benefit from high radiance sizes if you have perfectly sharp reflective surfaces in your project and are not using @ReflectionProbe@s or @GIProbe@s. For most projects, keeping @radiance_size@ to the default value is the best compromise between visuals and performance. Be careful when using high radiance size values as these can cause crashes on low-end GPUs.
bindSky_get_radiance_size :: MethodBind
bindSky_get_radiance_size
  = unsafePerformIO $
      withCString "Sky" $
        \ clsNamePtr ->
          withCString "get_radiance_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@'s radiance map size. The higher the radiance map size, the more detailed the lighting from the @Sky@ will be.
--   			See @enum RadianceSize@ constants for values.
--   			__Note:__ You will only benefit from high radiance sizes if you have perfectly sharp reflective surfaces in your project and are not using @ReflectionProbe@s or @GIProbe@s. For most projects, keeping @radiance_size@ to the default value is the best compromise between visuals and performance. Be careful when using high radiance size values as these can cause crashes on low-end GPUs.
get_radiance_size :: (Sky :< cls, Object :< cls) => cls -> IO Int
get_radiance_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSky_get_radiance_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sky "get_radiance_size" '[] (IO Int) where
        nodeMethod = Godot.Core.Sky.get_radiance_size

{-# NOINLINE bindSky_set_radiance_size #-}

-- | The @Sky@'s radiance map size. The higher the radiance map size, the more detailed the lighting from the @Sky@ will be.
--   			See @enum RadianceSize@ constants for values.
--   			__Note:__ You will only benefit from high radiance sizes if you have perfectly sharp reflective surfaces in your project and are not using @ReflectionProbe@s or @GIProbe@s. For most projects, keeping @radiance_size@ to the default value is the best compromise between visuals and performance. Be careful when using high radiance size values as these can cause crashes on low-end GPUs.
bindSky_set_radiance_size :: MethodBind
bindSky_set_radiance_size
  = unsafePerformIO $
      withCString "Sky" $
        \ clsNamePtr ->
          withCString "set_radiance_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@'s radiance map size. The higher the radiance map size, the more detailed the lighting from the @Sky@ will be.
--   			See @enum RadianceSize@ constants for values.
--   			__Note:__ You will only benefit from high radiance sizes if you have perfectly sharp reflective surfaces in your project and are not using @ReflectionProbe@s or @GIProbe@s. For most projects, keeping @radiance_size@ to the default value is the best compromise between visuals and performance. Be careful when using high radiance size values as these can cause crashes on low-end GPUs.
set_radiance_size ::
                    (Sky :< cls, Object :< cls) => cls -> Int -> IO ()
set_radiance_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSky_set_radiance_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sky "set_radiance_size" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sky.set_radiance_size