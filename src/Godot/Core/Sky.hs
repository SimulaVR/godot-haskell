{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindSky_get_radiance_size #-}

-- | The [Sky]'s radiance map size.
--   			The higher the radiance map size, the more detailed the lighting from the [Sky] will be.
--   			See [enum RadianceSize] constants for values. Default size is [constant RADIANCE_SIZE_512].
bindSky_get_radiance_size :: MethodBind
bindSky_get_radiance_size
  = unsafePerformIO $
      withCString "Sky" $
        \ clsNamePtr ->
          withCString "get_radiance_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Sky]'s radiance map size.
--   			The higher the radiance map size, the more detailed the lighting from the [Sky] will be.
--   			See [enum RadianceSize] constants for values. Default size is [constant RADIANCE_SIZE_512].
get_radiance_size :: (Sky :< cls, Object :< cls) => cls -> IO Int
get_radiance_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSky_get_radiance_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSky_set_radiance_size #-}

-- | The [Sky]'s radiance map size.
--   			The higher the radiance map size, the more detailed the lighting from the [Sky] will be.
--   			See [enum RadianceSize] constants for values. Default size is [constant RADIANCE_SIZE_512].
bindSky_set_radiance_size :: MethodBind
bindSky_set_radiance_size
  = unsafePerformIO $
      withCString "Sky" $
        \ clsNamePtr ->
          withCString "set_radiance_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Sky]'s radiance map size.
--   			The higher the radiance map size, the more detailed the lighting from the [Sky] will be.
--   			See [enum RadianceSize] constants for values. Default size is [constant RADIANCE_SIZE_512].
set_radiance_size ::
                    (Sky :< cls, Object :< cls) => cls -> Int -> IO ()
set_radiance_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSky_set_radiance_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)