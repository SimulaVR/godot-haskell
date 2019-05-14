{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.OmniLight
       (Godot.Core.OmniLight._SHADOW_DUAL_PARABOLOID,
        Godot.Core.OmniLight._SHADOW_DETAIL_HORIZONTAL,
        Godot.Core.OmniLight._SHADOW_DETAIL_VERTICAL,
        Godot.Core.OmniLight._SHADOW_CUBE, Godot.Core.OmniLight.get_param,
        Godot.Core.OmniLight.set_param,
        Godot.Core.OmniLight.set_shadow_mode,
        Godot.Core.OmniLight.get_shadow_mode,
        Godot.Core.OmniLight.set_shadow_detail,
        Godot.Core.OmniLight.get_shadow_detail)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SHADOW_DUAL_PARABOLOID :: Int
_SHADOW_DUAL_PARABOLOID = 0

_SHADOW_DETAIL_HORIZONTAL :: Int
_SHADOW_DETAIL_HORIZONTAL = 1

_SHADOW_DETAIL_VERTICAL :: Int
_SHADOW_DETAIL_VERTICAL = 0

_SHADOW_CUBE :: Int
_SHADOW_CUBE = 1

{-# NOINLINE bindOmniLight_get_param #-}

-- | The light's attenuation (drop-off) curve. A number of presets are available in the Inspector.
bindOmniLight_get_param :: MethodBind
bindOmniLight_get_param
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's attenuation (drop-off) curve. A number of presets are available in the Inspector.
get_param :: (OmniLight :< cls, Object :< cls) => cls -> IO Float
get_param cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_get_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOmniLight_set_param #-}

-- | The light's attenuation (drop-off) curve. A number of presets are available in the Inspector.
bindOmniLight_set_param :: MethodBind
bindOmniLight_set_param
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's attenuation (drop-off) curve. A number of presets are available in the Inspector.
set_param ::
            (OmniLight :< cls, Object :< cls) => cls -> Float -> IO ()
set_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_set_param (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOmniLight_set_shadow_mode #-}

-- | See [enum ShadowMode].
bindOmniLight_set_shadow_mode :: MethodBind
bindOmniLight_set_shadow_mode
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | See [enum ShadowMode].
set_shadow_mode ::
                  (OmniLight :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_set_shadow_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOmniLight_get_shadow_mode #-}

-- | See [enum ShadowMode].
bindOmniLight_get_shadow_mode :: MethodBind
bindOmniLight_get_shadow_mode
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "get_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | See [enum ShadowMode].
get_shadow_mode ::
                  (OmniLight :< cls, Object :< cls) => cls -> IO Int
get_shadow_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_get_shadow_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOmniLight_set_shadow_detail #-}

-- | See [enum ShadowDetail].
bindOmniLight_set_shadow_detail :: MethodBind
bindOmniLight_set_shadow_detail
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "set_shadow_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | See [enum ShadowDetail].
set_shadow_detail ::
                    (OmniLight :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_detail cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_set_shadow_detail (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOmniLight_get_shadow_detail #-}

-- | See [enum ShadowDetail].
bindOmniLight_get_shadow_detail :: MethodBind
bindOmniLight_get_shadow_detail
  = unsafePerformIO $
      withCString "OmniLight" $
        \ clsNamePtr ->
          withCString "get_shadow_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | See [enum ShadowDetail].
get_shadow_detail ::
                    (OmniLight :< cls, Object :< cls) => cls -> IO Int
get_shadow_detail cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOmniLight_get_shadow_detail (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)