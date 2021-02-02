{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PanoramaSky
       (Godot.Core.PanoramaSky.get_panorama,
        Godot.Core.PanoramaSky.set_panorama)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPanoramaSky_get_panorama #-}

-- | [Texture] to be applied to the PanoramaSky.
bindPanoramaSky_get_panorama :: MethodBind
bindPanoramaSky_get_panorama
  = unsafePerformIO $
      withCString "PanoramaSky" $
        \ clsNamePtr ->
          withCString "get_panorama" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] to be applied to the PanoramaSky.
get_panorama ::
               (PanoramaSky :< cls, Object :< cls) => cls -> IO Texture
get_panorama cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPanoramaSky_get_panorama (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPanoramaSky_set_panorama #-}

-- | [Texture] to be applied to the PanoramaSky.
bindPanoramaSky_set_panorama :: MethodBind
bindPanoramaSky_set_panorama
  = unsafePerformIO $
      withCString "PanoramaSky" $
        \ clsNamePtr ->
          withCString "set_panorama" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] to be applied to the PanoramaSky.
set_panorama ::
               (PanoramaSky :< cls, Object :< cls) => cls -> Texture -> IO ()
set_panorama cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPanoramaSky_set_panorama (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)